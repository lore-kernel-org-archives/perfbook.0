Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=0jhjNURHrcHvA/IUbWS8BOByWPXLihAdxMZvYlR0cZs=;
 b=HQfWKw3ffkmuVZlaOjOtQF171OKedwWMxZBuMnDz7a6LNZEaZev79pwRd34S0+PS3l
 5o3/BBz8t75VdDjntgSf3sC5PDUa+FGFIxMg7NH0eXKFMB1jodr/6URBqoW9G1gs38KJ
 CVOpt/2fcTkNJpTfOMDdiZ47M1SGQ4qj0RqRE46bjgmvjj77zkq/rh5EtQSIgD5dPC19
 9zFLSf7kCWF3Bfx0wJsfN98/kY6fGJUhyj5uCN2ziagFh8In8wFAV8Xgrws57+dVzWvq
 03/Z/cW6u6dh9lf364XgPsxymaaheEtPDpzD6OZ5Z16rSw9yTiJ0qHeQTESaTn6yzkpu
 2NAw==
Subject: [RFC PATCH 07/12] advsync: Substitute 'guarantee' with 'implication'
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c3bdc26e-332a-a7fd-2681-050d691f93d8@gmail.com>
Date: Sat, 1 Apr 2017 11:17:24 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8dac6729398f02c38bbe9df6b4ad137678420ac6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 26 Mar 2017 09:36:22 +0900
Subject: [RFC PATCH 07/12] advsync: Substitute 'guarantee' with 'implication'

Modify wording to go along with what is found in current
memory-barriers.txt. (Although this part is under Section
"LOCK ACQUISITION FUNCTIONS" now.)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 6215311..64d78f4 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2727,35 +2727,35 @@ barriers throughout.
 \label{sec:advsync:Locking Constraints}

 As noted earlier, locking primitives contain implicit memory barriers.
-These implicit memory barriers provide the following guarantees:
+These primitives imply the following:
 \begin{enumerate}
-\item	ACQUIRE operation guarantee:
+\item	ACQUIRE operation implication:
 	\begin{itemize}
 	\item	Memory operations issued after an ACQUIRE will be completed
 		after the ACQUIRE operation has completed.
 	\item	Memory operations issued before an ACQUIRE may be completed
 		after the ACQUIRE operation has completed.
 	\end{itemize}
-\item	RELEASE operation guarantee:
+\item	RELEASE operation implication:
 	\begin{itemize}
 	\item	Memory operations issued before a RELEASE will be
 		completed before the RELEASE operation has completed.
 	\item	Memory operations issued after a RELEASE may be completed
 		before the RELEASE operation has completed.
 	\end{itemize}
-\item	ACQUIRE vs ACQUIRE guarantee:
+\item	ACQUIRE vs ACQUIRE implication:
 	\begin{itemize}
 	\item	All ACQUIRE operations issued before another ACQUIRE operation
 		will be completed before that ACQUIRE operation.
 	\end{itemize}
-\item	ACQUIRE vs RELEASE guarantee:
+\item	ACQUIRE vs RELEASE implication:
 	\begin{itemize}
 	\item	All ACQUIRE operations issued before a RELEASE operation
 		will be completed before the RELEASE operation.
 	\item	All RELEASE operations issued before an ACQUIRE operation
 		will be completed before the ACQUIRE operation.
 	\end{itemize}
-\item	Failed conditional ACQUIRE guarantee:
+\item	Failed conditional ACQUIRE implication:
 	\begin{itemize}
 	\item	Certain variants of ACQUIRE operation may fail, either
 		due to being unable to get the lock immediately, or due
-- 
2.7.4


