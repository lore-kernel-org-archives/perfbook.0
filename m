Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=+MxNPPD2b6KXo7RCMVsQKTIYeyyTTY0odb8MABgprvc=;
 b=Lw7sLLKkcJYjeJPX9K2v8/KdUDlYJJ6zeoBK5VjXv6othAGIefo0dSnESgz9tt5CPf
 wy7/fEUSsrUhFbtqVKxCCjtMGuEPaG4yOVx6BSH6gBdf4TjhNWym3gvqjjYfjKBaY28r
 1TXKBx0LjKBh5FgNi1uDXoc7dl2kayVV3oEyizDkngQZOKDJ/BHfyPIoFwNZx6NuYFhC
 JOG21Es8fpjVhzMicNzLaOcG0WVE8s1aqNjeDtNGqbyMEJ2oA8U+JSfv0Wq40FUNR3zx
 EJe4ihy8utO4DMK1XiPTd4NgwUldCrpxap2wU3W+B86TP1svQuxh/g1S2VsbKFFRuFx1
 faMQ==
Subject: [PATCH 5/5] Trial of marking up numbers in text
References: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <256e7649-7887-1789-783f-0f88e0e80261@gmail.com>
Date: Tue, 9 Aug 2016 00:07:16 +0900
MIME-Version: 1.0
In-Reply-To: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 572ae1f4ad166e144ceb0306100cb4f5a1235a4e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 6 Aug 2016 23:56:13 +0900
Subject: [PATCH 5/5] Trial of marking up numbers in text

Use \txnum{} to indicate it is in normal sentence.
Use \conum{} to indicate the value is mentioned in code snippets.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex         | 4 ++--
 SMPdesign/partexercises.tex     | 4 ++--
 appendix/rcuimpl/rcupreempt.tex | 6 +++---
 datastruct/datastruct.tex       | 2 +-
 future/htm.tex                  | 2 +-
 perfbook.tex                    | 2 ++
 toolsoftrade/toolsoftrade.tex   | 2 +-
 7 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 0a65c38..3abfab5 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -995,9 +995,9 @@ type \co{struct percpumempool}.
 Both of these data structures have arrays of pointers to blocks
 in their \co{pool} fields, which are filled from index zero upwards.
 Thus, if \co{globalmem.pool[3]} is \co{NULL}, then the remainder of
-the array from index 4 up must also be \co{NULL}.
+the array from index \conum{4} up must also be \co{NULL}.
 The \co{cur} fields contain the index of the highest-numbered full
-element of the \co{pool} array, or -1 if all elements are empty.
+element of the \co{pool} array, or \conum{-1} if all elements are empty.
 All elements from \co{globalmem.pool[0]} through
 \co{globalmem.pool[globalmem.cur]} must be full, and all the rest
 must be empty.\footnote{
diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index ca16dea..f812767 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -274,9 +274,9 @@ so that the first element left-enqueued into an empty queue is numbered
 zero and the first element right-enqueued into an empty queue is numbered
 one.
 A series of elements left-enqueued into an otherwise-idle queue would
-be assigned decreasing numbers (-1, -2, -3, \ldots), while a series of
+be assigned decreasing numbers (\txnum{-1}, \txnum{-2}, \txnum{-3}, \ldots), while a series of
 elements right-enqueued into an otherwise-idle queue would be assigned
-increasing numbers (2, 3, 4, \ldots).
+increasing numbers (\txnum{2}, \txnum{3}, \txnum{4}, \ldots).
 A key point is that it is not necessary to actually represent a given
 element's number, as this number will be implied by its position in
 the queue.
diff --git a/appendix/rcuimpl/rcupreempt.tex b/appendix/rcuimpl/rcupreempt.tex
index fbb41b8..55a72fb 100644
--- a/appendix/rcuimpl/rcupreempt.tex
+++ b/appendix/rcuimpl/rcupreempt.tex
@@ -213,8 +213,8 @@ cause any individual counter to remain non-zero or even to go negative.
 For example, suppose that a task calls \co{rcu_read_lock()} on
 one CPU, is preempted, resumes on another CPU, and then calls
 \co{rcu_read_unlock()}.
-The first CPU's counter will then be +1 and the second CPU's counter
-will be -1, however, they will still sum to zero.
+The first CPU's counter will then be \conum{+1} and the second CPU's counter
+will be \conum{-1}, however, they will still sum to zero.
 Regardless of possible preemption, when the sum of the old counter
 elements does go to zero, it is safe to move to the next grace-period
 stage, as shown on the right-hand side of the above figure.
@@ -1369,7 +1369,7 @@ a full grace period, and hence it is safe to do:
 	\item	Task~B is migrated to CPU 2.
 	\item	Task~B completes its RCU read-side critical section, and
 		executes \co{rcu_read_unlock()}, which decrements
-		\co{per_cpu(rcu_flipctr, 2)[0]}, which is now -1.
+		\co{per_cpu(rcu_flipctr, 2)[0]}, which is now \conum{-1}.
 	\item	CPU 1 now adds \co{per_cpu(rcu_flipctr, 1)[0]} and
 		\co{per_cpu(rcu_flipctr, 2)[0]} to its
 		local variable \co{sum}, obtaining the value zero.
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 4807223..80af11e 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1073,7 +1073,7 @@ as specified by the \co{->ht_nbuckets} field on line~13.
 The size is stored in the same structure containing the array of
 buckets (\co{->ht_bkt[]} on line~24) in order to avoid mismatches between
 the size and the array.
-The \co{->ht_resize_cur} field on line~14 is equal to -1 unless a resize
+The \co{->ht_resize_cur} field on line~14 is equal to \conum{-1} unless a resize
 operation
 is in progress, in which case it indicates the index of the bucket whose
 elements are being inserted into the new hash table, which is referenced
diff --git a/future/htm.tex b/future/htm.tex
index c64bdf7..8ba5dd5 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -639,7 +639,7 @@ semantics of locking, but loses locking's time-based messaging semantics.
 	When worker threads complete their feed, they must disentangle
 	themselves from the rest of the application and place a status
 	value in a per-thread \co{my_status} variable that is initialized
-	to -1.
+	to \conum{-1}.
 	Threads do not exit; they instead are placed on a thread pool
 	to accommodate later processing requirements.
 	The control thread assigns (and re-assigns) worker threads as
diff --git a/perfbook.tex b/perfbook.tex
index bdd42ad..7baa768 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -64,6 +64,8 @@
 % ---  End of workaround for Fedora 23 Texlive bug
 \newcommand{\co}[1]{\lstinline[breaklines=true,breakatwhitespace=true]{#1}}
 \newcommand{\nbco}[1]{\lstinline[breaklines=false,breakatwhitespace=false]{#1}}
+\newcommand{\conum}[1]{\nbco{#1}}
+\newcommand{\txnum}[1]{$#1$}

 \title{Is Parallel Programming Hard, And, If So, What Can You Do About It?}
 \author{
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 9ed50fe..6b41b0a 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -256,7 +256,7 @@ shell-script \co{wait} command.
 Each pass through the loop spanning lines~6-15 waits on one child process.
 Line~7 invokes the \co{wait()} primitive, which blocks until a child process
 exits, and returns that child's process ID.
-If the process ID is instead -1, this indicates that the \co{wait()}
+If the process ID is instead \conum{-1}, this indicates that the \co{wait()}
 primitive was unable to wait on a child.
 If so, line~9 checks for the \co{ECHILD} errno, which indicates that there
 are no more child processes, so that line~10 exits the loop.
-- 
1.9.1


