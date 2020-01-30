Return-Path: <SRS0=aoJh=3T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kcs2BpmGDwIqZBy2k9Y15wBtLGRfxn1zEW5mQIGvFdU=;
        b=JGClNIa57nQCoqAMFQmH73FsSHVDmehpfKBUD7NZCFNTUYQ7mrS3XgRQnXr1Z80o9/
         ++VVLVcmRxJSJF1IpaC9UeUZzzeQSipUClGorpygeQmu1eF0t76Ff4zWDsCUcLsNTNrz
         PRL+aNbYoFXuQrSYoPvt2+0TRiLLaalDrkhvRqUJtbA4ttcfwvlqaVKBDDRwOKycM8AW
         OLiGATfpTmFJFBlJ8xilljXjpCowwKQCTl8L4JvSfk4rp4nFDO4k8X4VBzsC3hTzAey9
         XmAJEvNsdPF6EVMcafHacVV57MIAPthGiFLTxB8ilbpZcIFrv3JznSBfsePvhDw6gt+R
         DWCQ==
Subject: [PATCH 1/6] Rename environments 'linelabel' and 'lineref'
References: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4e1ae97b-3d87-e13b-8700-aecf2a3ac960@gmail.com>
Date: Fri, 31 Jan 2020 07:33:10 +0900
MIME-Version: 1.0
In-Reply-To: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 25f6cd58afa619edfd088e4a935b10f7dddf450f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Jan 2020 15:56:47 +0900
Subject: [PATCH 1/6] Rename environments 'linelabel' and 'lineref'

It turns out that the "lineno" package has variables \linelabel
and \lineref as its parameters.
The "fvextra" package, which enhances fancyvrb and enables (semi-)
automatic line breaking in code snippets, requires the "lineno"
package.

This commit renames our custom environments of the same name to
"fcvlabel" and "fcvref" for us to be able to make use of fvextra.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex                      |  12 +-
 SMPdesign/beyond.tex                         |  44 ++--
 SMPdesign/partexercises.tex                  |  32 +--
 advsync/advsync.tex                          |   8 +-
 advsync/rt.tex                               |  40 ++--
 appendix/questions/after.tex                 |   4 +-
 appendix/styleguide/samplecodesnippetfcv.tex |   4 +-
 appendix/styleguide/styleguide.tex           |  52 ++--
 appendix/toyrcu/toyrcu.tex                   | 128 +++++-----
 appendix/whymb/whymemorybarriers.tex         |  16 +-
 count/count.tex                              | 200 ++++++++--------
 datastruct/datastruct.tex                    |  80 +++----
 debugging/debugging.tex                      |  12 +-
 defer/defer.tex                              |  16 +-
 defer/hazptr.tex                             |  20 +-
 defer/rcuapi.tex                             |   8 +-
 defer/rcufundamental.tex                     |   4 +-
 defer/rcuintro.tex                           |   4 +-
 defer/rcuusage.tex                           |  52 ++--
 defer/refcnt.tex                             |  20 +-
 defer/seqlock.tex                            |  40 ++--
 formal/axiomatic.tex                         |  40 ++--
 formal/dyntickrcu.tex                        | 148 ++++++------
 formal/ppcmem.tex                            |  24 +-
 formal/spinhint.tex                          |  44 ++--
 future/formalregress.tex                     |   4 +-
 future/htm.tex                               |  28 +--
 locking/locking-existence.tex                |  20 +-
 locking/locking.tex                          |  76 +++---
 memorder/memorder.tex                        | 240 +++++++++----------
 owned/owned.tex                              |  12 +-
 perfbook.tex                                 |   4 +-
 together/applyrcu.tex                        |  32 +--
 together/refcnt.tex                          |  32 +--
 toolsoftrade/toolsoftrade.tex                | 184 +++++++-------
 utilities/checkfcv.pl                        |   8 +-
 utilities/fcvextract.pl                      |  10 +-
 37 files changed, 851 insertions(+), 851 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 5fdf2a21..3c1fc41a 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -859,7 +859,7 @@ In this case, the simpler data-locking approach would be simpler
 and likely perform better.
 
 \begin{listing}[tb]
-\begin{linelabel}[ln:SMPdesign:Hierarchical-Locking Hash Table Search]
+\begin{fcvlabel}[ln:SMPdesign:Hierarchical-Locking Hash Table Search]
 \begin{VerbatimL}[commandchars=\\\[\]]
 struct hash_table
 {
@@ -901,7 +901,7 @@ int hash_search(struct hash_table *h, long key)
 	return 0;
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Hierarchical-Locking Hash Table Search}
 \label{lst:SMPdesign:Hierarchical-Locking Hash Table Search}
 \end{listing}
@@ -1020,7 +1020,7 @@ smaller than the number of non-\co{NULL} pointers.
 
 \subsubsection{Allocation Function}
 
-\begin{lineref}[ln:SMPdesign:smpalloc:alloc]
+\begin{fcvref}[ln:SMPdesign:smpalloc:alloc]
 The allocation function \co{memblock_alloc()} may be seen in
 Listing~\ref{lst:SMPdesign:Allocator-Cache Allocator Function}.
 Line~\lnref{pick} picks up the current thread's per-thread pool,
@@ -1039,7 +1039,7 @@ In either case, line~\lnref{chk:notempty} checks for the per-thread
 pool still being
 empty, and if not, \clnrefrange{rem:b}{rem:e} remove a block and return it.
 Otherwise, line~\lnref{ret:NULL} tells the sad tale of memory exhaustion.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/SMPdesign/smpalloc@alloc.fcv}
@@ -1049,7 +1049,7 @@ Otherwise, line~\lnref{ret:NULL} tells the sad tale of memory exhaustion.
 
 \subsubsection{Free Function}
 
-\begin{lineref}[ln:SMPdesign:smpalloc:free]
+\begin{fcvref}[ln:SMPdesign:smpalloc:free]
 Listing~\ref{lst:SMPdesign:Allocator-Cache Free Function} shows
 the memory-block free function.
 Line~\lnref{get} gets a pointer to this thread's pool, and
@@ -1065,7 +1065,7 @@ value.
 
 In either case, line~\lnref{place} then places the newly freed block into the
 per-thread pool.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/SMPdesign/smpalloc@free.fcv}
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index cb0008c2..12e9237a 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -65,7 +65,7 @@ The maze is represented by a 2D array of cells and
 a linear-array-based work queue named \co{->visited}.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:SMPdesign:SEQ Pseudocode]
+\begin{fcvlabel}[ln:SMPdesign:SEQ Pseudocode]
 \begin{VerbatimL}[commandchars=\\\@\$]
 int maze_solve(maze *mp, cell sc, cell ec)
 {
@@ -90,12 +90,12 @@ int maze_solve(maze *mp, cell sc, cell ec)
 	}						\lnlbl@loop:e$
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{SEQ Pseudocode}
 \label{lst:SMPdesign:SEQ Pseudocode}
 \end{listing}
 
-\begin{lineref}[ln:SMPdesign:SEQ Pseudocode]
+\begin{fcvref}[ln:SMPdesign:SEQ Pseudocode]
 Line~\lnref{initcell} visits the initial cell, and each iteration of the loop spanning
 \clnrefrange{loop:b}{loop:e} traverses passages headed by one cell.
 The loop spanning
@@ -104,10 +104,10 @@ visited cell with an unvisited neighbor, and the loop spanning
 \clnrefrange{loop3:b}{loop3:e} traverses one fork of the submaze
 headed by that neighbor.
 Line~\lnref{finalize} initializes for the next pass through the outer loop.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:SMPdesign:SEQ Helper Pseudocode]
+\begin{fcvlabel}[ln:SMPdesign:SEQ Helper Pseudocode]
 \begin{VerbatimL}[commandchars=\\\@\$]
 int maze_try_visit_cell(struct maze *mp, cell c, cell t, \lnlbl@try:b$
                         cell *n, int d)
@@ -138,12 +138,12 @@ int maze_find_any_next_cell(struct maze *mp, cell c, \lnlbl@find:b$
 	return 0;					\lnlbl@find:ret:false$
 }							\lnlbl@find:e$
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{SEQ Helper Pseudocode}
 \label{lst:SMPdesign:SEQ Helper Pseudocode}
 \end{listing}
 
-\begin{lineref}[ln:SMPdesign:SEQ Helper Pseudocode:try]
+\begin{fcvref}[ln:SMPdesign:SEQ Helper Pseudocode:try]
 The pseudocode for \co{maze_try_visit_cell()} is shown on
 \clnrefrange{b}{e}
 of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode}
@@ -160,9 +160,9 @@ slot of the \co{->visited[]} array,
 line~\lnref{next:visited} indicates that this slot
 is now full, and line~\lnref{mark:visited} marks this cell as visited and also records
 the distance from the maze start.  Line~\lnref{ret:success} then returns success.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:SMPdesign:SEQ Helper Pseudocode:find]
+\begin{fcvref}[ln:SMPdesign:SEQ Helper Pseudocode:find]
 The pseudocode for \co{maze_find_any_next_cell()} is shown on
 \clnrefrange{b}{e}
 of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode}
@@ -177,7 +177,7 @@ return true if the corresponding cell is a candidate next cell.
 The \co{prevcol()}, \co{nextcol()}, \co{prevrow()}, and \co{nextrow()}
 each do the specified array-index-conversion operation.
 If none of the cells is a candidate, line~\lnref{ret:false} returns false.
-\end{lineref}
+\end{fcvref}
 
 \begin{figure}[tb]
 \centering
@@ -204,18 +204,18 @@ consecutively decreasing cell numbers traverses the solution.
 The parallel work-queue solver is a straightforward parallelization
 of the algorithm shown in
 Listings~\ref{lst:SMPdesign:SEQ Pseudocode} and~\ref{lst:SMPdesign:SEQ Helper Pseudocode}.
-\begin{lineref}[ln:SMPdesign:SEQ Pseudocode]
+\begin{fcvref}[ln:SMPdesign:SEQ Pseudocode]
 \Clnref{ifge} of Listing~\ref{lst:SMPdesign:SEQ Pseudocode} must use fetch-and-add,
 and the local variable \co{vi} must be shared among the various threads.
-\end{lineref}
-\begin{lineref}[ln:SMPdesign:SEQ Helper Pseudocode:try]
+\end{fcvref}
+\begin{fcvref}[ln:SMPdesign:SEQ Helper Pseudocode:try]
 \Clnref{chk:not:visited,mark:visited} of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode} must be
 combined into a CAS loop, with CAS failure indicating a loop in the
 maze.
 \Clnrefrange{recordnext}{next:visited} of this listing must use
 fetch-and-add to arbitrate concurrent
 attempts to record cells in the \co{->visited[]} array.
-\end{lineref}
+\end{fcvref}
 
 This approach does provide significant speedups on a dual-CPU
 Lenovo\mytexttrademark\ W500
@@ -251,7 +251,7 @@ at opposite ends of the solution path, and takes a brief look at the
 performance and scalability consequences.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:SMPdesign:Partitioned Parallel Solver Pseudocode]
+\begin{fcvlabel}[ln:SMPdesign:Partitioned Parallel Solver Pseudocode]
 \begin{VerbatimL}[commandchars=\\\@\$]
 int maze_solve_child(maze *mp, cell *visited, cell sc)	\lnlbl@b$
 {
@@ -279,12 +279,12 @@ int maze_solve_child(maze *mp, cell *visited, cell sc)	\lnlbl@b$
 	return 1;
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Partitioned Parallel Solver Pseudocode}
 \label{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}
 \end{listing}
 
-\begin{lineref}[ln:SMPdesign:Partitioned Parallel Solver Pseudocode]
+\begin{fcvref}[ln:SMPdesign:Partitioned Parallel Solver Pseudocode]
 The partitioned parallel algorithm (PART), shown in
 Listing~\ref{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}
 (\path{maze_part.c}),
@@ -311,10 +311,10 @@ Finally, the \co{maze_find_any_next_cell()} function must use
 compare-and-swap to mark a cell as visited, however
 no constraints on ordering are required beyond those provided by
 thread creation and join.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:SMPdesign:Partitioned Parallel Helper Pseudocode]
+\begin{fcvlabel}[ln:SMPdesign:Partitioned Parallel Helper Pseudocode]
 \begin{VerbatimL}[commandchars=\\\@\$]
 int maze_try_visit_cell(struct maze *mp, int c, int t,
                         int *n, int d)
@@ -340,12 +340,12 @@ int maze_try_visit_cell(struct maze *mp, int c, int t,
 	return 1;					\lnlbl@ret:success$
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Partitioned Parallel Helper Pseudocode}
 \label{lst:SMPdesign:Partitioned Parallel Helper Pseudocode}
 \end{listing}
 
-\begin{lineref}[ln:SMPdesign:Partitioned Parallel Helper Pseudocode]
+\begin{fcvref}[ln:SMPdesign:Partitioned Parallel Helper Pseudocode]
 The pseudocode for \co{maze_find_any_next_cell()} is identical to that shown in
 Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode},
 but the pseudocode for \co{maze_try_visit_cell()} differs, and
@@ -364,7 +364,7 @@ that the solution has been located.
 Line~\lnref{update:new} updates to the new cell,
 lines~\lnref{update:visited:b} and~\lnref{update:visited:e} update this thread's visited
 array, and line~\lnref{ret:success} returns success.
-\end{lineref}
+\end{fcvref}
 
 \begin{figure}[tb]
 \centering
diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 2b8822a9..9cebe6b7 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -358,7 +358,7 @@ Listing~\ref{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Data Structure
 shows the corresponding C-language data structure, assuming an
 existing \co{struct deq} that provides a trivially locked
 double-ended-queue implementation.
-\begin{lineref}[ln:SMPdesign:lockhdeq:struct_pdeq]
+\begin{fcvref}[ln:SMPdesign:lockhdeq:struct_pdeq]
 This data structure contains the left-hand lock on line~\lnref{llock},
 the left-hand index on line~\lnref{lidx}, the right-hand lock on line~\lnref{rlock}
 (which is cache-aligned in the actual implementation),
@@ -366,7 +366,7 @@ the right-hand index on line~\lnref{ridx}, and, finally, the hashed array
 of simple lock-based double-ended queues on line~\lnref{bkt}.
 A high-performance implementation would of course use padding or special
 alignment directives to avoid false sharing.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/SMPdesign/lockhdeq@pop_push.fcv}
@@ -383,7 +383,7 @@ shows the implementation of the enqueue and dequeue functions.\footnote{
 Discussion will focus on the left-hand operations, as the right-hand
 operations are trivially derived from them.
 
-\begin{lineref}[ln:SMPdesign:lockhdeq:pop_push:popl]
+\begin{fcvref}[ln:SMPdesign:lockhdeq:pop_push:popl]
 \Clnrefrange{b}{e} show \co{pdeq_pop_l()},
 which left\-/dequeues and returns
 an element if possible, returning \co{NULL} otherwise.
@@ -396,9 +396,9 @@ non-\co{NULL}, line~\lnref{record} records the new left-hand index.
 Either way, line~\lnref{rel} releases the lock, and,
 finally, line~\lnref{return} returns
 the element if there was one, or \co{NULL} otherwise.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:SMPdesign:lockhdeq:pop_push:pushl]
+\begin{fcvref}[ln:SMPdesign:lockhdeq:pop_push:pushl]
 \Clnrefrange{b}{e} show \co{pdeq_push_l()},
 which left-enqueues the specified
 element.
@@ -410,7 +410,7 @@ onto the double-ended queue
 indexed by the left-hand index.
 Line~\lnref{update} then updates the left-hand index
 and line~\lnref{rel} releases the lock.
-\end{lineref}
+\end{fcvref}
 
 As noted earlier, the right-hand operations are completely analogous
 to their left-handed counterparts, so their analysis is left as an
@@ -487,7 +487,7 @@ and \co{pdeq_pop_r()} implementations separately.
 	(see Section~\ref{sec:SMPdesign:Dining Philosophers Problem}).
 } \QuickQuizEnd
 
-\begin{lineref}[ln:SMPdesign:locktdeq:pop_push:popl]
+\begin{fcvref}[ln:SMPdesign:locktdeq:pop_push:popl]
 The \co{pdeq_pop_l()} implementation is shown on
 \clnrefrange{b}{e}
 of the figure.
@@ -505,9 +505,9 @@ queue to the left-hand queue, line~\lnref{init:r} initializes
 the right-hand queue,
 and line~\lnref{rel:r} releases the right-hand lock.
 The element, if any, that was dequeued on line~\lnref{deq:lr} will be returned.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:SMPdesign:locktdeq:pop_push:popr]
+\begin{fcvref}[ln:SMPdesign:locktdeq:pop_push:popr]
 The \co{pdeq_pop_r()} implementation is shown on \clnrefrange{b}{e}
 of the figure.
 As before, line~\lnref{acq:r1} acquires the right-hand lock
@@ -528,19 +528,19 @@ failed, line~\lnref{deq:rl} right-dequeues an element from the left-hand queue
 from the left-hand queue to the right-hand queue, and line~\lnref{init:l}
 initializes the left-hand queue.
 Either way, line~\lnref{rel:l} releases the left-hand lock.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why is it necessary to retry the right-dequeue operation
 	on line~\ref{ln:SMPdesign:locktdeq:pop_push:popr:deq:rr2} of
 	Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}?
 \QuickQuizAnswer{
-	\begin{lineref}[ln:SMPdesign:locktdeq:pop_push:popr]
+	\begin{fcvref}[ln:SMPdesign:locktdeq:pop_push:popr]
 	This retry is necessary because some other thread might have
 	enqueued an element between the time that this thread dropped
 	\co{d->rlock} on line~\lnref{rel:r1} and the time that it reacquired this
 	same lock on line~\lnref{acq:r2}.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 \QuickQuiz{}
@@ -558,7 +558,7 @@ Either way, line~\lnref{rel:l} releases the left-hand lock.
 	it is worthwhile) is left as an exercise for the reader.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:SMPdesign:locktdeq:pop_push:pushl]
+\begin{fcvref}[ln:SMPdesign:locktdeq:pop_push:pushl]
 The \co{pdeq_push_l()} implementation is shown on
 \clnrefrange{b}{e} of
 Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}.
@@ -566,11 +566,11 @@ Line~\lnref{acq:l} acquires the left-hand spinlock,
 line~\lnref{que:l} left-enqueues the
 element onto the left-hand queue, and finally line~\lnref{rel:l} releases
 the lock.
-\end{lineref}
-\begin{lineref}[ln:SMPdesign:locktdeq:pop_push:pushr]
+\end{fcvref}
+\begin{fcvref}[ln:SMPdesign:locktdeq:pop_push:pushr]
 The \co{pdeq_push_r()} implementation (shown on \clnrefrange{b}{e})
 is quite similar.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	But in the case where data is flowing in only one direction,
diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 7dda22ad..7d637d31 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -165,7 +165,7 @@ Cute definitional tricks notwithstanding, this algorithm is probably
 the most heavily used NBS algorithm in the Linux kernel.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:count:NBS Enqueue Algorithm]
+\begin{fcvlabel}[ln:count:NBS Enqueue Algorithm]
 \begin{VerbatimL}[commandchars=\\\[\]]
 static inline bool
 ___cds_wfcq_append(struct cds_wfcq_head *head,
@@ -189,12 +189,12 @@ _cds_wfcq_enqueue(struct cds_wfcq_head *head,
 	                          new_tail, new_tail);
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{NBS Enqueue Algorithm}
 \label{lst:count:NBS Enqueue Algorithm}
 \end{listing}
 
-\begin{lineref}[ln:count:NBS Enqueue Algorithm]
+\begin{fcvref}[ln:count:NBS Enqueue Algorithm]
 Another common NBS algorithm is the atomic queue where elements are
 enqueued using an atomic exchange instruction~\cite{MagedMichael1993JPDC},
 followed by a store into the \co{->next} pointer of the new element's
@@ -220,7 +220,7 @@ dequeues are blocking.
 This algorithm is nevertheless heavily used in practice, in part because
 most production software is not required to tolerate arbitrary fail-stop
 errors.
-\end{lineref}
+\end{fcvref}
 
 \subsection{Applicability of NBS Benefits}
 \label{sec:advsync:Applicability of NBS Benefits}
diff --git a/advsync/rt.tex b/advsync/rt.tex
index a92b83d0..6a2f25c8 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1156,7 +1156,7 @@ Otherwise, long RCU read-side critical sections would result in
 excessive real-time latencies.
 
 \begin{listing}[tb]
-\begin{linelabel}[ln:advsync:Preemptible Linux-Kernel RCU]
+\begin{fcvlabel}[ln:advsync:Preemptible Linux-Kernel RCU]
 \begin{VerbatimL}[commandchars=\\\[\]]
 void __rcu_read_lock(void)			\lnlbl[lock:b]
 {
@@ -1181,7 +1181,7 @@ void __rcu_read_unlock(void)		        \lnlbl[unl:b]
 	}					\lnlbl[unl:els:e]
 }						\lnlbl[unl:e]
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Preemptible Linux-Kernel RCU}
 \label{lst:advsync:Preemptible Linux-Kernel RCU}
 \end{listing}
@@ -1198,19 +1198,19 @@ while in one of those pre-existing critical sections have removed
 themselves from their lists.
 A simplified version of this implementation is shown in
 \cref{lst:advsync:Preemptible Linux-Kernel RCU}.
-\begin{lineref}[ln:advsync:Preemptible Linux-Kernel RCU]
+\begin{fcvref}[ln:advsync:Preemptible Linux-Kernel RCU]
 The \co{__rcu_read_lock()} function spans \clnrefrange{lock:b}{lock:e} and
 the \co{__rcu_read_unlock()} function spans \clnrefrange{unl:b}{unl:e}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:advsync:Preemptible Linux-Kernel RCU:lock]
+\begin{fcvref}[ln:advsync:Preemptible Linux-Kernel RCU:lock]
 \Clnref{inc} of \co{__rcu_read_lock()} increments a per-task count of the
 number of nested \co{rcu_read_lock()} calls, and
 \clnref{bar} prevents the compiler from reordering the subsequent code in the
 RCU read-side critical section to precede the \co{rcu_read_lock()}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:advsync:Preemptible Linux-Kernel RCU:unl]
+\begin{fcvref}[ln:advsync:Preemptible Linux-Kernel RCU:unl]
 \Clnref{chkn} of \co{__rcu_read_unlock()} checks to see if the nesting
 level count is one, in other words, if this corresponds to the outermost
 \co{rcu_read_unlock()} of a nested set.
@@ -1246,10 +1246,10 @@ real-time software~\cite{BjoernBrandenburgPhD,DipankarSarma2004OLSscalability}.
 Whether or not special handling is required, \clnref{bar3} prevents the compiler
 from reordering the check on \clnref{chks} with the zeroing of the nesting
 count on \clnref{zero}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:advsync:Preemptible Linux-Kernel RCU:unl]
+	\begin{fcvref}[ln:advsync:Preemptible Linux-Kernel RCU:unl]
 	Suppose that preemption occurs just after the load from
 	\co{t->rcu_read_unlock_special.s} on \clnref{chks} of
 	\cref{lst:advsync:Preemptible Linux-Kernel RCU}.
@@ -1257,7 +1257,7 @@ count on \clnref{zero}.
 	\co{rcu_read_unlock_special()}, thus failing to remove itself
 	from the list of tasks blocking the current grace period,
 	in turn causing that grace period to extend indefinitely?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	That is a real problem, and it is solved in RCU's scheduler hook.
 	If that scheduler hook sees that the value of
@@ -1471,7 +1471,7 @@ OSADL runs long-term tests of systems, so referring to their
 website (\url{http://osadl.org/}) can be helpful.
 
 \begin{listing}[tb]
-\begin{linelabel}[ln:advsync:Locating Sources of OS Jitter]
+\begin{fcvlabel}[ln:advsync:Locating Sources of OS Jitter]
 \begin{VerbatimL}[commandchars=\\\[\]]
 cd /sys/kernel/debug/tracing
 echo 1 > max_graph_depth		\lnlbl[echo1]
@@ -1479,12 +1479,12 @@ echo function_graph > current_tracer
 # run workload
 cat per_cpu/cpuN/trace			\lnlbl[cat]
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Locating Sources of OS Jitter}
 \label{lst:advsync:Locating Sources of OS Jitter}
 \end{listing}
 
-\begin{lineref}[ln:advsync:Locating Sources of OS Jitter]
+\begin{fcvref}[ln:advsync:Locating Sources of OS Jitter]
 Unfortunately, this list of OS-jitter sources can never be complete,
 as it will change with each new version of the kernel.
 This makes it necessary to be able to track down additional sources
@@ -1498,7 +1498,7 @@ number of the CPU in question, and the \co{1} on \clnref{echo1} may be
 increased
 to show additional levels of function call within the kernel.
 The resulting trace can help track down the source of the OS jitter.
-\end{lineref}
+\end{fcvref}
 
 As you can see, obtaining bare-metal performance when running
 CPU-bound real-time threads on a general-purpose OS such as Linux
@@ -1716,7 +1716,7 @@ We therefore need to schedule the fuel injection to within a time
 interval of about 100 microseconds.
 
 \begin{listing}[tb]
-\begin{linelabel}[ln:advsync:Timed-Wait Test Program]
+\begin{fcvlabel}[ln:advsync:Timed-Wait Test Program]
 \begin{VerbatimL}
 if (clock_gettime(CLOCK_REALTIME, &timestart) != 0) {
 	perror("clock_gettime 1");
@@ -1731,7 +1731,7 @@ if (clock_gettime(CLOCK_REALTIME, &timeend) != 0) {
 	exit(-1);
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Timed-Wait Test Program}
 \label{lst:advsync:Timed-Wait Test Program}
 \end{listing}
@@ -1799,7 +1799,7 @@ Otherwise, \co{cur_cal} points to a dynamically allocated
 structure providing the current calibration values.
 
 \begin{listing}[tb]
-\begin{linelabel}[ln:advsync:Real-Time Calibration Using RCU]
+\begin{fcvlabel}[ln:advsync:Real-Time Calibration Using RCU]
 \begin{VerbatimL}[commandchars=\\\[\]]
 struct calibration {
 	short a;
@@ -1837,19 +1837,19 @@ bool update_cal(short a, short b, short c)		\lnlbl[upd:b]
 	return true;
 }							\lnlbl[upd:e]
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Real-Time Calibration Using RCU}
 \label{lst:advsync:Real-Time Calibration Using RCU}
 \end{listing}
 
-\begin{lineref}[ln:advsync:Real-Time Calibration Using RCU]
+\begin{fcvref}[ln:advsync:Real-Time Calibration Using RCU]
 \Cref{lst:advsync:Real-Time Calibration Using RCU}
 shows how RCU can be used to solve this problem.
 Lookups are deterministic, as shown in \co{calc_control()}
 on \clnrefrange{calc:b}{calc:e}, consistent with real-time requirements.
 Updates are more complex, as shown by \co{update_cal()}
 on \clnrefrange{upd:b}{upd:e}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Given that real-time systems are often used for safety-critical
diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index c56621bd..2c6c2aac 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -88,7 +88,7 @@ a large number exceeding 10 microseconds, and one exceeding even
 Please note that this CPU can potentially execute more than 100,000
 instructions in that time.
 
-\begin{lineref}[ln:api-pthreads:QAfter:time]
+\begin{fcvref}[ln:api-pthreads:QAfter:time]
 One possible reason is given by the following sequence of events:
 \begin{enumerate}
 \item	Consumer obtains timestamp
@@ -136,7 +136,7 @@ producer's timestamp.
 The segments of code in each box in this figure are termed
 ``critical sections''; only one such critical section may be executing
 at a given time.
-\end{lineref}
+\end{fcvref}
 
 \begin{figure}[htb]
 \centering
diff --git a/appendix/styleguide/samplecodesnippetfcv.tex b/appendix/styleguide/samplecodesnippetfcv.tex
index b47b7f59..99952e5a 100644
--- a/appendix/styleguide/samplecodesnippetfcv.tex
+++ b/appendix/styleguide/samplecodesnippetfcv.tex
@@ -1,5 +1,5 @@
 \begin{listing}[tb]
-\begin{linelabel}[ln:base1]			%lnlbl~beg:linelabel^
+\begin{fcvlabel}[ln:base1]			%lnlbl~beg:fcvlabel^
 \begin{VerbatimL}[commandchars=\$\[\]]
 /*
  * Sample Code Snippet
@@ -11,7 +11,7 @@ int main(void)
 	return 0;			$lnlbl[return]
 }
 \end{VerbatimL}
-\end{linelabel}					%lnlbl~end:linelabel^
+\end{fcvlabel}					%lnlbl~end:fcvlabel^
 \caption{Sample Code Snippet}
 \label{lst:app:styleguide:Sample Code Snippet}
 \end{listing}
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index ca74d362..fb5671c3 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -383,9 +383,9 @@ They are defined in the preamble as shown below:
 
 \begin{listing}[tb]
 \fvset{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,obeytabs=true,tabsize=8,commandchars=\%\~\^}
-\begin{linelabel}[ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current)]
+\begin{fcvlabel}[ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current)]
 \VerbatimInput{appendix/styleguide/samplecodesnippetfcv.tex}
-\end{linelabel}
+\end{fcvlabel}
 \vspace*{-9pt}
 \caption{\LaTeX\ Source of Sample Code Snippet (Current)}
 \label{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
@@ -409,19 +409,19 @@ Labels \qco{printf} and \qco{return} in
 can be referred to as shown below:
 
 \begin{VerbatimU}
-\begin{lineref}[ln:base1]
+\begin{fcvref}[ln:base1]
 Lines~\lnref{printf} and~\lnref{return} can be referred
 to from text.
-\end{lineref}
+\end{fcvref}
 \end{VerbatimU}
 
 Above code results in the paragraph below:
 
 \begin{quote}
-\begin{lineref}[ln:base1]
+\begin{fcvref}[ln:base1]
 Lines~\lnref{printf} and~\lnref{return} can be referred
 to from text.
-\end{lineref}
+\end{fcvref}
 \end{quote}
 
 Macros ``\co{\\lnlbl\{\}}'' and ``\co{\\lnref\{\}}'' are defined in
@@ -435,28 +435,28 @@ the preamble as follows:
 \newcommand{\lnref}[1]{\ref{\lnrefbase:#1}}
 \end{VerbatimU}
 
-Environments \qco{linelabel} and \qco{lineref} are defined as
+Environments \qco{fcvlabel} and \qco{fcvref} are defined as
 shown below:
 
 \begin{VerbatimU}
-\newenvironment{linelabel}[1][]{%
+\newenvironment{fcvlabel}[1][]{%
   \renewcommand{\lnlblbase}{#1}%
   \ignorespaces}{\ignorespacesafterend}
-\newenvironment{lineref}[1][]{%
+\newenvironment{fcvref}[1][]{%
   \renewcommand{\lnrefbase}{#1}%
   \ignorespaces}{\ignorespacesafterend}
 \end{VerbatimU}
 
-\begin{lineref}[ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current)]
+\begin{fcvref}[ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current)]
 The main part of \LaTeX\ source shown on
-\Clnrefrange{beg:linelabel}{end:linelabel} in
+\Clnrefrange{beg:fcvlabel}{end:fcvlabel} in
 \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
 can be extracted from a code sample of
 \cref{lst:app:styleguide:Source of Code Sample} by a perl script
 \path{utilities/fcvextract.pl}. All the relevant rules of extraction
 are described as recipes in the top level \path{Makefile} and
 a script to generate dependencies (\path{utilities/gen_snippet_d.pl}).
-\end{lineref}
+\end{fcvref}
 
 \begin{listing*}[tb]
 \fvset{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,obeytabs=true,tabsize=8}
@@ -493,8 +493,8 @@ is a comma-spareted list of options shown below:
 
 The \qco{labelbase} option is mandatory and the string given to it
 will be passed to the
-``\co{\\begin\{linelabel\}[<label base string>]}'' command as shown on
-line~\ref{ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current):beg:linelabel} of
+``\co{\\begin\{fcvlabel\}[<label base string>]}'' command as shown on
+line~\ref{ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current):beg:fcvlabel} of
 \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}.
 The \qco{keepcomment=yes} option tells \co{fcvextract.pl} to keep
 comment blocks.
@@ -554,7 +554,7 @@ You can't use ``\co{\{}'' nor ``\co{\}}'' in comments in litmus tests, either.
 
 Examples of disallowed comments in a litmus test are shown below:
 
-\begin{linelabel}[ln:app:styleguide:Bad comments in Litmus Test]
+\begin{fcvlabel}[ln:app:styleguide:Bad comments in Litmus Test]
 \begin{VerbatimN}[tabsize=8]
 // Comment at first
 C C-sample
@@ -574,12 +574,12 @@ P0(int *x}
 
 exists (0:r1=0)  // C++ style comment after test body
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
 To avoid parse errors, meta commands in litmus tests (C flavor) are embedded
 in the following way.
 
-\begin{linelabel}[ln:app:styleguide:Sample Source of Litmus Test]
+\begin{fcvlabel}[ln:app:styleguide:Sample Source of Litmus Test]
 \begin{VerbatimN}[tabsize=8]
 C C-SB+o-o+o-o
 //\begin[snippet][labelbase=ln:base,commandchars=\%\@\$]
@@ -607,7 +607,7 @@ P1(int *x0, int *x1)
 //\end[snippet]
 exists (1:r2=0 /\ 0:r2=0)  (* \lnlbl[exists_] *)
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
 Example above is converted to the following intermediate code
 by a script \path{utilities/reorder_ltms.pl}.\footnote{
@@ -616,7 +616,7 @@ by a script \path{utilities/reorder_ltms.pl}.\footnote{
 The intermediate code can be handled
 by the common script \path{utilities/fcvextract.pl}.
 
-\begin{linelabel}[ln:app:styleguide:Intermediate Source of Litmus Test]
+\begin{fcvlabel}[ln:app:styleguide:Intermediate Source of Litmus Test]
 \begin{VerbatimN}[tabsize=8]
 // Do not edit!
 // Generated by utillities/reorder_ltms.pl
@@ -646,7 +646,7 @@ P1(int *x0, int *x1)
 exists (1:r2=0 /\ 0:r2=0)  \lnlbl{exists_}
 //\end{snippet}
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
 Note that each litmus test's source file can contain at most one
 pair of \co{\\begin[snippet]} and \co{\\end[snippet]} because of
@@ -662,10 +662,10 @@ and is typeset as shown in
 \cref{lst:app:styleguide:Sample Code Snippet (Obsolete)}.
 
 \begin{listing}[tb]
-\begin{linelabel}[ln:app:styleguide:samplecodesnippetlstlbl]
+\begin{fcvlabel}[ln:app:styleguide:samplecodesnippetlstlbl]
 \fvset{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,commandchars=\%\@\$}
 \VerbatimInput{appendix/styleguide/samplecodesnippetlstlbl.tex}
-\end{linelabel}
+\end{fcvlabel}
 \vspace*{-9pt}
 \caption{\LaTeX\ Source of Sample Code Snippet (Obsolete)}
 \label{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
@@ -969,23 +969,23 @@ consistency.
 Example with a simple dash:
 
 \begin{quote}
-\begin{lineref}[ln:app:styleguide:samplecodesnippetlstlbl]
+\begin{fcvref}[ln:app:styleguide:samplecodesnippetlstlbl]
   Lines~\lnref{b}\=/\lnref{e} in
   \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
   are the contents of the verbbox environment. The box is output
   by the \co{\\theverbbox} macro on \clnref{theverbbox}.
-\end{lineref}
+\end{fcvref}
 \end{quote}
 
 Example with an en dash:
 
 \begin{quote}
-\begin{lineref}[ln:app:styleguide:samplecodesnippetlstlbl]
+\begin{fcvref}[ln:app:styleguide:samplecodesnippetlstlbl]
   Lines~\lnref{b}\==\lnref{e} in
   \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
   are the contents of the verbbox environment. The box is output
   by the \co{\\theverbbox} macro on \clnref{theverbbox}.
-\end{lineref}
+\end{fcvref}
 \end{quote}
 
 \subsubsection{Numerical Minus Sign}
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 07801b57..a65cecf5 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -79,7 +79,7 @@ preventing grace-period sharing.
 \QuickQuizAnswer{
 %
 \begin{listing}[tbp]
-\begin{linelabel}[ln:app:toyrcu:Deadlock in Lock-Based RCU Implementation]
+\begin{fcvlabel}[ln:app:toyrcu:Deadlock in Lock-Based RCU Implementation]
 \begin{VerbatimL}[commandchars=\\\[\]]
 void foo(void)
 {
@@ -101,12 +101,12 @@ void bar(void)
 	rcu_read_unlock();
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Deadlock in Lock-Based RCU Implementation}
 \label{lst:app:toyrcu:Deadlock in Lock-Based RCU Implementation}
 \end{listing}
 %
-	\begin{lineref}[ln:app:toyrcu:Deadlock in Lock-Based RCU Implementation]
+	\begin{fcvref}[ln:app:toyrcu:Deadlock in Lock-Based RCU Implementation]
 	Suppose the functions \co{foo()} and \co{bar()} in
 	\cref{lst:app:toyrcu:Deadlock in Lock-Based RCU Implementation}
 	are invoked concurrently from different CPUs.
@@ -117,7 +117,7 @@ void bar(void)
 	acquire \co{rcu_gp_lock}, which is held by \co{bar()}.
 	Then when \co{bar()} advances to \clnref{bar:acq}, it will attempt
 	to acquire \co{my_lock}, which is held by \co{foo()}.
-	\end{lineref}
+	\end{fcvref}
 
 	Each function is then waiting for a lock that the other
 	holds, a classic deadlock.
@@ -185,13 +185,13 @@ on a single \Power{5} CPU
 up to more than 100 \emph{microseconds} on 64 CPUs.
 
 \QuickQuiz{}
-	\begin{lineref}[ln:defer:rcu_lock_percpu:sync:loop]
+	\begin{fcvref}[ln:defer:rcu_lock_percpu:sync:loop]
 	Wouldn't it be cleaner to acquire all the locks, and then
 	release them all in the loop from \clnrefrange{b}{e} of
 	\cref{lst:app:toyrcu:Per-Thread Lock-Based RCU Implementation}?
 	After all, with this change, there would be a point in time
 	when there were no readers, simplifying things greatly.
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	Making this change would re-introduce the deadlock, so
 	no, it would not be cleaner.
@@ -259,7 +259,7 @@ the shortcomings of the lock-based implementation.
 A slightly more sophisticated RCU implementation is shown in
 \cref{lst:app:toyrcu:RCU Implementation Using Single Global Reference Counter}
 (\path{rcu_rcg.h} and \path{rcu_rcg.c}).
-\begin{lineref}[ln:defer:rcu_rcg]
+\begin{fcvref}[ln:defer:rcu_rcg]
 This implementation makes use of a global reference counter
 \co{rcu_refcnt} defined on \clnref{lock_unlock:grc}.
 The \co{rcu_read_lock()} primitive atomically increments this
@@ -275,7 +275,7 @@ The \co{poll()} on \clnref{sync:poll} merely provides pure delay, and from
 a pure RCU-semantics point of view could be omitted.
 Again, once \co{synchronize_rcu()} returns, all prior
 RCU read-side critical sections are guaranteed to have completed.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/rcu_rcg@lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
@@ -453,7 +453,7 @@ additional measures must be taken to permit nesting.
 These additional measures use the per-thread \co{rcu_nesting} variable
 to track nesting.
 
-\begin{lineref}[ln:defer:rcu_rcpg:r:lock]
+\begin{fcvref}[ln:defer:rcu_rcpg:r:lock]
 To make all this work, \clnref{pick} of \co{rcu_read_lock()} in
 \cref{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
 picks up the
@@ -465,9 +465,9 @@ and atomically increment the selected element of \co{rcu_refcnt}.
 Regardless of the value of \co{rcu_nesting}, \clnref{inc} increments it.
 \Clnref{mb} executes a memory barrier to ensure that the RCU read-side
 critical section does not bleed out before the \co{rcu_read_lock()} code.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:defer:rcu_rcpg:r:unlock]
+\begin{fcvref}[ln:defer:rcu_rcpg:r:unlock]
 Similarly, the \co{rcu_read_unlock()} function executes a memory barrier
 at \clnref{mb}
 to ensure that the RCU read-side critical section does not bleed out
@@ -479,7 +479,7 @@ then \clnref{idx,atmdec} pick up this thread's instance of \co{rcu_read_idx}
 the selected element of \co{rcu_refcnt}.
 Regardless of the nesting level, \clnref{decnest} decrements this thread's
 instance of \co{rcu_nesting}.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/rcu_rcpg@sync.fcv}
@@ -487,7 +487,7 @@ instance of \co{rcu_nesting}.
 \label{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}
 \end{listing}
 
-\begin{lineref}[ln:defer:rcu_rcpg:sync]
+\begin{fcvref}[ln:defer:rcu_rcpg:sync]
 \Cref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}
 (\path{rcu_rcpg.c})
 shows the corresponding \co{synchronize_rcu()} implementation.
@@ -506,14 +506,14 @@ of \co{rcu_refcnt} is not reordered to precede the complementing of
 \clnref{mb5} ensures that any
 subsequent reclamation operations are not reordered to precede the
 checking of \co{rcu_refcnt}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:defer:rcu_rcpg:sync]
+	\begin{fcvref}[ln:defer:rcu_rcpg:sync]
 	Why the memory barrier on \clnref{mb1} of \co{synchronize_rcu()} in
 	\cref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}
 	given that there is a spin-lock acquisition immediately after?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	The spin-lock acquisition only guarantees that the spin-lock's
 	critical section will not ``bleed out'' to precede the
@@ -540,7 +540,7 @@ checking of \co{rcu_refcnt}.
 	\cref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}?
 	Shouldn't a single flip-and-wait cycle be sufficient?
 \QuickQuizAnswer{
-	\begin{lineref}[ln:defer:rcu_rcpg]
+	\begin{fcvref}[ln:defer:rcu_rcpg]
 	Both flips are absolutely required.
 	To see this, consider the following sequence of events:
 	\begin{enumerate}
@@ -589,7 +589,7 @@ checking of \co{rcu_refcnt}.
 	Does this implementation operate correctly in that case?
 	Why or why not?
 	The first correct and complete response will be credited.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 This implementation avoids the update-starvation issues that could
@@ -633,12 +633,12 @@ serializes grace periods, preventing grace-period
 sharing.
 
 \QuickQuiz{}
-	\begin{lineref}[ln:defer:rcu_rcpg:r]
+	\begin{fcvref}[ln:defer:rcu_rcpg:r]
 	Given that atomic increment and decrement are so expensive,
 	why not just use non-atomic increment on \clnref{lock:cur:e} and a
 	non-atomic decrement on \clnref{unlock:atmdec} of
 	\cref{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	Using non-atomic operations would cause increments and decrements
 	to be lost, in turn causing the implementation to fail.
@@ -714,14 +714,14 @@ perform atomic operations.
 (\path{rcu_rcpl.c})
 shows the implementation of \co{synchronize_rcu()}, along with a helper
 function named \co{flip_counter_and_wait()}.
-\begin{lineref}[ln:defer:rcu_rcpl:u:sync]
+\begin{fcvref}[ln:defer:rcu_rcpl:u:sync]
 The \co{synchronize_rcu()} function resembles that shown in
 \cref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair},
 except that the repeated counter flip is replaced by a pair of calls
 on \clnref{flip1,flip2} to the new helper function.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:defer:rcu_rcpl:u:flip]
+\begin{fcvref}[ln:defer:rcu_rcpl:u:flip]
 The new \co{flip_counter_and_wait()} function updates the
 \co{rcu_idx} variable on \clnref{atmset},
 executes a memory barrier on \clnref{mb1},
@@ -730,7 +730,7 @@ spin on each thread's prior \co{rcu_refcnt} element,
 waiting for it to go to zero.
 Once all such elements have gone to zero,
 it executes another memory barrier on \clnref{mb2} and returns.
-\end{lineref}
+\end{fcvref}
 
 This RCU implementation imposes important new requirements on its
 software environment, namely, (1) that it be possible to declare
@@ -803,7 +803,7 @@ concurrent RCU updates.
 shows the read-side primitives for an RCU implementation using per-thread
 reference count pairs, as before, but permitting updates to share
 grace periods.
-\begin{lineref}[ln:defer:rcu_rcpls:r]
+\begin{fcvref}[ln:defer:rcu_rcpls:r]
 The main difference from the earlier implementation shown in
 \cref{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair}
 is that \co{rcu_idx} is now a \co{long} that counts freely,
@@ -816,7 +816,7 @@ The data is also quite similar, as shown in
 \cref{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data},
 with \co{rcu_idx} now being a \co{long} instead of an
 \co{atomic_t}.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/rcu_rcpls@define.fcv}
@@ -837,13 +837,13 @@ function \co{flip_counter_and_wait()}.
 These are similar to those in
 \cref{lst:app:toyrcu:RCU Update Using Per-Thread Reference-Count Pair}.
 The differences in \co{flip_counter_and_wait()} include:
-\begin{lineref}[ln:defer:rcu_rcpls:u:flip]
+\begin{fcvref}[ln:defer:rcu_rcpls:u:flip]
 \begin{enumerate}
 \item	\Clnref{inc} uses \co{WRITE_ONCE()} instead of \co{atomic_set()},
 	and increments rather than complementing.
 \item	A new \clnref{mask} masks the counter down to its bottom bit.
 \end{enumerate}
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/rcu_rcpls@u.fcv}
@@ -851,7 +851,7 @@ The differences in \co{flip_counter_and_wait()} include:
 \label{lst:app:toyrcu:RCU Shared Update Using Per-Thread Reference-Count Pair}
 \end{listing}
 
-\begin{lineref}[ln:defer:rcu_rcpls:u:sync]
+\begin{fcvref}[ln:defer:rcu_rcpls:u:sync]
 The changes to \co{synchronize_rcu()} are more pervasive:
 \begin{enumerate}
 \item	There is a new \co{oldctr} local variable that captures
@@ -870,7 +870,7 @@ The changes to \co{synchronize_rcu()} are more pervasive:
 	thread did one full wait for all the counters to go to zero,
 	so only one more is required.
 \end{enumerate}
-\end{lineref}
+\end{fcvref}
 
 With this approach, if an arbitrarily large number of threads invoke
 \co{synchronize_rcu()} concurrently, with one CPU for each thread, there
@@ -966,16 +966,16 @@ that takes on only even-numbered values, with data shown in
 
 The resulting \co{rcu_read_lock()} implementation is extremely
 straightforward.
-\begin{lineref}[ln:defer:rcu:read_lock_unlock:lock]
+\begin{fcvref}[ln:defer:rcu:read_lock_unlock:lock]
 \Clnref{gp1,gp2} simply
 add one to the global free-running \co{rcu_gp_ctr}
 variable and stores the resulting odd-numbered value into the
 \co{rcu_reader_gp} per-thread variable.
 \Clnref{mb} executes a memory barrier to prevent the content of the
 subsequent RCU read-side critical section from ``leaking out''.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:defer:rcu:read_lock_unlock:unlock]
+\begin{fcvref}[ln:defer:rcu:read_lock_unlock:unlock]
 The \co{rcu_read_unlock()} implementation is similar.
 \Clnref{mb} executes a memory barrier, again to prevent the prior RCU
 read-side critical section from ``leaking out''.
@@ -983,15 +983,15 @@ read-side critical section from ``leaking out''.
 \co{rcu_reader_gp} per-thread variable, leaving this per-thread
 variable with an even-numbered value so that a concurrent instance
 of \co{synchronize_rcu()} will know to ignore it.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:defer:rcu:read_lock_unlock:unlock]
+	\begin{fcvref}[ln:defer:rcu:read_lock_unlock:unlock]
 	If any even value is sufficient to tell \co{synchronize_rcu()}
 	to ignore a given task, why don't \clnref{gp1,gp2} of
 	\cref{lst:app:toyrcu:Free-Running Counter Using RCU}
 	simply assign zero to \co{rcu_reader_gp}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	Assigning zero (or any other even-numbered constant)
 	would in fact work, but assigning the value of
@@ -1000,7 +1000,7 @@ of \co{synchronize_rcu()} will know to ignore it.
 	thread last exited an RCU read-side critical section.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:defer:rcu:synchronize:syn]
+\begin{fcvref}[ln:defer:rcu:synchronize:syn]
 Thus, \co{synchronize_rcu()} could wait for all of the per-thread
 \co{rcu_reader_gp} variables to take on even-numbered values.
 However, it is possible to do much better than that because
@@ -1030,16 +1030,16 @@ pre-existing RCU read-side critical section, but this can be replaced with
 a spin-loop if grace-period latency is of the essence.
 Finally, the memory barrier at \clnref{mb3} ensures that any subsequent
 destruction will not be reordered into the preceding loop.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:defer:rcu:synchronize:syn]
+	\begin{fcvref}[ln:defer:rcu:synchronize:syn]
 	Why are the memory barriers on \clnref{mb1,mb3} of
 	\cref{lst:app:toyrcu:Free-Running Counter Using RCU}
 	needed?
 	Aren't the memory barriers inherent in the locking
 	primitives on \clnref{spinlock,spinunlock} sufficient?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	These memory barriers are required because the locking
 	primitives are only guaranteed to confine the critical
@@ -1068,7 +1068,7 @@ such CPUs.
 	This work is left as an exercise for the reader.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:defer:rcu:read_lock_unlock:lock]
+\begin{fcvref}[ln:defer:rcu:read_lock_unlock:lock]
 This implementation suffers from some serious shortcomings in
 addition to the high update-side overhead noted earlier.
 First, it is no longer permissible to nest RCU read-side critical
@@ -1082,10 +1082,10 @@ will ignore the subsequent RCU read-side critical section.
 Third and finally, this implementation requires that the enclosing software
 environment be able to enumerate threads and maintain per-thread
 variables.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:defer:rcu:read_lock_unlock:lock]
+	\begin{fcvref}[ln:defer:rcu:read_lock_unlock:lock]
 	Is the possibility of readers being preempted in
 	\clnrefrange{gp1}{gp2} of
 	\cref{lst:app:toyrcu:Free-Running Counter Using RCU}
@@ -1094,7 +1094,7 @@ variables.
 	If not, why not?
 	If so, what is the sequence of events, and how can the
 	failure be addressed?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	It is a real problem, there is a sequence of events leading to
 	failure, and there are a number of possible ways of
@@ -1149,7 +1149,7 @@ by most applications.
 \label{lst:app:toyrcu:Nestable RCU Using a Free-Running Counter}
 \end{listing}
 
-\begin{lineref}[ln:defer:rcu_nest:read_lock_unlock:lock]
+\begin{fcvref}[ln:defer:rcu_nest:read_lock_unlock:lock]
 The resulting \co{rcu_read_lock()} implementation is still reasonably
 straightforward.
 \Clnref{readgp} places a pointer to
@@ -1170,7 +1170,7 @@ instance of \co{rcu_reader_gp}, and,
 finally, \clnref{mb1} executes a memory barrier
 to prevent the RCU read-side critical section from bleeding out
 into the code preceding the call to \co{rcu_read_lock()}.
-\end{lineref}
+\end{fcvref}
 
 In other words, this implementation of \co{rcu_read_lock()} picks up a copy
 of the global \co{rcu_gp_ctr} unless the current invocation of
@@ -1181,7 +1181,7 @@ Either way, it increments whatever value it fetched in order to record
 an additional nesting level, and stores the result in the current
 thread's instance of \co{rcu_reader_gp}.
 
-\begin{lineref}[ln:defer:rcu_nest:read_lock_unlock:unlock]
+\begin{fcvref}[ln:defer:rcu_nest:read_lock_unlock:unlock]
 Interestingly enough, despite their \co{rcu_read_lock()} differences,
 the implementation of \co{rcu_read_unlock()}
 is broadly similar to that shown in
@@ -1195,9 +1195,9 @@ which has the effect of decrementing the nesting count contained in
 \co{rcu_reader_gp}'s low-order bits.
 Debugging versions of this primitive would check (before decrementing!)
 that these low-order bits were non-zero.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:defer:rcu_nest:synchronize:syn]
+\begin{fcvref}[ln:defer:rcu_nest:synchronize:syn]
 The implementation of \co{synchronize_rcu()} is quite similar to
 that shown in
 \cref{sec:app:toyrcu:RCU Based on Free-Running Counter}.
@@ -1209,7 +1209,7 @@ and the second is that the comparison on \clnref{ongoing}
 has been abstracted out to a separate function,
 where it checks the bit indicated by \co{RCU_GP_CTR_BOTTOM_BIT}
 instead of unconditionally checking the low-order bit.
-\end{lineref}
+\end{fcvref}
 
 This approach achieves read-side performance almost equal to that
 shown in
@@ -1250,12 +1250,12 @@ overhead.
 	how could you double the time required to overflow the global
 	\co{rcu_gp_ctr}?
 \QuickQuizAnswer{
-	\begin{lineref}[ln:defer:rcu_nest:synchronize:syn]
+	\begin{fcvref}[ln:defer:rcu_nest:synchronize:syn]
 	One way would be to replace the magnitude comparison on
 	\clnref{lt1,lt2} with an inequality check of
 	the per-thread \co{rcu_reader_gp} variable against
 	\co{rcu_gp_ctr+RCU_GP_CTR_BOTTOM_BIT}.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 \QuickQuiz{}
@@ -1350,7 +1350,7 @@ overhead.
 \section{RCU Based on Quiescent States}
 \label{sec:app:toyrcu:RCU Based on Quiescent States}
 
-\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock]
+\begin{fcvref}[ln:defer:rcu_qs:read_lock_unlock]
 \Cref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
 (\path{rcu_qs.h})
 shows the read-side primitives used to construct a user-level
@@ -1385,7 +1385,7 @@ In addition, \co{rcu_quiescent_state()} can be thought of as a
 	performance optimizations.}
 It is illegal to invoke \co{rcu_quiescent_state()}, \co{rcu_thread_offline()},
 or \co{rcu_thread_online()} from an RCU read-side critical section.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/rcu_qs@define.fcv}
@@ -1399,7 +1399,7 @@ or \co{rcu_thread_online()} from an RCU read-side critical section.
 \label{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
 \end{listing}
 
-\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock:qs]
+\begin{fcvref}[ln:defer:rcu_qs:read_lock_unlock:qs]
 In \co{rcu_quiescent_state()}, \clnref{mb1} executes a memory barrier
 to prevent any code prior to the quiescent state (including possible
 RCU read-side critical sections) from being reordered
@@ -1418,16 +1418,16 @@ RCU read-side critical sections will thus know to ignore this new one.
 Finally, \clnref{mb2} executes a memory barrier, which prevents subsequent
 code (including a possible RCU read-side critical section) from being
 re-ordered with the \clnrefrange{gp1}{gp2}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock:qs]
+	\begin{fcvref}[ln:defer:rcu_qs:read_lock_unlock:qs]
 	Doesn't the additional memory barrier shown on \clnref{mb2} of
 	\cref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
 	greatly increase the overhead of \co{rcu_quiescent_state}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock:qs]
+	\begin{fcvref}[ln:defer:rcu_qs:read_lock_unlock:qs]
 	Indeed it does!
 	An application using this implementation of RCU should therefore
 	invoke \co{rcu_quiescent_state} sparingly, instead using
@@ -1439,7 +1439,7 @@ re-ordered with the \clnrefrange{gp1}{gp2}.
 	\clnrefrange{gp1}{gp2} before any
 	subsequent RCU read-side critical sections executed by the
 	caller.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 Some applications might use RCU only occasionally, but use it very heavily
@@ -1459,13 +1459,13 @@ Any concurrent instances of \co{synchronize_rcu()} will thus know to
 ignore this thread.
 
 \QuickQuiz{}
-	\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock:qs]
+	\begin{fcvref}[ln:defer:rcu_qs:read_lock_unlock:qs]
 	Why are the two memory barriers on \clnref{mb1,mb2} of
 	\cref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
 	needed?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock:qs]
+	\begin{fcvref}[ln:defer:rcu_qs:read_lock_unlock:qs]
 	The memory barrier on \clnref{mb1} prevents any RCU read-side
 	critical sections that might precede the
 	call to \co{rcu_thread_offline()} won't be reordered by either
@@ -1474,7 +1474,7 @@ ignore this thread.
 	The memory barrier on \clnref{mb2} is, strictly speaking, unnecessary,
 	as it is illegal to have any RCU read-side critical sections
 	following the call to \co{rcu_thread_offline()}.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 The \co{rcu_thread_online()} function simply invokes
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index cc5b2648..b5449c91 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -993,7 +993,7 @@ is owned by CPU~0 (MESI ``exclusive'' or ``modified'' state).
 Then suppose that CPU~0 executes \co{foo()} while CPU~1 executes
 function \co{bar()} in the following code fragment:
 
-\begin{linelabel}[ln:app:whymb:Breaking mb]
+\begin{fcvlabel}[ln:app:whymb:Breaking mb]
 \begin{VerbatimN}[fontsize=\footnotesize,samepage=true,commandchars=\\\[\]]
 void foo(void)
 {
@@ -1008,10 +1008,10 @@ void bar(void)
 	assert(a == 1);
 }
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
 Then the sequence of operations might be as follows:
-\begin{lineref}[ln:app:whymb:Breaking mb]
+\begin{fcvref}[ln:app:whymb:Breaking mb]
 \begin{enumerate}
 \item	CPU~0 executes \co{a = 1}.  The corresponding
 	cache line is read-only in
@@ -1045,7 +1045,7 @@ Then the sequence of operations might be as follows:
 	``invalidate'' message, and (tardily)
 	invalidates the cache line containing ``a'' from its own cache.
 \end{enumerate}
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	In step~1 of the first scenario in
@@ -1071,7 +1071,7 @@ and forces any subsequent load to wait until all marked entries
 have been applied to the CPU's cache.
 Therefore, we can add a memory barrier to function \co{bar} as follows:
 
-\begin{linelabel}[ln:app:whymb:Add mb]
+\begin{fcvlabel}[ln:app:whymb:Add mb]
 \begin{VerbatimN}[fontsize=\footnotesize,samepage=true,commandchars=\\\[\]]
 void foo(void)
 {
@@ -1087,7 +1087,7 @@ void bar(void)
 	assert(a == 1);
 }
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
 \QuickQuiz{}
 	Say what???
@@ -1134,7 +1134,7 @@ void bar(void)
 %
 } \QuickQuizEnd
 
-\begin{lineref}[ln:app:whymb:Add mb]
+\begin{fcvref}[ln:app:whymb:Add mb]
 With this change, the sequence of operations might be as follows:
 \begin{enumerate}
 \item	CPU~0 executes \co{a = 1}.  The corresponding
@@ -1175,7 +1175,7 @@ With this change, the sequence of operations might be as follows:
 \item	CPU~1 receives this cache line, which contains a value of 1 for
 	``a'', so that the assertion does not trigger.
 \end{enumerate}
-\end{lineref}
+\end{fcvref}
 
 With much passing of MESI messages, the CPUs arrive at the correct answer.
 This section illustrates why CPU designers must be extremely careful
diff --git a/count/count.tex b/count/count.tex
index 032f3a3c..00c4aacf 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -164,11 +164,11 @@ are more appropriate for advanced students.
 Let's start with something simple, for example, the straightforward
 use of arithmetic shown in
 Listing~\ref{lst:count:Just Count!} (\path{count_nonatomic.c}).
-\begin{lineref}[ln:count:count_nonatomic:inc-read]
+\begin{fcvref}[ln:count:count_nonatomic:inc-read]
 Here, we have a counter on line~\lnref{counter}, we increment it on
 line~\lnref{inc}, and we read out its value on line~\lnref{read}.
 What could be simpler?
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/count/count_nonatomic@inc-read.fcv}
@@ -253,11 +253,11 @@ accuracies far greater than 50\,\% are almost always necessary.
 The straightforward way to count accurately is to use atomic operations,
 as shown in
 Listing~\ref{lst:count:Just Count Atomically!} (\path{count_atomic.c}).
-\begin{lineref}[ln:count:count_atomic:inc-read]
+\begin{fcvref}[ln:count:count_atomic:inc-read]
 Line~\lnref{counter} defines an atomic variable,
 line~\lnref{inc} atomically increments it, and
 line~\lnref{read} reads it out.
-\end{lineref}
+\end{fcvref}
 Because this is atomic, it keeps perfect count.
 However, it is slower: on a Intel Core Duo laptop, it is about
 six times slower than non-atomic increment
@@ -486,7 +486,7 @@ thread (presumably cache aligned and padded to avoid false sharing).
 Such an array can be wrapped into per-thread primitives, as shown in
 Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
 (\path{count_stat.c}).
-\begin{lineref}[ln:count:count_stat:inc-read]
+\begin{fcvref}[ln:count:count_stat:inc-read]
 Line~\lnref{define} defines an array containing a set of per-thread counters of
 type \co{unsigned long} named, creatively enough, \co{counter}.
 
@@ -597,7 +597,7 @@ be simply wonderful to sum them once and use the resulting value twice.
 This sort of optimization might be rather frustrating to people expecting
 later \co{read_count()} calls to return larger values.
 The use of \co{READ_ONCE()} prevents this optimization and others besides.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	How does the per-thread \co{counter} variable in
@@ -791,7 +791,7 @@ eventually consistent.
 \label{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 \end{listing}
 
-\begin{lineref}[ln:count:count_stat_eventual:whole]
+\begin{fcvref}[ln:count:count_stat_eventual:whole]
 The implementation is shown in
 Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 (\path{count_stat_eventual.c}).
@@ -824,7 +824,7 @@ This approach gives extremely fast counter read-out while still
 supporting linear counter-update performance.
 However, this excellent read-side performance and update-side scalability
 comes at the cost of the additional thread running \co{eventual()}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why doesn't \co{inc_count()} in
@@ -945,14 +945,14 @@ increment.
 \label{lst:count:Per-Thread Statistical Counters}
 \end{listing}
 
-\begin{lineref}[ln:count:count_end:whole]
+\begin{fcvref}[ln:count:count_end:whole]
 \Clnrefrange{var:b}{var:e} define needed variables:
 \co{counter} is the per-thread counter
 variable, the \co{counterp[]} array allows threads to access each others'
 counters, \co{finalcount} accumulates the total as individual threads exit,
 and \co{final_mutex} coordinates between threads accumulating the total
 value of the counter and exiting threads.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why do we need an explicit array to find the other threads'
@@ -997,12 +997,12 @@ value of the counter and exiting threads.
 	that it will someday appear.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_end:whole:inc]
+\begin{fcvref}[ln:count:count_end:whole:inc]
 The \co{inc_count()} function used by updaters is quite simple, as can
 be seen on \clnrefrange{b}{e}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:count:count_end:whole:read]
+\begin{fcvref}[ln:count:count_end:whole:read]
 The \co{read_count()} function used by readers is a bit more complex.
 Line~\lnref{acquire} acquires a lock to exclude exiting threads, and
 line~\lnref{release} releases it.
@@ -1011,17 +1011,17 @@ have already exited, and
 \clnrefrange{loop:b}{loop:e} sum the counts being accumulated
 by threads currently running.
 Finally, line~\lnref{return} returns the sum.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:count:count_end:whole:read]
+	\begin{fcvref}[ln:count:count_end:whole:read]
 	Doesn't the check for \co{NULL} on line~\lnref{check} of
 	Listing~\ref{lst:count:Per-Thread Statistical Counters}
 	add extra branch mispredictions?
 	Why not have a variable set permanently to zero, and point
 	unused counter-pointers to that variable rather than setting
 	them to \co{NULL}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	This is a reasonable strategy.
 	Checking for the performance difference is left as an exercise
@@ -1056,13 +1056,13 @@ Finally, line~\lnref{return} returns the sum.
 	\co{inc_count()} fastpath.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_end:whole:reg]
+\begin{fcvref}[ln:count:count_end:whole:reg]
 \Clnrefrange{b}{e} show the \co{count_register_thread()}
 function, which
 must be called by each thread before its first use of this counter.
 This function simply sets up this thread's element of the \co{counterp[]}
 array to point to its per-thread \co{counter} variable.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why on earth do we need to acquire the lock in
@@ -1080,7 +1080,7 @@ array to point to its per-thread \co{counter} variable.
 	a hundred or so CPUs, there is no need to get fancy.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_end:whole:unreg]
+\begin{fcvref}[ln:count:count_end:whole:unreg]
 \Clnrefrange{b}{e} show the \co{count_unregister_thread()}
 function, which
 must be called prior to exit by each thread that previously called
@@ -1096,7 +1096,7 @@ A subsequent call to \co{read_count()} will see the exiting thread's
 count in the global \co{finalcount}, and will skip the exiting thread
 when sequencing through the \co{counterp[]} array, thus obtaining
 the correct total.
-\end{lineref}
+\end{fcvref}
 
 This approach gives updaters almost exactly the same performance as
 a non-atomic add, and also scales linearly.
@@ -1316,7 +1316,7 @@ Section~\ref{sec:SMPdesign:Parallel Fastpath}.
 \subsection{Simple Limit Counter Implementation}
 \label{sec:count:Simple Limit Counter Implementation}
 
-\begin{lineref}[ln:count:count_lim:variable]
+\begin{fcvref}[ln:count:count_lim:variable]
 Listing~\ref{lst:count:Simple Limit Counter Variables}
 shows both the per-thread and global variables used by this
 implementation.
@@ -1332,7 +1332,7 @@ the aggregate value of the overall counter.
 The \co{globalreserve} variable on
 line~\lnref{globalreserve} is the sum of all of the
 per-thread \co{countermax} variables.
-\end{lineref}
+\end{fcvref}
 The relationship among these variables is shown by
 Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}:
 \begin{enumerate}
@@ -1386,7 +1386,7 @@ functions (\path{count_lim.c}).
 	\co{inc_count()} and \co{dec_count()}.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim:add_sub_read:add]
+\begin{fcvref}[ln:count:count_lim:add_sub_read:add]
 \Clnrefrange{b}{e} show \co{add_count()},
 which adds the specified value \co{delta}
 to the counter.
@@ -1396,7 +1396,7 @@ Line~\lnref{checklocal} checks to see if there is room for
 line~\lnref{add} adds it and line~\lnref{return:ls} returns success.
 This is the \co{add_counter()} fastpath, and it does no atomic operations,
 references only per-thread variables, and should not incur any cache misses.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \begin{VerbatimL}[firstnumber=3]
@@ -1433,7 +1433,7 @@ references only per-thread variables, and should not incur any cache misses.
 	than parallel algorithms!
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim:add_sub_read:add]
+\begin{fcvref}[ln:count:count_lim:add_sub_read:add]
 If the test on
 line~\lnref{checklocal} fails, we must access global variables, and thus
 must acquire \co{gblcnt_mutex} on
@@ -1464,7 +1464,7 @@ will usually set this thread's \co{countermax} to re-enable the fastpath.
 Line~\lnref{release:s} then releases
 \co{gblcnt_mutex} (again, as noted earlier), and, finally,
 line~\lnref{return:gs} returns indicating success.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why does \co{globalize_count()} zero the per-thread variables,
@@ -1479,7 +1479,7 @@ line~\lnref{return:gs} returns indicating success.
 	overflow!
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim:add_sub_read:sub]
+\begin{fcvref}[ln:count:count_lim:add_sub_read:sub]
 \Clnrefrange{b}{e} show \co{sub_count()},
 which subtracts the specified
 \co{delta} from the counter.
@@ -1502,7 +1502,7 @@ as needed.
 Line~\lnref{checkglb} checks to see if the counter can accommodate subtracting
 \co{delta}, and, if not, line~\lnref{release:f} releases \co{gblcnt_mutex}
 (as noted earlier) and line~\lnref{return:gf} returns failure.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Given that \co{globalreserve} counted against us in \co{add_count()},
@@ -1535,7 +1535,7 @@ Line~\lnref{checkglb} checks to see if the counter can accommodate subtracting
 	will likely be preferable.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim:add_sub_read:sub]
+\begin{fcvref}[ln:count:count_lim:add_sub_read:sub]
 If, on the other hand, line~\lnref{checkglb} finds that the counter \emph{can}
 accommodate subtracting \co{delta}, we complete the slowpath.
 Line~\lnref{subglb} does the subtraction and then
@@ -1545,7 +1545,7 @@ in order to update both global and per-thread variables
 (hopefully re-enabling the fastpath).
 Then line~\lnref{release:s} releases \co{gblcnt_mutex}, and
 line~\lnref{return:gs} returns success.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why have both \co{add_count()} and \co{sub_count()} in
@@ -1560,7 +1560,7 @@ line~\lnref{return:gs} returns success.
 	of structures in use!
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim:add_sub_read:read]
+\begin{fcvref}[ln:count:count_lim:add_sub_read:read]
 \Clnrefrange{b}{e} show \co{read_count()},
 which returns the aggregate value
 of the counter.
@@ -1573,7 +1573,7 @@ Line~\lnref{initsum} initializes local variable \co{sum} to the value of
 \clnrefrange{loop:b}{loop:e} sums the
 per-thread \co{counter} variables.
 Line~\lnref{return} then returns the sum.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/count/count_lim@utility.fcv}
@@ -1586,7 +1586,7 @@ shows a number of utility functions used by the \co{add_count()},
 \co{sub_count()}, and \co{read_count()} primitives shown in
 \cref{lst:count:Simple Limit Counter Add; Subtract; and Read}.
 
-\begin{lineref}[ln:count:count_lim:utility:globalize]
+\begin{fcvref}[ln:count:count_lim:utility:globalize]
 \Clnrefrange{b}{e} show \co{globalize_count()},
 which zeros the current thread's
 per-thread counters, adjusting the global variables appropriately.
@@ -1600,9 +1600,9 @@ Similarly, line~\lnref{sub} subtracts the per-thread \co{countermax} from
 It is helpful to refer to
 Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}
 when reading both this function and \co{balance_count()}, which is next.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:count:count_lim:utility:balance]
+\begin{fcvref}[ln:count:count_lim:utility:balance]
 \Clnrefrange{b}{e} show \co{balance_count()},
 which is roughly speaking
 the inverse of \co{globalize_count()}.
@@ -1633,16 +1633,16 @@ accordingly.
 Finally, in either case,
 line~\lnref{adjglobal} makes the corresponding adjustment to
 \co{globalcount}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:count:count_lim:utility:balance]
+	\begin{fcvref}[ln:count:count_lim:utility:balance]
 	Why set \co{counter} to \co{countermax / 2} in \clnref{middle} of
 	Listing~\ref{lst:count:Simple Limit Counter Utility Functions}?
 	Wouldn't it be simpler to just take \co{countermax} counts?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:count:count_lim:utility:balance]
+	\begin{fcvref}[ln:count:count_lim:utility:balance]
 	First, it really is reserving \co{countermax} counts
 	(see \clnref{adjreserve}), however,
 	it adjusts so that only half of these are actually in use
@@ -1653,7 +1653,7 @@ line~\lnref{adjglobal} makes the corresponding adjustment to
 
 	Note that the accounting in \co{globalcount} remains accurate,
 	thanks to the adjustment in \clnref{adjglobal}.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 \begin{figure*}[tb]
@@ -1725,7 +1725,7 @@ thread~0 can once again increment the counter locally.
 	what it does.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim:utility:register]
+\begin{fcvref}[ln:count:count_lim:utility:register]
 \Clnrefrange{b}{e} show \co{count_register_thread()},
 which sets up state for
 newly created threads.
@@ -1733,9 +1733,9 @@ This function simply installs
 a pointer to the newly created thread's \co{counter} variable into
 the corresponding entry of the \co{counterp[]} array under the protection
 of \co{gblcnt_mutex}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:count:count_lim:utility:unregister]
+\begin{fcvref}[ln:count:count_lim:utility:unregister]
 Finally, \clnrefrange{b}{e} show \co{count_unregister_thread()},
 which tears down
 state for a soon-to-be-exiting thread.
@@ -1745,7 +1745,7 @@ Line~\lnref{globalize} invokes \co{globalize_count()}
 to clear out this thread's
 counter state, and line~\lnref{clear} clears this thread's entry in the
 \co{counterp[]} array.
-\end{lineref}
+\end{fcvref}
 
 \subsection{Simple Limit Counter Discussion}
 \label{sec:count:Simple Limit Counter Discussion}
@@ -1793,7 +1793,7 @@ permissible value of the per-thread \co{countermax} variable.
 \label{lst:count:Approximate Limit Counter Balancing}
 \end{listing}
 
-\begin{lineref}[ln:count:count_lim_app:balance]
+\begin{fcvref}[ln:count:count_lim_app:balance]
 Similarly,
 Listing~\ref{lst:count:Approximate Limit Counter Balancing}
 is identical to the \co{balance_count()} function in
@@ -1801,7 +1801,7 @@ Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
 with the addition of
 lines~\lnref{enforce:b} and~\lnref{enforce:e}, which enforce the
 \co{MAX_COUNTERMAX} limit on the per-thread \co{countermax} variable.
-\end{lineref}
+\end{fcvref}
 
 \subsection{Approximate Limit Counter Discussion}
 
@@ -1885,7 +1885,7 @@ represent \co{counter} and the low-order 16 bits to represent
 \label{lst:count:Atomic Limit Counter Variables and Access Functions}
 \end{listing}
 
-\begin{lineref}[ln:count:count_lim_atomic:var_access:var]
+\begin{fcvref}[ln:count:count_lim_atomic:var_access:var]
 The variables and access functions for a simple atomic limit counter
 are shown in
 Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}
@@ -1905,7 +1905,7 @@ Line~\lnref{CM_BITS} defines \co{CM_BITS}, which gives the number of bits in eac
 of \co{counterandmax}, and line~\lnref{MAX_CMAX} defines \co{MAX_COUNTERMAX}, which
 gives the maximum value that may be held in either half of
 \co{counterandmax}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	In what way does
@@ -1922,7 +1922,7 @@ gives the maximum value that may be held in either half of
 	standard?  What drawbacks would it have?)
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim_atomic:var_access:split_int]
+\begin{fcvref}[ln:count:count_lim_atomic:var_access:split_int]
 \Clnrefrange{b}{e} show the \co{split_counterandmax_int()}
 function, which,
 when given the underlying \co{int} from the
@@ -1933,15 +1933,15 @@ Line~\lnref{msh} isolates the most-significant half of this \co{int},
 placing the result as specified by argument \co{c},
 and line~\lnref{lsh} isolates the least-significant half of this \co{int},
 placing the result as specified by argument \co{cm}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:count:count_lim_atomic:var_access:split]
+\begin{fcvref}[ln:count:count_lim_atomic:var_access:split]
 \Clnrefrange{b}{e} show the \co{split_counterandmax()} function, which
 picks up the underlying \co{int} from the specified variable
 on line~\lnref{int}, stores it as specified by the \co{old} argument on
 line~\lnref{old}, and then invokes \co{split_counterandmax_int()} to split
 it on line~\lnref{split_int}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Given that there is only one \co{counterandmax} variable,
@@ -1954,13 +1954,13 @@ it on line~\lnref{split_int}.
 	\co{counterandmax} variables to \co{split_counterandmax()}.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim_atomic:var_access:merge]
+\begin{fcvref}[ln:count:count_lim_atomic:var_access:merge]
 \Clnrefrange{b}{e} show the \co{merge_counterandmax()} function, which
 can be thought of as the inverse of \co{split_counterandmax()}.
 Line~\lnref{merge} merges the \co{counter} and \co{countermax}
 values passed in \co{c} and \co{cm}, respectively, and returns
 the result.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why does \co{merge_counterandmax()} in
@@ -1981,7 +1981,7 @@ the result.
 Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
 shows the \co{add_count()} and \co{sub_count()} functions.
 
-\begin{lineref}[ln:count:count_lim_atomic:add_sub:add]
+\begin{fcvref}[ln:count:count_lim_atomic:add_sub:add]
 \Clnrefrange{b}{e} show \co{add_count()}, whose fastpath spans
 \clnrefrange{fast:b}{return:fs},
 with the remainder of the function being the slowpath.
@@ -2004,7 +2004,7 @@ compares this thread's \co{counterandmax} variable to \co{old},
 updating its value to \co{new} if the comparison succeeds.
 If the comparison succeeds, line~\lnref{return:fs} returns success, otherwise,
 execution continues in the loop at line~\lnref{fast:b}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Yecch!
@@ -2026,26 +2026,26 @@ execution continues in the loop at line~\lnref{fast:b}.
 } \QuickQuizEnd
 
 \QuickQuiz{}
-        \begin{lineref}[ln:count:count_lim_atomic:add_sub:add]
+        \begin{fcvref}[ln:count:count_lim_atomic:add_sub:add]
 	Why would the \co{atomic_cmpxchg()} primitive at
         \clnrefrange{atmcmpex}{loop:e} of
 	Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
 	ever fail?
 	After all, we picked up its old value on line~\lnref{split} and have not
 	changed it!
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:count:count_lim_atomic:add_sub:add]
+	\begin{fcvref}[ln:count:count_lim_atomic:add_sub:add]
 	Later, we will see how the \co{flush_local_count()} function in
 	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1}
 	might update this thread's \co{counterandmax} variable concurrently
 	with the execution of the fastpath on
         \clnrefrange{fast:b}{loop:e} of
 	Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim_atomic:add_sub:add]
+\begin{fcvref}[ln:count:count_lim_atomic:add_sub:add]
 \Clnrefrange{slow:b}{return:ss} of
 Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
 show \co{add_count()}'s slowpath, which is protected by \co{gblcnt_mutex},
@@ -2071,9 +2071,9 @@ spreads counts to the local state if appropriate, line~\lnref{release:s} release
 \co{gblcnt_mutex} (again, as noted earlier), and finally,
 line~\lnref{return:ss}
 returns success.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:count:count_lim_atomic:add_sub:sub]
+\begin{fcvref}[ln:count:count_lim_atomic:add_sub:sub]
 \Clnrefrange{b}{e} of
 Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
 show \co{sub_count()}, which is structured similarly to
@@ -2082,7 +2082,7 @@ show \co{sub_count()}, which is structured similarly to
 \clnrefrange{slow:b}{slow:e}.
 A line-by-line analysis of this function is left as an exercise to
 the reader.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/count/count_lim_atomic@read.fcv}
@@ -2090,7 +2090,7 @@ the reader.
 \label{lst:count:Atomic Limit Counter Read}
 \end{listing}
 
-\begin{lineref}[ln:count:count_lim_atomic:read]
+\begin{fcvref}[ln:count:count_lim_atomic:read]
 Listing~\ref{lst:count:Atomic Limit Counter Read} shows \co{read_count()}.
 Line~\lnref{acquire} acquires \co{gblcnt_mutex} and
 line~\lnref{release} releases it.
@@ -2100,7 +2100,7 @@ Line~\lnref{initsum} initializes local variable \co{sum} to the value of
 per-thread counters to this sum, isolating each per-thread counter
 using \co{split_counterandmax} on line~\lnref{split}.
 Finally, line~\lnref{return} returns the sum.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/count/count_lim_atomic@utility1.fcv}
@@ -2122,16 +2122,16 @@ show the utility functions
 \co{balance_count()},
 \co{count_register_thread()}, and
 \co{count_unregister_thread()}.
-\begin{lineref}[ln:count:count_lim_atomic:utility1:globalize]
+\begin{fcvref}[ln:count:count_lim_atomic:utility1:globalize]
 The code for \co{globalize_count()} is shown on
 \clnrefrange{b}{e},
 of \cref{lst:count:Atomic Limit Counter Utility Functions 1} and
 is similar to that of previous algorithms, with the addition of
 line~\lnref{split}, which is now required to split out \co{counter} and
 \co{countermax} from \co{counterandmax}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:count:count_lim_atomic:utility1:flush]
+\begin{fcvref}[ln:count:count_lim_atomic:utility1:flush]
 The code for \co{flush_local_count()}, which moves all threads' local
 counter state to the global counter, is shown on
 \clnrefrange{b}{e}.
@@ -2152,7 +2152,7 @@ Line~\lnref{split} splits this state into its \co{counter}
 and \co{countermax} (in local variable \co{cm}) components.
 Line~\lnref{glbcnt} adds this thread's \co{counter} to \co{globalcount}, while
 line~\lnref{glbrsv} subtracts this thread's \co{countermax} from \co{globalreserve}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	What stops a thread from simply refilling its
@@ -2202,7 +2202,7 @@ line~\lnref{glbrsv} subtracts this thread's \co{countermax} from \co{globalreser
 	Either way, the race is resolved correctly.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim_atomic:utility2]
+\begin{fcvref}[ln:count:count_lim_atomic:utility2]
 \Clnrefrange{balance:b}{balance:e} on
 Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 2}
 show the code for \co{balance_count()}, which refills
@@ -2213,7 +2213,7 @@ Detailed analysis of the code is left as an exercise for the reader,
 as it is with the \co{count_register_thread()} function starting on
 line~\lnref{register:b} and the \co{count_unregister_thread()} function starting on
 line~\lnref{unregister:b}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Given that the \co{atomic_set()} primitive does a simple
@@ -2355,7 +2355,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
 \subsection{Signal-Theft Limit Counter Implementation}
 \label{sec:count:Signal-Theft Limit Counter Implementation}
 
-\begin{lineref}[ln:count:count_lim_sig:data]
+\begin{fcvref}[ln:count:count_lim_sig:data]
 Listing~\ref{lst:count:Signal-Theft Limit Counter Data}
 (\path{count_lim_sig.c})
 shows the data structures used by the signal-theft based counter
@@ -2368,7 +2368,7 @@ with the addition of
 lines~\lnref{maxp} and~\lnref{theftp} to allow remote access to a
 thread's \co{countermax}
 and \co{theft} variables, respectively.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/count/count_lim_sig@data.fcv}
@@ -2376,15 +2376,15 @@ and \co{theft} variables, respectively.
 \label{lst:count:Signal-Theft Limit Counter Data}
 \end{listing}
 
-\begin{lineref}[ln:count:count_lim_sig:migration:globalize]
+\begin{fcvref}[ln:count:count_lim_sig:migration:globalize]
 Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
 shows the functions responsible for migrating counts between per-thread
 variables and the global variables.
 \Clnrefrange{b}{e} show \co{globalize_count()},
 which is identical to earlier
 implementations.
-\end{lineref}
-\begin{lineref}[ln:count:count_lim_sig:migration:flush_sig]
+\end{fcvref}
+\begin{fcvref}[ln:count:count_lim_sig:migration:flush_sig]
 \Clnrefrange{b}{e} show \co{flush_local_count_sig()},
 which is the signal
 handler used in the theft process.
@@ -2397,7 +2397,7 @@ Line~\lnref{set:ACK} sets the \co{theft} state to ACK, and, if
 line~\lnref{check:fast} sees that
 this thread's fastpaths are not running, line~\lnref{set:READY} sets the \co{theft}
 state to READY.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/count/count_lim_sig@migration.fcv}
@@ -2412,12 +2412,12 @@ state to READY.
 	the uses of the
 	\co{theft} per-thread variable?
 \QuickQuizAnswer{
-	\begin{lineref}[ln:count:count_lim_sig:migration:flush_sig]
+	\begin{fcvref}[ln:count:count_lim_sig:migration:flush_sig]
 	The first one (on line~\lnref{check:REQ}) can be argued to be unnecessary.
 	The last two (lines~\lnref{set:ACK} and~\lnref{set:READY}) are important.
 	If these are removed, the compiler would be within its rights
 	to rewrite \clnrefrange{set:ACK}{set:READY} as follows:
-	\end{lineref}
+	\end{fcvref}
 
 \begin{VerbatimN}[firstnumber=14]
 theft = THEFT_READY;
@@ -2431,7 +2431,7 @@ if (counting) {
 	corresponding thread was ready.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim_sig:migration:flush]
+\begin{fcvref}[ln:count:count_lim_sig:migration:flush]
 \Clnrefrange{b}{e} show \co{flush_local_count()}, which is called from the
 slowpath to flush all threads' local counts.
 The loop spanning
@@ -2443,7 +2443,7 @@ count, and, if not, line~\lnref{READY} sets the thread's \co{theft} state to REA
 and line~\lnref{next} skips to the next thread.
 Otherwise, line~\lnref{REQ} sets the thread's \co{theft} state to REQ and
 line~\lnref{signal} sends the thread a signal.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
@@ -2486,7 +2486,7 @@ line~\lnref{signal} sends the thread a signal.
 	handler and the code interrupted by the signal.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim_sig:migration:flush]
+\begin{fcvref}[ln:count:count_lim_sig:migration:flush]
 The loop spanning \clnrefrange{loop2:b}{loop2:e} waits until each
 thread reaches READY state,
 then steals that thread's count.
@@ -2500,7 +2500,7 @@ line~\lnref{signal2} resends the signal.
 Execution reaches line~\lnref{thiev:b} when the thread's \co{theft} state becomes
 READY, so \clnrefrange{thiev:b}{thiev:e} do the thieving.
 Line~\lnref{IDLE} then sets the thread's \co{theft} state back to IDLE.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
@@ -2517,10 +2517,10 @@ Line~\lnref{IDLE} then sets the thread's \co{theft} state back to IDLE.
 	\emph{Your} user application hanging!
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_lim_sig:migration:balance]
+\begin{fcvref}[ln:count:count_lim_sig:migration:balance]
 \Clnrefrange{b}{e} show \co{balance_count()}, which is similar to that of
 earlier examples.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/count/count_lim_sig@add.fcv}
@@ -2534,7 +2534,7 @@ earlier examples.
 \label{lst:count:Signal-Theft Limit Counter Subtract Function}
 \end{listing}
 
-\begin{lineref}[ln:count:count_lim_sig:add]
+\begin{fcvref}[ln:count:count_lim_sig:add]
 Listing~\ref{lst:count:Signal-Theft Limit Counter Add Function}
 shows the \co{add_count()} function.
 The fastpath spans \clnrefrange{fast:b}{return:fs}, and the slowpath
@@ -2564,7 +2564,7 @@ READY also sees the effects of line~\lnref{add:f}.
 If the fastpath addition at line~\lnref{add:f} was executed, then
 line~\lnref{return:fs} returns
 success.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/count/count_lim_sig@read.fcv}
@@ -2572,11 +2572,11 @@ success.
 \label{lst:count:Signal-Theft Limit Counter Read Function}
 \end{listing}
 
-\begin{lineref}[ln:count:count_lim_sig:add]
+\begin{fcvref}[ln:count:count_lim_sig:add]
 Otherwise, we fall through to the slowpath starting at line~\lnref{acquire}.
 The structure of the slowpath is similar to those of earlier examples,
 so its analysis is left as an exercise to the reader.
-\end{lineref}
+\end{fcvref}
 Similarly, the structure of \co{sub_count()} on
 Listing~\ref{lst:count:Signal-Theft Limit Counter Subtract Function}
 is the same
@@ -2591,7 +2591,7 @@ Listing~\ref{lst:count:Signal-Theft Limit Counter Read Function}.
 \label{lst:count:Signal-Theft Limit Counter Initialization Functions}
 \end{listing}
 
-\begin{lineref}[ln:count:count_lim_sig:initialization:init]
+\begin{fcvref}[ln:count:count_lim_sig:initialization:init]
 \Clnrefrange{b}{e} of
 Listing~\ref{lst:count:Signal-Theft Limit Counter Initialization Functions}
 show \co{count_init()}, which set up \co{flush_local_count_sig()}
@@ -2601,7 +2601,7 @@ to invoke \co{flush_local_count_sig()}.
 The code for thread registry and unregistry is similar to that of
 earlier examples, so its analysis is left as an exercise for the
 reader.
-\end{lineref}
+\end{fcvref}
 
 \subsection{Signal-Theft Limit Counter Discussion}
 
@@ -2693,7 +2693,7 @@ when updating the counter, and to write-acquire that same reader-writer
 lock when checking the counter.
 Code for doing I/O might be as follows:
 
-\begin{linelabel}[ln:count:inline:I/O]
+\begin{fcvlabel}[ln:count:inline:I/O]
 \begin{VerbatimN}[commandchars=\\\[\]]
 read_lock(&mylock);		\lnlbl[acq]
 if (removing) {			\lnlbl[check]
@@ -2706,9 +2706,9 @@ if (removing) {			\lnlbl[check]
 	sub_count(1);		\lnlbl[dec]
 }
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
-\begin{lineref}[ln:count:inline:I/O]
+\begin{fcvref}[ln:count:inline:I/O]
 Line~\lnref{acq} read-acquires the lock, and either
 line~\lnref{rel1} or~\lnref{rel2} releases it.
 Line~\lnref{check} checks to see if the device is being removed, and, if so,
@@ -2719,7 +2719,7 @@ Otherwise, line~\lnref{inc} increments the access count,
 line~\lnref{rel2} releases the
 lock, line~\lnref{do} performs the I/O, and
 line~\lnref{dec} decrements the access count.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	This is ridiculous!
@@ -2734,7 +2734,7 @@ line~\lnref{dec} decrements the access count.
 
 The code to remove the device might be as follows:
 
-\begin{linelabel}[ln:count:inline:remove]
+\begin{fcvlabel}[ln:count:inline:remove]
 \begin{VerbatimN}[commandchars=\\\[\]]
 write_lock(&mylock);		\lnlbl[acq]
 removing = 1;			\lnlbl[note]
@@ -2745,16 +2745,16 @@ while (read_count() != 0) {	\lnlbl[loop:b]
 }				\lnlbl[loop:e]
 remove_device();		\lnlbl[remove]
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
-\begin{lineref}[ln:count:inline:remove]
+\begin{fcvref}[ln:count:inline:remove]
 Line~\lnref{acq} write-acquires the lock and
 line~\lnref{rel} releases it.
 Line~\lnref{note} notes that the device is being removed, and the loop spanning
 \clnrefrange{loop:b}{loop:e} waits for any I/O operations to complete.
 Finally, line~\lnref{remove} does any additional processing needed to prepare for
 device removal.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	What other issues would need to be accounted for in a real system?
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 04998ee3..4b62471e 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -150,7 +150,7 @@ offers excellent scalability.
 \subsection{Hash-Table Implementation}
 \label{sec:datastruct:Hash-Table Implementation}
 
-\begin{lineref}[ln:datastruct:hash_bkt:struct]
+\begin{fcvref}[ln:datastruct:hash_bkt:struct]
 Listing~\ref{lst:datastruct:Hash-Table Data Structures}
 (\path{hash_bkt.c})
 shows a set of data structures used in a simple fixed-sized hash
@@ -176,7 +176,7 @@ the corresponding element's hash value in the \co{->hte_hash} field.
 The \co{ht_elem} structure would be included in the larger structure
 being placed in the hash table, and this larger structure might contain
 a complex key.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tb]
 \input{CodeSamples/datastruct/hash/hash_bkt@struct.fcv}
@@ -195,7 +195,7 @@ The diagram shown in
 Figure~\ref{fig:datastruct:Hash-Table Data-Structure Diagram}
 has bucket~0 with two elements and bucket~2 with one.
 
-\begin{lineref}[ln:datastruct:hash_bkt:map_lock:map]
+\begin{fcvref}[ln:datastruct:hash_bkt:map_lock:map]
 Listing~\ref{lst:datastruct:Hash-Table Mapping and Locking}
 shows mapping and locking functions.
 Lines~\lnref{b} and~\lnref{e}
@@ -205,7 +205,7 @@ This macro uses a simple modulus: if more aggressive hashing is required,
 the caller needs to implement it when mapping from key to hash value.
 The remaining two functions acquire and release the \co{->htb_lock}
 corresponding to the specified hash value.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tb]
 \input{CodeSamples/datastruct/hash/hash_bkt@map_lock.fcv}
@@ -213,7 +213,7 @@ corresponding to the specified hash value.
 \label{lst:datastruct:Hash-Table Mapping and Locking}
 \end{listing}
 
-\begin{lineref}[ln:datastruct:hash_bkt:lookup]
+\begin{fcvref}[ln:datastruct:hash_bkt:lookup]
 Listing~\ref{lst:datastruct:Hash-Table Lookup}
 shows \co{hashtab_lookup()},
 which returns a pointer to the element with the specified hash and key if it
@@ -232,7 +232,7 @@ proceeds to the next element.
 Line~\lnref{keymatch} checks to see if the actual key matches, and if so,
 line~\lnref{return} returns a pointer to the matching element.
 If no element matches, line~\lnref{ret_NULL} returns \co{NULL}.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tb]
 \input{CodeSamples/datastruct/hash/hash_bkt@lookup.fcv}
@@ -241,12 +241,12 @@ If no element matches, line~\lnref{ret_NULL} returns \co{NULL}.
 \end{listing}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:datastruct:hash_bkt:lookup]
+	\begin{fcvref}[ln:datastruct:hash_bkt:lookup]
 	But isn't the double comparison on
 	\clnrefrange{hashmatch}{return} in
 	Listing~\ref{lst:datastruct:Hash-Table Lookup} inefficient
 	in the case where the key fits into an unsigned long?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	Indeed it is!
 	However, hash tables quite frequently store information with
@@ -267,11 +267,11 @@ Listing~\ref{lst:datastruct:Hash-Table Modification}
 shows the \co{hashtab_add()} and \co{hashtab_del()} functions
 that add and delete elements from the hash table, respectively.
 
-\begin{lineref}[ln:datastruct:hash_bkt:add_del:add]
+\begin{fcvref}[ln:datastruct:hash_bkt:add_del:add]
 The \co{hashtab_add()} function simply sets the element's hash
 value on line~\lnref{set}, then adds it to the corresponding bucket on
 lines~\lnref{add:b} and~\lnref{add:e}.
-\end{lineref}
+\end{fcvref}
 The \co{hashtab_del()} function simply removes the specified element
 from whatever hash chain it is on, courtesy of the doubly linked
 nature of the hash-chain lists.
@@ -289,7 +289,7 @@ or modifying this same bucket, for example, by invoking
 Listing~\ref{lst:datastruct:Hash-Table Allocation and Free}
 shows \co{hashtab_alloc()} and \co{hashtab_free()},
 which do hash-table allocation and freeing, respectively.
-\begin{lineref}[ln:datastruct:hash_bkt:alloc_free:alloc]
+\begin{fcvref}[ln:datastruct:hash_bkt:alloc_free:alloc]
 Allocation begins on
 \clnrefrange{alloc:b}{alloc:e} with allocation of the underlying memory.
 If line~\lnref{chk_NULL} detects that memory has been exhausted,
@@ -302,11 +302,11 @@ spanning \clnrefrange{loop:b}{loop:e} initializes the buckets themselves,
 including the chain list header on
 line~\lnref{init_head} and the lock on line~\lnref{init_lock}.
 Finally, line~\lnref{return} returns a pointer to the newly allocated hash table.
-\end{lineref}
-\begin{lineref}[ln:datastruct:hash_bkt:alloc_free:free]
+\end{fcvref}
+\begin{fcvref}[ln:datastruct:hash_bkt:alloc_free:free]
 The \co{hashtab_free()} function on
 \clnrefrange{b}{e} is straightforward.
-\end{lineref}
+\end{fcvref}
 
 \subsection{Hash-Table Performance}
 \label{sec:datastruct:Hash-Table Performance}
@@ -892,7 +892,7 @@ which is the subject of the next section.
 \subsection{Resizable Hash Table Implementation}
 \label{sec:datastruct:Resizable Hash Table Implementation}
 
-\begin{lineref}[ln:datastruct:hash_resize:data]
+\begin{fcvref}[ln:datastruct:hash_resize:data]
 Resizing is accomplished by the classic approach of inserting a level
 of indirection, in this case, the \co{ht} structure shown on
 \clnrefrange{ht:b}{ht:e} of
@@ -971,7 +971,7 @@ from the new table as well as from the old table.
 Conversely, if the bucket that would be selected from the old table
 has not yet been distributed, then the bucket should be selected from
 the old table.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tb]
 \input{CodeSamples/datastruct/hash/hash_resize@get_bucket.fcv}
@@ -979,7 +979,7 @@ the old table.
 \label{lst:datastruct:Resizable Hash-Table Bucket Selection}
 \end{listing}
 
-\begin{lineref}[ln:datastruct:hash_resize:get_bucket]
+\begin{fcvref}[ln:datastruct:hash_resize:get_bucket]
 Bucket selection is shown in
 Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection},
 which shows \co{ht_get_bucket()} on
@@ -1005,7 +1005,7 @@ line~\lnref{hsb:ret_match} returns a pointer to the enclosing data element.
 Otherwise, if there is no match,
 line~\lnref{hsb:ret_NULL} returns \co{NULL} to indicate
 failure.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	How does the code in
@@ -1036,7 +1036,7 @@ must now deal with the possibility of a
 concurrent resize operation as shown in
 Listing~\ref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency Control}.
 
-\begin{lineref}[ln:datastruct:hash_resize:lock_unlock_mod:l]
+\begin{fcvref}[ln:datastruct:hash_resize:lock_unlock_mod:l]
 The \co{hashtab_lock_mod()} spans
 \clnrefrange{b}{e} in the listing.
 Line~\lnref{rcu_lock} enters an RCU read-side critical section to prevent
@@ -1076,9 +1076,9 @@ are used, with the \co{[0]} element pertaining to the old \co{ht_bucket}
 structure and the \co{[1]} element pertaining to the new structure.
 Once again, \co{hashtab_lock_mod()} exits within an RCU read-side critical
 section.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:datastruct:hash_resize:lock_unlock_mod:ul]
+\begin{fcvref}[ln:datastruct:hash_resize:lock_unlock_mod:ul]
 The \co{hashtab_unlock_mod()} function releases the lock(s) acquired by
 \co{hashtab_lock_mod()}.
 Line~\lnref{relbkt0} releases the lock on the old \co{ht_bucket} structure.
@@ -1087,7 +1087,7 @@ operation is in progress, line~\lnref{relbkt1} releases the lock on the
 new \co{ht_bucket} structure.
 Either way, line~\lnref{rcu_unlock} exits the RCU read-side critical
 section.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Suppose that one thread is inserting an element into the
@@ -1119,7 +1119,7 @@ The \co{hashtab_lookup()}, \co{hashtab_add()}, and \co{hashtab_del()}
 functions are shown in
 Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}.
 
-\begin{lineref}[ln:datastruct:hash_resize:access:lkp]
+\begin{fcvref}[ln:datastruct:hash_resize:access:lkp]
 The \co{hashtab_lookup()} function on
 \clnrefrange{b}{e} of the listing does
 hash lookups.
@@ -1128,7 +1128,7 @@ line~\lnref{get_curbkt} searches the bucket corresponding to the
 specified key.
 Line~\lnref{ret} returns a pointer to the searched-for element
 or \co{NULL} when the search fails.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	The \co{hashtab_lookup()} function in
@@ -1144,7 +1144,7 @@ or \co{NULL} when the search fails.
 	is in progress.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:datastruct:hash_resize:access:add]
+\begin{fcvref}[ln:datastruct:hash_resize:access:add]
 The \co{hashtab_add()} function on \clnrefrange{b}{e} of the listing adds
 new data elements to the hash table.
 Line~\lnref{htbp} picks up the current \co{ht_bucket} structure into which the
@@ -1157,9 +1157,9 @@ new element to the corresponding new bucket.
 The caller is required to handle concurrency, for example, by invoking
 \co{hashtab_lock_mod()} before the call to \co{hashtab_add()} and invoking
 \co{hashtab_unlock_mod()} afterwards.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:datastruct:hash_resize:access:del]
+\begin{fcvref}[ln:datastruct:hash_resize:access:del]
 The \co{hashtab_del()} function on
 \clnrefrange{b}{e} of the listing removes
 an existing element from the hash table.
@@ -1171,7 +1171,7 @@ the specified element from the corresponding new bucket.
 As with \co{hashtab_add()}, the caller is responsible for concurrency
 control and this concurrency control suffices for synchronizing with
 a concurrent resize operation.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	The \co{hashtab_add()} and \co{hashtab_del()} functions in
@@ -1223,7 +1223,7 @@ a concurrent resize operation.
 \label{lst:datastruct:Resizable Hash-Table Resizing}
 \end{listing*}
 
-\begin{lineref}[ln:datastruct:hash_resize:resize]
+\begin{fcvref}[ln:datastruct:hash_resize:resize]
 The actual resizing itself is carried out by \co{hashtab_resize}, shown in
 Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing} on
 page~\pageref{lst:datastruct:Resizable Hash-Table Resizing}.
@@ -1252,10 +1252,10 @@ Each pass through the loop spanning \clnrefrange{loop:b}{loop:e} distributes the
 of one of the old hash table's buckets into the new hash table.
 Line~\lnref{get_oldcur} picks up a reference to the old table's current bucket
 and line~\lnref{acq_oldcur} acquires that bucket's spinlock.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:datastruct:hash_resize:resize]
+	\begin{fcvref}[ln:datastruct:hash_resize:resize]
 	In the \co{hashtab_resize()} function in
 	Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing},
 	what guarantees that the update to \co{->ht_new} on line~\lnref{set_newtbl}
@@ -1265,9 +1265,9 @@ and line~\lnref{acq_oldcur} acquires that bucket's spinlock.
 	In other words, what prevents \co{hashtab_add()}
 	and \co{hashtab_del()} from dereferencing
 	a NULL pointer loaded from \co{->ht_new}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:datastruct:hash_resize:resize]
+	\begin{fcvref}[ln:datastruct:hash_resize:resize]
 	The \co{synchronize_rcu()} on line~\lnref{sync_rcu} of
 	Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing}
 	ensures that all pre-existing RCU readers have completed between
@@ -1285,10 +1285,10 @@ and line~\lnref{acq_oldcur} acquires that bucket's spinlock.
 	\co{hashtab_lock_mod()} and \co{hashtab_unlock_mod()} in
 	Listing~\ref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency
 	Control}.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
-\begin{lineref}[ln:datastruct:hash_resize:resize]
+\begin{fcvref}[ln:datastruct:hash_resize:resize]
 Each pass through the loop spanning
 \clnrefrange{loop_list:b}{loop_list:e} adds one data element
 from the current old-table bucket to the corresponding new-table bucket,
@@ -1305,15 +1305,15 @@ the old table) to complete.
 Then line~\lnref{rel_master} releases the resize-serialization lock,
 line~\lnref{free} frees
 the old hash table, and finally line~\lnref{ret_success} returns success.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:datastruct:hash_resize:resize]
+	\begin{fcvref}[ln:datastruct:hash_resize:resize]
 	Why is there a \co{WRITE_ONCE()} on line~\lnref{update_resize}
 	in Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:datastruct:hash_resize:lock_unlock_mod]
+	\begin{fcvref}[ln:datastruct:hash_resize:lock_unlock_mod]
 	Together with the \co{READ_ONCE()}
 	on line~\lnref{l:ifresized} in \co{hashtab_lock_mod()}
 	of Listing~\ref{lst:datastruct:Resizable Hash-Table Update-Side
@@ -1322,7 +1322,7 @@ the old hash table, and finally line~\lnref{ret_success} returns success.
 	to \co{->ht_resize_cur} must remain because reads
 	from \co{->ht_resize_cur} really can race with writes,
 	just not in a way to change the ``if'' conditions.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 \subsection{Resizable Hash Table Discussion}
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 8ee99aa8..286f6df7 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2274,7 +2274,7 @@ Similarly, interrupt-based interference can be detected via the
 \path{/proc/interrupts} file.
 
 \begin{listing}[tb]
-\begin{linelabel}[ln:debugging:Using getrusage() to Detect Context Switches]
+\begin{fcvlabel}[ln:debugging:Using getrusage() to Detect Context Switches]
 \begin{VerbatimL}
 #include <sys/time.h>
 #include <sys/resource.h>
@@ -2298,7 +2298,7 @@ int runtest(void)
 	        ru1.runivcsw == ru2.runivcsw);
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Using \tco{getrusage()} to Detect Context Switches}
 \label{lst:debugging:Using getrusage() to Detect Context Switches}
 \end{listing}
@@ -2395,14 +2395,14 @@ This script takes three optional arguments as follows:
 	which case the ``break'' will be ignored.)
 \end{description}
 
-\begin{lineref}[ln:debugging:datablows:whole]
+\begin{fcvref}[ln:debugging:datablows:whole]
 \Clnrefrange{param:b}{param:e} of
 Listing~\ref{lst:debugging:Statistical Elimination of Interference}
 set the default values for the parameters, and
 \clnrefrange{parse:b}{parse:e} parse
 any command-line overriding of these parameters.
-\end{lineref}
-\begin{lineref}[ln:debugging:datablows:whole:awk]
+\end{fcvref}
+\begin{fcvref}[ln:debugging:datablows:whole:awk]
 The \co{awk} invocation on line~\lnref{invoke} sets the values of the
 \co{divisor}, \co{relerr}, and \co{trendbreak} variables to their
 \co{sh} counterparts.
@@ -2444,7 +2444,7 @@ then line~\lnref{break} exits the loop: We have the full good set of data.
 
 \Clnrefrange{comp_stat:b}{comp_stat:e} then compute and print
 statistics.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	This approach is just plain weird!
diff --git a/defer/defer.tex b/defer/defer.tex
index db8fe1fb..e972ddc1 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -81,26 +81,26 @@ list to evaluate a number of read-mostly synchronization techniques.
 Listing~\ref{lst:defer:Sequential Pre-BSD Routing Table} (\path{route_seq.c})
 shows a simple single-threaded implementation corresponding to
 Figure~\ref{fig:defer:Pre-BSD Packet Routing List}.
-\begin{lineref}[ln:defer:route_seq:lookup_add_del:entry]
+\begin{fcvref}[ln:defer:route_seq:lookup_add_del:entry]
 \Clnrefrange{b}{e} define a \co{route_entry} structure and
 line~\lnref{header} defines
 the \co{route_list} header.
-\end{lineref}
-\begin{lineref}[ln:defer:route_seq:lookup_add_del:lookup]
+\end{fcvref}
+\begin{fcvref}[ln:defer:route_seq:lookup_add_del:lookup]
 \Clnrefrange{b}{e} define \co{route_lookup()}, which sequentially searches
 \co{route_list}, returning the corresponding \co{->iface}, or
 \co{ULONG_MAX} if there is no such route entry.
-\end{lineref}
-\begin{lineref}[ln:defer:route_seq:lookup_add_del:add]
+\end{fcvref}
+\begin{fcvref}[ln:defer:route_seq:lookup_add_del:add]
 \Clnrefrange{b}{e} define \co{route_add()}, which allocates a
 \co{route_entry} structure, initializes it, and adds it to the
 list, returning \co{-ENOMEM} in case of memory-allocation failure.
-\end{lineref}
-\begin{lineref}[ln:defer:route_seq:lookup_add_del:del]
+\end{fcvref}
+\begin{fcvref}[ln:defer:route_seq:lookup_add_del:del]
 Finally, \clnrefrange{b}{e} define \co{route_del()}, which removes and
 frees the specified \co{route_entry} structure if it exists,
 or returns \co{-ENOENT} otherwise.
-\end{lineref}
+\end{fcvref}
 
 This single-threaded implementation serves as a prototype for the various
 concurrent implementations in this chapter, and also as an estimate of
diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 2579ec4f..2b946244 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -31,7 +31,7 @@ may safely be freed.
 Of course, this means that hazard-pointer acquisition must be carried
 out quite carefully in order to avoid destructive races with concurrent
 deletion.
-\begin{lineref}[ln:defer:hazptr:record_clear]
+\begin{fcvref}[ln:defer:hazptr:record_clear]
 One implementation is shown in
 Listing~\ref{lst:defer:Hazard-Pointer Recording and Clearing},
 which shows \co{hp_try_record()} on \clnrefrange{htr:b}{htr:e},
@@ -114,7 +114,7 @@ The \co{hp_clear()} function is even more straightforward, with
 an \co{smp_mb()} to force full ordering between the caller's uses
 of the object protected by the hazard pointer and the setting of
 the hazard pointer to \co{NULL}.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/hazptr@scan_free.fcv}
@@ -122,7 +122,7 @@ the hazard pointer to \co{NULL}.
 \label{lst:defer:Hazard-Pointer Scanning and Freeing}
 \end{listing}
 
-\begin{lineref}[ln:defer:hazptr:scan_free:free]
+\begin{fcvref}[ln:defer:hazptr:scan_free:free]
 Once a hazard-pointer-protected object has been removed from its
 linked data structure, so that it is now inaccessible to future
 hazard-pointer readers, it is passed to \co{hazptr_free_later()},
@@ -135,9 +135,9 @@ and line~\lnref{count} counts the object in \co{rcount}.
 If line~\lnref{check} sees that a sufficiently large number of objects are now
 queued, line~\lnref{scan} invokes \co{hazptr_scan()} to attempt to
 free some of them.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:defer:hazptr:scan_free:scan]
+\begin{fcvref}[ln:defer:hazptr:scan_free:scan]
 The \co{hazptr_scan()} function is shown on \clnrefrange{b}{e}
 of the listing.
 This function relies on a fixed maximum number of threads (\co{NR_THREADS})
@@ -172,7 +172,7 @@ determine that there is a hazard pointer
 protecting this object, \clnrefrange{back:b}{back:e}
 place it back onto \co{rlist}.
 Otherwise, line~\lnref{free} frees the object.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/route_hazptr@lookup.fcv}
@@ -193,7 +193,7 @@ on
 page~\pageref{lst:defer:Sequential Pre-BSD Routing Table},
 so only differences will be discussed.
 
-\begin{lineref}[ln:defer:route_hazptr:lookup]
+\begin{fcvref}[ln:defer:route_hazptr:lookup]
 Starting with
 Listing~\ref{lst:defer:Hazard-Pointer Pre-BSD Routing Table Lookup},
 line~\lnref{hh} shows the \co{->hh} field used to queue objects pending
@@ -217,7 +217,7 @@ upon \co{hp_try_record()} failure.
 And such restarting is absolutely required for correctness.  To see this,
 consider a hazard-pointer-protected linked list containing elements~A,
 B, and~C that is subjected to the following sequence of events:
-\end{lineref}
+\end{fcvref}
 
 \begin{enumerate}
 \item	Thread~0 stores a hazard pointer to element~B
@@ -305,7 +305,7 @@ footprint.
 \label{lst:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete}
 \end{listing}
 
-\begin{lineref}[ln:defer:route_hazptr:add_del]
+\begin{fcvref}[ln:defer:route_hazptr:add_del]
 In
 Listing~\ref{lst:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete},
 line~\lnref{init_freed} initializes \co{->re_freed},
@@ -316,7 +316,7 @@ line~\lnref{free_later} passes that object to the
 is safe to do so.
 The spinlocks work the same as in
 Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}.
-\end{lineref}
+\end{fcvref}
 
 \begin{figure}[tb]
 \centering
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 12bfd9b6..8a9baebc 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -730,7 +730,7 @@ a given node's fields from 5, 6, and 7 to 5, 2, and 3, respectively.
 
 The code implementing this atomic update is straightforward:
 
-\begin{linelabel}[ln:defer:Canonical RCU Replacement Example (2nd)]
+\begin{fcvlabel}[ln:defer:Canonical RCU Replacement Example (2nd)]
 \begin{VerbatimN}[samepage=true,commandchars=\\\[\],firstnumber=15]
 q = kmalloc(sizeof(*p), GFP_KERNEL);	\lnlbl[kmalloc]
 *q = *p;				\lnlbl[copy]
@@ -740,7 +740,7 @@ list_replace_rcu(&p->list, &q->list);	\lnlbl[replace]
 synchronize_rcu();			\lnlbl[sync_rcu]
 kfree(p);				\lnlbl[kfree]
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
 \begin{figure}[tbp]
 \centering
@@ -768,7 +768,7 @@ The following text describes how to replace the \co{5,6,7} element
 with \co{5,2,3} in such a way that any given reader sees one of these
 two values.
 
-\begin{lineref}[ln:defer:Canonical RCU Replacement Example (2nd)]
+\begin{fcvref}[ln:defer:Canonical RCU Replacement Example (2nd)]
 Line~\lnref{kmalloc} \co{kmalloc()}s a replacement element, as follows,
 resulting in the state as shown in the second row of
 Figure~\ref{fig:defer:RCU Replacement in Linked List}.
@@ -814,7 +814,7 @@ of the list, but with the new element in place of the old.
 After the \co{kfree()} on line~\lnref{kfree} completes, the list will
 appear as shown on the final row of
 Figure~\ref{fig:defer:RCU Replacement in Linked List}.
-\end{lineref}
+\end{fcvref}
 
 Despite the fact that RCU was named after the replacement case,
 the vast majority of RCU usage within the Linux kernel relies on
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index d1067591..08d30cc0 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -465,13 +465,13 @@ on page~\pageref{lst:defer:Insertion and Deletion With Concurrent Readers},
 suppose that each reader thread invokes \co{access_route()} exactly
 once during its lifetime, and that there is no other communication among
 reader and updater threads.
-\begin{lineref}[ln:defer:Insertion and Deletion With Concurrent Readers]
+\begin{fcvref}[ln:defer:Insertion and Deletion With Concurrent Readers]
 Then each invocation of \co{access_route()} can be ordered after the
 \co{ins_route()} invocation that produced the \co{route} structure
 accessed by \clnref{access_rp} of the listing in \co{access_route()}
 and ordered before any subsequent
 \co{ins_route()} or \co{del_route()} invocation.
-\end{lineref}
+\end{fcvref}
 
 In summary, maintaining multiple versions is exactly what enables the
 extremely low overheads of RCU readers, and as noted earlier, many
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 57a65024..79e794df 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -375,7 +375,7 @@ has executed a context switch, which in turn guarantees that
 all pre-existing reader threads have completed.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:defer:Insertion and Deletion With Concurrent Readers]
+\begin{fcvlabel}[ln:defer:Insertion and Deletion With Concurrent Readers]
 \begin{VerbatimL}[commandchars=\\\[\]]
 struct route *gptr;
 
@@ -416,7 +416,7 @@ int del_route(void)
 	return !!old_rp;
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Insertion and Deletion With Concurrent Readers}
 \label{lst:defer:Insertion and Deletion With Concurrent Readers}
 \end{listing}
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 8082a26c..cc25c536 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -64,15 +64,15 @@ and the latter shows \co{route_add()} and \co{route_del()}.
 \label{lst:defer:RCU Pre-BSD Routing Table Add/Delete}
 \end{listing}
 
-\begin{lineref}[ln:defer:route_rcu:lookup]
+\begin{fcvref}[ln:defer:route_rcu:lookup]
 In Listing~\ref{lst:defer:RCU Pre-BSD Routing Table Lookup},
 line~\lnref{rh} adds the \co{->rh} field used by RCU reclamation,
 line~\lnref{re_freed} adds the \co{->re_freed} use-after-free-check field,
 lines~\lnref{lock}, \lnref{unlock1}, and~\lnref{unlock2}
 add RCU read-side protection,
 and lines~\lnref{chk_freed} and~\lnref{abort} add the use-after-free check.
-\end{lineref}
-\begin{lineref}[ln:defer:route_rcu:add_del]
+\end{fcvref}
+\begin{fcvref}[ln:defer:route_rcu:add_del]
 In Listing~\ref{lst:defer:RCU Pre-BSD Routing Table Add/Delete},
 lines~\lnref{add:lock}, \lnref{add:unlock}, \lnref{del:lock},
 \lnref{del:unlock1}, and~\lnref{del:unlock2} add update-side locking,
@@ -81,7 +81,7 @@ line~\lnref{del:call_rcu} causes \co{route_cb()} to be invoked after
 a grace period elapses,
 and \clnrefrange{cb:b}{cb:e} define \co{route_cb()}.
 This is minimal added code for a working concurrent implementation.
-\end{lineref}
+\end{fcvref}
 
 \begin{figure}[tb]
 \centering
@@ -831,7 +831,7 @@ guaranteed to remain in existence for the duration of that RCU
 read-side critical section.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:defer:Existence Guarantees Enable Per-Element Locking]
+\begin{fcvlabel}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 \begin{VerbatimL}[commandchars=\\\@\$]
 int delete(int key)
 {
@@ -859,12 +859,12 @@ int delete(int key)
 	return 0;				\lnlbl@ret_0:b$
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Existence Guarantees Enable Per-Element Locking}
 \label{lst:defer:Existence Guarantees Enable Per-Element Locking}
 \end{listing}
 
-\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
+\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
 demonstrates how RCU-based existence guarantees can enable
 per-element locking via a function that deletes an element from
@@ -876,7 +876,7 @@ empty or that the element present is not the one we wish to delete,
 then line~\lnref{rdunlock1} exits the RCU read-side critical section and
 line~\lnref{ret_0:a}
 indicates failure.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	What if the element we need to delete is not the first element
@@ -892,7 +892,7 @@ indicates failure.
 	full chaining.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
+\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 Otherwise, line~\lnref{acq} acquires the update-side spinlock, and
 line~\lnref{chkkey2} then checks that the element is still the one that we want.
 If so, line~\lnref{rdunlock2} leaves the RCU read-side critical section,
@@ -903,17 +903,17 @@ and line~\lnref{ret_1} indicates success.
 If the element is no longer the one we want, line~\lnref{rel2} releases
 the lock, line~\lnref{rdunlock3} leaves the RCU read-side critical section,
 and line~\lnref{ret_0:b} indicates failure to delete the specified key.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
+	\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	Why is it OK to exit the RCU read-side critical section on
 	line~\lnref{rdunlock2} of
 	Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
 	before releasing the lock on line~\lnref{rel1}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
+	\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	First, please note that the second check on line~\lnref{chkkey2} is
 	necessary because some other
 	CPU might have removed this element while we were waiting
@@ -931,18 +931,18 @@ and line~\lnref{ret_0:b} indicates failure to delete the specified key.
 	% A re-check is necessary if the key can mutate or if it is
 	% necessary to reject deleted entries (in cases where deletion
 	% is recorded by mutating the key.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
+	\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	Why not exit the RCU read-side critical section on
 	line~\lnref{rdunlock3} of
 	Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
 	before releasing the lock on line~\lnref{rel2}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
+	\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	Suppose we reverse the order of these two lines.
 	Then this code is vulnerable to the following sequence of
 	events:
@@ -972,7 +972,7 @@ and line~\lnref{ret_0:b} indicates failure to delete the specified key.
 		reallocated as some other type of data structure.
 		This is a fatal memory-corruption error.
 	\end{enumerate}
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 Alert readers will recognize this as only a slight variation on
@@ -1094,7 +1094,7 @@ A simplified version of this code is shown
 Listing~\ref{lst:defer:Using RCU to Wait for NMIs to Finish}.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:defer:Using RCU to Wait for NMIs to Finish]
+\begin{fcvlabel}[ln:defer:Using RCU to Wait for NMIs to Finish]
 \begin{VerbatimL}[commandchars=\\\@\$]
 struct profile_buffer {				\lnlbl@struct:b$
 	long size;
@@ -1124,20 +1124,20 @@ void nmi_stop(void)				\lnlbl@nmi_stop:b$
 	kfree(p);				\lnlbl@nmi_stop:kfree$
 }						\lnlbl@nmi_stop:e$
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Using RCU to Wait for NMIs to Finish}
 \label{lst:defer:Using RCU to Wait for NMIs to Finish}
 \end{listing}
 
-\begin{lineref}[ln:defer:Using RCU to Wait for NMIs to Finish:struct]
+\begin{fcvref}[ln:defer:Using RCU to Wait for NMIs to Finish:struct]
 \Clnrefrange{b}{e} define a \co{profile_buffer} structure, containing a
 size and an indefinite array of entries.
 Line~\lnref{buf} defines a pointer to a profile buffer, which is
 presumably initialized elsewhere to point to a dynamically allocated
 region of memory.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:defer:Using RCU to Wait for NMIs to Finish:nmi_profile]
+\begin{fcvref}[ln:defer:Using RCU to Wait for NMIs to Finish:nmi_profile]
 \Clnrefrange{b}{e} define the \co{nmi_profile()} function,
 which is called from within an NMI handler.
 As such, it cannot be preempted, nor can it be interrupted by a normal
@@ -1156,9 +1156,9 @@ by the \co{pcvalue} argument.
 Note that storing the size with the buffer guarantees that the
 range check matches the buffer, even if a large buffer is suddenly
 replaced by a smaller one.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:defer:Using RCU to Wait for NMIs to Finish:nmi_stop]
+\begin{fcvref}[ln:defer:Using RCU to Wait for NMIs to Finish:nmi_stop]
 \Clnrefrange{b}{e} define the \co{nmi_stop()} function,
 where the caller is responsible for mutual exclusion (for example,
 holding the correct lock).
@@ -1175,7 +1175,7 @@ any instance of \co{nmi_profile()} that obtained a
 pointer to the old buffer has returned.
 It is therefore safe to free the buffer, in this case using the
 \co{kfree()} primitive.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Suppose that the \co{nmi_profile()} function was preemptible.
diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index ef54f44b..6c2061cc 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -48,7 +48,7 @@ shown in
 Listing~\ref{lst:defer:Sequential Pre-BSD Routing Table},
 only the differences will be discussed.
 
-\begin{lineref}[ln:defer:route_refcnt:lookup:entry]
+\begin{fcvref}[ln:defer:route_refcnt:lookup:entry]
 Starting with
 Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup},
 line~\lnref{refcnt} adds the actual reference counter,
@@ -56,20 +56,20 @@ line~\lnref{freed} adds a \co{->re_freed}
 use-after-free check field,
 line~\lnref{routelock} adds the \co{routelock} that will
 be used to synchronize concurrent updates,
-\end{lineref}
-\begin{lineref}[ln:defer:route_refcnt:lookup:re_free]
+\end{fcvref}
+\begin{fcvref}[ln:defer:route_refcnt:lookup:re_free]
 and \clnrefrange{b}{e} add \co{re_free()}, which sets
 \co{->re_freed}, enabling \co{route_lookup()} to check for
 use-after-free bugs.
-\end{lineref}
-\begin{lineref}[ln:defer:route_refcnt:lookup:lookup]
+\end{fcvref}
+\begin{fcvref}[ln:defer:route_refcnt:lookup:lookup]
 In \co{route_lookup()} itself,
 \clnrefrange{relprev:b}{relprev:e} release the reference
 count of the prior element and free it if the count becomes zero,
 and \clnrefrange{acq:b}{acq:e} acquire a reference on the new element,
 with lines~\lnref{check_uaf}
 and~\lnref{abort} performing the use-after-free check.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why bother with a use-after-free check?
@@ -89,7 +89,7 @@ and~\lnref{abort} performing the use-after-free check.
 	of increasing the probability of finding bugs.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:defer:route_refcnt:add_del]
+\begin{fcvref}[ln:defer:route_refcnt:add_del]
 In Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete},
 lines~\lnref{acq1}, \lnref{rel1}, \lnref{acq2}, \lnref{rel2},
 and~\lnref{rel3} introduce locking to synchronize
@@ -98,7 +98,7 @@ Line~\lnref{init:freed} initializes the \co{->re_freed} use-after-free-check fie
 and finally \clnrefrange{re_free:b}{re_free:e} invoke
 \co{re_free()} if the new value of
 the reference count is zero.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why doesn't \co{route_del()} in
@@ -215,7 +215,7 @@ One sequence of events leading to the use-after-free bug is as follows,
 given the list shown in
 Figure~\ref{fig:defer:Pre-BSD Packet Routing List}:
 
-\begin{lineref}[ln:defer:route_refcnt:lookup]
+\begin{fcvref}[ln:defer:route_refcnt:lookup]
 \begin{enumerate}
 \item	Thread~A looks up address~42, reaching
 	line~\lnref{lookup:check_NULL} of
@@ -236,7 +236,7 @@ Figure~\ref{fig:defer:Pre-BSD Packet Routing List}:
         so line~\lnref{lookup:abort} invokes
 	\co{abort()}.
 \end{enumerate}
-\end{lineref}
+\end{fcvref}
 
 The problem is that the reference count is located in the object
 to be protected, but that means that there is no protection during
diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index ab43013c..9cdc161b 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -103,17 +103,17 @@ It is also used in pathname traversal to detect concurrent rename operations.
 A simple implementation of sequence locks is shown in
 Listing~\ref{lst:defer:Sequence-Locking Implementation}
 (\path{seqlock.h}).
-\begin{lineref}[ln:defer:seqlock:impl:typedef]
+\begin{fcvref}[ln:defer:seqlock:impl:typedef]
 The \co{seqlock_t} data structure is shown on
 \clnrefrange{b}{e}, and contains
 the sequence number along with a lock to serialize writers.
-\end{lineref}
-\begin{lineref}[ln:defer:seqlock:impl:init]
+\end{fcvref}
+\begin{fcvref}[ln:defer:seqlock:impl:init]
 \Clnrefrange{b}{e} show \co{seqlock_init()}, which, as the name indicates,
 initializes a \co{seqlock_t}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:defer:seqlock:impl:read_seqbegin]
+\begin{fcvref}[ln:defer:seqlock:impl:read_seqbegin]
 \Clnrefrange{b}{e} show \co{read_seqbegin()}, which begins a sequence-lock
 read-side critical section.
 Line~\lnref{fetch} takes a snapshot of the sequence counter, and
@@ -122,7 +122,7 @@ this snapshot operation before the caller's critical section.
 Finally, line~\lnref{ret} returns the value of the snapshot (with the least-significant
 bit cleared), which the caller
 will pass to a later call to \co{read_seqretry()}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why not have \co{read_seqbegin()} in
@@ -139,7 +139,7 @@ will pass to a later call to \co{read_seqretry()}.
 	check internal to \co{read_seqbegin()} might be preferable.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:defer:seqlock:impl:read_seqretry]
+\begin{fcvref}[ln:defer:seqlock:impl:read_seqretry]
 \Clnrefrange{b}{e} show \co{read_seqretry()}, which returns true if there
 was at least one writer since the time of the corresponding
 call to \co{read_seqbegin()}.
@@ -148,7 +148,7 @@ fetch of the new snapshot of the sequence counter.
 Finally, line~\lnref{ret} checks whether the sequence counter has changed,
 in other words, whether there has been at least one writer, and returns
 true if so.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why is the \co{smp_mb()} on
@@ -170,7 +170,7 @@ true if so.
 \QuickQuizAnswer{
 	In older versions of the Linux kernel, no.
 
-	\begin{lineref}[ln:defer:seqlock:impl]
+	\begin{fcvref}[ln:defer:seqlock:impl]
 	In very new versions of the Linux kernel,
         line~\lnref{read_seqbegin:fetch} could use
 	\co{smp_load_acquire()} instead of \co{READ_ONCE()}, which
@@ -186,7 +186,7 @@ smp_store_release(&slp->seq, READ_ONCE(slp->seq) + 1);
 
 	This would allow the \co{smp_mb()} on
 	line~\lnref{write_sequnlock:mb} to be dropped.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 \QuickQuiz{}
@@ -200,16 +200,16 @@ smp_store_release(&slp->seq, READ_ONCE(slp->seq) + 1);
 	situation, in which case, go wild with the sequence-locking updates!
 } \QuickQuizEnd
 
-\begin{lineref}[ln:defer:seqlock:impl:write_seqlock]
+\begin{fcvref}[ln:defer:seqlock:impl:write_seqlock]
 \Clnrefrange{b}{e} show \co{write_seqlock()}, which simply acquires the lock,
 increments the sequence number, and executes a memory barrier to ensure
 that this increment is ordered before the caller's critical section.
-\end{lineref}
-\begin{lineref}[ln:defer:seqlock:impl:write_sequnlock]
+\end{fcvref}
+\begin{fcvref}[ln:defer:seqlock:impl:write_sequnlock]
 \Clnrefrange{b}{e} show \co{write_sequnlock()}, which executes a memory barrier
 to ensure that the caller's critical section is ordered before the
 increment of the sequence number on line~\lnref{inc}, then releases the lock.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	What if something else serializes writers, so that the lock
@@ -285,21 +285,21 @@ shows \co{route_add()} and \co{route_del()} (\path{route_seqlock.c}).
 This implementation is once again similar to its counterparts in earlier
 sections, so only the differences will be highlighted.
 
-\begin{lineref}[ln:defer:route_seqlock:lookup]
+\begin{fcvref}[ln:defer:route_seqlock:lookup]
 In
 Listing~\ref{lst:defer:Sequence-Locked Pre-BSD Routing Table Lookup},
 line~\lnref{struct:re_freed} adds \co{->re_freed}, which is checked on
 lines~\lnref{lookup:chk_freed} and~\lnref{lookup:abort}.
 Line~\lnref{struct:sl} adds a sequence lock, which is used by \co{route_lookup()}
-\end{lineref}
-\begin{lineref}[ln:defer:route_seqlock:lookup:lookup]
+\end{fcvref}
+\begin{fcvref}[ln:defer:route_seqlock:lookup:lookup]
 on lines~\lnref{r_sqbegin}, \lnref{r_sqretry1}, and~\lnref{r_sqretry2},
 with lines~\lnref{goto_retry1} and~\lnref{goto_retry2} branching back to
 the \co{retry} label on line~\lnref{retry}.
 The effect is to retry any lookup that runs concurrently with an update.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:defer:route_seqlock:add_del]
+\begin{fcvref}[ln:defer:route_seqlock:add_del]
 In
 Listing~\ref{lst:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete},
 lines~\lnref{add:w_sqlock}, \lnref{add:w_squnlock}, \lnref{del:w_sqlock},
@@ -307,7 +307,7 @@ lines~\lnref{add:w_sqlock}, \lnref{add:w_squnlock}, \lnref{del:w_sqlock},
 acquire and release the sequence lock,
 while lines~\lnref{add:clr_freed} and~\lnref{del:set_freed} handle \co{->re_freed}.
 This implementation is therefore quite straightforward.
-\end{lineref}
+\end{fcvref}
 
 \begin{figure}[tb]
 \centering
diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 368e257f..10bb33e9 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -10,7 +10,7 @@
 	{\emph{George Santayana}}
 
 \begin{listing}[tb]
-\begin{linelabel}[ln:formal:IRIW Litmus Test]
+\begin{fcvlabel}[ln:formal:IRIW Litmus Test]
 \begin{VerbatimL}[commandchars=\%\@\$]
 PPC IRIW.litmus
 ""
@@ -29,7 +29,7 @@ stw r1,0(r2) | stw r1,0(r4) | lwz r3,0(r2) | lwz r3,0(r4) ;
 exists
 (2:r3=1 /\ 2:r5=0 /\ 3:r3=1 /\ 3:r5=0)
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{IRIW Litmus Test}
 \label{lst:formal:IRIW Litmus Test}
 \end{listing}
@@ -76,7 +76,7 @@ same litmus tests as PPCMEM, including the IRIW litmus test shown in
 Listing~\ref{lst:formal:IRIW Litmus Test}.
 
 \begin{listing}[tb]
-\begin{linelabel}[ln:formal:Expanded IRIW Litmus Test]
+\begin{fcvlabel}[ln:formal:Expanded IRIW Litmus Test]
 \begin{VerbatimL}[commandchars=\%\@\$]
 PPC IRIW5.litmus
 ""
@@ -102,7 +102,7 @@ stw r1,0(r2) | stw r1,0(r4) |              |              ;
 exists
 (2:r3=1 /\ 2:r5=0 /\ 3:r3=1 /\ 3:r5=0)
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Expanded IRIW Litmus Test}
 \label{lst:formal:Expanded IRIW Litmus Test}
 \end{listing}
@@ -254,7 +254,7 @@ The next section looks at RCU.
 \subsection{Axiomatic Approaches and RCU}
 \label{sec:formal:Axiomatic Approaches and RCU}
 
-\begin{lineref}[ln:formal:C-RCU-remove:whole]
+\begin{fcvref}[ln:formal:C-RCU-remove:whole]
 Axiomatic approaches can also analyze litmus tests involving
 RCU~\cite{Alglave:2018:FSC:3173162.3177156}.
 To that end,
@@ -296,7 +296,7 @@ as expected.
 Also as expected, removing line~\lnref{sync} results in \co{P0()}
 accessing a freed element, as indicated by the \co{Sometimes} in
 the \co{herd} output.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tb]
 \input{CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr@whole.fcv}
@@ -304,7 +304,7 @@ the \co{herd} output.
 \label{lst:formal:Complex RCU Litmus Test}
 \end{listing}
 
-\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
+\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 A litmus test for a more complex example proposed by
 Roman Penyaev~\cite{RomanPenyaev2018rrRCU} is shown in
 Listing~\ref{lst:formal:Complex RCU Litmus Test}
@@ -373,19 +373,19 @@ In either case, line~\lnref{updfree} emulates \co{free()} by storing
 zero to \co{x}.
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
+	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	In Listing~\ref{lst:formal:Complex RCU Litmus Test},
 	why couldn't a reader fetch \co{c} just before \co{P1()}
 	zeroed it on line~\lnref{updinitcache}, and then later
 	store this same value back into \co{c} just after it was
 	zeroed, thus defeating the zeroing operation?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
+	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	Because the reader advances to the next element on
 	line~\lnref{rdnext}, thus avoiding storing a pointer to the
 	same element as was fetched.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 The output of the \co{herd} tool when running this litmus test features
@@ -394,36 +394,36 @@ as expected.
 Also as expected, removing either \co{synchronize_rcu()} results
 in \co{P1()} accessing a freed element, as indicated by \co{Sometimes}
 in the \co{herd} output.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
+	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	In Listing~\ref{lst:formal:Complex RCU Litmus Test},
 	why not have just one call to \co{synchronize_rcu()}
 	immediately before line~\lnref{updfree}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
+	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	Because this results in \co{P0()} accessing a freed element.
 	But don't take my word for this, try it out in \co{herd}!
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
+	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	Also in Listing~\ref{lst:formal:Complex RCU Litmus Test},
 	can't line~\lnref{updfree} be \co{WRITE_ONCE()} instead
 	of \co{smp_store_release()}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
+	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	That is an excellent question.
 	As of late 2018, the answer is ``no one knows''.
 	Much depends on the semantics of ARMv8's conditional-move
 	instruction.
 	While awaiting clarity on these semantics, \co{smp_store_release()}
 	is the safe choice.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 These sections have shown how axiomatic approaches can successfully
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 41ca46e9..5465de85 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -197,7 +197,7 @@ used to distinguish between an outermost or a nested interrupt/NMI.
 Interrupt entry is handled by the \co{rcu_irq_enter()}
 shown below:
 
-\begin{linelabel}[ln:formal:dyntickrcu:rcu_irq_enter]
+\begin{fcvlabel}[ln:formal:dyntickrcu:rcu_irq_enter]
 \begin{VerbatimN}[commandchars=\\\[\]]
 void rcu_irq_enter(void)
 {
@@ -214,9 +214,9 @@ void rcu_irq_enter(void)
 	}
 }
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
-\begin{lineref}[ln:formal:dyntickrcu:rcu_irq_enter]
+\begin{fcvref}[ln:formal:dyntickrcu:rcu_irq_enter]
 \Clnref{fetch} fetches the current CPU's number, while \clnref{inc:b,inc:e}
 increment the \co{rcu_update_flag} nesting counter if it
 is already non-zero.
@@ -232,7 +232,7 @@ any other CPU that sees the effects of an RCU read-side critical section
 in the interrupt handler (following the \co{rcu_irq_enter()}
 invocation) will also see the increment of
 \co{dynticks_progress_counter}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why not simply increment \co{rcu_update_flag}, and then only
@@ -256,11 +256,11 @@ invocation) will also see the increment of
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:dyntickrcu:rcu_irq_enter]
+	\begin{fcvref}[ln:formal:dyntickrcu:rcu_irq_enter]
 	But if \clnref{chk_lv:b} finds that we are the outermost interrupt,
 	wouldn't we \emph{always} need to increment
 	\co{dynticks_progress_counter}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	Not if we interrupted a running task!
 	In that case, \co{dynticks_progress_counter} would
@@ -271,7 +271,7 @@ invocation) will also see the increment of
 Interrupt exit is handled similarly by
 \co{rcu_irq_exit()}:
 
-\begin{linelabel}[ln:formal:dyntickrcu:rcu_irq_exit]
+\begin{fcvlabel}[ln:formal:dyntickrcu:rcu_irq_exit]
 \begin{VerbatimN}[commandchars=\\\[\]]
 void rcu_irq_exit(void)
 {
@@ -288,9 +288,9 @@ void rcu_irq_exit(void)
 	}
 }
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
-\begin{lineref}[ln:formal:dyntickrcu:rcu_irq_exit]
+\begin{fcvref}[ln:formal:dyntickrcu:rcu_irq_exit]
 \Clnref{fetch} fetches the current CPU's number, as before.
 \Clnref{chk_flg} checks to see if the \co{rcu_update_flag} is
 non-zero, returning immediately (via falling off the end of the
@@ -309,7 +309,7 @@ any other CPU that sees the increment of
 will also see the effects of an RCU read-side critical section
 in the interrupt handler (preceding the \co{rcu_irq_exit()}
 invocation).
-\end{lineref}
+\end{fcvref}
 
 These two sections have described how the
 \co{dynticks_progress_counter} variable is maintained during
@@ -355,7 +355,7 @@ static void dyntick_save_progress_counter(int cpu)
 The \co{rcu_try_flip_waitack_state} state invokes
 \co{rcu_try_flip_waitack_needed()}, shown below:
 
-\begin{linelabel}[ln:formal:dyntickrcu:rcu_try_flip_waitack_needed]
+\begin{fcvlabel}[ln:formal:dyntickrcu:rcu_try_flip_waitack_needed]
 \begin{VerbatimN}[commandchars=\\\[\]]
 static inline int
 rcu_try_flip_waitack_needed(int cpu)
@@ -373,9 +373,9 @@ rcu_try_flip_waitack_needed(int cpu)
 	return 1;				\lnlbl[ret_1]
 }
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
-\begin{lineref}[ln:formal:dyntickrcu:rcu_try_flip_waitack_needed]
+\begin{fcvref}[ln:formal:dyntickrcu:rcu_try_flip_waitack_needed]
 \Clnref{curr,snap} pick up current and snapshot versions of
 \co{dynticks_progress_counter}, respectively.
 The memory barrier on \clnref{mb} ensures that the counter checks
@@ -393,12 +393,12 @@ In both these cases, there is no way that the CPU could have retained
 the old value of the grace-period counter.
 If neither of these conditions hold, \clnref{ret_1} returns one, meaning
 that the CPU needs to explicitly respond.
-\end{lineref}
+\end{fcvref}
 
 For its part, the \co{rcu_try_flip_waitmb_state} state
 invokes \co{rcu_try_flip_waitmb_needed()}, shown below:
 
-\begin{linelabel}[ln:formal:dyntickrcu:rcu_try_flip_waitmb_needed]
+\begin{fcvlabel}[ln:formal:dyntickrcu:rcu_try_flip_waitmb_needed]
 \begin{VerbatimN}[commandchars=\\\[\]]
 static inline int
 rcu_try_flip_waitmb_needed(int cpu)
@@ -416,14 +416,14 @@ rcu_try_flip_waitmb_needed(int cpu)
 	return 1;
 }
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
-\begin{lineref}[ln:formal:dyntickrcu:rcu_try_flip_waitmb_needed]
+\begin{fcvref}[ln:formal:dyntickrcu:rcu_try_flip_waitmb_needed]
 This is quite similar to \co{rcu_try_flip_waitack_needed()},
 the difference being in \clnref{chk_to_from,ret_0}, because any transition
 either to or from dynticks-idle state executes the memory barrier
 needed by the \co{rcu_try_flip_waitmb_state} state.
-\end{lineref}
+\end{fcvref}
 
 We now have seen all the code involved in the interface between
 RCU and the dynticks-idle state.
@@ -464,7 +464,7 @@ a loop as follows:
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base@dyntick_nohz.fcv}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base:dyntick_nohz]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-base:dyntick_nohz]
 \Clnref{do,od} define a loop.
 \Clnref{break} exits the loop once the loop counter \co{i}
 has exceeded the limit \co{MAX_DYNTICK_LOOP_NOHZ}.
@@ -485,7 +485,7 @@ of the algorithm.
 \Clnrefrange{ent_inc:b}{ent_inc:e} similarly model the increment and
 \co{WARN_ON()} for \co{rcu_enter_nohz()}.
 Finally, \clnref{inc_i} increments the loop counter.
-\end{lineref}
+\end{fcvref}
 
 Each pass through the loop therefore models a CPU exiting
 dynticks-idle mode (for example, starting to execute a task), then
@@ -527,7 +527,7 @@ through preemptible RCU's grace-period processing.
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base@grace_period.fcv}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base:grace_period]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-base:grace_period]
 \Clnrefrange{print:b}{print:e} print out the loop limit
 (but only into the .trail file
 in case of error) and models a line of code
@@ -555,7 +555,7 @@ Finally, \clnrefrange{do2}{od2} model the relevant code in
 This loop is modeling the grace-period state-machine waiting for
 each CPU to execute a memory barrier, but again only that part
 that interacts with dynticks-idle CPUs.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Wait a minute!
@@ -599,7 +599,7 @@ progresses through the grace-period phases, as shown below:
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base-s@grace_period.fcv}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base-s:grace_period]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-base-s:grace_period]
 \Clnref{upd_gps1,upd_gps2,upd_gps3,upd_gps4,upd_gps5,upd_gps6}
 update this variable (combining
 atomically with algorithmic operations where feasible) to
@@ -609,14 +609,14 @@ The form of this verification is to assert that the value of the
 \co{grace_period_state} variable cannot jump from
 \co{GP_IDLE} to \co{GP_DONE} during a time period
 over which RCU readers could plausibly persist.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base-s:grace_period]
+	\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-base-s:grace_period]
 	Given there are a pair of back-to-back changes to
 	\co{grace_period_state} on \clnref{upd_gps3,upd_gps4},
 	how can we be sure that \clnref{upd_gps3}'s changes won't be lost?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	Recall that Promela and Spin trace out
 	every possible sequence of state changes.
@@ -631,7 +631,7 @@ this verification as shown below:
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base-s@dyntick_nohz.fcv}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base-s:dyntick_nohz]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-base-s:dyntick_nohz]
 \Clnref{new_flg} sets a new \co{old_gp_idle} flag if the
 value of the \co{grace_period_state} variable is
 \co{GP_IDLE} at the beginning of task execution,
@@ -640,7 +640,7 @@ fire if the \co{grace_period_state}
 variable has advanced to \co{GP_DONE} during task execution,
 which would be illegal given that a single RCU read-side critical
 section could span the entire intervening time period.
-\end{lineref}
+\end{fcvref}
 
 The resulting
 model (\path{dyntickRCU-base-s.spin}),
@@ -653,13 +653,13 @@ The next section therefore covers verifying liveness.
 \subsubsection{Validating Liveness}
 \label{sec:formal:Validating Liveness}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base-sl-busted:dyntick_nohz]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-base-sl-busted:dyntick_nohz]
 Although liveness can be difficult to prove, there is a simple
 trick that applies here.
 The first step is to make \co{dyntick_nohz()} indicate that
 it is done via a \co{dyntick_nohz_done} variable, as shown on
 \clnref{done} of the following:
-\end{lineref}
+\end{fcvref}
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base-sl-busted@dyntick_nohz.fcv}
 
@@ -669,7 +669,7 @@ as follows:
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base-sl-busted@grace_period.fcv}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base-sl-busted:grace_period]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-base-sl-busted:grace_period]
 We have added the \co{shouldexit} variable on \clnref{shex},
 which we initialize to zero on \clnref{init_shex}.
 \Clnref{assert_shex} asserts that \co{shouldexit} is not set, while
@@ -716,7 +716,7 @@ does not hold because
 \qco{curr != snap}, and the second condition on \clnref{chk_2}
 does not hold either because \co{snap} is odd and because
 \co{curr} is only one greater than \co{snap}.
-\end{lineref}
+\end{fcvref}
 
 So one of these two conditions has to be incorrect.
 Referring to the comment block in \co{rcu_try_flip_waitack_needed()}
@@ -754,7 +754,7 @@ We therefore need to be testing \co{curr} rather than
 
 The corrected C code is as follows:
 
-\begin{linelabel}[ln:formal:dyntickrcu:rcu_try_flip_waitack_needed_fixed]
+\begin{fcvlabel}[ln:formal:dyntickrcu:rcu_try_flip_waitack_needed_fixed]
 \begin{VerbatimN}[commandchars=\\\[\]]
 static inline int
 rcu_try_flip_waitack_needed(int cpu)
@@ -772,14 +772,14 @@ rcu_try_flip_waitack_needed(int cpu)
 	return 1;
 }
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
-\begin{lineref}[ln:formal:dyntickrcu:rcu_try_flip_waitack_needed_fixed]
+\begin{fcvref}[ln:formal:dyntickrcu:rcu_try_flip_waitack_needed_fixed]
 \Clnrefrange{if:b}{if:e} can now be combined and simplified,
 resulting in the following.
 A similar simplification can be applied to
 \co{rcu_try_flip_waitmb_needed()}.
-\end{lineref}
+\end{fcvref}
 
 \begin{VerbatimN}[commandchars=\\\[\]]
 static inline int
@@ -846,7 +846,7 @@ EXECUTE_MAINLINE(stmt1,
                  tmp = dynticks_progress_counter)
 \end{VerbatimU}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:EXECUTE_MAINLINE]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:EXECUTE_MAINLINE]
 \Clnref{label} of the macro creates the specified statement label.
 \Clnrefrange{atm:b}{atm:e} are an atomic block that tests
 the \co{in_dyntick_irq}
@@ -856,7 +856,7 @@ label.
 Otherwise, \clnref{else} executes the specified statement.
 The overall effect is that mainline execution stalls any time an interrupt
 is active, as required.
-\end{lineref}
+\end{fcvref}
 
 \subsubsection{Validating Interrupt Handlers}
 \label{sec:formal:Validating Interrupt Handlers}
@@ -866,11 +866,11 @@ The first step is to convert \co{dyntick_nohz()} to
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-irqnn-ssl@dyntick_nohz.fcv}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_nohz]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_nohz]
 It is important to note that when a group of statements is passed
 to \co{EXECUTE_MAINLINE()}, as in \clnrefrange{stmt2:b}{stmt2:e}, all
 statements in that group execute atomically.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	But what would you do if you needed the statements in a single
@@ -923,7 +923,7 @@ to model an interrupt handler:
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-irqnn-ssl@dyntick_irq.fcv}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_irq]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_irq]
 The loop from \clnrefrange{do}{od} models up to \co{MAX_DYNTICK_LOOP_IRQ}
 interrupts, with \clnref{cond1,cond2} forming the loop condition and
 \clnref{inc_i} incrementing the control variable.
@@ -932,13 +932,13 @@ is running, and \clnref{clr_in_irq} tells \co{dyntick_nohz()} that this
 handler has completed.
 \Clnref{irq_done} is used for liveness verification, just like the corresponding
 line of \co{dyntick_nohz()}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_irq]
+	\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_irq]
 	Why are \clnref{clr_in_irq,inc_i} (the \qco{in_dyntick_irq = 0;}
 	and the \qco{i++;}) executed atomically?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	These lines of code pertain to controlling the
 	model, not to the code being modeled, so there is no reason to
@@ -947,7 +947,7 @@ line of \co{dyntick_nohz()}.
 	of the state space.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_irq]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_irq]
 \Clnrefrange{enter:b}{enter:e} model \co{rcu_irq_enter()}, and
 \clnref{add_prmt_cnt:b,add_prmt_cnt:e} model the relevant snippet
 of \co{__irq_enter()}.
@@ -955,7 +955,7 @@ of \co{__irq_enter()}.
 as do the corresponding lines of \co{dynticks_nohz()}.
 \Clnref{irq_exit:b,irq_exit:e} model the relevant snippet of \co{__irq_exit()},
 and finally \clnrefrange{exit:b}{exit:e} model \co{rcu_irq_exit()}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	What property of interrupts is this \co{dynticks_irq()}
@@ -969,14 +969,14 @@ The \co{grace_period()} process then becomes as follows:
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-irqnn-ssl@grace_period.fcv}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:grace_period]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:grace_period]
 The implementation of \co{grace_period()} is very similar
 to the earlier one.
 The only changes are the addition of \clnref{MDLI} to add the new
 interrupt-count parameter, changes to
 \clnref{edit1,edit3} to add the new \co{dyntick_irq_done} variable
 to the liveness checks, and of course the optimizations on \clnref{edit2,edit4}.
-\end{lineref}
+\end{fcvref}
 
 This model (\path{dyntickRCU-irqnn-ssl.spin})
 results in a correct verification with roughly half a million
@@ -993,7 +993,7 @@ the loop in \co{dyntick_irq()} as follows:
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-irq-ssl@dyntick_irq.fcv}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irq-ssl:dyntick_irq]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irq-ssl:dyntick_irq]
 This is similar to the earlier \co{dynticks_irq()} process.
 It adds a second counter variable \co{j} on \clnref{j}, so that
 \co{i} counts entries to interrupt handlers and \co{j}
@@ -1021,7 +1021,7 @@ from the outermost interrupt level.
 Finally, \clnrefrange{atm4:b}{atm4:e} increment the interrupt-exit count \co{j}
 and, if this is the outermost interrupt level, clears
 \co{in_dyntick_irq}.
-\end{lineref}
+\end{fcvref}
 
 This model (\path{dyntickRCU-irq-ssl.spin})
 results in a correct verification with a bit more than half a million
@@ -1058,23 +1058,23 @@ to \co{EXECUTE_IRQ()} as follows:
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-irq-nmi-ssl@dyntick_irq.fcv}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irq-nmi-ssl:dyntick_irq]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irq-nmi-ssl:dyntick_irq]
 Note that we have open-coded the ``if'' statements
 (for example, \clnrefrange{stmt1:b}{stmt1:e}).
 In addition, statements that process strictly local state
 (such as \clnref{inc_i}) need not exclude \co{dyntick_nmi()}.
-\end{lineref}
+\end{fcvref}
 
 Finally, \co{grace_period()} requires only a few changes:
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-irq-nmi-ssl@grace_period.fcv}
 
-\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irq-nmi-ssl:grace_period]
+\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irq-nmi-ssl:grace_period]
 We have added the \co{printf()} for the new
 \co{MAX_DYNTICK_LOOP_NMI} parameter on \clnref{MDL_NMI} and
 added \co{dyntick_nmi_done} to the \co{shouldexit}
 assignments on \clnref{nmi_done1,nmi_done2}.
-\end{lineref}
+\end{fcvref}
 
 The model (\path{dyntickRCU-irq-nmi-ssl.spin})
 results in a correct verification with several hundred million
@@ -1282,7 +1282,7 @@ which enter and exit dynticks-idle mode, also known as ``nohz'' mode.
 These two functions are invoked from process context.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:formal:Entering and Exiting Dynticks-Idle Mode]
+\begin{fcvlabel}[ln:formal:Entering and Exiting Dynticks-Idle Mode]
 \begin{VerbatimL}[commandchars=\\\[\]]
 void rcu_enter_nohz(void)
 {
@@ -1312,12 +1312,12 @@ void rcu_exit_nohz(void)
 	smp_mb();
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Entering and Exiting Dynticks-Idle Mode}
 \label{lst:formal:Entering and Exiting Dynticks-Idle Mode}
 \end{listing}
 
-\begin{lineref}[ln:formal:Entering and Exiting Dynticks-Idle Mode]
+\begin{fcvref}[ln:formal:Entering and Exiting Dynticks-Idle Mode]
 \Clnref{mb} ensures that any prior memory accesses (which might
 include accesses from RCU read-side critical sections) are seen
 by other CPUs before those marking entry to dynticks-idle mode.
@@ -1329,7 +1329,7 @@ should now be even, given that we are entering dynticks-idle mode
 in process context.
 Finally, \clnref{dec_nst} decrements \co{dynticks_nesting},
 which should now be zero.
-\end{lineref}
+\end{fcvref}
 
 The \co{rcu_exit_nohz()} function is quite similar, but increments
 \co{dynticks_nesting} rather than decrementing it and checks for
@@ -1338,7 +1338,7 @@ the opposite \co{dynticks} polarity.
 \subsubsection{NMIs From Dynticks-Idle Mode}
 \label{sec:formal:NMIs From Dynticks-Idle Mode}
 
-\begin{lineref}[ln:formal:NMIs From Dynticks-Idle Mode]
+\begin{fcvref}[ln:formal:NMIs From Dynticks-Idle Mode]
 \Cref{lst:formal:NMIs From Dynticks-Idle Mode}
 shows the \co{rcu_nmi_enter()} and \co{rcu_nmi_exit()} functions,
 which inform RCU of NMI entry and exit, respectively, from dynticks-idle
@@ -1353,10 +1353,10 @@ leaving it with an even value.
 Both functions execute memory barriers between this increment
 and possible RCU read-side critical sections on \clnref{mb1,mb2},
 respectively.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:formal:NMIs From Dynticks-Idle Mode]
+\begin{fcvlabel}[ln:formal:NMIs From Dynticks-Idle Mode]
 \begin{VerbatimL}[commandchars=\\\[\]]
 void rcu_nmi_enter(void)
 {
@@ -1382,7 +1382,7 @@ void rcu_nmi_exit(void)
 	WARN_ON(rdtp->dynticks_nmi & 0x1);
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{NMIs From Dynticks-Idle Mode}
 \label{lst:formal:NMIs From Dynticks-Idle Mode}
 \end{listing}
@@ -1390,7 +1390,7 @@ void rcu_nmi_exit(void)
 \subsubsection{Interrupts From Dynticks-Idle Mode}
 \label{sec:formal:Interrupts From Dynticks-Idle Mode}
 
-\begin{lineref}[ln:formal:Interrupts From Dynticks-Idle Mode]
+\begin{fcvref}[ln:formal:Interrupts From Dynticks-Idle Mode]
 \Cref{lst:formal:Interrupts From Dynticks-Idle Mode}
 shows \co{rcu_irq_enter()} and \co{rcu_irq_exit()}, which
 inform RCU of entry to and exit from, respectively, \IRQ\ context.
@@ -1406,7 +1406,7 @@ RCU read-side critical sections that the subsequent \IRQ\ handler
 might execute.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:formal:Interrupts From Dynticks-Idle Mode]
+\begin{fcvlabel}[ln:formal:Interrupts From Dynticks-Idle Mode]
 \begin{VerbatimL}[commandchars=\\\[\]]
 void rcu_irq_enter(void)
 {
@@ -1435,7 +1435,7 @@ void rcu_irq_exit(void)
 		set_need_resched();		\lnlbl[chk_cb:e]
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Interrupts From Dynticks-Idle Mode}
 \label{lst:formal:Interrupts From Dynticks-Idle Mode}
 \end{listing}
@@ -1453,12 +1453,12 @@ dynticks-idle mode.
 if the prior \IRQ\ handlers enqueued any
 RCU callbacks, forcing this CPU out of dynticks-idle mode via
 a reschedule API if so.
-\end{lineref}
+\end{fcvref}
 
 \subsubsection{Checking For Dynticks Quiescent States}
 \label{sec:formal:Checking For Dynticks Quiescent States}
 
-\begin{lineref}[ln:formal:Saving Dyntick Progress Counters]
+\begin{fcvref}[ln:formal:Saving Dyntick Progress Counters]
 \Cref{lst:formal:Saving Dyntick Progress Counters}
 shows \co{dyntick_save_progress_counter()}, which takes a snapshot
 of the specified CPU's \co{dynticks} and \co{dynticks_nmi}
@@ -1475,10 +1475,10 @@ neither \IRQ s nor NMIs in progress (in other words, both snapshots
 have even values), hence in an extended quiescent state.
 If so, \clnref{cnt:b,cnt:e} count this event, and \clnref{ret} returns
 true if the CPU was in a quiescent state.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:formal:Saving Dyntick Progress Counters]
+\begin{fcvlabel}[ln:formal:Saving Dyntick Progress Counters]
 \begin{VerbatimL}[commandchars=\\\[\]]
 static int
 dyntick_save_progress_counter(struct rcu_data *rdp)
@@ -1498,12 +1498,12 @@ dyntick_save_progress_counter(struct rcu_data *rdp)
 	return ret;				\lnlbl[ret]
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Saving Dyntick Progress Counters}
 \label{lst:formal:Saving Dyntick Progress Counters}
 \end{listing}
 
-\begin{lineref}[ln:formal:Checking Dyntick Progress Counters]
+\begin{fcvref}[ln:formal:Checking Dyntick Progress Counters]
 \Cref{lst:formal:Checking Dyntick Progress Counters}
 shows \co{rcu_implicit_dynticks_qs()}, which is called to check
 whether a CPU has entered dyntick-idle mode subsequent to a call
@@ -1530,10 +1530,10 @@ quiescent state, then \clnref{cnt} counts that fact and
 Either way, \clnref{chk_race}
 checks for race conditions that can result in RCU
 waiting for a CPU that is offline.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:formal:Checking Dyntick Progress Counters]
+\begin{fcvlabel}[ln:formal:Checking Dyntick Progress Counters]
 \begin{VerbatimL}[commandchars=\\\[\]]
 static int
 rcu_implicit_dynticks_qs(struct rcu_data *rdp)
@@ -1556,7 +1556,7 @@ rcu_implicit_dynticks_qs(struct rcu_data *rdp)
 	return rcu_implicit_offline_qs(rdp);	\lnlbl[chk_race]
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Checking Dyntick Progress Counters}
 \label{lst:formal:Checking Dyntick Progress Counters}
 \end{listing}
diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 722bc4d1..184cdd0d 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -66,7 +66,7 @@ replaced by ``ARM''. You can select the ARM interface by clicking on
 ``Change to ARM Model'' at the web page called out above.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:formal:PPCMEM Litmus Test]
+\begin{fcvlabel}[ln:formal:PPCMEM Litmus Test]
 \begin{VerbatimL}[commandchars=\@\[\]]
 PPC SB+lwsync-RMW-lwsync+isync-simple		@lnlbl[type]
 ""						@lnlbl[altname]
@@ -89,12 +89,12 @@ PPC SB+lwsync-RMW-lwsync+isync-simple		@lnlbl[type]
 exists						@lnlbl[assert:b]
 (0:r3=0 /\ 1:r3=0)				@lnlbl[assert:e]
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{PPCMEM Litmus Test}
 \label{lst:formal:PPCMEM Litmus Test}
 \end{listing}
 
-\begin{lineref}[ln:formal:PPCMEM Litmus Test]
+\begin{fcvref}[ln:formal:PPCMEM Litmus Test]
 In the example, \clnref{type} identifies the type of system (``ARM'' or
 ``PPC'') and contains the title for the model. \Clnref{altname}
 provides a place for an
@@ -120,14 +120,14 @@ required, and the identifiers must be of the form \co{Pn}, where \co{n}
 is the column number, starting from zero for the left-most column. This
 may seem unnecessarily strict, but it does prevent considerable confusion
 in actual use.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:PPCMEM Litmus Test]
+	\begin{fcvref}[ln:formal:PPCMEM Litmus Test]
 	Why does \clnref{reginit} of \cref{lst:formal:PPCMEM Litmus Test}
 	initialize the registers?
 	Why not instead initialize them on \clnref{init:0,init:1}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	Either way works.
 	However, in general, it is better to use initialization than
@@ -140,7 +140,7 @@ in actual use.
 	initialization instructions.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:formal:PPCMEM Litmus Test]
+\begin{fcvref}[ln:formal:PPCMEM Litmus Test]
 \Clnrefrange{reginit}{P0fail1} are the lines of code for each process.
 A given process can have empty lines, as is the case for P0's
 \clnref{P0empty} and P1's \clnrefrange{P1empty:b}{P1empty:e}.
@@ -187,14 +187,14 @@ P1's \clnref{reginit,stw} are equivalent to the C statement \co{y=1},
 \clnref{P1sync}
 is a memory barrier, equivalent to the Linux kernel statement \co{smp_mb()},
 and \clnref{P1lwz} is equivalent to the C statement \co{r3=x}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:PPCMEM Litmus Test]
+	\begin{fcvref}[ln:formal:PPCMEM Litmus Test]
 	But whatever happened to \clnref{P0fail1} of
 	\cref{lst:formal:PPCMEM Litmus Test},
 	the one that is the \co{Fail1:} label?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	The implementation of powerpc version of \co{atomic_add_return()}
 	loops when the \co{stwcx} instruction fails, which it communicates
@@ -329,10 +329,10 @@ cannot happen.
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:PPCMEM Litmus Test]
+	\begin{fcvref}[ln:formal:PPCMEM Litmus Test]
 	Does the \co{lwsync} on \clnref{P0lwsync} in
 	\cref{lst:formal:PPCMEM Litmus Test} provide sufficient ordering?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	It depends on the semantics required.
 	The rest of this answer assumes that the assembly language
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 1828ea3f..72d90bb1 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -63,7 +63,7 @@ more complex uses.
 \subsubsection{Promela Warm-Up: Non-Atomic Increment}
 \label{sec:formal:Promela Warm-Up: Non-Atomic Increment}
 
-\begin{lineref}[ln:formal:promela:increment:whole]
+\begin{fcvref}[ln:formal:promela:increment:whole]
 Listing~\ref{lst:formal:Promela Code for Non-Atomic Increment}
 demonstrates the textbook race condition
 resulting from non-atomic increment.
@@ -122,7 +122,7 @@ loop that sums up the progress counters.
 The \co{assert()} statement on line~\lnref{assert} verifies that
 if all processes
 have been completed, then all counts have been correctly recorded.
-\end{lineref}
+\end{fcvref}
 
 You can build and run this program as follows:
 
@@ -466,7 +466,7 @@ Now we are ready for more complex examples.
 \subsection{Promela Example: Locking}
 \label{sec:formal:Promela Example: Locking}
 
-\begin{lineref}[ln:formal:promela:lock:whole]
+\begin{fcvref}[ln:formal:promela:lock:whole]
 Since locks are generally useful, \co{spin_lock()} and
 \co{spin_unlock()}
 macros are provided in \path{lock.h}, which may be included from
@@ -487,7 +487,7 @@ On the other hand, if the lock is already held on line~\lnref{held},
 we do nothing (\co{skip}), and fall out of the \co{if-fi} and the
 atomic block so as to take another pass through the outer
 loop, repeating until the lock is available.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/formal/promela/lock@whole.fcv}
@@ -514,7 +514,7 @@ weak memory ordering must be explicitly coded.
 \label{lst:formal:Promela Code to Test Spinlocks}
 \end{listing}
 
-\begin{lineref}[ln:formal:promela:lock:spin]
+\begin{fcvref}[ln:formal:promela:lock:spin]
 These macros are tested by the Promela code shown in
 Listing~\ref{lst:formal:Promela Code to Test Spinlocks}.
 This code is similar to that used to test the increments,
@@ -524,15 +524,15 @@ The mutex itself is defined on line~\lnref{mutex},
 an array to track the lock owner
 on line~\lnref{array}, and line~\lnref{sum} is used by assertion
 code to verify that only one process holds the lock.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:formal:promela:lock:spin:locker]
+\begin{fcvref}[ln:formal:promela:lock:spin:locker]
 The locker process is on \clnrefrange{b}{e}, and simply loops forever
 acquiring the lock on line~\lnref{lock}, claiming it on line~\lnref{claim},
 unclaiming it on line~\lnref{unclaim}, and releasing it on line~\lnref{unlock}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:formal:promela:lock:spin:init]
+\begin{fcvref}[ln:formal:promela:lock:spin:init]
 The init block on \clnrefrange{b}{e} initializes the current locker's
 havelock array entry on line~\lnref{array}, starts the current locker on
 line~\lnref{start}, and advances to the next locker on line~\lnref{next}.
@@ -541,7 +541,7 @@ moves to line~\lnref{chkassert}, which checks the assertion.
 Lines~\lnref{sum} and~\lnref{j} initialize the control variables,
 \clnrefrange{atm:b}{atm:e} atomically sum the havelock array entries,
 line~\lnref{assert} is the assertion, and line~\lnref{break} exits the loop.
-\end{lineref}
+\end{fcvref}
 
 We can run this model by placing the two code fragments of
 Listings~\ref{lst:formal:Promela Code for Spinlock}
@@ -689,7 +689,7 @@ Finally, the \co{mutex} variable is used to serialize updaters' slowpaths.
 \label{lst:formal:QRCU Reader Process}
 \end{listing}
 
-\begin{lineref}[ln:formal:promela:qrcu:reader]
+\begin{fcvref}[ln:formal:promela:qrcu:reader]
 QRCU readers are modeled by the \co{qrcu_reader()} process shown in
 Listing~\ref{lst:formal:QRCU Reader Process}.
 A \co{do-od} loop spans \clnrefrange{do}{od},
@@ -705,7 +705,7 @@ both lines for the benefit of
 the \co{assert()} statement that we shall encounter later.
 Line~\lnref{atm:dec} atomically decrements the same counter that we incremented,
 thereby exiting the RCU read-side critical section.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[htbp]
 \input{CodeSamples/formal/promela/qrcu@sum_unordered.fcv}
@@ -713,7 +713,7 @@ thereby exiting the RCU read-side critical section.
 \label{lst:formal:QRCU Unordered Summation}
 \end{listing}
 
-\begin{lineref}[ln:formal:promela:qrcu:sum_unordered]
+\begin{fcvref}[ln:formal:promela:qrcu:sum_unordered]
 The C-preprocessor macro shown in
 Listing~\ref{lst:formal:QRCU Unordered Summation}
 sums the pair of counters so as to emulate weak memory ordering.
@@ -731,7 +731,7 @@ The first branch fetches the zero-th counter and sets \co{i} to 1 (so
 that line~\lnref{sum_other} will fetch the first counter), while the second
 branch does the opposite, fetching the first counter and setting \co{i}
 to 0 (so that line~\lnref{sum_other} will fetch the second counter).
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Is there a more straightforward way to code the \co{do-od} statement?
@@ -746,7 +746,7 @@ to 0 (so that line~\lnref{sum_other} will fetch the second counter).
 \label{lst:formal:QRCU Updater Process}
 \end{listing}
 
-\begin{lineref}[ln:formal:promela:qrcu:updater]
+\begin{fcvref}[ln:formal:promela:qrcu:updater]
 With the \co{sum_unordered} macro in place, we can now proceed
 to the update-side process shown in
 Listing~\ref{lst:formal:QRCU Updater Process}.
@@ -772,16 +772,16 @@ in the \co{readerprogress}
 array to those collected in the \co{readerstart} array,
 forcing an assertion failure should any readers that started before
 this update still be in progress.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:promela:qrcu:updater]
+	\begin{fcvref}[ln:formal:promela:qrcu:updater]
 	Why are there atomic blocks at \clnrefrange{atm1:b}{atm1:e}
 	and \clnrefrange{atm2:b}{atm2:e}, when the operations
 	within those atomic
 	blocks have no atomic implementation on any current
 	production microprocessor?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	Because those operations are for the benefit of the
 	assertion only.  They are not part of the algorithm itself.
@@ -791,11 +791,11 @@ this update still be in progress.
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:promela:qrcu:updater]
+	\begin{fcvref}[ln:formal:promela:qrcu:updater]
 	Is the re-summing of the counters on
         \clnrefrange{reinvoke:b}{reinvoke:e}
 	\emph{really} necessary?
-        \end{lineref}
+        \end{fcvref}
 \QuickQuizAnswer{
 	Yes.  To see this, delete these lines and run the model.
 
@@ -827,7 +827,7 @@ this update still be in progress.
 \label{lst:formal:QRCU Initialization Process}
 \end{listing}
 
-\begin{lineref}[ln:formal:promela:qrcu:init]
+\begin{fcvref}[ln:formal:promela:qrcu:init]
 All that remains is the initialization block shown in
 Listing~\ref{lst:formal:QRCU Initialization Process}.
 This block simply initializes the counter pair on
@@ -836,7 +836,7 @@ spawns the reader processes on
 \clnrefrange{spn_r:b}{spn_r:e}, and spawns the updater
 processes on \clnrefrange{spn_u:b}{spn_u:e}.
 This is all done within an atomic block to reduce state space.
-\end{lineref}
+\end{fcvref}
 
 \subsubsection{Running the QRCU Example}
 \label{sec:formal:Running the QRCU Example}
diff --git a/future/formalregress.tex b/future/formalregress.tex
index 8a4f3d2f..9bfcdd2d 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -233,13 +233,13 @@ The difference is not insignificant: At four processes, the model
 is more than two orders of magnitude faster than emulation!
 
 \QuickQuiz{}
-\begin{lineref}[ln:future:formalregress:C-SB+l-o-o-u+l-o-o-u-C:whole]
+\begin{fcvref}[ln:future:formalregress:C-SB+l-o-o-u+l-o-o-u-C:whole]
 	Why bother with a separate \co{filter} command on line~\lnref{filter_} of
 	\cref{lst:future:Emulating Locking with cmpxchg}
 	instead of just adding the condition to the \co{exists} clause?
 	And wouldn't it be simpler to use \co{xchg_acquire()} instead
 	of \co{cmpxchg_acquire()}?
-\end{lineref}
+\end{fcvref}
 \QuickQuizAnswer{
 	The \co{filter} clause causes the \co{herd} tool to discard
 	executions at an earlier stage of processing than does
diff --git a/future/htm.tex b/future/htm.tex
index 73a931fa..43fc5581 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -377,7 +377,7 @@ have on ease of use.
 	can fail in ways that would be quite surprising to most users.
 	To see this, consider the following transaction:
 
-\begin{linelabel}[ln:future:htm:debug rollbacks]
+\begin{fcvlabel}[ln:future:htm:debug rollbacks]
 \begin{VerbatimN}[commandchars=\\\[\]]
 begin_trans();
 if (a) {
@@ -389,13 +389,13 @@ if (a) {
 }
 end_trans();
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
-	\begin{lineref}[ln:future:htm:debug rollbacks]
+	\begin{fcvref}[ln:future:htm:debug rollbacks]
 	Suppose that the user sets a breakpoint at \clnref{another},
 	which triggers,
 	aborting the transaction and entering the debugger.
-	\end{lineref}
+	\end{fcvref}
 	Suppose that between the time that the breakpoint triggers
 	and the debugger gets around to stopping all the threads, some
 	other thread sets the value of \co{a} to zero.
@@ -681,7 +681,7 @@ semantics of locking, but loses locking's time-based messaging semantics.
 
 	The control thread's code is as follows:
 
-\begin{linelabel}[ln:future:htm:control thread]
+\begin{fcvlabel}[ln:future:htm:control thread]
 \begin{VerbatimN}[commandchars=\\\@\$]
 	for (;;) {
 		for_each_thread(t) {
@@ -698,15 +698,15 @@ semantics of locking, but loses locking's time-based messaging semantics.
 		/* Repurpose threads as needed. */
 	}
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
-	\begin{lineref}[ln:future:htm:control thread]
+	\begin{fcvref}[ln:future:htm:control thread]
 	\Clnref{if} uses the passage of time to deduce that the thread
 	has exited, executing \clnref{dep:b,dep:e} if so.
 	The empty lock-based critical section on \clnref{acq,rel}
 	guarantees that any thread in the process of exiting
 	completes (remember that locks are granted in FIFO order!).
-	\end{lineref}
+	\end{fcvref}
 
 	Once again, do not try this sort of thing on commodity
 	microprocessors.
@@ -733,7 +733,7 @@ high-priority process, which is the rationale for the name ``priority
 inversion.''
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:future:Exploiting Priority Boosting]
+\begin{fcvlabel}[ln:future:Exploiting Priority Boosting]
 \begin{VerbatimL}[commandchars=\\\@\$]
 void boostee(void)		\lnlbl@low:b$
 {
@@ -760,7 +760,7 @@ void booster(void)		\lnlbl@high:b$
 	}
 }                               \lnlbl@high:e$
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Exploiting Priority Boosting}
 \label{lst:future:Exploiting Priority Boosting}
 \end{listing}
@@ -772,7 +772,7 @@ boosting}.
 However, priority boosting can be used for things other than avoiding
 priority inversion, as shown in
 \cref{lst:future:Exploiting Priority Boosting}.
-\begin{lineref}[ln:future:Exploiting Priority Boosting]
+\begin{fcvref}[ln:future:Exploiting Priority Boosting]
 \Clnrefrange{low:b}{low:e} of this listing show a low-priority process that must
 nevertheless run every millisecond or so, while \clnrefrange{high:b}{high:e} of
 this same listing show a high-priority process that uses priority
@@ -781,7 +781,7 @@ boosting to ensure that \co{boostee()} runs periodically as needed.
 The \co{boostee()} function arranges this by always holding one of
 the two \co{boost_lock[]} locks, so that \clnrefrange{acq}{rel} of
 \co{booster()} can boost priority as needed.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	But the \co{boostee()} function in
@@ -798,7 +798,7 @@ the two \co{boost_lock[]} locks, so that \clnrefrange{acq}{rel} of
 	will flag this as a false positive.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:future:Exploiting Priority Boosting]
+\begin{fcvref}[ln:future:Exploiting Priority Boosting]
 This arrangement requires that \co{boostee()} acquire its first
 lock on \clnref{1stacq} before the system becomes busy, but this is easily
 arranged, even on modern hardware.
@@ -821,7 +821,7 @@ will become an empty transaction that has no effect, so that
 \co{boostee()} never runs.
 This example illustrates some of the subtle consequences of
 transactional memory's rollback-and-retry semantics.
-\end{lineref}
+\end{fcvref}
 
 Given that experience will likely uncover additional subtle semantic
 differences, application of HTM-based lock elision to large programs
diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index e9a57cdc..c075ee8d 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -8,7 +8,7 @@
 \epigraph{Existence precedes and rules essence.}{\emph{Jean-Paul Sartre}}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:locking:Per-Element Locking Without Existence Guarantees]
+\begin{fcvlabel}[ln:locking:Per-Element Locking Without Existence Guarantees]
 \begin{VerbatimL}[commandchars=\\\@\$]
 int delete(int key)
 {
@@ -26,7 +26,7 @@ int delete(int key)
 	return 1;				\lnlbl@return1$
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Per-Element Locking Without Existence Guarantees}
 \label{lst:locking:Per-Element Locking Without Existence Guarantees}
 \end{listing}
@@ -100,11 +100,11 @@ as shown in
 Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}.
 
 \QuickQuiz{}
-	\begin{lineref}[ln:locking:Per-Element Locking Without Existence Guarantees]
+	\begin{fcvref}[ln:locking:Per-Element Locking Without Existence Guarantees]
 	What if the element we need to delete is not the first element
 	of the list on line~\lnref{chk_first} of
 	Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}?
-        \end{lineref}
+        \end{fcvref}
 \QuickQuizAnswer{
 	This is a very simple hash table with no chaining, so the only
 	element in a given bucket is the first element.
@@ -116,7 +116,7 @@ Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}.
 	What race condition can occur in
 	Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}?
 \QuickQuizAnswer{
-	\begin{lineref}[ln:locking:Per-Element Locking Without Existence Guarantees]
+	\begin{fcvref}[ln:locking:Per-Element Locking Without Existence Guarantees]
 	Consider the following sequence of events:
 	\begin{enumerate}
 	\item	Thread~0 invokes \co{delete(0)}, and reaches line~\lnref{acq} of
@@ -137,11 +137,11 @@ Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}.
 	Because there is no existence guarantee, the identity of the
 	data element can change while a thread is attempting to acquire
 	that element's lock on line~\lnref{acq}!
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:locking:Per-Element Locking With Lock-Based Existence Guarantees]
+\begin{fcvlabel}[ln:locking:Per-Element Locking With Lock-Based Existence Guarantees]
 \begin{VerbatimL}[commandchars=\\\@\$]
 int delete(int key)
 {
@@ -163,12 +163,12 @@ int delete(int key)
 	return 1;
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Per-Element Locking With Lock-Based Existence Guarantees}
 \label{lst:locking:Per-Element Locking With Lock-Based Existence Guarantees}
 \end{listing}
 
-\begin{lineref}[ln:locking:Per-Element Locking With Lock-Based Existence Guarantees]
+\begin{fcvref}[ln:locking:Per-Element Locking With Lock-Based Existence Guarantees]
 One way to fix this example is to use a hashed set of global locks, so
 that each hash bucket has its own lock, as shown in
 Listing~\ref{lst:locking:Per-Element Locking With Lock-Based Existence Guarantees}.
@@ -185,4 +185,4 @@ implementations~\cite{Shavit95,DaveDice2006DISC}.
 However,
 Chapter~\ref{chp:Deferred Processing}
 describes simpler---and faster---ways of providing existence guarantees.
-\end{lineref}
+\end{fcvref}
diff --git a/locking/locking.tex b/locking/locking.tex
index 25dc6378..3c2949fa 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -405,20 +405,20 @@ been reached.
 \label{lst:locking:Concurrent List Iterator Usage}
 \end{listing}
 
-\begin{lineref}[ln:locking:locked_list:list_print:ints]
+\begin{fcvref}[ln:locking:locked_list:list_print:ints]
 Listing~\ref{lst:locking:Concurrent List Iterator Usage} shows how
 this list iterator may be used.
 \Clnrefrange{b}{e} define the \co{list_ints} element
 containing a single integer,
-\end{lineref}
-\begin{lineref}[ln:locking:locked_list:list_print:print]
+\end{fcvref}
+\begin{fcvref}[ln:locking:locked_list:list_print:print]
 and \clnrefrange{b}{e} show how to iterate over the list.
 Line~\lnref{start} locks the list and fetches a pointer to the first element,
 line~\lnref{entry} provides a pointer to our enclosing \co{list_ints} structure,
 line~\lnref{print} prints the corresponding integer, and
 line~\lnref{next} moves to the next element.
 This is quite simple, and hides all of the locking.
-\end{lineref}
+\end{fcvref}
 
 That is, the locking remains hidden as long as the code processing each
 list element does not itself acquire a lock that is held across some
@@ -495,16 +495,16 @@ both layers when passing a packet from one layer to another.
 Given that packets travel both up and down the protocol stack, this
 is an excellent recipe for deadlock, as illustrated in
 Listing~\ref{lst:locking:Protocol Layering and Deadlock}.
-\begin{lineref}[ln:locking:Protocol Layering and Deadlock]
+\begin{fcvref}[ln:locking:Protocol Layering and Deadlock]
 Here, a packet moving down the stack towards the wire must acquire
 the next layer's lock out of order.
 Given that packets moving up the stack away from the wire are acquiring
 the locks in order, the lock acquisition in line~\lnref{acq} of the listing
 can result in deadlock.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:locking:Protocol Layering and Deadlock]
+\begin{fcvlabel}[ln:locking:Protocol Layering and Deadlock]
 \begin{VerbatimL}[commandchars=\\\{\}]
 spin_lock(&lock2);
 layer_2_processing(pkt);
@@ -514,7 +514,7 @@ layer_1_processing(pkt);
 spin_unlock(&lock2);
 spin_unlock(&nextlayer->lock1);
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Protocol Layering and Deadlock}
 \label{lst:locking:Protocol Layering and Deadlock}
 \end{listing}
@@ -523,14 +523,14 @@ One way to avoid deadlocks in this case is to impose a locking hierarchy,
 but when it is necessary to acquire a lock out of order, acquire it
 conditionally, as shown in
 Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}.
-\begin{lineref}[ln:locking:Avoiding Deadlock Via Conditional Locking]
+\begin{fcvref}[ln:locking:Avoiding Deadlock Via Conditional Locking]
 Instead of unconditionally acquiring the layer-1 lock, line~\lnref{trylock}
 conditionally acquires the lock using the \co{spin_trylock()} primitive.
 This primitive acquires the lock immediately if the lock is available
 (returning non-zero), and otherwise returns zero without acquiring the lock.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:locking:Avoiding Deadlock Via Conditional Locking]
+\begin{fcvlabel}[ln:locking:Avoiding Deadlock Via Conditional Locking]
 \begin{VerbatimL}[commandchars=\\\[\]]
 retry:
 	spin_lock(&lock2);
@@ -550,7 +550,7 @@ retry:
 	spin_unlock(&lock2);
 	spin_unlock(&nextlayer->lock1);
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Avoiding Deadlock Via Conditional Locking}
 \label{lst:locking:Avoiding Deadlock Via Conditional Locking}
 \end{listing}
@@ -568,7 +568,7 @@ is mobile.\footnote{
 	And, in contrast to the 1900s, mobility is the common case.}
 Therefore, line~\lnref{recheck} must recheck the decision, and if it has changed,
 must release the locks and start over.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Can the transformation from
@@ -826,7 +826,7 @@ This example's beauty hides an ugly livelock.
 To see this, consider the following sequence of events:
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:locking:Abusing Conditional Locking]
+\begin{fcvlabel}[ln:locking:Abusing Conditional Locking]
 \begin{VerbatimL}[commandchars=\\\[\]]
 void thread1(void)
 {
@@ -856,12 +856,12 @@ retry:					\lnlbl[thr2:retry]
 	spin_unlock(&lock2);
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Abusing Conditional Locking}
 \label{lst:locking:Abusing Conditional Locking}
 \end{listing}
 
-\begin{lineref}[ln:locking:Abusing Conditional Locking]
+\begin{fcvref}[ln:locking:Abusing Conditional Locking]
 \begin{enumerate}
 \item	Thread~1 acquires \co{lock1} on line~\lnref{thr1:acq1}, then invokes
 	\co{do_one_thing()}.
@@ -877,7 +877,7 @@ retry:					\lnlbl[thr2:retry]
 	and jumps to \co{retry} at line~\lnref{thr2:retry}.
 \item	The livelock dance repeats from the beginning.
 \end{enumerate}
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	How can the livelock shown in
@@ -913,7 +913,7 @@ a group of threads starves, rather than just one of them.\footnote{
 	names doesn't fix bugs.}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:locking:Conditional Locking and Exponential Backoff]
+\begin{fcvlabel}[ln:locking:Conditional Locking and Exponential Backoff]
 \begin{VerbatimL}[commandchars=\\\[\]]
 void thread1(void)
 {
@@ -949,7 +949,7 @@ retry:
 	spin_unlock(&lock2);
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Conditional Locking and Exponential Backoff}
 \label{lst:locking:Conditional Locking and Exponential Backoff}
 \end{listing}
@@ -1552,7 +1552,7 @@ a function named \co{do_force_quiescent_state()} is invoked, but this
 function should be invoked at most once every 100\,milliseconds.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:locking:Conditional Locking to Reduce Contention]
+\begin{fcvlabel}[ln:locking:Conditional Locking to Reduce Contention]
 \begin{VerbatimL}[commandchars=\\\[\]]
 void force_quiescent_state(struct rcu_node *rnp_leaf)
 {
@@ -1578,7 +1578,7 @@ void force_quiescent_state(struct rcu_node *rnp_leaf)
 	raw_spin_unlock(&rnp_old->fqslock);		\lnlbl[rel2]
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Conditional Locking to Reduce Contention}
 \label{lst:locking:Conditional Locking to Reduce Contention}
 \end{listing}
@@ -1595,7 +1595,7 @@ painlessly as possible) give up and leave.
 Furthermore, if \co{do_force_quiescent_state()} has been invoked within
 the past 100\,milliseconds, there is no need to invoke it again.
 
-\begin{lineref}[ln:locking:Conditional Locking to Reduce Contention]
+\begin{fcvref}[ln:locking:Conditional Locking to Reduce Contention]
 To this end, each pass through the loop spanning \clnrefrange{loop:b}{loop:e} attempts
 to advance up one level in the \co{rcu_node} hierarchy.
 If the \co{gp_flags} variable is already set (line~\lnref{flag_set}) or if the attempt
@@ -1620,7 +1620,7 @@ line~\lnref{set_flag} sets \co{gp_flags} to one, line~\lnref{invoke} invokes
 and line~\lnref{clr_flag} resets \co{gp_flags} back to zero.
 Either way, line~\lnref{rel2} releases the root \co{rcu_node} structure's
 \co{->fqslock}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	The code in
@@ -1636,13 +1636,13 @@ Either way, line~\lnref{rel2} releases the root \co{rcu_node} structure's
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	\begin{lineref}[ln:locking:Conditional Locking to Reduce Contention]
+	\begin{fcvref}[ln:locking:Conditional Locking to Reduce Contention]
 	Wait a minute!
 	If we ``win'' the tournament on line~\lnref{flag_not_set} of
 	Listing~\ref{lst:locking:Conditional Locking to Reduce Contention},
 	we get to do all the work of \co{do_force_quiescent_state()}.
 	Exactly how is that a win, really?
-        \end{lineref}
+        \end{fcvref}
 \QuickQuizAnswer{
 	How indeed?
 	This just shows that in concurrency, just as in life, one
@@ -1679,14 +1679,14 @@ environments.
 \subsection{Sample Exclusive-Locking Implementation Based on Atomic Exchange}
 \label{sec:locking:Sample Exclusive-Locking Implementation Based on Atomic Exchange}
 
-\begin{lineref}[ln:locking:xchglock:lock_unlock]
+\begin{fcvref}[ln:locking:xchglock:lock_unlock]
 This section reviews the implementation shown in
 listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}.
 The data structure for this lock is just an \co{int}, as shown on
 line~\lnref{typedef}, but could be any integral type.
 The initial value of this lock is zero, meaning ``unlocked'',
 as shown on line~\lnref{initval}.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/locking/xchglock@lock_unlock.fcv}
@@ -1695,18 +1695,18 @@ as shown on line~\lnref{initval}.
 \end{listing}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:locking:xchglock:lock_unlock]
+	\begin{fcvref}[ln:locking:xchglock:lock_unlock]
 	Why not rely on the C language's default initialization of
 	zero instead of using the explicit initializer shown on
 	line~\lnref{initval} of
 	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	Because this default initialization does not apply to locks
 	allocated as auto variables within the scope of a function.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:locking:xchglock:lock_unlock:lock]
+\begin{fcvref}[ln:locking:xchglock:lock_unlock:lock]
 Lock acquisition is carried out by the \co{xchg_lock()} function
 shown on \clnrefrange{b}{e}.
 This function uses a nested loop, with the outer loop repeatedly
@@ -1716,17 +1716,17 @@ If the old value was already the value one (in other words, someone
 else already holds the lock), then the inner loop (\clnrefrange{inner:b}{inner:e})
 spins until the lock is available, at which point the outer loop
 makes another attempt to acquire the lock.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:locking:xchglock:lock_unlock:lock]
+	\begin{fcvref}[ln:locking:xchglock:lock_unlock:lock]
 	Why bother with the inner loop on \clnrefrange{inner:b}{inner:e} of
 	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
 	Why not simply repeatedly do the atomic exchange operation
 	on line~\lnref{atmxchg}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:locking:xchglock:lock_unlock:lock]
+	\begin{fcvref}[ln:locking:xchglock:lock_unlock:lock]
 	Suppose that the lock is held and that several threads
 	are attempting to acquire the lock.
 	In this situation, if these threads all loop on the atomic
@@ -1737,21 +1737,21 @@ makes another attempt to acquire the lock.
 	loop on \clnrefrange{inner:b}{inner:e},
         they will each spin within their own
 	caches, putting negligible load on the interconnect.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
-\begin{lineref}[ln:locking:xchglock:lock_unlock:unlock]
+\begin{fcvref}[ln:locking:xchglock:lock_unlock:unlock]
 Lock release is carried out by the \co{xchg_unlock()} function
 shown on \clnrefrange{b}{e}.
 Line~\lnref{atmxchg} atomically exchanges the value zero (``unlocked'') into
 the lock, thus marking it as having been released.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:locking:xchglock:lock_unlock:unlock]
+	\begin{fcvref}[ln:locking:xchglock:lock_unlock:unlock]
 	Why not simply store zero into the lock word on line~\lnref{atmxchg} of
 	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	This can be a legitimate implementation, but only if
 	this store is preceded by a memory barrier and makes use
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 034413b5..01355730 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -244,12 +244,12 @@ shown in the store-buffering litmus test in
 shows how this memory misordering can happen.
 Row~1 shows the initial state, where CPU~0 has \co{x1} in its cache
 and CPU~1 has \co{x0} in its cache, both variables having a value of zero.
-\begin{lineref}[ln:formal:C-SB+o-o+o-o:whole]
+\begin{fcvref}[ln:formal:C-SB+o-o+o-o:whole]
 Row~2 shows the state change due to each CPU's store (\clnref{st0,st1} of
 \cref{lst:memorder:Memory Misordering: Store-Buffering Litmus Test}).
 Because neither CPU has the stored-to variable in its cache, both CPUs
 record their stores in their respective store buffers.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	But wait!!!
@@ -267,13 +267,13 @@ record their stores in their respective store buffers.
 	\cref{sec:memorder:Variables With Multiple Values}!
 } \QuickQuizEnd
 
-\begin{lineref}[ln:formal:C-SB+o-o+o-o:whole]
+\begin{fcvref}[ln:formal:C-SB+o-o+o-o:whole]
 Row~3 shows the two loads (\clnref{ld0,ld1} of
 \cref{lst:memorder:Memory Misordering: Store-Buffering Litmus Test}).
 Because the variable being loaded by each CPU is in that CPU's cache,
 each load immediately returns the cached value, which in both cases
 is zero.
-\end{lineref}
+\end{fcvref}
 
 But the CPUs are not done yet: Sooner or later, they must empty their
 store buffers.
@@ -717,7 +717,7 @@ access X1.
 	rest of this chapter.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:formal:C-SB+o-mb-o+o-mb-o:whole]
+\begin{fcvref}[ln:formal:C-SB+o-mb-o+o-mb-o:whole]
 \Cref{lst:memorder:Memory Ordering: Store-Buffering Litmus Test}
 is a case in point.
 The \co{smp_mb()} on \clnref{P0:mb,P1:mb} serve as the barriers,
@@ -735,7 +735,7 @@ to end up with the value two \emph{only if}
 \co{P0()}'s local variable \co{r2} ends up with the value zero.
 This underscores the point that memory ordering guarantees are
 conditional, not absolute.
-\end{lineref}
+\end{fcvref}
 
 Although
 \cref{fig:memorder:Memory Barriers Provide Conditional If-Then Ordering}
@@ -833,7 +833,7 @@ Hopefully, you already started to say ``goodbye'' in response to row~2 of
 tab:memorder:Memory Ordering: Store-Buffering Sequence of Events},
 and if so, the purpose of this section is to drive this point home.
 
-\begin{lineref}[ln:memorder:Software Logic Analyzer]
+\begin{fcvref}[ln:memorder:Software Logic Analyzer]
 To this end, consider the program fragment shown in
 \cref{lst:memorder:Software Logic Analyzer}.
 This code fragment is executed in parallel by several CPUs.
@@ -846,7 +846,7 @@ records the length of
 time that the variable retains the value that this CPU assigned to it.
 Of course, one of the CPUs will ``win'', and would thus never exit
 the loop if not for the check on \clnrefrange{iftmout}{break}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	What assumption is the code fragment
@@ -864,7 +864,7 @@ the loop if not for the check on \clnrefrange{iftmout}{break}.
 } \QuickQuizEnd
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:memorder:Software Logic Analyzer]
+\begin{fcvlabel}[ln:memorder:Software Logic Analyzer]
 \begin{VerbatimL}[commandchars=\\\[\]]
 state.variable = mycpu;			\lnlbl[setid]
 lasttb = oldtb = firsttb = gettb();	\lnlbl[init]
@@ -875,7 +875,7 @@ while (state.variable == mycpu) {	\lnlbl[loop:b]
 		break;			\lnlbl[break]
 }					\lnlbl[loop:e]
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Software Logic Analyzer}
 \label{lst:memorder:Software Logic Analyzer}
 \end{listing}
@@ -1026,7 +1026,7 @@ loads and stores.
 \subsubsection{Load Followed By Load}
 \label{sec:memorder:Load Followed By Load}
 
-\begin{lineref}[ln:formal:C-MP+o-wmb-o+o-o:whole]
+\begin{fcvref}[ln:formal:C-MP+o-wmb-o+o-o:whole]
 \Cref{lst:memorder:Message-Passing Litmus Test (No Ordering)}
 (\path{C-MP+o-wmb-o+o-o.litmus})
 shows the classic \emph{message-passing} litmus test, where \co{x0} is
@@ -1039,7 +1039,7 @@ However, weakly ordered architectures often do
 not~\cite{JadeAlglave2011ppcmem}.
 Therefore, the \co{exists} clause on \clnref{exists} of the listing \emph{can}
 trigger.
-\end{lineref}
+\end{fcvref}
 
 One rationale for reordering loads from different locations is that doing
 so allows execution to proceed when an earlier load misses the cache,
@@ -1068,14 +1068,14 @@ but the values for later loads are already present.
 \label{lst:memorder:Enforcing Order of Message-Passing Litmus Test}
 \end{listing}
 
-\begin{lineref}[ln:formal:C-MP+o-wmb-o+o-rmb-o:whole]
+\begin{fcvref}[ln:formal:C-MP+o-wmb-o+o-rmb-o:whole]
 Thus, portable code relying on ordered loads must
 add explicit ordering, for example, the \co{smp_rmb()} shown on
 \clnref{rmb} of
 \cref{lst:memorder:Enforcing Order of Message-Passing Litmus Test}
 (\path{C-MP+o-wmb-o+o-rmb-o.litmus}), which prevents
 the \co{exists_} clause from triggering.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/formal/litmus/C-LB+o-o+o-o@whole.fcv}
@@ -1086,7 +1086,7 @@ the \co{exists_} clause from triggering.
 \subsubsection{Load Followed By Store}
 \label{sec:memorder:Load Followed By Store}
 
-\begin{lineref}[ln:formal:C-LB+o-o+o-o:whole]
+\begin{fcvref}[ln:formal:C-LB+o-o+o-o:whole]
 \Cref{lst:memorder:Load-Buffering Litmus Test (No Ordering)}
 (\path{C-LB+o-o+o-o.litmus})
 shows the classic \emph{load-buffering} litmus test.
@@ -1095,7 +1095,7 @@ or the IBM Mainframe do not reorder prior loads with subsequent stores,
 more weakly ordered architectures really do allow such
 reordering~\cite{JadeAlglave2011ppcmem}.
 Therefore, the \co{exists} clause on \clnref{exists} really can trigger.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/formal/litmus/C-LB+o-r+a-o@whole.fcv}
@@ -1103,7 +1103,7 @@ Therefore, the \co{exists} clause on \clnref{exists} really can trigger.
 \label{lst:memorder:Enforcing Ordering of Load-Buffering Litmus Test}
 \end{listing}
 
-\begin{lineref}[ln:formal:C-LB+o-r+a-o:whole]
+\begin{fcvref}[ln:formal:C-LB+o-r+a-o:whole]
 Although it is rare for actual hardware to
 exhibit this reordering~\cite{LucMaranget2017aarch64},
 one situation where it might be desirable to do so is when a load
@@ -1115,7 +1115,7 @@ as shown in
 (\path{C-LB+o-r+a-o.litmus}).
 The \co{smp_store_release()} and \co{smp_load_acquire()} guarantee that
 the \co{exists} clause on \clnref{exists} never triggers.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o@whole.fcv}
@@ -1171,7 +1171,7 @@ instruction.
 \label{lst:memorder:Message-Passing Address-Dependency Litmus Test (No Ordering Before v4.15)}
 \end{listing}
 
-\begin{lineref}[ln:formal:C-MP+o-wmb-o+o-addr-o:whole]
+\begin{fcvref}[ln:formal:C-MP+o-wmb-o+o-addr-o:whole]
 \Cref{lst:memorder:Message-Passing Address-Dependency Litmus Test (No Ordering Before v4.15)}
 (\path{C-MP+o-wmb-o+o-addr-o.litmus})
 shows a linked variant of the message-passing pattern.
@@ -1187,14 +1187,14 @@ There is thus an address dependency from the load on \clnref{P1:x1} to the
 load on \clnref{P1:ref}.
 In this case, the value returned by \clnref{P1:x1} is exactly the address
 used by \clnref{P1:ref}, but many variations are possible,
-\end{lineref}
+\end{fcvref}
 including field access using the C-language \co{->} operator,
 addition, subtraction, and array indexing.\footnote{
 	But note that in the Linux kernel, the address dependency must
 	be carried through the pointer to the array, not through the
 	array index.}
 
-\begin{lineref}[ln:formal:C-MP+o-wmb-o+o-addr-o:whole]
+\begin{fcvref}[ln:formal:C-MP+o-wmb-o+o-addr-o:whole]
 One might hope that \clnref{P1:x1}'s load from the head pointer would be ordered
 before \clnref{P1:ref}'s dereference, which is in fact the case on Linux v4.15
 and later.
@@ -1204,10 +1204,10 @@ in more detail in \cref{sec:memorder:Alpha}.
 Therefore, on older versions of Linux,
 \cref{lst:memorder:Message-Passing Address-Dependency Litmus Test (No Ordering Before v4.15)}'s
 \co{exists} clause \emph{can} trigger.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
+\begin{fcvlabel}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
 \begin{VerbatimL}[commandchars=\@\[\]]
 C C-MP+o-wmb-o+ld-addr-o
 
@@ -1236,12 +1236,12 @@ P1(int** x1) {
 
 exists (1:r2=x0 /\ 1:r3=1)
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}
 \label{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}
 \end{listing}
 
-\begin{lineref}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
+\begin{fcvref}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
 \Cref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}
 % \path{C-MP+o-wmb-o+ld-addr-o.litmus} available at commit bc4b1c3f3b35
 % ("styleguide: Loosen restriction on comment in litmus test")
@@ -1255,7 +1255,7 @@ which acts like \co{READ_ONCE()} on all platforms other than DEC Alpha,
 where it acts like a \co{READ_ONCE()} followed by an \co{smp_mb()},
 thereby forcing the required ordering on all platforms, in turn
 preventing the \co{exists} clause from triggering.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o@whole.fcv}
@@ -1263,7 +1263,7 @@ preventing the \co{exists} clause from triggering.
 \label{lst:memorder:S Address-Dependency Litmus Test}
 \end{listing}
 
-\begin{lineref}[ln:formal:C-S+o-wmb-o+o-addr-o:whole]
+\begin{fcvref}[ln:formal:C-S+o-wmb-o+o-addr-o:whole]
 But what happens if the dependent operation is a store rather than
 a load, for example, in the \emph{S}
 litmus test~\cite{JadeAlglave2011ppcmem} shown in
@@ -1274,7 +1274,7 @@ it is not possible for the \co{WRITE_ONCE()} on \clnref{P0:x0} to overwrite
 the \co{WRITE_ONCE()} on \clnref{P1:r2}, meaning that the \co{exists}
 clause on \clnref{exists} cannot trigger, even on DEC Alpha, even
 in pre-v4.15 Linux kernels.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	But how do we know that \emph{all} platforms really avoid
@@ -1287,21 +1287,21 @@ in pre-v4.15 Linux kernels.
 	(2)~Weakly ordered platforms, and
 	(3)~DEC Alpha.
 
-	\begin{lineref}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
+	\begin{fcvref}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
 	The TSO platforms order all pairs of memory references except for
 	prior stores against later loads.
 	Because the address dependency on \clnref{deref,read} of
 	\cref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}
 	is instead a load followed by another load, TSO platforms preserve
 	this address dependency.
-	\end{lineref}
-	\begin{lineref}[ln:formal:C-S+o-wmb-o+o-addr-o:whole]
+	\end{fcvref}
+	\begin{fcvref}[ln:formal:C-S+o-wmb-o+o-addr-o:whole]
 	They also preserve the address dependency on \clnref{P1:x1,P1:r2} of
 	\cref{lst:memorder:S Address-Dependency Litmus Test}
 	because this is a load followed by a store.
 	Because address dependencies must start with a load, TSO platforms
 	implicitly but completely respect them.
-	\end{lineref}
+	\end{fcvref}
 
 	Weakly ordered platforms don't necessarily maintain ordering of
 	unrelated accesses.
@@ -1312,7 +1312,7 @@ in pre-v4.15 Linux kernels.
 	The hardware tracks dependencies and maintains the needed
 	ordering.
 
-	\begin{lineref}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
+	\begin{fcvref}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
 	There is one (famous) exception to this rule for weakly ordered
 	platforms, and that exception is DEC Alpha for load-to-load
 	address dependencies.
@@ -1320,14 +1320,14 @@ in pre-v4.15 Linux kernels.
 	requires the explicit memory barrier supplied for it by the
 	now-obsolete \co{lockless_dereference()} on \clnref{deref} of
 	\cref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}.
-	\end{lineref}
-	\begin{lineref}[ln:formal:C-S+o-wmb-o+o-addr-o:whole]
+	\end{fcvref}
+	\begin{fcvref}[ln:formal:C-S+o-wmb-o+o-addr-o:whole]
 	However, DEC Alpha does track load-to-store address dependencies,
 	which is why \clnref{P1:x1} of
 	\cref{lst:memorder:S Address-Dependency Litmus Test}
 	does not need a \co{lockless_dereference()}, even in Linux
 	kernels predating v4.15.
-	\end{lineref}
+	\end{fcvref}
 
 	To sum up, current platforms either respect address dependencies
 	implicitly, as is the case for TSO platforms (x86, mainframe,
@@ -1371,7 +1371,7 @@ instruction, that would instead be an address dependency.
 \label{lst:memorder:Load-Buffering Data-Dependency Litmus Test}
 \end{listing}
 
-\begin{lineref}[ln:formal:C-LB+o-r+o-data-o:whole]
+\begin{fcvref}[ln:formal:C-LB+o-r+o-data-o:whole]
 \Cref{lst:memorder:Load-Buffering Data-Dependency Litmus Test}
 (\path{C-LB+o-r+o-data-o.litmus})
 is similar to
@@ -1381,7 +1381,7 @@ enforced not by an acquire load, but instead by a data dependency:
 The value loaded by \clnref{ld} is what \clnref{st} stores.
 The ordering provided by this data dependency is sufficient to prevent
 the \co{exists} clause from triggering.
-\end{lineref}
+\end{fcvref}
 
 Just as with address dependencies, data dependencies are
 fragile and can be easily broken by compiler optimizations, as discussed in
@@ -1400,7 +1400,7 @@ substitute the constant zero for the value loaded, thus breaking
 the dependency.
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:C-LB+o-r+o-data-o:whole]
+	\begin{fcvref}[ln:formal:C-LB+o-r+o-data-o:whole]
 	But wait!!!
 	\Clnref{ld} of
 	\cref{lst:memorder:Load-Buffering Data-Dependency Litmus Test}
@@ -1409,7 +1409,7 @@ the dependency.
 	instruction even if the value is later multiplied by zero.
 	So do you really need to work so hard to keep the compiler from
 	breaking your data dependencies?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	Yes, the compiler absolutely must emit a load instruction for
 	a volatile load.
@@ -1441,14 +1441,14 @@ load-to-load control dependencies.
 \label{lst:memorder:Load-Buffering Control-Dependency Litmus Test}
 \end{listing}
 
-\begin{lineref}[ln:formal:C-LB+o-r+o-ctrl-o:whole]
+\begin{fcvref}[ln:formal:C-LB+o-r+o-ctrl-o:whole]
 \Cref{lst:memorder:Load-Buffering Control-Dependency Litmus Test}
 (\path{C-LB+o-r+o-ctrl-o.litmus})
 shows another load-buffering example, this time using a control
 dependency (\clnref{if}) to order the load on \clnref{ld} and the store on
 \clnref{st}.
 The ordering is sufficient to prevent the \co{exists} from triggering.
-\end{lineref}
+\end{fcvref}
 
 However, control dependencies are even more susceptible to being optimized
 out of existence than are data dependencies, and
@@ -1462,7 +1462,7 @@ your compiler from breaking your control dependencies.
 \label{lst:memorder:Message-Passing Control-Dependency Litmus Test (No Ordering)}
 \end{listing}
 
-\begin{lineref}[ln:formal:C-MP+o-r+o-ctrl-o:whole]
+\begin{fcvref}[ln:formal:C-MP+o-r+o-ctrl-o:whole]
 It is worth reiterating that control dependencies provide ordering only
 from loads to stores.
 Therefore, the load-to-load control dependency shown on \clnrefrange{ld1}{ld2} of
@@ -1470,7 +1470,7 @@ Therefore, the load-to-load control dependency shown on \clnrefrange{ld1}{ld2} o
 (\path{C-MP+o-r+o-ctrl-o.litmus})
 does \emph{not} provide ordering, and therefore does \emph{not}
 prevent the \co{exists} clause from triggering.
-\end{lineref}
+\end{fcvref}
 
 In summary, control dependencies can be useful, but they are
 high-maintenance items.
@@ -1509,7 +1509,7 @@ interchangeably.
 \label{lst:memorder:Cache-Coherent IRIW Litmus Test}
 \end{listing}
 
-\begin{lineref}[ln:formal:C-CCIRIW+o+o+o-o+o-o:whole]
+\begin{fcvref}[ln:formal:C-CCIRIW+o+o+o-o+o-o:whole]
 \cref{lst:memorder:Cache-Coherent IRIW Litmus Test}
 (\path{C-CCIRIW+o+o+o-o+o-o.litmus})
 shows a litmus test that tests for cache coherence,
@@ -1523,7 +1523,7 @@ came first, then \co{P3()} had better not believe that
 \co{P1()}'s store came first.
 And in fact the \co{exists} clause on \clnref{exists} will trigger if this
 situation arises.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	But in
@@ -1610,7 +1610,7 @@ This in turn avoids abysmal performance.
 	(\path{C-MP-OMCA+o-o-o+o-rmb-o.litmus})
 	shows such a test.
 
-	\begin{lineref}[ln:formal:C-MP-OMCA+o-o-o+o-rmb-o:whole]
+	\begin{fcvref}[ln:formal:C-MP-OMCA+o-o-o+o-rmb-o:whole]
 	On a multicopy-atomic platform, \co{P0()}'s store to \co{x} on
 	\clnref{P0:st} must become visible to both \co{P0()} and \co{P1()}
 	simultaneously.
@@ -1624,7 +1624,7 @@ This in turn avoids abysmal performance.
 	in order.
 	Therefore, the \co{exists} clause on \clnref{exists} cannot trigger on a
 	multicopy-atomic platform.
-	\end{lineref}
+	\end{fcvref}
 
 	In contrast, on an other-multicopy-atomic platform, \co{P0()}
 	could see its own store early, so that there would be no constraint
@@ -1643,7 +1643,7 @@ must deal with them.
 \label{lst:memorder:WRC Litmus Test With Dependencies (No Ordering)}
 \end{listing}
 
-\begin{lineref}[ln:formal:C-WRC+o+o-data-o+o-rmb-o:whole]
+\begin{fcvref}[ln:formal:C-WRC+o+o-data-o+o-rmb-o:whole]
 \Cref{lst:memorder:WRC Litmus Test With Dependencies (No Ordering)}
 (\path{C-WRC+o+o-data-o+o-rmb-o.litmus})
 demonstrates multicopy atomicity, that is, on a multicopy-atomic platform,
@@ -1660,7 +1660,7 @@ different threads at different times.
 In particular, \co{P0()}'s store might reach \co{P1()} long before it
 reaches \co{P2()}, which raises the possibility that \co{P1()}'s store
 might reach \co{P2()} before \co{P0()}'s store does.
-\end{lineref}
+\end{fcvref}
 
 \begin{figure}[tb]
 \centering
@@ -1763,7 +1763,7 @@ This sequence of events will depend critically on \co{P0()} and
 	notions of fairness.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:formal:C-WRC+o+o-data-o+o-rmb-o:whole]
+\begin{fcvref}[ln:formal:C-WRC+o+o-data-o+o-rmb-o:whole]
 Row~1 shows the initial state, with the initial value of \co{y} in
 \co{P0()}'s and \co{P1()}'s shared cache, and the initial value of \co{x} in
 \co{P2()}'s cache.
@@ -1810,10 +1810,10 @@ The values of \co{r1} and \co{r2} are both the value one, and
 the final value of \co{r3} the value zero.
 This strange result occurred because \co{P0()}'s new value of \co{x} was
 communicated to \co{P1()} long before it was communicated to \co{P2()}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:C-WRC+o+o-data-o+o-rmb-o:whole]
+	\begin{fcvref}[ln:formal:C-WRC+o+o-data-o+o-rmb-o:whole]
 	Referring to
 	\cref{tab:memorder:Memory Ordering: WRC Sequence of Events},
 	why on earth would \co{P0()}'s store take so long to complete when
@@ -1821,7 +1821,7 @@ communicated to \co{P1()} long before it was communicated to \co{P2()}.
 	In other words, does the \co{exists} clause on \clnref{exists} of
 	\cref{lst:memorder:WRC Litmus Test With Dependencies (No Ordering)}
 	really trigger on real systems?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	You need to face the fact that it really can trigger.
 	Akira Yokosawa used the \co{litmus7} tool to run this litmus test
@@ -1868,7 +1868,7 @@ Therefore,
 substitutes a release operation for
 \cref{lst:memorder:WRC Litmus Test With Dependencies (No Ordering)}'s
 data dependency.
-\begin{lineref}[ln:formal:C-WRC+o+o-r+a-o:whole]
+\begin{fcvref}[ln:formal:C-WRC+o+o-r+a-o:whole]
 Because the release operation is cumulative, its ordering applies not only to
 \cref{lst:memorder:WRC Litmus Test With Release}'s
 load from \co{x} by \co{P1()} on \clnref{P1:x}, but also to the store to \co{x}
@@ -1878,7 +1878,7 @@ This means that \co{P2()}'s load-acquire suffices to force the
 load from \co{x} on \clnref{P2:x} to happen after the store on \clnref{P0:x}, so
 the value returned is one, which does not match \co{2:r3=0}, which
 in turn prevents the \co{exists} clause from triggering.
-\end{lineref}
+\end{fcvref}
 
 \begin{figure*}[htbp]
 \centering
@@ -1887,7 +1887,7 @@ in turn prevents the \co{exists} clause from triggering.
 \label{fig:memorder:Cumulativity}
 \end{figure*}
 
-\begin{lineref}[ln:formal:C-WRC+o+o-r+a-o:whole]
+\begin{fcvref}[ln:formal:C-WRC+o+o-r+a-o:whole]
 These ordering constraints are depicted graphically in
 \cref{fig:memorder:Cumulativity}.
 Note also that cumulativity is not limited to a single step back in time.
@@ -1895,7 +1895,7 @@ If there was another load from \co{x} or store to \co{x} from any thread
 that came before the store on \clnref{P0:x}, that prior load or store would also
 be ordered before the load on \clnref{P2:x}, though only if both \co{r1} and
 \co{r2} both end up containing the value \co{1}.
-\end{lineref}
+\end{fcvref}
 
 In short, use of cumulative ordering operations can suppress
 non-multicopy-atomic behaviors in some situations.
@@ -1904,7 +1904,7 @@ Cumulativity nevertheless has limits, which are examined in the next section.
 \subsubsection{Propagation}
 \label{sec:memorder:Propagation}
 
-\begin{lineref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
+\begin{fcvref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
 \Cref{lst:memorder:W+RWC Litmus Test With Release (No Ordering)}
 (\path{C-W+RWC+o-r+a-o+o-mb-o.litmus})
 shows the limitations of cumulativity and store-release,
@@ -1915,7 +1915,7 @@ order \co{P2()}'s load on \clnref{P2:ld}, the \co{smp_store_release()}'s
 ordering cannot propagate through the combination of \co{P1()}'s
 load (\clnref{P1:ld}) and \co{P2()}'s store (\clnref{P2:st}).
 This means that the \co{exists} clause on \clnref{exists} really can trigger.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o@whole.fcv}
@@ -1935,7 +1935,7 @@ This means that the \co{exists} clause on \clnref{exists} really can trigger.
 %
 	Wrong.
 
-	\begin{lineref}[ln:formal:C-R+o-wmb-o+o-mb-o:whole]
+	\begin{fcvref}[ln:formal:C-R+o-wmb-o+o-mb-o:whole]
 	\Cref{lst:memorder:R Litmus Test With Write Memory Barrier (No Ordering)}
 	(\path{C-R+o-wmb-o+o-mb-o.litmus})
 	shows a two-thread litmus test that requires propagation due to
@@ -1948,7 +1948,7 @@ This means that the \co{exists} clause on \clnref{exists} really can trigger.
 	To prevent this triggering, the \co{smp_wmb()} on \clnref{wmb}
 	must become an \co{smp_mb()}, bringing propagation into play
 	twice, once for each non-temporal link.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 \QuickQuizLabel{\MemorderQQLitmusTestR}
@@ -1979,7 +1979,7 @@ also shows the limitations of memory-barrier pairing, given that
 there are not two but three processes.
 These more complex litmus tests can instead be said to have \emph{cycles},
 where memory-barrier pairing is the special case of a two-thread cycle.
-\begin{lineref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
+\begin{fcvref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
 The cycle in
 \cref{lst:memorder:W+RWC Litmus Test With Release (No Ordering)}
 goes through \co{P0()} (\clnref{P0:st,P0:sr}), \co{P1()} (\clnref{P1:la,P1:ld}),
@@ -1996,7 +1996,7 @@ In this case, the fact that the \co{exists} clause can trigger means that
 the cycle is said to be \emph{allowed}.
 In contrast, in cases where the \co{exists} clause cannot trigger,
 the cycle is said to be \emph{prohibited}.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o@whole.fcv}
@@ -2004,27 +2004,27 @@ the cycle is said to be \emph{prohibited}.
 \label{lst:memorder:W+WRC Litmus Test With More Barriers}
 \end{listing}
 
-\begin{lineref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
+\begin{fcvref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
 But what if we need to keep the \co{exists} clause on \clnref{exists} of
 \cref{lst:memorder:W+RWC Litmus Test With Release (No Ordering)}?
 One solution is to replace \co{P0()}'s \co{smp_store_release()}
 with an \co{smp_mb()}, which
 \cref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}
 shows to have not only cumulativity, but also propagation.
-\end{lineref}
+\end{fcvref}
 The result is shown in
 \cref{lst:memorder:W+WRC Litmus Test With More Barriers}
 (\path{C-W+RWC+o-mb-o+a-o+o-mb-o.litmus}).
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
+	\begin{fcvref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
 	But given that \co{smp_mb()} has the propagation property,
 	why doesn't the \co{smp_mb()} on \clnref{P2:mb} of
 	\cref{lst:memorder:W+RWC Litmus Test With Release (No Ordering)}
 	prevent the \co{exists} clause from triggering?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
+	\begin{fcvref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
 	As a rough rule of thumb, the \co{smp_mb()} barrier's
 	propagation property is sufficient to maintain ordering
 	through only one load-to-store link between
@@ -2039,7 +2039,7 @@ The result is shown in
 	Therefore, preventing the \co{exists} clause from triggering
 	should be expected to require not one but two
 	instances of \co{smp_mb()}.
-	\end{lineref}
+	\end{fcvref}
 
 	As a special exception to this rule of thumb, a release-acquire
 	chain can have one load-to-store link between processes
@@ -2081,7 +2081,7 @@ This should not come as a surprise to anyone who carefully examined
 	considered a great gift from the relevant laws of physics
 	and cache-coherency-protocol mathematics.
 
-	\begin{lineref}[ln:formal:C-2+2W+o-wmb-o+o-wmb-o:whole]
+	\begin{fcvref}[ln:formal:C-2+2W+o-wmb-o+o-wmb-o:whole]
 	Unfortunately, no one has been able to come up with a software use
 	case for this gift that does not have a much better alternative
 	implementation.
@@ -2090,7 +2090,7 @@ This should not come as a surprise to anyone who carefully examined
 	\cref{lst:memorder:2+2W Litmus Test With Write Barriers}.
 	This means that the \co{exists} clause on \clnref{exists} can
 	trigger.
-	\end{lineref}
+	\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/formal/litmus/C-2+2W+o-o+o-o@whole.fcv}
@@ -2196,7 +2196,7 @@ shows a three-step release-acquire chain, but where \co{P3()}'s
 final access is a \co{READ_ONCE()} from \co{x0}, which is
 accessed via \co{WRITE_ONCE()} by \co{P0()}, forming a non-temporal
 load-to-store link between these two processes.
-\begin{lineref}[ln:formal:litmus:C-ISA2+o-r+a-r+a-r+a-o:whole]
+\begin{fcvref}[ln:formal:litmus:C-ISA2+o-r+a-r+a-r+a-o:whole]
 However, because \co{P0()}'s \co{smp_store_release()} (\clnref{P0:rel})
 is cumulative, if \co{P3()}'s \co{READ_ONCE()} returns zero,
 this cumulativity will force the \co{READ_ONCE()} to be ordered
@@ -2208,7 +2208,7 @@ forces \co{P3()}'s \co{READ_ONCE()} to be ordered after \co{P0()}'s
 Because \co{P3()}'s \co{READ_ONCE()} cannot be both before and after
 \co{P0()}'s \co{smp_store_release()}, either or both of two things must
 be true:
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o@whole.fcv}
@@ -2243,13 +2243,13 @@ Release-acquire chains can also tolerate a single store-to-store step,
 as shown in
 \cref{lst:memorder:Long Z6.2 Release-Acquire Chain}
 (\path{C-Z6.2+o-r+a-r+a-r+a-o.litmus}).
-\begin{lineref}[ln:formal:C-Z6.2+o-r+a-r+a-r+a-o:whole]
+\begin{fcvref}[ln:formal:C-Z6.2+o-r+a-r+a-r+a-o:whole]
 As with the previous example, \co{smp_store_release()}'s cumulativity
 combined with the temporal nature of the release-acquire chain
 prevents the \co{exists} clause on \clnref{exists} from triggering.
 But beware: Adding a second store-to-store step would allow the correspondingly
 updated \co{exists} clause to trigger.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o@whole.fcv}
@@ -2479,7 +2479,7 @@ As soon as the compiler does that, the dependency is broken and all
 ordering is lost.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:memorder:Breakable Dependencies With Comparisons]
+\begin{fcvlabel}[ln:memorder:Breakable Dependencies With Comparisons]
 \begin{VerbatimL}[commandchars=\\\[\]]
 int reserve_int;
 int *gp;
@@ -2490,13 +2490,13 @@ if (p == &reserve_int)		\lnlbl[cmp]
 	handle_reserve(p);	\lnlbl[handle]
 do_something_with(*p); /* buggy! */
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Breakable Dependencies With Comparisons}
 \label{lst:memorder:Breakable Dependencies With Comparisons}
 \end{listing}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:memorder:Broken Dependencies With Comparisons]
+\begin{fcvlabel}[ln:memorder:Broken Dependencies With Comparisons]
 \begin{VerbatimL}[commandchars=\\\[\]]
 int reserve_int;
 int *gp;
@@ -2510,7 +2510,7 @@ if (p == &reserve_int) {
 	do_something_with(*p); /* OK! */
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Broken Dependencies With Comparisons}
 \label{lst:memorder:Broken Dependencies With Comparisons}
 \end{listing}
@@ -2531,11 +2531,11 @@ if (p == &reserve_int) {
 	Here global pointer \co{gp} points to a dynamically allocated
 	integer, but if memory is low, it might instead point to
 	the \co{reserve_int} variable.
-	\begin{lineref}[ln:memorder:Breakable Dependencies With Comparisons]
+	\begin{fcvref}[ln:memorder:Breakable Dependencies With Comparisons]
 	This \co{reserve_int} case might need special handling, as
 	shown on \clnref{cmp,handle} of the listing.
-	\end{lineref}
-        \begin{lineref}[ln:memorder:Broken Dependencies With Comparisons]
+	\end{fcvref}
+        \begin{fcvref}[ln:memorder:Broken Dependencies With Comparisons]
 	But the compiler could reasonably transform this code into
 	the form shown in
 	\cref{lst:memorder:Broken Dependencies With Comparisons},
@@ -2546,15 +2546,15 @@ if (p == &reserve_int) {
 	load on \clnref{deref1} and the dereference on \clnref{deref2}.
 	Please note that this is simply an example: There are a great
 	many other ways to break dependency chains with comparisons.
-	\end{lineref}
+	\end{fcvref}
 \end{enumerate}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:memorder:Breakable Dependencies With Comparisons]
+	\begin{fcvref}[ln:memorder:Breakable Dependencies With Comparisons]
 	Why can't you simply dereference the pointer before comparing it
 	to \co{&reserve_int} on \clnref{cmp} of
 	\cref{lst:memorder:Breakable Dependencies With Comparisons}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	For first, it might be necessary to invoke
 	\co{handle_reserve()} before \co{do_something_with()}.
@@ -2574,7 +2574,7 @@ if (p == &reserve_int) {
 \QuickQuizAnswer{
 %
 \begin{listing}[tbp]
-\begin{linelabel}[ln:memorder:Breakable Dependencies With Non-Constant Comparisons]
+\begin{fcvlabel}[ln:memorder:Breakable Dependencies With Non-Constant Comparisons]
 \begin{VerbatimL}
 int *gp1;
 int *gp2;
@@ -2587,13 +2587,13 @@ if (p == q)
 	handle_equality(p);
 do_something_with(*p);
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Breakable Dependencies With Non-Constant Comparisons}
 \label{lst:memorder:Breakable Dependencies With Non-Constant Comparisons}
 \end{listing}%
 %
 \begin{listing}[tbp]
-\begin{linelabel}[ln:memorder:Broken Dependencies With Non-Constant Comparisons]
+\begin{fcvlabel}[ln:memorder:Broken Dependencies With Non-Constant Comparisons]
 \begin{VerbatimL}[commandchars=\\\[\]]
 int *gp1;
 int *gp2;
@@ -2609,7 +2609,7 @@ if (p == q) {
 	do_something_with(*p);
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Broken Dependencies With Non-Constant Comparisons}
 \label{lst:memorder:Broken Dependencies With Non-Constant Comparisons}
 \end{listing}%
@@ -2622,14 +2622,14 @@ if (p == q) {
 	\cref{lst:memorder:Broken Dependencies With Non-Constant Comparisons},
 	and might well make this transformation due to register pressure
 	if \co{handle_equality()} was inlined and needed a lot of registers.
-	\begin{lineref}[ln:memorder:Broken Dependencies With Non-Constant Comparisons]
+	\begin{fcvref}[ln:memorder:Broken Dependencies With Non-Constant Comparisons]
 	\Clnref{q} of this transformed code uses \co{q}, which although
 	equal to \co{p}, is not necessarily tagged by the hardware as
 	carrying a dependency.
 	Therefore, this transformed code does not necessarily guarantee
 	that \clnref{q} is ordered after \clnref{p}.\footnote{
 		Kudos to Linus Torvalds for providing this example.}
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 Note that a series of inequality comparisons might, when taken together,
@@ -2669,7 +2669,7 @@ pointers:
 \end{enumerate}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:memorder:Broken Dependencies With Pointer Comparisons]
+\begin{fcvlabel}[ln:memorder:Broken Dependencies With Pointer Comparisons]
 \begin{VerbatimL}[commandchars=\\\[\]]
 struct foo {		\lnlbl[foo:b]
 	int a;
@@ -2711,7 +2711,7 @@ void reader(void)		\lnlbl[read:b]
 	do_something_with(r1, r2);
 }				\lnlbl[read:e]
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Broken Dependencies With Pointer Comparisons}
 \label{lst:memorder:Broken Dependencies With Pointer Comparisons}
 \end{listing}
@@ -2719,15 +2719,15 @@ void reader(void)		\lnlbl[read:b]
 Pointer comparisons can be quite tricky, and so it is well worth working
 through the example shown in
 \cref{lst:memorder:Broken Dependencies With Pointer Comparisons}.
-\begin{lineref}[ln:memorder:Broken Dependencies With Pointer Comparisons]
+\begin{fcvref}[ln:memorder:Broken Dependencies With Pointer Comparisons]
 This example uses a simple \co{struct foo} shown on \clnrefrange{foo:b}{foo:e}
 and two global pointers, \co{gp1} and \co{gp2}, shown on \clnref{gp1,gp2},
 respectively.
 This example uses two threads, namely \co{updater()} on
 \clnrefrange{upd:b}{upd:e} and \co{reader()} on \clnrefrange{read:b}{read:e}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:memorder:Broken Dependencies With Pointer Comparisons:upd]
+\begin{fcvref}[ln:memorder:Broken Dependencies With Pointer Comparisons:upd]
 The \co{updater()} thread allocates memory on \clnref{alloc}, and complains
 bitterly on \clnref{bug} if none is available.
 \Clnrefrange{init:a}{init:c} initialize the newly allocated structure,
@@ -2740,9 +2740,9 @@ Although there are legitimate use cases doing just this, such use cases
 require more care than is exercised in this example.
 
 Finally, \clnref{assign2} assigns the pointer to \co{gp2}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:memorder:Broken Dependencies With Pointer Comparisons:read]
+\begin{fcvref}[ln:memorder:Broken Dependencies With Pointer Comparisons:read]
 The \co{reader()} thread first fetches \co{gp2} on \clnref{gp2}, with
 \clnref{nulchk,nulret} checking for \co{NULL} and returning if so.
 \Clnref{pb} then fetches field \co{->b}.
@@ -2758,15 +2758,15 @@ different dependencies.
 This means that the compiler might well transform \clnref{pc} to instead
 be \co{r2 = q->c}, which might well cause the value 44 to be loaded
 instead of the expected value 144.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:memorder:Broken Dependencies With Pointer Comparisons:read]
+	\begin{fcvref}[ln:memorder:Broken Dependencies With Pointer Comparisons:read]
 	But doesn't the condition in \clnref{equ} supply a control dependency
 	that would keep \clnref{pc} ordered after \clnref{gp1}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:memorder:Broken Dependencies With Pointer Comparisons:read]
+	\begin{fcvref}[ln:memorder:Broken Dependencies With Pointer Comparisons:read]
 	Yes, but no.
 	Yes, there is a control dependency, but control dependencies do
 	not order later loads, only later stores.
@@ -2774,7 +2774,7 @@ instead of the expected value 144.
 	between \clnref{equ,pc}.
 	Or considerably better, have \co{update()}
 	allocate two structures instead of reusing the structure.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 In short, some care is required in order to ensure that dependency
@@ -3936,7 +3936,7 @@ influence on concurrency APIs, including within the Linux kernel.
 Understanding Alpha is therefore surprisingly important to the Linux kernel
 hacker.
 
-\begin{lineref}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
+\begin{fcvref}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
 The dependent-load difference between Alpha and the other CPUs is
 illustrated by the code shown in
 \cref{lst:memorder:Insert and Lock-Free Search (No Ordering)}.
@@ -3948,10 +3948,10 @@ That is, it makes this guarantee on all CPUs {\em except} Alpha.\footnote{
 	But Linux kernel versions v4.15 and later cause \co{READ_ONCE()}
 	to emit a memory barrier on Alpha, so this discussion applies
 	only to older versions of the Linux kernel.}
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
+\begin{fcvlabel}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
 \begin{VerbatimL}[commandchars=\\\[\]]
 struct el *insert(long key, long data)
 {
@@ -3980,12 +3980,12 @@ struct el *search(long key)
 	return (NULL);
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Insert and Lock-Free Search (No Ordering)}
 \label{lst:memorder:Insert and Lock-Free Search (No Ordering)}
 \end{listing}
 
-\begin{lineref}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
+\begin{fcvref}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
 Alpha actually allows the code on \clnref{key} of
 \cref{lst:memorder:Insert and Lock-Free Search (No Ordering)}
 could see the old
@@ -4018,7 +4018,7 @@ but loads the old cached values for \co{p->key} and \co{p->next}.
 Yes, this does mean that Alpha can in effect fetch
 the data pointed to {\em before} it fetches the pointer itself, strange
 but true.
-\end{lineref}
+\end{fcvref}
 See the documentation~\cite{Compaq01,WilliamPugh2000Gharachorloo}
 called out earlier for more information,
 or if you think that I am just making all this up.\footnote{
@@ -4047,16 +4047,16 @@ A \co{smp_read_barrier_depends()} primitive has therefore been added to the
 Linux kernel to eliminate overhead on these systems, and was also added
 to \co{READ_ONCE()} in v4.15 of the Linux kernel so that core kernel
 code no longer needs to concern itself with this aspect of DEC Alpha.
-\begin{lineref}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
+\begin{fcvref}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
 This \co{smp_read_barrier_depends()} primitive could be inserted in
 place of \clnref{BUG} of
 \cref{lst:memorder:Insert and Lock-Free Search (No Ordering)},
-\end{lineref}
-\begin{lineref}[ln:memorder:Safe Insert and Lock-Free Search]
+\end{fcvref}
+\begin{fcvref}[ln:memorder:Safe Insert and Lock-Free Search]
 but it is better to use the \co{rcu_dereference()} wrapper macro
 as shown on \clnref{deref1,deref2} of
 \cref{lst:memorder:Safe Insert and Lock-Free Search}.
-\end{lineref}
+\end{fcvref}
 
 It is also possible to implement a software mechanism
 that could be used in place of \co{smp_wmb()} to force
@@ -4075,7 +4075,7 @@ not be considered a reasonable approach by those whose systems must meet
 aggressive real-time response requirements.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:memorder:Safe Insert and Lock-Free Search]
+\begin{fcvlabel}[ln:memorder:Safe Insert and Lock-Free Search]
 \begin{VerbatimL}[commandchars=\\\[\]]
 struct el *insert(long key, long data)
 {
@@ -4103,7 +4103,7 @@ struct el *search(long key)
 	return (NULL);
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Safe Insert and Lock-Free Search}
 \label{lst:memorder:Safe Insert and Lock-Free Search}
 \end{listing}
@@ -4202,7 +4202,7 @@ be guaranteed to be ordered unless there is an \co{ISB}
 instruction between the branch and the load.
 Consider the following example:
 
-\begin{linelabel}[ln:memorder:ARM:load-store control dependency]
+\begin{fcvlabel}[ln:memorder:ARM:load-store control dependency]
 \begin{VerbatimN}[commandchars=\\\[\]]
 r1 = x;			\lnlbl[x]
 if (r1 == 0)		\lnlbl[if]
@@ -4212,9 +4212,9 @@ r2 = z;			\lnlbl[z1]
 ISB();			\lnlbl[isb]
 r3 = z;			\lnlbl[z2]
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
-\begin{lineref}[ln:memorder:ARM:load-store control dependency]
+\begin{fcvref}[ln:memorder:ARM:load-store control dependency]
 In this example, load-store control dependency ordering causes
 the load from \co{x} on \clnref{x} to be ordered before the store to
 \co{y} on \clnref{y}.
@@ -4226,7 +4226,7 @@ and the \co{ISB} instruction on \clnref{isb} ensures that
 the load on \clnref{z2} happens after the load on \clnref{x}.
 Note that inserting an additional \co{ISB} instruction somewhere between
 \clnref{nop,y} would enforce ordering between \clnref{x,z1}.
-\end{lineref}
+\end{fcvref}
 
 \subsection{ARMv8}
 
diff --git a/owned/owned.tex b/owned/owned.tex
index 14257c60..ed0ec4f6 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -263,7 +263,7 @@ own copy or its own portion of the data.
 In contrast, this section describes a functional-decomposition approach,
 where a special designated thread owns the rights to the data
 that is required to do its job.
-\begin{lineref}[ln:count:count_stat_eventual:whole:eventual]
+\begin{fcvref}[ln:count:count_stat_eventual:whole:eventual]
 The eventually consistent counter implementation described in
 Section~\ref{sec:count:Eventually Consistent Implementation} provides an example.
 This implementation has a designated thread that runs the
@@ -272,18 +272,18 @@ Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}.
 This \co{eventual()} thread periodically pulls the per-thread counts
 into the global counter, so that accesses to the global counter will,
 as the name says, eventually converge on the actual value.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:count:count_stat_eventual:whole:eventual]
+	\begin{fcvref}[ln:count:count_stat_eventual:whole:eventual]
 	But none of the data in the \co{eventual()} function shown on
 	\clnrefrange{b}{e} of
 	Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 	is actually owned by the \co{eventual()} thread!
 	In just what way is this data ownership???
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:count:count_stat_eventual:whole]
+	\begin{fcvref}[ln:count:count_stat_eventual:whole]
 	The key phrase is ``owns the rights to the data''.
 	In this case, the rights in question are the rights to access
 	the per-thread \co{counter} variable defined on \clnref{per_thr_cnt}
@@ -298,7 +298,7 @@ as the name says, eventually converge on the actual value.
 	For other examples of designated threads, look at the kernel
 	threads in the Linux kernel, for example, those created by
 	\co{kthread_create()} and \co{kthread_run()}.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 \section{Privatization}
diff --git a/perfbook.tex b/perfbook.tex
index 7799228d..757620ec 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -342,9 +342,9 @@
 \newcommand{\lnrefbase}{}
 \newcommand{\lnref}[1]{\ref{\lnrefbase:#1}}
 
-\newenvironment{linelabel}[1][]{\renewcommand{\lnlblbase}{#1}%
+\newenvironment{fcvlabel}[1][]{\renewcommand{\lnlblbase}{#1}%
 \ignorespaces}{\ignorespacesafterend}
-\newenvironment{lineref}[1][]{\renewcommand{\lnrefbase}{#1}%
+\newenvironment{fcvref}[1][]{\renewcommand{\lnrefbase}{#1}%
 \ignorespaces}{\ignorespacesafterend}
 
 \frontmatter
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 24f611c7..4dfa4045 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -114,7 +114,7 @@ held constant, ensuring that \co{read_count()} sees consistent data.
 
 \subsubsection{Implementation}
 
-\begin{lineref}[ln:count:count_end_rcu:whole]
+\begin{fcvref}[ln:count:count_end_rcu:whole]
 \Clnrefrange{struct:b}{struct:e} of
 \cref{lst:together:RCU and Per-Thread Statistical Counters}
 show the \co{countarray} structure, which contains a
@@ -139,9 +139,9 @@ the \co{final_mutex} spinlock.
 
 \Clnrefrange{inc:b}{inc:e} show \co{inc_count()}, which is unchanged from
 \cref{lst:count:Per-Thread Statistical Counters}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:count:count_end_rcu:whole:read]
+\begin{fcvref}[ln:count:count_end_rcu:whole:read]
 \Clnrefrange{b}{e} show \co{read_count()}, which has changed significantly.
 \Clnref{rrl,rru} substitute \co{rcu_read_lock()} and
 \co{rcu_read_unlock()} for acquisition and release of \co{final_mutex}.
@@ -155,33 +155,33 @@ sum of the counts of threads that have previously exited.
 \Clnrefrange{add:b}{add:e} add up the per-thread counters corresponding
 to currently
 running threads, and, finally, \clnref{ret} returns the sum.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:count:count_end_rcu:whole:init]
+\begin{fcvref}[ln:count:count_end_rcu:whole:init]
 The initial value for \co{countarrayp} is
 provided by \co{count_init()} on \clnrefrange{b}{e}.
 This function runs before the first thread is created, and its job
 is to allocate
 and zero the initial structure, and then assign it to \co{countarrayp}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:count:count_end_rcu:whole:reg]
+\begin{fcvref}[ln:count:count_end_rcu:whole:reg]
 \Clnrefrange{b}{e} show the \co{count_register_thread()} function, which
 is invoked by each newly created thread.
 \Clnref{idx} picks up the current thread's index, \clnref{acq} acquires
 \co{final_mutex}, \clnref{set} installs a pointer to this thread's
 \co{counter}, and \clnref{rel} releases \co{final_mutex}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:count:count_end_rcu:whole:reg]
+	\begin{fcvref}[ln:count:count_end_rcu:whole:reg]
 	Hey!!!
 	\Clnref{set} of
 	\cref{lst:together:RCU and Per-Thread Statistical Counters}
 	modifies a value in a pre-existing \co{countarray} structure!
 	Didn't you say that this structure, once made available to
 	\co{read_count()}, remained constant???
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	Indeed I did say that.
 	And it would be possible to make \co{count_register_thread()}
@@ -199,7 +199,7 @@ is invoked by each newly created thread.
 	but without actually having to do the allocation.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:count:count_end_rcu:whole:unreg]
+\begin{fcvref}[ln:count:count_end_rcu:whole:unreg]
 \Clnrefrange{b}{e} show \co{count_unregister_thread()}, which is invoked
 by each thread just before it exits.
 \Clnrefrange{alloc:b}{alloc:e} allocate a new \co{countarray} structure,
@@ -217,7 +217,7 @@ have references to the old \co{countarray} structure, will be allowed
 to exit their RCU read-side critical sections, thus dropping any such
 references.
 \Clnref{free} can then safely free the old \co{countarray} structure.
-\end{lineref}
+\end{fcvref}
 
 \subsubsection{Discussion}
 
@@ -299,7 +299,7 @@ the fastpath, as desired.
 
 The updated code fragment removing a device is as follows:
 
-\begin{linelabel}[ln:together:applyrcu:Removing Device]
+\begin{fcvlabel}[ln:together:applyrcu:Removing Device]
 \begin{VerbatimN}[tabsize=8,commandchars=\\\[\]]
 spin_lock(&mylock);
 removing = 1;
@@ -311,9 +311,9 @@ while (read_count() != 0) {	\lnlbl[nextofsync]
 }
 remove_device();
 \end{VerbatimN}
-\end{linelabel}
+\end{fcvlabel}
 
-\begin{lineref}[ln:together:applyrcu:Removing Device]
+\begin{fcvref}[ln:together:applyrcu:Removing Device]
 Here we replace the reader-writer lock with an exclusive spinlock and
 add a \co{synchronize_rcu()} to wait for all of the RCU read-side
 critical sections to complete.
@@ -324,7 +324,7 @@ we know that all remaining I/Os have been accounted for.
 Of course, the overhead of \co{synchronize_rcu()} can be large,
 but given that device removal is quite rare, this is usually a good
 tradeoff.
-\end{lineref}
+\end{fcvref}
 
 \subsection{Array and Length}
 \label{sec:together:Array and Length}
diff --git a/together/refcnt.tex b/together/refcnt.tex
index 9fdc5b93..f94ecbb4 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -164,7 +164,7 @@ counting---although simple reference counting is almost always
 open-coded instead.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:together:Simple Reference-Count API]
+\begin{fcvlabel}[ln:together:Simple Reference-Count API]
 \begin{VerbatimL}[commandchars=\\\[\]]
 struct sref {
 	int refcount;
@@ -193,7 +193,7 @@ int sref_put(struct sref *sref,
 	return 0;
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Simple Reference-Count API}
 \label{lst:together:Simple Reference-Count API}
 \end{listing}
@@ -252,7 +252,7 @@ RCU read-side critical sections.
 } \QuickQuizEnd
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:together:Linux Kernel kref API]
+\begin{fcvlabel}[ln:together:Linux Kernel kref API]
 \begin{VerbatimL}[commandchars=\\\[\]]
 struct kref {						\lnlbl[kref:b]
 	atomic_t refcount;
@@ -283,12 +283,12 @@ kref_sub(struct kref *kref, unsigned int count,
 	return 0;
 }							\lnlbl[sub:e]
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Linux Kernel \tco{kref} API}
 \label{lst:together:Linux Kernel kref API}
 \end{listing}
 
-\begin{lineref}[ln:together:Linux Kernel kref API]
+\begin{fcvref}[ln:together:Linux Kernel kref API]
 The \co{kref} structure itself, consisting of a single atomic
 data item, is shown in \clnrefrange{kref:b}{kref:e} of
 \cref{lst:together:Linux Kernel kref API}.
@@ -315,17 +315,17 @@ counter, and if the result is zero, \clnref{rel} invokes the specified
 that \co{release()} was invoked.
 Otherwise, \co{kref_sub()} returns zero, informing the caller that
 \co{release()} was not called.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:together:Linux Kernel kref API]
+	\begin{fcvref}[ln:together:Linux Kernel kref API]
 	Suppose that just after the \co{atomic_sub_and_test()}
 	on \clnref{check} of
 	\cref{lst:together:Linux Kernel kref API} is invoked,
 	that some other CPU invokes \co{kref_get()}.
 	Doesn't this result in that other CPU now having an illegal
 	reference to a released object?
-        \end{lineref}
+        \end{fcvref}
 \QuickQuizAnswer{
 	This cannot happen if these functions are used correctly.
 	It is illegal to invoke \co{kref_get()} unless you already
@@ -369,7 +369,7 @@ shown in \cref{lst:together:Linux Kernel dst-clone API}
 (as of Linux v2.6.25).
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:together:Linux Kernel dst-clone API]
+\begin{fcvlabel}[ln:together:Linux Kernel dst-clone API]
 \begin{VerbatimL}[commandchars=\\\[\]]
 static inline
 struct dst_entry * dst_clone(struct dst_entry * dst)
@@ -389,7 +389,7 @@ void dst_release(struct dst_entry * dst)
 	}
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Linux Kernel \tco{dst_clone} API}
 \label{lst:together:Linux Kernel dst-clone API}
 \end{listing}
@@ -405,14 +405,14 @@ or might not require a memory barrier, but if such a memory barrier
 is required, it will be embedded in the mechanism used to hand the
 \co{dst_entry} off.
 
-\begin{lineref}[ln:together:Linux Kernel dst-clone API]
+\begin{fcvref}[ln:together:Linux Kernel dst-clone API]
 The \co{dst_release()} primitive may be invoked from any environment,
 and the caller might well reference elements of the \co{dst_entry}
 structure immediately prior to the call to \co{dst_release()}.
 The \co{dst_release()} primitive therefore contains a memory
 barrier on \clnref{mb} preventing both the compiler and the CPU
 from misordering accesses.
-\end{lineref}
+\end{fcvref}
 
 Please note that the programmer making use of \co{dst_clone()} and
 \co{dst_release()} need not be aware of the memory barriers, only
@@ -455,7 +455,7 @@ Simplified versions of these functions are shown in
 \cref{lst:together:Linux Kernel fget/fput API} (as of Linux v2.6.25).
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:together:Linux Kernel fget/fput API]
+\begin{fcvlabel}[ln:together:Linux Kernel fget/fput API]
 \begin{VerbatimL}[commandchars=\\\@\$]
 struct file *fget(unsigned int fd)
 {
@@ -499,12 +499,12 @@ static void file_free_rcu(struct rcu_head *head)
 	kmem_cache_free(filp_cachep, f);		\lnlbl@free$
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Linux Kernel \tco{fget}/\tco{fput} API}
 \label{lst:together:Linux Kernel fget/fput API}
 \end{listing}
 
-\begin{lineref}[ln:together:Linux Kernel fget/fput API]
+\begin{fcvref}[ln:together:Linux Kernel fget/fput API]
 \Clnref{fetch} of \co{fget()} fetches the pointer to the current
 process's file-descriptor table, which might well be shared
 with other processes.
@@ -562,7 +562,7 @@ This approach is also used by Linux's virtual-memory system,
 see \co{get_page_unless_zero()} and \co{put_page_testzero()} for
 page structures as well as \co{try_to_unuse()} and \co{mmput()}
 for memory-map structures.
-\end{lineref}
+\end{fcvref}
 
 \subsection{Linux Primitives Supporting Reference Counting}
 \label{sec:together:Linux Primitives Supporting Reference Counting}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 040ce318..01529a0c 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -56,7 +56,7 @@ This can be accomplished using UNIX shell scripting as follows:
 \label{fig:toolsoftrade:Execution Diagram for Parallel Shell Execution}
 \end{figure}
 
-\begin{lineref}[ln:toolsoftrade:parallel:compute_it]
+\begin{fcvref}[ln:toolsoftrade:parallel:compute_it]
 Lines~\lnref{comp1} and~\lnref{comp2} launch two instances of this
 program, redirecting their
 output to two separate files, with the \co{&} character directing the
@@ -64,7 +64,7 @@ shell to run the two instances of the program in the background.
 Line~\lnref{wait} waits for both instances to complete, and
 lines~\lnref{cat1} and~\lnref{cat2}
 display their output.
-\end{lineref}
+\end{fcvref}
 The resulting execution is as shown in
 Figure~\ref{fig:toolsoftrade:Execution Diagram for Parallel Shell Execution}:
 the two instances of \co{compute_it} execute in parallel,
@@ -185,7 +185,7 @@ For more information, see any of a number of textbooks on the
 subject~\cite{WRichardStevens1992,StewartWeiss2013UNIX}.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:forkjoin:main]
+\begin{fcvlabel}[ln:toolsoftrade:forkjoin:main]
 \begin{VerbatimL}[commandchars=\%\[\]]
 pid = fork();%lnlbl[fork]
 if (pid == 0) {%lnlbl[if]
@@ -198,12 +198,12 @@ if (pid == 0) {%lnlbl[if]
 	/* parent, pid == child ID */%lnlbl[parent]
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Using the \tco{fork()} Primitive}
 \label{lst:toolsoftrade:Using the fork() Primitive}
 \end{listing}
 
-\begin{lineref}[ln:toolsoftrade:forkjoin:main]
+\begin{fcvref}[ln:toolsoftrade:forkjoin:main]
 If \co{fork()} succeeds, it returns twice, once for the parent
 and again for the child.
 The value returned from \co{fork()} allows the caller to tell
@@ -221,7 +221,7 @@ and exits on \clnrefrange{errora}{errorb} if so.
 Otherwise, the \co{fork()} has executed successfully, and the parent
 therefore executes line~\lnref{parent} with the variable \co{pid}
 containing the process ID of the child.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/api-pthreads/api-pthreads@waitall.fcv}
@@ -229,7 +229,7 @@ containing the process ID of the child.
 \label{lst:toolsoftrade:Using the wait() Primitive}
 \end{listing}
 
-\begin{lineref}[ln:api-pthreads:api-pthreads:waitall]
+\begin{fcvref}[ln:api-pthreads:api-pthreads:waitall]
 The parent process may use the \co{wait()} primitive to wait for its children
 to complete.
 However, use of this primitive is a bit more complicated than its shell-script
@@ -251,7 +251,7 @@ If so, line~\lnref{ECHILD} checks for the \co{ECHILD} errno, which
 indicates that there are no more child processes, so that
 line~\lnref{break} exits the loop.
 Otherwise, lines~\lnref{perror} and~\lnref{exit} print an error and exit.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why does this \co{wait()} primitive need to be so complicated?
@@ -275,7 +275,7 @@ Otherwise, lines~\lnref{perror} and~\lnref{exit} print an error and exit.
 \label{lst:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
 \end{listing}
 
-\begin{lineref}[ln:toolsoftrade:forkjoinvar:main]
+\begin{fcvref}[ln:toolsoftrade:forkjoinvar:main]
 It is critically important to note that the parent and child do \emph{not}
 share memory.
 This is illustrated by the program shown in
@@ -286,7 +286,7 @@ prints a message on line~\lnref{print:c}, and exits on line~\lnref{exit:s}.
 The parent continues at line~\lnref{waitall}, where it waits on the child,
 and on line~\lnref{print:p} finds that its copy of the variable \co{x} is
 still zero. The output is thus as follows:
-\end{lineref}
+\end{fcvref}
 
 \begin{VerbatimU}
 Child process set x=1
@@ -329,7 +329,7 @@ than fork-join parallelism.
 \subsection{POSIX Thread Creation and Destruction}
 \label{sec:toolsoftrade:POSIX Thread Creation and Destruction}
 
-\begin{lineref}[ln:toolsoftrade:pcreate:mythread]
+\begin{fcvref}[ln:toolsoftrade:pcreate:mythread]
 To create a thread within an existing process, invoke the
 \co{pthread_create()} primitive, for example, as shown on
 lines~\lnref{create:a} and~\lnref{create:b} of
@@ -341,7 +341,7 @@ to an optional \co{pthread_attr_t}, the third argument is the function
 (in this case, \co{mythread()})
 that is to be invoked by the new thread, and the last \co{NULL} argument
 is the argument that will be passed to \co{mythread}.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/toolsoftrade/pcreate@mythread.fcv}
@@ -365,7 +365,7 @@ call \co{pthread_exit()}.
 	of error return all the way back up to \co{mythread()}.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:toolsoftrade:pcreate:mythread]
+\begin{fcvref}[ln:toolsoftrade:pcreate:mythread]
 The \co{pthread_join()} primitive, shown on line~\lnref{join},
 is analogous to
 the fork-join \co{wait()} primitive.
@@ -377,7 +377,7 @@ second argument to \co{pthread_join()}.
 The thread's exit value is either the value passed to \co{pthread_exit()}
 or the value returned by the thread's top-level function, depending on
 how the thread in question exits.
-\end{lineref}
+\end{fcvref}
 
 The program shown in
 Listing~\ref{lst:toolsoftrade:Threads Created Via pthread-create() Share Memory}
@@ -472,23 +472,23 @@ lock~\cite{Hoare74}.
 \label{lst:toolsoftrade:Demonstration of Exclusive Locks}
 \end{listing}
 
-\begin{lineref}[ln:toolsoftrade:lock:reader_writer]
+\begin{fcvref}[ln:toolsoftrade:lock:reader_writer]
 This exclusive-locking property is demonstrated using the code shown in
 Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
 (\path{lock.c}).
 Line~\lnref{lock_a} defines and initializes a POSIX lock named \co{lock_a}, while
 line~\lnref{lock_b} similarly defines and initializes a lock named \co{lock_b}.
 Line~\lnref{x} defines and initializes a shared variable~\co{x}.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:toolsoftrade:lock:reader_writer:reader]
+\begin{fcvref}[ln:toolsoftrade:lock:reader_writer:reader]
 \Clnrefrange{b}{e} define a function \co{lock_reader()} which repeatedly
 reads the shared variable \co{x} while holding
 the lock specified by \co{arg}.
 Line~\lnref{cast} casts \co{arg} to a pointer to a \co{pthread_mutex_t}, as
 required by the \co{pthread_mutex_lock()} and \co{pthread_mutex_unlock()}
 primitives.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why not simply make the argument to \co{lock_reader()}
@@ -504,12 +504,12 @@ primitives.
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	\begin{lineref}[ln:toolsoftrade:lock:reader_writer]
+	\begin{fcvref}[ln:toolsoftrade:lock:reader_writer]
 	What is the \co{READ_ONCE()} on
         lines~\lnref{reader:read_x} and~\lnref{writer:inc} and the
 	\co{WRITE_ONCE()} on line~\lnref{writer:inc} of
 	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}?
-	\end{lineref}
+	\end{fcvref}
 \QuickQuizAnswer{
 	These macros constrain the compiler so as to prevent it from
 	carrying out optimizations that would be problematic for concurrently
@@ -529,7 +529,7 @@ primitives.
 	Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:toolsoftrade:lock:reader_writer:reader]
+\begin{fcvref}[ln:toolsoftrade:lock:reader_writer:reader]
 \Clnrefrange{acq:b}{acq:e} acquire the specified
 \co{pthread_mutex_t}, checking
 for errors and exiting the program if any occur.
@@ -543,7 +543,7 @@ again checking for
 errors and exiting the program if any occur.
 Finally, line~\lnref{return} returns \co{NULL}, again to match the function type
 required by \co{pthread_create()}.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Writing four lines of code for each acquisition and release
@@ -558,7 +558,7 @@ required by \co{pthread_create()}.
 	\co{spin_lock()} and \co{spin_unlock()} APIs.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:toolsoftrade:lock:reader_writer:writer]
+\begin{fcvref}[ln:toolsoftrade:lock:reader_writer:writer]
 \Clnrefrange{b}{e} of
 Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
 show \co{lock_writer()}, which
@@ -572,7 +572,7 @@ While holding the lock, \clnrefrange{loop:b}{loop:e}
 increment the shared variable \co{x},
 sleeping for five milliseconds between each increment.
 Finally, \clnrefrange{rel:b}{rel:e} release the lock.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/toolsoftrade/lock@same_lock.fcv}
@@ -580,7 +580,7 @@ Finally, \clnrefrange{rel:b}{rel:e} release the lock.
 \label{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
 \end{listing}
 
-\begin{lineref}[ln:toolsoftrade:lock:same_lock]
+\begin{fcvref}[ln:toolsoftrade:lock:same_lock]
 Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
 shows a code fragment that runs \co{lock_reader()} and
 \co{lock_writer()} as threads using the same lock, namely, \co{lock_a}.
@@ -590,7 +590,7 @@ running \co{lock_reader()}, and then
 running \co{lock_writer()}.
 \Clnrefrange{wait:b}{wait:e} wait for both threads to complete.
 The output of this code fragment is as follows:
-\end{lineref}
+\end{fcvref}
 
 \begin{VerbatimU}
 Creating two threads using same lock:
@@ -734,7 +734,7 @@ provided by reader-writer locks.
 \label{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}
 \end{listing}
 
-\begin{lineref}[ln:toolsoftrade:rwlockscale:reader]
+\begin{fcvref}[ln:toolsoftrade:rwlockscale:reader]
 Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}
 (\path{rwlockscale.c})
 shows one way of measuring reader-writer lock scalability.
@@ -754,9 +754,9 @@ end of the test.
 This variable is initially set to \co{GOFLAG_INIT}, then set to
 \co{GOFLAG_RUN} after all the reader threads have started, and finally
 set to \co{GOFLAG_STOP} to terminate the test run.
-\end{lineref}
+\end{fcvref}
 
-\begin{lineref}[ln:toolsoftrade:rwlockscale:reader:reader]
+\begin{fcvref}[ln:toolsoftrade:rwlockscale:reader:reader]
 \Clnrefrange{b}{e} define \co{reader()}, which is the reader thread.
 Line~\lnref{atmc_inc} atomically increments the \co{nreadersrunning} variable
 to indicate that this thread is now running, and
@@ -764,7 +764,7 @@ to indicate that this thread is now running, and
 The \co{READ_ONCE()} primitive forces the compiler to fetch \co{goflag}
 on each pass through the loop---the compiler would otherwise be within its
 rights to assume that the value of \co{goflag} would never change.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Instead of using \co{READ_ONCE()} everywhere, why not just
@@ -834,7 +834,7 @@ rights to assume that the value of \co{goflag} would never change.
 	\co{__thread} variable in the corresponding element.
 } \QuickQuizEnd
 
-\begin{lineref}[ln:toolsoftrade:rwlockscale:reader:reader]
+\begin{fcvref}[ln:toolsoftrade:rwlockscale:reader:reader]
 The loop spanning \clnrefrange{loop:b}{loop:e} carries out the performance test.
 \Clnrefrange{acq:b}{acq:e} acquire the lock,
 \clnrefrange{hold:b}{hold:e} hold the lock for the specified
@@ -848,7 +848,7 @@ Line~\lnref{count} counts this lock acquisition.
 
 Line~\lnref{mov_cnt} moves the lock-acquisition count to this thread's element of the
 \co{readcounts[]} array, and line~\lnref{return} returns, terminating this thread.
-\end{lineref}
+\end{fcvref}
 
 \begin{figure}[tb]
 \centering
@@ -984,7 +984,7 @@ shows that the overhead of reader-writer locking is most severe for the
 smallest critical sections, so it would be nice to have some other way
 of protecting tiny critical sections.
 One such way uses atomic operations.
-\begin{lineref}[ln:toolsoftrade:rwlockscale:reader:reader]
+\begin{fcvref}[ln:toolsoftrade:rwlockscale:reader:reader]
 We have seen an atomic operation already, namely the
 \co{__sync_fetch_and_add()} primitive on \clnref{atmc_inc} of
 Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}.
@@ -994,7 +994,7 @@ the value referenced by its first argument, returning the old value
 If a pair of threads concurrently execute \co{__sync_fetch_and_add()} on
 the same variable, the resulting value of the variable will include
 the result of both additions.
-\end{lineref}
+\end{fcvref}
 
 The \GNUC\ compiler offers a number of additional atomic operations,
 including \co{__sync_fetch_and_sub()},
@@ -1066,19 +1066,19 @@ The \co{__sync_synchronize()} primitive issues a ``memory barrier'',
 which constrains both the compiler's and the CPU's ability to reorder
 operations, as discussed in
 Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}.
-\begin{lineref}[ln:toolsoftrade:rwlockscale:reader:reader]
+\begin{fcvref}[ln:toolsoftrade:rwlockscale:reader:reader]
 In some cases, it is sufficient to constrain the compiler's ability
 to reorder operations, while allowing the CPU free rein, in which
 case the \co{barrier()} primitive may be used, as it in fact was
 on \clnref{barrier} of
 Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}.
-\end{lineref}
-\begin{lineref}[ln:toolsoftrade:lock:reader_writer:reader]
+\end{fcvref}
+\begin{fcvref}[ln:toolsoftrade:lock:reader_writer:reader]
 In some cases, it is only necessary to ensure that the compiler
 avoids optimizing away a given memory read, in which case the
 \co{READ_ONCE()} primitive may be used, as it was on \clnref{read_x} of
 Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}.
-\end{lineref}
+\end{fcvref}
 Similarly, the \co{WRITE_ONCE()} primitive may be used to prevent the
 compiler from optimizing away a given memory write.
 These last three primitives are not provided directly by \GCC,
@@ -1356,7 +1356,7 @@ thread.
 \label{lst:toolsoftrade:Example Child Thread}
 \end{listing}
 
-\begin{lineref}[ln:intro:threadcreate:main]
+\begin{fcvref}[ln:intro:threadcreate:main]
 The parent program is shown in
 Listing~\ref{lst:toolsoftrade:Example Parent Thread}.
 It invokes \co{smp_init()} to initialize the threading system on
@@ -1368,7 +1368,7 @@ It creates the specified number of child threads on
 and waits for them to complete on line~\lnref{wait}.
 Note that \co{wait_all_threads()} discards the threads return values,
 as in this case they are all \co{NULL}, which is not very interesting.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/intro/threadcreate@main.fcv}
@@ -1482,25 +1482,25 @@ in long-past pre-C11 days.
 A short answer to this question is ``they lived dangerously''.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Living Dangerously Early 1990s Style]
+\begin{fcvlabel}[ln:toolsoftrade:Living Dangerously Early 1990s Style]
 \begin{VerbatimL}[commandchars=\\\{\}]
 ptr = global_ptr;\lnlbl{temp}
 if (ptr != NULL && ptr < high_address)
 	do_low(ptr);
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Living Dangerously Early 1990s Style}
 \label{lst:toolsoftrade:Living Dangerously Early 1990s Style}
 \end{listing}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:C Compilers Can Invent Loads]
+\begin{fcvlabel}[ln:toolsoftrade:C Compilers Can Invent Loads]
 \begin{VerbatimL}[commandchars=\\\{\}]
 if (global_ptr != NULL &&\lnlbl{if:a}
     global_ptr < high_address)\lnlbl{if:b}
 	do_low(global_ptr);\lnlbl{do_low}
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{C Compilers Can Invent Loads}
 \label{lst:toolsoftrade:C Compilers Can Invent Loads}
 \end{listing}
@@ -1527,7 +1527,7 @@ up to three times.
 \QuickQuizAnswer{
 	Suppose that \co{global_ptr} is initially non-\co{NULL},
 	but that some other thread sets \co{global_ptr} to \co{NULL}.
-	\begin{lineref}[ln:toolsoftrade:C Compilers Can Invent Loads]
+	\begin{fcvref}[ln:toolsoftrade:C Compilers Can Invent Loads]
 	Suppose further that line~\lnref{if:a} of the transformed code
 	(Listing~\ref{lst:toolsoftrade:C Compilers Can Invent Loads})
 	executes just before \co{global_ptr} is set to \co{NULL} and
@@ -1538,7 +1538,7 @@ up to three times.
         \co{high_address},
 	so that line~\lnref{do_low} passes \co{do_low()} a \co{NULL} pointer,
 	which \co{do_low()} just might not be prepared to deal with.
-	\end{lineref}
+	\end{fcvref}
 
 	Your editor made exactly this mistake in the DYNIX/ptx
 	kernel's memory allocator in the early 1990s.
@@ -1630,18 +1630,18 @@ But for properly aligned machine-sized stores, \co{WRITE_ONCE()} will
 prevent store tearing.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Preventing Load Fusing]
+\begin{fcvlabel}[ln:toolsoftrade:Preventing Load Fusing]
 \begin{VerbatimL}[commandchars=\\\{\}]
 while (!need_to_stop)
 	do_something_quickly();
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Inviting Load Fusing}
 \label{lst:toolsoftrade:Inviting Load Fusing}
 \end{listing}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:C Compilers Can Fuse Loads]
+\begin{fcvlabel}[ln:toolsoftrade:C Compilers Can Fuse Loads]
 \begin{VerbatimL}[commandchars=\\\[\]]
 if (!need_to_stop)
 	for (;;) {\lnlbl[loop:b]
@@ -1663,7 +1663,7 @@ if (!need_to_stop)
 		do_something_quickly();
 	}\lnlbl[loop:e]
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{C Compilers Can Fuse Loads}
 \label{lst:toolsoftrade:C Compilers Can Fuse Loads}
 \end{listing}
@@ -1687,16 +1687,16 @@ Worse yet, because the compiler knows that \co{do_something_quickly()}
 does not store to \co{need_to_stop}, the compiler could quite reasonably
 decide to check this variable only once, resulting in the code shown in
 Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Loads}.
-\begin{lineref}[ln:toolsoftrade:C Compilers Can Fuse Loads]
+\begin{fcvref}[ln:toolsoftrade:C Compilers Can Fuse Loads]
 Once entered, the loop on
 \clnrefrange{loop:b}{loop:e} will never exit, regardless of how
 many times some other thread stores a non-zero value to \co{need_to_stop}.
-\end{lineref}
+\end{fcvref}
 The result will at best be consternation, and might well also
 include severe physical damage.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads]
+\begin{fcvlabel}[ln:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads]
 \begin{VerbatimL}[commandchars=\\\[\]]
 int *gp; \lnlbl[gp]
 
@@ -1716,12 +1716,12 @@ void t1(void)
 	}
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{C Compilers Can Fuse Non-Adjacent Loads}
 \label{lst:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads}
 \end{listing}
 
-\begin{lineref}[ln:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads]
+\begin{fcvref}[ln:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads]
 The compiler can fuse loads across surprisingly large spans of code.
 For example, in
 Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads},
@@ -1744,7 +1744,7 @@ could load \co{NULL}, resulting in a fault.\footnote{
 Note that the intervening \co{READ_ONCE()} does not prevent the other
 two loads from being fused, despite the fact that all three are loading
 from the same variable.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Why does it matter whether \co{do_something()} and
@@ -1752,14 +1752,14 @@ from the same variable.
 	Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads}
 	are inline functions?
 \QuickQuizAnswer{
-	\begin{lineref}[ln:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads]
+	\begin{fcvref}[ln:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads]
 	Because \co{gp} is not a static variable, if either
 	\co{do_something()} or \co{do_something_else()} were separately
 	compiled, the compiler would have to assume that either or both
 	of these two functions might change the value of \co{gp}.
 	This possibility would force the compiler to reload \co{gp}
 	on line~\lnref{p3}, thus avoiding the \co{NULL}-pointer dereference.
-	\end{lineref}
+	\end{fcvref}
 } \QuickQuizEnd
 
 {\bf Store fusing} can occur when the compiler notices a pair of successive
@@ -1772,7 +1772,7 @@ very little chance that some other thread could load the value from the
 first store.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:C Compilers Can Fuse Stores]
+\begin{fcvlabel}[ln:toolsoftrade:C Compilers Can Fuse Stores]
 \begin{VerbatimL}[commandchars=\\\[\]]
 void shut_it_down(void)
 {
@@ -1792,14 +1792,14 @@ void work_until_shut_down(void)
 	other_task_ready = 1; /* BUGGY!!! */\lnlbl[other:store]
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{C Compilers Can Fuse Stores}
 \label{lst:toolsoftrade:C Compilers Can Fuse Stores}
 \end{listing}
 
 However, there are exceptions, for example as shown in
 Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores}.
-\begin{lineref}[ln:toolsoftrade:C Compilers Can Fuse Stores]
+\begin{fcvref}[ln:toolsoftrade:C Compilers Can Fuse Stores]
 The function \co{shut_it_down()} stores to the shared
 variable \co{status} on lines~\lnref{store:a} and~\lnref{store:b},
 and so assuming that neither
@@ -1835,7 +1835,7 @@ line~\lnref{other:store} to precede line~\lnref{until:loop:b}, which might
 be a great disappointment for anyone hoping that the last call to
 \co{do_more_work()} on line~\lnref{until:loop:e} happens before the call to
 \co{finish_shutdown()} on line~\lnref{finish}.
-\end{lineref}
+\end{fcvref}
 
 It might seem futile to prevent the compiler from changing the order of
 accesses in cases where the underlying hardware is free to reorder them.
@@ -1865,7 +1865,7 @@ These hoisting optimizations are not uncommon, and can cause significant
 increases in cache misses, and thus significant degradation of
 both performance and scalability.
 
-\begin{lineref}[ln:toolsoftrade:C Compilers Can Fuse Stores]
+\begin{fcvref}[ln:toolsoftrade:C Compilers Can Fuse Stores]
 {\bf Invented stores} can occur in a number of situations.
 For example, a compiler emitting code for \co{work_until_shut_down()} in
 Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores}
@@ -1883,23 +1883,23 @@ prematurely, again allowing \co{finish_shutdown()} to run
 concurrently with \co{do_more_work()}.
 Given that the entire point of this \co{while} appears to be to
 prevent such concurrency, this is not a good thing.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Inviting an Invented Store]
+\begin{fcvlabel}[ln:toolsoftrade:Inviting an Invented Store]
 \begin{VerbatimL}[commandchars=\\\{\}]
 if (condition)
 	a = 1;
 else
 	do_a_bunch_of_stuff();
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Inviting an Invented Store}
 \label{lst:toolsoftrade:Inviting an Invented Store}
 \end{listing}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Compiler Invents an Invited Store]
+\begin{fcvlabel}[ln:toolsoftrade:Compiler Invents an Invited Store]
 \begin{VerbatimL}[commandchars=\\\[\]]
 a = 1;\lnlbl[store:uncond]
 if (!condition) {
@@ -1907,7 +1907,7 @@ if (!condition) {
 	do_a_bunch_of_stuff();
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Compiler Invents an Invited Store}
 \label{lst:toolsoftrade:Compiler Invents an Invited Store}
 \end{listing}
@@ -1925,12 +1925,12 @@ might know that the value of \co{a} is initially zero,
 which might be a strong temptation to optimize away one branch
 by transforming this code to that in
 Listing~\ref{lst:toolsoftrade:Compiler Invents an Invited Store}.
-\begin{lineref}[ln:toolsoftrade:Compiler Invents an Invited Store]
+\begin{fcvref}[ln:toolsoftrade:Compiler Invents an Invited Store]
 Here, line~\lnref{store:uncond} unconditionally stores \co{1} to \co{a}, then
 resets the value back to zero on
 line~\lnref{store:cond} if \co{condition} was not set.
 This transforms the if-then-else into an if-then, saving one branch.
-\end{lineref}
+\end{fcvref}
 
 \QuickQuiz{}
 	Ouch!
@@ -1967,7 +1967,7 @@ This variant of invented stores has been outlawed by the prohibition
 against compiler optimizations that invent data races.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Inviting a Store-to-Load Conversion]
+\begin{fcvlabel}[ln:toolsoftrade:Inviting a Store-to-Load Conversion]
 \begin{VerbatimL}[commandchars=\\\[\]]
 r1 = p;\lnlbl[load:p]
 if (unlikely(r1))\lnlbl[if]
@@ -1975,14 +1975,14 @@ if (unlikely(r1))\lnlbl[if]
 barrier();\lnlbl[barrier]
 p = NULL;\lnlbl[null]
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Inviting a Store-to-Load Conversion}
 \label{lst:toolsoftrade:Inviting a Store-to-Load Conversion}
 \end{listing}
 
 {\bf Store-to-load transformations} can occur when the compiler notices
 that a plain store might not actually change the value in memory.
-\begin{lineref}[ln:toolsoftrade:Inviting a Store-to-Load Conversion]
+\begin{fcvref}[ln:toolsoftrade:Inviting a Store-to-Load Conversion]
 For example, consider
 Listing~\ref{lst:toolsoftrade:Inviting a Store-to-Load Conversion}.
 Line~\lnref{load:p} fetches \co{p}, but the \qco{if} statement on
@@ -1997,10 +1997,10 @@ choosing to remember the hint---or getting an additional hint via
 feedback-directed optimization.
 Doing so would cause the compiler to realize that line~\lnref{null}
 is often an expensive no-op.
-\end{lineref}
+\end{fcvref}
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Compiler Converts a Store to a Load]
+\begin{fcvlabel}[ln:toolsoftrade:Compiler Converts a Store to a Load]
 \begin{VerbatimL}[commandchars=\\\[\]]
 r1 = p;\lnlbl[load:p]
 if (unlikely(r1))\lnlbl[if]
@@ -2009,12 +2009,12 @@ barrier();\lnlbl[barrier]
 if (p != NULL)\lnlbl[if1]
 	p = NULL;\lnlbl[null]
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Compiler Converts a Store to a Load}
 \label{lst:toolsoftrade:Compiler Converts a Store to a Load}
 \end{listing}
 
-\begin{lineref}[ln:toolsoftrade:Compiler Converts a Store to a Load]
+\begin{fcvref}[ln:toolsoftrade:Compiler Converts a Store to a Load]
 Such a compiler might therefore guard the store of \co{NULL}
 with a check, as shown on lines~\lnref{if1} and~\lnref{null} of
 Listing~\ref{lst:toolsoftrade:Compiler Converts a Store to a Load}.
@@ -2024,7 +2024,7 @@ For example, a write memory barrier (Linux kernel \co{smp_wmb()}) would
 order the store, but not the load.
 This situation might suggest use of \co{smp_store_release()} over
 \co{smp_wmb()}.
-\end{lineref}
+\end{fcvref}
 
 {\bf Dead-code elimination} can occur when the compiler notices that
 the value from a load is never used, or when a variable is stored to,
@@ -2127,13 +2127,13 @@ complex, and are left aside for the time being.
 So how does \co{volatile} stack up against the earlier examples?
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Avoiding Danger, 2018 Style]
+\begin{fcvlabel}[ln:toolsoftrade:Avoiding Danger, 2018 Style]
 \begin{VerbatimL}[commandchars=\\\{\}]
 ptr = READ_ONCE(global_ptr);\lnlbl{temp}
 if (ptr != NULL && ptr < high_address)
 	do_low(ptr);
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Avoiding Danger, 2018 Style}
 \label{lst:toolsoftrade:Avoiding Danger, 2018 Style}
 \end{listing}
@@ -2146,12 +2146,12 @@ resulting in the code shown in
 Listing~\ref{lst:toolsoftrade:Avoiding Danger, 2018 Style}.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Preventing Load Fusing]
+\begin{fcvlabel}[ln:toolsoftrade:Preventing Load Fusing]
 \begin{VerbatimL}[commandchars=\\\{\}]
 while (!READ_ONCE(need_to_stop))
 	do_something_quickly();
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Preventing Load Fusing}
 \label{lst:toolsoftrade:Preventing Load Fusing}
 \end{listing}
@@ -2162,7 +2162,7 @@ Listing~\ref{lst:toolsoftrade:Preventing Load Fusing},
 Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Loads}.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Preventing Store Fusing and Invented Stores]
+\begin{fcvlabel}[ln:toolsoftrade:Preventing Store Fusing and Invented Stores]
 \begin{VerbatimL}[commandchars=\\\[\]]
 void shut_it_down(void)
 {
@@ -2182,7 +2182,7 @@ void work_until_shut_down(void)
 	WRITE_ONCE(other_task_ready, 1); /* BUGGY!!! */\lnlbl[other:store]
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Preventing Store Fusing and Invented Stores}
 \label{lst:toolsoftrade:Preventing Store Fusing and Invented Stores}
 \end{listing}
@@ -2197,14 +2197,14 @@ some additional tricks taught in
 Section~\ref{sec:toolsoftrade:Assembling the Rest of a Solution}.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Disinviting an Invented Store]
+\begin{fcvlabel}[ln:toolsoftrade:Disinviting an Invented Store]
 \begin{VerbatimL}[commandchars=\\\{\}]
 if (condition)
 	WRITE_ONCE(a, 1);
 else
 	do_a_bunch_of_stuff();
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Disinviting an Invented Store}
 \label{lst:toolsoftrade:Disinviting an Invented Store}
 \end{listing}
@@ -2239,7 +2239,7 @@ as exemplified by the \co{barrier()} macro shown in
 Listing~\ref{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)}.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Preventing C Compilers From Fusing Loads]
+\begin{fcvlabel}[ln:toolsoftrade:Preventing C Compilers From Fusing Loads]
 \begin{VerbatimL}[commandchars=\\\[\]]
 while (!need_to_stop) {
 	barrier(); \lnlbl[b1]
@@ -2247,7 +2247,7 @@ while (!need_to_stop) {
 	barrier(); \lnlbl[b2]
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Preventing C Compilers From Fusing Loads}
 \label{lst:toolsoftrade:Preventing C Compilers From Fusing Loads}
 \end{listing}
@@ -2271,7 +2271,7 @@ These two lines of code prevent the compiler from pushing the load from
 direction.
 
 \begin{listing}[tbp]
-\begin{linelabel}[ln:toolsoftrade:Preventing Reordering]
+\begin{fcvlabel}[ln:toolsoftrade:Preventing Reordering]
 \begin{VerbatimL}[commandchars=\\\[\]]
 void shut_it_down(void)
 {
@@ -2297,7 +2297,7 @@ void work_until_shut_down(void)
 	WRITE_ONCE(other_task_ready, 1);\lnlbl[other:store]
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{fcvlabel}
 \caption{Preventing Reordering}
 \label{lst:toolsoftrade:Preventing Reordering}
 \end{listing}
@@ -2314,10 +2314,10 @@ prevented store fusing and invention, and
 Listing~\ref{lst:toolsoftrade:Preventing Reordering}
 further prevents the remaining reordering by addition of
 \co{smp_mb()} on
-\begin{lineref}[ln:toolsoftrade:Preventing Reordering]
+\begin{fcvref}[ln:toolsoftrade:Preventing Reordering]
 lines~\lnref{mb1}, \lnref{mb2}, \lnref{mb3}, \lnref{mb4},
 and~\lnref{mb5}.
-\end{lineref}
+\end{fcvref}
 The \co{smp_mb()} macro is similar to \co{barrier()} shown in
 Listing~\ref{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)},
 but with the empty string replaced by a string containing the
diff --git a/utilities/checkfcv.pl b/utilities/checkfcv.pl
index 7a0a92b2..2f99d1cb 100755
--- a/utilities/checkfcv.pl
+++ b/utilities/checkfcv.pl
@@ -13,8 +13,8 @@ use warnings;
 my $line;
 my $lnlbl_re;
 my $checking = 0;
-my $linelabel_re = qr/\\begin\{linelabel\}\[([^\]]*)\]/ ;
-my $end_linelabel_re = qr/\\end\{linelabel\}/ ;
+my $fcvlabel_re = qr/\\begin\{fcvlabel\}\[([^\]]*)\]/ ;
+my $end_fcvlabel_re = qr/\\end\{fcvlabel\}/ ;
 my $Verbatim_cmd_re = qr/\\begin\{Verbatim[LNU]\}\[commandchars=(.{6}).*\]/ ;
 my $Verbatim_re = qr/\\begin\{Verbatim[LNU]\}/ ;
 my $end_Verbatim_re = qr/\\end\{Verbatim[LNU]\}/ ;
@@ -33,11 +33,11 @@ open(my $fh, '<:encoding(UTF-8)', $fcv_file)
 
 while($line = <$fh>) {
     $line_count = $line_count + 1;
-    if ($line =~ /$linelabel_re/) {
+    if ($line =~ /$fcvlabel_re/) {
 	$checking = 1;
     }
     if ($checking == 3) {
-	if ($line =~ /$end_linelabel_re/) {
+	if ($line =~ /$end_fcvlabel_re/) {
 	    $checking = 4;
 	}
     }
diff --git a/utilities/fcvextract.pl b/utilities/fcvextract.pl
index 04e3b222..97608fa6 100755
--- a/utilities/fcvextract.pl
+++ b/utilities/fcvextract.pl
@@ -42,7 +42,7 @@
 # Verbatim environment of fancyvrb package):
 #
 # ---
-# \begin{linelabel}[ln:toolsoftrade:api-pthreads:waitall]
+# \begin{fcvlabel}[ln:toolsoftrade:api-pthreads:waitall]
 # \begin{VerbatimL}[commandchars=\%\[\]]
 # 	int pid;
 # 	int status;
@@ -57,7 +57,7 @@
 # 		}
 # 	}%lnlbl[loopb]
 # \end{VerbatimL}
-# \end{linelabel}
+# \end{fcvlabel}
 # ---
 #
 # <snippet identifier> corresponds to a meta command embedded in
@@ -84,7 +84,7 @@
 #     "ln:<chapter>:<file name>:<function>:<line label>"
 #
 # in LaTeX processing, this script will enclose the snippet with
-# a pair of \begin{linelabel} and \end{linelabel} as shown above.
+# a pair of \begin{fcvlabel} and \end{fcvlabel} as shown above.
 #
 # To omit a line in extracted snippet, put "\fcvexclude" in comment
 # on the line.
@@ -241,7 +241,7 @@ while($line = <>) {
 	print "% Do not edit!\n" ;
 	print "% Generated by utilities/fcvextract.pl.\n" ;
 	if ($line =~ /labelbase=([^,\]]+)/) {
-	    print "\\begin\{linelabel}\[$1\]\n" ;
+	    print "\\begin\{fcvlabel}\[$1\]\n" ;
 	    $_ = $line ;
 	    s/labelbase=[^,\]]+,?// ;
 	    $line = $_ ;
@@ -303,7 +303,7 @@ while($line = <>) {
     }
 }
 if ($extracting == 2) {
-    print "\\end\{$env_name\}\n\\end\{linelabel\}\n" ;
+    print "\\end\{$env_name\}\n\\end\{fcvlabel\}\n" ;
     exit 0;
 } else {
     exit 1;
-- 
2.17.1

