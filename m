Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nXgGYxPmBvz9aQQti090yHRN+Vs6kMCSUcHA8IgDGLw=;
 b=ICItyFfNRW3OidJrz/KDTUmaN2VT6vbNotOIAAbrYuECKluy/6xoDbtbQp3xhH5tQU
 49Sh8Y3rxGAZHB6z7p3bElkgycVn7C0AWXL6nBEjmAYoyElD0iIZKLuDVr5BvD+4Aaol
 zsv4FEugqpqXkNWiK50gRAWUxkIJ7t7Z+ey6LnQKdn9f/+DxohKefqj/G4cXHxQPyMSI
 pTaVwcbOUroKbFHGrGvbaIdJDlkAny4gXKApFSxDPX+PS8tgE1LHD4OTGgW1pZMiaK4B
 y2qTrcBrjUnGxXfe6fcGcLgVXCX+YyQxsa6t3TNkK4MWavb+qIBXlHohGmGMEzipasDj
 9XWg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] locking: use consistent expressions
Date: Thu, 19 May 2016 07:53:59 +0900
Message-Id: <1463612040-21728-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1463612040-21728-1-git-send-email-sj38.park@gmail.com>
References: <1463612040-21728-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Few sentences are using inconsistent reference expressions.  This commit
modifies those sentences to use more consistent expressions.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 locking/locking.tex | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index c15e532..a313284 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -18,7 +18,7 @@ shared-memory parallel software is played by, you guessed it, locking.
 This chapter will look into this dichotomy between villain and
 hero, as fancifully depicted in
 Figures~\ref{fig:locking:Locking: Villain or Slob?}
-and~Figure~\ref{fig:locking:Locking: Workhorse or Hero?}.
+and~\ref{fig:locking:Locking: Workhorse or Hero?}.

 There are a number of reasons behind this Jekyll-and-Hyde dichotomy:

@@ -308,11 +308,11 @@ To see the benefits of local locking hierarchies, compare
 Figures~\ref{fig:lock:Without Local Locking Hierarchy for qsort()} and
 \ref{fig:lock:Local Locking Hierarchy for qsort()}.
 In both figures, application functions \co{foo()} and \co{bar()}
-invoke \co{qsort()} while holding locks~A and B, respectively.
+invoke \co{qsort()} while holding Locks~A and B, respectively.
 Because this is a parallel implementation of \co{qsort()}, it acquires
-lock~C.
+Lock~C.
 Function \co{foo()} passes function \co{cmp()} to \co{qsort()},
-and \co{cmp()} acquires lock~B.
+and \co{cmp()} acquires Lock~B.
 Function \co{bar()} passes a simple integer-comparison function (not
 shown) to \co{qsort()}, and this simple function does not acquire any
 locks.
@@ -323,15 +323,15 @@ Figure~\ref{fig:lock:Without Local Locking Hierarchy for qsort()},
 deadlock can occur.
 To see this, suppose that one thread invokes \co{foo()} while a second
 thread concurrently invokes \co{bar()}.
-The first thread will acquire lock~A and the second thread will acquire
-lock~B.
-If the first thread's call to \co{qsort()} acquires lock~C, then it
-will be unable to acquire lock~B when it calls \co{cmp()}.
-But the first thread holds lock~C, so the second thread's call to
+The first thread will acquire Lock~A and the second thread will acquire
+Lock~B.
+If the first thread's call to \co{qsort()} acquires Lock~C, then it
+will be unable to acquire Lock~B when it calls \co{cmp()}.
+But the first thread holds Lock~C, so the second thread's call to
 \co{qsort()} will be unable to acquire it, and thus unable to release
-lock~B, resulting in deadlock.
+Lock~B, resulting in deadlock.

-In contrast, if \co{qsort()} releases lock~C before invoking the
+In contrast, if \co{qsort()} releases Lock~C before invoking the
 comparison function (which is unknown code from \co{qsort()}'s perspective,
 then deadlock is avoided as shown in
 Figure~\ref{fig:lock:Local Locking Hierarchy for qsort()}.
@@ -358,11 +358,11 @@ In this case, we cannot construct a local locking hierarchy by
 releasing all locks before invoking unknown code.
 However, we can instead construct a layered locking hierarchy, as shown in
 Figure~\ref{fig:lock:Layered Locking Hierarchy for qsort()}.
-Here, the \co{cmp()} function uses a new lock~D that is acquired after
-all of locks~A, B, and C, avoiding deadlock.
-We therefore have three layers to the global deadlock hierarchy, the
-first containing locks~A and B, the second containing lock~C, and
-the third containing lock~D.
+here, the \co{cmp()} function uses a new Lock~D that is acquired after
+all of Locks~A, B, and C, avoiding deadlock.
+we therefore have three layers to the global deadlock hierarchy, the
+first containing Locks~A and B, the second containing Lock~C, and
+the third containing Lock~D.

 \begin{figure}[tbp]
 { \scriptsize
-- 
1.9.1

