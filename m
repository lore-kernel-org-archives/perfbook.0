Return-Path: <SRS0=4wRT=KD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U291wKKU9vgxgdvAVf8u8+KJwUcLV3+OtZP2apAsbKs=;
        b=gODAcAq7KoidXFNGix2wAwXMy1L+yrEA3vHv0sYLsyG5av0DJxr6kfvY9QaQ6jczwm
         aNTSy33QmhVDdfXu58D6/DKIxYka8n3jZiivpQeMxl3fU8qErXdIZSbaOEbQeCQXGC19
         Z3GTFntpbObD9DEurcnn64BfAc86u3y6JRhNrIYO2rEar8K21aFRr0zzBWjGjH+lq37n
         pYoFZnnnl+wyeaELGR0/laoaP4y1Agh3fo8mbiAzE9dpCKQpH0KzkoMWQhDUjpgk1/dm
         K4/Ewd9SlB32pa0ohLrVQDKr+ULV8B7j2L5FIL1zciuv6enClsQspbv7NURAOWBDCpIU
         7+7Q==
Subject: [PATCH -perfbook 1/4] count: Employ \cref{} and its variants
References: <d66be1a7-9ef3-bf69-de15-2a684894bc12@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d936e88f-0b09-2c13-1ef6-34fc7943a6c4@gmail.com>
Date: Sat, 8 May 2021 16:07:09 +0900
MIME-Version: 1.0
In-Reply-To: <d66be1a7-9ef3-bf69-de15-2a684894bc12@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also fix indents by white spaces in Quick Quizzes.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 586 ++++++++++++++++++++++++------------------------
 1 file changed, 293 insertions(+), 293 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index b69515a1..bdb3fdbf 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -29,7 +29,7 @@ counting.
 	Because the straightforward counting algorithms, for example,
 	atomic operations on a shared counter, either are slow and scale
 	badly, or are inaccurate, as will be seen in
-	Section~\ref{sec:count:Why Isn't Concurrent Counting Trivial?}.
+	\cref{sec:count:Why Isn't Concurrent Counting Trivial?}.
 }\EQuickQuizEnd
 
 \EQuickQuiz{
@@ -56,7 +56,7 @@ counting.
 	For example, a 1\,\% error might be just fine when the count
 	is on the order of a million or so, but might be absolutely
 	unacceptable once the count reaches a trillion.
-	See Section~\ref{sec:count:Statistical Counters}.
+	See \cref{sec:count:Statistical Counters}.
 }\EQuickQuizEnd
 
 \QuickQuizLabel{\QcountQstatcnt}
@@ -78,7 +78,7 @@ counting.
 	\emph{except} that it must distinguish approximately
 	between values below the limit and values greater than or
 	equal to the limit.
-	See Section~\ref{sec:count:Approximate Limit Counters}.
+	See \cref{sec:count:Approximate Limit Counters}.
 }\EQuickQuizEnd
 
 \QuickQuizLabel{\QcountQapproxcnt}
@@ -105,7 +105,7 @@ counting.
 	between values between the limit and zero on the one hand,
 	and values that either are less than or equal to zero or
 	are greater than or equal to the limit on the other hand.
-	See Section~\ref{sec:count:Exact Limit Counters}.
+	See \cref{sec:count:Exact Limit Counters}.
 }\EQuickQuizEnd
 
 \QuickQuizLabel{\QcountQexactcnt}
@@ -134,7 +134,7 @@ counting.
 	to keep the value at zero until it has taken some action
 	to prevent subsequent threads from gaining access to the
 	device being removed.
-	See Section~\ref{sec:count:Applying Exact Limit Counters}.
+	See \cref{sec:count:Applying Exact Limit Counters}.
 }\EQuickQuizEnd
 
 \QuickQuizLabel{\QcountQIOcnt}
@@ -161,10 +161,10 @@ are more advanced.
 
 Let's start with something simple, for example, the straightforward
 use of arithmetic shown in
-Listing~\ref{lst:count:Just Count!} (\path{count_nonatomic.c}).
+\cref{lst:count:Just Count!} (\path{count_nonatomic.c}).
 \begin{fcvref}[ln:count:count_nonatomic:inc-read]
-Here, we have a counter on line~\lnref{counter}, we increment it on
-line~\lnref{inc}, and we read out its value on line~\lnref{read}.
+Here, we have a counter on \clnref{counter}, we increment it on
+\clnref{inc}, and we read out its value on \clnref{read}.
 What could be simpler?
 \end{fcvref}
 
@@ -174,7 +174,7 @@ What could be simpler?
 	Why all that extra typing???
 }\QuickQuizAnswer{
 	See \cref{sec:toolsoftrade:Shared-Variable Shenanigans}
-	on page~\pageref{sec:toolsoftrade:Shared-Variable Shenanigans}
+	on \cpageref{sec:toolsoftrade:Shared-Variable Shenanigans}
 	for more information on how the compiler can cause trouble,
 	as well as how \co{READ_ONCE()} and \co{WRITE_ONCE()} can avoid
 	this trouble.
@@ -201,9 +201,9 @@ Although approximation does have a large place in computing, loss of
 \QuickQuizSeries{%
 \QuickQuizB{
 	But can't a smart compiler prove that
-	line~\ref{ln:count:count_nonatomic:inc-read:inc}
+	\clnrefr{ln:count:count_nonatomic:inc-read:inc}
 	of
-	Listing~\ref{lst:count:Just Count!}
+	\cref{lst:count:Just Count!}
 	is equivalent to the \co{++} operator and produce an x86
 	add-to-memory instruction?
 	And won't the CPU cache cause this to be atomic?
@@ -263,11 +263,11 @@ Although approximation does have a large place in computing, loss of
 
 The straightforward way to count accurately is to use \IX{atomic} operations,
 as shown in
-Listing~\ref{lst:count:Just Count Atomically!} (\path{count_atomic.c}).
+\cref{lst:count:Just Count Atomically!} (\path{count_atomic.c}).
 \begin{fcvref}[ln:count:count_atomic:inc-read]
-Line~\lnref{counter} defines an atomic variable,
-line~\lnref{inc} atomically increments it, and
-line~\lnref{read} reads it out.
+\Clnref{counter} defines an atomic variable,
+\clnref{inc} atomically increments it, and
+\clnref{read} reads it out.
 \end{fcvref}
 Because this is atomic, it keeps perfect count.
 However, it is slower: on my six-core x86 laptop, it is more than
@@ -285,10 +285,10 @@ when only a single thread is incrementing.\footnote{
 	scalability~\cite{Andrews91textbook,Arcangeli03,10.5555/3241639.3241645,DavidUngar2011unsync}.}
 
 This poor performance should not be a surprise, given the discussion in
-Chapter~\ref{chp:Hardware and its Habits},
+\cref{chp:Hardware and its Habits},
 nor should it be a surprise that the performance of atomic increment
 gets slower as the number of CPUs and threads increase, as shown in
-Figure~\ref{fig:count:Atomic Increment Scalability on x86}.
+\cref{fig:count:Atomic Increment Scalability on x86}.
 In this figure, the horizontal dashed line resting on the x~axis
 is the ideal performance that would be achieved
 by a perfectly scalable algorithm: with such an algorithm, a given
@@ -354,15 +354,15 @@ additional CPUs.
 \end{figure}
 
 For another perspective on global atomic increment, consider
-Figure~\ref{fig:count:Data Flow For Global Atomic Increment}.
+\cref{fig:count:Data Flow For Global Atomic Increment}.
 In order for each CPU to get a chance to increment a given
 global variable, the \IX{cache line} containing that variable must
 circulate among all the CPUs, as shown by the red arrows.
 Such circulation will take significant time, resulting in
 the poor performance seen in
-Figure~\ref{fig:count:Atomic Increment Scalability on x86},
+\cref{fig:count:Atomic Increment Scalability on x86},
 which might be thought of as shown in
-Figure~\ref{fig:count:Waiting to Count}.
+\cref{fig:count:Waiting to Count}.
 The following sections discuss high-performance counting, which
 avoids the delays inherent in such circulation.
 
@@ -389,7 +389,7 @@ avoids the delays inherent in such circulation.
 	\end{enumerate}
 	But what if neither of the first two conditions holds?
 	Then you should think carefully about the algorithms discussed
-	in Section~\ref{sec:count:Statistical Counters}, which achieve
+	in \cref{sec:count:Statistical Counters}, which achieve
 	near-ideal performance on commodity hardware.
 
 \begin{figure}
@@ -410,13 +410,13 @@ avoids the delays inherent in such circulation.
 	particular atomic increment.
 	This results in instruction latency that varies as $\O{\log N}$,
 	where $N$ is the number of CPUs, as shown in
-	Figure~\ref{fig:count:Data Flow For Global Combining-Tree Atomic Increment}.
+	\cref{fig:count:Data Flow For Global Combining-Tree Atomic Increment}.
 	And CPUs with this sort of hardware optimization started to
 	appear in 2011.
 
 	This is a great improvement over the $\O{N}$ performance
 	of current hardware shown in
-	Figure~\ref{fig:count:Data Flow For Global Atomic Increment},
+	\cref{fig:count:Data Flow For Global Atomic Increment},
 	and it is possible that hardware latencies might decrease
 	further if innovations such as three-dimensional fabrication prove
 	practical.
@@ -441,14 +441,14 @@ posed in \QuickQuizRef{\QcountQstatcnt}.
 Statistical counting is typically handled by providing a counter per
 thread (or CPU, when running in the kernel), so that each thread
 updates its own counter, as was foreshadowed in
-Section~\ref{sec:toolsoftrade:Per-CPU Variables}
-on page~\pageref{sec:toolsoftrade:Per-CPU Variables}.
+\cref{sec:toolsoftrade:Per-CPU Variables}
+on \cpageref{sec:toolsoftrade:Per-CPU Variables}.
 The aggregate value of the counters is read out by simply summing up
 all of the threads' counters,
 relying on the commutative and associative properties of addition.
 This is an example of the Data Ownership pattern that will be introduced in
-Section~\ref{sec:SMPdesign:Data Ownership}
-on page~\pageref{sec:SMPdesign:Data Ownership}.
+\cref{sec:SMPdesign:Data Ownership}
+on \cpageref{sec:SMPdesign:Data Ownership}.
 
 \QuickQuiz{
 	But doesn't the fact that C's ``integers'' are limited in size
@@ -488,7 +488,7 @@ thread (presumably cache aligned and padded to avoid false sharing).
 	implementation that permits an arbitrary number of threads,
 	for example, using \GCC's \co{__thread} facility,
 	as shown in
-	Section~\ref{sec:count:Per-Thread-Variable-Based Implementation}.
+	\cref{sec:count:Per-Thread-Variable-Based Implementation}.
 }\QuickQuizEnd
 
 \begin{listing}
@@ -498,10 +498,10 @@ thread (presumably cache aligned and padded to avoid false sharing).
 \end{listing}
 
 Such an array can be wrapped into per-thread primitives, as shown in
-Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
+\cref{lst:count:Array-Based Per-Thread Statistical Counters}
 (\path{count_stat.c}).
 \begin{fcvref}[ln:count:count_stat:inc-read]
-Line~\lnref{define} defines an array containing a set of per-thread counters of
+\Clnref{define} defines an array containing a set of per-thread counters of
 type \co{unsigned long} named, creatively enough, \co{counter}.
 
 \Clnrefrange{inc:b}{inc:e}
@@ -552,7 +552,7 @@ The use of \co{READ_ONCE()} prevents this optimization and others besides.
 \QuickQuizSeries{%
 \QuickQuizB{
 	How does the per-thread \co{counter} variable in
-	Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
+	\cref{lst:count:Array-Based Per-Thread Statistical Counters}
 	get initialized?
 }\QuickQuizAnswerB{
 	The C standard specifies that the initial value of
@@ -566,7 +566,7 @@ The use of \co{READ_ONCE()} prevents this optimization and others besides.
 %
 \QuickQuizE{
 	How is the code in
-	Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
+	\cref{lst:count:Array-Based Per-Thread Statistical Counters}
 	supposed to permit more than one counter?
 }\QuickQuizAnswerE{
 	Indeed, this toy example does not support more than one counter.
@@ -585,7 +585,7 @@ The use of \co{READ_ONCE()} prevents this optimization and others besides.
 This approach scales linearly with increasing number of updater threads
 invoking \co{inc_count()}.
 As is shown by the green arrows on each CPU in
-Figure~\ref{fig:count:Data Flow For Per-Thread Increment},
+\cref{fig:count:Data Flow For Per-Thread Increment},
 the reason for this is that each CPU can make rapid progress incrementing
 its thread's variable, without any expensive cross-system communication.
 As such, this section solves the network-packet counting problem presented
@@ -596,7 +596,7 @@ at the beginning of this chapter.
 	and during that time, the counter could well be changing.
 	This means that the value returned by
 	\co{read_count()} in
-	Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
+	\cref{lst:count:Array-Based Per-Thread Statistical Counters}
 	will not necessarily be exact.
 	Assume that the counter is being incremented at rate
 	$r$ counts per unit time, and that \co{read_count()}'s
@@ -659,7 +659,7 @@ at the beginning of this chapter.
 
 	Of course, it is sometimes unacceptable for the counter to
 	continue incrementing during the read operation.
-	Section~\ref{sec:count:Applying Exact Limit Counters}
+	\Cref{sec:count:Applying Exact Limit Counters}
 	discusses a way to handle this situation.
 
 	Thus far, we have been considering a counter that is only
@@ -693,7 +693,7 @@ at the beginning of this chapter.
 	Therefore, that the long-term
 	movement of the counter is given by $\left( 1-2f \right) r$.
 	Plugging this into
-	Equation~\ref{eq:count:CounterErrorAverage} yields:
+	\cref{eq:count:CounterErrorAverage} yields:
 
 	\begin{equation}
 		\frac{\left( 1 - 2 f \right) r \Delta}{2}
@@ -720,7 +720,7 @@ This is the topic of the next section.
 \GCC\ provides an \co{__thread} storage class that provides
 per-thread storage.
 This can be used as shown in
-Listing~\ref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
+\cref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
 to implement
 a statistical counter that not only scales well and avoids arbitrary
 thread-number limits, but that also incurs little or no performance
@@ -756,7 +756,7 @@ value of the counter and exiting threads.
 	When a user-level thread exits, its per-thread variables all
 	disappear, which complicates the problem of per-thread-variable
 	access, particularly before the advent of user-level RCU
-	(see Section~\ref{sec:defer:Read-Copy Update (RCU)}).
+	(see \cref{sec:defer:Read-Copy Update (RCU)}).
 	In contrast, in the Linux kernel, when a CPU goes offline,
 	that CPU's per-CPU variables remain mapped and accessible.
 
@@ -801,20 +801,20 @@ be seen on \clnrefrange{b}{e}.
 
 \begin{fcvref}[ln:count:count_end:whole:read]
 The \co{read_count()} function used by readers is a bit more complex.
-Line~\lnref{acquire} acquires a lock to exclude exiting threads, and
-line~\lnref{release} releases it.
-Line~\lnref{sum:init} initializes the sum to the count accumulated by those threads that
+\Clnref{acquire} acquires a lock to exclude exiting threads, and
+\clnref{release} releases it.
+\Clnref{sum:init} initializes the sum to the count accumulated by those threads that
 have already exited, and
 \clnrefrange{loop:b}{loop:e} sum the counts being accumulated
 by threads currently running.
-Finally, line~\lnref{return} returns the sum.
+Finally, \clnref{return} returns the sum.
 \end{fcvref}
 
 \QuickQuizSeries{%
 \QuickQuizB{
 	\begin{fcvref}[ln:count:count_end:whole:read]
-	Doesn't the check for \co{NULL} on line~\lnref{check} of
-	Listing~\ref{lst:count:Per-Thread Statistical Counters}
+	Doesn't the check for \co{NULL} on \clnref{check} of
+	\cref{lst:count:Per-Thread Statistical Counters}
 	add extra branch mispredictions?
 	Why not have a variable set permanently to zero, and point
 	unused counter-pointers to that variable rather than setting
@@ -831,7 +831,7 @@ Finally, line~\lnref{return} returns the sum.
 \QuickQuizE{
 	Why on earth do we need something as heavyweight as a \emph{lock}
 	guarding the summation in the function \co{read_count()} in
-	Listing~\ref{lst:count:Per-Thread Statistical Counters}?
+	\cref{lst:count:Per-Thread Statistical Counters}?
 }\QuickQuizAnswerE{
 	Remember, when a thread exits, its per-thread variables disappear.
 	Therefore, if we attempt to access a given thread's per-thread
@@ -841,7 +841,7 @@ Finally, line~\lnref{return} returns the sum.
 	scenario.
 
 	Of course, we could instead read-acquire a reader-writer lock,
-	but Chapter~\ref{chp:Deferred Processing} will introduce even
+	but \cref{chp:Deferred Processing} will introduce even
 	lighter-weight mechanisms for implementing the required coordination.
 
 	Another approach would be to use an array instead of a per-thread
@@ -866,7 +866,7 @@ array to point to its per-thread \co{counter} variable.
 \QuickQuiz{
 	Why on earth do we need to acquire the lock in
 	\co{count_register_thread()} in
-	Listing~\ref{lst:count:Per-Thread Statistical Counters}?
+	\cref{lst:count:Per-Thread Statistical Counters}?
 	It is a single properly aligned machine-word store to a location
 	that no other thread is modifying, so it should be atomic anyway,
 	right?
@@ -884,13 +884,13 @@ array to point to its per-thread \co{counter} variable.
 function, which
 must be called prior to exit by each thread that previously called
 \co{count_register_thread()}.
-Line~\lnref{acquire} acquires the lock, and
-line~\lnref{release} releases it, thus excluding any
+\Clnref{acquire} acquires the lock, and
+\clnref{release} releases it, thus excluding any
 calls to \co{read_count()} as well as other calls to
 \co{count_unregister_thread()}.
-Line~\lnref{add} adds this thread's \co{counter} to the global
+\Clnref{add} adds this thread's \co{counter} to the global
 \co{finalcount},
-and then line~\lnref{NULL} \co{NULL}s out its \co{counterp[]} array entry.
+and then \clnref{NULL} \co{NULL}s out its \co{counterp[]} array entry.
 A subsequent call to \co{read_count()} will see the exiting thread's
 count in the global \co{finalcount}, and will skip the exiting thread
 when sequencing through the \co{counterp[]} array, thus obtaining
@@ -924,13 +924,13 @@ variables vanish when that thread exits.
 
 	One workaround is to ensure that each thread continues to exist
 	until all threads are finished, as shown in
-	Listing~\ref{lst:count:Per-Thread Statistical Counters With Lockless Summation}
+	\cref{lst:count:Per-Thread Statistical Counters With Lockless Summation}
 	(\path{count_tstat.c}).
 	Analysis of this code is left as an exercise to the reader,
 	however, please note that it requires tweaks in the
 	\path{counttorture.h} counter-evaluation scheme.
 	(Hint: See \co{#ifndef KEEP_GCC_THREAD_LOCAL}.)
-	Chapter~\ref{chp:Deferred Processing} will introduce
+	\Cref{chp:Deferred Processing} will introduce
 	synchronization mechanisms that handle this situation in a much
 	more graceful manner.
 }\QuickQuizEnd
@@ -974,17 +974,17 @@ eventually consistent.
 
 \begin{fcvref}[ln:count:count_stat_eventual:whole]
 The implementation is shown in
-Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
+\cref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 (\path{count_stat_eventual.c}).
 \Clnrefrange{per_thr_cnt}{glb_cnt}
 show the per-thread variable and the global variable that
-track the counter's value, and line~\lnref{stopflag} shows \co{stopflag}
+track the counter's value, and \clnref{stopflag} shows \co{stopflag}
 which is used to coordinate termination (for the case where we want
 to terminate the program with an accurate counter value).
 The \co{inc_count()} function shown on
 \clnrefrange{inc:b}{inc:e} is similar to its
 counterpart in
-Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}.
+\cref{lst:count:Array-Based Per-Thread Statistical Counters}.
 The \co{read_count()} function shown on
 \clnrefrange{read:b}{read:e} simply returns the
 value of the \co{global_count} variable.
@@ -1014,7 +1014,7 @@ comes at the cost of the additional thread running \co{eventual()}.
 \QuickQuizSeries{%
 \QuickQuizB{
 	Why doesn't \co{inc_count()} in
-	Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
+	\cref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 	need to use atomic instructions?
 	After all, we now have multiple threads accessing the per-thread
 	counters!
@@ -1027,7 +1027,7 @@ comes at the cost of the additional thread running \co{eventual()}.
 	counter updates from becoming visible to
 	\co{eventual()}.\footnote{
 		A simple definition of \co{READ_ONCE()} is shown in
-		Listing~\ref{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)}.}
+		\cref{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)}.}
 
 	An older version of this algorithm did in fact use atomic
 	instructions, kudos to Ersoy Bayramoglu for pointing out that
@@ -1052,7 +1052,7 @@ comes at the cost of the additional thread running \co{eventual()}.
 %
 \QuickQuizM{
 	Won't the single global thread in the function \co{eventual()} of
-	Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
+	\cref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 	be just as severe a bottleneck as a global lock would be?
 }\QuickQuizAnswerM{
 	In this case, no.
@@ -1063,7 +1063,7 @@ comes at the cost of the additional thread running \co{eventual()}.
 %
 \QuickQuizM{
 	Won't the estimate returned by \co{read_count()} in
-	Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
+	\cref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 	become increasingly
 	inaccurate as the number of threads rises?
 }\QuickQuizAnswerM{
@@ -1077,11 +1077,11 @@ comes at the cost of the additional thread running \co{eventual()}.
 %
 \QuickQuizM{
 	Given that in the eventually\-/consistent algorithm shown in
-	Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
+	\cref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 	both reads and updates have extremely low overhead
 	and are extremely scalable, why would anyone bother with the
 	implementation described in
-	Section~\ref{sec:count:Array-Based Implementation},
+	\cref{sec:count:Array-Based Implementation},
 	given its costly read-side code?
 }\QuickQuizAnswerM{
 	The thread executing \co{eventual()} consumes CPU time.
@@ -1113,7 +1113,7 @@ comes at the cost of the additional thread running \co{eventual()}.
 %
 \QuickQuizE{
 	What is the accuracy of the estimate returned by \co{read_count()} in
-	Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}?
+	\cref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}?
 }\QuickQuizAnswerE{
 	A straightforward way to evaluate this estimate is to use the
 	analysis derived in \QuickQuizARef{\StatisticalCounterAccuracy},
@@ -1215,7 +1215,7 @@ of structures in use exceeds a limit, in this case, 10,000.
 Suppose further that these structures are short-lived, that this
 limit is rarely exceeded, and that this limit is approximate in
 that it is OK to exceed it sometimes by some bounded amount
-(see Section~\ref{sec:count:Exact Limit Counters}
+(see \cref{sec:count:Exact Limit Counters}
 if you instead need the limit to be exact).
 
 \subsection{Design}
@@ -1242,10 +1242,10 @@ or other means of communicating between threads.\footnote{
 In short, for many important workloads, we cannot fully partition the counter.
 Given that partitioning the counters was what brought the excellent
 update-side performance for the three schemes discussed in
-Section~\ref{sec:count:Statistical Counters}, this might be grounds
+\cref{sec:count:Statistical Counters}, this might be grounds
 for some pessimism.
 However, the eventually consistent algorithm presented in
-Section~\ref{sec:count:Eventually Consistent Implementation}
+\cref{sec:count:Eventually Consistent Implementation}
 provides an interesting hint.
 Recall that this algorithm kept two sets of books, a
 per-thread \co{counter} variable for updaters and a \co{global_count}
@@ -1311,30 +1311,30 @@ instructions and no interactions between threads, but where occasional
 use is also made of a more conservatively designed
 (and higher overhead) global algorithm.
 This design pattern is covered in more detail in
-Section~\ref{sec:SMPdesign:Parallel Fastpath}.
+\cref{sec:SMPdesign:Parallel Fastpath}.
 
 \subsection{Simple Limit Counter Implementation}
 \label{sec:count:Simple Limit Counter Implementation}
 
 \begin{fcvref}[ln:count:count_lim:variable]
-Listing~\ref{lst:count:Simple Limit Counter Variables}
+\Cref{lst:count:Simple Limit Counter Variables}
 shows both the per-thread and global variables used by this
 implementation.
 The per-thread \co{counter} and \co{countermax} variables are the
 corresponding thread's local counter and the upper bound on that
 counter, respectively.
 The \co{globalcountmax} variable on
-line~\lnref{globalcountmax} contains the upper
+\clnref{globalcountmax} contains the upper
 bound for the aggregate counter, and the \co{globalcount} variable
-on line~\lnref{globalcount} is the global counter.
+on \clnref{globalcount} is the global counter.
 The sum of \co{globalcount} and each thread's \co{counter} gives
 the aggregate value of the overall counter.
 The \co{globalreserve} variable on
-line~\lnref{globalreserve} is at least the sum of all of the
+\clnref{globalreserve} is at least the sum of all of the
 per-thread \co{countermax} variables.
 \end{fcvref}
 The relationship among these variables is shown by
-Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}:
+\cref{fig:count:Simple Limit Counter Variable Relationships}:
 \begin{enumerate}
 \item	The sum of \co{globalcount} and \co{globalreserve} must
 	be less than or equal to \co{globalcountmax}.
@@ -1378,7 +1378,7 @@ functions (\path{count_lim.c}).
 	\cref{lst:count:Simple Limit Counter Add; Subtract; and Read}
 	provide \co{add_count()} and \co{sub_count()} instead of the
 	\co{inc_count()} and \co{dec_count()} interfaces show in
-	Section~\ref{sec:count:Statistical Counters}?
+	\cref{sec:count:Statistical Counters}?
 }\QuickQuizAnswer{
 	Because structures come in different sizes.
 	Of course, a limit counter corresponding to a specific size
@@ -1390,10 +1390,10 @@ functions (\path{count_lim.c}).
 \Clnrefrange{b}{e} show \co{add_count()},
 which adds the specified value \co{delta}
 to the counter.
-Line~\lnref{checklocal} checks to see if there is room for
+\Clnref{checklocal} checks to see if there is room for
 \co{delta} on this thread's
 \co{counter}, and, if so,
-line~\lnref{add} adds it and line~\lnref{return:ls} returns success.
+\clnref{add} adds it and \clnref{return:ls} returns success.
 This is the \co{add_counter()} fastpath, and it does no atomic operations,
 references only per-thread variables, and should not incur any cache misses.
 \end{fcvref}
@@ -1411,7 +1411,7 @@ references only per-thread variables, and should not incur any cache misses.
 
 \QuickQuiz{
 	What is with the strange form of the condition on
-	line~\ref{ln:count:count_lim:add_sub_read:add:checklocal} of
+	\clnrefr{ln:count:count_lim:add_sub_read:add:checklocal} of
 	\cref{lst:count:Simple Limit Counter Add; Subtract; and Read}?
 	Why not the more intuitive form of the fastpath shown in
 	\cref{lst:count:Intuitive Fastpath}?
@@ -1435,35 +1435,35 @@ references only per-thread variables, and should not incur any cache misses.
 
 \begin{fcvref}[ln:count:count_lim:add_sub_read:add]
 If the test on
-line~\lnref{checklocal} fails, we must access global variables, and thus
+\clnref{checklocal} fails, we must access global variables, and thus
 must acquire \co{gblcnt_mutex} on
-line~\lnref{acquire}, which we release on line~\lnref{release:f}
-in the failure case or on line~\lnref{release:s} in the success case.
-Line~\lnref{globalize} invokes \co{globalize_count()}, shown in
-Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
+\clnref{acquire}, which we release on \clnref{release:f}
+in the failure case or on \clnref{release:s} in the success case.
+\Clnref{globalize} invokes \co{globalize_count()}, shown in
+\cref{lst:count:Simple Limit Counter Utility Functions},
 which clears the thread-local variables, adjusting the global variables
 as needed, thus simplifying global processing.
 (But don't take \emph{my} word for it, try coding it yourself!)
-Lines~\lnref{checkglb:b} and~\lnref{checkglb:e} check to see
+\Clnref{checkglb:b,checkglb:e} check to see
 if addition of \co{delta} can be accommodated,
 with the meaning of the expression preceding the less-than sign shown in
-Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}
+\cref{fig:count:Simple Limit Counter Variable Relationships}
 as the difference in height of the two red (leftmost) bars.
 If the addition of \co{delta} cannot be accommodated, then
-line~\lnref{release:f} (as noted earlier) releases \co{gblcnt_mutex} and
-line~\lnref{return:gf}
+\clnref{release:f} (as noted earlier) releases \co{gblcnt_mutex} and
+\clnref{return:gf}
 returns indicating failure.
 
 Otherwise, we take the slowpath.
-Line~\lnref{addglb} adds \co{delta} to \co{globalcount}, and then
-line~\lnref{balance} invokes \co{balance_count()} (shown in
-Listing~\ref{lst:count:Simple Limit Counter Utility Functions})
+\Clnref{addglb} adds \co{delta} to \co{globalcount}, and then
+\clnref{balance} invokes \co{balance_count()} (shown in
+\cref{lst:count:Simple Limit Counter Utility Functions})
 in order to update both the global and the per-thread variables.
 This call to \co{balance_count()}
 will usually set this thread's \co{countermax} to re-enable the fastpath.
-Line~\lnref{release:s} then releases
+\Clnref{release:s} then releases
 \co{gblcnt_mutex} (again, as noted earlier), and, finally,
-line~\lnref{return:gs} returns indicating success.
+\clnref{return:gs} returns indicating success.
 \end{fcvref}
 
 \QuickQuiz{
@@ -1483,25 +1483,25 @@ line~\lnref{return:gs} returns indicating success.
 \Clnrefrange{b}{e} show \co{sub_count()},
 which subtracts the specified
 \co{delta} from the counter.
-Line~\lnref{checklocal} checks to see if the per-thread counter can accommodate
-this subtraction, and, if so, line~\lnref{sub} does the subtraction and
-line~\lnref{return:ls} returns success.
+\Clnref{checklocal} checks to see if the per-thread counter can accommodate
+this subtraction, and, if so, \clnref{sub} does the subtraction and
+\clnref{return:ls} returns success.
 These lines form \co{sub_count()}'s fastpath, and, as with
 \co{add_count()}, this fastpath executes no costly operations.
 
 If the fastpath cannot accommodate subtraction of \co{delta},
 execution proceeds to the slowpath on
 \clnrefrange{acquire}{return:gs}.
-Because the slowpath must access global state, line~\lnref{acquire}
-acquires \co{gblcnt_mutex}, which is released either by line~\lnref{release:f}
-(in case of failure) or by line~\lnref{release:s} (in case of success).
-Line~\lnref{globalize} invokes \co{globalize_count()}, shown in
-Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
+Because the slowpath must access global state, \clnref{acquire}
+acquires \co{gblcnt_mutex}, which is released either by \clnref{release:f}
+(in case of failure) or by \clnref{release:s} (in case of success).
+\Clnref{globalize} invokes \co{globalize_count()}, shown in
+\cref{lst:count:Simple Limit Counter Utility Functions},
 which again clears the thread-local variables, adjusting the global variables
 as needed.
-Line~\lnref{checkglb} checks to see if the counter can accommodate subtracting
-\co{delta}, and, if not, line~\lnref{release:f} releases \co{gblcnt_mutex}
-(as noted earlier) and line~\lnref{return:gf} returns failure.
+\Clnref{checkglb} checks to see if the counter can accommodate subtracting
+\co{delta}, and, if not, \clnref{release:f} releases \co{gblcnt_mutex}
+(as noted earlier) and \clnref{return:gf} returns failure.
 \end{fcvref}
 
 \QuickQuizSeries{%
@@ -1530,23 +1530,23 @@ Line~\lnref{checkglb} checks to see if the counter can accommodate subtracting
 }\QuickQuizAnswerE{
 	Indeed it will!
 	In many cases, this will be a problem, as discussed in
-	Section~\ref{sec:count:Simple Limit Counter Discussion}, and
+	\cref{sec:count:Simple Limit Counter Discussion}, and
 	in those cases the algorithms from
-	Section~\ref{sec:count:Exact Limit Counters}
+	\cref{sec:count:Exact Limit Counters}
 	will likely be preferable.
 }\QuickQuizEndE
 }
 
 \begin{fcvref}[ln:count:count_lim:add_sub_read:sub]
-If, on the other hand, line~\lnref{checkglb} finds that the counter \emph{can}
+If, on the other hand, \clnref{checkglb} finds that the counter \emph{can}
 accommodate subtracting \co{delta}, we complete the slowpath.
-Line~\lnref{subglb} does the subtraction and then
-line~\lnref{balance} invokes \co{balance_count()} (shown in
-Listing~\ref{lst:count:Simple Limit Counter Utility Functions})
+\Clnref{subglb} does the subtraction and then
+\clnref{balance} invokes \co{balance_count()} (shown in
+\cref{lst:count:Simple Limit Counter Utility Functions})
 in order to update both global and per-thread variables
 (hopefully re-enabling the fastpath).
-Then line~\lnref{release:s} releases \co{gblcnt_mutex}, and
-line~\lnref{return:gs} returns success.
+Then \clnref{release:s} releases \co{gblcnt_mutex}, and
+\clnref{return:gs} returns success.
 \end{fcvref}
 
 \QuickQuiz{
@@ -1572,15 +1572,15 @@ line~\lnref{return:gs} returns success.
 \Clnrefrange{b}{e} show \co{read_count()},
 which returns the aggregate value
 of the counter.
-It acquires \co{gblcnt_mutex} on line~\lnref{acquire}
-and releases it on line~\lnref{release},
+It acquires \co{gblcnt_mutex} on \clnref{acquire}
+and releases it on \clnref{release},
 excluding global operations from \co{add_count()} and \co{sub_count()},
 and, as we will see, also excluding thread creation and exit.
-Line~\lnref{initsum} initializes local variable \co{sum} to the value of
+\Clnref{initsum} initializes local variable \co{sum} to the value of
 \co{globalcount}, and then the loop spanning
 \clnrefrange{loop:b}{loop:e} sums the
 per-thread \co{counter} variables.
-Line~\lnref{return} then returns the sum.
+\Clnref{return} then returns the sum.
 \end{fcvref}
 
 \begin{listing}
@@ -1589,7 +1589,7 @@ Line~\lnref{return} then returns the sum.
 \label{lst:count:Simple Limit Counter Utility Functions}
 \end{listing}
 
-Listing~\ref{lst:count:Simple Limit Counter Utility Functions}
+\Cref{lst:count:Simple Limit Counter Utility Functions}
 shows a number of utility functions used by the \co{add_count()},
 \co{sub_count()}, and \co{read_count()} primitives shown in
 \cref{lst:count:Simple Limit Counter Add; Subtract; and Read}.
@@ -1601,12 +1601,12 @@ per-thread counters, adjusting the global variables appropriately.
 It is important to note that this function does not change the aggregate
 value of the counter, but instead changes how the counter's current value
 is represented.
-Line~\lnref{add} adds the thread's \co{counter} variable to \co{globalcount},
-and line~\lnref{zero} zeroes \co{counter}.
-Similarly, line~\lnref{sub} subtracts the per-thread \co{countermax} from
-\co{globalreserve}, and line~\lnref{zeromax} zeroes \co{countermax}.
+\Clnref{add} adds the thread's \co{counter} variable to \co{globalcount},
+and \clnref{zero} zeroes \co{counter}.
+Similarly, \clnref{sub} subtracts the per-thread \co{countermax} from
+\co{globalreserve}, and \clnref{zeromax} zeroes \co{countermax}.
 It is helpful to refer to
-Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}
+\cref{fig:count:Simple Limit Counter Variable Relationships}
 when reading both this function and \co{balance_count()}, which is next.
 \end{fcvref}
 
@@ -1620,7 +1620,7 @@ of the counter exceeding the \co{globalcountmax} limit.
 Changing the current thread's \co{countermax} variable of course
 requires corresponding adjustments to \co{counter}, \co{globalcount}
 and \co{globalreserve}, as can be seen by referring back to
-Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}.
+\cref{fig:count:Simple Limit Counter Variable Relationships}.
 By doing this, \co{balance_count()} maximizes use of
 \co{add_count()}'s and \co{sub_count()}'s low-overhead fastpaths.
 As with \co{globalize_count()}, \co{balance_count()} is not permitted
@@ -1631,22 +1631,22 @@ that portion of
 \co{globalcountmax} that is not already covered by either
 \co{globalcount} or \co{globalreserve}, and assign the
 computed quantity to this thread's \co{countermax}.
-Line~\lnref{adjreserve} makes the corresponding adjustment to \co{globalreserve}.
-Line~\lnref{middle} sets this thread's \co{counter} to the middle of the range
+\Clnref{adjreserve} makes the corresponding adjustment to \co{globalreserve}.
+\Clnref{middle} sets this thread's \co{counter} to the middle of the range
 from zero to \co{countermax}.
-Line~\lnref{check} checks to see whether \co{globalcount} can in fact accommodate
+\Clnref{check} checks to see whether \co{globalcount} can in fact accommodate
 this value of \co{counter}, and, if not,
-line~\lnref{adjcounter} decreases \co{counter}
+\clnref{adjcounter} decreases \co{counter}
 accordingly.
 Finally, in either case,
-line~\lnref{adjglobal} makes the corresponding adjustment to
+\clnref{adjglobal} makes the corresponding adjustment to
 \co{globalcount}.
 \end{fcvref}
 
 \QuickQuiz{
 	\begin{fcvref}[ln:count:count_lim:utility:balance]
 	Why set \co{counter} to \co{countermax / 2} in \clnref{middle} of
-	Listing~\ref{lst:count:Simple Limit Counter Utility Functions}?
+	\cref{lst:count:Simple Limit Counter Utility Functions}?
 	Wouldn't it be simpler to just take \co{countermax} counts?
 	\end{fcvref}
 }\QuickQuizAnswer{
@@ -1678,10 +1678,10 @@ line~\lnref{adjglobal} makes the corresponding adjustment to
 It is helpful to look at a schematic depicting how the relationship
 of the counters changes with the execution of first
 \co{globalize_count()} and then \co{balance_count}, as shown in
-Figure~\ref{fig:count:Schematic of Globalization and Balancing}.
+\cref{fig:count:Schematic of Globalization and Balancing}.
 Time advances from left to right, with the leftmost configuration
 roughly that of
-Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}.
+\cref{fig:count:Simple Limit Counter Variable Relationships}.
 The center configuration shows the relationship of these same counters
 after \co{globalize_count()} is executed by thread~0.
 As can be seen from the figure, thread~0's \co{counter} (``c~0'' in
@@ -1715,7 +1715,7 @@ Because thread~0's \co{counter} is less than its \co{countermax},
 thread~0 can once again increment the counter locally.
 
 \QuickQuiz{
-	In Figure~\ref{fig:count:Schematic of Globalization and Balancing},
+	In \cref{fig:count:Schematic of Globalization and Balancing},
 	even though a quarter of the remaining count up to the limit is
 	assigned to thread~0, only an eighth of the remaining count is
 	consumed, as indicated by the uppermost dotted line connecting
@@ -1751,11 +1751,11 @@ of \co{gblcnt_mutex}.
 Finally, \clnrefrange{b}{e} show \co{count_unregister_thread()},
 which tears down
 state for a soon-to-be-exiting thread.
-Line~\lnref{acquire} acquires \co{gblcnt_mutex} and
-line~\lnref{release} releases it.
-Line~\lnref{globalize} invokes \co{globalize_count()}
+\Clnref{acquire} acquires \co{gblcnt_mutex} and
+\clnref{release} releases it.
+\Clnref{globalize} invokes \co{globalize_count()}
 to clear out this thread's
-counter state, and line~\lnref{clear} clears this thread's entry in the
+counter state, and \clnref{clear} clears this thread's entry in the
 \co{counterp[]} array.
 \end{fcvref}
 
@@ -1807,11 +1807,11 @@ permissible value of the per-thread \co{countermax} variable.
 
 \begin{fcvref}[ln:count:count_lim_app:balance]
 Similarly,
-Listing~\ref{lst:count:Approximate Limit Counter Balancing}
+\cref{lst:count:Approximate Limit Counter Balancing}
 is identical to the \co{balance_count()} function in
-Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
+\cref{lst:count:Simple Limit Counter Utility Functions},
 with the addition of
-lines~\lnref{enforce:b} and~\lnref{enforce:e}, which enforce the
+\clnref{enforce:b,enforce:e}, which enforce the
 \co{MAX_COUNTERMAX} limit on the per-thread \co{countermax} variable.
 \end{fcvref}
 
@@ -1901,11 +1901,11 @@ represent \co{counter} and the low-order 16 bits to represent
 \begin{fcvref}[ln:count:count_lim_atomic:var_access:var]
 The variables and access functions for a simple atomic limit counter
 are shown in
-Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}
+\cref{lst:count:Atomic Limit Counter Variables and Access Functions}
 (\path{count_lim_atomic.c}).
 The \co{counter} and \co{countermax} variables in earlier algorithms
 are combined into the single variable \co{counterandmax} shown on
-line~\lnref{candmax}, with \co{counter} in the upper half and \co{countermax} in
+\clnref{candmax}, with \co{counter} in the upper half and \co{countermax} in
 the lower half.
 This variable is of type \co{atomic_t}, which has an underlying
 representation of \co{int}.
@@ -1913,17 +1913,17 @@ representation of \co{int}.
 \Clnrefrange{def:b}{def:e} show the definitions for \co{globalcountmax}, \co{globalcount},
 \co{globalreserve}, \co{counterp}, and \co{gblcnt_mutex}, all of which
 take on roles similar to their counterparts in
-Listing~\ref{lst:count:Approximate Limit Counter Variables}.
-Line~\lnref{CM_BITS} defines \co{CM_BITS}, which gives the number of bits in each half
-of \co{counterandmax}, and line~\lnref{MAX_CMAX} defines \co{MAX_COUNTERMAX}, which
+\cref{lst:count:Approximate Limit Counter Variables}.
+\Clnref{CM_BITS} defines \co{CM_BITS}, which gives the number of bits in each half
+of \co{counterandmax}, and \clnref{MAX_CMAX} defines \co{MAX_COUNTERMAX}, which
 gives the maximum value that may be held in either half of
 \co{counterandmax}.
 \end{fcvref}
 
 \QuickQuiz{
 	In what way does
-        line~\ref{ln:count:count_lim_atomic:var_access:var:CM_BITS} of
-	Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}
+	\clnrefr{ln:count:count_lim_atomic:var_access:var:CM_BITS} of
+	\cref{lst:count:Atomic Limit Counter Variables and Access Functions}
 	violate the C standard?
 }\QuickQuizAnswer{
 	It assumes eight bits per byte.
@@ -1942,25 +1942,25 @@ when given the underlying \co{int} from the
 \co{atomic_t counterandmax} variable, splits it into its
 \co{counter} (\co{c})
 and \co{countermax} (\co{cm}) components.
-Line~\lnref{msh} isolates the most-significant half of this \co{int},
+\Clnref{msh} isolates the most-significant half of this \co{int},
 placing the result as specified by argument \co{c},
-and line~\lnref{lsh} isolates the least-significant half of this \co{int},
+and \clnref{lsh} isolates the least-significant half of this \co{int},
 placing the result as specified by argument \co{cm}.
 \end{fcvref}
 
 \begin{fcvref}[ln:count:count_lim_atomic:var_access:split]
 \Clnrefrange{b}{e} show the \co{split_counterandmax()} function, which
 picks up the underlying \co{int} from the specified variable
-on line~\lnref{int}, stores it as specified by the \co{old} argument on
-line~\lnref{old}, and then invokes \co{split_counterandmax_int()} to split
-it on line~\lnref{split_int}.
+on \clnref{int}, stores it as specified by the \co{old} argument on
+\clnref{old}, and then invokes \co{split_counterandmax_int()} to split
+it on \clnref{split_int}.
 \end{fcvref}
 
 \QuickQuiz{
 	Given that there is only one \co{counterandmax} variable,
 	why bother passing in a pointer to it on
-        line~\ref{ln:count:count_lim_atomic:var_access:split:func} of
-	Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}?
+	\clnrefr{ln:count:count_lim_atomic:var_access:split:func} of
+	\cref{lst:count:Atomic Limit Counter Variables and Access Functions}?
 }\QuickQuizAnswer{
 	There is only one \co{counterandmax} variable \emph{per thread}.
 	Later, we will see code that needs to pass other threads'
@@ -1970,14 +1970,14 @@ it on line~\lnref{split_int}.
 \begin{fcvref}[ln:count:count_lim_atomic:var_access:merge]
 \Clnrefrange{b}{e} show the \co{merge_counterandmax()} function, which
 can be thought of as the inverse of \co{split_counterandmax()}.
-Line~\lnref{merge} merges the \co{counter} and \co{countermax}
+\Clnref{merge} merges the \co{counter} and \co{countermax}
 values passed in \co{c} and \co{cm}, respectively, and returns
 the result.
 \end{fcvref}
 
 \QuickQuiz{
 	Why does \co{merge_counterandmax()} in
-	Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}
+	\cref{lst:count:Atomic Limit Counter Variables and Access Functions}
 	return an \co{int} rather than storing directly into an
 	\co{atomic_t}?
 }\QuickQuizAnswer{
@@ -1991,7 +1991,7 @@ the result.
 \label{lst:count:Atomic Limit Counter Add and Subtract}
 \end{listing}
 
-Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
+\Cref{lst:count:Atomic Limit Counter Add and Subtract}
 shows the \co{add_count()} and \co{sub_count()} functions.
 
 \begin{fcvref}[ln:count:count_lim_atomic:add_sub:add]
@@ -2003,34 +2003,34 @@ with the remainder of the function being the slowpath.
 the \co{atomic_cmpxchg()} primitive on
 \clnrefrange{atmcmpex}{loop:e} performing the
 actual CAS\@.
-Line~\lnref{split} splits the current thread's \co{counterandmax} variable into its
+\Clnref{split} splits the current thread's \co{counterandmax} variable into its
 \co{counter} (in \co{c}) and \co{countermax} (in \co{cm}) components,
 while placing the underlying \co{int} into \co{old}.
-Line~\lnref{check} checks whether the amount \co{delta} can be accommodated
+\Clnref{check} checks whether the amount \co{delta} can be accommodated
 locally (taking care to avoid integer overflow), and if not,
-line~\lnref{goto} transfers to the slowpath.
-Otherwise, line~\lnref{merge} combines an updated \co{counter} value with the
+\clnref{goto} transfers to the slowpath.
+Otherwise, \clnref{merge} combines an updated \co{counter} value with the
 original \co{countermax} value into \co{new}.
 The \co{atomic_cmpxchg()} primitive on
 \clnrefrange{atmcmpex}{loop:e} then atomically
 compares this thread's \co{counterandmax} variable to \co{old},
 updating its value to \co{new} if the comparison succeeds.
-If the comparison succeeds, line~\lnref{return:fs} returns success, otherwise,
-execution continues in the loop at line~\lnref{fast:b}.
+If the comparison succeeds, \clnref{return:fs} returns success, otherwise,
+execution continues in the loop at \clnref{fast:b}.
 \end{fcvref}
 
 \QuickQuizSeries{%
 \QuickQuizB{
 	Yecch!
 	Why the ugly \co{goto} on
-        line~\ref{ln:count:count_lim_atomic:add_sub:add:goto} of
-	Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}?
+	\clnrefr{ln:count:count_lim_atomic:add_sub:add:goto} of
+	\cref{lst:count:Atomic Limit Counter Add and Subtract}?
 	Haven't you heard of the \co{break} statement???
 }\QuickQuizAnswerB{
 	Replacing the \co{goto} with a \co{break} would require keeping
 	a flag to determine whether or not
-        line~\ref{ln:count:count_lim_atomic:add_sub:add:return:fs}
-        should return, which
+	\clnrefr{ln:count:count_lim_atomic:add_sub:add:return:fs}
+	should return, which
 	is not the sort of thing you want on a fastpath.
 	If you really hate the \co{goto} that much, your best bet would
 	be to pull the fastpath into a separate function that returned
@@ -2040,57 +2040,57 @@ execution continues in the loop at line~\lnref{fast:b}.
 }\QuickQuizEndB
 %
 \QuickQuizE{
-        \begin{fcvref}[ln:count:count_lim_atomic:add_sub:add]
+	\begin{fcvref}[ln:count:count_lim_atomic:add_sub:add]
 	Why would the \co{atomic_cmpxchg()} primitive at
-        \clnrefrange{atmcmpex}{loop:e} of
-	Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
+	\clnrefrange{atmcmpex}{loop:e} of
+	\cref{lst:count:Atomic Limit Counter Add and Subtract}
 	ever fail?
-	After all, we picked up its old value on line~\lnref{split} and have not
+	After all, we picked up its old value on \clnref{split} and have not
 	changed it!
 	\end{fcvref}
 }\QuickQuizAnswerE{
 	\begin{fcvref}[ln:count:count_lim_atomic:add_sub:add]
 	Later, we will see how the \co{flush_local_count()} function in
-	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1}
+	\cref{lst:count:Atomic Limit Counter Utility Functions 1}
 	might update this thread's \co{counterandmax} variable concurrently
 	with the execution of the fastpath on
-        \clnrefrange{fast:b}{loop:e} of
-	Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}.
+	\clnrefrange{fast:b}{loop:e} of
+	\cref{lst:count:Atomic Limit Counter Add and Subtract}.
 	\end{fcvref}
 }\QuickQuizEndE
 }
 
 \begin{fcvref}[ln:count:count_lim_atomic:add_sub:add]
 \Clnrefrange{slow:b}{return:ss} of
-Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
+\cref{lst:count:Atomic Limit Counter Add and Subtract}
 show \co{add_count()}'s slowpath, which is protected by \co{gblcnt_mutex},
-which is acquired on line~\lnref{acquire} and released on
-lines~\lnref{release:f} and~\lnref{release:s}.
-Line~\lnref{globalize} invokes \co{globalize_count()},
+which is acquired on \clnref{acquire} and released on
+\clnref{release:f,release:s}.
+\Clnref{globalize} invokes \co{globalize_count()},
 which moves this thread's
 state to the global counters.
 \Clnrefrange{checkglb:b}{checkglb:e} check whether
 the \co{delta} value can be accommodated by
-the current global state, and, if not, line~\lnref{flush} invokes
+the current global state, and, if not, \clnref{flush} invokes
 \co{flush_local_count()} to flush all threads' local state to the
 global counters, and then
 \clnrefrange{checkglb:nb}{checkglb:ne} recheck whether \co{delta} can
 be accommodated.
 If, after all that, the addition of \co{delta} still cannot be accommodated,
-then line~\lnref{release:f} releases \co{gblcnt_mutex} (as noted earlier), and
-then line~\lnref{return:sf} returns failure.
+then \clnref{release:f} releases \co{gblcnt_mutex} (as noted earlier), and
+then \clnref{return:sf} returns failure.
 
-Otherwise, line~\lnref{addglb} adds \co{delta} to the global counter,
-line~\lnref{balance}
-spreads counts to the local state if appropriate, line~\lnref{release:s} releases
+Otherwise, \clnref{addglb} adds \co{delta} to the global counter,
+\clnref{balance}
+spreads counts to the local state if appropriate, \clnref{release:s} releases
 \co{gblcnt_mutex} (again, as noted earlier), and finally,
-line~\lnref{return:ss}
+\clnref{return:ss}
 returns success.
 \end{fcvref}
 
 \begin{fcvref}[ln:count:count_lim_atomic:add_sub:sub]
 \Clnrefrange{b}{e} of
-Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
+\cref{lst:count:Atomic Limit Counter Add and Subtract}
 show \co{sub_count()}, which is structured similarly to
 \co{add_count()}, having a fastpath on
 \clnrefrange{fast:b}{fast:e} and a slowpath on
@@ -2106,15 +2106,15 @@ the reader.
 \end{listing}
 
 \begin{fcvref}[ln:count:count_lim_atomic:read]
-Listing~\ref{lst:count:Atomic Limit Counter Read} shows \co{read_count()}.
-Line~\lnref{acquire} acquires \co{gblcnt_mutex} and
-line~\lnref{release} releases it.
-Line~\lnref{initsum} initializes local variable \co{sum} to the value of
+\Cref{lst:count:Atomic Limit Counter Read} shows \co{read_count()}.
+\Clnref{acquire} acquires \co{gblcnt_mutex} and
+\clnref{release} releases it.
+\Clnref{initsum} initializes local variable \co{sum} to the value of
 \co{globalcount}, and the loop spanning
 \clnrefrange{loop:b}{loop:e} adds the
 per-thread counters to this sum, isolating each per-thread counter
-using \co{split_counterandmax} on line~\lnref{split}.
-Finally, line~\lnref{return} returns the sum.
+using \co{split_counterandmax} on \clnref{split}.
+Finally, \clnref{return} returns the sum.
 \end{fcvref}
 
 \begin{listing}
@@ -2142,7 +2142,7 @@ The code for \co{globalize_count()} is shown on
 \clnrefrange{b}{e}
 of \cref{lst:count:Atomic Limit Counter Utility Functions 1}, and
 is similar to that of previous algorithms, with the addition of
-line~\lnref{split}, which is now required to split out \co{counter} and
+\clnref{split}, which is now required to split out \co{counter} and
 \co{countermax} from \co{counterandmax}.
 \end{fcvref}
 
@@ -2150,23 +2150,23 @@ line~\lnref{split}, which is now required to split out \co{counter} and
 The code for \co{flush_local_count()}, which moves all threads' local
 counter state to the global counter, is shown on
 \clnrefrange{b}{e}.
-Line~\lnref{checkrsv} checks to see if the value of
+\Clnref{checkrsv} checks to see if the value of
 \co{globalreserve} permits
-any per-thread counts, and, if not, line~\lnref{return:n} returns.
-Otherwise, line~\lnref{initzero} initializes local variable \co{zero} to a combined
+any per-thread counts, and, if not, \clnref{return:n} returns.
+Otherwise, \clnref{initzero} initializes local variable \co{zero} to a combined
 zeroed \co{counter} and \co{countermax}.
 The loop spanning \clnrefrange{loop:b}{loop:e} sequences
 through each thread.
-Line~\lnref{checkp} checks to see if the current thread has counter state,
+\Clnref{checkp} checks to see if the current thread has counter state,
 and, if so, \clnrefrange{atmxchg}{glbrsv} move that state
 to the global counters.
-Line~\lnref{atmxchg} atomically fetches the current thread's state
+\Clnref{atmxchg} atomically fetches the current thread's state
 while replacing it with zero.
-Line~\lnref{split} splits this state into its \co{counter}
+\Clnref{split} splits this state into its \co{counter}
 (in local variable \co{c})
 and \co{countermax} (in local variable \co{cm}) components.
-Line~\lnref{glbcnt} adds this thread's \co{counter} to \co{globalcount}, while
-line~\lnref{glbrsv} subtracts this thread's \co{countermax} from \co{globalreserve}.
+\Clnref{glbcnt} adds this thread's \co{counter} to \co{globalcount}, while
+\clnref{glbrsv} subtracts this thread's \co{countermax} from \co{globalreserve}.
 \end{fcvref}
 
 \QuickQuizSeries{%
@@ -2174,8 +2174,8 @@ line~\lnref{glbrsv} subtracts this thread's \co{countermax} from \co{globalreser
 	What stops a thread from simply refilling its
 	\co{counterandmax} variable immediately after
 	\co{flush_local_count()} on
-        line~\ref{ln:count:count_lim_atomic:utility1:flush:b} of
-	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1}
+	\clnrefr{ln:count:count_lim_atomic:utility1:flush:b} of
+	\cref{lst:count:Atomic Limit Counter Utility Functions 1}
 	empties it?
 }\QuickQuizAnswerB{
 	This other thread cannot refill its \co{counterandmax}
@@ -2192,8 +2192,8 @@ line~\lnref{glbrsv} subtracts this thread's \co{countermax} from \co{globalreser
 	\co{add_count()} or \co{sub_count()} from interfering with
 	the \co{counterandmax} variable while
 	\co{flush_local_count()} is accessing it on
-        line~\ref{ln:count:count_lim_atomic:utility1:flush:atmxchg} of
-	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1}?
+	\clnrefr{ln:count:count_lim_atomic:utility1:flush:atmxchg} of
+	\cref{lst:count:Atomic Limit Counter Utility Functions 1}?
 }\QuickQuizAnswerE{
 	Nothing.
 	Consider the following three cases:
@@ -2220,23 +2220,23 @@ line~\lnref{glbrsv} subtracts this thread's \co{countermax} from \co{globalreser
 
 \begin{fcvref}[ln:count:count_lim_atomic:utility2]
 \Clnrefrange{balance:b}{balance:e} on
-Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 2}
+\cref{lst:count:Atomic Limit Counter Utility Functions 2}
 show the code for \co{balance_count()}, which refills
 the calling thread's local \co{counterandmax} variable.
 This function is quite similar to that of the preceding algorithms,
 with changes required to handle the merged \co{counterandmax} variable.
 Detailed analysis of the code is left as an exercise for the reader,
 as it is with the \co{count_register_thread()} function starting on
-line~\lnref{register:b} and the \co{count_unregister_thread()} function starting on
-line~\lnref{unregister:b}.
+\clnref{register:b} and the \co{count_unregister_thread()} function starting on
+\clnref{unregister:b}.
 \end{fcvref}
 
 \QuickQuiz{
 	Given that the \co{atomic_set()} primitive does a simple
 	store to the specified \co{atomic_t}, how can
-        line~\ref{ln:count:count_lim_atomic:utility2:balance:atmcset} of
+	\clnrefr{ln:count:count_lim_atomic:utility2:balance:atmcset} of
 	\co{balance_count()} in
-	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 2}
+	\cref{lst:count:Atomic Limit Counter Utility Functions 2}
 	work correctly in face of concurrent \co{flush_local_count()}
 	updates to this variable?
 }\QuickQuizAnswer{
@@ -2281,7 +2281,7 @@ Even though per-thread state will now be manipulated only by the
 corresponding thread, there will still need to be synchronization
 with the signal handlers.
 This synchronization is provided by the state machine shown in
-Figure~\ref{fig:count:Signal-Theft State Machine}.
+\cref{fig:count:Signal-Theft State Machine}.
 
 \begin{figure}
 \centering
@@ -2319,7 +2319,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE\@.
 
 \QuickQuizSeries{%
 \QuickQuizB{
-	In Figure~\ref{fig:count:Signal-Theft State Machine}, why is
+	In \cref{fig:count:Signal-Theft State Machine}, why is
 	the REQ \co{theft} state colored red?
 }\QuickQuizAnswerB{
 	To indicate that only the fastpath is permitted to change the
@@ -2329,7 +2329,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE\@.
 }\QuickQuizEndB
 %
 \QuickQuizE{
-	In Figure~\ref{fig:count:Signal-Theft State Machine}, what is
+	In \cref{fig:count:Signal-Theft State Machine}, what is
 	the point of having separate REQ and ACK \co{theft} states?
 	Why not simplify the state machine by collapsing
 	them into a single REQACK state?
@@ -2375,7 +2375,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE\@.
 \label{sec:count:Signal-Theft Limit Counter Implementation}
 
 \begin{fcvref}[ln:count:count_lim_sig:data]
-Listing~\ref{lst:count:Signal-Theft Limit Counter Data}
+\Cref{lst:count:Signal-Theft Limit Counter Data}
 (\path{count_lim_sig.c})
 shows the data structures used by the signal-theft based counter
 implementation.
@@ -2384,7 +2384,7 @@ for the per-thread theft state machine
 described in the preceding section.
 \Clnrefrange{var:b}{var:e} are similar to earlier implementations,
 with the addition of
-lines~\lnref{maxp} and~\lnref{theftp} to allow remote access to a
+\clnref{maxp,theftp} to allow remote access to a
 thread's \co{countermax}
 and \co{theft} variables, respectively.
 \end{fcvref}
@@ -2396,7 +2396,7 @@ and \co{theft} variables, respectively.
 \end{listing}
 
 \begin{fcvref}[ln:count:count_lim_sig:migration:globalize]
-Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
+\Cref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
 shows the functions responsible for migrating counts between per-thread
 variables and the global variables.
 \Clnrefrange{b}{e} show \co{globalize_count()},
@@ -2407,14 +2407,14 @@ implementations.
 \Clnrefrange{b}{e} show \co{flush_local_count_sig()},
 which is the signal
 handler used in the theft process.
-Lines~\lnref{check:REQ} and~\lnref{return:n} check to see if
+\Clnref{check:REQ,return:n} check to see if
 the \co{theft} state is REQ, and, if not
 returns without change.
-Line~\lnref{mb:1} executes a memory barrier to ensure that the sampling of the
+\Clnref{mb:1} executes a memory barrier to ensure that the sampling of the
 theft variable happens before any change to that variable.
-Line~\lnref{set:ACK} sets the \co{theft} state to ACK, and, if
-line~\lnref{check:fast} sees that
-this thread's fastpaths are not running, line~\lnref{set:READY} sets the \co{theft}
+\Clnref{set:ACK} sets the \co{theft} state to ACK, and, if
+\clnref{check:fast} sees that
+this thread's fastpaths are not running, \clnref{set:READY} sets the \co{theft}
 state to READY\@.
 \end{fcvref}
 
@@ -2432,8 +2432,8 @@ state to READY\@.
 	\co{theft} per-thread variable?
 }\QuickQuizAnswer{
 	\begin{fcvref}[ln:count:count_lim_sig:migration:flush_sig]
-	The first one (on line~\lnref{check:REQ}) can be argued to be unnecessary.
-	The last two (lines~\lnref{set:ACK} and~\lnref{set:READY}) are important.
+	The first one (on \clnref{check:REQ}) can be argued to be unnecessary.
+	The last two (\clnref{set:ACK,set:READY}) are important.
 	If these are removed, the compiler would be within its rights
 	to rewrite \clnrefrange{set:ACK}{set:READY} as follows:
 	\end{fcvref}
@@ -2456,20 +2456,20 @@ slowpath to flush all threads' local counts.
 The loop spanning
 \clnrefrange{loop:b}{loop:e} advances the \co{theft} state for each
 thread that has local count, and also sends that thread a signal.
-Line~\lnref{skip} skips any non-existent threads.
-Otherwise, line~\lnref{checkmax} checks to see if the current thread holds any local
-count, and, if not, line~\lnref{READY} sets the thread's \co{theft} state to READY
-and line~\lnref{next} skips to the next thread.
-Otherwise, line~\lnref{REQ} sets the thread's \co{theft} state to REQ and
-line~\lnref{signal} sends the thread a signal.
+\Clnref{skip} skips any non-existent threads.
+Otherwise, \clnref{checkmax} checks to see if the current thread holds any local
+count, and, if not, \clnref{READY} sets the thread's \co{theft} state to READY
+and \clnref{next} skips to the next thread.
+Otherwise, \clnref{REQ} sets the thread's \co{theft} state to REQ and
+\clnref{signal} sends the thread a signal.
 \end{fcvref}
 
 \QuickQuizSeries{%
 \QuickQuizB{
-	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
+	In \cref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
 	why is it safe for
-        line~\ref{ln:count:count_lim_sig:migration:flush:checkmax}
-        to directly access the other thread's
+	\clnrefr{ln:count:count_lim_sig:migration:flush:checkmax}
+	to directly access the other thread's
 	\co{countermax} variable?
 }\QuickQuizAnswerB{
 	Because the other thread is not permitted to change the value
@@ -2482,16 +2482,16 @@ line~\lnref{signal} sends the thread a signal.
 }\QuickQuizEndB
 %
 \QuickQuizM{
-	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
+	In \cref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
 	why doesn't
-        line~\ref{ln:count:count_lim_sig:migration:flush:signal}
-        check for the current thread sending itself
+	\clnrefr{ln:count:count_lim_sig:migration:flush:signal}
+	check for the current thread sending itself
 	a signal?
 }\QuickQuizAnswerM{
 	There is no need for an additional check.
 	The caller of \co{flush_local_count()} has already invoked
 	\co{globalize_count()}, so the check on
-	line~\ref{ln:count:count_lim_sig:migration:flush:checkmax}
+	\clnrefr{ln:count:count_lim_sig:migration:flush:checkmax}
 	will have succeeded, skipping the later \co{pthread_kill()}.
 }\QuickQuizEndM
 %
@@ -2516,18 +2516,18 @@ then steals that thread's count.
 and the loop spanning
 \clnrefrange{loop3:b}{loop3:e} waits until the current
 thread's \co{theft} state becomes READY\@.
-Line~\lnref{block} blocks for a millisecond to avoid priority-inversion problems,
-and if line~\lnref{check:REQ} determines that the thread's signal has not yet arrived,
-line~\lnref{signal2} resends the signal.
-Execution reaches line~\lnref{thiev:b} when the thread's \co{theft} state becomes
+\Clnref{block} blocks for a millisecond to avoid priority-inversion problems,
+and if \clnref{check:REQ} determines that the thread's signal has not yet arrived,
+\clnref{signal2} resends the signal.
+Execution reaches \clnref{thiev:b} when the thread's \co{theft} state becomes
 READY, so \clnrefrange{thiev:b}{thiev:e} do the thieving.
-Line~\lnref{IDLE} then sets the thread's \co{theft} state back to IDLE\@.
+\Clnref{IDLE} then sets the thread's \co{theft} state back to IDLE\@.
 \end{fcvref}
 
 \QuickQuiz{
-	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
-        why does line~\ref{ln:count:count_lim_sig:migration:flush:signal2}
-        resend the signal?
+	In \cref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
+	why does \clnrefr{ln:count:count_lim_sig:migration:flush:signal2}
+	resend the signal?
 }\QuickQuizAnswer{
 	Because many operating systems over several decades have
 	had the property of losing the occasional signal.
@@ -2557,34 +2557,34 @@ earlier examples.
 \end{listing}
 
 \begin{fcvref}[ln:count:count_lim_sig:add]
-Listing~\ref{lst:count:Signal-Theft Limit Counter Add Function}
+\Cref{lst:count:Signal-Theft Limit Counter Add Function}
 shows the \co{add_count()} function.
 The fastpath spans \clnrefrange{fast:b}{return:fs}, and the slowpath
 \clnrefrange{acquire}{return:ss}.
-Line~\lnref{fast:b} sets the per-thread \co{counting} variable to 1 so that
+\Clnref{fast:b} sets the per-thread \co{counting} variable to 1 so that
 any subsequent signal handlers interrupting this thread will
 set the \co{theft} state to ACK rather than READY, allowing this
 fastpath to complete properly.
-Line~\lnref{barrier:1} prevents the compiler from reordering any of the fastpath body
+\Clnref{barrier:1} prevents the compiler from reordering any of the fastpath body
 to precede the setting of \co{counting}.
-Lines~\lnref{check:b} and~\lnref{check:e} check to see
+\Clnref{check:b,check:e} check to see
 if the per-thread data can accommodate
 the \co{add_count()} and if there is no ongoing theft in progress,
-and if so line~\lnref{add:f} does the fastpath addition and
-line~\lnref{fasttaken} notes that
+and if so \clnref{add:f} does the fastpath addition and
+\clnref{fasttaken} notes that
 the fastpath was taken.
 
-In either case, line~\lnref{barrier:2} prevents the compiler from reordering the
-fastpath body to follow line~\lnref{clearcnt}, which permits any subsequent signal
+In either case, \clnref{barrier:2} prevents the compiler from reordering the
+fastpath body to follow \clnref{clearcnt}, which permits any subsequent signal
 handlers to undertake theft.
-Line~\lnref{barrier:3} again disables compiler reordering, and then
-line~\lnref{check:ACK}
+\Clnref{barrier:3} again disables compiler reordering, and then
+\clnref{check:ACK}
 checks to see if the signal handler deferred the \co{theft}
-state-change to READY, and, if so, line~\lnref{mb} executes a memory
-barrier to ensure that any CPU that sees line~\lnref{READY} setting state to
-READY also sees the effects of line~\lnref{add:f}.
-If the fastpath addition at line~\lnref{add:f} was executed, then
-line~\lnref{return:fs} returns
+state-change to READY, and, if so, \clnref{mb} executes a memory
+barrier to ensure that any CPU that sees \clnref{READY} setting state to
+READY also sees the effects of \clnref{add:f}.
+If the fastpath addition at \clnref{add:f} was executed, then
+\clnref{return:fs} returns
 success.
 \end{fcvref}
 
@@ -2595,17 +2595,17 @@ success.
 \end{listing}
 
 \begin{fcvref}[ln:count:count_lim_sig:add]
-Otherwise, we fall through to the slowpath starting at line~\lnref{acquire}.
+Otherwise, we fall through to the slowpath starting at \clnref{acquire}.
 The structure of the slowpath is similar to those of earlier examples,
 so its analysis is left as an exercise to the reader.
 \end{fcvref}
 Similarly, the structure of \co{sub_count()} on
-Listing~\ref{lst:count:Signal-Theft Limit Counter Subtract Function}
+\cref{lst:count:Signal-Theft Limit Counter Subtract Function}
 is the same
 as that of \co{add_count()}, so the analysis of \co{sub_count()} is also
 left as an exercise for the reader, as is the analysis of
 \co{read_count()} in
-Listing~\ref{lst:count:Signal-Theft Limit Counter Read Function}.
+\cref{lst:count:Signal-Theft Limit Counter Read Function}.
 
 \begin{listing}
 \input{CodeSamples/count/count_lim_sig@initialization.fcv}
@@ -2615,7 +2615,7 @@ Listing~\ref{lst:count:Signal-Theft Limit Counter Read Function}.
 
 \begin{fcvref}[ln:count:count_lim_sig:initialization:init]
 \Clnrefrange{b}{e} of
-Listing~\ref{lst:count:Signal-Theft Limit Counter Initialization Functions}
+\cref{lst:count:Signal-Theft Limit Counter Initialization Functions}
 show \co{count_init()}, which set up \co{flush_local_count_sig()}
 as the signal handler for \co{SIGUSR1},
 enabling the \co{pthread_kill()} calls in \co{flush_local_count()}
@@ -2647,7 +2647,7 @@ them both on the system that your application is to be deployed on.
 	the read side to be fast?
 }\QuickQuizAnswer{
 	One approach is to use the techniques shown in
-	Section~\ref{sec:count:Eventually Consistent Implementation},
+	\cref{sec:count:Eventually Consistent Implementation},
 	summarizing an approximation to the overall counter value in
 	a single variable.
 	Another approach would be to use multiple threads to carry
@@ -2706,7 +2706,7 @@ counted at full speed.
 Although a biased counter can be quite helpful and useful, it is only a
 partial solution to the removable I/O device access-count problem
 called out on
-page~\pageref{chp:Counting}.
+\cpageref{chp:Counting}.
 When attempting to remove a device, we must not only know the precise
 number of current I/O accesses, we also need to prevent any future
 accesses from starting.
@@ -2731,16 +2731,16 @@ if (removing) {			\lnlbl[check]
 \end{fcvlabel}
 
 \begin{fcvref}[ln:count:inline:I/O]
-Line~\lnref{acq} read-acquires the lock, and either
-line~\lnref{rel1} or~\lnref{rel2} releases it.
-Line~\lnref{check} checks to see if the device is being removed, and, if so,
-line~\lnref{rel1} releases the lock and
-line~\lnref{cancel} cancels the I/O, or takes whatever
+\Clnref{acq} read-acquires the lock, and either
+\clnref{rel1} or~\lnref{rel2} releases it.
+\Clnref{check} checks to see if the device is being removed, and, if so,
+\clnref{rel1} releases the lock and
+\clnref{cancel} cancels the I/O, or takes whatever
 action is appropriate given that the device is to be removed.
-Otherwise, line~\lnref{inc} increments the access count,
-line~\lnref{rel2} releases the
-lock, line~\lnref{do} performs the I/O, and
-line~\lnref{dec} decrements the access count.
+Otherwise, \clnref{inc} increments the access count,
+\clnref{rel2} releases the
+lock, \clnref{do} performs the I/O, and
+\clnref{dec} decrements the access count.
 \end{fcvref}
 
 \QuickQuiz{
@@ -2770,11 +2770,11 @@ remove_device();		\lnlbl[remove]
 \end{fcvlabel}
 
 \begin{fcvref}[ln:count:inline:remove]
-Line~\lnref{acq} write-acquires the lock and
-line~\lnref{rel} releases it.
-Line~\lnref{note} notes that the device is being removed, and the loop spanning
+\Clnref{acq} write-acquires the lock and
+\clnref{rel} releases it.
+\Clnref{note} notes that the device is being removed, and the loop spanning
 \clnrefrange{loop:b}{loop:e} waits for any I/O operations to complete.
-Finally, line~\lnref{remove} does any additional processing needed to prepare for
+Finally, \clnref{remove} does any additional processing needed to prepare for
 device removal.
 \end{fcvref}
 
@@ -2825,12 +2825,12 @@ perform and scale extremely well in certain special cases.
 
 It is well worth reviewing the lessons from these counting algorithms.
 To that end,
-Section~\ref{sec:count:Parallel Counting Performance}
+\cref{sec:count:Parallel Counting Performance}
 summarizes performance and scalability,
-Section~\ref{sec:count:Parallel Counting Specializations}
+\cref{sec:count:Parallel Counting Specializations}
 discusses the need for specialization,
 and finally,
-Section~\ref{sec:count:Parallel Counting Lessons}
+\cref{sec:count:Parallel Counting Lessons}
 enumerates lessons learned and calls attention to later chapters that
 will expand on these lessons.
 
@@ -2895,7 +2895,7 @@ updates than the array-based implementation
 and suffers severe \IX{lock contention} when there are many parallel readers.
 This contention can be addressed using the deferred-processing
 techniques introduced in
-Chapter~\ref{chp:Deferred Processing},
+\cref{chp:Deferred Processing},
 as shown on the \path{count_end_rcu.c} row of
 \cref{tab:count:Statistical/Limit Counter Performance on x86}.
 Deferred processing also shines on the \path{count_stat_eventual.c} row,
@@ -2929,7 +2929,7 @@ courtesy of eventual consistency.
 	``Use the right tool for the job.''
 
 	As can be seen from
-	Figure~\ref{fig:count:Atomic Increment Scalability on x86},
+	\cref{fig:count:Atomic Increment Scalability on x86},
 	single-variable atomic increment need not apply for any job
 	involving heavy use of parallel updates.
 	In contrast, the algorithms shown in the top half of
@@ -2940,7 +2940,7 @@ courtesy of eventual consistency.
 	featuring a single atomically incremented
 	variable that can be read out using a single load,
 	similar to the approach used in
-	Section~\ref{sec:count:Eventually Consistent Implementation}.
+	\cref{sec:count:Eventually Consistent Implementation}.
 }\QuickQuizEndE
 }
 
@@ -3061,7 +3061,7 @@ This sort of adaptation will become increasingly important as the
 number of CPUs on mainstream systems continues to increase.
 
 In short, as discussed in
-Chapter~\ref{chp:Hardware and its Habits},
+\cref{chp:Hardware and its Habits},
 the laws of physics constrain parallel software just as surely as they
 constrain mechanical artifacts such as bridges.
 These constraints force specialization, though in the case of software
@@ -3125,13 +3125,13 @@ and partial parallelization in particular in
 
 The partially partitioned counting algorithms used locking to
 guard the global data, and locking is the subject of
-Chapter~\ref{chp:Locking}.
+\cref{chp:Locking}.
 In contrast, the partitioned data tended to be fully under the control of
 the corresponding thread, so that no synchronization whatsoever was required.
 This \emph{data ownership} will be introduced in
-Section~\ref{sec:SMPdesign:Data Ownership}
+\cref{sec:SMPdesign:Data Ownership}
 and discussed in more detail in
-Chapter~\ref{chp:Data Ownership}.
+\cref{chp:Data Ownership}.
 
 Because integer addition and subtraction are extremely cheap
 compared to typical synchronization operations, achieving reasonable
@@ -3144,12 +3144,12 @@ the counting algorithms listed in
 \cref{tab:count:Statistical/Limit Counter Performance on x86}.
 
 Finally, the eventually consistent statistical counter discussed in
-Section~\ref{sec:count:Eventually Consistent Implementation}
+\cref{sec:count:Eventually Consistent Implementation}
 showed how deferring activity (in that case, updating the global
 counter) can provide substantial performance and scalability benefits.
 This approach allows common case code to use much cheaper synchronization
 operations than would otherwise be possible.
-Chapter~\ref{chp:Deferred Processing} will examine a number of additional
+\Cref{chp:Deferred Processing} will examine a number of additional
 ways that deferral can improve performance, scalability, and even
 real-time response.
 
@@ -3160,11 +3160,11 @@ Summarizing the summary:
 \item	Partial partitioning, that is, partitioning applied only to
 	common code paths, works almost as well.
 \item	Partial partitioning can be applied to code (as in
-	Section~\ref{sec:count:Statistical Counters}'s statistical
+	\cref{sec:count:Statistical Counters}'s statistical
 	counters' partitioned updates and non-partitioned reads), but also
 	across time (as in
-	Section~\ref{sec:count:Approximate Limit Counters}'s and
-	Section~\ref{sec:count:Exact Limit Counters}'s
+	\cref{sec:count:Approximate Limit Counters}'s and
+	\cref{sec:count:Exact Limit Counters}'s
 	limit counters running fast when far from
 	the limit, but slowly when close to the limit).
 \item	Partitioning across time often batches updates locally
@@ -3179,7 +3179,7 @@ Summarizing the summary:
 	and scalability, as seen in the \path{count_end.c} row of
 	\cref{tab:count:Statistical/Limit Counter Performance on x86}.
 \item	Judicious use of delay promotes performance and scalability, as
-	seen in Section~\ref{sec:count:Eventually Consistent Implementation}.
+	seen in \cref{sec:count:Eventually Consistent Implementation}.
 \item	Parallel performance and scalability is usually a balancing act:
 	Beyond a certain point, optimizing some code paths will degrade
 	others.
@@ -3210,15 +3210,15 @@ synchronization operations, and
 (3)~\emph{weakening} synchronization operations where feasible.
 As a rough rule of thumb, you should apply these methods in this order,
 as was noted earlier in the discussion of
-Figure~\ref{fig:intro:Ordering of Parallel-Programming Tasks}
+\cref{fig:intro:Ordering of Parallel-Programming Tasks}
 on
-page~\pageref{fig:intro:Ordering of Parallel-Programming Tasks}.
+\cpageref{fig:intro:Ordering of Parallel-Programming Tasks}.
 The partitioning optimization applies to the
 ``Resource Partitioning and Replication'' bubble,
 the batching optimization to the ``Work Partitioning'' bubble,
 and the weakening optimization to the ``Parallel Access Control'' bubble,
 as shown in
-Figure~\ref{fig:count:Optimization and the Four Parallel-Programming Tasks}.
+\cref{fig:count:Optimization and the Four Parallel-Programming Tasks}.
 Of course, if you are using special-purpose hardware such as
 digital signal processors (DSPs), field-programmable gate arrays (FPGAs),
 or general-purpose graphical processing units (GPGPUs), you may need
-- 
2.17.1


