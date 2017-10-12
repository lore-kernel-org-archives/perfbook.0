Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=dqwUKzevgHOyvc2eSIyx7oEyjtHuik6QEREMvf5ClRQ=;
 b=Q9cn1XJJ8BcENKngrLlksPaaxUwjLzy4ddhJMNyPGPmOp0zafCb8UZPoB5doC6ykWm
 34bgIS83Tfs33H8ikZlWFZc5bkRnO4jB+OEWYjlHEBIQutOLkzEsrgxdbBtMjlS7Lj3U
 23iMqAojsGij8HBXycxwofZ+xSHH8DTtdLgbDp9WaWRUL6VaMpWfkplZNdD15OqUhE2p
 IGyT42IgD172s1DrUJM+nW56Q6zt6/z6ROK2Pf1pToVqiaL+sKmayoHSyrzzAkjn430w
 Yu6LPdKivt2UGZanGJajNZ83J03NYHYrDGC9ymBR5rYUPfnPE6YkuVTJZWKhQtRBYnV8
 MZgQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Convert code snippets to 'listing' env (datastruct,
 debugging, formal)
Message-ID: <8067f54a-44c3-6776-b4ee-7c2d239f5818@gmail.com>
Date: Fri, 13 Oct 2017 00:39:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 22e222957a1e08b744380d681cc2eb67097314d7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 13 Oct 2017 00:34:22 +0900
Subject: [PATCH] Convert code snippets to 'listing' env (datastruct, debugging, formal)

Also convert those in SMPdesign/beyond.tex.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/beyond.tex      |  46 +++++++-------
 datastruct/datastruct.tex | 158 +++++++++++++++++++++++-----------------------
 debugging/debugging.tex   |  20 +++---
 formal/axiomatic.tex      |  18 +++---
 formal/dyntickrcu.tex     |  80 +++++++++++------------
 formal/ppcmem.tex         |  38 +++++------
 formal/spinhint.tex       | 124 ++++++++++++++++++------------------
 7 files changed, 242 insertions(+), 242 deletions(-)

diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 1fb2a6b..65f2518 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -53,7 +53,7 @@ presents future directions and concluding remarks.
 \subsection{Work-Queue Parallel Maze Solver}
 \label{sec:SMPdesign:Work-Queue Parallel Maze Solver}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 int maze_solve(maze *mp, cell sc, cell ec)
@@ -83,11 +83,11 @@ presents future directions and concluding remarks.
 \centering
 \theverbbox
 \caption{SEQ Pseudocode}
-\label{fig:SMPdesign:SEQ Pseudocode}
-\end{figure}
+\label{lst:SMPdesign:SEQ Pseudocode}
+\end{listing}

 PWQ is based on SEQ, which is shown in
-Figure~\ref{fig:SMPdesign:SEQ Pseudocode}
+Listing~\ref{lst:SMPdesign:SEQ Pseudocode}
 (\path{maze_seq.c}).
 The maze is represented by a 2D array of cells and
 a linear-array-based work queue named \co{->visited}.
@@ -99,7 +99,7 @@ visited cell with an unvisited neighbor, and the loop spanning
 lines~14-19 traverses one fork of the submaze headed by that neighbor.
 Line~20 initializes for the next pass through the outer loop.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 int maze_try_visit_cell(struct maze *mp, cell c, cell t,
@@ -135,11 +135,11 @@ Line~20 initializes for the next pass through the outer loop.
 \centering
 \theverbbox
 \caption{SEQ Helper Pseudocode}
-\label{fig:SMPdesign:SEQ Helper Pseudocode}
-\end{figure}
+\label{lst:SMPdesign:SEQ Helper Pseudocode}
+\end{listing}

 The pseudocode for \co{maze_try_visit_cell()} is shown on lines~1-12
-of Figure~\ref{fig:SMPdesign:SEQ Helper Pseudocode}
+of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode}
 (\path{maze.c}).
 Line~4 checks to see if cells \co{c} and \co{n} are adjacent and connected,
 while line~5 checks to see if cell \co{n} has not yet been visited.
@@ -151,7 +151,7 @@ is now full, and line~10 marks this cell as visited and also records
 the distance from the maze start.  Line~11 then returns success.

 The pseudocode for \co{maze_find_any_next_cell()} is shown on lines~14-28
-of Figure~\ref{fig:SMPdesign:SEQ Helper Pseudocode}
+of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode}
 (\path{maze.c}).
 Line~17 picks up the current cell's distance plus 1,
 while lines~19, 21, 23, and~25
@@ -185,13 +185,13 @@ consecutively decreasing cell numbers traverses the solution.

 The parallel work-queue solver is a straightforward parallelization
 of the algorithm shown in
-Figures~\ref{fig:SMPdesign:SEQ Pseudocode} and ~\ref{fig:SMPdesign:SEQ Helper Pseudocode}.
-Line~10 of Figure~\ref{fig:SMPdesign:SEQ Pseudocode} must use fetch-and-add,
+Listings~\ref{lst:SMPdesign:SEQ Pseudocode} and~\ref{lst:SMPdesign:SEQ Helper Pseudocode}.
+Line~10 of Listing~\ref{lst:SMPdesign:SEQ Pseudocode} must use fetch-and-add,
 and the local variable \co{vi} must be shared among the various threads.
-Lines~5 and~10 of Figure~\ref{fig:SMPdesign:SEQ Helper Pseudocode} must be
+Lines~5 and~10 of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode} must be
 combined into a CAS loop, with CAS failure indicating a loop in the
 maze.
-Lines~8-9 of this figure must use fetch-and-add to arbitrate concurrent
+Lines~8-9 of this listing must use fetch-and-add to arbitrate concurrent
 attempts to record cells in the \co{->visited[]} array.

 This approach does provide significant speedups on a dual-CPU
@@ -227,7 +227,7 @@ This section applies this strategy, using two child threads that start
 at opposite ends of the solution path, and takes a brief look at the
 performance and scalability consequences.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 int maze_solve_child(maze *mp, cell *visited, cell sc)
@@ -260,11 +260,11 @@ performance and scalability consequences.
 \centering
 \theverbbox
 \caption{Partitioned Parallel Solver Pseudocode}
-\label{fig:SMPdesign:Partitioned Parallel Solver Pseudocode}
-\end{figure}
+\label{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}
+\end{listing}

 The partitioned parallel algorithm (PART), shown in
-Figure~\ref{fig:SMPdesign:Partitioned Parallel Solver Pseudocode}
+Listing~\ref{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}
 (\path{maze_part.c}),
 is similar to SEQ, but has a few important differences.
 First, each child thread has its own \co{visited} array, passed in by
@@ -290,7 +290,7 @@ compare-and-swap to mark a cell as visited, however
 no constraints on ordering are required beyond those provided by
 thread creation and join.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 int maze_try_visit_cell(struct maze *mp, int c, int t,
@@ -321,14 +321,14 @@ thread creation and join.
 \centering
 \theverbbox
 \caption{Partitioned Parallel Helper Pseudocode}
-\label{fig:SMPdesign:Partitioned Parallel Helper Pseudocode}
-\end{figure}
+\label{lst:SMPdesign:Partitioned Parallel Helper Pseudocode}
+\end{listing}

 The pseudocode for \co{maze_find_any_next_cell()} is identical to that shown in
-Figure~\ref{fig:SMPdesign:SEQ Helper Pseudocode},
+Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode},
 but the pseudocode for \co{maze_try_visit_cell()} differs, and
 is shown in
-Figure~\ref{fig:SMPdesign:Partitioned Parallel Helper Pseudocode}.
+Listing~\ref{lst:SMPdesign:Partitioned Parallel Helper Pseudocode}.
 Lines~8-9 check to see if the cells are connected, returning failure
 if not.
 The loop spanning lines~11-18 attempts to mark the new cell visited.
@@ -500,7 +500,7 @@ please proceed to the next section.
 The presence of algorithmic superlinear speedups suggests simulating
 parallelism via co-routines, for example, manually switching context
 between threads on each pass through the main do-while loop in
-Figure~\ref{fig:SMPdesign:Partitioned Parallel Solver Pseudocode}.
+Listing~\ref{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}.
 This context switching is straightforward because the context
 consists only of the variables \co{c} and \co{vi}: Of the numerous
 ways to achieve the effect, this is a good tradeoff between
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 8b8dd0a..e6c3f17 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -140,7 +140,7 @@ offers excellent scalability.
 \subsection{Hash-Table Implementation}
 \label{sec:datastruct:Hash-Table Implementation}

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 struct ht_elem {
@@ -162,8 +162,8 @@ offers excellent scalability.
 \centering
 \theverbbox
 \caption{Hash-Table Data Structures}
-\label{fig:datastruct:Hash-Table Data Structures}
-\end{figure}
+\label{lst:datastruct:Hash-Table Data Structures}
+\end{listing}

 \begin{figure}[tb]
 \centering
@@ -172,22 +172,22 @@ offers excellent scalability.
 \label{fig:datastruct:Hash-Table Data-Structure Diagram}
 \end{figure}

-Figure~\ref{fig:datastruct:Hash-Table Data Structures}
+Listing~\ref{lst:datastruct:Hash-Table Data Structures}
 (\path{hash_bkt.c})
 shows a set of data structures used in a simple fixed-sized hash
 table using chaining and per-hash-bucket locking, and
 Figure~\ref{fig:datastruct:Hash-Table Data-Structure Diagram}
 diagrams how they fit together.
 The \co{hashtab} structure (lines~11-14 in
-Figure~\ref{fig:datastruct:Hash-Table Data Structures})
+Listing~\ref{lst:datastruct:Hash-Table Data Structures})
 contains four \co{ht_bucket} structures (lines~6-9 in
-Figure~\ref{fig:datastruct:Hash-Table Data Structures}),
+Listing~\ref{lst:datastruct:Hash-Table Data Structures}),
 with the \co{->ht_nbuckets} field controlling the number of buckets.
 Each such bucket contains a list header \co{->htb_head} and
 a lock \co{->htb_lock}.
 The list headers chain \co{ht_elem} structures
 (lines~1-4 in
-Figure~\ref{fig:datastruct:Hash-Table Data Structures})
+Listing~\ref{lst:datastruct:Hash-Table Data Structures})
 through their
 \co{->hte_next} fields, and each \co{ht_elem} structure also caches
 the corresponding element's hash value in the \co{->hte_hash} field.
@@ -199,7 +199,7 @@ The diagram shown in
 Figure~\ref{fig:datastruct:Hash-Table Data-Structure Diagram}
 has bucket~0 with two elements and bucket~2 with one.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 #define HASH2BKT(htp, h) \
@@ -221,10 +221,10 @@ has bucket~0 with two elements and bucket~2 with one.
 \centering
 \theverbbox
 \caption{Hash-Table Mapping and Locking}
-\label{fig:datastruct:Hash-Table Mapping and Locking}
-\end{figure}
+\label{lst:datastruct:Hash-Table Mapping and Locking}
+\end{listing}

-Figure~\ref{fig:datastruct:Hash-Table Mapping and Locking}
+Listing~\ref{lst:datastruct:Hash-Table Mapping and Locking}
 shows mapping and locking functions.
 Lines~1 and~2 show the macro \co{HASH2BKT()}, which maps from a hash value
 to the corresponding \co{ht_bucket} structure.
@@ -233,7 +233,7 @@ the caller needs to implement it when mapping from key to hash value.
 The remaining two functions acquire and release the \co{->htb_lock}
 corresponding to the specified hash value.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 struct ht_elem *
@@ -262,10 +262,10 @@ corresponding to the specified hash value.
 \centering
 \theverbbox
 \caption{Hash-Table Lookup}
-\label{fig:datastruct:Hash-Table Lookup}
-\end{figure}
+\label{lst:datastruct:Hash-Table Lookup}
+\end{listing}

-Figure~\ref{fig:datastruct:Hash-Table Lookup}
+Listing~\ref{lst:datastruct:Hash-Table Lookup}
 shows \co{hashtab_lookup()},
 which returns a pointer to the element with the specified hash and key if it
 exists, or \co{NULL} otherwise.
@@ -285,7 +285,7 @@ If no element matches, line~20 returns \co{NULL}.

 \QuickQuiz{}
 	But isn't the double comparison on lines~15-18 in
-	Figure~\ref{fig:datastruct:Hash-Table Lookup} inefficient
+	Listing~\ref{lst:datastruct:Hash-Table Lookup} inefficient
 	in the case where the key fits into an unsigned long?
 \QuickQuizAnswer{
 	Indeed it is!
@@ -297,7 +297,7 @@ If no element matches, line~20 returns \co{NULL}.
 	for the reader.
 } \QuickQuizEnd

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 void
@@ -319,10 +319,10 @@ If no element matches, line~20 returns \co{NULL}.
 \centering
 \theverbbox
 \caption{Hash-Table Modification}
-\label{fig:datastruct:Hash-Table Modification}
-\end{figure}
+\label{lst:datastruct:Hash-Table Modification}
+\end{listing}

-Figure~\ref{fig:datastruct:Hash-Table Modification}
+Listing~\ref{lst:datastruct:Hash-Table Modification}
 shows the \co{hashtab_add()} and \co{hashtab_del()} functions
 that add and delete elements from the hash table, respectively.

@@ -337,7 +337,7 @@ ensure that no other thread is accessing
 or modifying this same bucket, for example, by invoking
 \co{hashtab_lock()} beforehand.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 struct hashtab *
@@ -368,10 +368,10 @@ or modifying this same bucket, for example, by invoking
 \centering
 \theverbbox
 \caption{Hash-Table Allocation and Free}
-\label{fig:datastruct:Hash-Table Allocation and Free}
-\end{figure}
+\label{lst:datastruct:Hash-Table Allocation and Free}
+\end{listing}

-Figure~\ref{fig:datastruct:Hash-Table Allocation and Free}
+Listing~\ref{lst:datastruct:Hash-Table Allocation and Free}
 shows \co{hashtab_alloc()} and \co{hashtab_free()},
 which do hash-table allocation and freeing, respectively.
 Allocation begins on lines~7-9 with allocation of the underlying memory.
@@ -546,7 +546,7 @@ section~\cite{McKenney:2013:SDS:2483852.2483867}.
 \subsection{RCU-Protected Hash Table Implementation}
 \label{sec:datastruct:RCU-Protected Hash Table Implementation}

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 static void hashtab_lock_lookup(struct hashtab *htp,
@@ -565,24 +565,24 @@ section~\cite{McKenney:2013:SDS:2483852.2483867}.
 \centering
 \theverbbox
 \caption{RCU-Protected Hash-Table Read-Side Concurrency Control}
-\label{fig:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}
-\end{figure}
+\label{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}
+\end{listing}

 For an RCU-protected hash table with per-bucket locking,
 updaters use locking exactly as described in
 Section~\ref{sec:datastruct:Partitionable Data Structures},
 but readers use RCU.
 The data structures remain as shown in
-Figure~\ref{fig:datastruct:Hash-Table Data Structures},
+Listing~\ref{lst:datastruct:Hash-Table Data Structures},
 and the \co{HASH2BKT()}, \co{hashtab_lock()}, and \co{hashtab_unlock()}
 functions remain as shown in
-Figure~\ref{fig:datastruct:Hash-Table Mapping and Locking}.
+Listing~\ref{lst:datastruct:Hash-Table Mapping and Locking}.
 However, readers use the lighter-weight concurrency-control embodied
 by \co{hashtab_lock_lookup()} and \co{hashtab_unlock_lookup()}
 shown in
-Figure~\ref{fig:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}.
+Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 struct ht_elem
@@ -611,14 +611,14 @@ Figure~\ref{fig:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Contro
 \centering
 \theverbbox
 \caption{RCU-Protected Hash-Table Lookup}
-\label{fig:datastruct:RCU-Protected Hash-Table Lookup}
-\end{figure}
+\label{lst:datastruct:RCU-Protected Hash-Table Lookup}
+\end{listing}

-Figure~\ref{fig:datastruct:RCU-Protected Hash-Table Lookup}
+Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Lookup}
 shows \co{hashtab_lookup()} for the RCU-protected per-bucket-locked
 hash table.
 This is identical to that in
-Figure~\ref{fig:datastruct:Hash-Table Lookup}
+Listing~\ref{lst:datastruct:Hash-Table Lookup}
 except that \co{cds_list_for_each_entry()} is replaced
 by \co{cds_list_for_each_entry_rcu()}.
 Both of these primitives sequence down the hash chain referenced
@@ -651,7 +651,7 @@ RCU read-side critical section, for example, the caller must invoke
 	before freeing the deleted element.
 } \QuickQuizEnd

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 void
@@ -673,14 +673,14 @@ RCU read-side critical section, for example, the caller must invoke
 \centering
 \theverbbox
 \caption{RCU-Protected Hash-Table Modification}
-\label{fig:datastruct:RCU-Protected Hash-Table Modification}
-\end{figure}
+\label{lst:datastruct:RCU-Protected Hash-Table Modification}
+\end{listing}

-Figure~\ref{fig:datastruct:RCU-Protected Hash-Table Modification}
+Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Modification}
 shows \co{hashtab_add()} and \co{hashtab_del()}, both of which
 are quite similar to their counterparts in the non-RCU hash table
 shown in
-Figure~\ref{fig:datastruct:Hash-Table Modification}.
+Listing~\ref{lst:datastruct:Hash-Table Modification}.
 The \co{hashtab_add()} function uses \co{cds_list_add_rcu()} instead
 of \co{cds_list_add()} in order to ensure proper ordering when
 an element is added to the hash table at the same time that it is
@@ -1014,7 +1014,7 @@ which is the subject of the next section.
 \subsection{Resizable Hash Table Implementation}
 \label{sec:datastruct:Resizable Hash Table Implementation}

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 struct ht_elem {
@@ -1052,13 +1052,13 @@ which is the subject of the next section.
 \centering
 \theverbbox
 \caption{Resizable Hash-Table Data Structures}
-\label{fig:datastruct:Resizable Hash-Table Data Structures}
-\end{figure}
+\label{lst:datastruct:Resizable Hash-Table Data Structures}
+\end{listing}

 Resizing is accomplished by the classic approach of inserting a level
 of indirection, in this case, the \co{ht} structure shown on
 lines~12-25 of
-Figure~\ref{fig:datastruct:Resizable Hash-Table Data Structures}.
+Listing~\ref{lst:datastruct:Resizable Hash-Table Data Structures}.
 The \co{hashtab} structure shown on lines~27-30 contains only a
 pointer to the current \co{ht} structure along with a spinlock that
 is used to serialize concurrent attempts to resize the hash table.
@@ -1121,7 +1121,7 @@ Conversely, if the bucket that would be selected from the old table
 has not yet been distributed, then the bucket should be selected from
 the old table.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 static struct ht_bucket *
@@ -1153,11 +1153,11 @@ the old table.
 \centering
 \theverbbox
 \caption{Resizable Hash-Table Bucket Selection}
-\label{fig:datastruct:Resizable Hash-Table Bucket Selection}
-\end{figure}
+\label{lst:datastruct:Resizable Hash-Table Bucket Selection}
+\end{listing}

 Bucket selection is shown in
-Figure~\ref{fig:datastruct:Resizable Hash-Table Bucket Selection},
+Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection},
 which shows \co{ht_get_bucket_single()} on lines~1-8 and
 \co{ht_get_bucket()} on lines~10-24.
 The \co{ht_get_bucket_single()} function returns a reference to the bucket
@@ -1179,7 +1179,7 @@ again storing the hash value through parameter \co{b}.

 \QuickQuiz{}
 	The code in
-	Figure~\ref{fig:datastruct:Resizable Hash-Table Bucket Selection}
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection}
 	computes the hash twice!
 	Why this blatant inefficiency?
 \QuickQuizAnswer{
@@ -1195,7 +1195,7 @@ Finally, line~23 returns a reference to the selected hash bucket.

 \QuickQuiz{}
 	How does the code in
-	Figure~\ref{fig:datastruct:Resizable Hash-Table Bucket Selection}
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection}
 	protect against the resizing process progressing past the
 	selected bucket?
 \QuickQuizAnswer{
@@ -1209,7 +1209,7 @@ This implementation of
 will permit lookups and modifications to run concurrently
 with a resize operation.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 void hashtab_lock_mod(struct hashtab *htp_master,
@@ -1249,18 +1249,18 @@ with a resize operation.
 \centering
 \theverbbox
 \caption{Resizable Hash-Table Update-Side Concurrency Control}
-\label{fig:datastruct:Resizable Hash-Table Update-Side Concurrency Control}
-\end{figure}
+\label{lst:datastruct:Resizable Hash-Table Update-Side Concurrency Control}
+\end{listing}

 Read-side concurrency control is provided by RCU as was shown in
-Figure~\ref{fig:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control},
+Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control},
 but the update-side concurrency-control functions
 \co{hashtab_lock_mod()} and \co{hashtab_unlock_mod()}
 must now deal with the possibility of a
 concurrent resize operation as shown in
-Figure~\ref{fig:datastruct:Resizable Hash-Table Update-Side Concurrency Control}.
+Listing~\ref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency Control}.

-The \co{hashtab_lock_mod()} spans lines~1-19 in the figure.
+The \co{hashtab_lock_mod()} spans lines~1-19 in the listing.
 Line~9 enters an RCU read-side critical section to prevent
 the data structures from being freed during the traversal,
 line~10 acquires a reference to the current hash table, and then
@@ -1285,8 +1285,8 @@ section.

 \QuickQuiz{}
 	The code in
-	Figures~\ref{fig:datastruct:Resizable Hash-Table Bucket Selection}
-	and~\ref{fig:datastruct:Resizable Hash-Table Update-Side Concurrency Control}
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection}
+	and~\ref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency Control}
 	computes the hash and executes the bucket-selection logic twice for
 	updates!
 	Why this blatant inefficiency?
@@ -1327,7 +1327,7 @@ RCU read-side critical section.
 	critical section to complete.
 } \QuickQuizEnd

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 struct ht_elem *
@@ -1387,14 +1387,14 @@ RCU read-side critical section.
 \centering
 \theverbbox
 \caption{Resizable Hash-Table Access Functions}
-\label{fig:datastruct:Resizable Hash-Table Access Functions}
-\end{figure}
+\label{lst:datastruct:Resizable Hash-Table Access Functions}
+\end{listing}

 Now that we have bucket selection and concurrency control in place,
 we are ready to search and update our resizable hash table.
 The \co{hashtab_lookup()}, \co{hashtab_add()}, and \co{hashtab_del()}
 functions shown in
-Figure~\ref{fig:datastruct:Resizable Hash-Table Access Functions}.
+Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}.

 The \co{hashtab_lookup()} function on lines~1-21 of the figure does
 hash lookups.
@@ -1412,7 +1412,7 @@ failure.

 \QuickQuiz{}
 	In the \co{hashtab_lookup()} function in
-	Figure~\ref{fig:datastruct:Resizable Hash-Table Access Functions},
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions},
 	the code carefully finds the right bucket in the new hash table
 	if the element to be looked up has already been distributed
 	by a concurrent resize operation.
@@ -1452,7 +1452,7 @@ a concurrent resize operation.

 \QuickQuiz{}
 	The \co{hashtab_del()} function in
-	Figure~\ref{fig:datastruct:Resizable Hash-Table Access Functions}
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}
 	does not always remove the element from the old hash table.
 	Doesn't this mean that readers might access this newly removed
 	element after it has been freed?
@@ -1472,7 +1472,7 @@ a concurrent resize operation.
 	\co{hashtab_lookup()} operations.
 } \QuickQuizEnd

-\begin{figure*}[tb]
+\begin{listing*}[tb]
 { \scriptsize
 \begin{verbbox}
  1 int hashtab_resize(struct hashtab *htp_master,
@@ -1530,12 +1530,12 @@ a concurrent resize operation.
 \centering
 \theverbbox
 \caption{Resizable Hash-Table Resizing}
-\label{fig:datastruct:Resizable Hash-Table Resizing}
-\end{figure*}
+\label{lst:datastruct:Resizable Hash-Table Resizing}
+\end{listing*}

 The actual resizing itself is carried out by \co{hashtab_resize}, shown in
-Figure~\ref{fig:datastruct:Resizable Hash-Table Resizing} on
-page~\pageref{fig:datastruct:Resizable Hash-Table Resizing}.
+Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing} on
+page~\pageref{lst:datastruct:Resizable Hash-Table Resizing}.
 Line~17 conditionally acquires the top-level \co{->ht_lock}, and if
 this acquisition fails, line~18 returns \co{-EBUSY} to indicate that
 a resize is already in progress.
@@ -1562,14 +1562,14 @@ line~35 acquires that bucket's spinlock, and line~36 updates

 \QuickQuiz{}
 	In the \co{hashtab_resize()} function in
-	Figure~\ref{fig:datastruct:Resizable Hash-Table Access Functions},
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions},
 	what guarantees that the update to \co{->ht_new} on line~29
 	will be seen as happening before the update to \co{->ht_resize_cur}
 	on line~36 from the perspective of \co{hashtab_lookup()},
 	\co{hashtab_add()}, and \co{hashtab_del()}?
 \QuickQuizAnswer{
 	The \co{synchronize_rcu()} on line~30 of
-	Figure~\ref{fig:datastruct:Resizable Hash-Table Access Functions}
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}
 	ensures that all pre-existing RCU readers have completed between
 	the time that we install the new hash-table reference on
 	line~29 and the time that we update \co{->ht_resize_cur} on
@@ -1931,8 +1931,8 @@ This overhead can be eliminated by specializing a hash-table implementation
 to a given key type and hash function.
 Doing so eliminates the \co{->ht_cmp()}, \co{->ht_gethash()}, and
 \co{->ht_getkey()} function pointers in the \co{ht} structure shown in
-Figure~\ref{fig:datastruct:Resizable Hash-Table Data Structures} on
-page~\pageref{fig:datastruct:Resizable Hash-Table Data Structures}.
+Listing~\ref{lst:datastruct:Resizable Hash-Table Data Structures} on
+page~\pageref{lst:datastruct:Resizable Hash-Table Data Structures}.
 It also eliminates the corresponding calls through these pointers,
 which could allow the compiler to inline the resulting fixed functions,
 eliminating not only the overhead of the call instruction, but the
@@ -1985,8 +1985,8 @@ days of four-kilobyte address spaces.
 The hash tables discussed in this chapter made almost no attempt to conserve
 memory.
 For example, the \co{->ht_idx} field in the \co{ht} structure in
-Figure~\ref{fig:datastruct:Resizable Hash-Table Data Structures} on
-page~\pageref{fig:datastruct:Resizable Hash-Table Data Structures}
+Listing~\ref{lst:datastruct:Resizable Hash-Table Data Structures} on
+page~\pageref{lst:datastruct:Resizable Hash-Table Data Structures}
 always has a value of either zero or one, yet takes up a full 32 bits
 of memory.
 It could be eliminated, for example, by stealing a bit from the
@@ -2069,7 +2069,7 @@ If other CPUs attempted to traverse the hash bucket list containing
 that element, they would incur expensive cache misses, degrading both
 performance and scalability.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
 1 struct hash_elem {
@@ -2081,11 +2081,11 @@ performance and scalability.
 \centering
 \theverbbox
 \caption{Alignment for 64-Byte Cache Lines}
-\label{fig:datastruct:Alignment for 64-Byte Cache Lines}
-\end{figure}
+\label{lst:datastruct:Alignment for 64-Byte Cache Lines}
+\end{listing}

 One way to solve this problem on systems with 64-byte cache line is shown in
-Figure~\ref{fig:datastruct:Alignment for 64-Byte Cache Lines}.
+Listing~\ref{lst:datastruct:Alignment for 64-Byte Cache Lines}.
 Here \GCC's \co{aligned} attribute is used to force the \co{->counter}
 and the \co{ht_elem} structure into separate cache lines.
 This would allow CPUs to traverse the hash bucket list at full speed
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 7a5f71d..a4537b0 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2094,7 +2094,7 @@ On Linux-based systems, this context switch will be visible in
 Similarly, interrupt-based interference can be detected via the
 \path{/proc/interrupts} file.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
   1 #include <sys/time.h>
@@ -2123,13 +2123,13 @@ Similarly, interrupt-based interference can be detected via the
 \centering
 \theverbbox
 \caption{Using \tco{getrusage()} to Detect Context Switches}
-\label{fig:count:Using getrusage() to Detect Context Switches}
-\end{figure}
+\label{lst:count:Using getrusage() to Detect Context Switches}
+\end{listing}

 Opening and reading files is not the way to low overhead, and it is
 possible to get the count of context switches for a given thread
 by using the \co{getrusage()} system call, as shown in
-Figure~\ref{fig:count:Using getrusage() to Detect Context Switches}.
+Listing~\ref{lst:count:Using getrusage() to Detect Context Switches}.
 This same system call can be used to detect minor page faults (\co{ru_minflt})
 and major page faults (\co{ru_majflt}).

@@ -2177,7 +2177,7 @@ the average inter-element distance for the portion of the list accepted
 thus far, then the next element is accepted and the process repeats.
 Otherwise, the remainder of the list is rejected.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
   1 divisor=3
@@ -2238,10 +2238,10 @@ Otherwise, the remainder of the list is rejected.
 \centering
 \theverbbox
 \caption{Statistical Elimination of Interference}
-\label{fig:count:Statistical Elimination of Interference}
-\end{figure}
+\label{lst:count:Statistical Elimination of Interference}
+\end{listing}

-Figure~\ref{fig:count:Statistical Elimination of Interference}
+Listing~\ref{lst:count:Statistical Elimination of Interference}
 shows a simple \co{sh}/\co{awk} script implementing this notion.
 Input consists of an x-value followed by an arbitrarily long list of y-values,
 and output consists of one line for each input line, with fields as follows:
@@ -2277,7 +2277,7 @@ This script takes three optional arguments as follows:
 \end{description}

 Lines~1-3 of
-Figure~\ref{fig:count:Statistical Elimination of Interference}
+Listing~\ref{lst:count:Statistical Elimination of Interference}
 set the default values for the parameters, and lines~4-21 parse
 any command-line overriding of these parameters.
 The \co{awk} invocation on lines~23 and~24 sets the values of the
@@ -2339,7 +2339,7 @@ Lines~44-52 then compute and print the statistics for the data set.

 	Of course, it is possible to create a script similar to
 	that in
-	Figure~\ref{fig:count:Statistical Elimination of Interference}
+	Listing~\ref{lst:count:Statistical Elimination of Interference}
 	that uses standard deviation rather than absolute difference
 	to get a similar effect,
 	and this is left as an exercise for the interested reader.
diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 903d509..5d79887 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -4,7 +4,7 @@
 \label{sec:formal:Axiomatic Approaches}
 \OriginallyPublished{Section}{sec:formal:Axiomatic Approaches}{Axiomatic Approaches}{Linux Weekly News}{PaulEMcKenney2014weakaxiom}

-\begin{figure*}[tb]
+\begin{listing*}[tb]
 { \scriptsize
 \begin{verbbox}
  1 PPC IRIW.litmus
@@ -28,12 +28,12 @@
 \centering
 \theverbbox
 \caption{IRIW Litmus Test}
-\label{fig:formal:IRIW Litmus Test}
-\end{figure*}
+\label{lst:formal:IRIW Litmus Test}
+\end{listing*}

 Although the PPCMEM tool can solve the famous ``independent reads of
 independent writes'' (IRIW) litmus test shown in
-Figure~\ref{fig:formal:IRIW Litmus Test}, doing so requires no less than
+Listing~\ref{lst:formal:IRIW Litmus Test}, doing so requires no less than
 fourteen CPU hours and generates no less than ten gigabytes of state space.
 That said, this situation is a great improvement over that before the advent
 of PPCMEM, where solving this problem required perusing volumes of
@@ -70,9 +70,9 @@ converts litmus tests to theorems that might be proven or disproven
 over this set of axioms.
 The resulting tool, called ``herd'',  conveniently takes as input the
 same litmus tests as PPCMEM, including the IRIW litmus test shown in
-Figure~\ref{fig:formal:IRIW Litmus Test}.
+Listing~\ref{lst:formal:IRIW Litmus Test}.

-\begin{figure*}[tb]
+\begin{listing*}[tb]
 { \scriptsize
 \begin{verbbox}
  1 PPC IRIW5.litmus
@@ -102,8 +102,8 @@ Figure~\ref{fig:formal:IRIW Litmus Test}.
 \centering
 \theverbbox
 \caption{Expanded IRIW Litmus Test}
-\label{fig:formal:Expanded IRIW Litmus Test}
-\end{figure*}
+\label{lst:formal:Expanded IRIW Litmus Test}
+\end{listing*}

 However, where PPCMEM requires 14 CPU hours to solve IRIW, herd does so
 in 17 milliseconds, which represents a speedup of more than six orders
@@ -112,7 +112,7 @@ That said, the problem is exponential in nature, so we should expect
 herd to exhibit exponential slowdowns for larger problems.
 And this is exactly what happens, for example, if we add four more writes
 per writing CPU as shown in
-Figure~\ref{fig:formal:Expanded IRIW Litmus Test},
+Listing~\ref{lst:formal:Expanded IRIW Litmus Test},
 herd slows down by a factor of more than 50,000, requiring more than
 15 \emph{minutes} of CPU time.
 Adding threads also results in exponential
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 2ae41ae..41b8bf1 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -493,8 +493,8 @@ re-entering dynticks-idle mode (for example, that same task blocking).
 	it is not necessary to model memory barriers.
 	In fact, one must instead explicitly model lack of memory barriers,
 	for example, as shown in
-	Figure~\ref{fig:analysis:QRCU Unordered Summation} on
-	page~\pageref{fig:analysis:QRCU Unordered Summation}.
+	Listing~\ref{lst:analysis:QRCU Unordered Summation} on
+	page~\pageref{lst:analysis:QRCU Unordered Summation}.
 } \QuickQuizEnd

 \QuickQuiz{}
@@ -1759,7 +1759,7 @@ states, passing without errors.
 \subsubsection{Lessons (Re)Learned}
 \label{sec:formal:Lessons (Re)Learned}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  static inline void rcu_enter_nohz(void)
@@ -1780,10 +1780,10 @@ states, passing without errors.
 \centering
 \theverbbox
 \caption{Memory-Barrier Fix Patch}
-\label{fig:formal:Memory-Barrier Fix Patch}
-\end{figure}
+\label{lst:formal:Memory-Barrier Fix Patch}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
 -       if ((curr - snap) > 2 || (snap & 0x1) == 0)
@@ -1793,8 +1793,8 @@ states, passing without errors.
 \centering
 \theverbbox
 \caption{Variable-Name-Typo Fix Patch}
-\label{fig:formal:Variable-Name-Typo Fix Patch}
-\end{figure}
+\label{lst:formal:Variable-Name-Typo Fix Patch}
+\end{listing}

 This effort provided some lessons (re)learned:

@@ -1806,14 +1806,14 @@ This effort provided some lessons (re)learned:
 	a misplaced memory barrier in
 	\co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
 	as shown by the patch in
-	Figure~\ref{fig:formal:Memory-Barrier Fix Patch}.
+	Listing~\ref{lst:formal:Memory-Barrier Fix Patch}.
 \item	{\bf Validate your code early, often, and up to the point
 	of destruction.}
 	This effort located one subtle bug in
 	\co{rcu_try_flip_waitack_needed()}
 	that would have been quite difficult to test or debug, as
 	shown by the patch in
-	Figure~\ref{fig:formal:Variable-Name-Typo Fix Patch}.
+	Listing~\ref{lst:formal:Variable-Name-Typo Fix Patch}.
 \item	{\bf Always verify your verification code.}
 	The usual way to do this is to insert a deliberate bug
 	and verify that the verification code catches it.  Of course,
@@ -1853,7 +1853,7 @@ Manfred Spraul~\cite{ManfredSpraul2008StateMachineRCU}.
 \subsubsection{State Variables for Simplified Dynticks Interface}
 \label{sec:formal:State Variables for Simplified Dynticks Interface}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct rcu_dynticks {
@@ -1873,10 +1873,10 @@ Manfred Spraul~\cite{ManfredSpraul2008StateMachineRCU}.
 \centering
 \theverbbox
 \caption{Variables for Simple Dynticks Interface}
-\label{fig:formal:Variables for Simple Dynticks Interface}
-\end{figure}
+\label{lst:formal:Variables for Simple Dynticks Interface}
+\end{listing}

-Figure~\ref{fig:formal:Variables for Simple Dynticks Interface}
+Listing~\ref{lst:formal:Variables for Simple Dynticks Interface}
 shows the new per-CPU state variables.
 These variables are grouped into structs to allow multiple independent
 RCU implementations (e.g., \co{rcu} and \co{rcu_bh}) to conveniently
@@ -1939,7 +1939,7 @@ passed through a quiescent state during that interval.
 \subsubsection{Entering and Leaving Dynticks-Idle Mode}
 \label{sec:formal:Entering and Leaving Dynticks-Idle Mode}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void rcu_enter_nohz(void)
@@ -1974,10 +1974,10 @@ passed through a quiescent state during that interval.
 \centering
 \theverbbox
 \caption{Entering and Exiting Dynticks-Idle Mode}
-\label{fig:formal:Entering and Exiting Dynticks-Idle Mode}
-\end{figure}
+\label{lst:formal:Entering and Exiting Dynticks-Idle Mode}
+\end{listing}

-Figure~\ref{fig:formal:Entering and Exiting Dynticks-Idle Mode}
+Listing~\ref{lst:formal:Entering and Exiting Dynticks-Idle Mode}
 shows the \co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
 which enter and exit dynticks-idle mode, also known as ``nohz'' mode.
 These two functions are invoked from process context.
@@ -2000,7 +2000,7 @@ the opposite \co{dynticks} polarity.
 \subsubsection{NMIs From Dynticks-Idle Mode}
 \label{sec:formal:NMIs From Dynticks-Idle Mode}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1  void rcu_nmi_enter(void)
@@ -2031,10 +2031,10 @@ the opposite \co{dynticks} polarity.
 \centering
 \theverbbox
 \caption{NMIs From Dynticks-Idle Mode}
-\label{fig:formal:NMIs From Dynticks-Idle Mode}
-\end{figure}
+\label{lst:formal:NMIs From Dynticks-Idle Mode}
+\end{listing}

-Figure~\ref{fig:formal:NMIs From Dynticks-Idle Mode}
+Listing~\ref{lst:formal:NMIs From Dynticks-Idle Mode}
 shows the \co{rcu_nmi_enter()} and \co{rcu_nmi_exit()} functions,
 which inform RCU of NMI entry and exit, respectively, from dynticks-idle
 mode.
@@ -2052,7 +2052,7 @@ respectively.
 \subsubsection{Interrupts From Dynticks-Idle Mode}
 \label{sec:formal:Interrupts From Dynticks-Idle Mode}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void rcu_irq_enter(void)
@@ -2086,10 +2086,10 @@ respectively.
 \centering
 \theverbbox
 \caption{Interrupts From Dynticks-Idle Mode}
-\label{fig:formal:Interrupts From Dynticks-Idle Mode}
-\end{figure}
+\label{lst:formal:Interrupts From Dynticks-Idle Mode}
+\end{listing}

-Figure~\ref{fig:formal:Interrupts From Dynticks-Idle Mode}
+Listing~\ref{lst:formal:Interrupts From Dynticks-Idle Mode}
 shows \co{rcu_irq_enter()} and \co{rcu_irq_exit()}, which
 inform RCU of entry to and exit from, respectively, \IRQ\ context.
 Line~6 of \co{rcu_irq_enter()} increments \co{dynticks_nesting},
@@ -2117,7 +2117,7 @@ a reschedule API if so.
 \subsubsection{Checking For Dynticks Quiescent States}
 \label{sec:formal:Checking For Dynticks Quiescent States}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1  static int
@@ -2143,19 +2143,19 @@ a reschedule API if so.
 \centering
 \theverbbox
 \caption{Saving Dyntick Progress Counters}
-\label{fig:formal:Saving Dyntick Progress Counters}
-\end{figure}
+\label{lst:formal:Saving Dyntick Progress Counters}
+\end{listing}

-Figure~\ref{fig:formal:Saving Dyntick Progress Counters}
+Listing~\ref{lst:formal:Saving Dyntick Progress Counters}
 shows \co{dyntick_save_progress_counter()}, which takes a snapshot
 of the specified CPU's \co{dynticks} and \co{dynticks_nmi}
 counters.
 Lines~8 and~9 snapshot these two variables to locals, line~10
 executes a memory barrier to pair with the memory barriers in
 the functions in
-Figures~\ref{fig:formal:Entering and Exiting Dynticks-Idle Mode},
-\ref{fig:formal:NMIs From Dynticks-Idle Mode}, and
-\ref{fig:formal:Interrupts From Dynticks-Idle Mode}.
+Listings~\ref{lst:formal:Entering and Exiting Dynticks-Idle Mode},
+\ref{lst:formal:NMIs From Dynticks-Idle Mode}, and
+\ref{lst:formal:Interrupts From Dynticks-Idle Mode}.
 Lines~11 and~12 record the snapshots for later calls to
 \co{rcu_implicit_dynticks_qs()},
 and lines~13 and~14 check to see if the CPU is in dynticks-idle mode with
@@ -2164,7 +2164,7 @@ have even values), hence in an extended quiescent state.
 If so, lines~15 and~16 count this event, and line~17 returns
 true if the CPU was in a quiescent state.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1  static int
@@ -2193,10 +2193,10 @@ true if the CPU was in a quiescent state.
 \centering
 \theverbbox
 \caption{Checking Dyntick Progress Counters}
-\label{fig:formal:Checking Dyntick Progress Counters}
-\end{figure}
+\label{lst:formal:Checking Dyntick Progress Counters}
+\end{listing}

-Figure~\ref{fig:formal:Checking Dyntick Progress Counters}
+Listing~\ref{lst:formal:Checking Dyntick Progress Counters}
 shows \co{rcu_implicit_dynticks_qs()}, which is called to check
 whether a CPU has entered dyntick-idle mode subsequent to a call
 to \co{dynticks_save_progress_counter()}.
@@ -2207,9 +2207,9 @@ retrieve the snapshots saved earlier by
 Line~13 then
 executes a memory barrier to pair with the memory barriers in
 the functions in
-Figures~\ref{fig:formal:Entering and Exiting Dynticks-Idle Mode},
-\ref{fig:formal:NMIs From Dynticks-Idle Mode}, and
-\ref{fig:formal:Interrupts From Dynticks-Idle Mode}.
+Listings~\ref{lst:formal:Entering and Exiting Dynticks-Idle Mode},
+\ref{lst:formal:NMIs From Dynticks-Idle Mode}, and
+\ref{lst:formal:Interrupts From Dynticks-Idle Mode}.
 Lines~14-16 then check to see if the CPU is either currently in
 a quiescent state (\co{curr} and \co{curr_nmi} having even values) or
 has passed through a quiescent state since the last call to
diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 7dc9675..9e1bfc6 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -54,7 +54,7 @@ discusses the implications.
 \subsection{Anatomy of a Litmus Test}
 \label{sec:formal:Anatomy of a Litmus Test}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 PPC SB+lwsync-RMW-lwsync+isync-simple
@@ -82,11 +82,11 @@ discusses the implications.
 \centering
 \theverbbox
 \caption{PPCMEM Litmus Test}
-\label{fig:sec:formal:PPCMEM Litmus Test}
-\end{figure}
+\label{lst:sec:formal:PPCMEM Litmus Test}
+\end{listing}

 An example PowerPC litmus test for PPCMEM is shown in
-Figure~\ref{fig:sec:formal:PPCMEM Litmus Test}.
+Listing~\ref{lst:sec:formal:PPCMEM Litmus Test}.
 The ARM interface works exactly the same way, but with ARM instructions
 substituted for the Power instructions and with the initial ``PPC''
 replaced by ``ARM''. You can select the ARM interface by clicking on
@@ -117,7 +117,7 @@ in actual use.

 \QuickQuiz{}
 	Why does line~8
-	of Figure~\ref{fig:sec:formal:PPCMEM Litmus Test}
+	of Listing~\ref{lst:sec:formal:PPCMEM Litmus Test}
 	initialize the registers?
 	Why not instead initialize them on lines~4 and~5?
 \QuickQuizAnswer{
@@ -176,7 +176,7 @@ and line~11 is equivalent to the C statement \co{r3=x}.

 \QuickQuiz{}
 	But whatever happened to line~17 of
-	Figure~\ref{fig:sec:formal:PPCMEM Litmus Test},
+	Listing~\ref{lst:sec:formal:PPCMEM Litmus Test},
 	the one that is the \co{Fail:} label?
 \QuickQuizAnswer{
 	The implementation of powerpc version of \co{atomic_add_return()}
@@ -192,7 +192,7 @@ and line~11 is equivalent to the C statement \co{r3=x}.
 	applicable, but I have not seen an example where it fails.
 } \QuickQuizEnd

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 void P0(void)
@@ -217,12 +217,12 @@ and line~11 is equivalent to the C statement \co{r3=x}.
 \centering
 \theverbbox
 \caption{Meaning of PPCMEM Litmus Test}
-\label{fig:sec:formal:Meaning of PPCMEM Litmus Test}
-\end{figure}
+\label{lst:sec:formal:Meaning of PPCMEM Litmus Test}
+\end{listing}

 Putting all this together, the C-language equivalent to the entire litmus
 test is as shown in
-Figure~\ref{fig:sec:formal:Meaning of PPCMEM Litmus Test}.
+Listing~\ref{lst:sec:formal:Meaning of PPCMEM Litmus Test}.
 The key point is that if \co{atomic_add_return()} acts as a full
 memory barrier (as the Linux kernel requires it to), 
 then it should be impossible for \co{P0()}'s and \co{P1()}'s \co{r3}
@@ -242,7 +242,7 @@ Because it is very difficult to be sure that you have checked every
 possible sequence of events, a separate tool is provided for this
 purpose~\cite{PaulEMcKenney2011ppcmem}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
 ./ppcmem -model lwsync_read_block \
@@ -264,16 +264,16 @@ Observation SB+lwsync-RMW-lwsync+isync Sometimes 1
 \centering
 \theverbbox
 \caption{PPCMEM Detects an Error}
-\label{fig:sec:formal:PPCMEM Detects an Error}
-\end{figure}
+\label{lst:sec:formal:PPCMEM Detects an Error}
+\end{listing}

 Because the litmus test shown in
-Figure~\ref{fig:sec:formal:PPCMEM Litmus Test}
+Listing~\ref{lst:sec:formal:PPCMEM Litmus Test}
 contains read-modify-write instructions, we must add \co{-model}
 arguments to the command line.
 If the litmus test is stored in \co{filename.litmus},
 this will result in the output shown in
-Figure~\ref{fig:sec:formal:PPCMEM Detects an Error},
+Listing~\ref{lst:sec:formal:PPCMEM Detects an Error},
 where the \co{...} stands for voluminous making-progress output.
 The list of states includes \co{0:r3=0; 1:r3=0;}, indicating once again
 that the old PowerPC implementation of \co{atomic_add_return()} does
@@ -281,7 +281,7 @@ not act as a full barrier.
 The ``Sometimes'' on the last line confirms this: the assertion triggers
 for some executions, but not all of the time.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
 ./ppcmem -model lwsync_read_block \
@@ -302,12 +302,12 @@ Observation SB+lwsync-RMW-lwsync+sync Never 0 5
 \centering
 \theverbbox
 \caption{PPCMEM on Repaired Litmus Test}
-\label{fig:sec:formal:PPCMEM on Repaired Litmus Test}
-\end{figure}
+\label{lst:sec:formal:PPCMEM on Repaired Litmus Test}
+\end{listing}

 The fix to this Linux-kernel bug is to replace P0's \co{isync} with
 \co{sync}, which results in the output shown in
-Figure~\ref{fig:sec:formal:PPCMEM on Repaired Litmus Test}.
+Listing~\ref{lst:sec:formal:PPCMEM on Repaired Litmus Test}.
 As you can see, \co{0:r3=0; 1:r3=0;} does not appear in the list of states,
 and the last line calls out ``Never''.
 Therefore, the model predicts that the offending execution sequence
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 27df639..ff33839 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -58,7 +58,7 @@ more complex uses.
 \subsubsection{Promela Warm-Up: Non-Atomic Increment}
 \label{sec:formal:Promela Warm-Up: Non-Atomic Increment}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 #define NUMPROCS 2
@@ -106,10 +106,10 @@ more complex uses.
 \centering
 \theverbbox
 \caption{Promela Code for Non-Atomic Increment}
-\label{fig:analysis:Promela Code for Non-Atomic Increment}
-\end{figure}
+\label{lst:analysis:Promela Code for Non-Atomic Increment}
+\end{listing}

-Figure~\ref{fig:analysis:Promela Code for Non-Atomic Increment}
+Listing~\ref{lst:analysis:Promela Code for Non-Atomic Increment}
 demonstrates the textbook race condition
 resulting from non-atomic increment.
 Line~1 defines the number of processes to run (we will vary this
@@ -165,7 +165,7 @@ cc -DSAFETY -o pan pan.c	# Compile the model
 \end{minipage}
 \vspace{5pt}

-\begin{figure*}[tbp]
+\begin{listing*}[tbp]
 { \scriptsize
 \begin{verbbox}
 pan: assertion violated ((sum<2)||(counter==2)) (at depth 20)
@@ -193,11 +193,11 @@ hash conflicts: 0 (resolved)
 \centering
 \theverbbox
 \caption{Non-Atomic Increment spin Output}
-\label{fig:analysis:Non-Atomic Increment spin Output}
-\end{figure*}
+\label{lst:analysis:Non-Atomic Increment spin Output}
+\end{listing*}

 This will produce output as shown in
-Figure~\ref{fig:analysis:Non-Atomic Increment spin Output}.
+Listing~\ref{lst:analysis:Non-Atomic Increment spin Output}.
 The first line tells us that our assertion was violated (as expected
 given the non-atomic increment!).
 The second line that a \co{trail} file was written describing how the
@@ -220,7 +220,7 @@ spin -t -p increment.spin
 \end{minipage}
 \vspace{5pt}

-\begin{figure*}[htbp]
+\begin{listing*}[htbp]
 { \scriptsize
 \begin{verbbox}
 Starting :init: with pid 0
@@ -270,11 +270,11 @@ spin: trail ends after 21 steps
 \centering
 \theverbbox
 \caption{Non-Atomic Increment Error Trail}
-\label{fig:analysis:Non-Atomic Increment Error Trail}
-\end{figure*}
+\label{lst:analysis:Non-Atomic Increment Error Trail}
+\end{listing*}

 This gives the output shown in
-Figure~\ref{fig:analysis:Non-Atomic Increment Error Trail}.
+Listing~\ref{lst:analysis:Non-Atomic Increment Error Trail}.
 As can be seen, the first portion of the init block created both
 incrementer processes, both of which first fetched the counter,
 then both incremented and stored it, losing a count.
@@ -283,7 +283,7 @@ The assertion then triggered, after which the global state is displayed.
 \subsubsection{Promela Warm-Up: Atomic Increment}
 \label{sec:formal:Promela Warm-Up: Atomic Increment}

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 { \scriptsize
 \begin{verbbox}
   1 proctype incrementer(byte me)
@@ -301,10 +301,10 @@ The assertion then triggered, after which the global state is displayed.
 \centering
 \theverbbox
 \caption{Promela Code for Atomic Increment}
-\label{fig:analysis:Promela Code for Atomic Increment}
-\end{figure}
+\label{lst:analysis:Promela Code for Atomic Increment}
+\end{listing}

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 { \scriptsize
 \begin{verbbox}
 (Spin Version 4.2.5 -- 2 April 2005)
@@ -334,18 +334,18 @@ unreached in proctype :init:
 \centering
 \theverbbox
 \caption{Atomic Increment spin Output}
-\label{fig:analysis:Atomic Increment spin Output}
-\end{figure}
+\label{lst:analysis:Atomic Increment spin Output}
+\end{listing}

 It is easy to fix this example by placing the body of the incrementer
 processes in an atomic blocks as shown in
-Figure~\ref{fig:analysis:Promela Code for Atomic Increment}.
+Listing~\ref{lst:analysis:Promela Code for Atomic Increment}.
 One could also have simply replaced the pair of statements with
 {\tt counter = counter + 1}, because Promela statements are
 atomic.
 Either way, running this modified model gives us an error-free traversal
 of the state space, as shown in
-Figure~\ref{fig:analysis:Atomic Increment spin Output}.
+Listing~\ref{lst:analysis:Atomic Increment spin Output}.

 \begin{table}
 \footnotesize
@@ -537,7 +537,7 @@ The following tricks can help you to abuse Promela safely:
 	if used too heavily.
 	In addition, it requires you to anticipate possible reorderings.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 i = 0;
@@ -556,10 +556,10 @@ The following tricks can help you to abuse Promela safely:
 \centering
 \theverbbox
 \caption{Complex Promela Assertion}
-\label{fig:analysis:Complex Promela Assertion}
-\end{figure}
+\label{lst:analysis:Complex Promela Assertion}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 atomic {
@@ -580,21 +580,21 @@ The following tricks can help you to abuse Promela safely:
 \centering
 \theverbbox
 \caption{Atomic Block for Complex Promela Assertion}
-\label{fig:analysis:Atomic Block for Complex Promela Assertion}
-\end{figure}
+\label{lst:analysis:Atomic Block for Complex Promela Assertion}
+\end{listing}

 \item	State reduction.  If you have complex assertions, evaluate
 	them under \co{atomic}.  After all, they are not part of the
 	algorithm.  One example of a complex assertion (to be discussed
 	in more detail later) is as shown in
-	Figure~\ref{fig:analysis:Complex Promela Assertion}.
+	Listing~\ref{lst:analysis:Complex Promela Assertion}.

 	There is no reason to evaluate this assertion
 	non-atomically, since it is not actually part of the algorithm.
 	Because each statement contributes to state, we can reduce
 	the number of useless states by enclosing it in an \co{atomic}
 	block as shown in
-	Figure~\ref{fig:analysis:Atomic Block for Complex Promela Assertion}.
+	Listing~\ref{lst:analysis:Atomic Block for Complex Promela Assertion}.

 \item	Promela does not provide functions.
 	You must instead use C preprocessor macros.
@@ -607,7 +607,7 @@ Now we are ready for more complex examples.
 \subsection{Promela Example: Locking}
 \label{sec:formal:Promela Example: Locking}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 #define spin_lock(mutex) \
@@ -629,14 +629,14 @@ Now we are ready for more complex examples.
 \centering
 \theverbbox
 \caption{Promela Code for Spinlock}
-\label{fig:analysis:Promela Code for Spinlock}
-\end{figure}
+\label{lst:analysis:Promela Code for Spinlock}
+\end{listing}

 Since locks are generally useful, \co{spin_lock()} and
 \co{spin_unlock()}
 macros are provided in \path{lock.h}, which may be included from
 multiple Promela models, as shown in
-Figure~\ref{fig:analysis:Promela Code for Spinlock}.
+Listing~\ref{lst:analysis:Promela Code for Spinlock}.
 The \co{spin_lock()} macro contains an infinite do-od loop
 spanning lines~2-11,
 courtesy of the single guard expression of ``1'' on line~3.
@@ -665,7 +665,7 @@ used by a few computer systems (such as MIPS and PA-RISC).
 As noted earlier, and as will be seen in a later example,
 weak memory ordering must be explicitly coded.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
   1 #include "lock.h"
@@ -717,11 +717,11 @@ weak memory ordering must be explicitly coded.
 \centering
 \theverbbox
 \caption{Promela Code to Test Spinlocks}
-\label{fig:analysis:Promela Code to Test Spinlocks}
-\end{figure}
+\label{lst:analysis:Promela Code to Test Spinlocks}
+\end{listing}

 These macros are tested by the Promela code shown in
-Figure~\ref{fig:analysis:Promela Code to Test Spinlocks}.
+Listing~\ref{lst:analysis:Promela Code to Test Spinlocks}.
 This code is similar to that used to test the increments,
 with the number of locking processes defined by the \co{N_LOCKERS}
 macro definition on line~3.
@@ -743,8 +743,8 @@ lines~32-40 atomically sum the havelock array entries,
 line~41 is the assertion, and line~42 exits the loop.

 We can run this model by placing the two code fragments of
-Figures~\ref{fig:analysis:Promela Code for Spinlock}
-and~\ref{fig:analysis:Promela Code to Test Spinlocks} into
+Listings~\ref{lst:analysis:Promela Code for Spinlock}
+and~\ref{lst:analysis:Promela Code to Test Spinlocks} into
 files named \path{lock.h} and \path{lock.spin}, respectively, and then running
 the following commands:

@@ -759,7 +759,7 @@ cc -DSAFETY -o pan pan.c
 \end{minipage}
 \vspace{5pt}

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 { \scriptsize
 \begin{verbbox}
 (Spin Version 4.2.5 -- 2 April 2005)
@@ -790,11 +790,11 @@ unreached in proctype :init:
 \centering
 \theverbbox
 \caption{Output for Spinlock Test}
-\label{fig:analysis:Output for Spinlock Test}
-\end{figure}
+\label{lst:analysis:Output for Spinlock Test}
+\end{listing}

 The output will look something like that shown in
-Figure~\ref{fig:analysis:Output for Spinlock Test}.
+Listing~\ref{lst:analysis:Output for Spinlock Test}.
 As expected, this run has no assertion failures (``errors: 0'').

 \QuickQuiz{}
@@ -891,7 +891,7 @@ produced~\cite{PaulMcKenney2007QRCUpatch},
 but has not yet been included in the Linux kernel as of
 April 2008.

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 { \scriptsize
 \begin{verbbox}
   1 #include "lock.h"
@@ -908,11 +908,11 @@ April 2008.
 \centering
 \theverbbox
 \caption{QRCU Global Variables}
-\label{fig:analysis:QRCU Global Variables}
-\end{figure}
+\label{lst:analysis:QRCU Global Variables}
+\end{listing}

 Returning to the Promela code for QRCU, the global variables are as shown in
-Figure~\ref{fig:analysis:QRCU Global Variables}.
+Listing~\ref{lst:analysis:QRCU Global Variables}.
 This example uses locking, hence including \path{lock.h}.
 Both the number of readers and writers can be varied using the
 two \co{#define} statements, giving us not one but two ways to create
@@ -934,7 +934,7 @@ indicating the state of the corresponding reader:

 Finally, the \co{mutex} variable is used to serialize updaters' slowpaths.

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 { \scriptsize
 \begin{verbbox}
   1 proctype qrcu_reader(byte me)
@@ -962,11 +962,11 @@ Finally, the \co{mutex} variable is used to serialize updaters' slowpaths.
 \centering
 \theverbbox
 \caption{QRCU Reader Process}
-\label{fig:analysis:QRCU Reader Process}
-\end{figure}
+\label{lst:analysis:QRCU Reader Process}
+\end{listing}

 QRCU readers are modeled by the \co{qrcu_reader()} process shown in
-Figure~\ref{fig:analysis:QRCU Reader Process}.
+Listing~\ref{lst:analysis:QRCU Reader Process}.
 A do-od loop spans lines~5-16, with a single guard of ``1''
 on line~6 that makes it an infinite loop.
 Line~7 captures the current value of the global index, and lines~8-15
@@ -978,7 +978,7 @@ the {\tt assert()} statement that we shall encounter later.
 Line~19 atomically decrements the same counter that we incremented,
 thereby exiting the RCU read-side critical section.

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 { \scriptsize
 \begin{verbbox}
   1 #define sum_unordered \
@@ -1000,11 +1000,11 @@ thereby exiting the RCU read-side critical section.
 \centering
 \theverbbox
 \caption{QRCU Unordered Summation}
-\label{fig:analysis:QRCU Unordered Summation}
-\end{figure}
+\label{lst:analysis:QRCU Unordered Summation}
+\end{listing}

 The C-preprocessor macro shown in
-Figure~\ref{fig:analysis:QRCU Unordered Summation}
+Listing~\ref{lst:analysis:QRCU Unordered Summation}
 sums the pair of counters so as to emulate weak memory ordering.
 Lines~2-13 fetch one of the counters, and line~14 fetches the other
 of the pair and sums them.
@@ -1027,7 +1027,7 @@ to 0 (so that line~14 will fetch the second counter).
 	Replace it with {\tt if-fi} and remove the two {\tt break} statements.
 } \QuickQuizEnd

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 { \scriptsize
 \begin{verbbox}
   1 proctype qrcu_updater(byte me)
@@ -1093,12 +1093,12 @@ to 0 (so that line~14 will fetch the second counter).
 \centering
 \theverbbox
 \caption{QRCU Updater Process}
-\label{fig:analysis:QRCU Updater Process}
-\end{figure}
+\label{lst:analysis:QRCU Updater Process}
+\end{listing}

 With the \co{sum_unordered} macro in place, we can now proceed
 to the update-side process shown in
-Figure~\ref{fig:analysis:QRCU Updater Process}.
+Listing~\ref{lst:analysis:QRCU Updater Process}.
 The update-side process repeats indefinitely, with the corresponding
 do-od loop ranging over lines~7-57.
 Each pass through the loop first snapshots the global {\tt readerprogress}
@@ -1159,7 +1159,7 @@ this update still be in progress.
 	\end{enumerate}
 } \QuickQuizEnd

-\begin{figure}[htbp]
+\begin{listing}[htbp]
 { \scriptsize
 \begin{verbbox}
   1 init {
@@ -1190,11 +1190,11 @@ this update still be in progress.
 \centering
 \theverbbox
 \caption{QRCU Initialization Process}
-\label{fig:analysis:QRCU Initialization Process}
-\end{figure}
+\label{lst:analysis:QRCU Initialization Process}
+\end{listing}

 All that remains is the initialization block shown in
-Figure~\ref{fig:analysis:QRCU Initialization Process}.
+Listing~\ref{lst:analysis:QRCU Initialization Process}.
 This block simply initializes the counter pair on lines~5-6,
 spawns the reader processes on lines~7-14, and spawns the updater
 processes on lines~15-21.
-- 
2.7.4

