Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35602 "EHLO
 mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751563AbdEIFJh (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 9
 May 2017 01:09:37 -0400
Received: by mail-pf0-f194.google.com with SMTP id u26so12369023pfd.2 for
 <perfbook@vger.kernel.org>; Mon, 08 May 2017 22:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P7cttd/JBKHKaepkMb7SbOJ49WlU8b7QpY1mITFCC0Y=;
 b=aVnjXVk8Cha81j2DExrCyxDH+jMYkWCJhexYoMQn6f1Rb7cp+8S2Vkjh+Gn9qGNyz1
 Gn/DmbeA+VtOSS1SSOdLAzpe9tDjMIQ4ITMmE5MP85sdAciGm6P/vgdd+gHAQa3W4MZE
 eshyZCtTx2ZqgKxtA/jASVDbVbQCmFsiftJvlESKwkYY2ZGtDSIXjW8v/g3FLqEKxFRy
 o8YSyVTcVARplDHYhe8vx8/lkWTdCwSoe6HCf/ggfzpr8tdCdFhjoZa0jEJUiOwP/rJw
 Z2qUfOB96ZNvYkfsiuWRvN9u68zZEWNICZkQTFSKfRQhsw9dwKsOlqWWkmUn2SaTM8fp
 wKPA==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 2/2] Remove unnecessary memory fence
Date: Tue,  9 May 2017 13:08:31 +0800
Message-Id: <1494306511-9022-3-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1494306511-9022-1-git-send-email-junchangwang@gmail.com>
References: <1494306511-9022-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>

count_stat_eventual.c uses a single global variable (stopflag) to synchronize
two separate threads (main and eventual) probably running on two different CPU
cores. My understanding is that for this model, memory fence instruction
(mfence) which typically are expensive can be avoided, only if we make sure (1)
that compiler neither reorder the code around nor cache the variable, and (2)
that the CPU core running code precedes in program order.

We use keyword ``volatile'' to prevent compilers from reordering the code and
caching the variable, and instruction barrier() to force CPU core running the
code to obey program order.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/count/count_stat_eventual.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 059ab8b..5ffc4aa 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -23,7 +23,7 @@

 DEFINE_PER_THREAD(unsigned long, counter);
 unsigned long global_count;
-int stopflag;
+volatile int stopflag;

 void inc_count(void)
 {
@@ -47,7 +47,7 @@ void *eventual(void *arg)
 		ACCESS_ONCE(global_count) = sum;
 		poll(NULL, 0, 1);
 		if (stopflag) {
-			smp_mb();
+			barrier();
 			stopflag++;
 		}
 	}
@@ -67,9 +67,9 @@ void count_init(void)
 void count_cleanup(void)
 {
 	stopflag = 1;
+	barrier();
 	while (stopflag < 3)
 		poll(NULL, 0, 1);
-	smp_mb();
 }

 #include "counttorture.h"
-- 
2.7.4

