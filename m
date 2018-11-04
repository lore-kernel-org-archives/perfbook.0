Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nugGio9p2uCbuHYL7AC/fYf7Fhjy0/NaIVP6v18o/yo=;
        b=bkmAkcJgvFIv05XCqEtRy9CVJvIT0geEc8/hM5JYK6a30UDTNMpOtr7UQPnaSWZqgA
         lW0j5s9gsbULnfMpWGK1YblKkdDD33R/80Y8rt9qjLjQBPE6y0S1moB6tuqQY1WW2RTT
         FmlQ1jLFdK8a69xFlhAQP//Kwt7742La18v8cz+2AD3RiihTwrI2Kdu5W8VQ0v/LmZmq
         OIfhGMASI6iPXfn11R2h/+DySmpS25ZrPOjIsyWFZQHtgha+szqsKrJn8gSryjoiQM8u
         ZE7WE+F2QZBJzpAmFftj6bwCRrCG+11wTHdVFNyYPddyfQmGNzbBr6ntTXY8UxI1feYt
         gt8Q==
Subject: [PATCH 7/7] CodeSamples/SMPdesign/maze: Substitute
 {READ/WRITE}_ONCE() for ACCESS_ONCE()
References: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0732545a-8027-82af-659d-c82732b71aa4@gmail.com>
Date: Sun, 4 Nov 2018 09:15:00 +0900
MIME-Version: 1.0
In-Reply-To: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c79bceb489aa3742e9b9668c84fc1b09613b5fc8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 3 Nov 2018 08:25:16 +0900
Subject: [PATCH 7/7] CodeSamples/SMPdesign/maze: Substitute {READ/WRITE}_ONCE() for ACCESS_ONCE()

Also fill in a couple of func prototype in maze.h.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/SMPdesign/maze/maze.h      |  6 ++++++
 CodeSamples/SMPdesign/maze/maze_fg.c   | 18 +++++++++---------
 CodeSamples/SMPdesign/maze/maze_part.c | 18 +++++++++---------
 3 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/CodeSamples/SMPdesign/maze/maze.h b/CodeSamples/SMPdesign/maze/maze.h
index a256278..f1d1343 100644
--- a/CodeSamples/SMPdesign/maze/maze.h
+++ b/CodeSamples/SMPdesign/maze/maze.h
@@ -79,6 +79,10 @@ struct maze {
 };
 
 #define ACCESS_ONCE(x) (*(volatile typeof(x) *)&(x))
+#define READ_ONCE(x) \
+            ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
+#define WRITE_ONCE(x, val) ({ ACCESS_ONCE(x) = (val); })
+
 
 /* CLOCK_MONOTONIC_RAW prefered, but the older CLOCK_MONOTONIC will do. */
 #ifdef CLOCK_MONOTONIC_RAW
@@ -190,8 +194,10 @@ int maze_same_tids(struct maze *mp, int r1, int c1, int r2, int c2);
 void new_empty_maze_solve(struct maze *mp);
 int maze_try_visit_cell(struct maze *mp, int cr, int cc, int tr, int tc,
 			int *nextrow, int *nextcol, int distance);
+int maze_row_col_frac(int rc, int num, int den);
 int maze_solve(struct maze *mp, int startrow, int startcol,
 	       int endrow, int endcol, unsigned long long *t);
+void usage(char *progname, const char *format, ...);
 void maze_solve_usage(void);
 int maze_solve_parse(int i, int argc, char *argv[]);
 
diff --git a/CodeSamples/SMPdesign/maze/maze_fg.c b/CodeSamples/SMPdesign/maze/maze_fg.c
index aa1bafa..69af238 100644
--- a/CodeSamples/SMPdesign/maze/maze_fg.c
+++ b/CodeSamples/SMPdesign/maze/maze_fg.c
@@ -75,7 +75,7 @@ int maze_try_visit_cell(struct maze *mp, int cr, int cc, int tr, int tc,
 		return -1;
 	tp = maze_get_cell_addr(mp, tr, tc);
 	do {
-		t = ACCESS_ONCE(*tp);
+		t = READ_ONCE(*tp);
 		if (t & VISITED)
 			return 1;
 	} while (!__sync_bool_compare_and_swap(tp, t, t | VISITED | myid));
@@ -85,7 +85,7 @@ int maze_try_visit_cell(struct maze *mp, int cr, int cc, int tr, int tc,
 	vi = __sync_add_and_fetch(&mp->vi, 1);
 	mp->visited[vi].row = tr;
 	__sync_synchronize();
-	ACCESS_ONCE(mp->visited[vi].col) = tc;
+	WRITE_ONCE(mp->visited[vi].col, tc);
 	return 0;
 }
 
@@ -121,8 +121,8 @@ void *maze_solve_child(void *arg)
 			 * cell to be added to the visited list, we
 			 * are done and the maze has no solution.
 			 */
-			if (vi >= ACCESS_ONCE(mp->vi) + nthreads) {
-				ACCESS_ONCE(mcsp->done) = -1;
+			if (vi >= READ_ONCE(mp->vi) + nthreads) {
+				WRITE_ONCE(mcsp->done, -1);
 				return NULL;
 			}
 
@@ -131,11 +131,11 @@ void *maze_solve_child(void *arg)
 			 * for one of the other threads to find the
 			 * end cell.
 			 */
-			while ((vi > ACCESS_ONCE(mp->vi) ||
-			        ACCESS_ONCE(mp->visited[vi].col) < 0) &&
-			       !ACCESS_ONCE(mcsp->done))
+			while ((vi > READ_ONCE(mp->vi) ||
+			        READ_ONCE(mp->visited[vi].col) < 0) &&
+			       !READ_ONCE(mcsp->done))
 			       	continue;
-			if (ACCESS_ONCE(mcsp->done))
+			if (READ_ONCE(mcsp->done))
 				return NULL;
 
 			/* check of .col before read of .row. */
@@ -151,7 +151,7 @@ void *maze_solve_child(void *arg)
 		do {
 			/* Did we find the solution? */
 			if (nr == mcsp->endrow && nc == mcsp->endcol) {
-				ACCESS_ONCE(mcsp->done) = 1;
+				WRITE_ONCE(mcsp->done, 1);
 				return NULL;
 			}
 
diff --git a/CodeSamples/SMPdesign/maze/maze_part.c b/CodeSamples/SMPdesign/maze/maze_part.c
index 16080d4..2f92e11 100644
--- a/CodeSamples/SMPdesign/maze/maze_part.c
+++ b/CodeSamples/SMPdesign/maze/maze_part.c
@@ -85,12 +85,12 @@ void maze_solve_propagate(struct maze_child *mcp1, struct maze_child *mcp2)
 	if (__sync_fetch_and_add(&mcp1->see_start, 0)) {
 		(void)__sync_lock_test_and_set(&mcp2->see_start, 1);
 		if (__sync_fetch_and_add(&mcp2->see_end, 0))
-			ACCESS_ONCE(mcsp->done) = 1;
+			WRITE_ONCE(mcsp->done, 1);
 	}
 	if (__sync_fetch_and_add(&mcp1->see_end, 0)) {
 		(void)__sync_lock_test_and_set(&mcp2->see_end, 1);
 		if (__sync_fetch_and_add(&mcp2->see_start, 0))
-			ACCESS_ONCE(mcsp->done) = 1;
+			WRITE_ONCE(mcsp->done, 1);
 	}
 }
 
@@ -111,7 +111,7 @@ void record_encounter(struct maze *mp, int cr, int cc, int tr, int tc)
 	mymcp->adj[theirtid].tr = tr;
 	mymcp->adj[theirtid].tc = tc;
 	if (nthreads == 2)
-		ACCESS_ONCE(mcsp->done) = 1;
+		WRITE_ONCE(mcsp->done, 1);
 	maze_solve_propagate(mymcp, &mymcp->mcp0[theirtid]);
 	maze_solve_propagate(&mymcp->mcp0[theirtid], mymcp);
 }
@@ -128,7 +128,7 @@ int maze_try_visit_cell(struct maze *mp, int cr, int cc, int tr, int tc,
 		return -1;
 	tp = maze_get_cell_addr(mp, tr, tc);
 	do {
-		t = ACCESS_ONCE(*tp);
+		t = READ_ONCE(*tp);
 		if (t & VISITED) {
 			record_encounter(mp, cr, cc, tr, tc);
 			return 1;
@@ -496,7 +496,7 @@ int maze_solve_child_done_check(void)
 	struct maze_child *theirmcp;
 
 	if (nthreads <= 2)
-		return ACCESS_ONCE(mcsp->done);
+		return READ_ONCE(mcsp->done);
 	if (!mymcp->see_start_snap &&
 	    __sync_fetch_and_add(&mymcp->see_start, 0)) {
 		mymcp->see_start_snap = 1;
@@ -508,7 +508,7 @@ int maze_solve_child_done_check(void)
 		need_propagate = 1;
 	}
 	if (!need_propagate)
-		return ACCESS_ONCE(mcsp->done);
+		return READ_ONCE(mcsp->done);
 	for (i = 0; i < nthreads; i++) {
 		if (i == mymcp->myid)
 			continue;
@@ -517,7 +517,7 @@ int maze_solve_child_done_check(void)
 		    __sync_fetch_and_add(&theirmcp->adj[myid].mr, 0) != -1)
 			maze_solve_propagate(mymcp, theirmcp);
 	}
-	return ACCESS_ONCE(mcsp->done);
+	return READ_ONCE(mcsp->done);
 }
 
 /*
@@ -555,7 +555,7 @@ void *maze_solve_child(void *arg)
 		 * go to the following loop to do the exploration.
 		 */
 		while (!maze_find_any_next_cell(mp, cr, cc, &nr, &nc)) {
-			if (++vi >= mcp->vi || ACCESS_ONCE(mcsp->done))
+			if (++vi >= mcp->vi || READ_ONCE(mcsp->done))
 				goto done;
 			cr = mcp->visited[vi].row;
 			cc = mcp->visited[vi].col;
@@ -566,7 +566,7 @@ void *maze_solve_child(void *arg)
 		 * the current path one cell.
 		 */
 		do {
-			if (ACCESS_ONCE(mcsp->done))
+			if (READ_ONCE(mcsp->done))
 				goto done;
 			cr = nr;
 			cc = nc;
-- 
2.7.4


