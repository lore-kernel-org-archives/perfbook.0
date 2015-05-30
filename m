Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=wOA7NA7oY4EhPbiWMSL3SIZHfrTGjtCKwJzdLLfyXgg=;
 b=ZTmbqmZ7HoczIciXgV5h9HtgDIcpCd5CyMwHIUIo7UQ2tPvpa2BsoLZW76Ji7HhjH6
 pJzzp3QkTCbPOy/fNVMQr3USQ1Bm/PWHu3Pl5bmpbfZnCOJEHuX3ZTPbMiIPln7Tb5NW
 yvQhYFYhoja69VrIV55NGo7uXifnsg/0cmNI0Zzm5DWJSt7XdeHt98uuTi3tN6PF32QO
 +OoV/pMWXWLJMsVTUEeTst+up70aZmy39vszEwzO+dKM0Lwps+hxNmxNMUeijXiaR7Xc
 u3qkhga3a9TGj10zqvKvz8UXXpcFqdpxRCji4tBKM+QBW35zkvFxhpAb42dU9AMy6f/k
 VoPg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] FAQ: fix wrong question reference
Date: Sat, 30 May 2015 15:19:12 +0900
Message-Id: <1432966752-18801-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A reference to a question inside FAQ.txt was not updated though its
number has changed from "Update FAQ to describe build hangs"
(197164dcb9ddd9c1e4). Fix the reference.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 FAQ.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/FAQ.txt b/FAQ.txt
index c6890ab..631e18c 100644
--- a/FAQ.txt
+++ b/FAQ.txt
@@ -167,7 +167,7 @@
 		https://sites.google.com/site/kandamotohiro/perfbook

 10.	I am working on a translation.  What do I need to do to get my
-	name of the list in #8 above?
+	name of the list in #9 above?

 	A.	Send me at least one chapter of your translated work
 		in machine-readable form, preferable PDF.
-- 
1.9.1

