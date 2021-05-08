Return-Path: <SRS0=4wRT=KD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qczx8tQ6xlJL42A2HutESiIvRGOF89nEw4LnHHU8dp8=;
        b=FB7iZn84MpBp5FfD8z7hNJxmP1TKJTeueFbQAWU4CB+9JxGun8GiWw6o4BpHA0XGiT
         DX+8VhdvC1OYDbNCjvsajCm7JAz4PySMsDpIVEqBPxZXoCGfhw2aeSgzDbmF0i2BiCr1
         eGylCR5OzGiKZpAZc8eDsgABDJYz/5bGVZQqHk71BPfKR6y/YE9S+7Dye3rebqi3SZxj
         LwnJe1yZ2f5f3cLKjbzkYtbo/5d92Hvcj+afRhngr0ki04act8Qlmxhy+2soQYvCPAb3
         2qcVgekQdC4uHVDXE/NUBnReuJ7H3W9mPEisQyno7wa7JvDB7OiQOCncRTPmkYqX+Mrt
         /HdA==
Subject: [PATCH -perfbook 2/4] SMPdesign: Employ \cref{} and its variants
References: <d66be1a7-9ef3-bf69-de15-2a684894bc12@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d08f3937-9fef-58a0-776f-a6dc76bbcfdc@gmail.com>
Date: Sat, 8 May 2021 16:08:21 +0900
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
 SMPdesign/SMPdesign.tex     | 138 ++++++++++++++++++------------------
 SMPdesign/beyond.tex        | 121 ++++++++++++++++---------------
 SMPdesign/criteria.tex      |  10 +--
 SMPdesign/partexercises.tex | 134 +++++++++++++++++-----------------
 4 files changed, 201 insertions(+), 202 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 7d392a84..e6b967f7 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -20,20 +20,20 @@ batch second, weaken third, and code fourth.
 Changing this order often leads to poor performance and scalability
 along with great frustration.\footnote{
 	That other great dodge around the Laws of Physics, read-only
-	replication, is covered in Chapter~\ref{chp:Deferred Processing}.}
+	replication, is covered in \cref{chp:Deferred Processing}.}
 
-To this end, Section~\ref{sec:SMPdesign:Partitioning Exercises}
+To this end, \cref{sec:SMPdesign:Partitioning Exercises}
 presents partitioning exercises,
-Section~\ref{sec:SMPdesign:Design Criteria} reviews partitionability
+\cref{sec:SMPdesign:Design Criteria} reviews partitionability
 design criteria,
-Section~\ref{sec:SMPdesign:Synchronization Granularity}
+\cref{sec:SMPdesign:Synchronization Granularity}
 discusses synchronization granularity selection,
-Section~\ref{sec:SMPdesign:Parallel Fastpath}
+\cref{sec:SMPdesign:Parallel Fastpath}
 overviews important parallel-fastpath design patterns
 that provide speed and scalability on common-case fastpaths while using
 simpler less-scalable ``slow path'' fallbacks for unusual situations,
 and finally
-Section~\ref{sec:SMPdesign:Beyond Partitioning}
+\cref{sec:SMPdesign:Beyond Partitioning}
 takes a brief look beyond partitioning.
 
 \input{SMPdesign/partexercises}
@@ -46,7 +46,7 @@ takes a brief look beyond partitioning.
 \epigraph{Doing little things well is a step toward doing big things better.}
 	 {\emph{Harry F.~Banks}}
 
-Figure~\ref{fig:SMPdesign:Design Patterns and Lock Granularity}
+\Cref{fig:SMPdesign:Design Patterns and Lock Granularity}
 gives a pictorial view of different levels of synchronization granularity,
 each of which is described in one of the following sections.
 These sections focus primarily on locking, but similar granularity
@@ -70,7 +70,7 @@ overhead and complexity.
 Some years back, there were those who would argue that \IXr{Moore's Law}
 would eventually force all programs into this category.
 However, as can be seen in
-Figure~\ref{fig:SMPdesign:Clock-Frequency Trend for Intel CPUs},
+\cref{fig:SMPdesign:Clock-Frequency Trend for Intel CPUs},
 the exponential increase in single-threaded performance halted in
 about 2003.
 Therefore,
@@ -88,7 +88,7 @@ in 2020 were generated on a system with 56~hardware threads per socket,
 parallelism is well and truly here.
 It is also important to note that Ethernet bandwidth is continuing to
 grow, as shown in
-Figure~\ref{fig:SMPdesign:Ethernet Bandwidth vs. Intel x86 CPU Performance}.
+\cref{fig:SMPdesign:Ethernet Bandwidth vs. Intel x86 CPU Performance}.
 This growth will continue to motivate multithreaded servers in order to
 handle the communications load.
 
@@ -112,7 +112,7 @@ Again, if a program runs quickly enough on a single processor,
 spare yourself the overhead and complexity of SMP synchronization
 primitives.
 The simplicity of the hash-table lookup code in
-Listing~\ref{lst:SMPdesign:Sequential-Program Hash Table Search}
+\cref{lst:SMPdesign:Sequential-Program Hash Table Search}
 underscores this point.\footnote{
 	The examples in this section are taken from Hart et
 	al.~\cite{ThomasEHart2006a}, adapted for clarity
@@ -171,7 +171,7 @@ global locks.\footnote{
 	If your program instead has locks in data structures,
 	or, in the case of Java, uses classes with synchronized
 	instances, you are instead using ``data locking'', described
-	in Section~\ref{sec:SMPdesign:Data Locking}.}
+	in \cref{sec:SMPdesign:Data Locking}.}
 It is especially
 easy to retrofit an existing program to use code locking in
 order to run it on a multiprocessor.
@@ -188,10 +188,10 @@ from which only modest scaling is required.
 In these cases, code locking will provide a relatively simple
 program that is very similar to its sequential counterpart,
 as can be seen in
-Listing~\ref{lst:SMPdesign:Code-Locking Hash Table Search}.
+\cref{lst:SMPdesign:Code-Locking Hash Table Search}.
 However, note that the simple return of the comparison in
 \co{hash_search()} in
-Listing~\ref{lst:SMPdesign:Sequential-Program Hash Table Search}
+\cref{lst:SMPdesign:Sequential-Program Hash Table Search}
 has now become three statements due to the need to release the
 lock before returning.
 
@@ -238,7 +238,7 @@ where multiple CPUs need to acquire the lock concurrently.
 SMP programmers who have taken care of groups of small children
 (or groups of older people who are acting like children) will immediately
 recognize the danger of having only one of something,
-as illustrated in Figure~\ref{fig:SMPdesign:Lock Contention}.
+as illustrated in \cref{fig:SMPdesign:Lock Contention}.
 
 % ./test_hash_codelock.exe 1000 0/100 1 1024 1
 % ./test_hash_codelock.exe: nmilli: 1000 update/total: 0/100 nelements: 1 nbuckets: 1024 nthreads: 1
@@ -282,7 +282,7 @@ Data locking reduces contention by distributing the instances
 of the overly-large critical section across multiple data structures,
 for example, maintaining per-hash-bucket critical sections in a
 hash table, as shown in
-Listing~\ref{lst:SMPdesign:Data-Locking Hash Table Search}.
+\cref{lst:SMPdesign:Data-Locking Hash Table Search}.
 The increased scalability again results in a slight increase in complexity
 in the form of an additional data structure, the \co{struct bucket}.
 
@@ -330,9 +330,9 @@ int hash_search(struct hash_table *h, long key)
 \end{listing}
 
 In contrast with the contentious situation
-shown in Figure~\ref{fig:SMPdesign:Lock Contention},
+shown in \cref{fig:SMPdesign:Lock Contention},
 data locking helps promote harmony, as illustrated by
-Figure~\ref{fig:SMPdesign:Data Locking}---and in parallel programs,
+\cref{fig:SMPdesign:Data Locking}---and in parallel programs,
 this \emph{almost} always translates into increased performance and
 scalability.
 For this reason, data locking was heavily used by Sequent in its
@@ -371,7 +371,7 @@ to the root directory and its direct descendants are much more likely to
 be traversed than are more obscure entries.
 This can result in many CPUs contending for the locks of these popular
 entries, resulting in a situation not unlike that
-shown in Figure~\ref{fig:SMPdesign:Data and Skew}.
+shown in \cref{fig:SMPdesign:Data and Skew}.
 
 \begin{figure}
 \centering
@@ -394,7 +394,7 @@ A key challenge with data locking on dynamically allocated structures
 is ensuring that the structure remains in existence while the lock is
 being acquired~\cite{Gamsa99}.
 The code in
-Listing~\ref{lst:SMPdesign:Data-Locking Hash Table Search}
+\cref{lst:SMPdesign:Data-Locking Hash Table Search}
 finesses this challenge by placing the locks in the statically allocated
 hash buckets, which are never freed.
 However, this trick would not work if the hash table were resizeable,
@@ -413,13 +413,13 @@ bucket from being freed during the time that its lock was being acquired.
 	\item	Provide a statically allocated lock that is held while
 		the per-structure lock is being acquired, which is an
 		example of hierarchical locking (see
-		Section~\ref{sec:SMPdesign:Hierarchical Locking}).
+		\cref{sec:SMPdesign:Hierarchical Locking}).
 		Of course, using a single global lock for this purpose
 		can result in unacceptably high levels of lock contention,
 		dramatically reducing performance and scalability.
 	\item	Provide an array of statically allocated locks, hashing
 		the structure's address to select the lock to be acquired,
-		as described in Chapter~\ref{chp:Locking}.
+		as described in \cref{chp:Locking}.
 		Given a hash function of sufficiently high quality, this
 		avoids the scalability limitations of the single global
 		lock, but in read-mostly situations, the lock-acquisition
@@ -477,7 +477,7 @@ bucket from being freed during the time that its lock was being acquired.
 	\end{enumerate}
 
 	For more on providing existence guarantees, see
-	Chapters~\ref{chp:Locking} and \ref{chp:Deferred Processing}.
+	\cref{chp:Locking,chp:Deferred Processing}.
 }\QuickQuizEnd
 
 \subsection{Data Ownership}
@@ -517,14 +517,14 @@ If there is significant sharing, communication between the threads
 or CPUs can result in significant complexity and overhead.
 Furthermore, if the most-heavily used data happens to be that owned
 by a single CPU, that CPU will be a ``hot spot'', sometimes with
-results resembling that shown in Figure~\ref{fig:SMPdesign:Data and Skew}.
+results resembling that shown in \cref{fig:SMPdesign:Data and Skew}.
 However, in situations where no sharing is required, data ownership
 achieves ideal performance, and with code that can be as simple
 as the sequential-program case shown in
-Listing~\ref{lst:SMPdesign:Sequential-Program Hash Table Search}.
+\cref{lst:SMPdesign:Sequential-Program Hash Table Search}.
 Such situations are often referred to as ``\IX{embarrassingly
 parallel}'', and, in the best case, resemble the situation
-previously shown in Figure~\ref{fig:SMPdesign:Data Locking}.
+previously shown in \cref{fig:SMPdesign:Data Locking}.
 
 % ./test_hash_null.exe 1000 0/100 1 1024 1
 % ./test_hash_null.exe: nmilli: 1000 update/total: 0/100 nelements: 1 nbuckets: 1024 nthreads: 1
@@ -547,7 +547,7 @@ is read-only, in which case,
 all threads can ``own'' it via replication.
 
 Data ownership will be presented in more detail in
-Chapter~\ref{chp:Data Ownership}.
+\cref{chp:Data Ownership}.
 
 \subsection{Locking Granularity and Performance}
 \label{sec:SMPdesign:Locking Granularity and Performance}
@@ -649,7 +649,7 @@ If we call this ratio $f$, we have:
 \label{fig:SMPdesign:Synchronization Efficiency}
 \end{figure}
 
-Figure~\ref{fig:SMPdesign:Synchronization Efficiency} plots the synchronization
+\Cref{fig:SMPdesign:Synchronization Efficiency} plots the synchronization
 efficiency $e$ as a function of the number of CPUs/threads $n$ for
 a few values of the overhead ratio $f$.
 For example, again using the 5-nanosecond atomic increment, the $f=10$
@@ -664,7 +664,7 @@ atomic manipulation of a single global shared variable will not
 scale well if used heavily on current commodity hardware.
 This is an abstract mathematical depiction of the forces leading
 to the parallel counting algorithms that were discussed in
-Chapter~\ref{chp:Counting}.
+\cref{chp:Counting}.
 Your real-world mileage may differ.
 
 Nevertheless, the concept of efficiency is useful, and even in cases
@@ -688,7 +688,7 @@ One might therefore expect a perfect efficiency of 1.0.
 \end{figure}
 
 However,
-Figure~\ref{fig:SMPdesign:Matrix Multiply Efficiency}
+\cref{fig:SMPdesign:Matrix Multiply Efficiency}
 tells a different story, especially for a 64-by-64 matrix multiply,
 which never gets above an efficiency of about 0.3, even when running
 single-threaded, and drops sharply as more threads are added.\footnote{
@@ -712,7 +712,7 @@ overhead, you may as well get your money's worth.
 	How can a single-threaded 64-by-64 matrix multiple possibly
 	have an efficiency of less than 1.0?
 	Shouldn't all of the traces in
-	Figure~\ref{fig:SMPdesign:Matrix Multiply Efficiency}
+	\cref{fig:SMPdesign:Matrix Multiply Efficiency}
 	have efficiency of exactly 1.0 when running on one thread?
 }\QuickQuizAnswer{
 	The \path{matmul.c} program creates the specified number of
@@ -726,7 +726,7 @@ overhead, you may as well get your money's worth.
 Given these inefficiencies,
 it is worthwhile to look into more-scalable approaches
 such as the data locking described in
-Section~\ref{sec:SMPdesign:Data Locking}
+\cref{sec:SMPdesign:Data Locking}
 or the parallel-fastpath approach discussed in the next section.
 
 \QuickQuiz{
@@ -787,7 +787,7 @@ Parallel fastpath combines different patterns (one for the
 fastpath, one elsewhere) and is therefore a template pattern.
 The following instances of parallel
 fastpath occur often enough to warrant their own patterns,
-as depicted in Figure~\ref{fig:SMPdesign:Parallel-Fastpath Design Patterns}:
+as depicted in \cref{fig:SMPdesign:Parallel-Fastpath Design Patterns}:
 
 \begin{figure}
 \centering
@@ -799,18 +799,18 @@ as depicted in Figure~\ref{fig:SMPdesign:Parallel-Fastpath Design Patterns}:
 
 \begin{enumerate}
 \item	Reader/Writer Locking
-	(described below in Section~\ref{sec:SMPdesign:Reader/Writer Locking}).
+	(described below in \cref{sec:SMPdesign:Reader/Writer Locking}).
 \item	Read-copy update (RCU), which may be used as a high-performance
 	replacement for reader/writer locking, is introduced in
-	Section~\ref{sec:defer:Read-Copy Update (RCU)}.
+	\cref{sec:defer:Read-Copy Update (RCU)}.
 	Other alternatives include hazard pointers
 	(\cref{sec:defer:Hazard Pointers})
 	and sequence locking (\cref{sec:defer:Sequence Locks}).
 	These alternatives will not be discussed further in this chapter.
 \item   Hierarchical Locking~(\cite{McKenney95b}), which is touched upon
-	in Section~\ref{sec:SMPdesign:Hierarchical Locking}.
+	in \cref{sec:SMPdesign:Hierarchical Locking}.
 \item	Resource Allocator Caches~(\cite{McKenney95b,McKenney93}).
-	See Section~\ref{sec:SMPdesign:Resource Allocator Caches}
+	See \cref{sec:SMPdesign:Resource Allocator Caches}
 	for more detail.
 \end{enumerate}
 
@@ -824,8 +824,8 @@ multiple readers to proceed in parallel can greatly increase scalability.
 Writers exclude both readers and each other.
 There are many implementations of reader-writer locking, including
 the POSIX implementation described in
-Section~\ref{sec:toolsoftrade:POSIX Reader-Writer Locking}.
-Listing~\ref{lst:SMPdesign:Reader-Writer-Locking Hash Table Search}
+\cref{sec:toolsoftrade:POSIX Reader-Writer Locking}.
+\Cref{lst:SMPdesign:Reader-Writer-Locking Hash Table Search}
 shows how the hash search might be implemented using reader-writer locking.
 
 \begin{listing}
@@ -871,7 +871,7 @@ Snaman~\cite{Snaman87} describes a more ornate six-mode
 asymmetric locking design used in several clustered systems.
 Locking in general and reader-writer locking in particular is described
 extensively in
-Chapter~\ref{chp:Locking}.
+\cref{chp:Locking}.
 
 \subsection{Hierarchical Locking}
 \label{sec:SMPdesign:Hierarchical Locking}
@@ -879,7 +879,7 @@ Chapter~\ref{chp:Locking}.
 The idea behind hierarchical locking is to have a coarse-grained lock
 that is held only long enough to work out which fine-grained lock
 to acquire.
-Listing~\ref{lst:SMPdesign:Hierarchical-Locking Hash Table Search}
+\Cref{lst:SMPdesign:Hierarchical-Locking Hash Table Search}
 shows how our hash-table search might be adapted to do hierarchical
 locking, but also shows the great weakness of this approach:
 we have paid the overhead of acquiring a second lock, but we only
@@ -939,8 +939,8 @@ int hash_search(struct hash_table *h, long key)
 	In what situation would hierarchical locking work well?
 }\QuickQuizAnswer{
 	If the comparison on
-        line~\ref{ln:SMPdesign:Hierarchical-Locking Hash Table Search:retval} of
-	Listing~\ref{lst:SMPdesign:Hierarchical-Locking Hash Table Search}
+	\clnrefr{ln:SMPdesign:Hierarchical-Locking Hash Table Search:retval} of
+	\cref{lst:SMPdesign:Hierarchical-Locking Hash Table Search}
 	were replaced by a much heavier-weight operation,
 	then releasing \co{bp->bucket_lock} \emph{might} reduce lock
 	contention enough to outweigh the overhead of the extra
@@ -988,7 +988,7 @@ To prevent any given CPU from monopolizing the memory blocks,
 we place a limit on the number of blocks that can be in each CPU's
 cache.
 In a two-CPU system, the flow of memory blocks will be as shown
-in Figure~\ref{fig:SMPdesign:Allocator Cache Schematic}:
+in \cref{fig:SMPdesign:Allocator Cache Schematic}:
 when a given CPU is trying to free a block when its pool is full,
 it sends blocks to the global pool, and, similarly, when that CPU
 is trying to allocate a block when its pool is empty, it retrieves
@@ -1005,8 +1005,8 @@ blocks from the global pool.
 
 The actual data structures for a ``toy'' implementation of allocator
 caches are shown in
-Listing~\ref{lst:SMPdesign:Allocator-Cache Data Structures}.
-The ``Global Pool'' of Figure~\ref{fig:SMPdesign:Allocator Cache Schematic}
+\cref{lst:SMPdesign:Allocator-Cache Data Structures}.
+The ``Global Pool'' of \cref{fig:SMPdesign:Allocator Cache Schematic}
 is implemented by \co{globalmem} of type \co{struct globalmempool},
 and the two CPU pools by the per-thread variable \co{perthreadmem} of
 type \co{struct perthreadmempool}.
@@ -1031,7 +1031,7 @@ must be empty.\footnote{
 \end{listing}
 
 The operation of the pool data structures is illustrated by
-Figure~\ref{fig:SMPdesign:Allocator Pool Schematic},
+\cref{fig:SMPdesign:Allocator Pool Schematic},
 with the six boxes representing the array of pointers making up
 the \co{pool} field, and the number preceding them representing
 the \co{cur} field.
@@ -1052,23 +1052,23 @@ smaller than the number of non-\co{NULL} pointers.
 
 \begin{fcvref}[ln:SMPdesign:smpalloc:alloc]
 The allocation function \co{memblock_alloc()} may be seen in
-Listing~\ref{lst:SMPdesign:Allocator-Cache Allocator Function}.
-Line~\lnref{pick} picks up the current thread's per-thread pool,
-and line~\lnref{chk:empty} checks to see if it is empty.
+\cref{lst:SMPdesign:Allocator-Cache Allocator Function}.
+\Clnref{pick} picks up the current thread's per-thread pool,
+and \clnref{chk:empty} checks to see if it is empty.
 
 If so, \clnrefrange{ack}{rel} attempt to refill it
 from the global pool
-under the spinlock acquired on line~\lnref{ack} and released on line~\lnref{rel}.
+under the spinlock acquired on \clnref{ack} and released on \clnref{rel}.
 \Clnrefrange{loop:b}{loop:e} move blocks from the global
 to the per-thread pool until
 either the local pool reaches its target size (half full) or
-the global pool is exhausted, and line~\lnref{set} sets the per-thread pool's
+the global pool is exhausted, and \clnref{set} sets the per-thread pool's
 count to the proper value.
 
-In either case, line~\lnref{chk:notempty} checks for the per-thread
+In either case, \clnref{chk:notempty} checks for the per-thread
 pool still being
 empty, and if not, \clnrefrange{rem:b}{rem:e} remove a block and return it.
-Otherwise, line~\lnref{ret:NULL} tells the sad tale of memory exhaustion.
+Otherwise, \clnref{ret:NULL} tells the sad tale of memory exhaustion.
 \end{fcvref}
 
 \begin{listing}
@@ -1080,20 +1080,20 @@ Otherwise, line~\lnref{ret:NULL} tells the sad tale of memory exhaustion.
 \subsubsection{Free Function}
 
 \begin{fcvref}[ln:SMPdesign:smpalloc:free]
-Listing~\ref{lst:SMPdesign:Allocator-Cache Free Function} shows
+\Cref{lst:SMPdesign:Allocator-Cache Free Function} shows
 the memory-block free function.
-Line~\lnref{get} gets a pointer to this thread's pool, and
-line~\lnref{chk:full} checks to see if this per-thread pool is full.
+\Clnref{get} gets a pointer to this thread's pool, and
+\clnref{chk:full} checks to see if this per-thread pool is full.
 
 If so, \clnrefrange{acq}{empty:e} empty half of the per-thread pool
 into the global pool,
-with lines~\lnref{acq} and~\lnref{rel} acquiring and releasing the spinlock.
+with \clnref{acq,rel} acquiring and releasing the spinlock.
 \Clnrefrange{loop:b}{loop:e} implement the loop moving blocks
 from the local to the
-global pool, and line~\lnref{set} sets the per-thread pool's count to the proper
+global pool, and \clnref{set} sets the per-thread pool's count to the proper
 value.
 
-In either case, line~\lnref{place} then places the newly freed block into the
+In either case, \clnref{place} then places the newly freed block into the
 per-thread pool.
 \end{fcvref}
 
@@ -1106,12 +1106,12 @@ per-thread pool.
 \QuickQuiz{
 	Doesn't this resource-allocator design resemble that of
 	the approximate limit counters covered in
-	Section~\ref{sec:count:Approximate Limit Counters}?
+	\cref{sec:count:Approximate Limit Counters}?
 }\QuickQuizAnswer{
 	Indeed it does!
 	We are used to thinking of allocating and freeing memory,
 	but the algorithms in
-	Section~\ref{sec:count:Approximate Limit Counters}
+	\cref{sec:count:Approximate Limit Counters}
 	are taking very similar actions to allocate and free
 	``count''.
 }\QuickQuizEnd
@@ -1122,11 +1122,11 @@ Rough performance results\footnote{
 	This data was not collected in a statistically meaningful way,
 	and therefore should be viewed with great skepticism and suspicion.
 	Good data-collection and -reduction practice is discussed
-	in Chapter~\ref{chp:Validation}.
+	in \cref{chp:Validation}.
 	That said, repeated runs gave similar results, and these results
 	match more careful evaluations of similar algorithms.}
 are shown in
-Figure~\ref{fig:SMPdesign:Allocator Cache Performance},
+\cref{fig:SMPdesign:Allocator Cache Performance},
 running on a dual-core Intel x86 running at 1\,GHz (4300 bogomips per CPU)
 with at most six blocks allowed in each CPU's cache.
 In this micro-benchmark,
@@ -1166,7 +1166,7 @@ this book.
 
 \QuickQuizSeries{%
 \QuickQuizB{
-	In Figure~\ref{fig:SMPdesign:Allocator Cache Performance},
+	In \cref{fig:SMPdesign:Allocator Cache Performance},
 	there is a pattern of performance rising with increasing run
 	length in groups of three samples, for example, for run lengths
 	10, 11, and 12.
@@ -1241,7 +1241,7 @@ this book.
 	\end{figure}
 
 	The relationships between these quantities are shown in
-	Figure~\ref{fig:SMPdesign:Allocator Cache Run-Length Analysis}.
+	\cref{fig:SMPdesign:Allocator Cache Run-Length Analysis}.
 	The global pool is shown on the top of this figure, and
 	the ``extra'' initializer thread's per-thread pool and
 	per-thread allocations are the left-most pair of boxes.
@@ -1264,10 +1264,10 @@ this book.
 	\end{equation}
 
 	The question has $g=40$, $s=3$, and $n=2$.
-	Equation~\ref{sec:SMPdesign:i} gives $i=4$, and
-	Equation~\ref{sec:SMPdesign:p} gives $p=18$ for $m=18$
+	\Cref{sec:SMPdesign:i} gives $i=4$, and
+	\cref{sec:SMPdesign:p} gives $p=18$ for $m=18$
 	and $p=21$ for $m=19$.
-	Plugging these into Equation~\ref{sec:SMPdesign:g-vs-m}
+	Plugging these into \cref{sec:SMPdesign:g-vs-m}
 	shows that $m=18$ will not overflow, but that $m=19$ might
 	well do so.
 
@@ -1315,7 +1315,7 @@ level is so infrequently reached in well-designed systems~\cite{McKenney01e}.
 Despite this real-world design's greater complexity, the underlying
 idea is the same---repeated application of parallel fastpath,
 as shown in
-Table~\ref{fig:app:questions:Schematic of Real-World Parallel Allocator}.
+\cref{fig:app:questions:Schematic of Real-World Parallel Allocator}.
 
 \begin{table}
 \rowcolors{1}{}{lightgray}
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 20b6a9e2..35bdd92f 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -11,9 +11,9 @@
 
 This chapter has discussed how data partitioning can be used to design
 simple linearly scalable parallel programs.
-Section~\ref{sec:SMPdesign:Data Ownership} hinted at the possibilities
+\Cref{sec:SMPdesign:Data Ownership} hinted at the possibilities
 of data replication, which will be used to great effect in
-Section~\ref{sec:defer:Read-Copy Update (RCU)}.
+\cref{sec:defer:Read-Copy Update (RCU)}.
 
 The main goal of applying partitioning and replication is to achieve
 linear speedups, in other words, to ensure that the total amount of
@@ -43,23 +43,23 @@ This section evaluates this advice by comparing PWQ
 against a sequential algorithm (SEQ) and also against
 an alternative parallel algorithm, in all cases solving randomly generated
 square mazes.
-Section~\ref{sec:SMPdesign:Work-Queue Parallel Maze Solver} discusses PWQ,
-Section~\ref{sec:SMPdesign:Alternative Parallel Maze Solver} discusses an alternative
+\Cref{sec:SMPdesign:Work-Queue Parallel Maze Solver} discusses PWQ,
+\cref{sec:SMPdesign:Alternative Parallel Maze Solver} discusses an alternative
 parallel algorithm,
-Section~\ref{sec:SMPdesign:Performance Comparison I} analyzes its anomalous performance,
-Section~\ref{sec:SMPdesign:Alternative Sequential Maze Solver} derives an improved
+\cref{sec:SMPdesign:Performance Comparison I} analyzes its anomalous performance,
+\cref{sec:SMPdesign:Alternative Sequential Maze Solver} derives an improved
 sequential algorithm from the alternative parallel algorithm,
-Section~\ref{sec:SMPdesign:Performance Comparison II} makes further performance
+\cref{sec:SMPdesign:Performance Comparison II} makes further performance
 comparisons,
 and finally
-Section~\ref{sec:SMPdesign:Future Directions and Conclusions}
+\cref{sec:SMPdesign:Future Directions and Conclusions}
 presents future directions and concluding remarks.
 
 \subsection{Work-Queue Parallel Maze Solver}
 \label{sec:SMPdesign:Work-Queue Parallel Maze Solver}
 
 PWQ is based on SEQ, which is shown in
-Listing~\ref{lst:SMPdesign:SEQ Pseudocode}
+\cref{lst:SMPdesign:SEQ Pseudocode}
 (pseudocode for \path{maze_seq.c}).
 The maze is represented by a 2D array of cells and
 a linear-array-based work queue named \co{->visited}.
@@ -96,14 +96,14 @@ int maze_solve(maze *mp, cell sc, cell ec)
 \end{listing}
 
 \begin{fcvref}[ln:SMPdesign:SEQ Pseudocode]
-Line~\lnref{initcell} visits the initial cell, and each iteration of the loop spanning
+\Clnref{initcell} visits the initial cell, and each iteration of the loop spanning
 \clnrefrange{loop:b}{loop:e} traverses passages headed by one cell.
 The loop spanning
 \clnrefrange{loop2:b}{loop2:e} scans the \co{->visited[]} array for a
 visited cell with an unvisited neighbor, and the loop spanning
 \clnrefrange{loop3:b}{loop3:e} traverses one fork of the submaze
 headed by that neighbor.
-Line~\lnref{finalize} initializes for the next pass through the outer loop.
+\Clnref{finalize} initializes for the next pass through the outer loop.
 \end{fcvref}
 
 \begin{listing}
@@ -146,38 +146,36 @@ int maze_find_any_next_cell(struct maze *mp, cell c, \lnlbl@find:b$
 \begin{fcvref}[ln:SMPdesign:SEQ Helper Pseudocode:try]
 The pseudocode for \co{maze_try_visit_cell()} is shown on
 \clnrefrange{b}{e}
-of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode}
+of \cref{lst:SMPdesign:SEQ Helper Pseudocode}
 (\path{maze.c}).
-Line~\lnref{chk:adj} checks to see if cells \co{c} and \co{t} are
+\Clnref{chk:adj} checks to see if cells \co{c} and \co{t} are
 adjacent and connected,
-while line~\lnref{chk:not:visited} checks to see if cell \co{t} has
+while \clnref{chk:not:visited} checks to see if cell \co{t} has
 not yet been visited.
 The \co{celladdr()} function returns the address of the specified cell.
-If either check fails, line~\lnref{ret:failure} returns failure.
-Line~\lnref{nextcell} indicates the next cell,
-line~\lnref{recordnext} records this cell in the next
+If either check fails, \clnref{ret:failure} returns failure.
+\Clnref{nextcell} indicates the next cell,
+\clnref{recordnext} records this cell in the next
 slot of the \co{->visited[]} array,
-line~\lnref{next:visited} indicates that this slot
-is now full, and line~\lnref{mark:visited} marks this cell as visited and also records
+\clnref{next:visited} indicates that this slot
+is now full, and \clnref{mark:visited} marks this cell as visited and also records
 the distance from the maze start.
-Line~\lnref{ret:success} then returns success.
+\Clnref{ret:success} then returns success.
 \end{fcvref}
 
 \begin{fcvref}[ln:SMPdesign:SEQ Helper Pseudocode:find]
 The pseudocode for \co{maze_find_any_next_cell()} is shown on
 \clnrefrange{b}{e}
-of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode}
+of \cref{lst:SMPdesign:SEQ Helper Pseudocode}
 (\path{maze.c}).
-Line~\lnref{curplus1} picks up the current cell's distance plus 1,
-while lines~\lnref{chk:prevcol}, \lnref{chk:nextcol}, \lnref{chk:prevrow},
-and~\lnref{chk:nextrow}
+\Clnref{curplus1} picks up the current cell's distance plus 1,
+while \clnref{chk:prevcol,chk:nextcol,chk:prevrow,chk:nextrow}
 check the cell in each direction, and
-lines~\lnref{ret:prevcol}, \lnref{ret:nextcol}, \lnref{ret:prevrow},
-and~\lnref{ret:nextrow}
+\clnref{ret:prevcol,ret:nextcol,ret:prevrow,ret:nextrow}
 return true if the corresponding cell is a candidate next cell.
 The \co{prevcol()}, \co{nextcol()}, \co{prevrow()}, and \co{nextrow()}
 each do the specified array-index-conversion operation.
-If none of the cells is a candidate, line~\lnref{ret:false} returns false.
+If none of the cells is a candidate, \clnref{ret:false} returns false.
 \end{fcvref}
 
 \begin{figure}
@@ -189,7 +187,7 @@ If none of the cells is a candidate, line~\lnref{ret:false} returns false.
 
 The path is recorded in the maze by counting the number of cells from
 the starting point, as shown in
-Figure~\ref{fig:SMPdesign:Cell-Number Solution Tracking},
+\cref{fig:SMPdesign:Cell-Number Solution Tracking},
 where the starting cell is in the upper left and the ending cell is
 in the lower right.
 Starting at the ending cell and following
@@ -204,7 +202,7 @@ consecutively decreasing cell numbers traverses the solution.
 
 The parallel work-queue solver is a straightforward parallelization
 of the algorithm shown in
-Listings~\ref{lst:SMPdesign:SEQ Pseudocode} and~\ref{lst:SMPdesign:SEQ Helper Pseudocode}.
+\cref{lst:SMPdesign:SEQ Pseudocode,lst:SMPdesign:SEQ Helper Pseudocode}.
 \begin{fcvref}[ln:SMPdesign:SEQ Pseudocode]
 \Clnref{ifge} of Listing~\ref{lst:SMPdesign:SEQ Pseudocode} must use fetch-and-add,
 and the local variable \co{vi} must be shared among the various threads.
@@ -220,13 +218,13 @@ attempts to record cells in the \co{->visited[]} array.
 
 This approach does provide significant speedups on a dual-CPU
 Lenovo W500 running at 2.53\,GHz, as shown in
-Figure~\ref{fig:SMPdesign:CDF of Solution Times For SEQ and PWQ},
+\cref{fig:SMPdesign:CDF of Solution Times For SEQ and PWQ},
 which shows the cumulative distribution functions (CDFs) for the solution
 times of the two algorithms, based on the solution of 500 different square
 500-by-500 randomly generated mazes.
 The substantial overlap
 of the projection of the CDFs onto the x-axis will be addressed in
-Section~\ref{sec:SMPdesign:Performance Comparison I}.
+\cref{sec:SMPdesign:Performance Comparison I}.
 
 Interestingly enough, the sequential solution-path tracking works unchanged
 for the parallel algorithm.
@@ -286,23 +284,23 @@ int maze_solve_child(maze *mp, cell *visited, cell sc)	\lnlbl@b$
 
 \begin{fcvref}[ln:SMPdesign:Partitioned Parallel Solver Pseudocode]
 The partitioned parallel algorithm (PART), shown in
-Listing~\ref{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}
+\cref{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}
 (\path{maze_part.c}),
 is similar to SEQ, but has a few important differences.
 First, each child thread has its own \co{visited} array, passed in by
-the parent as shown on line~\lnref{b},
+the parent as shown on \clnref{b},
 which must be initialized to all [$-1$, $-1$].
-Line~\lnref{store:ptr} stores a pointer to this array into the per-thread variable
+\Clnref{store:ptr} stores a pointer to this array into the per-thread variable
 \co{myvisited} to allow access by helper functions, and similarly stores
 a pointer to the local visit index.
 Second, the parent visits the first cell on each child's behalf,
-which the child retrieves on line~\lnref{retrieve}.
+which the child retrieves on \clnref{retrieve}.
 Third, the maze is solved as soon as one child locates a cell that has
 been visited by the other child.
 When \co{maze_try_visit_cell()} detects this,
 it sets a \co{->done} field in the maze structure.
 Fourth, each child must therefore periodically check the \co{->done}
-field, as shown on lines~\lnref{chk:done1}, \lnref{chk:done2}, and~\lnref{chk:done3}.
+field, as shown on \clnref{chk:done1,chk:done2,chk:done3}.
 The \co{READ_ONCE()} primitive must disable any compiler
 optimizations that might combine consecutive loads or that
 might reload the value.
@@ -347,23 +345,23 @@ int maze_try_visit_cell(struct maze *mp, int c, int t,
 
 \begin{fcvref}[ln:SMPdesign:Partitioned Parallel Helper Pseudocode]
 The pseudocode for \co{maze_find_any_next_cell()} is identical to that shown in
-Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode},
+\cref{lst:SMPdesign:SEQ Helper Pseudocode},
 but the pseudocode for \co{maze_try_visit_cell()} differs, and
 is shown in
-Listing~\ref{lst:SMPdesign:Partitioned Parallel Helper Pseudocode}.
+\cref{lst:SMPdesign:Partitioned Parallel Helper Pseudocode}.
 \Clnrefrange{chk:conn:b}{chk:conn:e}
 check to see if the cells are connected, returning failure
 if not.
 The loop spanning \clnrefrange{loop:b}{loop:e} attempts to mark
 the new cell visited.
-Line~\lnref{chk:visited} checks to see if it has already been visited, in which case
-line~\lnref{ret:fail} returns failure, but only after line~\lnref{chk:other}
+\Clnref{chk:visited} checks to see if it has already been visited, in which case
+\clnref{ret:fail} returns failure, but only after \clnref{chk:other}
 checks to see if
-we have encountered the other thread, in which case line~\lnref{located} indicates
+we have encountered the other thread, in which case \clnref{located} indicates
 that the solution has been located.
-Line~\lnref{update:new} updates to the new cell,
-lines~\lnref{update:visited:b} and~\lnref{update:visited:e} update this thread's visited
-array, and line~\lnref{ret:success} returns success.
+\Clnref{update:new} updates to the new cell,
+\clnref{update:visited:b,update:visited:e} update this thread's visited
+array, and \clnref{ret:success} returns success.
 \end{fcvref}
 
 \begin{figure}
@@ -374,7 +372,7 @@ array, and line~\lnref{ret:success} returns success.
 \end{figure}
 
 Performance testing revealed a surprising anomaly, shown in
-Figure~\ref{fig:SMPdesign:CDF of Solution Times For SEQ; PWQ; and PART}.
+\cref{fig:SMPdesign:CDF of Solution Times For SEQ; PWQ; and PART}.
 The median solution time for PART (17 milliseconds)
 is more than four times faster than that of SEQ (79 milliseconds),
 despite running on only two threads.
@@ -393,14 +391,14 @@ The next section analyzes this anomaly.
 The first reaction to a performance anomaly is to check for bugs.
 Although the algorithms were in fact finding valid solutions, the
 plot of CDFs in
-Figure~\ref{fig:SMPdesign:CDF of Solution Times For SEQ; PWQ; and PART}
+\cref{fig:SMPdesign:CDF of Solution Times For SEQ; PWQ; and PART}
 assumes independent data points.
 This is not the case:  The performance tests randomly generate a maze,
 and then run all solvers on that maze.
 It therefore makes sense to plot the CDF of the ratios of
 solution times for each generated maze,
 as shown in
-Figure~\ref{fig:SMPdesign:CDF of SEQ/PWQ and SEQ/PART Solution-Time Ratios},
+\cref{fig:SMPdesign:CDF of SEQ/PWQ and SEQ/PART Solution-Time Ratios},
 greatly reducing the CDFs' overlap.
 This plot reveals that for some mazes, PART
 is more than \emph{forty} times faster than SEQ\@.
@@ -431,7 +429,7 @@ Further investigation showed that
 PART sometimes visited fewer than 2\,\% of the maze's cells,
 while SEQ and PWQ never visited fewer than about 9\,\%.
 The reason for this difference is shown by
-Figure~\ref{fig:SMPdesign:Reason for Small Visit Percentages}.
+\cref{fig:SMPdesign:Reason for Small Visit Percentages}.
 If the thread traversing the solution from the upper left reaches
 the circle, the other thread cannot reach
 the upper-right portion of the maze.
@@ -446,7 +444,7 @@ This is a sharp contrast with decades of experience with
 parallel programming, where workers have struggled
 to keep threads \emph{out} of each others' way.
 
-Figure~\ref{fig:SMPdesign:Correlation Between Visit Percentage and Solution Time}
+\Cref{fig:SMPdesign:Correlation Between Visit Percentage and Solution Time}
 confirms a strong correlation between cells visited and solution time
 for all three methods.
 The slope of PART's scatterplot is smaller than that of SEQ,
@@ -467,7 +465,7 @@ The fraction of cells visited by PWQ is similar to that of SEQ\@.
 In addition, PWQ's solution time is greater than that of PART,
 even for equal visit fractions.
 The reason for this is shown in
-Figure~\ref{fig:SMPdesign:PWQ Potential Contention Points}, which has a red
+\cref{fig:SMPdesign:PWQ Potential Contention Points}, which has a red
 circle on each cell with more than two neighbors.
 Each such cell can result in contention in PWQ, because
 one thread can enter but two threads can exit, which hurts
@@ -485,12 +483,12 @@ Of course, SEQ never contends.
 
 Although PART's speedup is impressive, we should not neglect sequential
 optimizations.
-Figure~\ref{fig:SMPdesign:Effect of Compiler Optimization (-O3)} shows that
+\Cref{fig:SMPdesign:Effect of Compiler Optimization (-O3)} shows that
 SEQ, when compiled with -O3, is about twice as fast
 as unoptimized PWQ, approaching the performance of unoptimized PART\@.
 Compiling all three algorithms with -O3 gives results similar to
 (albeit faster than) those shown in
-Figure~\ref{fig:SMPdesign:CDF of SEQ/PWQ and SEQ/PART Solution-Time Ratios},
+\cref{fig:SMPdesign:CDF of SEQ/PWQ and SEQ/PART Solution-Time Ratios},
 except that PWQ provides almost no speedup compared
 to SEQ, in keeping with Amdahl's Law~\cite{GeneAmdahl1967AmdahlsLaw}.
 However, if the goal is to double performance compared to unoptimized
@@ -527,13 +525,13 @@ please proceed to the next section.
 The presence of algorithmic superlinear speedups suggests simulating
 parallelism via co-routines, for example, manually switching context
 between threads on each pass through the main do-while loop in
-Listing~\ref{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}.
+\cref{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}.
 This context switching is straightforward because the context
 consists only of the variables \co{c} and \co{vi}: Of the numerous
 ways to achieve the effect, this is a good tradeoff between
 context-switch overhead and visit percentage.
 As can be seen in
-Figure~\ref{fig:SMPdesign:Partitioned Coroutines},
+\cref{fig:SMPdesign:Partitioned Coroutines},
 this coroutine algorithm (COPART) is quite effective, with the performance
 on one thread being within about 30\,\% of PART on two threads
 (\path{maze_2seq.c}).
@@ -555,8 +553,8 @@ on one thread being within about 30\,\% of PART on two threads
 \label{fig:SMPdesign:Varying Maze Size vs. COPART}
 \end{figure}
 
-Figures~\ref{fig:SMPdesign:Varying Maze Size vs. SEQ}
-and~\ref{fig:SMPdesign:Varying Maze Size vs. COPART}
+\Cref{fig:SMPdesign:Varying Maze Size vs. SEQ,%
+fig:SMPdesign:Varying Maze Size vs. COPART}
 show the effects of varying maze size, comparing both PWQ and PART
 running on two threads
 against either SEQ or COPART, respectively, with 90\=/percent\-/confidence
@@ -569,8 +567,9 @@ the square of the frequency for high frequencies~\cite{TrevorMudge2000Power},
 so that 1.4x scaling on two threads consumes the same energy
 as a single thread at equal solution speeds.
 In contrast, PWQ shows poor scalability against both SEQ and COPART
-unless unoptimized: Figures~\ref{fig:SMPdesign:Varying Maze Size vs. SEQ} 
-and~\ref{fig:SMPdesign:Varying Maze Size vs. COPART}
+unless unoptimized:
+\Cref{fig:SMPdesign:Varying Maze Size vs. SEQ,%
+fig:SMPdesign:Varying Maze Size vs. COPART}
 were generated using -O3.
 
 \begin{figure}
@@ -580,7 +579,7 @@ were generated using -O3.
 \label{fig:SMPdesign:Mean Speedup vs. Number of Threads; 1000x1000 Maze}
 \end{figure}
 
-Figure~\ref{fig:SMPdesign:Mean Speedup vs. Number of Threads; 1000x1000 Maze}
+\Cref{fig:SMPdesign:Mean Speedup vs. Number of Threads; 1000x1000 Maze}
 shows the performance of PWQ and PART relative to COPART\@.
 For PART runs with more than two threads, the additional threads were
 started evenly spaced along the diagonal connecting the starting and
@@ -600,7 +599,7 @@ there is a lower probability of the third and subsequent threads making
 useful forward progress: Only the first two threads are guaranteed to start on
 the solution line.
 This disappointing performance compared to results in
-Figure~\ref{fig:SMPdesign:Varying Maze Size vs. COPART}
+\cref{fig:SMPdesign:Varying Maze Size vs. COPART}
 is due to the less-tightly integrated hardware available in the
 larger and older Xeon system running at 2.66\,GHz.
 
@@ -664,7 +663,7 @@ Yes, for this particular type of maze, intelligently applying parallelism
 identified a superior search strategy, but this sort of luck is no
 substitute for a clear focus on search strategy itself.
 
-As noted back in Section~\ref{sec:intro:Parallel Programming Goals},
+As noted back in \cref{sec:intro:Parallel Programming Goals},
 parallelism is but one potential optimization of many.
 A successful design needs to focus on the most important optimization.
 Much though I might wish to claim otherwise, that optimization might
diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
index 915454e1..a3f9bc66 100644
--- a/SMPdesign/criteria.tex
+++ b/SMPdesign/criteria.tex
@@ -14,7 +14,7 @@ Unfortunately, if your program is other than microscopically tiny,
 the space of possible parallel programs is so huge
 that convergence is not guaranteed in the lifetime of the universe.
 Besides, what exactly is the ``best possible parallel program''?
-After all, Section~\ref{sec:intro:Parallel Programming Goals}
+After all, \cref{sec:intro:Parallel Programming Goals}
 called out no fewer than three parallel-programming goals of
 \IX{performance}, \IX{productivity}, and \IX{generality},
 and the best possible performance will likely come at a cost in
@@ -38,7 +38,7 @@ are speedup,
 contention, overhead, read-to-write ratio, and complexity:
 \begin{description}
 \item[Speedup:]  As noted in
-	Section~\ref{sec:intro:Parallel Programming Goals},
+	\cref{sec:intro:Parallel Programming Goals},
 	increased performance is the major reason
 	to go to all of the time and trouble
 	required to parallelize it.
@@ -76,7 +76,7 @@ contention, overhead, read-to-write ratio, and complexity:
 	reducing overall synchronization overhead.
 	Corresponding optimizations are possible for frequently
 	updated data structures, as discussed in
-	Chapter~\ref{chp:Counting}.
+	\cref{chp:Counting}.
 \item[Complexity:]  A parallel program is more complex than
 	an equivalent sequential program because the parallel program
 	has a much larger state space than does the sequential program,
@@ -100,7 +100,7 @@ contention, overhead, read-to-write ratio, and complexity:
 	there may be potential sequential optimizations
 	that are cheaper and more effective than parallelization.
 	As noted in
-	Section~\ref{sec:intro:Performance},
+	\cref{sec:intro:Performance},
 	parallelization is but one performance optimization of
 	many, and is furthermore an optimization that applies
 	most readily to CPU-based bottlenecks.
@@ -155,7 +155,7 @@ parallel program.
 	This can be accomplished by batching critical sections,
 	using data ownership (see \cref{chp:Data Ownership}),
 	using asymmetric primitives
-	(see Section~\ref{chp:Deferred Processing}),
+	(see \cref{chp:Deferred Processing}),
 	or by using a coarse-grained design such as \IXh{code}{locking}.
 \item	If the critical sections have high overhead compared
 	to the primitives guarding them, the best way
diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index a84cc74f..56aa52d1 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -28,7 +28,7 @@ revisits the double-ended queue.
 \ContributedBy{Figure}{fig:SMPdesign:Dining Philosophers Problem}{Kornilios Kourtis}
 \end{figure}
 
-Figure~\ref{fig:SMPdesign:Dining Philosophers Problem} shows a diagram
+\Cref{fig:SMPdesign:Dining Philosophers Problem} shows a diagram
 of the classic \IX{Dining Philosophers problem}~\cite{Dijkstra1971HOoSP}.
 This problem features five philosophers who do nothing but think and
 eat a ``very difficult kind of spaghetti'' which requires two forks
@@ -57,7 +57,7 @@ eating, and because none of them may pick up their second fork until at
 least one of them has finished eating, they all starve.
 Please note that it is not sufficient to allow at least one philosopher
 to eat.
-As Figure~\ref{fig:cpu:Partial Starvation Is Also Bad}
+As \cref{fig:cpu:Partial Starvation Is Also Bad}
 shows, starvation of even a few of the philosophers is to be avoided.
 
 \begin{figure}
@@ -77,7 +77,7 @@ in the late 1980s or early 1990s.\footnote{
 	is to publish something, wait 50 years, and then see
 	how well \emph{your} ideas stood the test of time.}
 More recent solutions number the forks as shown in
-Figure~\ref{fig:SMPdesign:Dining Philosophers Problem; Textbook Solution}.
+\cref{fig:SMPdesign:Dining Philosophers Problem; Textbook Solution}.
 Each philosopher picks up the lowest-numbered fork next to his or her
 plate, then picks up the other fork.
 The philosopher sitting in the uppermost position in the diagram thus
@@ -118,7 +118,7 @@ It should be possible to do better than this!
 \end{figure}
 
 One approach is shown in
-Figure~\ref{fig:SMPdesign:Dining Philosophers Problem; Partitioned},
+\cref{fig:SMPdesign:Dining Philosophers Problem; Partitioned},
 which includes four philosophers rather than five to better illustrate the
 partition technique.
 Here the upper and rightmost philosophers share a pair of forks,
@@ -134,7 +134,7 @@ the acquisition and release algorithms.
 	Philosophers Problem?
 }\QuickQuizAnswer{
 	One such improved solution is shown in
-	Figure~\ref{fig:SMPdesign:Dining Philosophers Problem; Fully Partitioned},
+	\cref{fig:SMPdesign:Dining Philosophers Problem; Fully Partitioned},
 	where the philosophers are simply provided with an additional
 	five forks.
 	All five philosophers may now eat simultaneously, and there
@@ -202,7 +202,7 @@ One seemingly straightforward approach would be to use a doubly
 linked list with a left-hand lock
 for left-hand-end enqueue and dequeue operations along with a right-hand
 lock for right-hand-end operations, as shown in
-Figure~\ref{fig:SMPdesign:Double-Ended Queue With Left- and Right-Hand Locks}.
+\cref{fig:SMPdesign:Double-Ended Queue With Left- and Right-Hand Locks}.
 However, the problem with this approach is that the two locks'
 domains must overlap when there are fewer than four elements on the
 list.
@@ -231,7 +231,7 @@ It is far better to consider other designs.
 \end{figure}
 
 One way of forcing non-overlapping lock domains is shown in
-Figure~\ref{fig:SMPdesign:Compound Double-Ended Queue}.
+\cref{fig:SMPdesign:Compound Double-Ended Queue}.
 Two separate double-ended queues are run in tandem, each protected by
 its own lock.
 This means that elements must occasionally be shuttled from one of
@@ -298,7 +298,7 @@ the queue.
 
 Given this approach, we assign one lock to guard the left-hand index,
 one to guard the right-hand index, and one lock for each hash chain.
-Figure~\ref{fig:SMPdesign:Hashed Double-Ended Queue} shows the resulting
+\Cref{fig:SMPdesign:Hashed Double-Ended Queue} shows the resulting
 data structure given four hash chains.
 Note that the lock domains do not overlap, and that deadlock is avoided
 by acquiring the index locks before the chain locks, and by never
@@ -314,21 +314,21 @@ acquiring more than one lock of a given type (index or chain) at a time.
 Each hash chain is itself a double-ended queue, and in this example,
 each holds every fourth element.
 The uppermost portion of
-Figure~\ref{fig:SMPdesign:Hashed Double-Ended Queue After Insertions}
+\cref{fig:SMPdesign:Hashed Double-Ended Queue After Insertions}
 shows the state after a single element (``R$_1$'') has been
 right-enqueued, with the right-hand index having been incremented to
 reference hash chain~2.
 The middle portion of this same figure shows the state after
 three more elements have been right-enqueued.
 As you can see, the indexes are back to their initial states
-(see Figure~\ref{fig:SMPdesign:Hashed Double-Ended Queue}), however,
+(see \cref{fig:SMPdesign:Hashed Double-Ended Queue}), however,
 each hash chain is now non-empty.
 The lower portion of this figure shows the state after three additional
 elements have been left-enqueued and an additional element has been
 right-enqueued.
 
 From the last state shown in
-Figure~\ref{fig:SMPdesign:Hashed Double-Ended Queue After Insertions},
+\cref{fig:SMPdesign:Hashed Double-Ended Queue After Insertions},
 a left-dequeue operation would return element ``L$_{-2}$'' and leave
 the left-hand index referencing hash chain~2, which would then
 contain only a single element (``R$_2$'').
@@ -343,7 +343,7 @@ can be reduced to arbitrarily low levels by using a larger hash table.
 \label{fig:SMPdesign:Hashed Double-Ended Queue With 16 Elements}
 \end{figure}
 
-Figure~\ref{fig:SMPdesign:Hashed Double-Ended Queue With 16 Elements}
+\Cref{fig:SMPdesign:Hashed Double-Ended Queue With 16 Elements}
 shows how 16 elements would be organized in a four-hash-bucket
 parallel double-ended queue.
 Each underlying single-lock double-ended queue holds a one-quarter
@@ -355,16 +355,16 @@ slice of the full parallel double-ended queue.
 \label{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Data Structure}
 \end{listing}
 
-Listing~\ref{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Data Structure}
+\Cref{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Data Structure}
 shows the corresponding C-language data structure, assuming an
 existing \co{struct deq} that provides a trivially locked
 double-ended-queue implementation.
 \begin{fcvref}[ln:SMPdesign:lockhdeq:struct_pdeq]
-This data structure contains the left-hand lock on line~\lnref{llock},
-the left-hand index on line~\lnref{lidx}, the right-hand lock on line~\lnref{rlock}
+This data structure contains the left-hand lock on \clnref{llock},
+the left-hand index on \clnref{lidx}, the right-hand lock on \clnref{rlock}
 (which is cache-aligned in the actual implementation),
-the right-hand index on line~\lnref{ridx}, and, finally, the hashed array
-of simple lock-based double-ended queues on line~\lnref{bkt}.
+the right-hand index on \clnref{ridx}, and, finally, the hashed array
+of simple lock-based double-ended queues on \clnref{bkt}.
 A high-performance implementation would of course use padding or special
 alignment directives to avoid false sharing.
 \end{fcvref}
@@ -375,7 +375,7 @@ alignment directives to avoid false sharing.
 \label{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Implementation}
 \end{listing}
 
-Listing~\ref{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Implementation}
+\Cref{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Implementation}
 (\path{lockhdeq.c})
 shows the implementation of the enqueue and dequeue functions.\footnote{
 	One could easily create a polymorphic implementation in any
@@ -388,14 +388,14 @@ operations are trivially derived from them.
 \Clnrefrange{b}{e} show \co{pdeq_pop_l()},
 which left\-/dequeues and returns
 an element if possible, returning \co{NULL} otherwise.
-Line~\lnref{acq} acquires the left-hand spinlock,
-and line~\lnref{idx} computes the
+\Clnref{acq} acquires the left-hand spinlock,
+and \clnref{idx} computes the
 index to be dequeued from.
-Line~\lnref{deque} dequeues the element, and,
-if line~\lnref{check} finds the result to be
-non-\co{NULL}, line~\lnref{record} records the new left-hand index.
-Either way, line~\lnref{rel} releases the lock, and,
-finally, line~\lnref{return} returns
+\Clnref{deque} dequeues the element, and,
+if \clnref{check} finds the result to be
+non-\co{NULL}, \clnref{record} records the new left-hand index.
+Either way, \clnref{rel} releases the lock, and,
+finally, \clnref{return} returns
 the element if there was one, or \co{NULL} otherwise.
 \end{fcvref}
 
@@ -403,14 +403,14 @@ the element if there was one, or \co{NULL} otherwise.
 \Clnrefrange{b}{e} show \co{pdeq_push_l()},
 which left-enqueues the specified
 element.
-Line~\lnref{acq} acquires the left-hand lock,
-and line~\lnref{idx} picks up the left-hand
+\Clnref{acq} acquires the left-hand lock,
+and \clnref{idx} picks up the left-hand
 index.
-Line~\lnref{enque} left-enqueues the specified element
+\Clnref{enque} left-enqueues the specified element
 onto the double-ended queue
 indexed by the left-hand index.
-Line~\lnref{update} then updates the left-hand index
-and line~\lnref{rel} releases the lock.
+\Clnref{update} then updates the left-hand index
+and \clnref{rel} releases the lock.
 \end{fcvref}
 
 As noted earlier, the right-hand operations are completely analogous
@@ -472,7 +472,7 @@ neither locks nor atomic operations.
 \label{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
 \end{listing}
 
-Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
+\Cref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
 shows the implementation.
 Unlike the hashed implementation, this compound implementation is
 asymmetric, so that we must consider the \co{pdeq_pop_l()}
@@ -485,71 +485,71 @@ and \co{pdeq_pop_r()} implementations separately.
 	The need to avoid deadlock by imposing a lock hierarchy
 	forces the asymmetry, just as it does in the fork-numbering
 	solution to the Dining Philosophers Problem
-	(see Section~\ref{sec:SMPdesign:Dining Philosophers Problem}).
+	(see \cref{sec:SMPdesign:Dining Philosophers Problem}).
 }\QuickQuizEnd
 
 \begin{fcvref}[ln:SMPdesign:locktdeq:pop_push:popl]
 The \co{pdeq_pop_l()} implementation is shown on
 \clnrefrange{b}{e}
 of the figure.
-Line~\lnref{acq:l} acquires the left-hand lock,
-which line~\lnref{rel:l} releases.
-Line~\lnref{deq:ll} attempts to left-dequeue an element
+\Clnref{acq:l} acquires the left-hand lock,
+which \clnref{rel:l} releases.
+\Clnref{deq:ll} attempts to left-dequeue an element
 from the left-hand underlying
 double-ended queue, and, if successful,
 skips \clnrefrange{acq:r}{skip} to simply
 return this element.
-Otherwise, line~\lnref{acq:r} acquires the right-hand lock, line~\lnref{deq:lr}
+Otherwise, \clnref{acq:r} acquires the right-hand lock, \clnref{deq:lr}
 left-dequeues an element from the right-hand queue,
-and line~\lnref{move} moves any remaining elements on the right-hand
-queue to the left-hand queue, line~\lnref{init:r} initializes
+and \clnref{move} moves any remaining elements on the right-hand
+queue to the left-hand queue, \clnref{init:r} initializes
 the right-hand queue,
-and line~\lnref{rel:r} releases the right-hand lock.
-The element, if any, that was dequeued on line~\lnref{deq:lr} will be returned.
+and \clnref{rel:r} releases the right-hand lock.
+The element, if any, that was dequeued on \clnref{deq:lr} will be returned.
 \end{fcvref}
 
 \begin{fcvref}[ln:SMPdesign:locktdeq:pop_push:popr]
 The \co{pdeq_pop_r()} implementation is shown on \clnrefrange{b}{e}
 of the figure.
-As before, line~\lnref{acq:r1} acquires the right-hand lock
-(and line~\lnref{rel:r2}
-releases it), and line~\lnref{deq:rr1} attempts to right-dequeue an element
+As before, \clnref{acq:r1} acquires the right-hand lock
+(and \clnref{rel:r2}
+releases it), and \clnref{deq:rr1} attempts to right-dequeue an element
 from the right-hand queue, and, if successful,
 skips \clnrefrange{rel:r1}{skip2}
 to simply return this element.
-However, if line~\lnref{check1} determines that there was no element to dequeue,
-line~\lnref{rel:r1} releases the right-hand lock and
+However, if \clnref{check1} determines that there was no element to dequeue,
+\clnref{rel:r1} releases the right-hand lock and
 \clnrefrange{acq:l}{acq:r2} acquire both
 locks in the proper order.
-Line~\lnref{deq:rr2} then attempts to right-dequeue an element
+\Clnref{deq:rr2} then attempts to right-dequeue an element
 from the right-hand
-list again, and if line~\lnref{check2} determines that this second attempt has
-failed, line~\lnref{deq:rl} right-dequeues an element from the left-hand queue
-(if there is one available), line~\lnref{move} moves any remaining elements
-from the left-hand queue to the right-hand queue, and line~\lnref{init:l}
+list again, and if \clnref{check2} determines that this second attempt has
+failed, \clnref{deq:rl} right-dequeues an element from the left-hand queue
+(if there is one available), \clnref{move} moves any remaining elements
+from the left-hand queue to the right-hand queue, and \clnref{init:l}
 initializes the left-hand queue.
-Either way, line~\lnref{rel:l} releases the left-hand lock.
+Either way, \clnref{rel:l} releases the left-hand lock.
 \end{fcvref}
 
 \QuickQuizSeries{%
 \QuickQuizB{
 	Why is it necessary to retry the right-dequeue operation
-	on line~\ref{ln:SMPdesign:locktdeq:pop_push:popr:deq:rr2} of
-	Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}?
+	on \clnrefr{ln:SMPdesign:locktdeq:pop_push:popr:deq:rr2} of
+	\cref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}?
 }\QuickQuizAnswerB{
 	\begin{fcvref}[ln:SMPdesign:locktdeq:pop_push:popr]
 	This retry is necessary because some other thread might have
 	enqueued an element between the time that this thread dropped
-	\co{d->rlock} on line~\lnref{rel:r1} and the time that it reacquired this
-	same lock on line~\lnref{acq:r2}.
+	\co{d->rlock} on \clnref{rel:r1} and the time that it reacquired this
+	same lock on \clnref{acq:r2}.
 	\end{fcvref}
 }\QuickQuizEndB
 %
 \QuickQuizE{
 	Surely the left-hand lock must \emph{sometimes} be available!!!
 	So why is it necessary that
-        line~\ref{ln:SMPdesign:locktdeq:pop_push:popr:rel:r1} of
-	Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
+	\clnrefr{ln:SMPdesign:locktdeq:pop_push:popr:rel:r1} of
+	\cref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
 	unconditionally release the right-hand lock?
 }\QuickQuizAnswerE{
 	It would be possible to use \co{spin_trylock()} to attempt
@@ -564,10 +564,10 @@ Either way, line~\lnref{rel:l} releases the left-hand lock.
 \begin{fcvref}[ln:SMPdesign:locktdeq:pop_push:pushl]
 The \co{pdeq_push_l()} implementation is shown on
 \clnrefrange{b}{e} of
-Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}.
-Line~\lnref{acq:l} acquires the left-hand spinlock,
-line~\lnref{que:l} left-enqueues the
-element onto the left-hand queue, and finally line~\lnref{rel:l} releases
+\cref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}.
+\Clnref{acq:l} acquires the left-hand spinlock,
+\clnref{que:l} left-enqueues the
+element onto the left-hand queue, and finally \clnref{rel:l} releases
 the lock.
 \end{fcvref}
 \begin{fcvref}[ln:SMPdesign:locktdeq:pop_push:pushr]
@@ -578,7 +578,7 @@ is quite similar.
 \QuickQuiz{
 	But in the case where data is flowing in only one direction,
 	the algorithm shown in
-	Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
+	\cref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
 	will have both ends attempting to acquire the same lock
 	whenever the consuming end empties its underlying
 	double-ended queue.
@@ -612,7 +612,7 @@ is quite similar.
 
 The compound implementation is somewhat more complex than the
 hashed variant presented in
-Section~\ref{sec:SMPdesign:Hashed Double-Ended Queue},
+\cref{sec:SMPdesign:Hashed Double-Ended Queue},
 but is still reasonably simple.
 Of course, a more intelligent rebalancing scheme could be arbitrarily
 complex, but the simple scheme shown here has been shown to
@@ -647,7 +647,7 @@ outperforms any of the parallel implementations they studied.
 Therefore, the key point is that there can be significant overhead enqueuing to
 or dequeuing from a shared queue, regardless of implementation.
 This should come as no surprise in light of the material in
-Chapter~\ref{chp:Hardware and its Habits}, given the strict
+\cref{chp:Hardware and its Habits}, given the strict
 first-in-first-out (FIFO) nature of these queues.
 
 Furthermore, these strict FIFO queues are strictly FIFO only with
@@ -683,7 +683,7 @@ overall design.
 
 The optimal solution to the dining philosophers problem given in
 the answer to the Quick Quiz in
-Section~\ref{sec:SMPdesign:Dining Philosophers Problem}
+\cref{sec:SMPdesign:Dining Philosophers Problem}
 is an excellent example of ``horizontal parallelism'' or
 ``data parallelism''.
 The synchronization overhead in this case is nearly (or even exactly)
@@ -746,7 +746,7 @@ larger units of work to obtain a given level of efficiency.
 	This batching approach decreases contention on the queue data
 	structures, which increases both performance and scalability,
 	as will be seen in
-	Section~\ref{sec:SMPdesign:Synchronization Granularity}.
+	\cref{sec:SMPdesign:Synchronization Granularity}.
 	After all, if you must incur high synchronization overheads,
 	be sure you are getting your money's worth.
 
@@ -758,7 +758,7 @@ larger units of work to obtain a given level of efficiency.
 
 These two examples show just how powerful partitioning can be in
 devising parallel algorithms.
-Section~\ref{sec:SMPdesign:Locking Granularity and Performance}
+\Cref{sec:SMPdesign:Locking Granularity and Performance}
 looks briefly at a third example, matrix multiply.
 However, all three of these examples beg for more and better design
 criteria for parallel programs, a topic taken up in the next section.
-- 
2.17.1


