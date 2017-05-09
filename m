Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35576 "EHLO
 mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750787AbdEIInY (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 9
 May 2017 04:43:24 -0400
Received: by mail-pg0-f66.google.com with SMTP id i63so14218601pgd.2 for
 <perfbook@vger.kernel.org>; Tue, 09 May 2017 01:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=IYT8EhbbRK6xOAKKJOfT9fpd8g7Fz5qEEcn0agrJUbY=;
 b=Zsvo3OA+U1DLppqQcUnmQF/ydtVFgCCNlMJkrmcGYRsuCDGLs+OkqOD/GPsVRQWXRP
 ck4H7qOaONlPtU23odOq54dWJGZUZMq7VuGtybiFTbgBrVgZr+3J4NwLT6t7U0DHGBKk
 pJ1ur5EBjTBQPYzTvuRTLlfxmFsGTfWU+P3F40PnOF98c8gXfvhgVtFoUxbHPXQc2Gw3
 D6hLaiTGcjI29xW9XCN8crpeX/WqA9xs9ru6BZQt/5uWBnhqzSejwpVMCZzvKD6b7ux7
 iYLZSzlbmJPYF1Cik3ErGjTT5tBb3iTcqAy6aYYopAVjZyJfqrXeTuF05CVowG/I9pCA
 R3OA==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] Update Answer to Quick Quiz 5.27
Date: Tue,  9 May 2017 16:43:02 +0800
Message-Id: <1494319382-3890-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 count/count.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index cc47554..6dfc7a6 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1258,13 +1258,13 @@ machine.
 	fast and scalable while allowing readers to also enjoy
 	reasonable performance and scalability?
 \QuickQuizAnswer{
-	One approach would be to maintain a global approximation
-	to the value.
-	Readers would increment their per-thread variable, but when it
-	reached some predefined limit, atomically add it to a global
-	variable, then zero their per-thread variable.
-	This would permit a tradeoff between average increment overhead
-	and accuracy of the value read out.
+	One approach would be to add a global variable maintaining a
+	approximation to the exact value. An updater would increment its
+	per-thread variable, and when its value reaches predefined limit,
+	atomically add the value to the global variable, then zero its
+	per-thread variable. Readers simply return the value of global variable,
+	enjoying reasonable performance.  This would permit a tradeoff between
+	average increment overhead and accuracy of the value read out.

 	The reader is encouraged to think up and try out other approaches,
 	for example, using a combining tree.
-- 
2.7.4

