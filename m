Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ham0MyZhXZbVQDIn/K1cxEHMUvhU/NYT2mY+cDvH690=;
        b=ttV8qE5LAkjBAmlP2AWJ01Nhxq9xcN1DUda9h9AhstI2aldT1sPMDo30NHUenw2K6y
         PDt1PK/ccgmW3OvBiGczH+fq2PaXtHn89xJHAqSvJAOtWbOa25+aRpGVfx+MeWs3I+NR
         SZjGOhr6xlr/69PoJ40CL6dFp81/edJNe4Yk1MtmZc9y57+Issh/OKcIEm7ZzKWURb9C
         teB7al+ytahFpabCBocu4tWycs5SnvJZTcwlzOYtLBWT1JXfGSaTsSIOutvOdSKMF1Is
         /7iRz9xxIS1boXbZ8/oxHM+7JpEAD+8Cxbwiu9NLiOHRhWb0yI5DpKInPOf/XjIKiB4q
         tuqg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 4/5] defer: Fix a typo: processof -> process of
Date: Fri, 26 Apr 2019 09:57:03 +0900
Message-Id: <20190426005704.10952-5-sj38.park@gmail.com>
In-Reply-To: <20190426005704.10952-1-sj38.park@gmail.com>
References: <20190426005704.10952-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/whichtochoose.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index c18893d..a0af68f 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -119,7 +119,7 @@ operation, which is the case for reference counting, hazard pointers,
 and sequence locks.
 In the case of reference counting and hazard pointers, retries are only
 required if an attempt to acquire a reference to a given object while
-that object is in the processof being deleted, a topic covered in more
+that object is in the process of being deleted, a topic covered in more
 detail in the next section.
 Sequence locking must of course retry its critical section should it
 run concurrently with any update.
-- 
2.10.0

