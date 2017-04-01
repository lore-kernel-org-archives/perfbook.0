Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=4WQpTv2+sPvnD9lwlrqLm5ORbj6oo6ZmTl1MbfuLixk=;
 b=RDAjB0haTQvNZViXq/sQoVuzWh3Ag2Se/jtKVwRR/EsYjc/nOb79H/rWwKSjSQ5cql
 w5Do3JWmNgBVVwzmdVXKlaNPEAMDhIXK15hB9BUFcMtg9dSXIaF+fxMvq80RNjeH7Bpl
 lNqomazDYaxqLHzGq5WrbovFD4UM6PDJOriynlwWPp+/odbh2E9AtHTVz+GE62/ATsd9
 MzYbAQjyPJbty32raiEZpzvNfF1hfMzaMiiL2JcwgLo/qHDnK/RR8MM+mkWawYXXrN89
 0K8nGbC6v88ATnPJ7bX5XIkAbEI6EoyFwkF/3WxaTE9GHsUV2U9wt1AIompDDyKR2LWE
 wDaA==
Subject: [RFC PATCH 02/12] advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 2)
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9dfd7ddc-6aab-da4c-d259-b364aa97c81e@gmail.com>
Date: Sat, 1 Apr 2017 11:11:54 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7e4a90f569e7ddfa68e5c71b9bf9edd88446d5c4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 26 Mar 2017 00:27:40 +0900
Subject: [RFC PATCH 02/12] advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 2)

This mostly corresponds to the middle part of commit 2e4f5382d12a
("locking/doc: Rename LOCK/UNLOCK to ACQUIRE/RELEASE") in Linux
kernel repository. Although current memory-barriers.txt uses
some different wording (such as "LOCK operation implication"),
this commit does simple renames.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 29d3af1..322ffbc 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2725,35 +2725,35 @@ barriers throughout.
 As noted earlier, locking primitives contain implicit memory barriers.
 These implicit memory barriers provide the following guarantees:
 \begin{enumerate}
-\item	LOCK operation guarantee:
+\item	ACQUIRE operation guarantee:
 	\begin{itemize}
-	\item	Memory operations issued after the LOCK will be completed
-		after the LOCK operation has completed.
-	\item	Memory operations issued before the LOCK may be completed
-		after the LOCK operation has completed.
+	\item	Memory operations issued after the ACQUIRE will be completed
+		after the ACQUIRE operation has completed.
+	\item	Memory operations issued before the ACQUIRE may be completed
+		after the ACQUIRE operation has completed.
 	\end{itemize}
-\item	UNLOCK operation guarantee:
+\item	RELEASE operation guarantee:
 	\begin{itemize}
-	\item	Memory operations issued before the UNLOCK will be
-		completed before the UNLOCK operation has completed.
-	\item	Memory operations issued after the UNLOCK may be completed
-		before the UNLOCK operation has completed.
+	\item	Memory operations issued before the RELEASE will be
+		completed before the RELEASE operation has completed.
+	\item	Memory operations issued after the RELEASE may be completed
+		before the RELEASE operation has completed.
 	\end{itemize}
-\item	LOCK vs LOCK guarantee:
+\item	ACQUIRE vs ACQUIRE guarantee:
 	\begin{itemize}
-	\item	All LOCK operations issued before another LOCK operation
-		will be completed before that LOCK operation.
+	\item	All ACQUIRE operations issued before another ACQUIRE operation
+		will be completed before that ACQUIRE operation.
 	\end{itemize}
-\item	LOCK vs UNLOCK guarantee:
+\item	ACQUIRE vs RELEASE guarantee:
 	\begin{itemize}
-	\item	All LOCK operations issued before an UNLOCK operation
-		will be completed before the UNLOCK operation.
-	\item	All UNLOCK operations issued before a LOCK operation
-		will be completed before the LOCK operation.
+	\item	All ACQUIRE operations issued before a RELEASE operation
+		will be completed before the RELEASE operation.
+	\item	All RELEASE operations issued before an ACQUIRE operation
+		will be completed before the ACQUIRE operation.
 	\end{itemize}
-\item	Failed conditional LOCK guarantee:
+\item	Failed conditional ACQUIRE guarantee:
 	\begin{itemize}
-	\item	Certain variants of the LOCK operation may fail, either
+	\item	Certain variants of the ACQUIRE operation may fail, either
 		due to being unable to get the lock immediately, or due
 		to receiving an unblocked signal or exception
 		whilst asleep waiting
-- 
2.7.4


