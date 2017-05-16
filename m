Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=6fFWqkJHvNTSum9Pp4/31rSL3jzDQp64HzKlOysNdSI=;
 b=ib3anQhp63pk9yaBqe+RpPlFXOQ4lkp8reJ/ipichP2xE79LspqpajNPV3yQuhYJzm
 YwfCBSUAg00XyiTT78O6oooc8yJQpbkPYIhNbACxCPz7VdCliIi1tQhlzgXERHk6e7+A
 r+7Kns2A5SLFGT+skzyVqf9Od/xpv5ilbg4F2gl238ka0/GZ2/MHg/s8lp1f2aaC1PUG
 lqbVZ7KYhB2uDOmzMJPWG8NQlDANKIt+WC61+QCwM3Gmf0Xso3SfUmdTM8xs84PvD14v
 3USqKZOrYt0EZjxWDK43lULHni/9bf0Tl/Ln7Pfw72nTX9mgm61aUTIBX3o4knfUF+Xo
 DvEg==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH v2] count_stat_eventual: Remove unnecessary READ_ONCE() and
 smp_mb()
Date: Tue, 16 May 2017 23:44:12 +0800
Message-Id: <1494949452-12455-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, akiyks@gmail.com, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In function eventual(), if the value of stopflag become larger than zero (the
''if'' branch is taken), then only the "eventual( )" thread updates stopflag.
So, the READ_ONCE() within the WRITE_ONCE() is not necessary. Remove it.

In function count_cleanup(), there is no need to run smp_mb( ) in between
statement writing to and statement reading from the same variable, stopflag.
Remove smp_mb().

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/count/count_stat_eventual.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 464de30..1365168 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -40,16 +40,17 @@ void *eventual(void *arg)
 {
 	int t;
 	unsigned long sum;
+	int stopflag_l = 0;

-	while (READ_ONCE(stopflag) < 3) {
+	while (stopflag_l < 3) {
 		sum = 0;
 		for_each_thread(t)
 			sum += READ_ONCE(per_thread(counter, t));
 		WRITE_ONCE(global_count, sum);
 		poll(NULL, 0, 1);
-		if (READ_ONCE(stopflag)) {
+		if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
 			smp_mb();
-			WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
+			WRITE_ONCE(stopflag, ++stopflag_l);
 		}
 	}
 	return NULL;
@@ -68,7 +69,6 @@ void count_init(void)
 void count_cleanup(void)
 {
 	WRITE_ONCE(stopflag, 1);
-	smp_mb();
 	while (READ_ONCE(stopflag) < 3)
 		poll(NULL, 0, 1);
 	smp_mb();
-- 
2.7.4

