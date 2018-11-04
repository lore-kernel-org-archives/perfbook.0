Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d6UHIFSN/Hv+C9GCe2sfGyRR9JTQ153pYPDkLBOaZsk=;
        b=b6Zpm1bat/FEtpICDktqxVxZMghX7vfgD/O4TmrNGdO8mFb/vQF5olu2XKUWEUEZcf
         EKrqSR5WQQhMdjhubthMTY5KMQmhrB90EzOnMt8OGrySv4/tfaI/IA2gTdPVBqfW526Y
         V/dgWfggRl/SR3piUNtQNiskv6KVllLsg+vS6EUgLyxoznM6NViLVra46yyDmmHCiBtq
         yCVU9JME+31w9Z9IIdF8C7i7PoFwCgveEENlWqi+5uGKYpksZcstLga92LmHiVwMGraw
         4z4B5dyw6UEtBoHPC5tCHimTsUNqa2TqSINWNkrEAOrZUtSPJJZRRz2X0vH91w/JzxGH
         eJhw==
Subject: [PATCH 5/7] SMPdesign: Employ new scheme for snippets from smpalloc.c
References: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5a3c4126-386e-7fa9-2f31-ac650b1259db@gmail.com>
Date: Sun, 4 Nov 2018 09:13:00 +0900
MIME-Version: 1.0
In-Reply-To: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b5efb413687874a667443943069c021e6c827d7b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 2 Nov 2018 00:22:35 +0900
Subject: [PATCH 5/7] SMPdesign: Employ new scheme for snippets from smpalloc.c

NOTE: Names "percpumem" and "percpumempool" are replaced with
"pertheardmem" and "perthreadmempool" to respect those used in
CodeSamples/SMPdesign/smpalloc.c. Wording of "per-CPU" around them
in the text is also modified to "per-thread".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/SMPdesign/smpalloc.c |  57 ++++++++++--------
 SMPdesign/SMPdesign.tex          | 122 ++++++++++-----------------------------
 2 files changed, 63 insertions(+), 116 deletions(-)

diff --git a/CodeSamples/SMPdesign/smpalloc.c b/CodeSamples/SMPdesign/smpalloc.c
index 149e226..72262d6 100644
--- a/CodeSamples/SMPdesign/smpalloc.c
+++ b/CodeSamples/SMPdesign/smpalloc.c
@@ -21,13 +21,14 @@
 
 #include "../api.h"
 
+//\begin{snippet}[labelbase=ln:SMPdesign:smpalloc:data_struct,commandchars=\\\@\$]
 #define TARGET_POOL_SIZE 3
 #define GLOBAL_POOL_SIZE 40
 
-struct memblock {
-	char *bytes[CACHE_LINE_SIZE];
-} memblocks[GLOBAL_POOL_SIZE];
-
+struct memblock {				//\fcvexclude
+	char *bytes[CACHE_LINE_SIZE];		//\fcvexclude
+} memblocks[GLOBAL_POOL_SIZE];			//\fcvexclude
+						//\fcvexclude
 struct globalmempool {
 	spinlock_t mutex;
 	int cur;
@@ -40,46 +41,54 @@ struct perthreadmempool {
 };
 
 DEFINE_PER_THREAD(struct perthreadmempool, perthreadmem);
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:SMPdesign:smpalloc:alloc,commandchars=\\\@\$]
 struct memblock *memblock_alloc(void)
 {
 	int i;
 	struct memblock *p;
-	struct perthreadmempool *pcpp = &__get_thread_var(perthreadmem);
+	struct perthreadmempool *pcpp;
 
-	if (pcpp->cur < 0) {
-		spin_lock(&globalmem.mutex);
-		for (i = 0; i < TARGET_POOL_SIZE && globalmem.cur >= 0; i++) {
+	pcpp = &__get_thread_var(perthreadmem);			//\lnlbl{pick}
+	if (pcpp->cur < 0) {					//\lnlbl{chk:empty}
+		spin_lock(&globalmem.mutex);			//\lnlbl{ack}
+		for (i = 0; i < TARGET_POOL_SIZE &&		//\lnlbl{loop:b}
+		            globalmem.cur >= 0; i++) {
 			pcpp->pool[i] = globalmem.pool[globalmem.cur];
 			globalmem.pool[globalmem.cur--] = NULL;
-		}
-		pcpp->cur = i - 1;
-		spin_unlock(&globalmem.mutex);
+		}						//\lnlbl{loop:e}
+		pcpp->cur = i - 1;				//\lnlbl{set}
+		spin_unlock(&globalmem.mutex);			//\lnlbl{rel}
 	}
-	if (pcpp->cur >= 0) {
-		p = pcpp->pool[pcpp->cur];
+	if (pcpp->cur >= 0) {					//\lnlbl{chk:notempty}
+		p = pcpp->pool[pcpp->cur];			//\lnlbl{rem:b}
 		pcpp->pool[pcpp->cur--] = NULL;
-		return p;
+		return p;					//\lnlbl{rem:e}
 	}
-	return NULL;
+	return NULL;						//\lnlbl{ret:NULL}
 }
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:SMPdesign:smpalloc:free,commandchars=\\\@\$]
 void memblock_free(struct memblock *p)
 {
 	int i;
-	struct perthreadmempool *pcpp = &__get_thread_var(perthreadmem);
+	struct perthreadmempool *pcpp;
 
-	if (pcpp->cur >= 2 * TARGET_POOL_SIZE - 1) {
-		spin_lock(&globalmem.mutex);
-		for (i = pcpp->cur; i >= TARGET_POOL_SIZE; i--) {
+	pcpp = &__get_thread_var(perthreadmem);			//\lnlbl{get}
+	if (pcpp->cur >= 2 * TARGET_POOL_SIZE - 1) {		//\lnlbl{chk:full}
+		spin_lock(&globalmem.mutex);			//\lnlbl{acq}
+		for (i = pcpp->cur; i >= TARGET_POOL_SIZE; i--) {//\lnlbl{loop:b}
 			globalmem.pool[++globalmem.cur] = pcpp->pool[i];
 			pcpp->pool[i] = NULL;
-		}
-		pcpp->cur = i;
-		spin_unlock(&globalmem.mutex);
-	}
-	pcpp->pool[++pcpp->cur] = p;
+		}						//\lnlbl{loop:e}
+		pcpp->cur = i;					//\lnlbl{set}
+		spin_unlock(&globalmem.mutex);			//\lnlbl{rel}
+	}							//\lnlbl{empty:e}
+	pcpp->pool[++pcpp->cur] = p;				//\lnlbl{place}
 }
+//\end{snippet}
 
 void initpools(void)
 {
diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 06a0c8c..3019ef4 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -971,8 +971,8 @@ caches are shown in
 Listing~\ref{lst:SMPdesign:Allocator-Cache Data Structures}.
 The ``Global Pool'' of Figure~\ref{fig:SMPdesign:Allocator Cache Schematic}
 is implemented by \co{globalmem} of type \co{struct globalmempool},
-and the two CPU pools by the per-CPU variable \co{percpumem} of
-type \co{struct percpumempool}.
+and the two CPU pools by the per-thread variable \co{perthreadmem} of
+type \co{struct perthreadmempool}.
 Both of these data structures have arrays of pointers to blocks
 in their \co{pool} fields, which are filled from index zero upwards.
 Thus, if \co{globalmem.pool[3]} is \co{NULL}, then the remainder of
@@ -988,27 +988,7 @@ must be empty.\footnote{
 	a feel for its operation.}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 #define TARGET_POOL_SIZE 3
-  2 #define GLOBAL_POOL_SIZE 40
-  3
-  4 struct globalmempool {
-  5   spinlock_t mutex;
-  6   int cur;
-  7   struct memblock *pool[GLOBAL_POOL_SIZE];
-  8 } globalmem;
-  9
- 10 struct percpumempool {
- 11   int cur;
- 12   struct memblock *pool[2 * TARGET_POOL_SIZE];
- 13 };
- 14
- 15 DEFINE_PER_THREAD(struct percpumempool, percpumem);
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/SMPdesign/smpalloc@data_struct.fcv}
 \caption{Allocator-Cache Data Structures}
 \label{lst:SMPdesign:Allocator-Cache Data Structures}
 \end{listing}
@@ -1033,97 +1013,55 @@ smaller than the number of non-\co{NULL} pointers.
 
 \subsubsection{Allocation Function}
 
+\begin{lineref}[ln:SMPdesign:smpalloc:alloc]
 The allocation function \co{memblock_alloc()} may be seen in
 Listing~\ref{lst:SMPdesign:Allocator-Cache Allocator Function}.
-Line~7 picks up the current thread's per-thread pool,
+Line~\lnref{pick} picks up the current thread's per-thread pool,
 and line~8 check to see if it is empty.
 
-If so, lines~9-16 attempt to refill it from the global pool
-under the spinlock acquired on line~9 and released on line~16.
-Lines~10-14 move blocks from the global to the per-thread pool until
+If so, lines~\lnref{ack}-\lnref{rel} attempt to refill it
+from the global pool
+under the spinlock acquired on line~\lnref{ack} and released on line~\lnref{rel}.
+Lines~\lnref{loop:b}-\lnref{loop:e} move blocks from the global
+to the per-thread pool until
 either the local pool reaches its target size (half full) or
-the global pool is exhausted, and line~15 sets the per-thread pool's
+the global pool is exhausted, and line~\lnref{set} sets the per-thread pool's
 count to the proper value.
 
-In either case, line~18 checks for the per-thread pool still being
-empty, and if not, lines~19-21 remove a block and return it.
-Otherwise, line~23 tells the sad tale of memory exhaustion.
+In either case, line~\lnref{chk:notempty} checks for the per-thread
+pool still being
+empty, and if not, lines~\lnref{rem:b}-\lnref{rem:e} remove a block and return it.
+Otherwise, line~\lnref{ret:NULL} tells the sad tale of memory exhaustion.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct memblock *memblock_alloc(void)
-  2 {
-  3   int i;
-  4   struct memblock *p;
-  5   struct percpumempool *pcpp;
-  6
-  7   pcpp = &__get_thread_var(percpumem);
-  8   if (pcpp->cur < 0) {
-  9     spin_lock(&globalmem.mutex);
- 10     for (i = 0; i < TARGET_POOL_SIZE &&
- 11                 globalmem.cur >= 0; i++) {
- 12       pcpp->pool[i] = globalmem.pool[globalmem.cur];
- 13       globalmem.pool[globalmem.cur--] = NULL;
- 14     }
- 15     pcpp->cur = i - 1;
- 16     spin_unlock(&globalmem.mutex);
- 17   }
- 18   if (pcpp->cur >= 0) {
- 19     p = pcpp->pool[pcpp->cur];
- 20     pcpp->pool[pcpp->cur--] = NULL;
- 21     return p;
- 22   }
- 23   return NULL;
- 24 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/SMPdesign/smpalloc@alloc.fcv}
 \caption{Allocator-Cache Allocator Function}
 \label{lst:SMPdesign:Allocator-Cache Allocator Function}
 \end{listing}
 
 \subsubsection{Free Function}
 
+\begin{lineref}[ln:SMPdesign:smpalloc:free]
 Listing~\ref{lst:SMPdesign:Allocator-Cache Free Function} shows
 the memory-block free function.
-Line~6 gets a pointer to this thread's pool, and
-line~7 checks to see if this per-thread pool is full.
-
-If so, lines~8-15 empty half of the per-thread pool into the global pool,
-with lines~8 and~14 acquiring and releasing the spinlock.
-Lines~9-12 implement the loop moving blocks from the local to the
-global pool, and line~13 sets the per-thread pool's count to the proper
+Line~\lnref{get} gets a pointer to this thread's pool, and
+line~\lnref{chk:full} checks to see if this per-thread pool is full.
+
+If so, lines~\lnref{acq}-\lnref{empty:e} empty half of the per-thread pool
+into the global pool,
+with lines~\lnref{acq} and~\lnref{rel} acquiring and releasing the spinlock.
+Lines~\lnref{loop:b}-\lnref{loop:e} implement the loop moving blocks
+from the local to the
+global pool, and line~\lnref{set} sets the per-thread pool's count to the proper
 value.
 
-In either case, line~16 then places the newly freed block into the
+In either case, line~\lnref{place} then places the newly freed block into the
 per-thread pool.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 void memblock_free(struct memblock *p)
-  2 {
-  3   int i;
-  4   struct percpumempool *pcpp;
-  5
-  6   pcpp = &__get_thread_var(percpumem);
-  7   if (pcpp->cur >= 2 * TARGET_POOL_SIZE - 1) {
-  8     spin_lock(&globalmem.mutex);
-  9     for (i = pcpp->cur; i >= TARGET_POOL_SIZE; i--) {
- 10       globalmem.pool[++globalmem.cur] = pcpp->pool[i];
- 11       pcpp->pool[i] = NULL;
- 12     }
- 13     pcpp->cur = i;
- 14     spin_unlock(&globalmem.mutex);
- 15   }
- 16   pcpp->pool[++pcpp->cur] = p;
- 17 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/SMPdesign/smpalloc@free.fcv}
 \caption{Allocator-Cache Free Function}
 \label{lst:SMPdesign:Allocator-Cache Free Function}
 \end{listing}
-- 
2.7.4


