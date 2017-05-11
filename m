Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:33825 "EHLO
 mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1756260AbdEKPEL (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 11
 May 2017 11:04:11 -0400
Received: by mail-pg0-f65.google.com with SMTP id u187so3880927pgb.1 for
 <perfbook@vger.kernel.org>; Thu, 11 May 2017 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BOJGPggRE7DTWQP1Z8VzwmhjbuNZGnzjccnEIzlAd3c=;
 b=Qyqc1EEnwIvRvFlVkXf0Fi2Clc7gF7ANIAwRVpSLVn1DEZIvy8jWjTRDIDEi0gBPLG
 p6GzqKMmFiF9MVt4fOzPpfXjaTGWfx93rTnTxDdSNiJbbxtUEIS0HFkB4I9CVuKpNEIV
 jkGEscyGeeCbW7aEWzsqjivviJFe7hDiL5u/SC35+8xq7LAb+JA3H5SFD7mT2NNbD4wN
 645d7GYD6NRaELovReHMLKrKe61s/X3wRpFWVIOe/oDLe3I84NghwcLqcXCsfgtA09D+
 H+VnvrDBinMyRsnp8i1t/DM5S8kdwV8mol4MlEY79DmOLhTNdVqwlg65kTmQ1FmOKV7r
 0vlQ==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 1/2] count_stat_eventual: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Date: Thu, 11 May 2017 23:03:41 +0800
Message-Id: <1494515022-30278-2-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/count/count_stat_eventual.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 059ab8b..cbde4aa 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -27,12 +27,12 @@ int stopflag;

 void inc_count(void)
 {
-	ACCESS_ONCE(__get_thread_var(counter))++;
+	READ_ONCE(__get_thread_var(counter))++;
 }

 unsigned long read_count(void)
 {
-	return ACCESS_ONCE(global_count);
+	return READ_ONCE(global_count);
 }

 void *eventual(void *arg)
@@ -43,8 +43,8 @@ void *eventual(void *arg)
 	while (stopflag < 3) {
 		sum = 0;
 		for_each_thread(t)
-			sum += ACCESS_ONCE(per_thread(counter, t));
-		ACCESS_ONCE(global_count) = sum;
+			sum += READ_ONCE(per_thread(counter, t));
+		WRITE_ONCE(global_count, sum);
 		poll(NULL, 0, 1);
 		if (stopflag) {
 			smp_mb();
-- 
2.7.4

