Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yojqAvHrpUR5SKV+hAjTLKPoK6p5egl+dDfnFxRWcuY=;
 b=M7SL7X/R51ltBy95PYswFKPZ8PKK8/ukT/fvb5Kru5RZdLnv0FFPR2Dt9c32IJV8Y/
 2Vrw8VJA7Wo1vXyqtF8iCO0w40rPRIFCXkfmI5fNK1J+AbSGfkwjzZGDNm2bY/Sdj62t
 en8lnFb0du/5QBRUIWRLBvhxMDJ+p/sumJChUBdIOy7PelAsgTSDjgqqMo3Ld/rOX7/H
 wQfDG2P91gmKdT50V3d92ym+hqBm24/8H0GNaWwhZBeRLg+lAkyEmtrMPB8Xys80GXG/
 uWL1ykMnSC6U6tpH3TYbDpt4dpmr7j0jTDbJpCRPU14bRPI+N1ZkGBZKK2WZ5vFg+4nh
 xoKg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/4] defer: Fix typos
Date: Fri,  1 Jul 2016 09:43:51 +0900
Message-Id: <1467333834-17050-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1467333834-17050-1-git-send-email-sj38.park@gmail.com>
References: <1467333834-17050-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/defer.tex          | 4 ++--
 defer/rcufundamental.tex | 2 +-
 defer/seqlock.tex        | 2 +-
 defer/whichtochoose.tex  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/defer/defer.tex b/defer/defer.tex
index 437b131..29c99e1 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -16,7 +16,7 @@ deferring work often enables weakening of synchronization primitives,
 thereby reducing synchronization overhead.
 General approaches work deferral include
 reference counting (Section~\ref{sec:defer:Reference Counting}),
-hazard pointesr (Section~\ref{sec:defer:Hazard Pointers}),
+hazard pointers (Section~\ref{sec:defer:Hazard Pointers}),
 sequence locking (Section~\ref{sec:defer:Sequence Locks}),
 and RCU (Section~\ref{sec:defer:Read-Copy Update (RCU)}).
 Finally, Section~\ref{sec:defer:Which to Choose?}
@@ -36,7 +36,7 @@ consisting of a simple linked list.\footnote{
 Modern demultiplexing algorithms use more complex data structures,
 for example, hash tables~\cite{McKenney92b}, however, as in
 Chapter~\ref{chp:Counting}, an extremely simple algorithm will
-help highlight isses specific to parallelism in an extremely
+help highlight issues specific to parallelism in an extremely
 easy-to-understand setting.

 We further simplify the algorithm by reducing the search key from
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 89d5adb..76f9aee 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -642,7 +642,7 @@ freed, as shown on the final row of
 Figure~\ref{fig:defer:RCU Deletion From Linked List}.
 At this point, we have completed the deletion of
 element~\co{5,6,7}.
-The following section covers replacement.
+The following example covers replacement.

 \paragraph{Example 2: Maintaining Multiple Versions During Replacement}
 \label{sec:defer:Example 2: Maintaining Multiple Versions During Replacement}
diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index 7f81eb8..c9f34f7 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -349,4 +349,4 @@ the possibility of read-side failure, let alone starvation.
 In addition, it would also be nice to overcome sequence locking's limitations
 with pointers.
 The following section presents a synchronization mechanism with exactly
-these proporties.
+these properties.
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 3ac3c46..6157b80 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -71,7 +71,7 @@ that do encounter an update.

 Of course, as shown in the ``Updates and Readers Progress Concurrently''
 column, this detection of updates implies
-that sequence locking does not permit updates and readers to make forward
+that sequence locking does not permit updaters and readers to make forward
 progress concurrently.
 After all, preventing such forward progress is the whole point of using
 sequence locking in the first place!
-- 
1.9.1

