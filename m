Return-Path: <SRS0=5QGv=MA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MZIfGgd8BPOjcKWwHbATwVvmxoZqVaapUOed0krreTQ=;
        b=ReLJsIsYFJQmWPVJLnNINWdSSykDxo1hnV69I/1dx+qadnBY0YGVpmvZDWNclcgpPr
         WQuHFWlgboCG/fhDuBx4sXUguHmspdl5T6Pg5FAt5DDysooVsfu1iz0w/g2gBa/flhm0
         F6UA5r50N2i7h5aVXcM70VoBrPyrOMWuEbXPGU6om9jGsirVy0pFDHm7fHubIi3ELF/P
         vb+mGbL3wyT8fv+iMMTAxjwjxC+ntPikEWxSSWbDoQ6mWMbkJVl6P6gFBmFDWRKr1O0d
         5ncJfYQCUeU/30Yl77ww7hcfBUXn8TNqpQ/QwD8jsOimo9m7qoip/4/n9qrsJYzOZV5P
         B0Hg==
Subject: [PATCH -perfbook 1/6] toolsoftrade, count, SMPdesign: Break and
 capitalize after colon
References: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a69f82b9-7619-b373-c839-8df848a38e28@gmail.com>
Date: Thu, 8 Jul 2021 19:41:41 +0900
MIME-Version: 1.0
In-Reply-To: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex       | 23 +++++++------
 SMPdesign/beyond.tex          | 19 ++++++-----
 count/count.tex               | 64 ++++++++++++++++++++---------------
 toolsoftrade/toolsoftrade.tex | 31 +++++++++--------
 4 files changed, 76 insertions(+), 61 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index e6b967f7..edfe556c 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -15,8 +15,8 @@ high-performance solutions, while poorly partitioned problems result
 in slow and complex solutions.
 This chapter will help you design partitioning into your code, with
 some discussion of batching and weakening as well.
-The word ``design'' is very important: You should partition first,
-batch second, weaken third, and code fourth.
+The word ``design'' is very important:
+You should partition first, batch second, weaken third, and code fourth.
 Changing this order often leads to poor performance and scalability
 along with great frustration.\footnote{
 	That other great dodge around the Laws of Physics, read-only
@@ -705,8 +705,9 @@ The 512-by-512 matrix multiply's efficiency is measurably less
 than 1.0 on as few as 10 threads, and even the 1024-by-1024 matrix
 multiply deviates noticeably from perfection at a few tens of threads.
 Nevertheless, this figure clearly demonstrates the performance and
-scalability benefits of batching: If you must incur synchronization
-overhead, you may as well get your money's worth.
+scalability benefits of batching:
+If you must incur synchronization overhead, you may as well get your
+money's worth.
 
 \QuickQuiz{
 	How can a single-threaded 64-by-64 matrix multiple possibly
@@ -754,7 +755,8 @@ or the parallel-fastpath approach discussed in the next section.
 	scalability, but by that point GPGPUs become quite attractive,
 	especially from a price/performance viewpoint.
 
-	Moral: If you have a parallel program with variable input,
+	Moral:
+	If you have a parallel program with variable input,
 	always include a check for the input size being too small to
 	be worth parallelizing.
 	And when it is not helpful to parallelize, it is not helpful
@@ -764,8 +766,8 @@ or the parallel-fastpath approach discussed in the next section.
 \section{Parallel Fastpath}
 \label{sec:SMPdesign:Parallel Fastpath}
 %
-\epigraph{There are two ways of meeting difficulties: You alter the
-	  difficulties, or you alter yourself to meet them.}
+\epigraph{There are two ways of meeting difficulties:
+	  You alter the difficulties, or you alter yourself to meet them.}
 	 {\emph{Phyllis Bottome}}
 
 Fine-grained (and therefore \emph{usually} higher-performance)
@@ -882,7 +884,7 @@ to acquire.
 \Cref{lst:SMPdesign:Hierarchical-Locking Hash Table Search}
 shows how our hash-table search might be adapted to do hierarchical
 locking, but also shows the great weakness of this approach:
-we have paid the overhead of acquiring a second lock, but we only
+We have paid the overhead of acquiring a second lock, but we only
 hold it for a short time.
 In this case, the simpler data-locking approach would be simpler
 and likely perform better.
@@ -989,7 +991,7 @@ we place a limit on the number of blocks that can be in each CPU's
 cache.
 In a two-CPU system, the flow of memory blocks will be as shown
 in \cref{fig:SMPdesign:Allocator Cache Schematic}:
-when a given CPU is trying to free a block when its pool is full,
+When a given CPU is trying to free a block when its pool is full,
 it sends blocks to the global pool, and, similarly, when that CPU
 is trying to allocate a block when its pool is empty, it retrieves
 blocks from the global pool.
@@ -1192,7 +1194,8 @@ this book.
 	where each thread repeatedly first allocates $m$ blocks of memory
 	and then frees those $m$ blocks, how large must the global pool
 	size be?
-	\emph{Note:} Obtaining the correct answer will require you to
+	\emph{Note:}
+	Obtaining the correct answer will require you to
 	examine the \path{smpalloc.c} source code, and very likely
 	single-step it as well.
 	You have been warned!
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 35bdd92f..60aeed12 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -393,7 +393,8 @@ Although the algorithms were in fact finding valid solutions, the
 plot of CDFs in
 \cref{fig:SMPdesign:CDF of Solution Times For SEQ; PWQ; and PART}
 assumes independent data points.
-This is not the case:  The performance tests randomly generate a maze,
+This is not the case:
+The performance tests randomly generate a maze,
 and then run all solvers on that maze.
 It therefore makes sense to plot the CDF of the ratios of
 solution times for each generated maze,
@@ -407,9 +408,9 @@ two times faster than SEQ\@.
 A forty-times speedup on two threads demands explanation.
 After all, this is not merely embarrassingly parallel, where partitionability
 means that adding threads does not increase the overall computational cost.
-It is instead \emph{\IX{humiliatingly parallel}}: Adding threads
-significantly reduces the overall computational cost, resulting in
-large algorithmic superlinear speedups.
+It is instead \emph{\IX{humiliatingly parallel}}:
+Adding threads significantly reduces the overall computational cost,
+resulting in large algorithmic superlinear speedups.
 
 \begin{figure}
 \centering
@@ -527,9 +528,9 @@ parallelism via co-routines, for example, manually switching context
 between threads on each pass through the main do-while loop in
 \cref{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}.
 This context switching is straightforward because the context
-consists only of the variables \co{c} and \co{vi}: Of the numerous
-ways to achieve the effect, this is a good tradeoff between
-context-switch overhead and visit percentage.
+consists only of the variables \co{c} and \co{vi}:
+Of the numerous ways to achieve the effect, this is a good tradeoff
+between context-switch overhead and visit percentage.
 As can be seen in
 \cref{fig:SMPdesign:Partitioned Coroutines},
 this coroutine algorithm (COPART) is quite effective, with the performance
@@ -596,8 +597,8 @@ interval for seven and eight threads.
 The reasons for the peak at two threads are (1) the lower complexity
 of termination detection in the two-thread case and (2) the fact that
 there is a lower probability of the third and subsequent threads making
-useful forward progress: Only the first two threads are guaranteed to start on
-the solution line.
+useful forward progress:
+Only the first two threads are guaranteed to start on the solution line.
 This disappointing performance compared to results in
 \cref{fig:SMPdesign:Varying Maze Size vs. COPART}
 is due to the less-tightly integrated hardware available in the
diff --git a/count/count.tex b/count/count.tex
index ca20dbac..afe0539b 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -42,10 +42,10 @@ counting.
 	a systems-monitoring package reads the count every five seconds.
 	How would you implement this counter?
 }\EQuickQuizAnswer{
-	Hint: The act of updating the counter must be blazingly
-	fast, but because the counter is read out only about once
-	in five million updates, the act of reading out the counter can be
-	quite slow.
+	Hint:
+	The act of updating the counter must be blazingly fast, but
+	because the counter is read out only about once in five million
+	updates, the act of reading out the counter can be quite slow.
 	In addition, the value read out normally need not be all that
 	accurate---after all, since the counter is updated a thousand
 	times per millisecond, we should be able to work with a value
@@ -71,7 +71,8 @@ counting.
 	limit is rarely exceeded, and a ``sloppy'' approximate limit
 	is acceptable.
 }\EQuickQuizAnswer{
-	Hint: The act of updating the counter must again be blazingly
+	Hint:
+	The act of updating the counter must again be blazingly
 	fast, but the counter is read out each time that the
 	counter is increased.
 	However, the value read out need not be accurate
@@ -97,7 +98,8 @@ counting.
 	that is not required unless there is at least one structure
 	in use.
 }\EQuickQuizAnswer{
-	Hint: The act of updating the counter must once again be blazingly
+	Hint:
+	The act of updating the counter must once again be blazingly
 	fast, but the counter is read out each time that the
 	counter is increased.
 	However, the value read out need not be accurate
@@ -118,7 +120,8 @@ counting.
 	As usual, the user indicates a desire to remove the device, and
 	the system tells the user when it is safe to do so.
 }\EQuickQuizAnswer{
-	Hint: Yet again, the act of updating the counter must be blazingly
+	Hint:
+	Yet again, the act of updating the counter must be blazingly
 	fast and scalable in order to avoid slowing down I/O operations,
 	but because the counter is read out only when the
 	user wishes to remove the device, the counter read-out
@@ -190,8 +193,8 @@ This approach has the additional advantage of being blazingly fast if
 you are doing lots of reading and almost no incrementing, and on small
 systems, the performance is excellent.
 
-There is just one large fly in the ointment: this approach can lose
-counts.
+There is just one large fly in the ointment:
+This approach can lose counts.
 On my six-core x86 laptop, a short run invoked \co{inc_count()}
 285,824,000 times, but the final value of the counter was only
 35,385,525.
@@ -270,7 +273,8 @@ as shown in
 \clnref{read} reads it out.
 \end{fcvref}
 Because this is atomic, it keeps perfect count.
-However, it is slower: on my six-core x86 laptop, it is more than
+However, it is slower:
+On my six-core x86 laptop, it is more than
 twenty times slower than non-atomic increment, even
 when only a single thread is incrementing.\footnote{
 	Interestingly enough, non-atomically incrementing a counter will
@@ -291,9 +295,9 @@ gets slower as the number of CPUs and threads increase, as shown in
 \cref{fig:count:Atomic Increment Scalability on x86}.
 In this figure, the horizontal dashed line resting on the x~axis
 is the ideal performance that would be achieved
-by a perfectly scalable algorithm: with such an algorithm, a given
-increment would incur the same overhead that it would in a single-threaded
-program.
+by a perfectly scalable algorithm:
+With such an algorithm, a given increment would incur the same
+overhead that it would in a single-threaded program.
 Atomic increment of a single global variable is clearly
 decidedly non-ideal, and gets multiple orders of magnitude worse with
 additional CPUs.
@@ -929,7 +933,8 @@ variables vanish when that thread exits.
 	Analysis of this code is left as an exercise to the reader,
 	however, please note that it requires tweaks in the
 	\path{counttorture.h} counter-evaluation scheme.
-	(Hint: See \co{#ifndef KEEP_GCC_THREAD_LOCAL}.)
+	(Hint:
+		See \co{#ifndef KEEP_GCC_THREAD_LOCAL}.)
 	\Cref{chp:Deferred Processing} will introduce
 	synchronization mechanisms that handle this situation in a much
 	more graceful manner.
@@ -952,8 +957,8 @@ return a value between the value that an ideal counter would have
 taken on near the beginning of \co{read_count()}'s execution and
 that near the end of \co{read_count()}'s execution.
 \emph{Eventual consistency}~\cite{WernerVogels:2009:EventuallyConsistent}
-provides a weaker
-guarantee: in absence of calls to \co{inc_count()}, calls to
+provides a weaker guarantee:
+In absence of calls to \co{inc_count()}, calls to
 \co{read_count()} will eventually return an accurate count.
 
 We exploit eventual consistency by maintaining a global counter.
@@ -1729,10 +1734,12 @@ thread~0 can once again increment the counter locally.
 	(again, one eighth) to come from the remaining count.
 
 	There are two purposes for taking this approach:
-	(1)~To allow thread~0 to use the fastpath for decrements as
+	\begin{enumerate*}[(1)]
+	\item To allow thread~0 to use the fastpath for decrements as
 	well as increments, and
-	(2)~To reduce the inaccuracies if all threads are monotonically
+	\item To reduce the inaccuracies if all threads are monotonically
 	incrementing up towards the limit.
+	\end{enumerate*}
 	To see this last point, step through the algorithm and watch
 	what it does.
 }\QuickQuizEnd
@@ -1818,9 +1825,9 @@ with the addition of
 \subsection{Approximate Limit Counter Discussion}
 
 These changes greatly reduce the limit inaccuracy seen in the previous version,
-but present another problem: any given value of \co{MAX_COUNTERMAX}
-will cause a workload-dependent fraction of accesses to fall off the
-fastpath.
+but present another problem:
+Any given value of \co{MAX_COUNTERMAX} will cause a workload-dependent
+fraction of accesses to fall off the fastpath.
 As the number of threads increase, non-fastpath execution will become both
 a performance and a scalability problem.
 However, we will defer this problem and turn instead to counters
@@ -2636,7 +2643,8 @@ systems, given their slow atomic instructions, but the old 80386-based
 Sequent Symmetry systems would do much better with the shorter path
 length of the atomic implementation.
 However, this increased update-side performance comes at the
-prices of higher read-side overhead: Those POSIX signals are not free.
+prices of higher read-side overhead:
+Those POSIX signals are not free.
 If ultimate performance is of the essence, you will need to measure
 them both on the system that your application is to be deployed on.
 
@@ -2656,7 +2664,7 @@ them both on the system that your application is to be deployed on.
 }\QuickQuizEnd
 
 This is but one reason why high-quality APIs are so important:
-they permit implementations to be changed as required by ever-changing
+They permit implementations to be changed as required by ever-changing
 hardware performance characteristics.
 
 \QuickQuiz{
@@ -3174,8 +3182,8 @@ Summarizing the summary:
 	All the algorithms shown in
 	\cref{tab:count:Statistical/Limit Counter Performance on x86}
 	make heavy use of batching.
-\item	Read-only code paths should remain read-only:  Spurious
-	synchronization writes to shared memory kill performance
+\item	Read-only code paths should remain read-only:
+	Spurious synchronization writes to shared memory kill performance
 	and scalability, as seen in the \path{count_end.c} row of
 	\cref{tab:count:Statistical/Limit Counter Performance on x86}.
 \item	Judicious use of delay promotes performance and scalability, as
@@ -3190,9 +3198,9 @@ Summarizing the summary:
 	algorithm and data-structure design, as do a large number of
 	other factors.
 	\Cref{fig:count:Atomic Increment Scalability on x86}
-	illustrates this point:  Atomic increment might be completely
-	acceptable for a two-CPU system, but be completely inadequate for an
-	eight-CPU system.
+	illustrates this point:
+	Atomic increment might be completely acceptable for a two-CPU
+	system, but be completely inadequate for an eight-CPU system.
 \end{enumerate}
 
 \begin{figure}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 77c956f7..c011f5e2 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -68,7 +68,7 @@ shell to run the two instances of the program in the background.
 \end{fcvref}
 The resulting execution is as shown in
 \cref{fig:toolsoftrade:Execution Diagram for Parallel Shell Execution}:
-the two instances of \co{compute_it} execute in parallel,
+The two instances of \co{compute_it} execute in parallel,
 \co{wait} completes after both of them do, and then the two instances
 of \co{cat} execute sequentially.
 % @@@ Maui scheduler, load balancing, BOINC, and so on.
@@ -819,14 +819,15 @@ rights to assume that the value of \co{goflag} would never change.
 }\QuickQuizAnswerM{
 	No, memory barriers are not needed and won't help here.
 	Memory barriers only enforce ordering among multiple memory
-	references:  They absolutely do not guarantee to expedite the
-	propagation of data from one part of the system to another.\footnote{
+	references:
+	They absolutely do not guarantee to expedite the propagation
+	of data from one part of the system to another.\footnote{
 		There have been persistent rumors of hardware in which
 		memory barriers actually do expedite propagation of data,
 		but no confirmed sightings.}
-	This leads to a quick rule of thumb:  You do not need
-	memory barriers unless you are using more than one
-	variable to communicate between multiple threads.
+	This leads to a quick rule of thumb:
+	You do not need memory barriers unless you are using more
+	than one variable to communicate between multiple threads.
 
 	But what about \co{nreadersrunning}?
 	Isn't that a second variable used for communication?
@@ -1940,10 +1941,11 @@ This transforms the if-then-else into an if-then, saving one branch.
 	Thankfully, the answer is no.
 	This is because the compiler is forbidden from introducing data races.
 	The case of inventing a store just before a normal store is
-	quite special:  It is not possible for some other entity,
-	be it CPU, thread, signal handler, or interrupt handler, to be
-	able to see the invented store unless the code already has
-	a data race, even without the invented store.
+	quite special:
+	It is not possible for some other entity, be it CPU, thread,
+	signal handler, or interrupt handler, to be able to see the
+	invented store unless the code already has a data race, even
+	without the invented store.
 	And if the code already has a data race, it already invokes
 	the dreaded spectre of undefined behavior, which allows the
 	compiler to generate pretty much whatever code it wants,
@@ -2035,9 +2037,9 @@ concurrent code to act in surprising ways.
 Experience thus far indicates that relatively few such surprises will
 be at all pleasant.
 Elimination of store-only variables is especially dangerous in cases
-where external code locates the variable via symbol tables: The
-compiler is necessarily ignorant of such external-code accesses, and
-might thus eliminate a variable that the external code relies upon.
+where external code locates the variable via symbol tables:
+The compiler is necessarily ignorant of such external-code accesses,
+and might thus eliminate a variable that the external code relies upon.
 
 Reliable concurrent code clearly needs a way to cause the compiler to
 preserve the number, order, and type of important accesses to shared
@@ -2592,7 +2594,8 @@ but per-thread variables combine convenience and high performance,
 as will be shown in more detail in
 \cref{sec:count:Statistical Counters}.
 
-\section{The Right Tool for the Job: How to Choose?}
+\section{The Right Tool for the Job:
+					How to Choose?}
 \label{sec:toolsoftrade:The Right Tool for the Job: How to Choose?}
 %
 \epigraph{If you get stuck, change your tools; it may free your thinking.}
-- 
2.17.1


