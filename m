Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=9t7tDd+KkXerJ9TroIInYrv2i2B+TVXA6PUoM5CF8Bw=;
 b=YDaMhvij3lSysM6EKrdUQpYfH9fR+ft/9uwBKyrfZYpfdnJVv4Aaw5fTb0xxVEgHQj
 oNvar1mWjrlTcfp67+3/7J2YDIvMMO5ZD/O1tPP3Kual8ttrwgbsj/K4d010U323mqDm
 1DqMf9qXJutVy3HUFnnDv1As/uPVPFbhe2fE5ki9GYTLC2ne0EJb5CIrGytGtwV78Sa4
 6dEAdlm4blJzUb7HzcvVsZNvkcPCZUSTSPirSe6WQpN/IOW+ebtHB+I4L7uBVjkSYtHF
 72J2K8hsbMvIg/GEwRIS5ui4jJ4XIMTD0VshMMCWPULmRg/r7YkBwWEBIq7GTNCAdVCs
 tyCg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Convert code snippets to 'listing' env (SMPdesign, locking,
 defer)
Message-ID: <a83ce6f6-cb5f-ab17-b65f-b77203ed51db@gmail.com>
Date: Thu, 12 Oct 2017 07:07:17 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 096ac85c06a27b8e8895e35bb58c634869a5a979 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 11 Oct 2017 23:04:11 +0900
Subject: [PATCH] Convert code snippets to 'listing' env (SMPdesign, locking, defer)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex       | 72 +++++++++++++++++------------------
 SMPdesign/partexercises.tex   | 32 ++++++++--------
 defer/defer.tex               |  8 ++--
 defer/hazptr.tex              | 36 +++++++++---------
 defer/rcuapi.tex              | 16 ++++----
 defer/rcufundamental.tex      | 46 +++++++++++-----------
 defer/rcuusage.tex            | 76 ++++++++++++++++++-------------------
 defer/refcnt.tex              | 32 ++++++++--------
 defer/seqlock.tex             | 52 ++++++++++++-------------
 locking/locking-existence.tex | 20 +++++-----
 locking/locking.tex           | 88 +++++++++++++++++++++----------------------
 11 files changed, 239 insertions(+), 239 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 81219cb..0dbef1e 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -111,7 +111,7 @@ Again, if a program runs quickly enough on a single processor,
 spare yourself the overhead and complexity of SMP synchronization
 primitives.
 The simplicity of the hash-table lookup code in
-Figure~\ref{fig:SMPdesign:Sequential-Program Hash Table Search}
+Listing~\ref{lst:SMPdesign:Sequential-Program Hash Table Search}
 underscores this point.\footnote{
 	The examples in this section are taken from Hart et
 	al.~\cite{ThomasEHart2006a}, adapted for clarity
@@ -121,7 +121,7 @@ limited to the number of CPUs.
 In contrast, speedups due to sequential optimizations, for example,
 careful choice of data structure, can be arbitrarily large.

-\begin{figure}[tbhp]
+\begin{listing}[tbhp]
 { \scriptsize
 \begin{verbbox}
   1 struct hash_table
@@ -153,8 +153,8 @@ careful choice of data structure, can be arbitrarily large.
 \centering
 \theverbbox
 \caption{Sequential-Program Hash Table Search}
-\label{fig:SMPdesign:Sequential-Program Hash Table Search}
-\end{figure}
+\label{lst:SMPdesign:Sequential-Program Hash Table Search}
+\end{listing}

 % ./test_hash_null.exe 1000 0/100 1 1024 1
 % ./test_hash_null.exe: nmilli: 1000 update/total: 0/100 nelements: 1 nbuckets: 1024 nthreads: 1
@@ -191,14 +191,14 @@ from which only modest scaling is required.  In these cases,
 code locking will provide a relatively simple program that is
 very similar to its sequential counterpart,
 as can be seen in
-Figure~\ref{fig:SMPdesign:Code-Locking Hash Table Search}.
+Listing~\ref{lst:SMPdesign:Code-Locking Hash Table Search}.
 However, note that the simple return of the comparison in
 \co{hash_search()} in
-Figure~\ref{fig:SMPdesign:Sequential-Program Hash Table Search}
+Listing~\ref{lst:SMPdesign:Sequential-Program Hash Table Search}
 has now become three statements due to the need to release the
 lock before returning.

-\begin{figure}[tbhp]
+\begin{listing}[tbhp]
 { \scriptsize
 \begin{verbbox}
   1 spinlock_t hash_lock;
@@ -237,8 +237,8 @@ lock before returning.
 \centering
 \theverbbox
 \caption{Code-Locking Hash Table Search}
-\label{fig:SMPdesign:Code-Locking Hash Table Search}
-\end{figure}
+\label{lst:SMPdesign:Code-Locking Hash Table Search}
+\end{listing}

 Unfortunately, code locking is particularly prone to ``lock contention'',
 where multiple CPUs need to acquire the lock concurrently.
@@ -289,11 +289,11 @@ Data locking reduces contention by distributing the instances
 of the overly-large critical section across multiple data structures,
 for example, maintaining per-hash-bucket critical sections in a
 hash table, as shown in
-Figure~\ref{fig:SMPdesign:Data-Locking Hash Table Search}.
+Listing~\ref{lst:SMPdesign:Data-Locking Hash Table Search}.
 The increased scalability again results in a slight increase in complexity
 in the form of an additional data structure, the \co{struct bucket}.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
   1 struct hash_table
@@ -337,8 +337,8 @@ in the form of an additional data structure, the \co{struct bucket}.
 \centering
 \theverbbox
 \caption{Data-Locking Hash Table Search}
-\label{fig:SMPdesign:Data-Locking Hash Table Search}
-\end{figure}
+\label{lst:SMPdesign:Data-Locking Hash Table Search}
+\end{listing}

 In contrast with the contentious situation
 shown in Figure~\ref{fig:SMPdesign:Lock Contention},
@@ -405,7 +405,7 @@ A key challenge with data locking on dynamically allocated structures
 is ensuring that the structure remains in existence while the lock is
 being acquired.
 The code in
-Figure~\ref{fig:SMPdesign:Data-Locking Hash Table Search}
+Listing~\ref{lst:SMPdesign:Data-Locking Hash Table Search}
 finesses this challenge by placing the locks in the statically allocated
 hash buckets, which are never freed.
 However, this trick would not work if the hash table were resizeable,
@@ -524,7 +524,7 @@ results resembling that shown in Figure~\ref{fig:SMPdesign:Data and Skew}.
 However, in situations where no sharing is required, data ownership
 achieves ideal performance, and with code that can be as simple
 as the sequential-program case shown in
-Figure~\ref{fig:SMPdesign:Sequential-Program Hash Table Search}.
+Listing~\ref{lst:SMPdesign:Sequential-Program Hash Table Search}.
 Such situations are often referred to as ``embarrassingly
 parallel'', and, in the best case, resemble the situation
 previously shown in Figure~\ref{fig:SMPdesign:Data Locking}.
@@ -803,10 +803,10 @@ Writers exclude both readers and each other.
 There are many implementations of reader-writer locking, including
 the POSIX implementation described in
 Section~\ref{sec:toolsoftrade:POSIX Reader-Writer Locking}.
-Figure~\ref{fig:SMPdesign:Reader-Writer-Locking Hash Table Search}
+Listing~\ref{lst:SMPdesign:Reader-Writer-Locking Hash Table Search}
 shows how the hash search might be implemented using reader-writer locking.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 rwlock_t hash_lock;
@@ -845,8 +845,8 @@ shows how the hash search might be implemented using reader-writer locking.
 \centering
 \theverbbox
 \caption{Reader-Writer-Locking Hash Table Search}
-\label{fig:SMPdesign:Reader-Writer-Locking Hash Table Search}
-\end{figure}
+\label{lst:SMPdesign:Reader-Writer-Locking Hash Table Search}
+\end{listing}

 Reader/writer locking is a simple instance of asymmetric locking.
 Snaman~\cite{Snaman87} describes a more ornate six-mode
@@ -861,7 +861,7 @@ Chapter~\ref{chp:Locking}.
 The idea behind hierarchical locking is to have a coarse-grained lock
 that is held only long enough to work out which fine-grained lock
 to acquire.
-Figure~\ref{fig:SMPdesign:Hierarchical-Locking Hash Table Search}
+Listing~\ref{lst:SMPdesign:Hierarchical-Locking Hash Table Search}
 shows how our hash-table search might be adapted to do hierarchical
 locking, but also shows the great weakness of this approach:
 we have paid the overhead of acquiring a second lock, but we only
@@ -869,7 +869,7 @@ hold it for a short time.
 In this case, the simpler data-locking approach would be simpler
 and likely perform better.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
   1 struct hash_table
@@ -916,14 +916,14 @@ and likely perform better.
 \centering
 \theverbbox
 \caption{Hierarchical-Locking Hash Table Search}
-\label{fig:SMPdesign:Hierarchical-Locking Hash Table Search}
-\end{figure}
+\label{lst:SMPdesign:Hierarchical-Locking Hash Table Search}
+\end{listing}

 \QuickQuiz{}
 	In what situation would hierarchical locking work well?
 \QuickQuizAnswer{
 	If the comparison on line~31 of
-	Figure~\ref{fig:SMPdesign:Hierarchical-Locking Hash Table Search}
+	Listing~\ref{lst:SMPdesign:Hierarchical-Locking Hash Table Search}
 	were replaced by a much heavier-weight operation,
 	then releasing \co{bp->bucket_lock} \emph{might} reduce lock
 	contention enough to outweigh the overhead of the extra
@@ -987,7 +987,7 @@ blocks from the global pool.

 The actual data structures for a ``toy'' implementation of allocator
 caches are shown in
-Figure~\ref{fig:SMPdesign:Allocator-Cache Data Structures}.
+Listing~\ref{lst:SMPdesign:Allocator-Cache Data Structures}.
 The ``Global Pool'' of Figure~\ref{fig:SMPdesign:Allocator Cache Schematic}
 is implemented by \co{globalmem} of type \co{struct globalmempool},
 and the two CPU pools by the per-CPU variable \co{percpumem} of
@@ -1006,7 +1006,7 @@ must be empty.\footnote{
 	size makes it easier to single-step the program in order to get
 	a feel for its operation.}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 #define TARGET_POOL_SIZE 3
@@ -1029,8 +1029,8 @@ must be empty.\footnote{
 \centering
 \theverbbox
 \caption{Allocator-Cache Data Structures}
-\label{fig:SMPdesign:Allocator-Cache Data Structures}
-\end{figure}
+\label{lst:SMPdesign:Allocator-Cache Data Structures}
+\end{listing}

 The operation of the pool data structures is illustrated by
 Figure~\ref{fig:SMPdesign:Allocator Pool Schematic},
@@ -1053,7 +1053,7 @@ smaller than the number of non-\co{NULL} pointers.
 \subsubsection{Allocation Function}

 The allocation function \co{memblock_alloc()} may be seen in
-Figure~\ref{fig:SMPdesign:Allocator-Cache Allocator Function}.
+Listing~\ref{lst:SMPdesign:Allocator-Cache Allocator Function}.
 Line~7 picks up the current thread's per-thread pool,
 and line~8 check to see if it is empty.

@@ -1068,7 +1068,7 @@ In either case, line~18 checks for the per-thread pool still being
 empty, and if not, lines~19-21 remove a block and return it.
 Otherwise, line~23 tells the sad tale of memory exhaustion.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct memblock *memblock_alloc(void)
@@ -1100,12 +1100,12 @@ Otherwise, line~23 tells the sad tale of memory exhaustion.
 \centering
 \theverbbox
 \caption{Allocator-Cache Allocator Function}
-\label{fig:SMPdesign:Allocator-Cache Allocator Function}
-\end{figure}
+\label{lst:SMPdesign:Allocator-Cache Allocator Function}
+\end{listing}

 \subsubsection{Free Function}

-Figure~\ref{fig:SMPdesign:Allocator-Cache Free Function} shows
+Listing~\ref{lst:SMPdesign:Allocator-Cache Free Function} shows
 the memory-block free function.
 Line~6 gets a pointer to this thread's pool, and
 line~7 checks to see if this per-thread pool is full.
@@ -1119,7 +1119,7 @@ value.
 In either case, line~16 then places the newly freed block into the
 per-thread pool.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void memblock_free(struct memblock *p)
@@ -1144,8 +1144,8 @@ per-thread pool.
 \centering
 \theverbbox
 \caption{Allocator-Cache Free Function}
-\label{fig:SMPdesign:Allocator-Cache Free Function}
-\end{figure}
+\label{lst:SMPdesign:Allocator-Cache Free Function}
+\end{listing}

 \subsubsection{Performance}

diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index f158f57..db4b5d8 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -341,7 +341,7 @@ parallel double-ended queue.
 Each underlying single-lock double-ended queue holds a one-quarter
 slice of the full parallel double-ended queue.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct pdeq {
@@ -356,10 +356,10 @@ slice of the full parallel double-ended queue.
 \centering
 \theverbbox
 \caption{Lock-Based Parallel Double-Ended Queue Data Structure}
-\label{fig:SMPdesign:Lock-Based Parallel Double-Ended Queue Data Structure}
-\end{figure}
+\label{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Data Structure}
+\end{listing}

-Figure~\ref{fig:SMPdesign:Lock-Based Parallel Double-Ended Queue Data Structure}
+Listing~\ref{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Data Structure}
 shows the corresponding C-language data structure, assuming an
 existing \co{struct deq} that provides a trivially locked
 double-ended-queue implementation.
@@ -371,7 +371,7 @@ of simple lock-based double-ended queues on line~6.
 A high-performance implementation would of course use padding or special
 alignment directives to avoid false sharing.

-\begin{figure*}[bp]
+\begin{listing*}[bp]
 { \scriptsize
 \begin{verbbox}
   1 struct cds_list_head *pdeq_pop_l(struct pdeq *d)
@@ -428,10 +428,10 @@ alignment directives to avoid false sharing.
 \centering
 \theverbbox
 \caption{Lock-Based Parallel Double-Ended Queue Implementation}
-\label{fig:SMPdesign:Lock-Based Parallel Double-Ended Queue Implementation}
-\end{figure*}
+\label{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Implementation}
+\end{listing*}

-Figure~\ref{fig:SMPdesign:Lock-Based Parallel Double-Ended Queue Implementation}
+Listing~\ref{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Implementation}
 (\path{lockhdeq.c})
 shows the implementation of the enqueue and dequeue functions.\footnote{
 	One could easily create a polymorphic implementation in any
@@ -510,7 +510,7 @@ the previous section, the compound implementation will build on
 a sequential implementation of a double-ended queue that uses
 neither locks nor atomic operations.

-\begin{figure*}[bp]
+\begin{listing*}[bp]
 { \scriptsize
 \begin{verbbox}
   1 struct cds_list_head *pdeq_pop_l(struct pdeq *d)
@@ -574,10 +574,10 @@ neither locks nor atomic operations.
 \centering
 \theverbbox
 \caption{Compound Parallel Double-Ended Queue Implementation}
-\label{fig:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
-\end{figure*}
+\label{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
+\end{listing*}

-Figure~\ref{fig:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
+Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
 shows the implementation.
 Unlike the hashed implementation, this compound implementation is
 asymmetric, so that we must consider the \co{pdeq_pop_l()}
@@ -626,7 +626,7 @@ Either way, line~34 releases the left-hand lock.
 \QuickQuiz{}
 	Why is it necessary to retry the right-dequeue operation
 	on line~28 of
-	Figure~\ref{fig:SMPdesign:Compound Parallel Double-Ended Queue Implementation}?
+	Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}?
 \QuickQuizAnswer{
 	This retry is necessary because some other thread might have
 	enqueued an element between the time that this thread dropped
@@ -637,7 +637,7 @@ Either way, line~34 releases the left-hand lock.
 \QuickQuiz{}
 	Surely the left-hand lock must \emph{sometimes} be available!!!
 	So why is it necessary that line~25 of
-	Figure~\ref{fig:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
+	Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
 	unconditionally release the right-hand lock?
 \QuickQuizAnswer{
 	It would be possible to use \co{spin_trylock()} to attempt
@@ -649,7 +649,7 @@ Either way, line~34 releases the left-hand lock.
 } \QuickQuizEnd

 The \co{pdeq_push_l()} implementation is shown on lines~40-47 of
-Figure~\ref{fig:SMPdesign:Compound Parallel Double-Ended Queue Implementation}.
+Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}.
 Line~44 acquires the left-hand spinlock, line~45 left-enqueues the
 element onto the left-hand queue, and finally line~46 releases
 the lock.
@@ -659,7 +659,7 @@ is quite similar.
 \QuickQuiz{}
 	But in the case where data is flowing in only one direction,
 	the algorithm shown in
-	Figure~\ref{fig:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
+	Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
 	will have both ends attempting to acquire the same lock
 	whenever the consuming end empties its underlying
 	double-ended queue.
diff --git a/defer/defer.tex b/defer/defer.tex
index 020b8b9..190bd36 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -68,7 +68,7 @@ list to evaluate a number of read-mostly synchronization techniques.
 \label{fig:defer:Pre-BSD Packet Routing List}
 \end{figure}

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 struct route_entry {
@@ -126,10 +126,10 @@ list to evaluate a number of read-mostly synchronization techniques.
 \centering
 \theverbbox
 \caption{Sequential Pre-BSD Routing Table}
-\label{fig:defer:Sequential Pre-BSD Routing Table}
-\end{figure}
+\label{lst:defer:Sequential Pre-BSD Routing Table}
+\end{listing}

-Figure~\ref{fig:defer:Sequential Pre-BSD Routing Table}
+Listing~\ref{lst:defer:Sequential Pre-BSD Routing Table}
 shows a simple single-threaded implementation corresponding to
 Figure~\ref{fig:defer:Pre-BSD Packet Routing List}.
 Lines~1-5 define a \co{route_entry} structure and line~6 defines
diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index bd4fd64..bd2ff24 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -19,7 +19,7 @@ Therefore, if that element has been rendered inaccessible to readers,
 and there are no longer any hazard pointers referencing it, that element
 may safely be freed.

-\begin{figure}[btp]
+\begin{listing}[btp]
 { \scriptsize
 \begin{verbbox}
  1 int hp_store(void **p, void **hp)
@@ -48,14 +48,14 @@ may safely be freed.
 \centering
 \theverbbox
 \caption{Hazard-Pointer Storage and Erasure}
-\label{fig:defer:Hazard-Pointer Storage and Erasure}
-\end{figure}
+\label{lst:defer:Hazard-Pointer Storage and Erasure}
+\end{listing}

 Of course, this means that hazard-pointer acquisition must be carried
 out quite carefully in order to avoid destructive races with concurrent
 deletion.
 One implementation is shown in
-Figure~\ref{fig:defer:Hazard-Pointer Storage and Erasure},
+Listing~\ref{lst:defer:Hazard-Pointer Storage and Erasure},
 which shows \co{hp_store()} on lines~1-13 and \co{hp_erase()} on
 lines~15-20.
 The \co{smp_mb()} primitive will be described in detail in
@@ -73,7 +73,7 @@ recorded a hazard pointer for the data element.

 \QuickQuiz{}
 	Why does \co{hp_store()} in
-	Figure~\ref{fig:defer:Hazard-Pointer Storage and Erasure}
+	Listing~\ref{lst:defer:Hazard-Pointer Storage and Erasure}
 	take a double indirection to the data element?
 	Why not \co{void *} instead of \co{void **}?
 \QuickQuizAnswer{
@@ -178,7 +178,7 @@ Performance comparisons with other mechanisms may be found in
 Chapter~\ref{chp:Data Structures}
 and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.2483867,MagedMichael04a}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 struct route_entry {
@@ -222,10 +222,10 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
 \centering
 \theverbbox
 \caption{Hazard-Pointer Pre-BSD Routing Table Lookup}
-\label{fig:defer:Hazard-Pointer Pre-BSD Routing Table Lookup}
-\end{figure}
+\label{lst:defer:Hazard-Pointer Pre-BSD Routing Table Lookup}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 int route_add(unsigned long addr,
@@ -275,24 +275,24 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
 \centering
 \theverbbox
 \caption{Hazard-Pointer Pre-BSD Routing Table Add/Delete}
-\label{fig:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete}
-\end{figure}
+\label{lst:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete}
+\end{listing}

 The Pre-BSD routing example can use hazard pointers as shown in
-Figure~\ref{fig:defer:Hazard-Pointer Pre-BSD Routing Table Lookup}
+Listing~\ref{lst:defer:Hazard-Pointer Pre-BSD Routing Table Lookup}
 for data structures and \co{route_lookup()}, and in
-Figure~\ref{fig:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete}
+Listing~\ref{lst:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete}
 for \co{route_add()} and \co{route_del()}
 (\path{route_hazptr.c}).
 As with reference counting, the hazard-pointers implementation
 is quite similar to the sequential algorithm shown in
-Figure~\ref{fig:defer:Sequential Pre-BSD Routing Table}
+Listing~\ref{lst:defer:Sequential Pre-BSD Routing Table}
 on
-page~\pageref{fig:defer:Sequential Pre-BSD Routing Table},
+page~\pageref{lst:defer:Sequential Pre-BSD Routing Table},
 so only differences will be discussed.

 Starting with
-Figure~\ref{fig:defer:Hazard-Pointer Pre-BSD Routing Table Lookup},
+Listing~\ref{lst:defer:Hazard-Pointer Pre-BSD Routing Table Lookup},
 line~2 shows the \co{->hh} field used to queue objects pending
 hazard-pointer free,
 line~6 shows the \co{->re_freed} field used to detect use-after-free bugs,
@@ -300,7 +300,7 @@ and lines~24-30 attempt to acquire a hazard pointer, branching
 to line~18's \co{retry} label on failure.

 In
-Figure~\ref{fig:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete},
+Listing~\ref{lst:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete},
 line~11 initializes \co{->re_freed},
 lines~32 and~33 poison the \co{->re_next} field of the newly removed
 object, and
@@ -308,7 +308,7 @@ line~35 passes that object to the hazard pointers's
 \co{hazptr_free_later()} function, which will free that object once it
 is safe to do so.
 The spinlocks work the same as in
-Figure~\ref{fig:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}.
+Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}.

 \begin{figure}[tb]
 \centering
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index d60a0dd..6b4337a 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -375,10 +375,10 @@ returns a value that must be passed into the corresponding
 	\co{srcu_struct}.
 	In practice, however, doing this is almost certainly a bad idea.
 	In particular, the code shown in
-	Figure~\ref{fig:defer:Multistage SRCU Deadlocks}
+	Listing~\ref{lst:defer:Multistage SRCU Deadlocks}
 	could still result in deadlock.

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 {
 \begin{verbbox}
   1 idx = srcu_read_lock(&ssa);
@@ -395,8 +395,8 @@ returns a value that must be passed into the corresponding
 \centering
 \theverbbox
 \caption{Multistage SRCU Deadlocks}
-\label{fig:defer:Multistage SRCU Deadlocks}
-\end{figure}
+\label{lst:defer:Multistage SRCU Deadlocks}
+\end{listing}
 %
 } \QuickQuizEnd

@@ -622,9 +622,9 @@ dereferences are protected by RCU.
 	work out which type of RCU read-side critical section a given
 	RCU traversal primitive corresponds to.
 	For example, consider the code shown in
-	Figure~\ref{fig:defer:Diverse RCU Read-Side Nesting}.
+	Listing~\ref{lst:defer:Diverse RCU Read-Side Nesting}.

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 { \scriptsize
 \begin{verbbox}
   1 rcu_read_lock();
@@ -640,8 +640,8 @@ dereferences are protected by RCU.
 \centering
 \theverbbox
 \caption{Diverse RCU Read-Side Nesting}
-\label{fig:defer:Diverse RCU Read-Side Nesting}
-\end{figure}
+\label{lst:defer:Diverse RCU Read-Side Nesting}
+\end{listing}

 	Is the \co{rcu_dereference()} primitive in an RCU Classic
 	or an RCU Sched critical section?
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 27193aa..a500f51 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -68,7 +68,7 @@ summarizes RCU fundamentals.
 \subsubsection{Publish-Subscribe Mechanism}
 \label{sec:defer:Publish-Subscribe Mechanism}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct foo {
@@ -90,8 +90,8 @@ summarizes RCU fundamentals.
 \centering
 \theverbbox
 \caption{Data Structure Publication (Unsafe)}
-\label{fig:defer:Data Structure Publication (Unsafe)}
-\end{figure}
+\label{lst:defer:Data Structure Publication (Unsafe)}
+\end{listing}

 One key attribute of RCU is the ability to safely scan data, even
 though that data is being modified concurrently.
@@ -101,7 +101,7 @@ For example, consider an initially \co{NULL} global pointer
 \co{gp} that is to be modified to point to a newly allocated
 and initialized data structure.
 The code fragment shown in
-Figure~\ref{fig:defer:Data Structure Publication (Unsafe)}
+Listing~\ref{lst:defer:Data Structure Publication (Unsafe)}
 (with the addition of appropriate locking)
 might be used for this purpose.

@@ -239,7 +239,7 @@ This notation is cumbersome, and will therefore be abbreviated as shown in
 Figure~\ref{fig:defer:Linux Linked List Abbreviated},
 which shows only the non-header (blue) elements.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct foo {
@@ -262,12 +262,12 @@ which shows only the non-header (blue) elements.
 \centering
 \theverbbox
 \caption{RCU Data Structure Publication}
-\label{fig:defer:RCU Data Structure Publication}
-\end{figure}
+\label{lst:defer:RCU Data Structure Publication}
+\end{listing}

 Adapting the pointer-publish example for the linked list results in
 the code shown in
-Figure~\ref{fig:defer:RCU Data Structure Publication}.
+Listing~\ref{lst:defer:RCU Data Structure Publication}.

 Line~15 must be protected by some synchronization mechanism (most
 commonly some sort of lock) to prevent multiple \co{list_add_rcu()}
@@ -330,7 +330,7 @@ As before, this notation is cumbersome, so hlists will be abbreviated
 in the same way lists are, as shown in
 Figure~\ref{fig:defer:Linux Linked List Abbreviated}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct foo {
@@ -353,12 +353,12 @@ Figure~\ref{fig:defer:Linux Linked List Abbreviated}.
 \centering
 \theverbbox
 \caption{RCU {\tt hlist} Publication}
-\label{fig:defer:RCU hlist Publication}
-\end{figure}
+\label{lst:defer:RCU hlist Publication}
+\end{listing}

 Publishing a new element to an RCU-protected hlist is quite similar
 to doing so for the circular list,
-as shown in Figure~\ref{fig:defer:RCU hlist Publication}.
+as shown in Listing~\ref{lst:defer:RCU hlist Publication}.

 As before, line~15 must be protected by some sort of synchronization
 mechanism, for example, a lock.
@@ -485,7 +485,7 @@ RCU to wait for readers:
 \item	Clean up, for example, free the element that was replaced above.
 \end{enumerate}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct foo {
@@ -514,11 +514,11 @@ RCU to wait for readers:
 \centering
 \theverbbox
 \caption{Canonical RCU Replacement Example}
-\label{fig:defer:Canonical RCU Replacement Example}
-\end{figure}
+\label{lst:defer:Canonical RCU Replacement Example}
+\end{listing}

 The code fragment shown in
-Figure~\ref{fig:defer:Canonical RCU Replacement Example},
+Listing~\ref{lst:defer:Canonical RCU Replacement Example},
 adapted from those in Section~\ref{sec:defer:Publish-Subscribe Mechanism},
 demonstrates this process, with field \co{a} being the search key.

@@ -560,7 +560,7 @@ but now with the benefit of a firm understanding of the fundamental
 concepts underlying RCU.
 To begin this new version of the deletion example,
 we will modify lines~11-21 in
-Figure~\ref{fig:defer:Canonical RCU Replacement Example}
+Listing~\ref{lst:defer:Canonical RCU Replacement Example}
 to read as follows:

 \vspace{5pt}
@@ -641,7 +641,7 @@ The following example covers replacement.
 To start the replacement example,
 here are the last few lines of the
 example shown in
-Figure~\ref{fig:defer:Canonical RCU Replacement Example}:
+Listing~\ref{lst:defer:Canonical RCU Replacement Example}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -745,9 +745,9 @@ versions of the list active at a given time.
 	versions of the list to be active?
 \QuickQuizAnswer{
 	One way of accomplishing this is as shown in
-	Figure~\ref{fig:defer:Concurrent RCU Deletion}.
+	Listing~\ref{lst:defer:Concurrent RCU Deletion}.

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 {
 \begin{verbbox}
   1 spin_lock(&mylock);
@@ -765,8 +765,8 @@ versions of the list active at a given time.
 \centering
 \theverbbox
 \caption{Concurrent RCU Deletion}
-\label{fig:defer:Concurrent RCU Deletion}
-\end{figure}
+\label{lst:defer:Concurrent RCU Deletion}
+\end{listing}

 	Note that this means that multiple concurrent deletions might be
 	waiting in \co{synchronize_rcu()}.
@@ -784,7 +784,7 @@ versions of the list active at a given time.
 	\co{list_replace_rcu()} were protected by a lock, so that
 	the \co{synchronize_rcu()} was outside of that lock, similar
 	to the code shown in
-	Figure~\ref{fig:defer:Concurrent RCU Deletion}.
+	Listing~\ref{lst:defer:Concurrent RCU Deletion}.
 	Suppose further that a large number of threads undertook an
 	RCU replacement at about the same time, and that readers
 	are also constantly traversing the data structure.
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 74be9fc..9ad1a1e 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -41,7 +41,7 @@ Section~\ref{sec:defer:RCU Usage Summary} provides a summary.
 \subsubsection{RCU for Pre-BSD Routing}
 \label{sec:defer:RCU for Pre-BSD Routing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 struct route_entry {
@@ -78,10 +78,10 @@ Section~\ref{sec:defer:RCU Usage Summary} provides a summary.
 \centering
 \theverbbox
 \caption{RCU Pre-BSD Routing Table Lookup}
-\label{fig:defer:RCU Pre-BSD Routing Table Lookup}
-\end{figure}
+\label{lst:defer:RCU Pre-BSD Routing Table Lookup}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 int route_add(unsigned long addr,
@@ -132,22 +132,22 @@ Section~\ref{sec:defer:RCU Usage Summary} provides a summary.
 \centering
 \theverbbox
 \caption{RCU Pre-BSD Routing Table Add/Delete}
-\label{fig:defer:RCU Pre-BSD Routing Table Add/Delete}
-\end{figure}
+\label{lst:defer:RCU Pre-BSD Routing Table Add/Delete}
+\end{listing}

-Figures~\ref{fig:defer:RCU Pre-BSD Routing Table Lookup}
-and~\ref{fig:defer:RCU Pre-BSD Routing Table Add/Delete}
+Listings~\ref{lst:defer:RCU Pre-BSD Routing Table Lookup}
+and~\ref{lst:defer:RCU Pre-BSD Routing Table Add/Delete}
 show code for an RCU-protected Pre-BSD routing table
 (\path{route_rcu.c}).
 The former shows data structures and \co{route_lookup()},
 and the latter shows \co{route_add()} and \co{route_del()}.

-In Figure~\ref{fig:defer:RCU Pre-BSD Routing Table Lookup},
+In Listing~\ref{lst:defer:RCU Pre-BSD Routing Table Lookup},
 line~2 adds the \co{->rh} field used by RCU reclamation,
 line~6 adds the \co{->re_freed} use-after-free-check field,
 lines~16, 17, 23, and~27 add RCU read-side protection,
 and lines~21 and~22 add the use-after-free check.
-In Figure~\ref{fig:defer:RCU Pre-BSD Routing Table Add/Delete},
+In Listing~\ref{lst:defer:RCU Pre-BSD Routing Table Add/Delete},
 lines~12, 14, 31, 36, and~41 add update-side locking,
 lines~13 and~35 add RCU update-side protection,
 line~37 causes \co{route_cb()} to be invoked after a grace period elapses,
@@ -596,14 +596,14 @@ situations.

 In the best case, the conversion from reader-writer locking to RCU
 is quite simple, as shown in
-Figures~\ref{fig:defer:Converting Reader-Writer Locking to RCU: Data},
-\ref{fig:defer:Converting Reader-Writer Locking to RCU: Search},
+Listings~\ref{lst:defer:Converting Reader-Writer Locking to RCU: Data},
+\ref{lst:defer:Converting Reader-Writer Locking to RCU: Search},
 and
-\ref{fig:defer:Converting Reader-Writer Locking to RCU: Deletion},
+\ref{lst:defer:Converting Reader-Writer Locking to RCU: Deletion},
 all taken from
 Wikipedia~\cite{WikipediaRCU}.

-\begin{figure*}[htbp]
+\begin{listing*}[htbp]
 { \scriptsize
 \begin{verbbox}
  1 struct el {                           1 struct el {
@@ -620,10 +620,10 @@ Wikipedia~\cite{WikipediaRCU}.
 \hspace*{0.9in}\OneColumnHSpace{-0.5in}
 \theverbbox
 \caption{Converting Reader-Writer Locking to RCU: Data}
-\label{fig:defer:Converting Reader-Writer Locking to RCU: Data}
-\end{figure*}
+\label{lst:defer:Converting Reader-Writer Locking to RCU: Data}
+\end{listing*}

-\begin{figure*}[htbp]
+\begin{listing*}[htbp]
 { \scriptsize
 \begin{verbbox}
  1 int search(long key, int *result)     1 int search(long key, int *result)
@@ -646,10 +646,10 @@ Wikipedia~\cite{WikipediaRCU}.
 \hspace*{0.9in}\OneColumnHSpace{-0.5in}
 \theverbbox
 \caption{Converting Reader-Writer Locking to RCU: Search}
-\label{fig:defer:Converting Reader-Writer Locking to RCU: Search}
-\end{figure*}
+\label{lst:defer:Converting Reader-Writer Locking to RCU: Search}
+\end{listing*}

-\begin{figure*}[htbp]
+\begin{listing*}[htbp]
 { \scriptsize
 \begin{verbbox}
  1 int delete(long key)                  1 int delete(long key)
@@ -674,8 +674,8 @@ Wikipedia~\cite{WikipediaRCU}.
 \hspace*{0.9in}\OneColumnHSpace{-0.5in}
 \theverbbox
 \caption{Converting Reader-Writer Locking to RCU: Deletion}
-\label{fig:defer:Converting Reader-Writer Locking to RCU: Deletion}
-\end{figure*}
+\label{lst:defer:Converting Reader-Writer Locking to RCU: Deletion}
+\end{listing*}

 More-elaborate cases of replacing reader-writer locking with RCU
 are beyond the scope of this document.
@@ -874,7 +874,7 @@ within an RCU read-side critical section, that data element is
 guaranteed to remain in existence for the duration of that RCU
 read-side critical section.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 int delete(int key)
@@ -907,10 +907,10 @@ read-side critical section.
 \centering
 \theverbbox
 \caption{Existence Guarantees Enable Per-Element Locking}
-\label{fig:defer:Existence Guarantees Enable Per-Element Locking}
-\end{figure}
+\label{lst:defer:Existence Guarantees Enable Per-Element Locking}
+\end{listing}

-Figure~\ref{fig:defer:Existence Guarantees Enable Per-Element Locking}
+Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
 demonstrates how RCU-based existence guarantees can enable
 per-element locking via a function that deletes an element from
 a hash table.
@@ -924,10 +924,10 @@ indicates failure.
 \QuickQuiz{}
 	What if the element we need to delete is not the first element
 	of the list on line~9 of
-	Figure~\ref{fig:defer:Existence Guarantees Enable Per-Element Locking}?
+	Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}?
 \QuickQuizAnswer{
 	As with
-	Figure~\ref{fig:locking:Per-Element Locking Without Existence Guarantees},
+	Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees},
 	this is a very simple hash table with no chaining, so the only
 	element in a given bucket is the first element.
 	The reader is again invited to adapt this example to a hash table with
@@ -948,7 +948,7 @@ and line~24 indicates failure to delete the specified key.
 \QuickQuiz{}
 	Why is it OK to exit the RCU read-side critical section on
 	line~15 of
-	Figure~\ref{fig:defer:Existence Guarantees Enable Per-Element Locking}
+	Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
 	before releasing the lock on line~17?
 \QuickQuizAnswer{
 	First, please note that the second check on line~14 is
@@ -973,7 +973,7 @@ and line~24 indicates failure to delete the specified key.
 \QuickQuiz{}
 	Why not exit the RCU read-side critical section on
 	line~23 of
-	Figure~\ref{fig:defer:Existence Guarantees Enable Per-Element Locking}
+	Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
 	before releasing the lock on line~22?
 \QuickQuizAnswer{
 	Suppose we reverse the order of these two lines.
@@ -1122,9 +1122,9 @@ In this example, the \co{timer_stop} function uses
 \co{synchronize_sched()} to ensure that all in-flight NMI
 notifications have completed before freeing the associated resources.
 A simplified version of this code is shown
-Figure~\ref{fig:defer:Using RCU to Wait for NMIs to Finish}.
+Listing~\ref{lst:defer:Using RCU to Wait for NMIs to Finish}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct profile_buffer {
@@ -1159,8 +1159,8 @@ Figure~\ref{fig:defer:Using RCU to Wait for NMIs to Finish}.
 \centering
 \theverbbox
 \caption{Using RCU to Wait for NMIs to Finish}
-\label{fig:defer:Using RCU to Wait for NMIs to Finish}
-\end{figure}
+\label{lst:defer:Using RCU to Wait for NMIs to Finish}
+\end{listing}

 Lines~1-4 define a \co{profile_buffer} structure, containing a
 size and an indefinite array of entries.
@@ -1213,9 +1213,9 @@ It is therefore safe to free the buffer, in this case using the
 	in \co{nmi_profile()}, and to replace the
 	\co{synchronize_sched()} with \co{synchronize_rcu()},
 	perhaps as shown in
-	Figure~\ref{fig:defer:Using RCU to Wait for Mythical Preemptible NMIs to Finish}.
+	Listing~\ref{lst:defer:Using RCU to Wait for Mythical Preemptible NMIs to Finish}.
 %
-\begin{figure}[tb]
+\begin{listing}[tb]
 {\scriptsize
 \begin{verbbox}
   1 struct profile_buffer {
@@ -1257,8 +1257,8 @@ It is therefore safe to free the buffer, in this case using the
 \centering
 \theverbbox
 \caption{Using RCU to Wait for Mythical Preemptible NMIs to Finish}
-\label{fig:defer:Using RCU to Wait for Mythical Preemptible NMIs to Finish}
-\end{figure}
+\label{lst:defer:Using RCU to Wait for Mythical Preemptible NMIs to Finish}
+\end{listing}
 %
 } \QuickQuizEnd

diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index 942f529..ebf9111 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -3,7 +3,7 @@
 \section{Reference Counting}
 \label{sec:defer:Reference Counting}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 struct route_entry { /* BUGGY!!! */
@@ -61,10 +61,10 @@
 \centering
 \theverbbox
 \caption{Reference-Counted Pre-BSD Routing Table Lookup (BUGGY!!!)}
-\label{fig:defer:Reference-Counted Pre-BSD Routing Table Lookup}
-\end{figure}
+\label{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 int route_add(unsigned long addr, /* BUGGY!!! */
@@ -114,8 +114,8 @@
 \centering
 \theverbbox
 \caption{Reference-Counted Pre-BSD Routing Table Add/Delete (BUGGY!!!)}
-\label{fig:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
-\end{figure}
+\label{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
+\end{listing}

 Reference counting tracks the number of references to a given object in
 order to prevent that object from being prematurely freed.
@@ -133,18 +133,18 @@ Reference counting is thus an excellent candidate for a concurrent
 implementation of Pre-BSD routing.

 To that end,
-Figure~\ref{fig:defer:Reference-Counted Pre-BSD Routing Table Lookup}
+Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup}
 shows data structures and the \co{route_lookup()} function and
-Figure~\ref{fig:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
+Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
 shows the \co{route_add()} and \co{route_del()} functions
 (all at \path{route_refcnt.c}).
 Since these algorithms are quite similar to the sequential algorithm
 shown in
-Figure~\ref{fig:defer:Sequential Pre-BSD Routing Table},
+Listing~\ref{lst:defer:Sequential Pre-BSD Routing Table},
 only the differences will be discussed.

 Starting with
-Figure~\ref{fig:defer:Reference-Counted Pre-BSD Routing Table Lookup},
+Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup},
 line~2 adds the actual reference counter, line~6 adds a \co{->re_freed}
 use-after-free check field, line~9 adds the \co{routelock} that will
 be used to synchronize concurrent updates,
@@ -174,7 +174,7 @@ and~37 performing the use-after-free check.
 	of increasing the probability of finding bugs.
 } \QuickQuizEnd

-In Figure~\ref{fig:defer:Reference-Counted Pre-BSD Routing Table Add/Delete},
+In Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete},
 lines~12, 16, 25, 33, and~40 introduce locking to synchronize
 concurrent updates.
 Line~14 initializes the \co{->re_freed} use-after-free-check field,
@@ -183,7 +183,7 @@ the reference count is zero.

 \QuickQuiz{}
 	Why doesn't \co{route_del()} in
-	Figure~\ref{fig:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
+	Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
 	use reference counts to
 	protect the traversal to the element to be freed?
 \QuickQuizAnswer{
@@ -203,7 +203,7 @@ shows the performance and scalability of reference counting on a
 read-only workload with a ten-element list running on a
 single-socket four-core hyperthreaded 2.5\,GHz x86 system.
 The ``ideal'' trace was generated by running the sequential code shown in
-Figure~\ref{fig:defer:Sequential Pre-BSD Routing Table},
+Listing~\ref{lst:defer:Sequential Pre-BSD Routing Table},
 which works only because this is a read-only workload.
 The reference-counting performance is abysmal and its scalability even
 more so, with the ``refcnt'' trace dropping down onto the x-axis.
@@ -250,7 +250,7 @@ But it gets worse.
 Running multiple updater threads repeatedly invoking
 \co{route_add()} and \co{route_del()} will quickly encounter the
 \co{abort()} statement on line~37 of
-Figure~\ref{fig:defer:Reference-Counted Pre-BSD Routing Table Lookup},
+Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup},
 which indicates a use-after-free bug.
 This in turn means that the reference counts are not only profoundly
 degrading scalability and performance, but also failing to provide
@@ -263,11 +263,11 @@ Figure~\ref{fig:defer:Pre-BSD Packet Routing List}:
 \begin{enumerate}
 \item	Thread~A looks up address~42, reaching line~33 of
 	\co{route_lookup()} in
-	Figure~\ref{fig:defer:Reference-Counted Pre-BSD Routing Table Lookup}.
+	Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup}.
 	In other words, Thread~A has a pointer to the first element,
 	but has not yet acquired a reference to it.
 \item	Thread~B invokes \co{route_del()} in
-	Figure~\ref{fig:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
+	Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
 	to delete the route entry for address~42.
 	It completes successfully, and because this entry's \co{->re_refcnt}
 	field was equal to the value one, it invokes
diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index cb5e4e6..e537628 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -47,7 +47,7 @@ very rarely need to retry.
 	a lock.
 } \QuickQuizEnd

-\begin{figure}[bp]
+\begin{listing}[bp]
 { \scriptsize
 \begin{verbbox}
   1 do {
@@ -59,10 +59,10 @@ very rarely need to retry.
 \centering
 \theverbbox
 \caption{Sequence-Locking Reader}
-\label{fig:defer:Sequence-Locking Reader}
-\end{figure}
+\label{lst:defer:Sequence-Locking Reader}
+\end{listing}

-\begin{figure}[bp]
+\begin{listing}[bp]
 { \scriptsize
 \begin{verbbox}
   1 write_seqlock(&test_seqlock);
@@ -73,8 +73,8 @@ very rarely need to retry.
 \centering
 \theverbbox
 \caption{Sequence-Locking Writer}
-\label{fig:defer:Sequence-Locking Writer}
-\end{figure}
+\label{lst:defer:Sequence-Locking Writer}
+\end{listing}

 The key component of sequence locking is the sequence number, which has
 an even value in the absence of updaters and an odd value if there
@@ -84,12 +84,12 @@ If either snapshot has an odd value, or if the two snapshots differ,
 there has been a concurrent update, and the reader must discard
 the results of the access and then retry it.
 Readers therefore use the \co{read_seqbegin()} and \co{read_seqretry()}
-functions shown in Figure~\ref{fig:defer:Sequence-Locking Reader}
+functions shown in Listing~\ref{lst:defer:Sequence-Locking Reader}
 when accessing data protected by a sequence lock.
 Writers must increment the value before and after each update,
 and only one writer is permitted at a given time.
 Writers therefore use the \co{write_seqlock()} and \co{write_sequnlock()}
-functions shown in Figure~\ref{fig:defer:Sequence-Locking Writer}
+functions shown in Listing~\ref{lst:defer:Sequence-Locking Writer}
 when updating data protected by a sequence lock.

 As a result, sequence-lock-protected data can have an arbitrarily
@@ -98,7 +98,7 @@ Sequence locking is used in the Linux kernel to protect calibration
 quantities used for timekeeping.
 It is also used in pathname traversal to detect concurrent rename operations.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1  typedef struct {
@@ -149,11 +149,11 @@ It is also used in pathname traversal to detect concurrent rename operations.
 \centering
 \theverbbox
 \caption{Sequence-Locking Implementation}
-\label{fig:defer:Sequence-Locking Implementation}
-\end{figure}
+\label{lst:defer:Sequence-Locking Implementation}
+\end{listing}

 A simple implementation of sequence locks is shown in
-Figure~\ref{fig:defer:Sequence-Locking Implementation}
+Listing~\ref{lst:defer:Sequence-Locking Implementation}
 (\path{seqlock.h}).
 The \co{seqlock_t} data structure is shown on lines~1-4, and contains
 the sequence number along with a lock to serialize writers.
@@ -170,7 +170,7 @@ will pass to a later call to \co{read_seqretry()}.

 \QuickQuiz{}
 	Why not have \co{read_seqbegin()} in
-	Figure~\ref{fig:defer:Sequence-Locking Implementation}
+	Listing~\ref{lst:defer:Sequence-Locking Implementation}
 	check for the low-order bit being set, and retry
 	internally, rather than allowing a doomed read to start?
 \QuickQuizAnswer{
@@ -193,7 +193,7 @@ in other words, that there has been no writer, and returns true if so.

 \QuickQuiz{}
 	Why is the \co{smp_mb()} on line~26 of
-	Figure~\ref{fig:defer:Sequence-Locking Implementation}
+	Listing~\ref{lst:defer:Sequence-Locking Implementation}
 	needed?
 \QuickQuizAnswer{
 	If it was omitted, both the compiler and the CPU would be
@@ -206,7 +206,7 @@ in other words, that there has been no writer, and returns true if so.

 \QuickQuiz{}
 	Can't weaker memory barriers be used in the code in
-	Figure~\ref{fig:defer:Sequence-Locking Implementation}?
+	Listing~\ref{lst:defer:Sequence-Locking Implementation}?
 \QuickQuizAnswer{
 	In older versions of the Linux kernel, no.

@@ -247,7 +247,7 @@ increment of the sequence number on line~44, then releases the lock.

 \QuickQuiz{}
 	Why isn't \co{seq} on line~2 of
-	Figure~\ref{fig:defer:Sequence-Locking Implementation}
+	Listing~\ref{lst:defer:Sequence-Locking Implementation}
 	\co{unsigned} rather than \co{unsigned long}?
 	After all, if \co{unsigned} is good enough for the Linux
 	kernel, shouldn't it be good enough for everyone?
@@ -287,7 +287,7 @@ increment of the sequence number on line~44, then releases the lock.
 	that is 64 bits on 64-bit systems.
 } \QuickQuizEnd

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 struct route_entry {
@@ -330,10 +330,10 @@ increment of the sequence number on line~44, then releases the lock.
 \centering
 \theverbbox
 \caption{Sequence-Locked Pre-BSD Routing Table Lookup (BUGGY!!!)}
-\label{fig:defer:Sequence-Locked Pre-BSD Routing Table Lookup}
-\end{figure}
+\label{lst:defer:Sequence-Locked Pre-BSD Routing Table Lookup}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 int route_add(unsigned long addr,
@@ -383,20 +383,20 @@ increment of the sequence number on line~44, then releases the lock.
 \centering
 \theverbbox
 \caption{Sequence-Locked Pre-BSD Routing Table Add/Delete (BUGGY!!!)}
-\label{fig:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete}
-\end{figure}
+\label{lst:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete}
+\end{listing}

 So what happens when sequence locking is applied to the Pre-BSD
 routing table?
-Figure~\ref{fig:defer:Sequence-Locked Pre-BSD Routing Table Lookup}
+Listing~\ref{lst:defer:Sequence-Locked Pre-BSD Routing Table Lookup}
 shows the data structures and \co{route_lookup()}, and
-Figure~\ref{fig:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete}
+Listing~\ref{lst:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete}
 shows \co{route_add()} and \co{route_del()} (\path{route_seqlock.c}).
 This implementation is once again similar to its counterparts in earlier
 sections, so only the differences will be highlighted.

 In
-Figure~\ref{fig:defer:Sequence-Locked Pre-BSD Routing Table Lookup},
+Listing~\ref{lst:defer:Sequence-Locked Pre-BSD Routing Table Lookup},
 line~5 adds \co{->re_freed}, which is checked on lines~29 and~30.
 Line~8 adds a sequence lock, which is used by \co{route_lookup()}
 on lines~18, 23, and~32, with lines~24 and~33 branching back to
@@ -404,7 +404,7 @@ the \co{retry} label on line~17.
 The effect is to retry any lookup that runs concurrently with an update.

 In
-Figure~\ref{fig:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete},
+Listing~\ref{lst:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete},
 lines~12, 15, 24, and~40 acquire and release the sequence lock,
 while lines~11, 33, and~44 handle \co{->re_freed}.
 This implementation is therefore quite straightforward.
diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 7629c1c..9fcbbf9 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -3,7 +3,7 @@
 \section{Lock-Based Existence Guarantees}
 \label{sec:locking:Lock-Based Existence Guarantees}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 int delete(int key)
@@ -26,8 +26,8 @@
 \centering
 \theverbbox
 \caption{Per-Element Locking Without Existence Guarantees}
-\label{fig:locking:Per-Element Locking Without Existence Guarantees}
-\end{figure}
+\label{lst:locking:Per-Element Locking Without Existence Guarantees}
+\end{listing}

 A key challenge in parallel programming is to provide
 \emph{existence guarantees}~\cite{Gamsa99},
@@ -95,12 +95,12 @@ structure.
 Unfortunately, putting the lock that is to protect a data element
 in the data element itself is subject to subtle race conditions,
 as shown in
-Figure~\ref{fig:locking:Per-Element Locking Without Existence Guarantees}.
+Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}.

 \QuickQuiz{}
 	What if the element we need to delete is not the first element
 	of the list on line~8 of
-	Figure~\ref{fig:locking:Per-Element Locking Without Existence Guarantees}?
+	Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}?
 \QuickQuizAnswer{
 	This is a very simple hash table with no chaining, so the only
 	element in a given bucket is the first element.
@@ -110,7 +110,7 @@ Figure~\ref{fig:locking:Per-Element Locking Without Existence Guarantees}.

 \QuickQuiz{}
 	What race condition can occur in
-	Figure~\ref{fig:locking:Per-Element Locking Without Existence Guarantees}?
+	Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}?
 \QuickQuizAnswer{
 	Consider the following sequence of events:
 	\begin{enumerate}
@@ -134,7 +134,7 @@ Figure~\ref{fig:locking:Per-Element Locking Without Existence Guarantees}.
 	that element's lock on line~10!
 } \QuickQuizEnd

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 int delete(int key)
@@ -161,12 +161,12 @@ Figure~\ref{fig:locking:Per-Element Locking Without Existence Guarantees}.
 \centering
 \theverbbox
 \caption{Per-Element Locking With Lock-Based Existence Guarantees}
-\label{fig:locking:Per-Element Locking With Lock-Based Existence Guarantees}
-\end{figure}
+\label{lst:locking:Per-Element Locking With Lock-Based Existence Guarantees}
+\end{listing}

 One way to fix this example is to use a hashed set of global locks, so
 that each hash bucket has its own lock, as shown in
-Figure~\ref{fig:locking:Per-Element Locking With Lock-Based Existence Guarantees}.
+Listing~\ref{lst:locking:Per-Element Locking With Lock-Based Existence Guarantees}.
 This approach allows acquiring the proper lock (on line~9) before
 gaining a pointer to the data element (on line~10).
 Although this approach works quite well for elements contained in a
diff --git a/locking/locking.tex b/locking/locking.tex
index 562ff09..0737f85 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -358,7 +358,7 @@ we therefore have three layers to the global deadlock hierarchy, the
 first containing Locks~A and B, the second containing Lock~C, and
 the third containing Lock~D.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct locked_list {
@@ -389,8 +389,8 @@ the third containing Lock~D.
 \centering
 \theverbbox
 \caption{Concurrent List Iterator}
-\label{fig:locking:Concurrent List Iterator}
-\end{figure}
+\label{lst:locking:Concurrent List Iterator}
+\end{listing}

 Please note that it is not typically possible to mechanically
 change \co{cmp()} to use the new Lock~D.
@@ -401,14 +401,14 @@ a small price to pay in order to avoid deadlock.

 For another example where releasing all locks before invoking unknown
 code is impractical, imagine an iterator over a linked list, as shown in
-Figure~\ref{fig:locking:Concurrent List Iterator} (\path{locked_list.c}).
+Listing~\ref{lst:locking:Concurrent List Iterator} (\path{locked_list.c}).
 The \co{list_start()} function acquires a lock on the list and returns
 the first element (if there is one), and
 \co{list_next()} either returns a pointer to the next element in the list
 or releases the lock and returns \co{NULL} if the end of the list has
 been reached.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct list_ints {
@@ -433,10 +433,10 @@ been reached.
 \centering
 \theverbbox
 \caption{Concurrent List Iterator Usage}
-\label{fig:locking:Concurrent List Iterator Usage}
-\end{figure}
+\label{lst:locking:Concurrent List Iterator Usage}
+\end{listing}

-Figure~\ref{fig:locking:Concurrent List Iterator Usage} shows how
+Listing~\ref{lst:locking:Concurrent List Iterator Usage} shows how
 this list iterator may be used.
 Lines~1-4 define the \co{list_ints} element containing a single integer,
 and lines~6-17 show how to iterate over the list.
@@ -513,7 +513,7 @@ this is unlikely.
 \subsubsection{Conditional Locking}
 \label{sec:locking:Conditional Locking}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 spin_lock(&lock2);
@@ -528,8 +528,8 @@ this is unlikely.
 \centering
 \theverbbox
 \caption{Protocol Layering and Deadlock}
-\label{fig:locking:Protocol Layering and Deadlock}
-\end{figure}
+\label{lst:locking:Protocol Layering and Deadlock}
+\end{listing}

 But suppose that there is no reasonable locking hierarchy.
 This can happen in real life, for example, in layered network protocol stacks
@@ -538,14 +538,14 @@ In the networking case, it might be necessary to hold the locks from
 both layers when passing a packet from one layer to another.
 Given that packets travel both up and down the protocol stack, this
 is an excellent recipe for deadlock, as illustrated in
-Figure~\ref{fig:locking:Protocol Layering and Deadlock}.
+Listing~\ref{lst:locking:Protocol Layering and Deadlock}.
 Here, a packet moving down the stack towards the wire must acquire
 the next layer's lock out of order.
 Given that packets moving up the stack away from the wire are acquiring
-the locks in order, the lock acquisition in line~4 of the figure
+the locks in order, the lock acquisition in line~4 of the listing
 can result in deadlock.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 retry:
@@ -570,13 +570,13 @@ can result in deadlock.
 \centering
 \theverbbox
 \caption{Avoiding Deadlock Via Conditional Locking}
-\label{fig:locking:Avoiding Deadlock Via Conditional Locking}
-\end{figure}
+\label{lst:locking:Avoiding Deadlock Via Conditional Locking}
+\end{listing}

 One way to avoid deadlocks in this case is to impose a locking hierarchy,
 but when it is necessary to acquire a lock out of order, acquire it
 conditionally, as shown in
-Figure~\ref{fig:locking:Avoiding Deadlock Via Conditional Locking}.
+Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}.
 Instead of unconditionally acquiring the layer-1 lock, line~5
 conditionally acquires the lock using the \co{spin_trylock()} primitive.
 This primitive acquires the lock immediately if the lock is available
@@ -597,8 +597,8 @@ must release the locks and start over.

 \QuickQuiz{}
 	Can the transformation from
-	Figure~\ref{fig:locking:Protocol Layering and Deadlock} to
-	Figure~\ref{fig:locking:Avoiding Deadlock Via Conditional Locking}
+	Listing~\ref{lst:locking:Protocol Layering and Deadlock} to
+	Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}
 	be applied universally?
 \QuickQuizAnswer{
 	Absolutely not!
@@ -613,7 +613,7 @@ must release the locks and start over.

 \QuickQuiz{}
 	But the complexity in
-	Figure~\ref{fig:locking:Avoiding Deadlock Via Conditional Locking}
+	Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}
 	is well worthwhile given that it avoids deadlock, right?
 \QuickQuizAnswer{
 	Maybe.
@@ -836,7 +836,7 @@ quite useful in many settings.
 \subsection{Livelock and Starvation}
 \label{sec:locking:Livelock and Starvation}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void thread1(void)
@@ -871,13 +871,13 @@ quite useful in many settings.
 \centering
 \theverbbox
 \caption{Abusing Conditional Locking}
-\label{fig:locking:Abusing Conditional Locking}
-\end{figure}
+\label{lst:locking:Abusing Conditional Locking}
+\end{listing}

 Although conditional locking can be an effective deadlock-avoidance
 mechanism, it can be abused.
 Consider for example the beautifully symmetric example shown in
-Figure~\ref{fig:locking:Abusing Conditional Locking}.
+Listing~\ref{lst:locking:Abusing Conditional Locking}.
 This example's beauty hides an ugly livelock.
 To see this, consider the following sequence of events:

@@ -899,10 +899,10 @@ To see this, consider the following sequence of events:

 \QuickQuiz{}
 	How can the livelock shown in
-	Figure~\ref{fig:locking:Abusing Conditional Locking}
+	Listing~\ref{lst:locking:Abusing Conditional Locking}
 	be avoided?
 \QuickQuizAnswer{
-	Figure~\ref{fig:locking:Avoiding Deadlock Via Conditional Locking}
+	Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}
 	provides some good hints.
 	In many cases, livelocks are a hint that you should revisit your
 	locking design.
@@ -930,7 +930,7 @@ a group of threads starve, rather than just one of them.\footnote{
 	forward progress is a problem that needs to be fixed, regardless
 	of what name you choose for it.}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void thread1(void)
@@ -971,8 +971,8 @@ a group of threads starve, rather than just one of them.\footnote{
 \centering
 \theverbbox
 \caption{Conditional Locking and Exponential Backoff}
-\label{fig:locking:Conditional Locking and Exponential Backoff}
-\end{figure}
+\label{lst:locking:Conditional Locking and Exponential Backoff}
+\end{listing}

 Livelock and starvation are serious issues in software transactional
 memory implementations, and so the concept of \emph{contention
@@ -981,11 +981,11 @@ In the case of locking, simple exponential backoff can often address
 livelock and starvation.
 The idea is to introduce exponentially increasing delays before each
 retry, as shown in
-Figure~\ref{fig:locking:Conditional Locking and Exponential Backoff}.
+Listing~\ref{lst:locking:Conditional Locking and Exponential Backoff}.

 \QuickQuiz{}
 	What problems can you spot in the code in
-	Figure~\ref{fig:locking:Conditional Locking and Exponential Backoff}?
+	Listing~\ref{lst:locking:Conditional Locking and Exponential Backoff}?
 \QuickQuizAnswer{
 	Here are a couple:
 	\begin{enumerate}
@@ -1509,7 +1509,7 @@ This acquire-then-release sequence continues until either the
 one of the attempts to acquire an \co{->fqslock} fails, or
 the root \co{rcu_node} structure's \co{->fqslock} as been acquired.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void force_quiescent_state(struct rcu_node *rnp_leaf)
@@ -1539,11 +1539,11 @@ the root \co{rcu_node} structure's \co{->fqslock} as been acquired.
 \centering
 \theverbbox
 \caption{Conditional Locking to Reduce Contention}
-\label{fig:locking:Conditional Locking to Reduce Contention}
-\end{figure}
+\label{lst:locking:Conditional Locking to Reduce Contention}
+\end{listing}

 Simplified code to implement this is shown in
-Figure~\ref{fig:locking:Conditional Locking to Reduce Contention}.
+Listing~\ref{lst:locking:Conditional Locking to Reduce Contention}.
 The purpose of this function is to mediate between CPUs who have concurrently
 detected a need to invoke the \co{do_force_quiescent_state()} function.
 At any given time, it only makes sense for one instance of
@@ -1578,7 +1578,7 @@ Either way, line~21 releases the root \co{rcu_node} structure's

 \QuickQuiz{}
 	The code in
-	Figure~\ref{fig:locking:Conditional Locking to Reduce Contention}
+	Listing~\ref{lst:locking:Conditional Locking to Reduce Contention}
 	is ridiculously complicated!
 	Why not conditionally acquire a single global lock?
 \QuickQuizAnswer{
@@ -1593,7 +1593,7 @@ Either way, line~21 releases the root \co{rcu_node} structure's
 \QuickQuiz{}
 	Wait a minute!
 	If we ``win'' the tournament on line~16 of
-	Figure~\ref{fig:locking:Conditional Locking to Reduce Contention},
+	Listing~\ref{lst:locking:Conditional Locking to Reduce Contention},
 	we get to do all the work of \co{do_force_quiescent_state()}.
 	Exactly how is that a win, really?
 \QuickQuizAnswer{
@@ -1623,7 +1623,7 @@ environments.
 \subsection{Sample Exclusive-Locking Implementation Based on Atomic Exchange}
 \label{sec:locking:Sample Exclusive-Locking Implementation Based on Atomic Exchange}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 typedef int xchglock_t;
@@ -1646,11 +1646,11 @@ environments.
 \centering
 \theverbbox
 \caption{Sample Lock Based on Atomic Exchange}
-\label{fig:locking:Sample Lock Based on Atomic Exchange}
-\end{figure}
+\label{lst:locking:Sample Lock Based on Atomic Exchange}
+\end{listing}

 This section reviews the implementation shown in
-Figure~\ref{fig:locking:Sample Lock Based on Atomic Exchange}.
+Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}.
 The data structure for this lock is just an \co{int}, as shown on
 line~1, but could be any integral type.
 The initial value of this lock is zero, meaning ``unlocked'',
@@ -1660,7 +1660,7 @@ as shown on line~2.
 	Why not rely on the C language's default initialization of
 	zero instead of using the explicit initializer shown on
 	line~2 of
-	Figure~\ref{fig:locking:Sample Lock Based on Atomic Exchange}?
+	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
 \QuickQuizAnswer{
 	Because this default initialization does not apply to locks
 	allocated as auto variables within the scope of a function.
@@ -1678,7 +1678,7 @@ makes another attempt to acquire the lock.

 \QuickQuiz{}
 	Why bother with the inner loop on lines~7-8 of
-	Figure~\ref{fig:locking:Sample Lock Based on Atomic Exchange}?
+	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
 	Why not simply repeatedly do the atomic exchange operation
 	on line~6?
 \QuickQuizAnswer{
@@ -1700,7 +1700,7 @@ the lock, thus marking it as having been released.

 \QuickQuiz{}
 	Why not simply store zero into the lock word on line~14 of
-	Figure~\ref{fig:locking:Sample Lock Based on Atomic Exchange}?
+	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
 \QuickQuizAnswer{
 	This can be a legitimate implementation, but only if
 	this store is preceded by a memory barrier and makes use
-- 
2.7.4

