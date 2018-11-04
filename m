Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OSrbmXCe5zky1VbNcEcApjL/cC6+kr6cknn5swqLs88=;
        b=FxYKLi6OGzngSBy35fLe5ZySAtwiPAhTXP8Vc5NW+s20GHS3dxlaawd6TMhD69Pyqe
         dkZNxgebVQ/DAliyHZ2S9ssf6VO6MaldQ2f7uk6xyGYmclbuAW+B2D798aYv2FVszWfT
         pxzvgrev2e84W7MTANkOIqElKf7GlT+2cAqqbbdK5Xs632nm5mpiM9u/fKx4MxWzxPlt
         FPEQSTkw6f1Xs1gMmm/YyPbJRNs6WWxjF3V7qNb/DiWtNuHogdayjTptyt3/Dyy57EAf
         Q2YvPqbo50bGwTS8Hcxtaw/p5HqrWpc/JmHHWoMolE3YkMhFNaI5VZgRTkNxiMoc91l9
         Nk1w==
Subject: [PATCH 2/7] SMPdesign: Employ new scheme for snippet of lockhdeq.c
References: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3f98dde5-c920-1f9f-b600-6af261ad53b9@gmail.com>
Date: Sun, 4 Nov 2018 09:09:40 +0900
MIME-Version: 1.0
In-Reply-To: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c516d1ab6d3930d0431aa30a4cf4e3004d70a865 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 28 Oct 2018 18:11:44 +0900
Subject: [PATCH 2/7] SMPdesign: Employ new scheme for snippet of lockhdeq.c

To remove " ____cacheline_internodealigned_in_smp" in the resulting
snippet, provide alternative statement in a comment block as follows:

	spinlock_t rlock ____cacheline_internodealigned_in_smp;	//\fcvexclude
/* -- begin alternative code for snippet \fcvexclude
	spinlock_t rlock;				//\lnlbl{rlock}
   -- end alternative code for snippet \fcvexclude */

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/SMPdesign/lockhdeq.c | 19 ++++++++++++-------
 SMPdesign/partexercises.tex      | 24 +++++++-----------------
 2 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/CodeSamples/SMPdesign/lockhdeq.c b/CodeSamples/SMPdesign/lockhdeq.c
index d6cc099..8ba635b 100644
--- a/CodeSamples/SMPdesign/lockhdeq.c
+++ b/CodeSamples/SMPdesign/lockhdeq.c
@@ -129,15 +129,20 @@ void deq_push_r(struct cds_list_head *e, struct deq *p)
 
 #define PDEQ_N_BKTS 4
 
+//\begin{snippet}[labelbase=ln:SMPdesign:lockhdeq:struct_pdeq,commandchars=\\\@\$]
 struct pdeq {
-	spinlock_t llock;
-	int lidx;
-	/* char pad1[CACHE_LINE_SIZE - sizeof(spinlock_t) - sizeof(int)]; */
-	spinlock_t rlock ____cacheline_internodealigned_in_smp;
-	int ridx;
-	/* char pad2[CACHE_LINE_SIZE - sizeof(spinlock_t) - sizeof(int)]; */
-	struct deq bkt[PDEQ_N_BKTS];
+	spinlock_t llock;				//\lnlbl{llock}
+	int lidx;					//\lnlbl{lidx}
+	/* char pad1[CACHE_LINE_SIZE - sizeof(spinlock_t) - sizeof(int)]; */	//\fcvexclude
+	spinlock_t rlock ____cacheline_internodealigned_in_smp;			//\fcvexclude
+/* -- begin alternative code for snippet \fcvexclude
+	spinlock_t rlock;				//\lnlbl{rlock}
+   -- end alternative code for snippet \fcvexclude */
+	int ridx;					//\lnlbl{ridx}
+	/* char pad2[CACHE_LINE_SIZE - sizeof(spinlock_t) - sizeof(int)]; */	//\fcvexclude
+	struct deq bkt[PDEQ_N_BKTS];			//\lnlbl{bkt}
 };
+//\end{snippet}
 
 static int moveleft(int idx)
 {
diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index db4b5d8..5b5fd5a 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -342,19 +342,7 @@ Each underlying single-lock double-ended queue holds a one-quarter
 slice of the full parallel double-ended queue.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct pdeq {
-  2   spinlock_t llock;
-  3   int lidx;
-  4   spinlock_t rlock;
-  5   int ridx;
-  6   struct deq bkt[DEQ_N_BKTS];
-  7 };
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/SMPdesign/lockhdeq@struct_pdeq.fcv}
 \caption{Lock-Based Parallel Double-Ended Queue Data Structure}
 \label{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Data Structure}
 \end{listing}
@@ -363,13 +351,15 @@ Listing~\ref{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Data Structure
 shows the corresponding C-language data structure, assuming an
 existing \co{struct deq} that provides a trivially locked
 double-ended-queue implementation.
-This data structure contains the left-hand lock on line~2,
-the left-hand index on line~3, the right-hand lock on line~4
+\begin{lineref}[ln:SMPdesign:lockhdeq:struct_pdeq]
+This data structure contains the left-hand lock on line~\lnref{llock},
+the left-hand index on line~\lnref{lidx}, the right-hand lock on line~\lnref{rlock}
 (which is cache-aligned in the actual implementation),
-the right-hand index on line~5, and, finally, the hashed array
-of simple lock-based double-ended queues on line~6.
+the right-hand index on line~\lnref{ridx}, and, finally, the hashed array
+of simple lock-based double-ended queues on line~\lnref{bkt}.
 A high-performance implementation would of course use padding or special
 alignment directives to avoid false sharing.
+\end{lineref}
 
 \begin{listing*}[bp]
 { \scriptsize
-- 
2.7.4


