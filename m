Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OrwwVs1hAS9wR4z0YdpoEb2WdGKgrFvzaoqilFhgnek=;
        b=e5d/EBI2SOjhmng/EcyI3vJNw3u31tj4pyuf2Ig5VT2DezF19Vb4dYhrjhcfhRJi/0
         uVDjeDaT7NBsQ2ORiVtPCANVmK/zbZT5xALz8bLpkF/nl95yYqoiazgjzng2olxSHHR/
         bZU/yT0ggWAZ4S1DJXSazu6mAaXXrMn3lllsz7gg1AdAbx7vY2r6/rZaIs5JBu+3TWCm
         Yt0vRohAZ88uxdtMDjoGlNlv/Ac4Ms4PRusZZG9adIsRZQtzZsBsfsJ0+63GSd19eoZe
         D5lE+QzEdFU0254gDlVngBz4rotRaa2qW5tmkoGuzrb6yxGjnJm1FOUjPrPlrFaI5nV7
         TEfA==
Subject: [PATCH 3/7] SMPdesign: Employ new scheme for snippet of lockhdeq.c
 and locktdeq.c
References: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0246eeae-facf-ef68-6da9-159693b851ec@gmail.com>
Date: Sun, 4 Nov 2018 09:11:12 +0900
MIME-Version: 1.0
In-Reply-To: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 966f43a286dedd32a577409fa54221b42f50d8cd Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 29 Oct 2018 21:07:28 +0900
Subject: [PATCH 3/7] SMPdesign: Employ new scheme for snippet of lockhdeq.c and locktdeq.c

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/SMPdesign/lockhdeq.c |  34 +++---
 CodeSamples/SMPdesign/locktdeq.c |  70 ++++++------
 SMPdesign/partexercises.tex      | 237 +++++++++++++--------------------------
 3 files changed, 132 insertions(+), 209 deletions(-)

diff --git a/CodeSamples/SMPdesign/lockhdeq.c b/CodeSamples/SMPdesign/lockhdeq.c
index 8ba635b..1b57423 100644
--- a/CodeSamples/SMPdesign/lockhdeq.c
+++ b/CodeSamples/SMPdesign/lockhdeq.c
@@ -166,19 +166,20 @@ void init_pdeq(struct pdeq *d)
 		init_deq(&d->bkt[i]);
 }
 
-struct cds_list_head *pdeq_pop_l(struct pdeq *d)
+//\begin{snippet}[labelbase=ln:SMPdesign:lockhdeq:pop_push,commandchars=\\\@\$]
+struct cds_list_head *pdeq_pop_l(struct pdeq *d)//\lnlbl{popl:b}
 {
 	struct cds_list_head *e;
 	int i;
 
-	spin_lock(&d->llock);
-	i = moveright(d->lidx);
-	e = deq_pop_l(&d->bkt[i]);
-	if (e != NULL)
-		d->lidx = i;
-	spin_unlock(&d->llock);
-	return e;
-}
+	spin_lock(&d->llock);			//\lnlbl{popl:acq}
+	i = moveright(d->lidx);			//\lnlbl{popl:idx}
+	e = deq_pop_l(&d->bkt[i]);		//\lnlbl{popl:deque}
+	if (e != NULL)				//\lnlbl{popl:check}
+		d->lidx = i;			//\lnlbl{popl:record}
+	spin_unlock(&d->llock);			//\lnlbl{popl:rel}
+	return e;				//\lnlbl{popl:return}
+}						//\lnlbl{popl:e}
 
 struct cds_list_head *pdeq_pop_r(struct pdeq *d)
 {
@@ -194,16 +195,16 @@ struct cds_list_head *pdeq_pop_r(struct pdeq *d)
 	return e;
 }
 
-void pdeq_push_l(struct cds_list_head *e, struct pdeq *d)
+void pdeq_push_l(struct cds_list_head *e, struct pdeq *d)//\lnlbl{pushl:b}
 {
 	int i;
 
-	spin_lock(&d->llock);
-	i = d->lidx;
-	deq_push_l(e, &d->bkt[i]);
-	d->lidx = moveleft(d->lidx);
-	spin_unlock(&d->llock);
-}
+	spin_lock(&d->llock);				//\lnlbl{pushl:acq}
+	i = d->lidx;					//\lnlbl{pushl:idx}
+	deq_push_l(e, &d->bkt[i]);			//\lnlbl{pushl:enque}
+	d->lidx = moveleft(d->lidx);			//\lnlbl{pushl:update}
+	spin_unlock(&d->llock);				//\lnlbl{pushl:rel}
+}							//\lnlbl{pushl:e}
 
 void pdeq_push_r(struct cds_list_head *e, struct pdeq *d)
 {
@@ -215,6 +216,7 @@ void pdeq_push_r(struct cds_list_head *e, struct pdeq *d)
 	d->ridx = moveright(d->ridx);
 	spin_unlock(&d->rlock);
 }
+//\end{snippet}
 
 #ifdef TEST
 #define DEQ_AND_PDEQ
diff --git a/CodeSamples/SMPdesign/locktdeq.c b/CodeSamples/SMPdesign/locktdeq.c
index 335a68b..4a0ca51 100644
--- a/CodeSamples/SMPdesign/locktdeq.c
+++ b/CodeSamples/SMPdesign/locktdeq.c
@@ -99,58 +99,60 @@ void init_pdeq(struct pdeq *d)
 	init_deq(&d->rdeq);
 }
 
-struct cds_list_head *pdeq_pop_l(struct pdeq *d)
+//\begin{snippet}[labelbase=ln:SMPdesign:locktdeq:pop_push,commandchars=\\\@\$]
+struct cds_list_head *pdeq_pop_l(struct pdeq *d)		//\lnlbl{popl:b}
 {
 	struct cds_list_head *e;
 
-	spin_lock(&d->llock);
-	e = deq_pop_l(&d->ldeq);
+	spin_lock(&d->llock);					//\lnlbl{popl:acq:l}
+	e = deq_pop_l(&d->ldeq);				//\lnlbl{popl:deq:ll}
 	if (e == NULL) {
-		spin_lock(&d->rlock);
-		e = deq_pop_l(&d->rdeq);
-		cds_list_splice(&d->rdeq.chain, &d->ldeq.chain);
-		CDS_INIT_LIST_HEAD(&d->rdeq.chain);
-		spin_unlock(&d->rlock);
-	}
-	spin_unlock(&d->llock);
+		spin_lock(&d->rlock);				//\lnlbl{popl:acq:r}
+		e = deq_pop_l(&d->rdeq);			//\lnlbl{popl:deq:lr}
+		cds_list_splice(&d->rdeq.chain, &d->ldeq.chain);//\lnlbl{popl:move}
+		CDS_INIT_LIST_HEAD(&d->rdeq.chain);		//\lnlbl{popl:init:r}
+		spin_unlock(&d->rlock);				//\lnlbl{popl:rel:r}
+	}							//\lnlbl{popl:skip}
+	spin_unlock(&d->llock);					//\lnlbl{popl:rel:l}
 	return e;
-}
+}								//\lnlbl{popl:e}
 
-struct cds_list_head *pdeq_pop_r(struct pdeq *d)
+struct cds_list_head *pdeq_pop_r(struct pdeq *d)		//\lnlbl{popr:b}
 {
 	struct cds_list_head *e;
 
-	spin_lock(&d->rlock);
-	e = deq_pop_r(&d->rdeq);
-	if (e == NULL) {
-		spin_unlock(&d->rlock);
-		spin_lock(&d->llock);
-		spin_lock(&d->rlock);
-		e = deq_pop_r(&d->rdeq);
-		if (e == NULL) {
-			e = deq_pop_r(&d->ldeq);
-			cds_list_splice(&d->ldeq.chain, &d->rdeq.chain);
-			CDS_INIT_LIST_HEAD(&d->ldeq.chain);
+	spin_lock(&d->rlock);					//\lnlbl{popr:acq:r1}
+	e = deq_pop_r(&d->rdeq);				//\lnlbl{popr:deq:rr1}
+	if (e == NULL) {					//\lnlbl{popr:check1}
+		spin_unlock(&d->rlock);				//\lnlbl{popr:rel:r1}
+		spin_lock(&d->llock);				//\lnlbl{popr:acq:l}
+		spin_lock(&d->rlock);				//\lnlbl{popr:acq:r2}
+		e = deq_pop_r(&d->rdeq);			//\lnlbl{popr:deq:rr2}
+		if (e == NULL) {				//\lnlbl{popr:check2}
+			e = deq_pop_r(&d->ldeq);			//\lnlbl{popr:deq:rl}
+			cds_list_splice(&d->ldeq.chain, &d->rdeq.chain);//\lnlbl{popr:move}
+			CDS_INIT_LIST_HEAD(&d->ldeq.chain);		//\lnlbl{popr:init:l}
 		}
-		spin_unlock(&d->llock);
-	}
-	spin_unlock(&d->rlock);
+		spin_unlock(&d->llock);				//\lnlbl{popr:rel:l}
+	}							//\lnlbl{popr:skip2}
+	spin_unlock(&d->rlock);					//\lnlbl{popr:rel:r2}
 	return e;
-}
+}								//\lnlbl{popr:e}
 
-void pdeq_push_l(struct cds_list_head *e, struct pdeq *d)
+void pdeq_push_l(struct cds_list_head *e, struct pdeq *d)	//\lnlbl{pushl:b}
 {
-	spin_lock(&d->llock);
-	deq_push_l(e, &d->ldeq);
-	spin_unlock(&d->llock);
-}
+	spin_lock(&d->llock);					//\lnlbl{pushl:acq:l}
+	deq_push_l(e, &d->ldeq);				//\lnlbl{pushl:que:l}
+	spin_unlock(&d->llock);					//\lnlbl{pushl:rel:l}
+}								//\lnlbl{pushl:e}
 
-void pdeq_push_r(struct cds_list_head *e, struct pdeq *d)
+void pdeq_push_r(struct cds_list_head *e, struct pdeq *d)	//\lnlbl{pushr:b}
 {
 	spin_lock(&d->rlock);
 	deq_push_r(e, &d->rdeq);
 	spin_unlock(&d->rlock);
-}
+}								//\lnlbl{pushr:e}
+//\end{snippet}
 
 #ifdef TEST
 #include "deqtorture.h"
diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 5b5fd5a..5ce7e86 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -361,65 +361,11 @@ A high-performance implementation would of course use padding or special
 alignment directives to avoid false sharing.
 \end{lineref}
 
-\begin{listing*}[bp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct cds_list_head *pdeq_pop_l(struct pdeq *d)
-  2 {
-  3   struct cds_list_head *e;
-  4   int i;
-  5 
-  6   spin_lock(&d->llock);
-  7   i = moveright(d->lidx);
-  8   e = deq_pop_l(&d->bkt[i]);
-  9   if (e != NULL)
- 10     d->lidx = i;
- 11   spin_unlock(&d->llock);
- 12   return e;
- 13 }
- 14 
- 15 struct cds_list_head *pdeq_pop_r(struct pdeq *d)
- 16 {
- 17   struct cds_list_head *e;
- 18   int i;
- 19 
- 20   spin_lock(&d->rlock);
- 21   i = moveleft(d->ridx);
- 22   e = deq_pop_r(&d->bkt[i]);
- 23   if (e != NULL)
- 24     d->ridx = i;
- 25   spin_unlock(&d->rlock);
- 26   return e;
- 27 }
- 28 
- 29 void pdeq_push_l(struct cds_list_head *e, struct pdeq *d)
- 30 {
- 31   int i;
- 32 
- 33   spin_lock(&d->llock);
- 34   i = d->lidx;
- 35   deq_push_l(e, &d->bkt[i]);
- 36   d->lidx = moveleft(d->lidx);
- 37   spin_unlock(&d->llock);
- 38 }
- 39 
- 40 void pdeq_push_r(struct cds_list_head *e, struct pdeq *d)
- 41 {
- 42   int i;
- 43 
- 44   spin_lock(&d->rlock);
- 45   i = d->ridx;
- 46   deq_push_r(e, &d->bkt[i]);
- 47   d->ridx = moveright(d->ridx);
- 48   spin_unlock(&d->rlock);
- 49 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{listing}[tbp]
+\input{CodeSamples/SMPdesign/lockhdeq@pop_push.fcv}
 \caption{Lock-Based Parallel Double-Ended Queue Implementation}
 \label{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Implementation}
-\end{listing*}
+\end{listing}
 
 Listing~\ref{lst:SMPdesign:Lock-Based Parallel Double-Ended Queue Implementation}
 (\path{lockhdeq.c})
@@ -430,22 +376,34 @@ shows the implementation of the enqueue and dequeue functions.\footnote{
 Discussion will focus on the left-hand operations, as the right-hand
 operations are trivially derived from them.
 
-Lines~1-13 show \co{pdeq_pop_l()}, which left\-/dequeues and returns
+\begin{lineref}[ln:SMPdesign:lockhdeq:pop_push:popl]
+Lines~\lnref{b}-\lnref{e} show \co{pdeq_pop_l()},
+which left\-/dequeues and returns
 an element if possible, returning \co{NULL} otherwise.
-Line~6 acquires the left-hand spinlock, and line~7 computes the
+Line~\lnref{acq} acquires the left-hand spinlock,
+and line~\lnref{idx} computes the
 index to be dequeued from.
-Line~8 dequeues the element, and, if line~9 finds the result to be
-non-\co{NULL}, line~10 records the new left-hand index.
-Either way, line~11 releases the lock, and, finally, line~12 returns
+Line~\lnref{deque} dequeues the element, and,
+if line~\lnref{check} finds the result to be
+non-\co{NULL}, line~\lnref{record} records the new left-hand index.
+Either way, line~\lnref{rel} releases the lock, and,
+finally, line~\lnref{return} returns
 the element if there was one, or \co{NULL} otherwise.
+\end{lineref}
 
-Lines~29-38 shows \co{pdeq_push_l()}, which left-enqueues the specified
+\begin{lineref}[ln:SMPdesign:lockhdeq:pop_push:pushl]
+Lines~\lnref{b}-\lnref{e} shows \co{pdeq_push_l()},
+which left-enqueues the specified
 element.
-Line~33 acquires the left-hand lock, and line~34 picks up the left-hand
+Line~\lnref{acq} acquires the left-hand lock,
+and line~\lnref{idx} picks up the left-hand
 index.
-Line~35 left-enqueues the specified element onto the double-ended queue
+Line~\lnref{enque} left-enqueues the specified element
+onto the double-ended queue
 indexed by the left-hand index.
-Line~36 then updates the left-hand index and line~37 releases the lock.
+Line~\lnref{update} then updates the left-hand index
+and line~\lnref{rel} releases the lock.
+\end{lineref}
 
 As noted earlier, the right-hand operations are completely analogous
 to their left-handed counterparts, so their analysis is left as an
@@ -500,72 +458,11 @@ the previous section, the compound implementation will build on
 a sequential implementation of a double-ended queue that uses
 neither locks nor atomic operations.
 
-\begin{listing*}[bp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct cds_list_head *pdeq_pop_l(struct pdeq *d)
-  2 {
-  3   struct cds_list_head *e;
-  4 
-  5   spin_lock(&d->llock);
-  6   e = deq_pop_l(&d->ldeq);
-  7   if (e == NULL) {
-  8     spin_lock(&d->rlock);
-  9     e = deq_pop_l(&d->rdeq);
- 10     cds_list_splice(&d->rdeq.chain, &d->ldeq.chain);
- 11     CDS_INIT_LIST_HEAD(&d->rdeq.chain);
- 12     spin_unlock(&d->rlock);
- 13   }
- 14   spin_unlock(&d->llock);
- 15   return e;
- 16 }
- 17 
- 18 struct cds_list_head *pdeq_pop_r(struct pdeq *d)
- 19 {
- 20   struct cds_list_head *e;
- 21 
- 22   spin_lock(&d->rlock);
- 23   e = deq_pop_r(&d->rdeq);
- 24   if (e == NULL) {
- 25     spin_unlock(&d->rlock);
- 26     spin_lock(&d->llock);
- 27     spin_lock(&d->rlock);
- 28     e = deq_pop_r(&d->rdeq);
- 29     if (e == NULL) {
- 30       e = deq_pop_r(&d->ldeq);
- 31       cds_list_splice(&d->ldeq.chain, &d->rdeq.chain);
- 32       CDS_INIT_LIST_HEAD(&d->ldeq.chain);
- 33     }
- 34     spin_unlock(&d->llock);
- 35   }
- 36   spin_unlock(&d->rlock);
- 37   return e;
- 38 }
- 39 
- 40 void pdeq_push_l(struct cds_list_head *e, struct pdeq *d)
- 41 {
- 42   int i;
- 43 
- 44   spin_lock(&d->llock);
- 45   deq_push_l(e, &d->ldeq);
- 46   spin_unlock(&d->llock);
- 47 }
- 48 
- 49 void pdeq_push_r(struct cds_list_head *e, struct pdeq *d)
- 50 {
- 51   int i;
- 52 
- 53   spin_lock(&d->rlock);
- 54   deq_push_r(e, &d->rdeq);
- 55   spin_unlock(&d->rlock);
- 56 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{listing}[tbp]
+\input{CodeSamples/SMPdesign/locktdeq@pop_push.fcv}
 \caption{Compound Parallel Double-Ended Queue Implementation}
 \label{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
-\end{listing*}
+\end{listing}
 
 Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
 shows the implementation.
@@ -583,50 +480,66 @@ and \co{pdeq_pop_r()} implementations separately.
 	(see Section~\ref{sec:SMPdesign:Dining Philosophers Problem}).
 } \QuickQuizEnd
 
-The \co{pdeq_pop_l()} implementation is shown on lines~1-16
+\begin{lineref}[ln:SMPdesign:locktdeq:pop_push:popl]
+The \co{pdeq_pop_l()} implementation is shown on
+lines~\lnref{b}-\lnref{e}
 of the figure.
-Line~5 acquires the left-hand lock, which line~14 releases.
-Line~6 attempts to left-dequeue an element from the left-hand underlying
-double-ended queue, and, if successful, skips lines~8-13 to simply
+Line~\lnref{acq:l} acquires the left-hand lock,
+which line~\lnref{rel:l} releases.
+Line~\lnref{deq:ll} attempts to left-dequeue an element
+from the left-hand underlying
+double-ended queue, and, if successful,
+skips lines~\lnref{acq:r}-\lnref{skip} to simply
 return this element.
-Otherwise, line~8 acquires the right-hand lock, line~9
+Otherwise, line~\lnref{acq:r} acquires the right-hand lock, line~\lnref{deq:lr}
 left-dequeues an element from the right-hand queue,
-and line~10 moves any remaining elements on the right-hand
-queue to the left-hand queue, line~11 initializes the right-hand queue,
-and line~12 releases the right-hand lock.
-The element, if any, that was dequeued on line~10 will be returned.
+and line~\lnref{move} moves any remaining elements on the right-hand
+queue to the left-hand queue, line~\lnref{init:r} initializes
+the right-hand queue,
+and line~\lnref{rel:r} releases the right-hand lock.
+The element, if any, that was dequeued on line~\lnref{deq:lr} will be returned.
+\end{lineref}
 
-The \co{pdeq_pop_r()} implementation is shown on lines~18-38
+\begin{lineref}[ln:SMPdesign:locktdeq:pop_push:popr]
+The \co{pdeq_pop_r()} implementation is shown on lines~\lnref{b}-\lnref{e}
 of the figure.
-As before, line~22 acquires the right-hand lock (and line~36
-releases it), and line~23 attempts to right-dequeue an element
-from the right-hand queue, and, if successful, skips lines~24-35
+As before, line~\lnref{acq:r1} acquires the right-hand lock
+(and line~\lnref{rel:r2}
+releases it), and line~\lnref{deq:rr1} attempts to right-dequeue an element
+from the right-hand queue, and, if successful,
+skips lines~\lnref{rel:r1}-\lnref{skip2}
 to simply return this element.
-However, if line~24 determines that there was no element to dequeue,
-line~25 releases the right-hand lock and lines~26-27 acquire both
+However, if line~\lnref{check1} determines that there was no element to dequeue,
+line~\lnref{rel:r1} releases the right-hand lock and
+lines~\lnref{acq:l}-\lnref{acq:r2} acquire both
 locks in the proper order.
-Line~28 then attempts to right-dequeue an element from the right-hand
-list again, and if line~29 determines that this second attempt has
-failed, line~30 right-dequeues an element from the left-hand queue
-(if there is one available), line~31 moves any remaining elements
-from the left-hand queue to the right-hand queue, and line~32
+Line~\lnref{deq:rr2} then attempts to right-dequeue an element
+from the right-hand
+list again, and if line~\lnref{check2} determines that this second attempt has
+failed, line~\lnref{deq:rl} right-dequeues an element from the left-hand queue
+(if there is one available), line~\lnref{move} moves any remaining elements
+from the left-hand queue to the right-hand queue, and line~\lnref{init:l}
 initializes the left-hand queue.
-Either way, line~34 releases the left-hand lock.
+Either way, line~\lnref{rel:l} releases the left-hand lock.
+\end{lineref}
 
 \QuickQuiz{}
 	Why is it necessary to retry the right-dequeue operation
-	on line~28 of
+	on line~\ref{ln:SMPdesign:locktdeq:pop_push:popr:deq:rr2} of
 	Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}?
 \QuickQuizAnswer{
+	\begin{lineref}[ln:SMPdesign:locktdeq:pop_push:popr]
 	This retry is necessary because some other thread might have
 	enqueued an element between the time that this thread dropped
-	\co{d->rlock} on line~25 and the time that it reacquired this
-	same lock on line~27.
+	\co{d->rlock} on line~\lnref{rel:r1} and the time that it reacquired this
+	same lock on line~\lnref{acq:r2}.
+	\end{lineref}
 } \QuickQuizEnd
 
 \QuickQuiz{}
 	Surely the left-hand lock must \emph{sometimes} be available!!!
-	So why is it necessary that line~25 of
+	So why is it necessary that
+        line~\ref{ln:SMPdesign:locktdeq:pop_push:popr:rel:r1} of
 	Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}
 	unconditionally release the right-hand lock?
 \QuickQuizAnswer{
@@ -638,13 +551,19 @@ Either way, line~34 releases the left-hand lock.
 	it is worthwhile) is left as an exercise for the reader.
 } \QuickQuizEnd
 
-The \co{pdeq_push_l()} implementation is shown on lines~40-47 of
+\begin{lineref}[ln:SMPdesign:locktdeq:pop_push:pushl]
+The \co{pdeq_push_l()} implementation is shown on
+lines~\lnref{b}-\lnref{e} of
 Listing~\ref{lst:SMPdesign:Compound Parallel Double-Ended Queue Implementation}.
-Line~44 acquires the left-hand spinlock, line~45 left-enqueues the
-element onto the left-hand queue, and finally line~46 releases
+Line~\lnref{acq:l} acquires the left-hand spinlock,
+line~\lnref{que:l} left-enqueues the
+element onto the left-hand queue, and finally line~\lnref{rel:l} releases
 the lock.
-The \co{pdeq_enqueue_r()} implementation (shown on lines~49-56)
+\end{lineref}
+\begin{lineref}[ln:SMPdesign:locktdeq:pop_push:pushr]
+The \co{pdeq_push_r()} implementation (shown on lines~\lnref{b}-\lnref{e})
 is quite similar.
+\end{lineref}
 
 \QuickQuiz{}
 	But in the case where data is flowing in only one direction,
-- 
2.7.4


