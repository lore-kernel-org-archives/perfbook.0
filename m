Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=69GLjMoFUuCAV/KCnJkPgz+1/5ZGmciI3FLwsJ58a0A=;
 b=IpF2gAg53b3DRxdfEp3kHS0I7iX3PXwxpZ/+6FkYznI3zJTjpZuWAHl0mu/c0rHAI6
 XNDGBSZCkeZ8pIb9junrBI5VXmW2m4gklm0PO+obxzjwX3tkR7bWLW5e/nIYO2F3uqzx
 bLaJDcrHZnzTp/xJcgNveB3SCS3SEPdivJ2NkbtEljOvGvNsP3bgSegEb0rggUSmmMC9
 mTMLeEmwgzDcZiYlRydAj8bOdar/Rwl8/39QzYpQQgy3X5eMmvBY61dxVPbqEOIbhN3C
 WvGOzMi9lJUW0V+ygW543cUyxDB8P/hO0teTojn3Gcj7qUKA0GQnYwINBbxIa4WRtUck
 oySw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/6] advsync: use latex reference feature consistently
Date: Sat,  2 Apr 2016 09:28:28 +0900
Message-Id: <1459556911-11538-4-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: dhowells@redhat.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

References to other sections in `Advanced Synchronization` chapter use
latex reference feature and section name direct citation inconsistently.
Because most other parts are using latex reference feature and it is
easier for document maintainance, it would be better to use latex
reference feature only.  For the reason, this commit enforces latex
reference feature to the references.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 advsync/memorybarriers.tex | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 15de36a..ee9312d 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1454,7 +1454,8 @@ memory system as time progresses.  All stores before a write barrier will
 occur in the sequence \emph{before} all the stores after the write barrier.

 $\dagger$ Note that write barriers should normally be paired with read
-or data dependency barriers; see the ``SMP barrier pairing'' subsection.
+or data dependency barriers; see the
+Section~\ref{sec:advsync:SMP Barrier Pairing}.

 \paragraph{Data Dependency Barriers}

@@ -1479,19 +1480,19 @@ time the barrier completes, the effects of all the stores prior to that
 touched by the load will be perceptible to any loads issued after the data
 dependency barrier.

-See the ``Examples of memory barrier sequences'' subsection for diagrams
-showing the ordering constraints.
+See the Section~\ref{sec:advsync:Examples of Memory Barrier Pairings} for
+diagrams showing the ordering constraints.

 $\dagger$ Note that the first load really has to have a
 \emph{data} dependency and
 not a control dependency.  If the address for the second load is dependent
 on the first load, but the dependency is through a conditional rather than
 actually loading the address itself, then it's a \emph{control} dependency and
-a full read barrier or better is required.  See the ``Control dependencies''
-subsection for more information.
+a full read barrier or better is required.  See the
+Section~\ref{sec:advsync:Control Dependencies} for more information.

 $\dagger$ Note that data dependency barriers should normally be paired with
-write barriers; see the ``SMP barrier pairing'' subsection.
+write barriers; see the Section~\ref{sec:advsync:SMP Barrier Pairign}.

 \paragraph{Read Memory Barriers}

@@ -1593,7 +1594,8 @@ of the confines of a given architecture:
 \item	There is no guarantee that a CPU will see the correct order
 	of effects from a second CPU's accesses, even \emph{if} the second CPU
 	uses a memory barrier, unless the first CPU \emph{also} uses a matching
-	memory barrier (see the subsection on ``SMP Barrier Pairing'').
+	memory barrier (see the
+	Section~\ref{sec:advsync:SMP Barrier Pairing}).
 \item	There is no guarantee that some intervening piece of off-the-CPU
 	hardware\footnote{
 		This is of concern primarily in operating-system kernels.
-- 
1.9.1

