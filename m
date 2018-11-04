Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mysDAOYZewtLa3UI92+s9ZH4lpm61yn+swHsYPXTuHw=;
        b=ctfTvwKn3Ec9qrFo0Koc1vSq7JY1QphkhaQtkbtLk6PXOAhoKU+8NsazVC5/nhrDJQ
         CiApi8nvSuY5YhcBN8XL6ehVAKTkcX5GGuyvK5LT3O7hABsG/cJ/bY13Pjm6OyQHJomj
         RGTsIPsfbsp4B0bR9903pGy/zJ5t7JIBcT2GoTSmF55wnnjklFyyvRuHXNjfC8wVKUD5
         tgo/37afls84/LL6iV7gzC503OSgiGtKttXVzG1+UR6kz9AsSMHQ9jViAsmtGRxRNAwa
         qCXjwClTDkevTG+i+q66smRHvTpIXYMDS6bXaMaLPrTO7ZZD4DMoklu5KBjJ66UUULIy
         rCjA==
Subject: [PATCH 6/7] SMPdesign/beyond: Employ new scheme for inline pseudocode
 snippets
References: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b46dd585-1455-59df-d4c8-7fb7148b6301@gmail.com>
Date: Sun, 4 Nov 2018 09:13:54 +0900
MIME-Version: 1.0
In-Reply-To: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b36ad7a4fc1e62b276bb607a6a654e7efa5fec38 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 3 Nov 2018 00:13:28 +0900
Subject: [PATCH 6/7] SMPdesign/beyond: Employ new scheme for inline pseudocode snippets

Also mention Listing~\ref{lst:SMPdesign:SEQ Pseudocode} as pseudocode,
And replace remaining ACCESS_ONCE()s with READ_ONCE()s.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/beyond.tex | 319 +++++++++++++++++++++++++++------------------------
 1 file changed, 168 insertions(+), 151 deletions(-)

diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 88e2b31..5997f86 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -54,112 +54,125 @@ presents future directions and concluding remarks.
 \label{sec:SMPdesign:Work-Queue Parallel Maze Solver}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 int maze_solve(maze *mp, cell sc, cell ec)
-  2 {
-  3   cell c = sc;
-  4   cell n;
-  5   int vi = 0;
-  6 
-  7   maze_try_visit_cell(mp, c, c, &n, 1);
-  8   for (;;) {
-  9     while (!maze_find_any_next_cell(mp, c, &n)) {
- 10       if (++vi >= mp->vi)
- 11         return 0;
- 12       c = mp->visited[vi].c;
- 13     }
- 14     do {
- 15       if (n == ec) {
- 16         return 1;
- 17       }
- 18       c = n;
- 19     } while (maze_find_any_next_cell(mp, c, &n));
- 20     c = mp->visited[vi].c;
- 21   }
- 22 }
-\end{verbbox}
+\begin{linelabel}[ln:SMPdesign:SEQ Pseudocode]
+\begin{VerbatimL}[commandchars=\\\@\$]
+int maze_solve(maze *mp, cell sc, cell ec)
+{
+	cell c = sc;
+	cell n;
+	int vi = 0;
+
+	maze_try_visit_cell(mp, c, c, &n, 1);		\lnlbl@initcell$
+	for (;;) {					\lnlbl@loop:b$
+		while (!maze_find_any_next_cell(mp, c, &n)) {\lnlbl@loop2:b$
+			if (++vi >= mp->vi)
+				return 0;
+			c = mp->visited[vi].c;
+		}					\lnlbl@loop2:e$
+		do {					\lnlbl@loop3:b$
+			if (n == ec) {
+				return 1;
+			}
+			c = n;
+		} while (maze_find_any_next_cell(mp, c, &n));\lnlbl@loop3:e$
+		c = mp->visited[vi].c;			\lnlbl@finalize$
+	}						\lnlbl@loop:e$
 }
-\centering
-\theverbbox
+\end{VerbatimL}
+\end{linelabel}
 \caption{SEQ Pseudocode}
 \label{lst:SMPdesign:SEQ Pseudocode}
 \end{listing}
 
 PWQ is based on SEQ, which is shown in
 Listing~\ref{lst:SMPdesign:SEQ Pseudocode}
-(\path{maze_seq.c}).
+(pseudocode for \path{maze_seq.c}).
 The maze is represented by a 2D array of cells and
 a linear-array-based work queue named \co{->visited}.
 
-Line~7 visits the initial cell, and each iteration of the loop spanning
-lines~8-21 traverses passages headed by one cell.
-The loop spanning lines~9-13 scans the \co{->visited[]} array for a
+\begin{lineref}[ln:SMPdesign:SEQ Pseudocode]
+Line~\lnref{initcell} visits the initial cell, and each iteration of the loop spanning
+lines~\lnref{loop:b}-\lnref{loop:e} traverses passages headed by one cell.
+The loop spanning
+lines~\lnref{loop2:b}-\lnref{loop2:e} scans the \co{->visited[]} array for a
 visited cell with an unvisited neighbor, and the loop spanning
-lines~14-19 traverses one fork of the submaze headed by that neighbor.
-Line~20 initializes for the next pass through the outer loop.
+lines~\lnref{loop3:b}-\lnref{loop3:e} traverses one fork of the submaze
+headed by that neighbor.
+Line~\lnref{finalize} initializes for the next pass through the outer loop.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 int maze_try_visit_cell(struct maze *mp, cell c, cell t,
-  2                         cell *n, int d)
-  3 {
-  4   if (!maze_cells_connected(mp, c, t) ||
-  5       (*celladdr(mp, t) & VISITED))
-  6     return 0;
-  7   *n = t;
-  8   mp->visited[mp->vi] = t;
-  9   mp->vi++;
- 10   *celladdr(mp, t) |= VISITED | d;
- 11   return 1;
- 12 }
- 13 
- 14 int maze_find_any_next_cell(struct maze *mp, cell c,
- 15                             cell *n)
- 16 {
- 17   int d = (*celladdr(mp, c) & DISTANCE) + 1;
- 18 
- 19   if (maze_try_visit_cell(mp, c, prevcol(c), n, d))
- 20     return 1;
- 21   if (maze_try_visit_cell(mp, c, nextcol(c), n, d))
- 22     return 1;
- 23   if (maze_try_visit_cell(mp, c, prevrow(c), n, d))
- 24     return 1;
- 25   if (maze_try_visit_cell(mp, c, nextrow(c), n, d))
- 26     return 1;
- 27   return 0;
- 28 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{linelabel}[ln:SMPdesign:SEQ Helper Pseudocode]
+\begin{VerbatimL}[commandchars=\\\@\$]
+int maze_try_visit_cell(struct maze *mp, cell c, cell t, \lnlbl@try:b$
+                        cell *n, int d)
+{
+	if (!maze_cells_connected(mp, c, t) ||	\lnlbl@try:chk:adj$
+	    (*celladdr(mp, t) & VISITED))	\lnlbl@try:chk:not:visited$
+		return 0;			\lnlbl@try:ret:failure$
+	*n = t;					\lnlbl@try:nextcell$
+	mp->visited[mp->vi] = t;		\lnlbl@try:recordnext$
+	mp->vi++;				\lnlbl@try:next:visited$
+	*celladdr(mp, t) |= VISITED | d;	\lnlbl@try:mark:visited$
+	return 1;				\lnlbl@try:ret:success$
+}						\lnlbl@try:e$
+
+int maze_find_any_next_cell(struct maze *mp, cell c, \lnlbl@find:b$
+                            cell *n)
+{
+	int d = (*celladdr(mp, c) & DISTANCE) + 1;	\lnlbl@find:curplus1$
+
+	if (maze_try_visit_cell(mp, c, prevcol(c), n, d))\lnlbl@find:chk:prevcol$
+		return 1;				\lnlbl@find:ret:prevcol$
+	if (maze_try_visit_cell(mp, c, nextcol(c), n, d))\lnlbl@find:chk:nextcol$
+		return 1;				\lnlbl@find:ret:nextcol$
+	if (maze_try_visit_cell(mp, c, prevrow(c), n, d))\lnlbl@find:chk:prevrow$
+		return 1;				\lnlbl@find:ret:prevrow$
+	if (maze_try_visit_cell(mp, c, nextrow(c), n, d))\lnlbl@find:chk:nextrow$
+		return 1;				\lnlbl@find:ret:nextrow$
+	return 0;					\lnlbl@find:ret:false$
+}							\lnlbl@find:e$
+\end{VerbatimL}
+\end{linelabel}
 \caption{SEQ Helper Pseudocode}
 \label{lst:SMPdesign:SEQ Helper Pseudocode}
 \end{listing}
 
-The pseudocode for \co{maze_try_visit_cell()} is shown on lines~1-12
+\begin{lineref}[ln:SMPdesign:SEQ Helper Pseudocode:try]
+The pseudocode for \co{maze_try_visit_cell()} is shown on
+lines~\lnref{b}-\lnref{e}
 of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode}
 (\path{maze.c}).
-Line~4 checks to see if cells \co{c} and \co{t} are adjacent and connected,
-while line~5 checks to see if cell \co{t} has not yet been visited.
+Line~\lnref{chk:adj} checks to see if cells \co{c} and \co{t} are
+adjacent and connected,
+while line~\lnref{chk:not:visited} checks to see if cell \co{t} has
+not yet been visited.
 The \co{celladdr()} function returns the address of the specified cell.
-If either check fails, line~6 returns failure.
-Line~7 indicates the next cell, line~8 records this cell in the next
-slot of the \co{->visited[]} array, line~9 indicates that this slot
-is now full, and line~10 marks this cell as visited and also records
-the distance from the maze start.  Line~11 then returns success.
-
-The pseudocode for \co{maze_find_any_next_cell()} is shown on lines~14-28
+If either check fails, line~\lnref{ret:failure} returns failure.
+Line~\lnref{nextcell} indicates the next cell,
+line~\lnref{recordnext} records this cell in the next
+slot of the \co{->visited[]} array,
+line~\lnref{next:visited} indicates that this slot
+is now full, and line~\lnref{mark:visited} marks this cell as visited and also records
+the distance from the maze start.  Line~\lnref{ret:success} then returns success.
+\end{lineref}
+
+\begin{lineref}[ln:SMPdesign:SEQ Helper Pseudocode:find]
+The pseudocode for \co{maze_find_any_next_cell()} is shown on
+lines~\lnref{b}-\lnref{e}
 of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode}
 (\path{maze.c}).
-Line~17 picks up the current cell's distance plus 1,
-while lines~19, 21, 23, and~25
-check the cell in each direction, and lines~20, 22, 24, and~26
+Line~\lnref{curplus1} picks up the current cell's distance plus 1,
+while lines~\lnref{chk:prevcol}, \lnref{chk:nextcol}, \lnref{chk:prevrow},
+and~\lnref{chk:nextrow}
+check the cell in each direction, and
+lines~\lnref{ret:prevcol}, \lnref{ret:nextcol}, \lnref{ret:prevrow},
+and~\lnref{ret:nextrow}
 return true if the corresponding cell is a candidate next cell.
 The \co{prevcol()}, \co{nextcol()}, \co{prevrow()}, and \co{nextrow()}
 each do the specified array-index-conversion operation.
-If none of the cells is a candidate, line~27 returns false.
+If none of the cells is a candidate, line~\lnref{ret:false} returns false.
+\end{lineref}
 
 \begin{figure}[tb]
 \centering
@@ -228,60 +241,59 @@ at opposite ends of the solution path, and takes a brief look at the
 performance and scalability consequences.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 int maze_solve_child(maze *mp, cell *visited, cell sc)
-  2 {
-  3   cell c;
-  4   cell n;
-  5   int vi = 0;
-  6 
-  7   myvisited = visited; myvi = &vi;
-  8   c = visited[vi];
-  9   do {
- 10     while (!maze_find_any_next_cell(mp, c, &n)) {
- 11       if (visited[++vi].row < 0)
- 12         return 0;
- 13       if (ACCESS_ONCE(mp->done))
- 14         return 1;
- 15       c = visited[vi];
- 16     }
- 17     do {
- 18       if (ACCESS_ONCE(mp->done))
- 19         return 1;
- 20       c = n;
- 21     } while (maze_find_any_next_cell(mp, c, &n));
- 22     c = visited[vi];
- 23   } while (!ACCESS_ONCE(mp->done));
- 24   return 1;
- 25 }
-\end{verbbox}
+\begin{linelabel}[ln:SMPdesign:Partitioned Parallel Solver Pseudocode]
+\begin{VerbatimL}[commandchars=\\\@\$]
+int maze_solve_child(maze *mp, cell *visited, cell sc)	\lnlbl@b$
+{
+	cell c;
+	cell n;
+	int vi = 0;
+
+	myvisited = visited; myvi = &vi;		\lnlbl@store:ptr$
+	c = visited[vi];				\lnlbl@retrieve$
+	do {
+		while (!maze_find_any_next_cell(mp, c, &n)) {
+			if (visited[++vi].row < 0)
+				return 0;
+			if (READ_ONCE(mp->done))	\lnlbl@chk:done1$
+				return 1;
+			c = visited[vi];
+		}
+		do {
+			if (READ_ONCE(mp->done))	\lnlbl@chk:done2$
+				return 1;
+			c = n;
+		} while (maze_find_any_next_cell(mp, c, &n));
+		c = visited[vi];
+	} while (!READ_ONCE(mp->done));		\lnlbl@chk:done3$
+	return 1;
 }
-\centering
-\theverbbox
+\end{VerbatimL}
+\end{linelabel}
 \caption{Partitioned Parallel Solver Pseudocode}
 \label{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}
 \end{listing}
 
+\begin{lineref}[ln:SMPdesign:Partitioned Parallel Solver Pseudocode]
 The partitioned parallel algorithm (PART), shown in
 Listing~\ref{lst:SMPdesign:Partitioned Parallel Solver Pseudocode}
 (\path{maze_part.c}),
 is similar to SEQ, but has a few important differences.
 First, each child thread has its own \co{visited} array, passed in by
-the parent as shown on line~1,
+the parent as shown on line~\lnref{b},
 which must be initialized to all [$-1$, $-1$].
-Line~7 stores a pointer to this array into the per-thread variable
+Line~\lnref{store:ptr} stores a pointer to this array into the per-thread variable
 \co{myvisited} to allow access by helper functions, and similarly stores
 a pointer to the local visit index.
 Second, the parent visits the first cell on each child's behalf,
-which the child retrieves on line~8.
+which the child retrieves on line~\lnref{retrieve}.
 Third, the maze is solved as soon as one child locates a cell that has
 been visited by the other child.
 When \co{maze_try_visit_cell()} detects this,
 it sets a \co{->done} field in the maze structure.
 Fourth, each child must therefore periodically check the \co{->done}
-field, as shown on lines~13, 18, and~23.
-The \co{ACCESS_ONCE()} primitive must disable any compiler
+field, as shown on lines~\lnref{chk:done1}, \lnref{chk:done2}, and~\lnref{chk:done3}.
+The \co{READ_ONCE()} primitive must disable any compiler
 optimizations that might combine consecutive loads or that
 might reload the value.
 A C++1x volatile relaxed load suffices~\cite{PeteBecker2011N3242}.
@@ -289,55 +301,60 @@ Finally, the \co{maze_find_any_next_cell()} function must use
 compare-and-swap to mark a cell as visited, however
 no constraints on ordering are required beyond those provided by
 thread creation and join.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 int maze_try_visit_cell(struct maze *mp, int c, int t,
-  2       int *n, int d)
-  3 {
-  4   cell_t t;
-  5   cell_t *tp;
-  6   int vi;
-  7 
-  8   if (!maze_cells_connected(mp, c, t))
-  9     return 0;
- 10   tp = celladdr(mp, t);
- 11   do {
- 12     t = ACCESS_ONCE(*tp);
- 13     if (t & VISITED) {
- 14       if ((t & TID) != mytid)
- 15         mp->done = 1;
- 16       return 0;
- 17     }
- 18   } while (!CAS(tp, t, t | VISITED | myid | d));
- 19   *n = t;
- 20   vi = (*myvi)++;
- 21   myvisited[vi] = t;
- 22   return 1;
- 23 }
-\end{verbbox}
+\begin{linelabel}[ln:SMPdesign:Partitioned Parallel Helper Pseudocode]
+\begin{VerbatimL}[commandchars=\\\@\$]
+int maze_try_visit_cell(struct maze *mp, int c, int t,
+                        int *n, int d)
+{
+	cell_t t;
+	cell_t *tp;
+	int vi;
+
+	if (!maze_cells_connected(mp, c, t))		\lnlbl@chk:conn:b$
+		return 0;				\lnlbl@chk:conn:e$
+	tp = celladdr(mp, t);
+	do {						\lnlbl@loop:b$
+		t = READ_ONCE(*tp);
+		if (t & VISITED) {			\lnlbl@chk:visited$
+			if ((t & TID) != mytid)		\lnlbl@chk:other$
+				mp->done = 1;		\lnlbl@located$
+			return 0;			\lnlbl@ret:fail$
+		}
+	} while (!CAS(tp, t, t | VISITED | myid | d));	\lnlbl@loop:e$
+	*n = t;						\lnlbl@update:new$
+	vi = (*myvi)++;					\lnlbl@update:visited:b$
+	myvisited[vi] = t;				\lnlbl@update:visited:e$
+	return 1;					\lnlbl@ret:success$
 }
-\centering
-\theverbbox
+\end{VerbatimL}
+\end{linelabel}
 \caption{Partitioned Parallel Helper Pseudocode}
 \label{lst:SMPdesign:Partitioned Parallel Helper Pseudocode}
 \end{listing}
 
+\begin{lineref}[ln:SMPdesign:Partitioned Parallel Helper Pseudocode]
 The pseudocode for \co{maze_find_any_next_cell()} is identical to that shown in
 Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode},
 but the pseudocode for \co{maze_try_visit_cell()} differs, and
 is shown in
 Listing~\ref{lst:SMPdesign:Partitioned Parallel Helper Pseudocode}.
-Lines~8-9 check to see if the cells are connected, returning failure
+Lines~\lnref{chk:conn:b}-\lnref{chk:conn:e}
+check to see if the cells are connected, returning failure
 if not.
-The loop spanning lines~11-18 attempts to mark the new cell visited.
-Line~13 checks to see if it has already been visited, in which case
-line~16 returns failure, but only after line~14 checks to see if
-we have encountered the other thread, in which case line~15 indicates
+The loop spanning lines~\lnref{loop:b}-\lnref{loop:e} attempts to mark
+the new cell visited.
+Line~\lnref{chk:visited} checks to see if it has already been visited, in which case
+line~\lnref{ret:fail} returns failure, but only after line~\lnref{chk:other}
+checks to see if
+we have encountered the other thread, in which case line~\lnref{located} indicates
 that the solution has been located.
-Line~19 updates to the new cell, lines~20 and~21 update this thread's visited
-array, and line~22 returns success.
+Line~\lnref{update:new} updates to the new cell,
+lines~\lnref{update:visited:b} and~\lnref{update:visited:e} update this thread's visited
+array, and line~\lnref{ret:success} returns success.
+\end{lineref}
 
 \begin{figure}[tb]
 \centering
-- 
2.7.4


