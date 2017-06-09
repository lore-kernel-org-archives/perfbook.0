Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:32963 "EHLO
 mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751519AbdFIIGH (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 9
 Jun 2017 04:06:07 -0400
Received: by mail-pf0-f194.google.com with SMTP id f27so7860736pfe.0 for
 <perfbook@vger.kernel.org>; Fri, 09 Jun 2017 01:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=kY0CEMukGj59nTXOrLt4DX8EgDh66nuZcxkn2KgNtow=;
 b=rNaMNFyRsF8qO+bD50YhI9VxajkPfR1sz2zxcwNJGiAgCqFqRWkuTQhaIZP2JOZktQ
 Xp0j9Pr7NEIwMIdsytqcbq5SBW6w/elC4Wg+9BaRjZGjzEOQsDXKuYmXummJfo1k4HGU
 4lOd/gCc8JZFb9ybXfXlMfl1uJEVeoXaOHSnRj7OSP9y/KYsBPovYS3TKR4PV84n20/O
 nf2DDuCUPUTlaFeF/QHifHGwXefovtHprw1kPRsxnI2pA6csUUyFBF+iHvFjbKUL+4kS
 6YrbYqz6BV4Ot+HfpxPYxkTywkDm7nStNSt7yj9G0Ev1UMfbN/FVGdbyT+x/ODrq/iB6
 b8Qw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] route_refcnt: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Date: Fri,  9 Jun 2017 16:05:51 +0800
Message-Id: <1496995551-4976-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>

Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE(), and updated corresponding
latex file.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/route_refcnt.c | 8 ++++----
 defer/refcnt.tex                 | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/CodeSamples/defer/route_refcnt.c b/CodeSamples/defer/route_refcnt.c
index 6f8ae65..8a48faf 100644
--- a/CodeSamples/defer/route_refcnt.c
+++ b/CodeSamples/defer/route_refcnt.c
@@ -35,7 +35,7 @@ DEFINE_SPINLOCK(routelock);

 static void re_free(struct route_entry *rep)
 {
-	ACCESS_ONCE(rep->re_freed) = 1;
+	WRITE_ONCE(rep->re_freed, 1);
 	free(rep);
 }

@@ -56,13 +56,13 @@ retry:
 	do {
 		if (rep && atomic_dec_and_test(&rep->re_refcnt))
 			re_free(rep);
-		rep = ACCESS_ONCE(*repp);
+		rep = READ_ONCE(*repp);
 		if (rep == NULL)
 			return ULONG_MAX;

 		/* Acquire a reference if the count is non-zero. */
 		do {
-			if (ACCESS_ONCE(rep->re_freed))
+			if (READ_ONCE(rep->re_freed))
 				abort();
 			old = atomic_read(&rep->re_refcnt);
 			if (old <= 0)
@@ -137,7 +137,7 @@ void route_clear(void)

 	spin_lock(&routelock);
 	rep = route_list.re_next;
-	ACCESS_ONCE(route_list.re_next) = NULL;
+	WRITE_ONCE(route_list.re_next, NULL);
 	while (rep != NULL) {
 		rep1 = rep->re_next;
 		if (atomic_dec_and_test(&rep->re_refcnt))
diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index c46fa48..c231961 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -18,7 +18,7 @@
 10
 11 static void re_free(struct route_entry *rep)
 12 {
-13   ACCESS_ONCE(rep->re_freed) = 1;
+13   WRITE_ONCE(rep->re_freed, 1);
 14   free(rep);
 15 }
 16
@@ -37,11 +37,11 @@
 29     if (rep &&
 30         atomic_dec_and_test(&rep->re_refcnt))
 31       re_free(rep);
-32     rep = ACCESS_ONCE(*repp);
+32     rep = READ_ONCE(*repp);
 33     if (rep == NULL)
 34       return ULONG_MAX;
 35     do {
-36       if (ACCESS_ONCE(rep->re_freed))
+36       if (READ_ONCE(rep->re_freed))
 37         abort();
 38       old = atomic_read(&rep->re_refcnt);
 39       if (old <= 0)
-- 
2.7.4

