Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PDMD1BWUi9egQjUy6CkzNfKTY13sfVSJGlENhPpcM/g=;
        b=BNTuhdo++oOIq4Q73uIaw+egLHmOuRbjcRenIHOhZv6648foGAVJ6cqo0Aa0zckke1
         +ZOqXMd/kw17NoruKg5h+ZWJI/IpsYsyvGEa8HAbW7EsMxql5CcR2MUMyWhtCD9V5Uux
         XA6+geRlx3ctP//wptvMVFOdbHoXt5KEp1QQot9gcP7s7qQY6OSIQLykBmwfyE5agiGZ
         DwSrGpvwQn2SCB2RK/ZZLI/OCKw/w0FMSe/fBZihL9AJZCa1w3G9ORkChq6nMO+13osE
         U7uOPORGY4yweIZMlalFM0taDN1hjaPiCj0BPuGZa6ovwvk0YstItBnmzf47Bnse5Dfo
         KXrA==
Subject: [PATCH 1/3] locking: Employ new snippet scheme
References: <54d29326-1695-4b98-48a7-ff9c1439f448@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5a508794-b8b5-0950-a7d8-8a1a96da3644@gmail.com>
Date: Tue, 20 Nov 2018 00:17:51 +0900
MIME-Version: 1.0
In-Reply-To: <54d29326-1695-4b98-48a7-ff9c1439f448@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c0e039de5fbfd2379548e81cce26fd10843aa245 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 19 Nov 2018 22:51:32 +0900
Subject: [PATCH 1/3] locking: Employ new snippet scheme

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/locking/locked_list.c |  29 ++-
 CodeSamples/locking/xchglock.c    |  24 +-
 locking/locking-existence.tex     | 104 ++++-----
 locking/locking.tex               | 471 +++++++++++++++++---------------------
 4 files changed, 292 insertions(+), 336 deletions(-)

diff --git a/CodeSamples/locking/locked_list.c b/CodeSamples/locking/locked_list.c
index 6d38d1c..0580b09 100644
--- a/CodeSamples/locking/locked_list.c
+++ b/CodeSamples/locking/locked_list.c
@@ -20,14 +20,15 @@
 
 #include "../api.h"
 
+//\begin{snippet}[labelbase=ln:locking:locked_list:start_next,commandchars=\\\[\]]
 struct locked_list {
 	spinlock_t s;
 	struct cds_list_head h;
 };
 
-struct cds_list_head *list_next(struct locked_list *lp,
-				struct cds_list_head *np);
-
+struct cds_list_head *list_next(struct locked_list *lp,		//\fcvexclude
+				struct cds_list_head *np);	//\fcvexclude
+								//\fcvexclude
 struct cds_list_head *list_start(struct locked_list *lp)
 {
 	spin_lock(&lp->s);
@@ -35,7 +36,7 @@ struct cds_list_head *list_start(struct locked_list *lp)
 }
 
 struct cds_list_head *list_next(struct locked_list *lp,
-				struct cds_list_head *np)
+                                struct cds_list_head *np)
 {
 	struct cds_list_head *ret;
 
@@ -46,29 +47,33 @@ struct cds_list_head *list_next(struct locked_list *lp,
 	}
 	return ret;
 }
+//\end{snippet}
+
 
 void list_stop(struct locked_list *lp)
 {
 	spin_unlock(&lp->s);
 }
 
-struct list_ints {
+//\begin{snippet}[labelbase=ln:locking:locked_list:list_print,commandchars=\@\[\]]
+struct list_ints {			//\lnlbl{ints:b}
 	struct cds_list_head n;
 	int a;
-};
+};					//\lnlbl{ints:e}
 
-void list_print(struct locked_list *lp)
+void list_print(struct locked_list *lp)	//\lnlbl{print:b}
 {
 	struct cds_list_head *np;
 	struct list_ints *ip;
 
-	np = list_start(lp);
+	np = list_start(lp);		//\lnlbl{print:start}
 	while (np != NULL) {
-		ip = cds_list_entry(np, struct list_ints, n);
-		printf("\t%d\n", ip->a);
-		np = list_next(lp, np);
+		ip = cds_list_entry(np, struct list_ints, n); //\lnlbl{print:entry}
+		printf("\t%d\n", ip->a);//\lnlbl{print:print}
+		np = list_next(lp, np);	//\lnlbl{print:next}
 	}
-}
+}					//\lnlbl{print:e}
+//\end{snippet}
 
 struct locked_list head;
 
diff --git a/CodeSamples/locking/xchglock.c b/CodeSamples/locking/xchglock.c
index 2c85d90..5877920 100644
--- a/CodeSamples/locking/xchglock.c
+++ b/CodeSamples/locking/xchglock.c
@@ -20,22 +20,24 @@
 
 #include "../api.h"
 
-typedef int xchglock_t;
+//\begin{snippet}[labelbase=ln:locking:xchglock:lock_unlock,commandchars=\\\[\]]
+typedef int xchglock_t;				//\lnlbl{typedef}
+						//\fcvexclude
+#define DEFINE_XCHG_LOCK(n) xchglock_t n = 0	//\lnlbl{initval}
 
-#define DEFINE_XCHG_LOCK(n) xchglock_t n = 0
-
-void xchg_lock(xchglock_t *xp)
+void xchg_lock(xchglock_t *xp)			//\lnlbl{lock:b}
 {
-	while (xchg(xp, 1) == 1) {
-		while (*xp == 1)
-			continue;
+	while (xchg(xp, 1) == 1) {		//\lnlbl{lock:atmxchg}
+		while (*xp == 1)		//\lnlbl{lock:inner:b}
+			continue;		//\lnlbl{lock:inner:e}
 	}
-}
+}						//\lnlbl{lock:e}
 
-void xchg_unlock(xchglock_t *xp)
+void xchg_unlock(xchglock_t *xp)		//\lnlbl{unlock:b}
 {
-	(void)xchg(xp, 0);
-}
+	(void)xchg(xp, 0);			//\lnlbl{unlock:atmxchg}
+}						//\lnlbl{unlock:e}
+//\end{snippet}
 
 DEFINE_XCHG_LOCK(testlock);
 
diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 6340734..3b62da0 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -4,27 +4,25 @@
 \label{sec:locking:Lock-Based Existence Guarantees}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 int delete(int key)
-  2 {
-  3   int b;
-  4   struct element *p;
-  5
-  6   b = hashfunction(key);
-  7   p = hashtable[b];
-  8   if (p == NULL || p->key != key)
-  9     return 0;
- 10   spin_lock(&p->lock);
- 11   hashtable[b] = NULL;
- 12   spin_unlock(&p->lock);
- 13   kfree(p);
- 14   return 1;
- 15 }
-\end{verbbox}
+\begin{linelabel}[ln:locking:Per-Element Locking Without Existence Guarantees]
+\begin{VerbatimL}[commandchars=\\\@\$]
+int delete(int key)
+{
+	int b;
+	struct element *p;
+
+	b = hashfunction(key);
+	p = hashtable[b];
+	if (p == NULL || p->key != key)		\lnlbl@chk_first$
+		return 0;
+	spin_lock(&p->lock);			\lnlbl@acq$
+	hashtable[b] = NULL;			\lnlbl@NULL$
+	spin_unlock(&p->lock);
+	kfree(p);
+	return 1;				\lnlbl@return1$
 }
-\centering
-\theverbbox
+\end{VerbatimL}
+\end{linelabel}
 \caption{Per-Element Locking Without Existence Guarantees}
 \label{lst:locking:Per-Element Locking Without Existence Guarantees}
 \end{listing}
@@ -98,9 +96,11 @@ as shown in
 Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}.
 
 \QuickQuiz{}
+	\begin{lineref}[ln:locking:Per-Element Locking Without Existence Guarantees]
 	What if the element we need to delete is not the first element
-	of the list on line~8 of
+	of the list on line~\lnref{chk_first} of
 	Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}?
+        \end{lineref}
 \QuickQuizAnswer{
 	This is a very simple hash table with no chaining, so the only
 	element in a given bucket is the first element.
@@ -112,13 +112,14 @@ Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}.
 	What race condition can occur in
 	Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}?
 \QuickQuizAnswer{
+	\begin{lineref}[ln:locking:Per-Element Locking Without Existence Guarantees]
 	Consider the following sequence of events:
 	\begin{enumerate}
-	\item	Thread~0 invokes \co{delete(0)}, and reaches line~10 of
+	\item	Thread~0 invokes \co{delete(0)}, and reaches line~\lnref{acq} of
 		the figure, acquiring the lock.
 	\item	Thread~1 concurrently invokes \co{delete(0)}, reaching
-		line~10, but spins on the lock because Thread~0 holds it.
-	\item	Thread~0 executes lines~11-14, removing the element from
+		line~\lnref{acq}, but spins on the lock because Thread~0 holds it.
+	\item	Thread~0 executes lines~\lnref{NULL}-\lnref{return1}, removing the element from
 		the hashtable, releasing the lock, and then freeing the
 		element.
 	\item	Thread~0 continues execution, and allocates memory, getting
@@ -131,44 +132,44 @@ Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}.
 	\end{enumerate}
 	Because there is no existence guarantee, the identity of the
 	data element can change while a thread is attempting to acquire
-	that element's lock on line~10!
+	that element's lock on line~\lnref{acq}!
+	\end{lineref}
 } \QuickQuizEnd
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 int delete(int key)
-  2 {
-  3   int b;
-  4   struct element *p;
-  5   spinlock_t *sp;
-  6
-  7   b = hashfunction(key);
-  8   sp = &locktable[b];
-  9   spin_lock(sp);
- 10   p = hashtable[b];
- 11   if (p == NULL || p->key != key) {
- 12     spin_unlock(sp);
- 13     return 0;
- 14   }
- 15   hashtable[b] = NULL;
- 16   spin_unlock(sp);
- 17   kfree(p);
- 18   return 1;
- 19 }
-\end{verbbox}
+\begin{linelabel}[ln:locking:Per-Element Locking With Lock-Based Existence Guarantees]
+\begin{VerbatimL}[commandchars=\\\@\$]
+int delete(int key)
+{
+	int b;
+	struct element *p;
+	spinlock_t *sp;
+
+	b = hashfunction(key);
+	sp = &locktable[b];
+	spin_lock(sp);				\lnlbl@acq$
+	p = hashtable[b];			\lnlbl@getp$
+	if (p == NULL || p->key != key) {
+		spin_unlock(sp);
+		return 0;
+	}
+	hashtable[b] = NULL;
+	spin_unlock(sp);
+	kfree(p);
+	return 1;
 }
-\centering
-\theverbbox
+\end{VerbatimL}
+\end{linelabel}
 \caption{Per-Element Locking With Lock-Based Existence Guarantees}
 \label{lst:locking:Per-Element Locking With Lock-Based Existence Guarantees}
 \end{listing}
 
+\begin{lineref}[ln:locking:Per-Element Locking With Lock-Based Existence Guarantees]
 One way to fix this example is to use a hashed set of global locks, so
 that each hash bucket has its own lock, as shown in
 Listing~\ref{lst:locking:Per-Element Locking With Lock-Based Existence Guarantees}.
-This approach allows acquiring the proper lock (on line~9) before
-gaining a pointer to the data element (on line~10).
+This approach allows acquiring the proper lock (on line~\lnref{acq}) before
+gaining a pointer to the data element (on line~\lnref{getp}).
 Although this approach works quite well for elements contained in a
 single partitionable data structure such as the hash table shown in the
 figure, it can be problematic if a given data element can be a member
@@ -180,3 +181,4 @@ implementations~\cite{Shavit95,DaveDice2006DISC}.
 However,
 Chapter~\ref{chp:Deferred Processing}
 describes simpler---and faster---ways of providing existence guarantees.
+\end{lineref}
diff --git a/locking/locking.tex b/locking/locking.tex
index f017eb6..92ed2f2 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -359,35 +359,7 @@ first containing Locks~A and~B, the second containing Lock~C, and
 the third containing Lock~D.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct locked_list {
-  2   spinlock_t s;
-  3   struct list_head h;
-  4 };
-  5 
-  6 struct list_head *list_start(struct locked_list *lp)
-  7 {
-  8   spin_lock(&lp->s);
-  9   return list_next(lp, &lp->h);
- 10 }
- 11 
- 12 struct list_head *list_next(struct locked_list *lp,
- 13                             struct list_head *np)
- 14 {
- 15   struct list_head *ret;
- 16 
- 17   ret = np->next;
- 18   if (ret == &lp->h) {
- 19     spin_unlock(&lp->s);
- 20     ret = NULL;
- 21   }
- 22   return ret;
- 23 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/locking/locked_list@start_next.fcv}
 \caption{Concurrent List Iterator}
 \label{lst:locking:Concurrent List Iterator}
 \end{listing}
@@ -409,42 +381,25 @@ or releases the lock and returns \co{NULL} if the end of the list has
 been reached.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct list_ints {
-  2   struct list_head n;
-  3   int a;
-  4 };
-  5 
-  6 void list_print(struct locked_list *lp)
-  7 {
-  8   struct list_head *np;
-  9   struct list_ints *ip;
- 10 
- 11   np = list_start(lp);
- 12   while (np != NULL) {
- 13     ip = list_entry(np, struct list_ints, n);
- 14     printf("\t%d\n", ip->a);
- 15     np = list_next(lp, np);
- 16   }
- 17 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/locking/locked_list@list_print.fcv}
 \caption{Concurrent List Iterator Usage}
 \label{lst:locking:Concurrent List Iterator Usage}
 \end{listing}
 
+\begin{lineref}[ln:locking:locked_list:list_print:ints]
 Listing~\ref{lst:locking:Concurrent List Iterator Usage} shows how
 this list iterator may be used.
-Lines~1-4 define the \co{list_ints} element containing a single integer,
-and lines~6-17 show how to iterate over the list.
-Line~11 locks the list and fetches a pointer to the first element,
-line~13 provides a pointer to our enclosing \co{list_ints} structure,
-line~14 prints the corresponding integer, and
-line~15 moves to the next element.
+Lines~\lnref{b}-\lnref{e} define the \co{list_ints} element
+containing a single integer,
+\end{lineref}
+\begin{lineref}[ln:locking:locked_list:list_print:print]
+and lines~\lnref{b}-\lnref{e} show how to iterate over the list.
+Line~\lnref{start} locks the list and fetches a pointer to the first element,
+line~\lnref{entry} provides a pointer to our enclosing \co{list_ints} structure,
+line~\lnref{print} prints the corresponding integer, and
+line~\lnref{next} moves to the next element.
 This is quite simple, and hides all of the locking.
+\end{lineref}
 
 That is, the locking remains hidden as long as the code processing each
 list element does not itself acquire a lock that is held across some
@@ -514,19 +469,17 @@ this is unlikely.
 \label{sec:locking:Conditional Locking}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 spin_lock(&lock2);
-  2 layer_2_processing(pkt);
-  3 nextlayer = layer_1(pkt);
-  4 spin_lock(&nextlayer->lock1);
-  5 layer_1_processing(pkt);
-  6 spin_unlock(&lock2);
-  7 spin_unlock(&nextlayer->lock1);
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{linelabel}[ln:locking:Protocol Layering and Deadlock]
+\begin{VerbatimL}[commandchars=\\\{\}]
+spin_lock(&lock2);
+layer_2_processing(pkt);
+nextlayer = layer_1(pkt);
+spin_lock(&nextlayer->lock1);	\lnlbl{acq}
+layer_1_processing(pkt);
+spin_unlock(&lock2);
+spin_unlock(&nextlayer->lock1);
+\end{VerbatimL}
+\end{linelabel}
 \caption{Protocol Layering and Deadlock}
 \label{lst:locking:Protocol Layering and Deadlock}
 \end{listing}
@@ -539,36 +492,36 @@ both layers when passing a packet from one layer to another.
 Given that packets travel both up and down the protocol stack, this
 is an excellent recipe for deadlock, as illustrated in
 Listing~\ref{lst:locking:Protocol Layering and Deadlock}.
+\begin{lineref}[ln:locking:Protocol Layering and Deadlock]
 Here, a packet moving down the stack towards the wire must acquire
 the next layer's lock out of order.
 Given that packets moving up the stack away from the wire are acquiring
-the locks in order, the lock acquisition in line~4 of the listing
+the locks in order, the lock acquisition in line~\lnref{acq} of the listing
 can result in deadlock.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 retry:
-  2   spin_lock(&lock2);
-  3   layer_2_processing(pkt);
-  4   nextlayer = layer_1(pkt);
-  5   if (!spin_trylock(&nextlayer->lock1)) {
-  6     spin_unlock(&lock2);
-  7     spin_lock(&nextlayer->lock1);
-  8     spin_lock(&lock2);
-  9     if (layer_1(pkt) != nextlayer) {
- 10       spin_unlock(&nextlayer->lock1);
- 11       spin_unlock(&lock2);
- 12       goto retry;
- 13     }
- 14   }
- 15   layer_1_processing(pkt);
- 16 spin_unlock(&lock2);
- 17 spin_unlock(&nextlayer->lock1);
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{linelabel}[ln:locking:Avoiding Deadlock Via Conditional Locking]
+\begin{VerbatimL}[commandchars=\\\[\]]
+retry:
+	spin_lock(&lock2);
+	layer_2_processing(pkt);
+	nextlayer = layer_1(pkt);
+	if (!spin_trylock(&nextlayer->lock1)) {	\lnlbl[trylock]
+		spin_unlock(&lock2);		\lnlbl[rel2]
+		spin_lock(&nextlayer->lock1);	\lnlbl[acq1]
+		spin_lock(&lock2);		\lnlbl[acq2]
+		if (layer_1(pkt) != nextlayer) {\lnlbl[recheck]
+			spin_unlock(&nextlayer->lock1);
+			spin_unlock(&lock2);
+			goto retry;
+		}
+	}
+	layer_1_processing(pkt);		\lnlbl[l1_proc]
+	spin_unlock(&lock2);
+	spin_unlock(&nextlayer->lock1);
+\end{VerbatimL}
+\end{linelabel}
 \caption{Avoiding Deadlock Via Conditional Locking}
 \label{lst:locking:Avoiding Deadlock Via Conditional Locking}
 \end{listing}
@@ -577,14 +530,16 @@ One way to avoid deadlocks in this case is to impose a locking hierarchy,
 but when it is necessary to acquire a lock out of order, acquire it
 conditionally, as shown in
 Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}.
-Instead of unconditionally acquiring the layer-1 lock, line~5
+\begin{lineref}[ln:locking:Avoiding Deadlock Via Conditional Locking]
+Instead of unconditionally acquiring the layer-1 lock, line~\lnref{trylock}
 conditionally acquires the lock using the \co{spin_trylock()} primitive.
 This primitive acquires the lock immediately if the lock is available
 (returning non-zero), and otherwise returns zero without acquiring the lock.
 
-If \co{spin_trylock()} was successful, line~15 does the needed
+If \co{spin_trylock()} was successful, line~\lnref{l1_proc} does the needed
 layer-1 processing.
-Otherwise, line~6 releases the lock, and lines~7 and~8 acquire them in
+Otherwise, line~\lnref{rel2} releases the lock, and
+lines~\lnref{acq1} and~\lnref{acq2} acquire them in
 the correct order.
 Unfortunately, there might be multiple networking devices on
 the system (e.g., Ethernet and WiFi), so that the \co{layer_1()}
@@ -592,8 +547,9 @@ function must make a routing decision.
 This decision might change at any time, especially if the system
 is mobile.\footnote{
 	And, in contrast to the 1900s, mobility is the common case.}
-Therefore, line~9 must recheck the decision, and if it has changed,
+Therefore, line~\lnref{recheck} must recheck the decision, and if it has changed,
 must release the locks and start over.
+\end{lineref}
 
 \QuickQuiz{}
 	Can the transformation from
@@ -837,39 +793,37 @@ quite useful in many settings.
 \label{sec:locking:Livelock and Starvation}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 void thread1(void)
-  2 {
-  3 retry:
-  4   spin_lock(&lock1);
-  5   do_one_thing();
-  6   if (!spin_trylock(&lock2)) {
-  7     spin_unlock(&lock1);
-  8     goto retry;
-  9   }
- 10   do_another_thing();
- 11   spin_unlock(&lock2);
- 12   spin_unlock(&lock1);
- 13 }
- 14 
- 15 void thread2(void)
- 16 {
- 17 retry:
- 18   spin_lock(&lock2);
- 19   do_a_third_thing();
- 20   if (!spin_trylock(&lock1)) {
- 21     spin_unlock(&lock2);
- 22     goto retry;
- 23   }
- 24   do_a_fourth_thing();
- 25   spin_unlock(&lock1);
- 26   spin_unlock(&lock2);
- 27 }
-\end{verbbox}
+\begin{linelabel}[ln:locking:Abusing Conditional Locking]
+\begin{VerbatimL}[commandchars=\\\[\]]
+void thread1(void)
+{
+retry:					\lnlbl[thr1:retry]
+	spin_lock(&lock1);		\lnlbl[thr1:acq1]
+	do_one_thing();
+	if (!spin_trylock(&lock2)) {	\lnlbl[thr1:try2]
+		spin_unlock(&lock1);    \lnlbl[thr1:rel1]
+		goto retry;
+	}
+	do_another_thing();
+	spin_unlock(&lock2);
+	spin_unlock(&lock1);
 }
-\centering
-\theverbbox
+
+void thread2(void)
+{
+retry:					\lnlbl[thr2:retry]
+	spin_lock(&lock2);		\lnlbl[thr2:acq2]
+	do_a_third_thing();
+	if (!spin_trylock(&lock1)) {	\lnlbl[thr2:try1]
+		spin_unlock(&lock2);	\lnlbl[thr2:rel2]
+		goto retry;
+	}
+	do_a_fourth_thing();
+	spin_unlock(&lock1);
+	spin_unlock(&lock2);
+}
+\end{VerbatimL}
+\end{linelabel}
 \caption{Abusing Conditional Locking}
 \label{lst:locking:Abusing Conditional Locking}
 \end{listing}
@@ -881,21 +835,23 @@ Listing~\ref{lst:locking:Abusing Conditional Locking}.
 This example's beauty hides an ugly livelock.
 To see this, consider the following sequence of events:
 
+\begin{lineref}[ln:locking:Abusing Conditional Locking]
 \begin{enumerate}
-\item	Thread~1 acquires \co{lock1} on line~4, then invokes
+\item	Thread~1 acquires \co{lock1} on line~\lnref{thr1:acq1}, then invokes
 	\co{do_one_thing()}.
-\item	Thread~2 acquires \co{lock2} on line~18, then invokes
+\item	Thread~2 acquires \co{lock2} on line~\lnref{thr2:acq2}, then invokes
 	\co{do_a_third_thing()}.
-\item	Thread~1 attempts to acquire \co{lock2} on line~6, but fails because
-	Thread~2 holds it.
-\item	Thread~2 attempts to acquire \co{lock1} on line~20, but fails because
-	Thread~1 holds it.
-\item	Thread~1 releases \co{lock1} on line~7, then jumps to \co{retry}
-	at line~3.
-\item	Thread~2 releases \co{lock2} on line~21, and jumps to \co{retry}
-	at line~17.
+\item	Thread~1 attempts to acquire \co{lock2} on line~\lnref{thr1:try2},
+	but fails because Thread~2 holds it.
+\item	Thread~2 attempts to acquire \co{lock1} on line~\lnref{thr2:try1},
+	but fails because Thread~1 holds it.
+\item	Thread~1 releases \co{lock1} on line~\lnref{thr1:rel1},
+	then jumps to \co{retry} at line~\lnref{thr1:retry}.
+\item	Thread~2 releases \co{lock2} on line~\lnref{thr2:rel2},
+	and jumps to \co{retry} at line~\lnref{thr2:retry}.
 \item	The livelock dance repeats from the beginning.
 \end{enumerate}
+\end{lineref}
 
 \QuickQuiz{}
 	How can the livelock shown in
@@ -931,45 +887,43 @@ a group of threads starve, rather than just one of them.\footnote{
 	of what name you choose for it.}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 void thread1(void)
-  2 {
-  3   unsigned int wait = 1;
-  4 retry:
-  5   spin_lock(&lock1);
-  6   do_one_thing();
-  7   if (!spin_trylock(&lock2)) {
-  8     spin_unlock(&lock1);
-  9     sleep(wait);
- 10     wait = wait << 1;
- 11     goto retry;
- 12   }
- 13   do_another_thing();
- 14   spin_unlock(&lock2);
- 15   spin_unlock(&lock1);
- 16 }
- 17 
- 18 void thread2(void)
- 19 {
- 20   unsigned int wait = 1;
- 21 retry:
- 22   spin_lock(&lock2);
- 23   do_a_third_thing();
- 24   if (!spin_trylock(&lock1)) {
- 25     spin_unlock(&lock2);
- 26     sleep(wait);
- 27     wait = wait << 1;
- 28     goto retry;
- 29   }
- 30   do_a_fourth_thing();
- 31   spin_unlock(&lock1);
- 32   spin_unlock(&lock2);
- 33 }
-\end{verbbox}
+\begin{linelabel}[ln:locking:Conditional Locking and Exponential Backoff]
+\begin{VerbatimL}[commandchars=\\\[\]]
+void thread1(void)
+{
+	unsigned int wait = 1;
+retry:
+	spin_lock(&lock1);
+	do_one_thing();
+	if (!spin_trylock(&lock2)) {
+		spin_unlock(&lock1);
+		sleep(wait);
+		wait = wait << 1;
+		goto retry;
+	}
+	do_another_thing();
+	spin_unlock(&lock2);
+	spin_unlock(&lock1);
 }
-\centering
-\theverbbox
+
+void thread2(void)
+{
+	unsigned int wait = 1;
+retry:
+	spin_lock(&lock2);
+	do_a_third_thing();
+	if (!spin_trylock(&lock1)) {
+		spin_unlock(&lock2);
+		sleep(wait);
+		wait = wait << 1;
+		goto retry;
+	}
+	do_a_fourth_thing();
+	spin_unlock(&lock1);
+	spin_unlock(&lock2);
+}
+\end{VerbatimL}
+\end{linelabel}
 \caption{Conditional Locking and Exponential Backoff}
 \label{lst:locking:Conditional Locking and Exponential Backoff}
 \end{listing}
@@ -1500,35 +1454,33 @@ a function named \co{do_force_quiescent_state()} is invoked, but this
 function should be invoked at most once every 100\,milliseconds.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
- 1  void force_quiescent_state(struct rcu_node *rnp_leaf)
- 2  {
- 3    int ret;
- 4    struct rcu_node *rnp = rnp_leaf;
- 5    struct rcu_node *rnp_old = NULL;
- 6
- 7    for (; rnp != NULL; rnp = rnp->parent) {
- 8      ret = (ACCESS_ONCE(gp_flags)) ||
- 9            !raw_spin_trylock(&rnp->fqslock);
-10      if (rnp_old != NULL)
-11        raw_spin_unlock(&rnp_old->fqslock);
-12      if (ret)
-13        return;
-14      rnp_old = rnp;
-15    }
-16    if (!ACCESS_ONCE(gp_flags)) {
-17      ACCESS_ONCE(gp_flags) = 1;
-18      do_force_quiescent_state();
-19      schedule_timeout_interruptible(HZ / 10);
-20      ACCESS_ONCE(gp_flags) = 0;
-21    }
-22    raw_spin_unlock(&rnp_old->fqslock);
-23  }
-\end{verbbox}
+\begin{linelabel}[ln:locking:Conditional Locking to Reduce Contention]
+\begin{VerbatimL}[commandchars=\\\[\]]
+void force_quiescent_state(struct rcu_node *rnp_leaf)
+{
+	int ret;
+	struct rcu_node *rnp = rnp_leaf;
+	struct rcu_node *rnp_old = NULL;
+
+	for (; rnp != NULL; rnp = rnp->parent) {	\lnlbl[loop:b]
+		ret = (ACCESS_ONCE(gp_flags)) ||	\lnlbl[flag_set]
+		       !raw_spin_trylock(&rnp->fqslock);\lnlbl[trylock]
+		if (rnp_old != NULL)			\lnlbl[non_NULL]
+			raw_spin_unlock(&rnp_old->fqslock);\lnlbl[rel1]
+		if (ret)				\lnlbl[giveup]
+			return;				\lnlbl[return]
+		rnp_old = rnp;				\lnlbl[save]
+	}						\lnlbl[loop:e]
+	if (!ACCESS_ONCE(gp_flags)) {			\lnlbl[flag_not_set]
+		ACCESS_ONCE(gp_flags) = 1;		\lnlbl[set_flag]
+		do_force_quiescent_state();		\lnlbl[invoke]
+		schedule_timeout_interruptible(HZ / 10);\lnlbl[wait]
+		ACCESS_ONCE(gp_flags) = 0;		\lnlbl[clr_flag]
+	}
+	raw_spin_unlock(&rnp_old->fqslock);		\lnlbl[rel2]
 }
-\centering
-\theverbbox
+\end{VerbatimL}
+\end{linelabel}
 \caption{Conditional Locking to Reduce Contention}
 \label{lst:locking:Conditional Locking to Reduce Contention}
 \end{listing}
@@ -1545,29 +1497,32 @@ painlessly as possible) give up and leave.
 Furthermore, if \co{do_force_quiescent_state()} has been invoked within
 the past 100\,milliseconds, there is no need to invoke it again.
 
-To this end, each pass through the loop spanning lines~7-15 attempts
+\begin{lineref}[ln:locking:Conditional Locking to Reduce Contention]
+To this end, each pass through the loop spanning lines~\lnref{loop:b}-\lnref{loop:e} attempts
 to advance up one level in the \co{rcu_node} hierarchy.
-If the \co{gp_flags} variable is already set (line~8) or if the attempt
+If the \co{gp_flags} variable is already set (line~\lnref{flag_set}) or if the attempt
 to acquire the current \co{rcu_node} structure's \co{->fqslock} is
-unsuccessful (line~9), then local variable \co{ret} is set to 1.
-If line~10 sees that local variable \co{rnp_old} is non-\co{NULL},
+unsuccessful (line~\lnref{trylock}), then local variable \co{ret} is set to 1.
+If line~\lnref{non_NULL} sees that local variable \co{rnp_old} is non-\co{NULL},
 meaning that we hold \co{rnp_old}'s \co{->fqs_lock},
-line~11 releases this lock (but only after the attempt has been made
+line~\lnref{rel1} releases this lock (but only after the attempt has been made
 to acquire the parent \co{rcu_node} structure's \co{->fqslock}).
-If line~12 sees that either line~8 or~9 saw a reason to give up,
-line~13 returns to the caller.
+If line~\lnref{giveup} sees that either line~\lnref{flag_set} or~\lnref{trylock}
+saw a reason to give up,
+line~\lnref{return} returns to the caller.
 Otherwise, we must have acquired the current \co{rcu_node} structure's
-\co{->fqslock}, so line~14 saves a pointer to this structure in local
+\co{->fqslock}, so line~\lnref{save} saves a pointer to this structure in local
 variable \co{rnp_old} in preparation for the next pass through the loop.
 
-If control reaches line~16, we won the tournament, and now holds the
+If control reaches line~\lnref{flag_not_set}, we won the tournament, and now holds the
 root \co{rcu_node} structure's \co{->fqslock}.
-If line~16 still sees that the global variable \co{gp_flags} is zero,
-line~17 sets \co{gp_flags} to one, line~18 invokes
-\co{do_force_quiescent_state()}, line~19 waits for 100\,milliseconds,
-and line~20 resets \co{gp_flags} back to zero.
-Either way, line~22 releases the root \co{rcu_node} structure's
+If line~\lnref{flag_not_set} still sees that the global variable \co{gp_flags} is zero,
+line~\lnref{set_flag} sets \co{gp_flags} to one, line~\lnref{invoke} invokes
+\co{do_force_quiescent_state()}, line~\lnref{wait} waits for 100\,milliseconds,
+and line~\lnref{clr_flag} resets \co{gp_flags} back to zero.
+Either way, line~\lnref{rel2} releases the root \co{rcu_node} structure's
 \co{->fqslock}.
+\end{lineref}
 
 \QuickQuiz{}
 	The code in
@@ -1584,11 +1539,13 @@ Either way, line~22 releases the root \co{rcu_node} structure's
 } \QuickQuizEnd
 
 \QuickQuiz{}
+	\begin{lineref}[ln:locking:Conditional Locking to Reduce Contention]
 	Wait a minute!
-	If we ``win'' the tournament on line~16 of
+	If we ``win'' the tournament on line~\lnref{flag_not_set} of
 	Listing~\ref{lst:locking:Conditional Locking to Reduce Contention},
 	we get to do all the work of \co{do_force_quiescent_state()}.
 	Exactly how is that a win, really?
+        \end{lineref}
 \QuickQuizAnswer{
 	How indeed?
 	This just shows that in concurrency, just as in life, one
@@ -1617,64 +1574,53 @@ environments.
 \label{sec:locking:Sample Exclusive-Locking Implementation Based on Atomic Exchange}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 typedef int xchglock_t;
-  2 #define DEFINE_XCHG_LOCK(n) xchglock_t n = 0
-  3 
-  4 void xchg_lock(xchglock_t *xp)
-  5 {
-  6   while (xchg(xp, 1) == 1) {
-  7     while (*xp == 1)
-  8       continue;
-  9   }
- 10 }
- 11 
- 12 void xchg_unlock(xchglock_t *xp)
- 13 {
- 14   (void)xchg(xp, 0);
- 15 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/locking/xchglock@lock_unlock.fcv}
 \caption{Sample Lock Based on Atomic Exchange}
 \label{lst:locking:Sample Lock Based on Atomic Exchange}
 \end{listing}
 
+\begin{lineref}[ln:locking:xchglock:lock_unlock]
 This section reviews the implementation shown in
-Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}.
+listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}.
 The data structure for this lock is just an \co{int}, as shown on
-line~1, but could be any integral type.
+line~\lnref{typedef}, but could be any integral type.
 The initial value of this lock is zero, meaning ``unlocked'',
-as shown on line~2.
+as shown on line~\lnref{initval}.
+\end{lineref}
 
 \QuickQuiz{}
+	\begin{lineref}[ln:locking:xchglock:lock_unlock]
 	Why not rely on the C language's default initialization of
 	zero instead of using the explicit initializer shown on
-	line~2 of
+	line~\lnref{initval} of
 	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
+	\end{lineref}
 \QuickQuizAnswer{
 	Because this default initialization does not apply to locks
 	allocated as auto variables within the scope of a function.
 } \QuickQuizEnd
 
+\begin{lineref}[ln:locking:xchglock:lock_unlock:lock]
 Lock acquisition is carried out by the \co{xchg_lock()} function
-shown on lines~4-10.
+shown on lines~\lnref{b}-\lnref{e}.
 This function uses a nested loop, with the outer loop repeatedly
 atomically exchanging the value of the lock with the value one
 (meaning ``locked'').
 If the old value was already the value one (in other words, someone
-else already holds the lock), then the inner loop (lines~7-8)
+else already holds the lock), then the inner loop (lines~\lnref{inner:b}-\lnref{inner:e})
 spins until the lock is available, at which point the outer loop
 makes another attempt to acquire the lock.
+\end{lineref}
 
 \QuickQuiz{}
-	Why bother with the inner loop on lines~7-8 of
+	\begin{lineref}[ln:locking:xchglock:lock_unlock:lock]
+	Why bother with the inner loop on lines~\lnref{inner:b}-\lnref{inner:e} of
 	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
 	Why not simply repeatedly do the atomic exchange operation
-	on line~6?
+	on line~\lnref{atmxchg}?
+	\end{lineref}
 \QuickQuizAnswer{
+	\begin{lineref}[ln:locking:xchglock:lock_unlock:lock]
 	Suppose that the lock is held and that several threads
 	are attempting to acquire the lock.
 	In this situation, if these threads all loop on the atomic
@@ -1682,18 +1628,24 @@ makes another attempt to acquire the lock.
 	containing the lock among themselves, imposing load
 	on the interconnect.
 	In contrast, if these threads are spinning in the inner
-	loop on lines~7-8, they will each spin within their own
+	loop on lines~\lnref{inner:b}-\lnref{inner:e},
+        they will each spin within their own
 	caches, putting negligible load on the interconnect.
+	\end{lineref}
 } \QuickQuizEnd
 
+\begin{lineref}[ln:locking:xchglock:lock_unlock:unlock]
 Lock release is carried out by the \co{xchg_unlock()} function
-shown on lines~12-15.
-Line~14 atomically exchanges the value zero (``unlocked'') into
+shown on lines~\lnref{b}-\lnref{e}.
+Line~\lnref{atmxchg} atomically exchanges the value zero (``unlocked'') into
 the lock, thus marking it as having been released.
+\end{lineref}
 
 \QuickQuiz{}
-	Why not simply store zero into the lock word on line~14 of
+	\begin{lineref}[ln:locking:xchglock:lock_unlock:unlock]
+	Why not simply store zero into the lock word on line~\lnref{atmxchg} of
 	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
+	\end{lineref}
 \QuickQuizAnswer{
 	This can be a legitimate implementation, but only if
 	this store is preceded by a memory barrier and makes use
@@ -1862,15 +1814,10 @@ the token-based mechanism, for example:
 \QuickQuizAnswer{
 	In the C language, the following macro correctly handles this:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\small
-\begin{verbatim}
+\begin{VerbatimU}
 #define ULONG_CMP_LT(a, b) \
         (ULONG_MAX / 2 < (a) - (b))
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 	Although it is tempting to simply subtract two signed integers,
 	this should be avoided because signed overflow is undefined
-- 
2.7.4



