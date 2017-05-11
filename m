Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:33471 "EHLO
 mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1756269AbdEKPES (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 11
 May 2017 11:04:18 -0400
Received: by mail-pg0-f67.google.com with SMTP id s62so3895314pgc.0 for
 <perfbook@vger.kernel.org>; Thu, 11 May 2017 08:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yU5qow8c7x/+H2zCPMj/R5NQC7+sitb+lHUSLf6jJYo=;
 b=n8V/2tQljHcLCxUZS/DGjgqQk+3jCODLFGTVgS/W3LhoWJ0zZSqe6CoAbkxYEy3HaG
 b+9Hs3NjplU9NwwgcsaQXfxbkOIrZYzX+N3kMwQStriAa3KgD72s7tp/CCuTtSLj3Nmf
 dLVLAKTccO50q24TxKWLRNpCHjuhHVRWxGka9x1B0YDqc9mv5752VYxkcfFzkiXSPPbg
 vXGHKipMpbBn8MNBmCqAzuHWNQVErIwuPMwM3U44YNyayizwM5RvIQFYBKQziLpX3o2v
 dXYxJ00o4L4vWMWrkGwdNWb8aYseid/k0ZHnIbh728N4ipNDBp1RlCEHk8UZo1vPaVLd
 7irQ==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 2/2] count_stat_eventual: Add READ_ONCE() to protect global
 shared variable stopflag
Date: Thu, 11 May 2017 23:03:42 +0800
Message-Id: <1494515022-30278-3-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/count/count_stat_eventual.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index cbde4aa..2caebfd 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -40,15 +40,15 @@ void *eventual(void *arg)
 	int t;
 	unsigned long sum;

-	while (stopflag < 3) {
+	while (READ_ONCE(stopflag) < 3) {
 		sum = 0;
 		for_each_thread(t)
 			sum += READ_ONCE(per_thread(counter, t));
 		WRITE_ONCE(global_count, sum);
 		poll(NULL, 0, 1);
-		if (stopflag) {
+		if (READ_ONCE(stopflag)) {
 			smp_mb();
-			stopflag++;
+			WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
 		}
 	}
 	return NULL;
@@ -66,8 +66,9 @@ void count_init(void)

 void count_cleanup(void)
 {
-	stopflag = 1;
-	while (stopflag < 3)
+	WRITE_ONCE(stopflag, 1);
+	smp_mb();
+	while (READ_ONCE(stopflag) < 3)
 		poll(NULL, 0, 1);
 	smp_mb();
 }
-- 
2.7.4

