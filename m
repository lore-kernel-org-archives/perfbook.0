Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Ns/sbFI5LoEoyZPuFzUCp87uBU2OQ79cIBPE933bjw=;
 b=T7vN08FDoOm/KoJ8NA1ApXNwjgtK3j3xLfc2WKkEwme/Mt5SOuD3bXSg8cesf44fuU
 KvvURaWtviR2tgWnsJA981kBJRVB6FvFCP74Q8IT+RFXDecM32x81Xv2azpDD7bkXmPT
 AaNKldxAcEFbEnJdbhOJ9McjR9ScMr6UnvaEe16EGqSxpROqtyNZZ/G6zWovi++lnx8s
 dTo+AOIk3Pt1IUexTkj1vuVG1lEi4Z4+k0LpWZwDLzb1vCPRDrmGSip1caVNf6fgfkVY
 JEuN5oVt6e6r5zsV1sPBNkuXcZRjaoiLT5ru4YvxHGFknpKKpbdizPKFt25MI0/GUmEP
 DqPA==
Subject: [PATCH 2/2] Convert code snippets to 'listing' env (appendix)
References: <64de57b5-12d7-d0fb-673a-b53f0f6c6663@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f2748183-878b-563c-16f2-9859b2db3774@gmail.com>
Date: Sat, 14 Oct 2017 07:58:38 +0900
MIME-Version: 1.0
In-Reply-To: <64de57b5-12d7-d0fb-673a-b53f0f6c6663@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a7719c90d14629a667fd82d9ecbd9c78a1ddefd8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 14 Oct 2017 07:46:18 +0900
Subject: [PATCH 2/2] Convert code snippets to 'listing' env (appendix)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/questions/after.tex |  34 +++----
 appendix/toyrcu/toyrcu.tex   | 230 +++++++++++++++++++++----------------------
 2 files changed, 132 insertions(+), 132 deletions(-)

diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index 9944bcf..cea0791 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -12,15 +12,15 @@ and ``c''.
 The producer loops recording the current time
 (in seconds since 1970 in decimal),
 then updating the values of ``a'', ``b'', and ``c'',
-as shown in Figure~\ref{fig:app:questions:After Producer Function}.
+as shown in Listing~\ref{lst:app:questions:After Producer Function}.
 The consumer code loops, also recording the current time, but also
 copying the producer's timestamp along with the fields ``a'',
 ``b'', and ``c'', as shown in
-Figure~\ref{fig:app:questions:After Consumer Function}.
+Listing~\ref{lst:app:questions:After Consumer Function}.
 At the end of the run, the consumer outputs a list of anomalous recordings,
 e.g., where time has appeared to go backwards.

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 { \scriptsize
 \begin{verbbox}
   1 /* WARNING: BUGGY CODE. */
@@ -47,10 +47,10 @@ e.g., where time has appeared to go backwards.
 \centering
 \theverbbox
 \caption{``After'' Producer Function}
-\label{fig:app:questions:After Producer Function}
-\end{figure}
+\label{lst:app:questions:After Producer Function}
+\end{listing}

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 { \scriptsize
 \begin{verbbox}
   1 /* WARNING: BUGGY CODE. */
@@ -110,8 +110,8 @@ e.g., where time has appeared to go backwards.
 \centering
 \theverbbox
 \caption{``After'' Consumer Function}
-\label{fig:app:questions:After Consumer Function}
-\end{figure}
+\label{lst:app:questions:After Consumer Function}
+\end{listing}

 \QuickQuiz{}
 	What SMP coding errors can you see in these examples?
@@ -165,14 +165,14 @@ instructions in that time.
 One possible reason is given by the following sequence of events:
 \begin{enumerate}
 \item	Consumer obtains timestamp
-	(Figure~\ref{fig:app:questions:After Consumer Function}, line~13).
+	(Listing~\ref{lst:app:questions:After Consumer Function}, line~13).
 \item	Consumer is preempted.
 \item	An arbitrary amount of time passes.
 \item	Producer obtains timestamp
-	(Figure~\ref{fig:app:questions:After Producer Function}, line~10).
+	(Listing~\ref{lst:app:questions:After Producer Function}, line~10).
 \item	Consumer starts running again, and picks up the producer's
 	timestamp
-	(Figure~\ref{fig:app:questions:After Consumer Function}, line~14).
+	(Listing~\ref{lst:app:questions:After Consumer Function}, line~14).
 \end{enumerate}

 In this scenario, the producer's timestamp might be an arbitrary
@@ -185,16 +185,16 @@ Simply use SMP primitives as designed.

 In this example, the easiest fix is to use locking, for example,
 acquire a lock in the producer before line~10 in
-Figure~\ref{fig:app:questions:After Producer Function} and in
+Listing~\ref{lst:app:questions:After Producer Function} and in
 the consumer before line~13 in
-Figure~\ref{fig:app:questions:After Consumer Function}.
+Listing~\ref{lst:app:questions:After Consumer Function}.
 This lock must also be released after line~13 in
-Figure~\ref{fig:app:questions:After Producer Function} and
+Listing~\ref{lst:app:questions:After Producer Function} and
 after line~17 in
-Figure~\ref{fig:app:questions:After Consumer Function}.
+Listing~\ref{lst:app:questions:After Consumer Function}.
 These locks cause the code segments in lines~10-13 of
-Figure~\ref{fig:app:questions:After Producer Function} and in lines~13-17 of
-Figure~\ref{fig:app:questions:After Consumer Function} to {\em exclude}
+Listing~\ref{lst:app:questions:After Producer Function} and in lines~13-17 of
+Listing~\ref{lst:app:questions:After Consumer Function} to {\em exclude}
 each other, in other words, to run atomically with respect to each other.
 This is represented in
 Figure~\ref{fig:app:questions:Effect of Locking on Snapshot Collection}:
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 2c65f74..cd6541c 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -31,7 +31,7 @@ provides a summary and a list of desirable RCU properties.
 \section{Lock-Based RCU}
 \label{sec:app:toyrcu:Lock-Based RCU}

-\begin{figure}[bp]
+\begin{listing}[bp]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -54,12 +54,12 @@ provides a summary and a list of desirable RCU properties.
 \centering
 \theverbbox
 \caption{Lock-Based RCU Implementation}
-\label{fig:app:toyrcu:Lock-Based RCU Implementation}
-\end{figure}
+\label{lst:app:toyrcu:Lock-Based RCU Implementation}
+\end{listing}

 Perhaps the simplest RCU implementation leverages locking, as
 shown in
-Figure~\ref{fig:app:toyrcu:Lock-Based RCU Implementation}
+Listing~\ref{lst:app:toyrcu:Lock-Based RCU Implementation}
 (\path{rcu_lock.h} and \path{rcu_lock.c}).
 In this implementation, \co{rcu_read_lock()} acquires a global
 spinlock, \co{rcu_read_unlock()} releases it, and
@@ -86,11 +86,11 @@ preventing grace-period sharing.

 \QuickQuiz{}
 	Why wouldn't any deadlock in the RCU implementation in
-	Figure~\ref{fig:app:toyrcu:Lock-Based RCU Implementation}
+	Listing~\ref{lst:app:toyrcu:Lock-Based RCU Implementation}
 	also be a deadlock in any other RCU implementation?
 \QuickQuizAnswer{
 %
-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void foo(void)
@@ -117,11 +117,11 @@ preventing grace-period sharing.
 \centering
 \theverbbox
 \caption{Deadlock in Lock-Based RCU Implementation}
-\label{fig:app:toyrcu:Deadlock in Lock-Based RCU Implementation}
-\end{figure}
+\label{lst:app:toyrcu:Deadlock in Lock-Based RCU Implementation}
+\end{listing}
 %
 	Suppose the functions \co{foo()} and \co{bar()} in
-	Figure~\ref{fig:app:toyrcu:Deadlock in Lock-Based RCU Implementation}
+	Listing~\ref{lst:app:toyrcu:Deadlock in Lock-Based RCU Implementation}
 	are invoked concurrently from different CPUs.
 	Then \co{foo()} will acquire \co{my_lock()} on line~3,
 	while \co{bar()} will acquire \co{rcu_gp_lock} on
@@ -141,7 +141,7 @@ preventing grace-period sharing.
 \QuickQuiz{}
 	Why not simply use reader-writer locks in the RCU implementation
 	in
-	Figure~\ref{fig:app:toyrcu:Lock-Based RCU Implementation}
+	Listing~\ref{lst:app:toyrcu:Lock-Based RCU Implementation}
 	in order to allow RCU readers to proceed in parallel?
 \QuickQuizAnswer{
 	One could in fact use reader-writer locks in this manner.
@@ -169,7 +169,7 @@ in the next section.
 \section{Per-Thread Lock-Based RCU}
 \label{sec:app:toyrcu:Per-Thread Lock-Based RCU}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -196,10 +196,10 @@ in the next section.
 \centering
 \theverbbox
 \caption{Per-Thread Lock-Based RCU Implementation}
-\label{fig:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
-\end{figure}
+\label{lst:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
+\end{listing}

-Figure~\ref{fig:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
+Listing~\ref{lst:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
 (\path{rcu_lock_percpu.h} and \path{rcu_lock_percpu.c})
 shows an implementation based on one lock per thread.
 The \co{rcu_read_lock()} and \co{rcu_read_unlock()} functions
@@ -222,7 +222,7 @@ up to more than 100 \emph{microseconds} on 64 CPUs.
 \QuickQuiz{}
 	Wouldn't it be cleaner to acquire all the locks, and then
 	release them all in the loop from lines~15-18 of
-	Figure~\ref{fig:app:toyrcu:Per-Thread Lock-Based RCU Implementation}?
+	Listing~\ref{lst:app:toyrcu:Per-Thread Lock-Based RCU Implementation}?
 	After all, with this change, there would be a point in time
 	when there were no readers, simplifying things greatly.
 \QuickQuizAnswer{
@@ -232,7 +232,7 @@ up to more than 100 \emph{microseconds} on 64 CPUs.

 \QuickQuiz{}
 	Is the implementation shown in
-	Figure~\ref{fig:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
+	Listing~\ref{lst:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
 	free from deadlocks?
 	Why or why not?
 \QuickQuizAnswer{
@@ -266,7 +266,7 @@ up to more than 100 \emph{microseconds} on 64 CPUs.

 \QuickQuiz{}
 	Isn't one advantage of the RCU algorithm shown in
-	Figure~\ref{fig:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
+	Listing~\ref{lst:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
 	that it uses only primitives that are widely available,
 	for example, in POSIX pthreads?
 \QuickQuizAnswer{
@@ -289,7 +289,7 @@ the shortcomings of the lock-based implementation.
 \section{Simple Counter-Based RCU}
 \label{sec:app:toyrcu:Simple Counter-Based RCU}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 atomic_t rcu_refcnt;
@@ -319,11 +319,11 @@ the shortcomings of the lock-based implementation.
 \centering
 \theverbbox
 \caption{RCU Implementation Using Single Global Reference Counter}
-\label{fig:app:toyrcu:RCU Implementation Using Single Global Reference Counter}
-\end{figure}
+\label{lst:app:toyrcu:RCU Implementation Using Single Global Reference Counter}
+\end{listing}

 A slightly more sophisticated RCU implementation is shown in
-Figure~\ref{fig:app:toyrcu:RCU Implementation Using Single Global Reference Counter}
+Listing~\ref{lst:app:toyrcu:RCU Implementation Using Single Global Reference Counter}
 (\path{rcu_rcg.h} and \path{rcu_rcg.c}).
 This implementation makes use of a global reference counter
 \co{rcu_refcnt} defined on line~1.
@@ -410,7 +410,7 @@ is of course unacceptable in production settings.
 	Why not simply make \co{rcu_read_lock()} wait when a concurrent
 	\co{synchronize_rcu()} has been waiting too long in
 	the RCU implementation in
-	Figure~\ref{fig:app:toyrcu:RCU Implementation Using Single Global Reference Counter}?
+	Listing~\ref{lst:app:toyrcu:RCU Implementation Using Single Global Reference Counter}?
 	Wouldn't that prevent \co{synchronize_rcu()} from starving?
 \QuickQuizAnswer{
 	Although this would in fact eliminate the starvation, it would
@@ -435,7 +435,7 @@ scheme that is more favorable to writers.
 \section{Starvation-Free Counter-Based RCU}
 \label{sec:app:toyrcu:Starvation-Free Counter-Based RCU}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -448,10 +448,10 @@ scheme that is more favorable to writers.
 \centering
 \theverbbox
 \caption{RCU Global Reference-Count Pair Data}
-\label{fig:app:toyrcu:RCU Global Reference-Count Pair Data}
-\end{figure}
+\label{lst:app:toyrcu:RCU Global Reference-Count Pair Data}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -487,10 +487,10 @@ scheme that is more favorable to writers.
 \centering
 \theverbbox
 \caption{RCU Read-Side Using Global Reference-Count Pair}
-\label{fig:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
-\end{figure}
+\label{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
+\end{listing}

-Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
+Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
 (\path{rcu_rcgp.h})
 shows the read-side primitives of an RCU implementation that uses a pair
 of reference counters (\co{rcu_refcnt[]}),
@@ -500,7 +500,7 @@ a per-thread nesting counter \co{rcu_nesting},
 a per-thread snapshot of the global index (\co{rcu_read_idx}),
 and a global lock (\co{rcu_gp_lock}),
 which are themselves shown in
-Figure~\ref{fig:app:toyrcu:RCU Global Reference-Count Pair Data}.
+Listing~\ref{lst:app:toyrcu:RCU Global Reference-Count Pair Data}.

 \paragraph{Design}

@@ -554,7 +554,7 @@ These additional measures use the per-thread \co{rcu_nesting} variable
 to track nesting.

 To make all this work, line~6 of \co{rcu_read_lock()} in
-Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
+Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
 picks up the
 current thread's instance of \co{rcu_nesting}, and if line~7 finds
 that this is the outermost \co{rcu_read_lock()},
@@ -577,7 +577,7 @@ the selected element of \co{rcu_refcnt}.
 Regardless of the nesting level, line~27 decrements this thread's
 instance of \co{rcu_nesting}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void synchronize_rcu(void)
@@ -606,10 +606,10 @@ instance of \co{rcu_nesting}.
 \centering
 \theverbbox
 \caption{RCU Update Using Global Reference-Count Pair}
-\label{fig:app:toyrcu:RCU Update Using Global Reference-Count Pair}
-\end{figure}
+\label{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}
+\end{listing}

-Figure~\ref{fig:app:toyrcu:RCU Update Using Global Reference-Count Pair}
+Listing~\ref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}
 (\path{rcu_rcpg.c})
 shows the corresponding \co{synchronize_rcu()} implementation.
 Lines~6 and 19 acquire and release \co{rcu_gp_lock} in order to
@@ -628,7 +628,7 @@ checking of \co{rcu_refcnt}.

 \QuickQuiz{}
 	Why the memory barrier on line~5 of \co{synchronize_rcu()} in
-	Figure~\ref{fig:app:toyrcu:RCU Update Using Global Reference-Count Pair}
+	Listing~\ref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}
 	given that there is a spin-lock acquisition immediately after?
 \QuickQuizAnswer{
 	The spin-lock acquisition only guarantees that the spin-lock's
@@ -644,7 +644,7 @@ checking of \co{rcu_refcnt}.

 	Exercise for the reader: use a tool such as Promela/spin
 	to determine which (if any) of the memory barriers in
-	Figure~\ref{fig:app:toyrcu:RCU Update Using Global Reference-Count Pair}
+	Listing~\ref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}
 	are really needed.
 	See Chapter~\ref{chp:Formal Verification}
 	for information on using these tools.
@@ -653,17 +653,17 @@ checking of \co{rcu_refcnt}.

 \QuickQuiz{}
 	Why is the counter flipped twice in
-	Figure~\ref{fig:app:toyrcu:RCU Update Using Global Reference-Count Pair}?
+	Listing~\ref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}?
 	Shouldn't a single flip-and-wait cycle be sufficient?
 \QuickQuizAnswer{
 	Both flips are absolutely required.
 	To see this, consider the following sequence of events:
 	\begin{enumerate}
 	\item	Line~8 of \co{rcu_read_lock()} in
-		Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
+		Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
 		picks up \co{rcu_idx}, finding its value to be zero.
 	\item	Line~8 of \co{synchronize_rcu()} in
-		Figure~\ref{fig:app:toyrcu:RCU Update Using Global Reference-Count Pair}
+		Listing~\ref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}
 		complements the value of \co{rcu_idx}, setting its
 		value to one.
 	\item	Lines~10-13 of \co{synchronize_rcu()} find that the
@@ -706,7 +706,7 @@ checking of \co{rcu_refcnt}.

 This implementation avoids the update-starvation issues that could
 occur in the single-counter implementation shown in
-Figure~\ref{fig:app:toyrcu:RCU Implementation Using Single Global Reference Counter}.
+Listing~\ref{lst:app:toyrcu:RCU Implementation Using Single Global Reference Counter}.

 \paragraph{Discussion}

@@ -716,7 +716,7 @@ and \co{rcu_read_unlock()}
 are still quite heavyweight.
 In fact, they are more complex than those
 of the single-counter variant shown in
-Figure~\ref{fig:app:toyrcu:RCU Implementation Using Single Global Reference Counter},
+Listing~\ref{lst:app:toyrcu:RCU Implementation Using Single Global Reference Counter},
 with the read-side primitives consuming about 150~nanoseconds on a single
 \Power{5} CPU and almost 40~\emph{microseconds} on a 64-CPU system.
 The update-side \co{synchronize_rcu()} primitive is more costly as
@@ -748,7 +748,7 @@ sharing.
 	Given that atomic increment and decrement are so expensive,
 	why not just use non-atomic increment on line~10 and a
 	non-atomic decrement on line~25 of
-	Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}?
+	Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}?
 \QuickQuizAnswer{
 	Using non-atomic operations would cause increments and decrements
 	to be lost, in turn causing the implementation to fail.
@@ -769,7 +769,7 @@ scheme that provides greatly improved read-side performance and scalability.
 \section{Scalable Counter-Based RCU}
 \label{sec:app:toyrcu:Scalable Counter-Based RCU}

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -782,10 +782,10 @@ scheme that provides greatly improved read-side performance and scalability.
 \centering
 \theverbbox
 \caption{RCU Per-Thread Reference-Count Pair Data}
-\label{fig:app:toyrcu:RCU Per-Thread Reference-Count Pair Data}
-\end{figure}
+\label{lst:app:toyrcu:RCU Per-Thread Reference-Count Pair Data}
+\end{listing}

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -821,18 +821,18 @@ scheme that provides greatly improved read-side performance and scalability.
 \centering
 \theverbbox
 \caption{RCU Read-Side Using Per-Thread Reference-Count Pair}
-\label{fig:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair}
-\end{figure}
+\label{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair}
+\end{listing}

-Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair}
+Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair}
 (\path{rcu_rcpl.h})
 shows the read-side primitives of an RCU implementation that uses per-thread
 pairs of reference counters.
 This implementation is quite similar to that shown in
-Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair},
+Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair},
 the only difference being that \co{rcu_refcnt} is now a per-thread
 array (as shown in
-Figure~\ref{fig:app:toyrcu:RCU Per-Thread Reference-Count Pair Data}).
+Listing~\ref{lst:app:toyrcu:RCU Per-Thread Reference-Count Pair Data}).
 As with the algorithm in the previous section, use of this two-element
 array prevents readers from starving updaters.
 One benefit of per-thread \co{rcu_refcnt[]} array is that the
@@ -857,7 +857,7 @@ perform atomic operations.
 	But thankfully, it seems that no one runs Linux on 8-bit systems.
 } \QuickQuizEnd

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void flip_counter_and_wait(int i)
@@ -891,15 +891,15 @@ perform atomic operations.
 \centering
 \theverbbox
 \caption{RCU Update Using Per-Thread Reference-Count Pair}
-\label{fig:app:toyrcu:RCU Update Using Per-Thread Reference-Count Pair}
-\end{figure}
+\label{lst:app:toyrcu:RCU Update Using Per-Thread Reference-Count Pair}
+\end{listing}

-Figure~\ref{fig:app:toyrcu:RCU Update Using Per-Thread Reference-Count Pair}
+Listing~\ref{lst:app:toyrcu:RCU Update Using Per-Thread Reference-Count Pair}
 (\path{rcu_rcpl.c})
 shows the implementation of \co{synchronize_rcu()}, along with a helper
 function named \co{flip_counter_and_wait()}.
 The \co{synchronize_rcu()} function resembles that shown in
-Figure~\ref{fig:app:toyrcu:RCU Update Using Global Reference-Count Pair},
+Listing~\ref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair},
 except that the repeated counter flip is replaced by a pair of calls
 on lines~22 and 23 to the new helper function.

@@ -976,7 +976,7 @@ concurrent RCU updates.
 \section{Scalable Counter-Based RCU With Shared Grace Periods}
 \label{sec:app:toyrcu:Scalable Counter-Based RCU With Shared Grace Periods}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -989,10 +989,10 @@ concurrent RCU updates.
 \centering
 \theverbbox
 \caption{RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data}
-\label{fig:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data}
-\end{figure}
+\label{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -1028,28 +1028,28 @@ concurrent RCU updates.
 \centering
 \theverbbox
 \caption{RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
-\label{fig:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
-\end{figure}
+\label{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
+\end{listing}

-Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
+Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
 (\path{rcu_rcpls.h})
 shows the read-side primitives for an RCU implementation using per-thread
 reference count pairs, as before, but permitting updates to share
 grace periods.
 The main difference from the earlier implementation shown in
-Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair}
+Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair}
 is that \co{rcu_idx} is now a \co{long} that counts freely,
 so that line~8 of
-Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
+Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
 must mask off the low-order bit.
 We also switched from using \co{atomic_read()} and \co{atomic_set()}
 to using \co{READ_ONCE()}.
 The data is also quite similar, as shown in
-Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data},
+Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data},
 with \co{rcu_idx} now being a \co{long} instead of an
 \co{atomic_t}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void flip_counter_and_wait(int ctr)
@@ -1094,15 +1094,15 @@ with \co{rcu_idx} now being a \co{long} instead of an
 \centering
 \theverbbox
 \caption{RCU Shared Update Using Per-Thread Reference-Count Pair}
-\label{fig:app:toyrcu:RCU Shared Update Using Per-Thread Reference-Count Pair}
-\end{figure}
+\label{lst:app:toyrcu:RCU Shared Update Using Per-Thread Reference-Count Pair}
+\end{listing}

-Figure~\ref{fig:app:toyrcu:RCU Shared Update Using Per-Thread Reference-Count Pair}
+Listing~\ref{lst:app:toyrcu:RCU Shared Update Using Per-Thread Reference-Count Pair}
 (\path{rcu_rcpls.c})
 shows the implementation of \co{synchronize_rcu()} and its helper
 function \co{flip_counter_and_wait()}.
 These are similar to those in
-Figure~\ref{fig:app:toyrcu:RCU Update Using Per-Thread Reference-Count Pair}.
+Listing~\ref{lst:app:toyrcu:RCU Update Using Per-Thread Reference-Count Pair}.
 The differences in \co{flip_counter_and_wait()} include:
 \begin{enumerate}
 \item	Line~6 uses \co{WRITE_ONCE()} instead of \co{atomic_set()},
@@ -1188,7 +1188,7 @@ RCU implementation being used in production in real-life applications.
 } \QuickQuizEnd

 Referring back to
-Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update},
+Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update},
 we see that there is one global-variable access and no fewer than four
 accesses to thread-local variables.
 Given the relatively high cost of thread-local accesses on systems
@@ -1202,7 +1202,7 @@ thread-local accesses to one, as is done in the next section.
 \section{RCU Based on Free-Running Counter}
 \label{sec:app:toyrcu:RCU Based on Free-Running Counter}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -1214,10 +1214,10 @@ thread-local accesses to one, as is done in the next section.
 \centering
 \theverbbox
 \caption{Data for Free-Running Counter Using RCU}
-\label{fig:app:toyrcu:Data for Free-Running Counter Using RCU}
-\end{figure}
+\label{lst:app:toyrcu:Data for Free-Running Counter Using RCU}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 static void rcu_read_lock(void)
@@ -1257,14 +1257,14 @@ thread-local accesses to one, as is done in the next section.
 \centering
 \theverbbox
 \caption{Free-Running Counter Using RCU}
-\label{fig:app:toyrcu:Free-Running Counter Using RCU}
-\end{figure}
+\label{lst:app:toyrcu:Free-Running Counter Using RCU}
+\end{listing}

-Figure~\ref{fig:app:toyrcu:Free-Running Counter Using RCU}
+Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU}
 (\path{rcu.h} and \path{rcu.c})
 shows an RCU implementation based on a single global free-running counter
 that takes on only even-numbered values, with data shown in
-Figure~\ref{fig:app:toyrcu:Data for Free-Running Counter Using RCU}.
+Listing~\ref{lst:app:toyrcu:Data for Free-Running Counter Using RCU}.
 The resulting \co{rcu_read_lock()} implementation is extremely
 straightforward.
 Lines~3 and~4 simply add one to the global free-running \co{rcu_gp_ctr}
@@ -1284,7 +1284,7 @@ of \co{synchronize_rcu()} will know to ignore it.
 \QuickQuiz{}
 	If any even value is sufficient to tell \co{synchronize_rcu()}
 	to ignore a given task, why don't lines~10 and~11 of
-	Figure~\ref{fig:app:toyrcu:Free-Running Counter Using RCU}
+	Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU}
 	simply assign zero to \co{rcu_reader_gp}?
 \QuickQuizAnswer{
 	Assigning zero (or any other even-numbered constant)
@@ -1323,7 +1323,7 @@ destruction will not be reordered into the preceding loop.

 \QuickQuiz{}
 	Why are the memory barriers on lines~19 and~31 of
-	Figure~\ref{fig:app:toyrcu:Free-Running Counter Using RCU}
+	Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU}
 	needed?
 	Aren't the memory barriers inherent in the locking
 	primitives on lines~20 and~30 sufficient?
@@ -1349,7 +1349,7 @@ such CPUs.
 	Couldn't the update-side batching optimization described in
 	Section~\ref{sec:app:toyrcu:Scalable Counter-Based RCU With Shared Grace Periods}
 	be applied to the implementation shown in
-	Figure~\ref{fig:app:toyrcu:Free-Running Counter Using RCU}?
+	Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU}?
 \QuickQuizAnswer{
 	Indeed it could, with a few modifications.
 	This work is left as an exercise for the reader.
@@ -1360,7 +1360,7 @@ addition to the high update-side overhead noted earlier.
 First, it is no longer permissible to nest RCU read-side critical
 sections, a topic that is taken up in the next section.
 Second, if a reader is preempted at line~3 of
-Figure~\ref{fig:app:toyrcu:Free-Running Counter Using RCU} after fetching from
+Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU} after fetching from
 \co{rcu_gp_ctr} but before storing to \co{rcu_reader_gp},
 and if the \co{rcu_gp_ctr} counter then runs through more than half
 but less than all of its possible values, then \co{synchronize_rcu()}
@@ -1371,7 +1371,7 @@ variables.

 \QuickQuiz{}
 	Is the possibility of readers being preempted in
-	lines~3-4 of Figure~\ref{fig:app:toyrcu:Free-Running Counter Using RCU}
+	lines~3-4 of Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU}
 	a real problem, in other words, is there a real sequence
 	of events that could lead to failure?
 	If not, why not?
@@ -1392,7 +1392,7 @@ variables.
 \section{Nestable RCU Based on Free-Running Counter}
 \label{sec:app:toyrcu:Nestable RCU Based on Free-Running Counter}

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -1406,10 +1406,10 @@ variables.
 \centering
 \theverbbox
 \caption{Data for Nestable RCU Using a Free-Running Counter}
-\label{fig:app:toyrcu:Data for Nestable RCU Using a Free-Running Counter}
-\end{figure}
+\label{lst:app:toyrcu:Data for Nestable RCU Using a Free-Running Counter}
+\end{listing}

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 static void rcu_read_lock(void)
@@ -1458,16 +1458,16 @@ variables.
 \centering
 \theverbbox
 \caption{Nestable RCU Using a Free-Running Counter}
-\label{fig:app:toyrcu:Nestable RCU Using a Free-Running Counter}
-\end{figure}
+\label{lst:app:toyrcu:Nestable RCU Using a Free-Running Counter}
+\end{listing}

-Figure~\ref{fig:app:toyrcu:Nestable RCU Using a Free-Running Counter}
+Listing~\ref{lst:app:toyrcu:Nestable RCU Using a Free-Running Counter}
 (\path{rcu_nest.h} and \path{rcu_nest.c})
 show an RCU implementation based on a single global free-running counter,
 but that permits nesting of RCU read-side critical sections.
 This nestability is accomplished by reserving the low-order bits of the
 global \co{rcu_gp_ctr} to count nesting, using the definitions shown in
-Figure~\ref{fig:app:toyrcu:Data for Nestable RCU Using a Free-Running Counter}.
+Listing~\ref{lst:app:toyrcu:Data for Nestable RCU Using a Free-Running Counter}.
 This is a generalization of the scheme in
 Section~\ref{sec:app:toyrcu:RCU Based on Free-Running Counter},
 which can be thought of as having a single low-order bit reserved
@@ -1573,7 +1573,7 @@ overhead.

 \QuickQuiz{}
 	Given the algorithm shown in
-	Figure~\ref{fig:app:toyrcu:Nestable RCU Using a Free-Running Counter},
+	Listing~\ref{lst:app:toyrcu:Nestable RCU Using a Free-Running Counter},
 	how could you double the time required to overflow the global
 	\co{rcu_gp_ctr}?
 \QuickQuizAnswer{
@@ -1585,7 +1585,7 @@ overhead.

 \QuickQuiz{}
 	Again, given the algorithm shown in
-	Figure~\ref{fig:app:toyrcu:Nestable RCU Using a Free-Running Counter},
+	Listing~\ref{lst:app:toyrcu:Nestable RCU Using a Free-Running Counter},
 	is counter overflow fatal?
 	Why or why not?
 	If it is fatal, what can be done to fix it?
@@ -1675,7 +1675,7 @@ overhead.
 \section{RCU Based on Quiescent States}
 \label{sec:app:toyrcu:RCU Based on Quiescent States}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -1686,10 +1686,10 @@ overhead.
 \centering
 \theverbbox
 \caption{Data for Quiescent-State-Based RCU}
-\label{fig:app:toyrcu:Data for Quiescent-State-Based RCU}
-\end{figure}
+\label{lst:app:toyrcu:Data for Quiescent-State-Based RCU}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -1725,15 +1725,15 @@ overhead.
 \centering
 \theverbbox
 \caption{Quiescent-State-Based RCU Read Side}
-\label{fig:app:toyrcu:Quiescent-State-Based RCU Read Side}
-\end{figure}
+\label{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
+\end{listing}

-Figure~\ref{fig:app:toyrcu:Quiescent-State-Based RCU Read Side}
+Listing~\ref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
 (\path{rcu_qs.h})
 shows the read-side primitives used to construct a user-level
 implementation of RCU based on quiescent states, with the data shown in
-Figure~\ref{fig:app:toyrcu:Data for Quiescent-State-Based RCU}.
-As can be seen from lines~1-7 in the figure, the \co{rcu_read_lock()}
+Listing~\ref{lst:app:toyrcu:Data for Quiescent-State-Based RCU}.
+As can be seen from lines~1-7 in the listing, the \co{rcu_read_lock()}
 and \co{rcu_read_unlock()} primitives do nothing, and can in fact
 be expected to be inlined and optimized away, as they are in
 server builds of the Linux kernel.
@@ -1741,7 +1741,7 @@ This is due to the fact that quiescent-state-based RCU implementations
 \emph{approximate} the extents of RCU read-side critical sections
 using the aforementioned quiescent states.
 Each of these quiescent states contains a call to
-\co{rcu_quiescent_state()}, which is shown from lines~9-15 in the figure.
+\co{rcu_quiescent_state()}, which is shown from lines~9-15 in the listing.
 Threads entering extended quiescent states (for example, when blocking)
 may instead call \co{rcu_thread_offline()} (lines~17-23) when entering
 an extended quiescent state and then call
@@ -1751,7 +1751,7 @@ and \co{rcu_thread_offline()} is analogous to \co{rcu_read_unlock()}.
 In addition, \co{rcu_quiescent_state()} can be thought of as a
 \co{rcu_thread_online()} immediately followed by a
 \co{rcu_thread_offline()}.\footnote{
-	Although the code in the figure is consistent with
+	Although the code in the listing is consistent with
 	\co{rcu_quiescent_state()}
 	being the same as \co{rcu_thread_online()} immediately followed by
 	\co{rcu_thread_offline()}, this relationship is obscured by
@@ -1779,7 +1779,7 @@ re-ordered with the lines~12-13.

 \QuickQuiz{}
 	Doesn't the additional memory barrier shown on line~14 of
-	Figure~\ref{fig:app:toyrcu:Quiescent-State-Based RCU Read Side}
+	Listing~\ref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
 	greatly increase the overhead of \co{rcu_quiescent_state}?
 \QuickQuizAnswer{
 	Indeed it does!
@@ -1812,7 +1812,7 @@ ignore this thread.

 \QuickQuiz{}
 	Why are the two memory barriers on lines~19 and 22 of
-	Figure~\ref{fig:app:toyrcu:Quiescent-State-Based RCU Read Side}
+	Listing~\ref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
 	needed?
 \QuickQuizAnswer{
 	The memory barrier on line~19 prevents any RCU read-side
@@ -1828,7 +1828,7 @@ The \co{rcu_thread_online()} function simply invokes
 \co{rcu_quiescent_state()}, thus marking the end of the extended
 quiescent state.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void synchronize_rcu(void)
@@ -1854,10 +1854,10 @@ quiescent state.
 \centering
 \theverbbox
 \caption{RCU Update Side Using Quiescent States}
-\label{fig:app:toyrcu:RCU Update Side Using Quiescent States}
-\end{figure}
+\label{lst:app:toyrcu:RCU Update Side Using Quiescent States}
+\end{listing}

-Figure~\ref{fig:app:toyrcu:RCU Update Side Using Quiescent States}
+Listing~\ref{lst:app:toyrcu:RCU Update Side Using Quiescent States}
 (\path{rcu_qs.c})
 shows the implementation of \co{synchronize_rcu()}, which is
 quite similar to that of the preceding sections.
@@ -1895,8 +1895,8 @@ certain types of library functions.
 	Why would the fact that the code is in a library make
 	any difference for how easy it is to use the RCU
 	implementation shown in
-	Figures~\ref{fig:app:toyrcu:Quiescent-State-Based RCU Read Side} and
-	\ref{fig:app:toyrcu:RCU Update Side Using Quiescent States}?
+	Listings~\ref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side} and
+	\ref{lst:app:toyrcu:RCU Update Side Using Quiescent States}?
 \QuickQuizAnswer{
 	A library function has absolutely no control over the caller,
 	and thus cannot force the caller to invoke \co{rcu_quiescent_state()}
-- 
2.7.4


