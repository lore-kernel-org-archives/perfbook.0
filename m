Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VdAiP8fIlBKhIc9hfaRnPW+ZLC9WVkTCdzDEnPFrNUk=;
        b=ZE97Dahp3ipsb46uF4yFo1BxP50Eg2MtRkVypM1oWyfr4Znrvgr7A1rwHXBpk6gwrI
         Gk84el0b/aPCbU6ALhTpBd/ck7Zi4wzd78cimFM+5QuwIRu0MOBl5cWfDMNRN+xq640F
         h4TvmN+w0hBRJKzYAjNzq7jTrDb07VfUJWizRe/w+4pwiAAcBxNOPQt5Jki1BadyWTLz
         y5DbRMLIIP5QXcZHTPB6z5m08Lujfg656QaMOymXskjOTRUMZBmStR4wfja5B8GST59M
         TnMN7FHeYBFUNI+nGCNK23yoILhhZ6cT/vUpQblg/GWKVI3Gt73YyJmMHXnQQ9SSV2jf
         3IKg==
Subject: [PATCH 5/6] count: READ/WRITE_ONCE() tweaks for count_lim_sig
References: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <285b3c97-0789-c197-48ef-25eb6b1543bc@gmail.com>
Date: Sat, 13 Oct 2018 23:58:23 +0900
MIME-Version: 1.0
In-Reply-To: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 58412bcf44e848153a8cd3f7eb42fa88be3857a9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 12 Oct 2018 23:47:34 +0900
Subject: [PATCH 5/6] count: READ/WRITE_ONCE() tweaks for count_lim_sig

Add READ_ONCE()/WRITE_ONCE()s to comply with the guideline
recently expanded in toolsoftrade.

Per-thread variable "counting" is shared with signal handler.
Actual values used in this code (0 and 1) won't be affected by
load/store tearing, but it should be a good practice to mark
the updater in add_count()/sub_count() by WRITE_ONCE().
Reader side in the signal handler doesn't require the marking.

Per-thread variable "count" is updated in fastpaths of
add_count()/sub_count(). It is read from read_count() while
glbcnt_mutex is held, which has no effect on the update of
"count". Such combination requires WRITE_ONCE() on the updater
side and READ_ONCE() on the reader side.

Reads of "count" and "countmax" in the "if" statement of
add_count()/sub_count() can race with the updates of those
per-thread variables in slowpaths. To make the exclusive control
by the "theft" variable apparent, move the conditionals involving
the reads to "count" and "countmax" to behind the "&&" operators.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_lim_sig.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
index f22bfef..c316426 100644
--- a/CodeSamples/count/count_lim_sig.c
+++ b/CodeSamples/count/count_lim_sig.c
@@ -113,15 +113,15 @@ int add_count(unsigned long delta)			//\lnlbl{b}
 {
 	int fastpath = 0;
 
-	counting = 1;					//\lnlbl{fast:b}
+	WRITE_ONCE(counting, 1);			//\lnlbl{fast:b}
 	barrier();					//\lnlbl{barrier:1}
-	if (countermax - counter >= delta &&		//\lnlbl{check:b}
-	    READ_ONCE(theft) <= THEFT_REQ) {		//\lnlbl{check:e}
-		counter += delta;			//\lnlbl{add:f}
+	if (READ_ONCE(theft) <= THEFT_REQ &&		//\lnlbl{check:b}
+	    countermax - counter >= delta) {		//\lnlbl{check:e}
+		WRITE_ONCE(counter, counter + delta);	//\lnlbl{add:f}
 		fastpath = 1;				//\lnlbl{fasttaken}
 	}
 	barrier();					//\lnlbl{barrier:2}
-	counting = 0;					//\lnlbl{clearcnt}
+	WRITE_ONCE(counting, 0);			//\lnlbl{clearcnt}
 	barrier();					//\lnlbl{barrier:3}
 	if (READ_ONCE(theft) == THEFT_ACK) {		//\lnlbl{check:ACK}
 		smp_mb();				//\lnlbl{mb}
@@ -152,14 +152,15 @@ int sub_count(unsigned long delta)
 {
 	int fastpath = 0;
 
-	counting = 1;
+	WRITE_ONCE(counting, 1);
 	barrier();
-	if (counter >= delta && theft <= THEFT_REQ) {
-		counter -= delta;
+	if (READ_ONCE(theft) <= THEFT_REQ &&
+	    counter >= delta) {
+		WRITE_ONCE(counter, counter - delta);
 		fastpath = 1;
 	}
 	barrier();
-	counting = 0;
+	WRITE_ONCE(counting, 0);
 	barrier();
 	if (READ_ONCE(theft) == THEFT_ACK) {
 		smp_mb();
@@ -193,7 +194,7 @@ unsigned long read_count(void)
 	sum = globalcount;
 	for_each_thread(t)
 		if (counterp[t] != NULL)
-			sum += *counterp[t];
+			sum += READ_ONCE(*counterp[t]);
 	spin_unlock(&gblcnt_mutex);
 	return sum;
 }
-- 
2.7.4


