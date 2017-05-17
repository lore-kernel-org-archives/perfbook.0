Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=xq/cTecA7/V1f3Xo43KkbN34FfhJb6Icl+dHbIkYYRU=;
 b=XxynI2F+HKgFYnKivfkxMZ27xrsjbrUQ3Sdehzt+5vsjanaChRYSegptkHqIw3rVy5
 DcooiFAC+A9bwuD/jFMC1Ik6up4ioi0dq6E2RUcVgxjrbpp2ndR8cf8/iCe7pb1sqMPT
 cXYAH3Tyf6cAlCZ4QsZAcK6ViJkJFODSTvuwg8xxmA6HZGyNlYAmDstCLmbMdjZhLBPr
 MTLifV6GnqNKBH4zh2lHQa0QNHz97MHP/X1wVg5pk+qjqt0wNQODs3xRGvnLKMGiqVbE
 T7jYGyiVP44MN2kVfHStnd7XbApqPyRx3IZc2GUOkct5f1It+s0ZX3Bt9rv67dBXPeS9
 iWkw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] count_stat_eventual: Remove unnecessary smp_mb()
Date: Wed, 17 May 2017 11:47:55 +0800
Message-Id: <1494992875-3780-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, akiyks@gmail.com, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In function count_cleanup(), there is no need to run smp_mb( ) in between
statement writing to and statement reading from the same variable, stopflag.
Remove smp_mb().

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/count/count_stat_eventual.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 464de30..0e13fc4 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -68,7 +68,6 @@ void count_init(void)
 void count_cleanup(void)
 {
 	WRITE_ONCE(stopflag, 1);
-	smp_mb();
 	while (READ_ONCE(stopflag) < 3)
 		poll(NULL, 0, 1);
 	smp_mb();
-- 
2.7.4

