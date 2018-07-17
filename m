Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=rmdtnEdohlLECHXajSD8aagI942ASKIPjX6HmVAAIKc=;
 b=Omb9ykjTbizdAx21ijE0xilx/XBXGcjzcjUq0ikhVhRdEK5ubdRXp+pHxh9wObEN3C
 RJGvmv3YZiOOYri6BABcVwMkqqhO+VsCnt+eds8x851AS7UfJ7uTT2w/HRoXRL0FoMnS
 6c5LpkrPCQkJ05dnmPG6ZX8j/A9J71yuMVxSvQfXshriVAusA+SvzFdVAUOpO7+P5bf/
 xpOKtTUQ9G/eEPXiEE/FEjvHORr/mdBa5CTkP4KNKvlRS7rl6MsnmAdt093zsAaz1XlS
 S6TEl9DP2doFkPqhOY6Eo7KRFniyswmDzlekSuydwB4Zwk8XLb7C2i7w9b/siSfoytME
 YqeA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/3] locking: Add missed unbreakable spaces
Date: Tue, 17 Jul 2018 09:34:20 +0900
Message-Id: <20180717003422.27190-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit adds missed unbreakable spaces for lock names, line numbers,
and CPU numbers.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 locking/locking.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 33dad9e..467208a 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -124,7 +124,7 @@ We can create a directed-graph representation of a deadlock scenario
 with nodes for threads and locks, as shown in
 Figure~\ref{fig:locking:Deadlock Cycle}.
 An arrow from a lock to a thread indicates that the thread holds
-the lock, for example, Thread~B holds Locks~2 and 4.
+the lock, for example, Thread~B holds Locks~2 and~4.
 An arrow from a thread to a lock indicates that the thread is waiting
 on the lock, for example, Thread~B is waiting on Lock~3.

@@ -303,7 +303,7 @@ To see the benefits of local locking hierarchies, compare
 Figures~\ref{fig:lock:Without Local Locking Hierarchy for qsort()} and
 \ref{fig:lock:Local Locking Hierarchy for qsort()}.
 In both figures, application functions \co{foo()} and \co{bar()}
-invoke \co{qsort()} while holding Locks~A and B, respectively.
+invoke \co{qsort()} while holding Locks~A and~B, respectively.
 Because this is a parallel implementation of \co{qsort()}, it acquires
 Lock~C.
 Function \co{foo()} passes function \co{cmp()} to \co{qsort()},
@@ -353,9 +353,9 @@ releasing all locks before invoking unknown code.
 However, we can instead construct a layered locking hierarchy, as shown in
 Figure~\ref{fig:lock:Layered Locking Hierarchy for qsort()}.
 here, the \co{cmp()} function uses a new Lock~D that is acquired after
-all of Locks~A, B, and C, avoiding deadlock.
+all of Locks~A, B, and~C, avoiding deadlock.
 we therefore have three layers to the global deadlock hierarchy, the
-first containing Locks~A and B, the second containing Lock~C, and
+first containing Locks~A and~B, the second containing Lock~C, and
 the third containing Lock~D.

 \begin{listing}[tbp]
@@ -584,7 +584,7 @@ This primitive acquires the lock immediately if the lock is available

 If \co{spin_trylock()} was successful, line~15 does the needed
 layer-1 processing.
-Otherwise, line~6 releases the lock, and lines~7 and 8 acquire them in
+Otherwise, line~6 releases the lock, and lines~7 and~8 acquire them in
 the correct order.
 Unfortunately, there might be multiple networking devices on
 the system (e.g., Ethernet and WiFi), so that the \co{layer_1()}
@@ -1024,12 +1024,12 @@ This can happen on machines with shared caches or NUMA characteristics,
 for example, as shown in
 Figure~\ref{fig:lock:System Architecture and Lock Unfairness}.
 If CPU~0 releases a lock that all the other CPUs are attempting
-to acquire, the interconnect shared between CPUs~0 and 1 means that
+to acquire, the interconnect shared between CPUs~0 and~1 means that
 CPU~1 will have an advantage over CPUs~2-7.
 Therefore CPU~1 will likely acquire the lock.
 If CPU~1 hold the lock long enough for CPU~0 to be requesting the
 lock by the time CPU~1 releases it and vice versa, the lock can
-shuttle between CPUs~0 and 1, bypassing CPUs~2-7.
+shuttle between CPUs~0 and~1, bypassing CPUs~2-7.

 \QuickQuiz{}
 	Wouldn't it be better just to use a good parallel design
-- 
2.10.0

