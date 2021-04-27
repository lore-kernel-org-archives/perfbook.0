Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q3L7hQxvOV66TI94agGl/1OPpIzOz6Yk4ZshLo/PKZc=;
        b=jtjWwpjnXa1R5JsfkbBvb5M6TP0zyt7pHxm1/OqYuZrwxD3oZzDPEznu4yUCL6mAnv
         lgiWpXtVZWRJEoFYV5G+ce1LJtbG1jkoTDfq6bmlK3fyA3czwv+o4TmyOCy2KtCdgg01
         2jVT3c5Urx+yBXPXJ3TQ5YMxXBS8xoxhwZwEW3e3SJZP8cV8JpPpVL61KnA3lAgcv1GG
         MoJTkwuyIh/ebSiDQeFcR6h7O5PWA8sm+c4UQAoIDrMYz3GKfL5YHd9tth/qAnTc5FWu
         I/oAk14eTgTIKunns9owHFnNCFv/Zq3cspZfWl12v/8oGYuUsCgCI9GPN9wXOaM8TVpl
         iQkw==
Subject: [PATCH -perfbook v2 6/9] treewide: Make end-of-sentence periods be at
 end of lines
References: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7431a474-893e-bec2-ab76-a8b5a4fd62f3@gmail.com>
Date: Wed, 28 Apr 2021 00:29:24 +0900
MIME-Version: 1.0
In-Reply-To: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex              |  36 +++---
 SMPdesign/beyond.tex                 |   3 +-
 SMPdesign/criteria.tex               |   4 +-
 advsync/rt.tex                       |   5 +-
 appendix/whymb/whymemorybarriers.tex |  71 ++++++-----
 count/count.tex                      |  11 +-
 datastruct/datastruct.tex            |  15 ++-
 debugging/debugging.tex              |  12 +-
 defer/defer.tex                      |   4 +-
 defer/hazptr.tex                     |   7 +-
 defer/rcufundamental.tex             |   5 +-
 easy/easy.tex                        |   3 +-
 formal/dyntickrcu.tex                |  15 ++-
 formal/ppcmem.tex                    | 180 ++++++++++++++-------------
 formal/spinhint.tex                  | 148 ++++++++++++----------
 glossary.tex                         |   9 +-
 intro/intro.tex                      |  27 ++--
 legal.tex                            |   9 +-
 locking/locking.tex                  |   3 +-
 memorder/memorder.tex                |  12 +-
 owned/owned.tex                      |   5 +-
 together/refcnt.tex                  |   4 +-
 toolsoftrade/toolsoftrade.tex        |   3 +-
 23 files changed, 332 insertions(+), 259 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 5cc566a9..7d392a84 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -174,9 +174,9 @@ global locks.\footnote{
 	in Section~\ref{sec:SMPdesign:Data Locking}.}
 It is especially
 easy to retrofit an existing program to use code locking in
-order to run it on a multiprocessor.  If the program has
-only a single shared resource, code locking will even give
-optimal performance.
+order to run it on a multiprocessor.
+If the program has only a single shared resource, code locking
+will even give optimal performance.
 However, many of the larger and more complex programs
 require much of the execution to
 occur in \IXpl{critical section}, which in turn causes code locking
@@ -184,9 +184,9 @@ to sharply limits their scalability.
 
 Therefore, you should use code locking on programs that spend
 only a small fraction of their execution time in critical sections or
-from which only modest scaling is required.  In these cases,
-code locking will provide a relatively simple program that is
-very similar to its sequential counterpart,
+from which only modest scaling is required.
+In these cases, code locking will provide a relatively simple
+program that is very similar to its sequential counterpart,
 as can be seen in
 Listing~\ref{lst:SMPdesign:Code-Locking Hash Table Search}.
 However, note that the simple return of the comparison in
@@ -498,11 +498,13 @@ Data ownership might seem arcane, but it is used very frequently:
 	(such as {\tt auto} variables in C
 	and C++) are owned by that CPU or process.
 \item	An instance of a user interface owns the corresponding
-	user's context.  It is very common for applications
-	interacting with parallel database engines to be
-	written as if they were entirely sequential programs.
+	user's context.
+	It is very common for applications interacting with parallel
+	database engines to be written as if they were entirely
+	sequential programs.
 	Such applications own the user interface and his current
-	action.  Explicit parallelism is thus confined to the
+	action.
+	Explicit parallelism is thus confined to the
 	database engine itself.
 \item	Parametric simulations are often trivially parallelized
 	by granting each thread ownership of a particular region
@@ -777,8 +779,9 @@ parallelize the common-case code path without incurring the complexity
 that would be required to aggressively parallelize the entire algorithm.
 You must understand not only the specific algorithm you wish
 to parallelize, but also the workload that the algorithm will
-be subjected to.  Great creativity and design
-effort is often required to construct a parallel fastpath.
+be subjected to.
+Great creativity and design effort is often required to construct
+a parallel fastpath.
 
 Parallel fastpath combines different patterns (one for the
 fastpath, one elsewhere) and is therefore a template pattern.
@@ -1200,8 +1203,8 @@ this book.
 	\begin{description}
 	\item[$g$]	Number of blocks globally available.
 	\item[$i$]	Number of blocks left in the initializing thread's
-			per-thread pool.  (This is one reason you needed
-			to look at the code!)
+			per-thread pool.
+			(This is one reason you needed to look at the code!)
 	\item[$m$]	Allocation/free run length.
 	\item[$n$]	Number of threads, excluding the initialization thread.
 	\item[$p$]	Per-thread maximum block consumption, including
@@ -1209,8 +1212,9 @@ this book.
 			remaining in the per-thread pool.
 	\end{description}
 
-	The values $g$, $m$, and $n$ are given.  The value for $p$ is
-	$m$ rounded up to the next multiple of $s$, as follows:
+	The values $g$, $m$, and $n$ are given.
+	The value for $p$ is $m$ rounded up to the next multiple of $s$,
+	as follows:
 
 	\begin{equation}
 		p = s \left \lceil \frac{m}{s} \right \rceil
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index e308f1d5..bd0fe6f1 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -159,7 +159,8 @@ line~\lnref{recordnext} records this cell in the next
 slot of the \co{->visited[]} array,
 line~\lnref{next:visited} indicates that this slot
 is now full, and line~\lnref{mark:visited} marks this cell as visited and also records
-the distance from the maze start.  Line~\lnref{ret:success} then returns success.
+the distance from the maze start.
+Line~\lnref{ret:success} then returns success.
 \end{fcvref}
 
 \begin{fcvref}[ln:SMPdesign:SEQ Helper Pseudocode:find]
diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
index 0e581f15..915454e1 100644
--- a/SMPdesign/criteria.tex
+++ b/SMPdesign/criteria.tex
@@ -141,8 +141,8 @@ parallel program.
 	most-restrictive exclusive-lock critical section.
 \item	Contention effects consume the excess CPU and/or
 	wallclock time when the actual speedup is less than
-	the number of available CPUs.  The
-	larger the gap between the number of CPUs
+	the number of available CPUs.
+	The larger the gap between the number of CPUs
 	and the actual speedup, the less efficiently the
 	CPUs will be used.
 	Similarly, the greater the desired efficiency, the smaller
diff --git a/advsync/rt.tex b/advsync/rt.tex
index 71ab0661..e939a029 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1149,8 +1149,9 @@ priority-inversion conundrum:
 
 \begin{enumerate}
 \item	Only allow one read-acquisition of a given reader-writer lock
-	at a time.  (This is the approach traditionally taken by
-	the Linux kernel's \rt\ patchset.)
+	at a time.
+	(This is the approach traditionally taken by the Linux
+	kernel's \rt\ patchset.)
 \item	Only allow $N$ read-acquisitions of a given reader-writer lock
 	at a time, where $N$ is the number of CPUs.
 \item	Only allow $N$ read-acquisitions of a given reader-writer lock
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 7ec718bb..ea9fd14b 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -403,7 +403,8 @@ levels of the system architecture.
 	responses totally saturate the system bus?
 }\QuickQuizAnswerM{
 	It might, if large-scale multiprocessors were in fact implemented
-	that way.  Larger multiprocessors, particularly NUMA machines,
+	that way.
+	Larger multiprocessors, particularly NUMA machines,
 	tend to use so-called ``directory-based'' cache-coherence
 	protocols to avoid this and other problems.
 }\QuickQuizEndM
@@ -413,15 +414,18 @@ levels of the system architecture.
 	anyway, why bother with SMP at all?
 }\QuickQuizAnswerE{
 	There has been quite a bit of controversy on this topic over
-	the past few decades.  One answer is that the cache-coherence
+	the past few decades.
+	One answer is that the cache-coherence
 	protocols are quite simple, and therefore can be implemented
 	directly in hardware, gaining bandwidths and latencies
-	unattainable by software message passing.  Another answer is that
+	unattainable by software message passing.
+	Another answer is that
 	the real truth is to be found in economics due to the relative
 	prices of large SMP machines and that of clusters of smaller
-	SMP machines.  A third answer is that the SMP programming
-	model is easier to use than that of distributed systems, but
-	a rebuttal might note the appearance of HPC clusters and MPI\@.
+	SMP machines.
+	A third answer is that the SMP programming model is easier to
+	use than that of distributed systems, but a rebuttal might note
+	the appearance of HPC clusters and MPI\@.
 	And so the argument continues.
 }\QuickQuizEndE
 }
@@ -784,9 +788,10 @@ Suppose further that the cache line containing ``a'' resides only in CPU~1's
 cache, and that the cache line containing ``b'' is owned by CPU~0.
 Then the sequence of operations might be as follows:
 \begin{sequence}
-\item	CPU~0 executes \co{a = 1}.  The cache line is not in
-	CPU~0's cache, so CPU~0 places the new value of ``a'' in its
-	store buffer and transmits a ``read invalidate'' message.
+\item	CPU~0 executes \co{a = 1}.
+	The cache line is not in CPU~0's cache, so CPU~0 places the new
+	value of ``a'' in its store buffer and transmits a ``read
+	invalidate'' message.
 	\label{seq:app:whymb:Store Buffers and Memory Barriers}
 \item	CPU~1 executes \co{while (b == 0) continue}, but the cache line
 	containing ``b'' is not in its cache.
@@ -853,9 +858,10 @@ applied.
 
 With this latter approach the sequence of operations might be as follows:
 \begin{sequence}
-\item	CPU~0 executes \co{a = 1}.  The cache line is not in
-	CPU~0's cache, so CPU~0 places the new value of ``a'' in its
-	store buffer and transmits a ``read invalidate'' message.
+\item	CPU~0 executes \co{a = 1}.
+	The cache line is not in CPU~0's cache, so CPU~0 places the new
+	value of ``a'' in its store buffer and transmits a ``read
+	invalidate'' message.
 \item	CPU~1 executes \co{while (b == 0) continue}, but the cache line
 	containing ``b'' is not in its cache.
 	It therefore transmits a ``read'' message.
@@ -1045,11 +1051,11 @@ void bar(void)
 Then the sequence of operations might be as follows:
 \begin{fcvref}[ln:app:whymb:Breaking mb]
 \begin{sequence}
-\item	CPU~0 executes \co{a = 1}.  The corresponding
-	cache line is read-only in
-	CPU~0's cache, so CPU~0 places the new value of ``a'' in its
-	store buffer and transmits an ``invalidate'' message in order
-	to flush the corresponding cache line from CPU~1's cache.
+\item	CPU~0 executes \co{a = 1}.
+	The corresponding cache line is read-only in CPU~0's cache, so
+	CPU~0 places the new value of ``a'' in its store buffer and
+	transmits an ``invalidate'' message in order to flush the
+	corresponding cache line from CPU~1's cache.
 	\label{seq:app:whymb:Invalidate Queues and Memory Barriers}
 \item	CPU~1 executes \co{while (b == 0) continue}, but the cache line
 	containing ``b'' is not in its cache.
@@ -1186,11 +1192,11 @@ void bar(void)
 \begin{fcvref}[ln:app:whymb:Add mb]
 With this change, the sequence of operations might be as follows:
 \begin{sequence}
-\item	CPU~0 executes \co{a = 1}.  The corresponding
-	cache line is read-only in
-	CPU~0's cache, so CPU~0 places the new value of ``a'' in its
-	store buffer and transmits an ``invalidate'' message in order
-	to flush the corresponding cache line from CPU~1's cache.
+\item	CPU~0 executes \co{a = 1}.
+	The corresponding cache line is read-only in CPU~0's cache,
+	so CPU~0 places the new value of ``a'' in its store buffer and
+	transmits an ``invalidate'' message in order to flush the
+	corresponding cache line from CPU~1's cache.
 \item	CPU~1 executes \co{while (b == 0) continue}, but the cache line
 	containing ``b'' is not in its cache.
 	It therefore transmits a ``read'' message.
@@ -1335,15 +1341,17 @@ constraints~\cite{PaulMcKenney2005i,PaulMcKenney2005j}:
 	its own memory accesses in order?
 	Why or why not?
 }\QuickQuizAnswer{
-	No.  Consider the case where a thread migrates from one CPU to
+	No.
+	Consider the case where a thread migrates from one CPU to
 	another, and where the destination CPU perceives the source
-	CPU's recent memory operations out of order.  To preserve
-	user-mode sanity, kernel hackers must use memory barriers in
-	the context-switch path.  However, the locking already required
-	to safely do a context switch should automatically provide
-	the memory barriers needed to cause the user-level task to see
-	its own accesses in order.  That said, if you are designing a
-	super-optimized scheduler, either in the kernel or at user level,
+	CPU's recent memory operations out of order.
+	To preserve user-mode sanity, kernel hackers must use memory
+	barriers in the context-switch path.
+	However, the locking already required to safely do a context
+	switch should automatically provide the memory barriers needed
+	to cause the user-level task to see its own accesses in order.
+        That said, if you are designing a super-optimized scheduler,
+	either in the kernel or at user level,
 	please keep this scenario in mind!
 }\QuickQuizEnd
 
@@ -1422,7 +1430,8 @@ the assertion.
 	between CPU~1's ``while'' and assignment to ``c''?
 	Why or why not?
 }\QuickQuizAnswer{
-	No.  Such a memory barrier would only force ordering local to CPU~1.
+	No.
+	Such a memory barrier would only force ordering local to CPU~1.
 	It would have no effect on the relative ordering of CPU~0's and
 	CPU~1's accesses, so the assertion could still fail.
 	However, all mainstream computer systems provide one mechanism
diff --git a/count/count.tex b/count/count.tex
index b89a566c..b69515a1 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -33,7 +33,7 @@ counting.
 }\EQuickQuizEnd
 
 \EQuickQuiz{
-	{ \bfseries Network-packet counting problem. }
+	{\bfseries Network-packet counting problem.}
 	Suppose that you need to collect statistics on the number
 	of networking packets transmitted and received.
 	Packets might be transmitted or received by any CPU on the system.
@@ -62,7 +62,7 @@ counting.
 \QuickQuizLabel{\QcountQstatcnt}
 
 \EQuickQuiz{
-	{ \bfseries Approximate structure-allocation limit problem. }
+	{\bfseries Approximate structure-allocation limit problem.}
 	Suppose that you need to maintain a count of the number of
 	structures allocated in order to fail any allocations
 	once the number of structures in use exceeds a limit
@@ -84,7 +84,7 @@ counting.
 \QuickQuizLabel{\QcountQapproxcnt}
 
 \EQuickQuiz{
-	{ \bfseries Exact structure-allocation limit problem. }
+	{\bfseries Exact structure-allocation limit problem.}
 	Suppose that you need to maintain a count of the number of
 	structures allocated in order to fail any allocations
 	once the number of structures in use exceeds an exact limit
@@ -111,7 +111,7 @@ counting.
 \QuickQuizLabel{\QcountQexactcnt}
 
 \EQuickQuiz{
-	{ \bfseries Removable I/O device access-count problem. }
+	{\bfseries Removable I/O device access-count problem.}
 	Suppose that you need to maintain a reference count on a
 	heavily used removable mass-storage device, so that you
 	can tell the user when it is safe to remove the device.
@@ -1829,7 +1829,8 @@ with exact limits.
 \section{Exact Limit Counters}
 \label{sec:count:Exact Limit Counters}
 %
-\epigraph{Exactitude can be expensive.  Spend wisely.}{\emph{Unknown}}
+\epigraph{Exactitude can be expensive.
+	  Spend wisely.}{\emph{Unknown}}
 
 To solve the exact structure-allocation limit problem noted in
 \QuickQuizRef{\QcountQexactcnt},
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 26d5c556..6e18fda9 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -4,8 +4,9 @@
 
 \QuickQuizChapter{chp:Data Structures}{Data Structures}{qqzdatastruct}
 %
-\Epigraph{Bad programmers worry about the code. Good programmers worry
-	  about data structures and their relationships.}
+\Epigraph{Bad programmers worry about the code.
+	  Good programmers worry about data structures and their
+          relationships.}
 	 {\emph{Linus Torvalds}}
 
 Serious discussions of algorithms include time complexity of their
@@ -124,9 +125,10 @@ permitting a hash table to access its elements extremely efficiently.
 
 In addition, each bucket has its own lock, so that elements in different
 buckets of the hash table may be added, deleted, and looked up completely
-independently.  A large hash table with a large number of buckets (and
-thus locks), with each bucket containing a small number of elements
-should therefore provide excellent scalability.
+independently.
+A large hash table with a large number of buckets (and thus locks), with
+each bucket containing a small number of elements should therefore provide
+excellent scalability.
 
 \subsection{Hash-Table Implementation}
 \label{sec:datastruct:Hash-Table Implementation}
@@ -1806,7 +1808,8 @@ library~\cite{MathieuDesnoyers2009URCU}.
 \section{Other Data Structures}
 \label{sec:datastruct:Other Data Structures}
 %
-\epigraph{All life is an experiment.  The more experiments you make the better.}
+\epigraph{All life is an experiment.
+	  The more experiments you make the better.}
 	 {\emph{Ralph Waldo Emerson}}
 
 The preceding sections have focused on data structures that enhance
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 9d6e7c36..4c77453d 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -635,7 +635,8 @@ you already have a good test suite.
 \section{Tracing}
 \label{sec:debugging:Tracing}
 %
-\epigraph{The machine knows what is wrong.  Make it tell you.}{\emph{Unknown}}
+\epigraph{The machine knows what is wrong.
+	  Make it tell you.}{\emph{Unknown}}
 
 When all else fails, add a \co{printk()}!
 Or a \co{printf()}, if you are working with user-mode C-language applications.
@@ -2524,9 +2525,9 @@ This script takes three optional arguments as follows:
 	into, for example, a divisor of four means that the first quarter of
 	the data elements will be assumed to be good.
 	This defaults to three.
-\item	[\lopt{relerr}\nf{:}] Relative measurement error.  The script
-	assumes that values that differ by less than this error are for all
-	intents and purposes equal.
+\item	[\lopt{relerr}\nf{:}] Relative measurement error.
+	The script assumes that values that differ by less than this
+        error are for all intents and purposes equal.
 	This defaults to 0.01, which is equivalent to 1\,\%.
 \item	[\lopt{trendbreak}\nf{:}] Ratio of inter-element spacing
 	constituting a break in the trend of the data.
@@ -2720,7 +2721,8 @@ In short, validation always will require some measure of the behavior of
 the system.
 To be at all useful, this measure must be a severe summarization of the
 system, which in turn means that it can be misleading.
-So as the saying goes, ``Be careful.  It is a real world out there.''
+So as the saying goes, ``Be careful.
+It is a real world out there.''
 
 But what if you are working on the Linux kernel, which as of 2017 was
 estimated to have more than 20 billion instances running throughout
diff --git a/defer/defer.tex b/defer/defer.tex
index 2d049cfe..3fecc2ac 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -7,8 +7,8 @@
 \Epigraph{All things come to those who wait.}{\emph{Violet Fane}}
 
 The strategy of deferring work goes back before the dawn of recorded
-history. It has occasionally been derided as procrastination or
-even as sheer laziness.
+history.
+It has occasionally been derided as procrastination or even as sheer laziness.
 However, in the last few decades workers have recognized this strategy's value
 in simplifying and streamlining parallel algorithms~\cite{Kung80,HMassalinPhD}.
 Believe it or not, ``laziness'' in parallel programming often outperforms and
diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index e9264fb7..7c7dd831 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -214,9 +214,10 @@ Otherwise, the element's \co{->iface} field is returned to the caller.
 Note that line~\lnref{tryrecord} invokes \co{hp_try_record()} rather
 than the easier-to-use \co{hp_record()}, restarting the full search
 upon \co{hp_try_record()} failure.
-And such restarting is absolutely required for correctness.  To see this,
-consider a hazard-pointer-protected linked list containing elements~A,
-B, and~C that is subjected to the following sequence of events:
+And such restarting is absolutely required for correctness.
+To see this, consider a hazard-pointer-protected linked list
+containing elements~A, B, and~C that is subjected to the following
+sequence of events:
 \end{fcvref}
 
 \begin{enumerate}
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 6ff1bd6b..00b80d63 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -265,8 +265,9 @@ In the figure, \co{P0()}'s access to \co{y} follows \co{P1()}'s access
 to this same variable, and thus follows the grace period generated by
 \co{P1()}'s call to \co{synchronize_rcu()}.
 It is therefore guaranteed that \co{P0()}'s access to \co{x} will follow
-\co{P1()}'s access.  In this case, if \co{r2}'s final value is 1, then
-\co{r1}'s final value is guaranteed to also be 1.
+\co{P1()}'s access.
+In this case, if \co{r2}'s final value is 1, then \co{r1}'s final value
+is guaranteed to also be 1.
 
 \QuickQuiz{
 	What would happen if the order of \co{P0()}'s two accesses was
diff --git a/easy/easy.tex b/easy/easy.tex
index 50a616cc..1ac5b419 100644
--- a/easy/easy.tex
+++ b/easy/easy.tex
@@ -60,7 +60,8 @@ things are covered in the next section.
 \label{sec:easy:Rusty Scale for API Design}
 %
 \epigraph{Finding the appropriate measurement is thus not a mathematical
-	  exercise.  It is a risk-taking judgment.}
+	  exercise.
+	  It is a risk-taking judgment.}
 	 {\emph{Peter Drucker}}
 % http://billhennessy.com/simple-strategies/2015/09/09/i-wish-drucker-never-said-it
 % Rusty is OK with this: July 19, 2006.
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 98bdaf95..ea534b10 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -731,8 +731,9 @@ for the first condition:
 	and didn't take any interrupts, NMIs, SMIs, or whatever,
 	then it cannot be in the middle of an \co{rcu_read_lock()}, so
 	the next \co{rcu_read_lock()} it executes must use the new value
-	of the counter.  So we can safely pretend that this CPU
-	already acknowledged the counter.
+	of the counter.
+	So we can safely pretend that this CPU already acknowledged
+	the counter.
 \end{quote}
 
 The first condition does match this, because if \qco{curr == snap}
@@ -1104,7 +1105,8 @@ states, passing without errors.
 
 	\begin{quote}
 		Debugging is twice as hard as writing the code in the first
-		place. Therefore, if you write the code as cleverly as possible,
+		place.
+		Therefore, if you write the code as cleverly as possible,
 		you are, by definition, not smart enough to debug it.
 	\end{quote}
 
@@ -1161,9 +1163,10 @@ This effort provided some lessons (re)learned:
 
 \item	{\bf Always verify your verification code.}
 	The usual way to do this is to insert a deliberate bug
-	and verify that the verification code catches it.  Of course,
-	if the verification code fails to catch this bug, you may also
-	need to verify the bug itself, and so on, recursing infinitely.
+	and verify that the verification code catches it.
+	Of course, if the verification code fails to catch this bug,
+	you may also need to verify the bug itself, and so on,
+	recursing infinitely.
 	However, if you find yourself in this position,
 	getting a good night's sleep
 	can be an extremely effective debugging technique.
diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 95be861a..019d0161 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -99,30 +99,33 @@ exists						@lnlbl[assert:b]
 
 \begin{fcvref}[ln:formal:PPCMEM Litmus Test]
 In the example, \clnref{type} identifies the type of system (``ARM'' or
-``PPC'') and contains the title for the model. \Clnref{altname}
-provides a place for an
+``PPC'') and contains the title for the model.
+\Clnref{altname} provides a place for an
 alternative name for the test, which you will usually want to leave
-blank as shown in the above example. Comments can be inserted between
+blank as shown in the above example.
+Comments can be inserted between
 \clnref{altname,init:b} using the OCaml (or Pascal) syntax of \nbco{(* *)}.
 
 \Clnrefrange{init:b}{init:e} give initial values for all registers;
 each is of the form
 \co{P:R=V}, where \co{P} is the process identifier, \co{R} is the register
-identifier, and \co{V} is the value. For example, process 0's register
-r3 initially contains the value 2. If the value is a variable (\co{x},
-\co{y}, or \co{z} in the example) then the register is initialized to the
-address of the variable. It is also possible to initialize the contents
-of variables, for example, \co{x=1} initializes the value of \co{x} to
-1. Uninitialized variables default to the value zero, so that in the
+identifier, and \co{V} is the value.
+For example, process 0's register r3 initially contains the value~2.
+If the value is a variable (\co{x}, \co{y}, or \co{z} in the example)
+then the register is initialized to the address of the variable.
+It is also possible to initialize the contents of variables, for example,
+\co{x=1} initializes the value of \co{x} to~1.
+Uninitialized variables default to the value zero, so that in the
 example, \co{x}, \co{y}, and \co{z} are all initially zero.
 
 \Clnref{procid} provides identifiers for the two processes, so that
 the \co{0:r3=2} on \clnref{init:0} could instead have been written
-\co{P0:r3=2}. \Clnref{procid} is
-required, and the identifiers must be of the form \co{Pn}, where \co{n}
-is the column number, starting from zero for the left-most column. This
-may seem unnecessarily strict, but it does prevent considerable confusion
-in actual use.
+\co{P0:r3=2}.
+\Clnref{procid} is required, and the identifiers must be of the form
+\co{Pn}, where \co{n} is the column number, starting from zero for
+the left-most column.
+This may seem unnecessarily strict, but it does prevent considerable
+confusion in actual use.
 \end{fcvref}
 
 \QuickQuiz{
@@ -149,23 +152,23 @@ A given process can have empty lines, as is the case for P0's
 \clnref{P0empty} and P1's \clnrefrange{P1empty:b}{P1empty:e}.
 Labels and branches are permitted, as demonstrated by the branch
 on \clnref{P0bne} to the label on \clnref{P0fail1}.
-That said, too-free use of branches
-will expand the state space. Use of loops is a particularly good way to
-explode your state space.
+That said, too-free use of branches will expand the state space.
+Use of loops is a particularly good way to explode your state space.
 
 \Clnrefrange{assert:b}{assert:e} show the assertion, which in this case
-indicates that we
-are interested in whether P0's and P1's r3 registers can both contain
-zero after both threads complete execution. This assertion is important
-because there are a number of use cases that would fail miserably if
-both P0 and P1 saw zero in their respective r3 registers.
-
-This should give you enough information to construct simple litmus
-tests. Some additional documentation is available, though much of this
+indicates that we are interested in whether P0's and P1's r3 registers
+can both contain zero after both threads complete execution.
+This assertion is important because there are a number of use cases
+that would fail miserably if both P0 and P1 saw zero in their
+respective r3 registers.
+
+This should give you enough information to construct simple litmus tests.
+Some additional documentation is available, though much of this
 additional documentation is intended for a different research tool that
-runs tests on actual hardware. Perhaps more importantly, a large number of
-pre-existing litmus tests are available with the online tool (available
-via the ``Select ARM Test'' and ``Select POWER Test'' buttons at
+runs tests on actual hardware.
+Perhaps more importantly, a large number of pre-existing litmus tests
+are available with the online tool (available via the ``Select ARM Test''
+and ``Select POWER Test'' buttons at
 \url{https://www.cl.cam.ac.uk/~pes20/ppcmem/}).
 It is quite likely that one of these pre-existing litmus tests will
 answer your Power or \ARM\ memory-ordering question.
@@ -175,17 +178,18 @@ answer your Power or \ARM\ memory-ordering question.
 
 P0's \clnref{reginit,stw} are equivalent to the C statement \co{x=1}
 because \clnref{init:0} defines P0's register \co{r2} to be the address
-of \co{x}. P0's \clnref{P0lwarx,P0stwcx} are the mnemonics for
-load-linked (``load register
-exclusive'' in \ARM\ parlance and ``load reserve'' in Power parlance)
-and store-conditional (``store register exclusive'' in \ARM\ parlance),
-respectively. When these are used together, they form an atomic
-instruction sequence, roughly similar to the \IXacrml{cas} sequences
-exemplified by the x86 \co{lock;cmpxchg} instruction. Moving to a higher
-level of abstraction, the sequence from \clnrefrange{P0lwsync}{P0isync}
+of~\co{x}.
+P0's \clnref{P0lwarx,P0stwcx} are the mnemonics for load-linked
+(``load register exclusive'' in \ARM\ parlance and ``load reserve''
+in Power parlance) and store-conditional (``store register exclusive''
+in \ARM\ parlance), respectively.
+When these are used together, they form an atomic instruction sequence,
+roughly similar to the \IXacrml{cas} sequences exemplified by the
+x86 \co{lock;cmpxchg} instruction.
+Moving to a higher level of abstraction, the sequence from
+\clnrefrange{P0lwsync}{P0isync}
 is equivalent to the Linux kernel's \co{atomic_add_return(&z, 0)}.
-Finally, \clnref{P0lwz} is
-roughly equivalent to the C statement \co{r3=y}.
+Finally, \clnref{P0lwz} is roughly equivalent to the C statement \co{r3=y}.
 
 P1's \clnref{reginit,stw} are equivalent to the C statement \co{y=1},
 \clnref{P1sync}
@@ -203,11 +207,11 @@ and \clnref{P1lwz} is equivalent to the C statement \co{r3=x}.
 	The implementation of powerpc version of \co{atomic_add_return()}
 	loops when the \co{stwcx} instruction fails, which it communicates
 	by setting non-zero status in the condition-code register,
-	which in turn is tested by the \co{bne} instruction. Because actually
-	modeling the loop would result in state-space explosion, we
-	instead branch to the Fail: label, terminating the model with
-	the initial value of 2 in P0's \co{r3} register, which
-	will not trigger the exists assertion.
+	which in turn is tested by the \co{bne} instruction.
+	Because actually modeling the loop would result in state-space
+	explosion, we instead branch to the \co{Fail:} label,
+	terminating the model with the initial value of~2 in P0's \co{r3}
+        register, which will not trigger the exists assertion.
 
 	There is some debate about whether this trick is universally
 	applicable, but I have not seen an example where it fails.
@@ -369,38 +373,42 @@ cannot happen.
 \label{sec:formal:PPCMEM Discussion}
 
 These tools promise to be of great help to people working on low-level
-parallel primitives that run on \ARM\ and on Power. These tools do have
-some intrinsic limitations:
+parallel primitives that run on \ARM\ and on Power.
+These tools do have some intrinsic limitations:
 
 \begin{enumerate}
 \item	These tools are research prototypes, and as such are unsupported.
 \item	These tools do not constitute official statements by IBM or \ARM\
-	on their respective CPU architectures. For example, both
-	corporations reserve the right to report a bug at any time against
-	any version of any of these tools. These tools are therefore not a
-	substitute for careful stress testing on real hardware. Moreover,
-	both the tools and the model that they are based on are under
-	active development and might change at any time. On the other
-	hand, this model was developed in consultation with the relevant
-	hardware experts, so there is good reason to be confident that
-	it is a robust representation of the architectures.
+	on their respective CPU architectures.
+	For example, both corporations reserve the right to report a bug
+	at any time against any version of any of these tools.
+	These tools are therefore not a substitute for careful stress
+	testing on real hardware.
+	Moreover, both the tools and the model that they are based on
+	are under active development and might change at any time.
+	On the other hand, this model was developed in consultation
+	with the relevant hardware experts, so there is good reason to be
+	confident that it is a robust representation of the architectures.
 \item	These tools currently handle a subset of the instruction set.
 	This subset has been sufficient for my purposes, but your mileage
-	may vary. In particular, the tool handles only word-sized accesses
-	(32 bits), and the words accessed must be properly aligned.\footnote{
+	may vary.
+	In particular, the tool handles only word-sized accesses (32 bits),
+	and the words accessed must be properly aligned.\footnote{
 		But recent work focuses on mixed-size
 		accesses~\cite{Flur:2017:MCA:3093333.3009839}.}
 	In addition, the tool does not handle some of the weaker variants
 	of the \ARM\ memory-barrier instructions, nor does it handle
 	arithmetic.
 \item	The tools are restricted to small loop-free code fragments
-	running on small numbers of threads. Larger examples result
+	running on small numbers of threads.
+	Larger examples result
 	in state-space explosion, just as with similar tools such as
 	Promela and spin.
 \item	The full state-space search does not give any indication of how
-	each offending state was reached. That said, once you realize
-	that the state is in fact reachable, it is usually not too hard
-	to find that state using the interactive tool.
+	each offending state was reached.
+	That said, once you realize that the state is in fact reachable,
+	it is usually not too hard to find that state using the
+	interactive tool.
 \item	These tools are not much good for complex data structures, although
 	it is possible to create and traverse extremely simple linked
 	lists using initialization statements of the form
@@ -409,42 +417,46 @@ some intrinsic limitations:
 	Of course, handling such things would require that they be
 	formalized, which does not appear to be in the offing.
 \item	The tools will detect only those problems for which you code an
-	assertion. This weakness is common to all formal methods, and
-	is yet another reason why testing remains important. In the
-	immortal words of Donald Knuth quoted at the beginning of this
-	chapter, ``Beware of bugs in the above
-	code; I have only proved it correct, not tried it.''
+	assertion.
+	This weakness is common to all formal methods, and is yet another
+	reason why testing remains important.
+	In the immortal words of Donald Knuth quoted at the beginning of
+	this chapter, ``Beware of bugs in the above code;
+	I have only proved it correct, not tried it.''
 \end{enumerate}
 
 That said, one strength of these tools is that they are designed to
 model the full range of behaviors allowed by the architectures, including
 behaviors that are legal, but which current hardware implementations do
-not yet inflict on unwary software developers. Therefore, an algorithm
-that is vetted by these tools likely has some additional safety margin
-when running on real hardware. Furthermore, testing on real hardware can
-only find bugs; such testing is inherently incapable of proving a given
-usage correct. To appreciate this, consider that the researchers
-routinely ran in excess of 100 billion test runs on real hardware to
-validate their model.
+not yet inflict on unwary software developers.
+Therefore, an algorithm that is vetted by these tools likely has some
+additional safety margin when running on real hardware.
+Furthermore, testing on real hardware can only find bugs; such testing
+is inherently incapable of proving a given usage correct.
+To appreciate this, consider that the researchers routinely ran in excess
+of 100 billion test runs on real hardware to validate their model.
 In one case, behavior that is allowed by the architecture did not occur,
 despite 176 billion runs~\cite{JadeAlglave2011ppcmem}.
 In contrast, the
 full-state-space search allows the tool to prove code fragments correct.
 
 It is worth repeating that formal methods and tools are no substitute for
-testing. The fact is that producing large reliable concurrent software
-artifacts, the Linux kernel for example, is quite difficult. Developers
-must therefore be prepared to apply every tool at their disposal towards
-this goal. The tools presented in this chapter are able to locate bugs that
-are quite difficult to produce (let alone track down) via testing. On the
-other hand, testing can be applied to far larger bodies of software than
-the tools presented in this chapter are ever likely to handle. As always,
-use the right tools for the job!
+testing.
+The fact is that producing large reliable concurrent software artifacts,
+the Linux kernel for example, is quite difficult.
+Developers must therefore be prepared to apply every tool at their
+disposal towards this goal.
+The tools presented in this chapter are able to locate bugs that are
+quite difficult to produce (let alone track down) via testing.
+On the other hand, testing can be applied to far larger bodies of software
+than the tools presented in this chapter are ever likely to handle.
+As always, use the right tools for the job!
 
 Of course, it is always best to avoid the need to work at this level
 by designing your parallel code to be easily partitioned and then
 using higher-level primitives (such as locks, sequence counters, atomic
-operations, and RCU) to get your job done more straightforwardly. And even
-if you absolutely must use low-level memory barriers and read-modify-write
-instructions to get your job done, the more conservative your use of
-these sharp instruments, the easier your life is likely to be.
+operations, and RCU) to get your job done more straightforwardly.
+And even if you absolutely must use low-level memory barriers and
+read-modify-write instructions to get your job done, the more
+conservative your use of these sharp instruments, the easier your life
+is likely to be.
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 305a7014..d05bab16 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -244,12 +244,13 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 \item	[\tco{spin -a qrcu.spin}]
 	Create a file \path{pan.c} that fully searches the state machine.
 \item	[\tco{cc -DSAFETY [-DCOLLAPSE] [-DMA=N] -o pan pan.c}]
-	Compile the generated state-machine search.  The \co{-DSAFETY}
-	generates optimizations that are appropriate if you have only
-	assertions (and perhaps \co{never} statements).  If you have
-	liveness, fairness, or forward-progress checks, you may need
-	to compile without \co{-DSAFETY}.  If you leave off \co{-DSAFETY}
-	when you could have used it, the program will let you know.
+	Compile the generated state-machine search.
+	The \co{-DSAFETY} generates optimizations that are appropriate
+        if you have only assertions (and perhaps \co{never} statements).
+	If you have liveness, fairness, or forward-progress checks,
+	you may need to compile without \co{-DSAFETY}.
+	If you leave off \co{-DSAFETY} when you could have used it,
+	the program will let you know.
 
 	The optimizations produced by \co{-DSAFETY} greatly speed things
 	up, so you should use it when you can.
@@ -263,9 +264,10 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	Another optional flag \co{-DMA=N} generates code for a slow
 	but aggressive state-space memory compression mode.
 \item	[\tco{./pan [-mN] [-wN]}]
-	This actually searches the state space.  The number of states
-	can reach into the tens of millions with very small state
-	machines, so you will need a machine with large memory.
+	This actually searches the state space.
+	The number of states can reach into the tens of millions with
+	very small state machines, so you will need a machine with
+	large memory.
 	For example, \path{qrcu.spin} with 3~updaters and 2~readers required
 	10.5\,GB of memory even with the \co{-DCOLLAPSE} flag.
 
@@ -276,23 +278,23 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 
 	The \co{-wN} option specifies the hashtable size.
 	The default for full state-space search is \co{-w24}.\footnote{
-		As of Spin Version 6.4.6 and 6.4.8. In the online manual of
-		Spin dated 10 July 2011, the default for exhaustive search
-		mode is said to be \co{-w19}, which does not meet
-		the actual behavior.}
+		As of Spin Version 6.4.6 and 6.4.8.
+		In the online manual of Spin dated 10 July 2011, the
+		default for exhaustive search mode is said to be \co{-w19},
+		which does not meet the actual behavior.}
 
 	If you aren't sure whether your machine has enough memory,
-	run \co{top} in one window and \co{./pan} in another.  Keep the
-	focus on the \co{./pan} window so that you can quickly kill
-	execution if need be.  As soon as CPU time drops much below
-	100\,\%, kill \co{./pan}.  If you have removed focus from the
-	window running \co{./pan}, you may wait a long time for the
-	windowing system to grab enough memory to do anything for
-	you.
+	run \co{top} in one window and \co{./pan} in another.
+	Keep the focus on the \co{./pan} window so that you can quickly
+	kill execution if need be.
+	As soon as CPU time drops much below 100\,\%, kill \co{./pan}.
+	If you have removed focus from the window running \co{./pan},
+	you may wait a long time for the windowing system to grab
+	enough memory to do anything for you.
 
 	Another option to avoid memory exhaustion is the
-	\co{-DMEMLIM=N} compiler flag. \co{-DMEMLIM=2000}
-	would set the maximum of 2\,GB.
+	\co{-DMEMLIM=N} compiler flag.
+	\co{-DMEMLIM=2000} would set the maximum of 2\,GB.
 
 	Don't forget to capture the output, especially
 	if you are working on a remote machine.
@@ -320,7 +322,8 @@ Promela will provide some surprises to people used to coding in C,
 C++, or Java.
 
 \begin{enumerate}
-\item	In C, ``\co{;}'' terminates statements.  In Promela it separates them.
+\item	In C, ``\co{;}'' terminates statements.
+	In Promela it separates them.
 	Fortunately, more recent versions of Spin have become
 	much more forgiving of ``extra'' semicolons.
 \item	Promela's looping construct, the \co{do} statement, takes
@@ -328,44 +331,52 @@ C++, or Java.
 	This \co{do} statement closely resembles a looping if-then-else
 	statement.
 \item	In C's \co{switch} statement, if there is no matching case, the whole
-	statement is skipped.  In Promela's equivalent, confusingly called
-	\co{if}, if there is no matching guard expression, you get an error
-	without a recognizable corresponding error message.
+	statement is skipped.
+	In Promela's equivalent, confusingly called \co{if}, if there is
+	no matching guard expression, you get an error without a
+	recognizable corresponding error message.
 	So, if the error output indicates an innocent line of code,
 	check to see if you left out a condition from an \co{if} or \co{do}
 	statement.
 \item	When creating stress tests in C, one usually races suspect operations
-	against each other repeatedly.	In Promela, one instead sets up
-	a single race, because Promela will search out all the possible
-	outcomes from that single race.	Sometimes you do need to loop
-	in Promela, for example, if multiple operations overlap, but
+	against each other repeatedly.
+	In Promela, one instead sets up a single race, because Promela
+	will search out all the possible outcomes from that single race.
+	Sometimes you do need to loop in Promela, for example,
+	if multiple operations overlap, but
 	doing so greatly increases the size of your state space.
 \item	In C, the easiest thing to do is to maintain a loop counter to track
-	progress and terminate the loop.  In Promela, loop counters
-	must be avoided like the plague because they cause the state
-	space to explode.  On the other hand, there is no penalty for
-	infinite loops in Promela as long as none of the variables
-	monotonically increase or decrease---Promela will figure out
-	how many passes through the loop really matter, and automatically
-	prune execution beyond that point.
+	progress and terminate the loop.
+	In Promela, loop counters must be avoided like the plague
+	because they cause the state space to explode.
+	On the other hand, there is no penalty for infinite loops in
+	Promela as long as none of the variables monotonically increase
+	or decrease---Promela will figure out how many passes through
+	the loop really matter, and automatically prune execution beyond
+	that point.
 \item	In C torture-test code, it is often wise to keep per-task control
-	variables.  They are cheap to read, and greatly aid in debugging the
-	test code.  In Promela, per-task control variables should be used
-	only when there is no other alternative.  To see this, consider
-	a 5-task verification with one bit each to indicate completion.
-	This gives 32 states.  In contrast, a simple counter would have
-	only six states, more than a five-fold reduction.  That factor
-	of five might not seem like a problem, at least not until you
-	are struggling with a verification program possessing more than
-	150 million states consuming more than 10\,GB of memory!
+	variables.
+	They are cheap to read, and greatly aid in debugging the test code.
+	In Promela, per-task control variables should be used only when
+	there is no other alternative.
+	To see this, consider a 5-task verification with one bit each
+	to indicate completion.
+	This gives 32 states.
+	In contrast, a simple counter would have only six states,
+	more than a five-fold reduction.
+	That factor of five might not seem like a problem, at least
+	not until you are struggling with a verification program
+	possessing more than 150 million states consuming more
+	than 10\,GB of memory!
 \item	One of the most challenging things both in C torture-test code and
-	in Promela is formulating good assertions.  Promela also allows
-	\co{never} claims that act like an assertion replicated
-	between every line of code.
+	in Promela is formulating good assertions.
+	Promela also allows \co{never} claims that act like an assertion
+	replicated between every line of code.
 \item	Dividing and conquering is extremely helpful in Promela in keeping
-	the state space under control.  Splitting a large model into two
-	roughly equal halves will result in the state space of each
-	half being roughly the square root of the whole.
+	the state space under control.
+	Splitting a large model into two roughly equal halves will result
+	in the state space of each half being roughly the square root of
+	the whole.
 	For example, a million-state combined model might reduce to a
 	pair of thousand-state models.
 	Not only will Promela handle the two smaller models much more
@@ -382,10 +393,11 @@ is a bit abusive.
 The following tricks can help you to abuse Promela safely:
 
 \begin{enumerate}
-\item	Memory reordering.  Suppose you have a pair of statements
-	copying globals x and y to locals r1 and r2, where ordering
-	matters (e.g., unprotected by locks), but where you have
-	no memory barriers.  This can be modeled in Promela as follows:
+\item	Memory reordering.
+	Suppose you have a pair of statements copying globals x and y
+	to locals r1 and r2, where ordering matters
+        (e.g., unprotected by locks), but where you have no memory barriers.
+	This can be modeled in Promela as follows:
 
 \begin{VerbatimN}[samepage=true]
 if
@@ -405,10 +417,11 @@ fi
 	if used too heavily.
 	In addition, it requires you to anticipate possible reorderings.
 
-\item	State reduction.  If you have complex assertions, evaluate
-	them under \co{atomic}.  After all, they are not part of the
-	algorithm.  One example of a complex assertion (to be discussed
-	in more detail later) is as shown in
+\item	State reduction.
+	If you have complex assertions, evaluate them under \co{atomic}.
+	After all, they are not part of the algorithm.
+	One example of a complex assertion (to be discussed in more
+	detail later) is as shown in
 	Listing~\ref{lst:formal:Complex Promela Assertion}.
 
 	There is no reason to evaluate this assertion
@@ -588,9 +601,9 @@ As expected, this run has no assertion failures (``errors: 0'').
 	\item	The declaration of \co{sum} should be moved to within
 		the init block, since it is not used anywhere else.
 	\item	The assertion code should be moved outside of the
-		initialization loop.  The initialization loop can
-		then be placed in an atomic block, greatly reducing
-		the state space (by how much?).
+		initialization loop.
+		The initialization loop can then be placed in an atomic
+		block, greatly reducing the state space (by how much?).
 	\item	The atomic block covering the assertion code should
 		be extended to include the initialization of \co{sum}
 		and \co{j}, and also to cover the assertion.
@@ -787,7 +800,8 @@ this update still be in progress.
 	\end{fcvref}
 }\QuickQuizAnswerB{
 	Because those operations are for the benefit of the
-	assertion only.  They are not part of the algorithm itself.
+	assertion only.
+	They are not part of the algorithm itself.
 	There is therefore no harm in marking them atomic, and
 	so marking them greatly reduces the state space that must
 	be searched by the Promela model.
@@ -800,7 +814,8 @@ this update still be in progress.
 	\emph{really} necessary?
         \end{fcvref}
 }\QuickQuizAnswerE{
-	Yes.  To see this, delete these lines and run the model.
+	Yes.
+	To see this, delete these lines and run the model.
 
 	Alternatively, consider the following sequence of steps:
 
@@ -810,7 +825,8 @@ this update still be in progress.
 		the value of \co{ctr[1]} is two.
 	\item	An updater starts executing, and sees that the sum of
 		the counters is two so that the fastpath cannot be
-		executed.  It therefore acquires the lock.
+		executed.
+		It therefore acquires the lock.
 	\item	A second updater starts executing, and fetches the value
 		of \co{ctr[0]}, which is zero.
 	\item	The first updater adds one to \co{ctr[0]}, flips
diff --git a/glossary.tex b/glossary.tex
index 98a27438..e8d93c90 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -284,10 +284,11 @@
 	set of critical sections guarded by that lock, while a
 	``reader-writer lock'' permits any number of reading
 	threads, or but one writing thread, into the set of critical
-	sections guarded by that lock.  (Just to be clear, the presence
-	of a writer thread in any of a given reader-writer lock's
-	critical sections will prevent any reader from entering
-	any of that lock's critical sections and vice versa.)
+	sections guarded by that lock.
+	(Just to be clear, the presence	of a writer thread in any of
+	a given reader-writer lock's critical sections will prevent
+	any reader from entering any of that lock's critical sections
+	and vice versa.)
 \item[\IX{Lock Contention}:]
 	A lock is said to be suffering contention when it is being
 	used so heavily that there is often a CPU waiting on it.
diff --git a/intro/intro.tex b/intro/intro.tex
index 4f38f376..812b34fd 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -572,7 +572,8 @@ programming environments:
 	Its productivity is believed by many to be even lower than that
 	of C/C++ ``locking plus threads'' environments.
 \item[OpenMP:] This set of compiler directives can be used
-	to parallelize loops.  It is thus quite specific to this
+	to parallelize loops.
+	It is thus quite specific to this
 	task, and this specificity often limits its performance.
 	It is, however, much easier to use than MPI or C/C++
 	``locking plus threads.''
@@ -834,17 +835,21 @@ reduce the amount of data that must be read.
 }\QuickQuizAnswer{
 	There are any number of potential bottlenecks:
 	\begin{enumerate}
-	\item	Main memory.  If a single thread consumes all available
+	\item	Main memory.
+		If a single thread consumes all available
 		memory, additional threads will simply page themselves
 		silly.
-	\item	Cache.  If a single thread's cache footprint completely
+	\item	Cache.
+		If a single thread's cache footprint completely
 		fills any shared CPU cache(s), then adding more threads
 		will simply thrash those affected caches, as will be
 		seen in \cref{chp:Data Structures}.
-	\item	Memory bandwidth.  If a single thread consumes all available
+	\item	Memory bandwidth.
+		If a single thread consumes all available
 		memory bandwidth, additional threads will simply
 		result in additional queuing on the system interconnect.
-	\item	I/O bandwidth.  If a single thread is I/O bound,
+	\item	I/O bandwidth.
+		If a single thread is I/O bound,
 		adding more threads will simply result in them all
 		waiting in line for the affected I/O resource.
 	\end{enumerate}
@@ -960,11 +965,13 @@ overlap computation and I/O so as to fully utilize I/O devices.
 	There are any number of potential limits on the number of
 	threads:
 	\begin{enumerate}
-	\item	Main memory.  Each thread consumes some memory
+	\item	Main memory.
+		Each thread consumes some memory
 		(for its stack if nothing else), so that excessive
 		numbers of threads can exhaust memory, resulting
 		in excessive paging or memory-allocation failures.
-	\item	I/O bandwidth.  If each thread initiates a given
+	\item	I/O bandwidth.
+		If each thread initiates a given
 		amount of mass-storage I/O or networking traffic,
 		excessive numbers of threads can result in excessive
 		I/O queuing delays, again degrading performance.
@@ -1239,8 +1246,10 @@ monograph~\cite{AndrewDBirrell1989Threads} is especially telling:
 
 \begin{quote}
 	Writing concurrent programs has a reputation for being exotic
-	and difficult. I~believe it is neither. You need a system
-	that provides you with good primitives and suitable libraries,
+	and difficult.
+	I~believe it is neither.
+	You need a system that provides you with good primitives
+	and suitable libraries,
 	you need a basic caution and carefulness, you need an armory of
 	useful techniques, and you need to know of the common pitfalls.
 	I~hope that this paper has helped you towards sharing my belief.
diff --git a/legal.tex b/legal.tex
index 1dd6c6bb..f443df37 100644
--- a/legal.tex
+++ b/legal.tex
@@ -31,10 +31,11 @@ States license.\footnote{
 	\url{https://creativecommons.org/licenses/by-sa/3.0/us/}}
 In brief, you may use the contents of this document for any purpose,
 personal, commercial, or otherwise, so long as attribution to the
-authors is maintained.  Likewise, the document may be modified,
-and derivative works and translations made available, so long as
-such modifications and derivations are offered to the public on equal
-terms as the non-source-code text and images in the original document.
+authors is maintained.
+Likewise, the document may be modified, and derivative works and
+translations made available, so long as such modifications and
+derivations are offered to the public on equal terms as the
+non-source-code text and images in the original document.
 
 Source code is covered by various versions of the GPL\@.\footnote{
 	\url{https://www.gnu.org/licenses/gpl-2.0.html}}
diff --git a/locking/locking.tex b/locking/locking.tex
index 6bc93e49..406c5034 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1710,7 +1710,8 @@ be required for the foreseeable future.
 \label{sec:locking:Locking Implementation Issues}
 %
 \epigraph{When you translate a dream into reality, it's never a full
-	  implementation.  It is easier to dream than to do.}
+	  implementation.
+	  It is easier to dream than to do.}
 	 {\emph{Shai Agassi}}
 
 Developers are almost always best-served by using whatever locking
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 397fb101..8c9be547 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2136,7 +2136,8 @@ page~\pageref{fig:memorder:A Variable With More Simultaneous Values}.
 	(\path{C-2+2W+o-o+o-o.litmus}).
 }\QuickQuizEnd
 
-But sometimes time really is on our side.  Read on!
+But sometimes time really is on our side.
+Read on!
 
 \subsubsection{Happens-Before}
 \label{sec:memorder:Happens-Before}
@@ -3158,8 +3159,9 @@ The following list of rules summarizes the lessons of this section:
 \end{enumerate}
 
 Again, many popular languages were designed with single-threaded use
-in mind.  Successful multithreaded use of these languages requires you
-to pay special attention to your memory references and dependencies.
+in mind.
+Successful multithreaded use of these languages requires you to pay
+special attention to your memory references and dependencies.
 
 \section{Higher-Level Primitives}
 \label{sec:memorder:Higher-Level Primitives}
@@ -3868,8 +3870,8 @@ can make portability a challenge, as indicated by
 In fact, some software environments simply prohibit
 direct use of memory-ordering operations, restricting the programmer
 to mutual-exclusion primitives that incorporate them to the extent that
-they are required.  Please note that this section is not intended to be
-a reference manual
+they are required.
+Please note that this section is not intended to be a reference manual
 covering all (or even most) aspects of each CPU family, but rather
 a high-level overview providing a rough comparison.
 For full details, see the reference manual for the CPU of interest.
diff --git a/owned/owned.tex b/owned/owned.tex
index aa4c0901..df2a1cce 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -4,7 +4,10 @@
 
 \QuickQuizChapter{chp:Data Ownership}{Data Ownership}{qqzowned}
 %
-\Epigraph{It is mine, I tell you. My own. My precious. Yes, my precious.}
+\Epigraph{It is mine, I tell you.
+	  My own.
+	  My precious.
+	  Yes, my precious.}
 	 {\emph{Gollum in ``The Fellowship of the Ring'', J.R.R.~Tolkien}}
 
 One of the simplest ways to avoid the synchronization overhead that
diff --git a/together/refcnt.tex b/together/refcnt.tex
index 57a1754e..ae8644e4 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -5,8 +5,8 @@
 \section{Refurbish Reference Counting}
 \label{sec:together:Refurbish Reference Counting}
 %
-\epigraph{Counting is the religion of this generation.  It is its
-	  hope and its salvation.}
+\epigraph{Counting is the religion of this generation.
+	  It is its hope and its salvation.}
 	 {\emph{Gertrude Stein}}
 
 Although reference counting is a conceptually simple technique,
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 77a3790d..b358c22d 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -289,7 +289,8 @@ in which the child sets a global variable \co{x} to 1 on line~\lnref{setx},
 prints a message on line~\lnref{print:c}, and exits on line~\lnref{exit:s}.
 The parent continues at line~\lnref{waitall}, where it waits on the child,
 and on line~\lnref{print:p} finds that its copy of the variable \co{x} is
-still zero. The output is thus as follows:
+still zero.
+The output is thus as follows:
 \end{fcvref}
 
 \begin{VerbatimU}
-- 
2.17.1


