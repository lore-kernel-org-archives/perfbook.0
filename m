Return-Path: <SRS0=FOv9=7J=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UCJkzgcbF95QL+xLaReUxMBO22qWITsgZGOtRc9UyYM=;
        b=uoIITbl2BUEvVZ2DPiM5kiTlindUHswAJCIpkkr3Ac2ZUTdTwt27SOIh58/+lXuy/3
         N6HCdvLqp49jNT3DeHHuK0Pghx8JPLpBmoIqVH6bclu79kyrgbayNsEG3d3Mu0gd4buO
         tfnHboSxmSG7RpcBVUMeyJ4zwZL0ojF3kn4qQnIiEYuqFX+3BOmnJ7OThGcSWlvu8C3p
         oVm4DU32zPClrCJmBI56w/H1qsL1gSt5NFDsq/LExR2nCeQQsTuJaD9/fvoEIqAD897H
         wj8Mzp4NUw5FLzU6hx8IVfvOt+1WoYq1nGGkvfatf981F/MTIIldx28hNr7+rZ2ptUFh
         Z2uw==
Subject: [PATCH 2/2] CodeSamples/formal/herd/absperf-reduce: Enforce compare
 as number
References: <7dea1e63-95bf-8d5b-dca2-47e741a5ed48@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8c68598d-847a-81c8-4612-66f957627601@gmail.com>
Date: Thu, 28 May 2020 07:44:11 +0900
MIME-Version: 1.0
In-Reply-To: <7dea1e63-95bf-8d5b-dca2-47e741a5ed48@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 213bf072d15dfc3dce36b51a8bc1d35bd78e6609 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 28 May 2020 07:25:04 +0900
Subject: [PATCH 2/2] CodeSamples/formal/herd/absperf-reduce: Enforce compare as number

When there are differences in the number of digits in runtime,
absperf-reduce.sh miscalculates min and max values and shows strange
results such as:

    C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus 13.255 11.81 9.64
                                           (avr)  (min) (max)

Fix this by adding 0 on both sides of comparison and enforce conversion
to numbers.  After this change:

    C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus 13.255 9.23 15.77

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/absperf-reduce.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/formal/herd/absperf-reduce.sh b/CodeSamples/formal/herd/absperf-reduce.sh
index 0c338b8b..9cf52182 100644
--- a/CodeSamples/formal/herd/absperf-reduce.sh
+++ b/CodeSamples/formal/herd/absperf-reduce.sh
@@ -16,9 +16,9 @@ awk '
 		gsub(/user .*$/, "", curtesttime);
 		testtime_n[curtest]++;
 		testtime_sum[curtest] += curtesttime;
-		if (testtime_max[curtest] == "" || curtesttime > testtime_max[curtest])
+		if (testtime_max[curtest] == "" || curtesttime + 0 > testtime_max[curtest] + 0)
 			testtime_max[curtest] = curtesttime;
-		if (testtime_min[curtest] == "" || curtesttime < testtime_min[curtest])
+		if (testtime_min[curtest] == "" || curtesttime + 0 < testtime_min[curtest] + 0)
 			testtime_min[curtest] = curtesttime;
 	}
 }
-- 
2.17.1


