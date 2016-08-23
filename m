Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TinIJ6o4xCiD4YqpSAQcREn21hiysQ7kiSPiE32uOCg=;
 b=XJf5S9YtTMDfTTp3QrioAZBspdwAXaR+JikmR2qOd1HKRvwteIM/5cdfo9rZYi4KfO
 ZoE+LUphKHLqrrIKB3/XGbBXLUsINIS5vl4MKnWeREr/+hHNUHK4xDqFXNHDtGMtWkxV
 zKq4isGwhfZ1iN7pQtFmL6R8LrhL3UQ+ENd4p6y2ld7JES9SqHyCkNjJ+8J/grPyJ04c
 uxzzT7Pw2CoWMhnwy87rUK+gK4LVClEX0OPu19RlrFof+Sm7hvw4/P9cVR8uKWz1s2vg
 i4klKjwmiVk06TmU2iL3te6rzFVj/7scxUsF3aCrhxXWY/xZOyNs6EridJ9zoyWUyB11
 7mcw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] debugging: Fix contextual typos
Date: Tue, 23 Aug 2016 09:06:28 +0900
Message-Id: <1471910788-24070-3-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1471910788-24070-1-git-send-email-sj38.park@gmail.com>
References: <1471910788-24070-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 0162442..2207a0e 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -1694,7 +1694,7 @@ much a bug as is incorrectness.
 	And in this case, any performance bug that prevents the model from
 	running faster than the actual weather prevents any forecasting.
 	Given that the whole purpose of purchasing the large clustered
-	supercomputer was to forecast weather, if you cannot run the
+	supercomputers was to forecast weather, if you cannot run the
 	model faster than the weather, you would be better off not running
 	the model at all.

@@ -1766,7 +1766,7 @@ Unfortunately, it is often impractical for the following reasons:
 \item	The application might be proprietary, and you
 	might not have the right to run the intended application.
 \item	The application might require more hardware
-	that you have access to.
+	than you have access to.
 \item	The application might use data that you cannot legally
 	access, for example, due to privacy regulations.
 \end{enumerate}
@@ -1791,7 +1791,7 @@ on the cache misses that were actually responsible for the majority
 of the problem~\cite{McKenney93}.

 An old-school but quite effective method of tracking down performance
-and scalability bugs is to run your programmer under a debugger,
+and scalability bugs is to run your program under a debugger,
 then periodically interrupt it, recording the stacks of all threads
 at each interruption.
 The theory here is that if something is slowing down your program,
-- 
1.9.1

