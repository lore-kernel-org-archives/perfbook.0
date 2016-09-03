Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=3idaW4OHzSEC+u8iU/58wbrNS3UpXwmtLHLNiU19pK4=;
 b=Okj14iklo82roBxI2Y81Gi1SPrEEvc558I8mT5m/zJgrY/FuiUT5BzhEktZlMH8GIz
 4ySOzm6I70xg9kwkecLBQLwjMRCXun3PyoRjkN6fgJS2+M7ISkYX2jdt9S0ypRyNjQqs
 oPud6aY1MxJFhfnfIi/L3mUS+tGMZ3XoA3MobPTiVcQntTDQG9yHMGN6Lyi4a4akoGFh
 Q7Yi09daUz5eqHkuQCYOVP+Jf3DBhKPUZLuuR7Kk8ATkuzOHbi+krriTT2DPtezW0kKW
 iDthQL6APIkLxyggVyuPS5JJ7SpOgwz1syQ/qemwNX4uUy48A39kG7k4y0w61bCYawRd
 8gAA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Additional use of em dash
Message-ID: <d1418f71-43b7-8889-4db3-e5e756cd934f@gmail.com>
Date: Sun, 4 Sep 2016 00:24:01 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cb9e378a80f7a441181a71e713f1db3fac5dc71a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 4 Sep 2016 00:13:04 +0900
Subject: [PATCH] advsync: Additional use of em dash

In commit 114e8f3ef6e9 ("Use unspaced em dashes consistently"),
I failed to replace a spaced hyphen.
This commit replaces the remaining hyphen with an unspaced em dash.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 27180a7..862992e 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1446,7 +1446,7 @@ Memory barriers are such interventions.  They impose a perceived partial
 ordering over the memory operations on either side of the barrier.

 Such enforcement is important because the CPUs and other devices in a system
-can use a variety of tricks to improve performance - including reordering,
+can use a variety of tricks to improve performance---including reordering,
 deferral and combination of memory operations; speculative loads; speculative
 branch prediction and various types of caching.  Memory barriers are used to
 override or suppress these tricks, allowing the code to sanely control the
-- 
1.9.1

