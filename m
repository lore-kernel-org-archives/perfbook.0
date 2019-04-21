Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4Uf+Eoxgt36/edXyVvYKPWVDEkz7j1r4rjn+vVGbrss=;
        b=YgOhkwaaoHFGjY9Htci3EHMB6lrTpNFCFGAjjrK8BWIaYofGpi4XpcKgVStMBC07wG
         OwrusJDk5Lb9dGmPSpe7cPACp5+6f+w4FqtYrJ3Yizgta9rNXedXAvrAB6wGLgYiqn2z
         nyHPRqnFDPwChUOWQ4FDR2UgO6+5kwUtlFbdtO7J1Vec1Kg2s66s52Ib+3Thca5yO7ao
         Hfxby1n7L5GknFaxwaf8G+zdTEgQJYdIp+iEbfz41SJKIXNCNl8GJeaBDndSH/mUpStT
         hcqOsqv/0X/fyg5AeklYAKv8UL2A46CKi0muGYgbqK5evV5v5/15N0+LPjXBSlgcOPbF
         /1jw==
Subject: [PATCH 1/4] defer/hazptr: Extract snippet from hazptr.c
References: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5f9bf852-7cbf-df4e-08dd-c0665370b1d5@gmail.com>
Date: Sun, 21 Apr 2019 19:06:53 +0900
MIME-Version: 1.0
In-Reply-To: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fc38eb9741c49aa7907d60806158499affe36bfa Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 21 Apr 2019 15:14:25 +0900
Subject: [PATCH 1/4] defer/hazptr: Extract snippet from hazptr.c

By using "gobbleblank=yes" option of \begin{snippet} meta command,
fcvextract.pl can extract the snippet in a proper form.
Also embed line labels and reference them in the text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/hazptr.c |  77 +++++++++++++------------
 defer/hazptr.tex           | 111 ++++++++++++-------------------------
 2 files changed, 76 insertions(+), 112 deletions(-)

diff --git a/CodeSamples/defer/hazptr.c b/CodeSamples/defer/hazptr.c
index ee7b8075..3def441b 100644
--- a/CodeSamples/defer/hazptr.c
+++ b/CodeSamples/defer/hazptr.c
@@ -72,12 +72,13 @@ void hazptr_reinitialize()
  *    0 : a == b
  *  > 0 : a > b
  */
-int compare (const void *a, const void *b)
+//\begin{snippet}[labelbase=ln:defer:hazptr:scan_free,gobbleblank=yes,commandchars=\%\@\$]
+int compare(const void *a, const void *b)
 {
-  return ( *(hazptr_head_t **)a - *(hazptr_head_t **)b );
+	return ( *(hazptr_head_t **)a - *(hazptr_head_t **)b );
 }
-
-void hazptr_scan()
+							//\fcvblank
+void hazptr_scan()				//\lnlbl{scan:b}
 {
 	/* Iteratation variables. */
 	hazptr_head_t *cur;
@@ -89,14 +90,19 @@ void hazptr_scan()
 	/* List of hazard pointers, and its size. */
 	hazptr_head_t **plist = gplist;
 	unsigned long psize;
-
-	if (plist == NULL) {
-		plist = (hazptr_head_t **)malloc(sizeof(hazptr_head_t *) * K * NR_THREADS);
+							//\fcvblank
+	if (plist == NULL) {			//\lnlbl{scan:check}
+		psize = sizeof(hazptr_head_t *) * K * NR_THREADS; //\lnlbl{scan:alloc:b}
+		plist = (hazptr_head_t **)malloc(psize);
+#ifndef FCV_SNIPPET
 		if (plist == NULL) {
 			fprintf(stderr, "hazptr_scan: out of memory\n");
 			exit(EXIT_FAILURE);
 		}
-		gplist = plist;
+#else /* FCV_SNIPPET */
+		BUG_ON(!plist);
+#endif /* FCV_SNIPPET */
+		gplist = plist;			//\lnlbl{scan:alloc:e}
 	}
 
 	/*
@@ -111,52 +117,53 @@ void hazptr_scan()
 	 *   A -> B -> C ---> A -> B      ---> A -> C
 	 *                    B -> POISON      B -> POISON
 	 */
-	smp_mb();
+	smp_mb();				//\lnlbl{scan:mb1}
 
 	/* Stage 1: Scan HP list and insert non-null values in plist. */
 	psize = 0;
-	for (i = 0; i < H; i++) {
+	for (i = 0; i < H; i++) {		//\lnlbl{scan:loop:b}
 		uintptr_t hp = (uintptr_t)READ_ONCE(HP[i].p);
-
+							//\fcvblank
 		if (!hp)
 			continue;
 		plist[psize++] = (hazptr_head_t *)(hp & ~0x1UL);
-	}
-	smp_mb(); /* ensure freeing happens after scan. */
+	}					//\lnlbl{scan:loop:e}
+	smp_mb(); /* ensure freeing happens after scan. */ //\lnlbl{scan:mb2}
 	
 	/* Stage 2: Sort the plist. */
-	qsort(plist, psize, sizeof(hazptr_head_t *), compare);
+	qsort(plist, psize, sizeof(hazptr_head_t *), compare); //\lnlbl{scan:sort}
 
 	/* Stage 3: Free non-harzardous nodes. */
-	tmplist = rlist;
-	rlist = NULL;
-	rcount = 0;
-	while (tmplist != NULL) {
+	tmplist = rlist;			//\lnlbl{scan:rem:b}
+	rlist = NULL;				//\lnlbl{scan:rem:e}
+	rcount = 0;				//\lnlbl{scan:zero}
+	while (tmplist != NULL) {		//\lnlbl{scan:loop2:b}
 		/* Pop cur off top of tmplist. */
-		cur = tmplist;
-		tmplist = tmplist->next;
+		cur = tmplist;			//\lnlbl{scan:rem1st:b}
+		tmplist = tmplist->next;	//\lnlbl{scan:rem1st:e}
 
-		if (bsearch(&cur, plist, psize, sizeof(hazptr_head_t *), compare)) {
-			cur->next = rlist;
+		if (bsearch(&cur, plist, psize,	//\lnlbl{scan:chkhazp:b}
+		            sizeof(hazptr_head_t *), compare)) { //\lnlbl{scan:chkhazp:e}
+			cur->next = rlist;	//\lnlbl{scan:back:b}
 			rlist = cur;
-			rcount++;
+			rcount++;		//\lnlbl{scan:back:e}
 		} else {
-			hazptr_free(cur);
+			hazptr_free(cur);	//\lnlbl{scan:free}
 		}
-	}
-}
-
-void hazptr_free_later(hazptr_head_t *n)
+	}					//\lnlbl{scan:loop2:e}
+}						//\lnlbl{scan:e}
+							//\fcvblank
+void hazptr_free_later(hazptr_head_t *n)	//\lnlbl{free:b}
 {
-	n->next = rlist;
-	rlist = n;
-	rcount++;
+	n->next = rlist;			//\lnlbl{free:enq:b}
+	rlist = n;				//\lnlbl{free:enq:e}
+	rcount++;				//\lnlbl{free:count}
 
-	if (rcount >= R) {
-		hazptr_scan();
+	if (rcount >= R) {			//\lnlbl{free:check}
+		hazptr_scan();			//\lnlbl{free:scan}
 	}
-}
-
+}						//\lnlbl{free:e}
+//\end{snippet}
 #ifdef TEST
 #include "hazptrtorture.h"
 #endif /* #ifdef TEST */
diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 46592957..84fd15bc 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -116,105 +116,62 @@ the hazard pointer to \co{NULL}.
 \end{lineref}
 
 \begin{listing}[tbp]
-\begin{VerbatimL}
-int compare (const void *a, const void *b)
-{
-	return (*(hazptr_head_t **)a - *(hazptr_head_t **)b);
-}
-
-void hazptr_scan()
-{
-	hazptr_head_t *cur;
-	int i;
-	hazptr_head_t *tmplist;
-	hazptr_head_t **plist = gplist;
-	unsigned long psize;
-
-	if (plist == NULL) {
-		psize = sizeof(hazptr_head_t *) * K * NR_THREADS;
-		plist = malloc(psize);
-		BUG_ON(!plist);
-		gplist = plist;
-	}
-	smp_mb();
-	psize = 0;
-	for (i = 0; i < H; i++) {
-		uintptr_t hp  = (uintptr_t)READ_ONCE(HP[i].p);
-
-		if (!hp)
-			continue;
-		plist[psize++] = (hazptr_head_t *)(hp & ~0x1UL);
-	}
-	smp_mb();
-	qsort(plist, psize, sizeof(hazptr_head_t *), compare);
-	tmplist = rlist;
-	rlist = NULL;
-	rcount = 0;
-	while (tmplist != NULL) {
-		cur = tmplist;
-		tmplist = tmplist->next;
-		if (bsearch(&cur, plist, psize,
-		    sizeof(hazptr_head_t *), compare)) {
-			cur->next = rlist;
-			rlist = cur;
-			rcount++;
-		} else {
-			hazptr_free(cur);
-		}
-	}
-}
-
-void hazptr_free_later(hazptr_head_t *n)
-{
-	n->next = rlist;
-	rlist = n;
-	rcount++;
-	if (rcount >= R) {
-		hazptr_scan();
-	}
-}
-\end{VerbatimL}
+\input{CodeSamples/defer/hazptr@scan_free.fcv}
 \caption{Hazard-Pointer Scanning and Freeing}
 \label{lst:defer:Hazard-Pointer Scanning and Freeing}
 \end{listing}
 
+\begin{lineref}[ln:defer:hazptr:scan_free:free]
 Once a hazard-pointer-protected object has been removed from its
 linked data structure, so that it is now inaccessible to future
 hazard-pointer readers, it is passed to \co{hazptr_free_later()},
-which is shown on lines~48-56 of
+which is shown on lines~\lnref{b}-\lnref{e} of
 Listing~\ref{lst:defer:Hazard-Pointer Scanning and Freeing}
 (\path{hazptr.c}).
-Lines~50 and~51 enqueue the object on a per-thread list \co{rlist}
-and line~52 counts the object in \co{rcount}.
-If line~53 sees that a sufficiently large number of objects are now
-queued, line~54 invokes \co{hazptr_scan()} to attempt to free some of them.
+Lines~\lnref{enq:b} and~\lnref{enq:e}
+enqueue the object on a per-thread list \co{rlist}
+and line~\lnref{count} counts the object in \co{rcount}.
+If line~\lnref{check} sees that a sufficiently large number of objects are now
+queued, line~\lnref{scan} invokes \co{hazptr_scan()} to attempt to
+free some of them.
+\end{lineref}
 
-The \co{hazptr_scan()} function is shown on lines~6--46 of the listing.
+\begin{lineref}[ln:defer:hazptr:scan_free:scan]
+The \co{hazptr_scan()} function is shown on lines~\lnref{b}-\lnref{e}
+of the listing.
 This function relies on a fixed maximum number of threads (\co{NR_THREADS})
 and a fixed maximum number of hazard pointers per thread (\co{K}),
 which allows a fixed-size array of hazard pointers to be used.
 Because any thread might need to scan the hazard pointers, each thread
 maintains its own array, which is referenced by the per-thread variable
 \co{gplist}.
-If line~14 determines that this thread has not yet allocated its
-\co{gplist}, lines~15--18 carry out the allocation.
-The memory barrier on line~20 ensures that all threads see the
-removal of all objects by this thread before lines~22-28 scan
+If line~\lnref{check} determines that this thread has not yet allocated its
+\co{gplist}, lines~\lnref{alloc:b}-\lnref{alloc:e} carry out the allocation.
+The memory barrier on line~\lnref{mb1} ensures that all threads see the
+removal of all objects by this thread before
+lines~\lnref{loop:b}-\lnref{loop:e} scan
 all of the hazard pointers, accumulating non-NULL pointers into
 the \co{plist} array and counting them in \co{psize}.
-The memory barrier on line~30 ensures that the reads of the hazard pointers
+The memory barrier on line~\lnref{mb2} ensures that the reads of
+the hazard pointers
 happen before any objects are freed.
-Line~30 then sorts this array to enable use of binary search below.
+Line~\lnref{sort} then sorts this array to enable use of binary search below.
 
-Lines~31 and 32 remove all elements from this thread's list of
+Lines~\lnref{rem:b} and~\lnref{rem:e}
+remove all elements from this thread's list of
 to-be-freed objects, placing them on the local \co{tmplist}
-and line~33 zeroes the count.
-Each pass through the loop spanning lines~34-45 processes each
+and line~\lnref{zero} zeroes the count.
+Each pass through the loop spanning
+lines~\lnref{loop2:b}-\lnref{loop2:e} processes each
 of the to-be-freed objects.
-Lines~35 and~36 remove the first object from \co{tmplist},
-and if lines~37 and~38 determine that there is a hazard pointer
-protecting this object, lines~39-41 place it back onto \co{rlist}.
-Otherwise, line~43 frees the object.
+Lines~\lnref{rem1st:b} and~\lnref{rem1st:e}
+remove the first object from \co{tmplist},
+and if lines~\lnref{chkhazp:b} and~\lnref{chkhazp:e}
+determine that there is a hazard pointer
+protecting this object, lines~\lnref{back:b}-\lnref{back:e}
+place it back onto \co{rlist}.
+Otherwise, line~\lnref{free} frees the object.
+\end{lineref}
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/route_hazptr@lookup.fcv}
-- 
2.17.1


