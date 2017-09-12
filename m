Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Rigs+wnto/i5fvXxpVvWC6XC2KUvWqepGb+jMPzxq5k=;
 b=lpIrYKKp05iM8RIjopa1+VBxeLLog8AUrJ1Y0cKXHXcTm32vRNoLkuJQXGhu/abA1M
 T6AXSNgRe1HnYdgM+f4DoW7DDyLBhNEvlCqudxfIjO6MeTMaGgrqRtw4Bta9NzC2YDh6
 kgScZxDLLw1n0QUMoU7dDn06fLFmX8inAS1leUxZyo7eU7bHPhcJlVmX0PsJiB2dTJly
 M+TgPpGGjR7xB/KL3tkQ9/W1mtMVGQ+38VmkO6rguH8EQFbdHHFwnmtLX5z2vdOm3/bg
 BpxKazCHdeLnjqxt+AzxVOV3w2eFAfv3bWoBE1R6HkT+AtfWGZfiextDThm5vTB4w7Rz
 c0gA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/3] future/QC: Remove unnecessary duplicate
Date: Tue, 12 Sep 2017 09:56:17 +0900
Message-Id: <20170912005617.19975-3-sj38.park@gmail.com>
In-Reply-To: <20170912005617.19975-1-sj38.park@gmail.com>
References: <20170912005617.19975-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/QC.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/QC.tex b/future/QC.tex
index 3b01a56..e5ff74e 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -1016,7 +1016,7 @@ Grover's algorithm.
 	and $O(n \log_2 n)$ for classic-computing search?
 	Hash tables do $O(n)$ and $O(1)$ respectively!!!
 \QuickQuizAnswer{
-	Fixed-size hash table lookup lookups are $O(n)$, not $O(1)$.
+	Fixed-size hash table lookups are $O(n)$, not $O(1)$.
 	And for a resizing hash table, fairness dictates that the overhead
 	of resizing be properly accounted for.

-- 
2.10.0

