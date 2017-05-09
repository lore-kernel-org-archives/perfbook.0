Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34787 "EHLO
 mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750787AbdEIIsX (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 9
 May 2017 04:48:23 -0400
Received: by mail-pg0-f65.google.com with SMTP id u187so14219563pgb.1 for
 <perfbook@vger.kernel.org>; Tue, 09 May 2017 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=j1vskSjB81B0TfaNMyMoc0fD+XIt0mg47HpToXmQdOk=;
 b=d8srbVFVx1ZRrvQAvvSwk8syepni9elRJwdFtYA+pwqh8stKL6yFD9cjTvmaxFz+n2
 npsSTHKtZcBphtLB5pNELpN7uCWJ91FHbXneUmstNFBbaYAVEb3IX6ajRsnxtxaM5DFf
 3Gb2UgbRqOs9yaJOQkR20zXVHbq6kcbxcAJCzFjfYduj9I5vxzcwGl9a/Vr5ZYZmVGv0
 XvXS4oEvxPU37lCkZzbHW9L4w5mb5qG9Cati7WzIJPP1buEpa0wlf0jcsebAX0aeNHjN
 RB8/lt1n1WByF3HwUowSK2f7HFVHLJqJGQQujPpxVaA0nq2a+e42sEPTidE3Xy71nupW
 SMiw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] Update Answer to Quick Quiz 5.27
Date: Tue,  9 May 2017 16:48:12 +0800
Message-Id: <1494319692-4252-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>

Oops. Forgot the summary in previous email. Resend the patch.


The Answer to Quick Quiz 5.27 is a bit hard to follow. Rewrite it.

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

