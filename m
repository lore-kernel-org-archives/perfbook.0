Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h18we10iDBpYuExhAl0lhfcQ1HL0gCG7r9MikWvbCg8=;
        b=MTF2je3SeWFkG76NL8Ctv9qMWi1g7S1O08iNMW/fL+wnt2dFdI5wV+l9OpVeJVjagQ
         bBm14XQvi6yAHcAUNRmcYl00tuEBaVwJwKnKOqeM+yFcbYg9zNItbN3jdulo7x4IMEtu
         IPp08Qu6Lsla02/pge1Nl3jNz+kWysSTsI1cci/YsQZ/AhTOEzxCzOBFlBtRynJ7lNpK
         yYGGWKxMaLsyAOpkNhbLmWKiUKhnRGGDKuJz3wazx5S4PNsf5FBfAcDgbuxk3YkXWwp7
         9+6Cm9KjNiIF6VtOYbIJGIitfYmaiIqkg8WgCYuFTIugSgcCf6Hng5e176Wt4K+WFWue
         xpUg==
Subject: [PATCH 6/6] defer: Employ new scheme for snippets of route_rcu.c
References: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3b7f6dbf-6593-f407-da4a-f924c66b0d5e@gmail.com>
Date: Tue, 4 Dec 2018 00:44:06 +0900
MIME-Version: 1.0
In-Reply-To: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 955dcb167cc6d8136c693ad193e0cd711a495150 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 4 Dec 2018 00:17:12 +0900
Subject: [PATCH 6/6] defer: Employ new scheme for snippets of route_rcu.c

Also convert inline snippets in rcuusage.tex.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/route_rcu.c |  75 +++---
 defer/rcuusage.tex            | 523 +++++++++++++++++-------------------------
 2 files changed, 256 insertions(+), 342 deletions(-)

diff --git a/CodeSamples/defer/route_rcu.c b/CodeSamples/defer/route_rcu.c
index 1fd69ea..168eead 100644
--- a/CodeSamples/defer/route_rcu.c
+++ b/CodeSamples/defer/route_rcu.c
@@ -31,48 +31,51 @@
 #include "../api.h"
 
 /* Route-table entry to be included in the routing list. */
+//\begin{snippet}[labelbase=ln:defer:route_rcu:lookup,commandchars=\\\[\]]
 struct route_entry {
-	struct rcu_head rh;
+	struct rcu_head rh;			//\lnlbl{rh}
 	struct cds_list_head re_next;
 	unsigned long addr;
 	unsigned long iface;
-	int re_freed;
+	int re_freed;				//\lnlbl{re_freed}
 };
-
+								//\fcvexclude
 CDS_LIST_HEAD(route_list);
 DEFINE_SPINLOCK(routelock);
 
-static void re_free(struct route_entry *rep)
-{
-	WRITE_ONCE(rep->re_freed, 1);
-	free(rep);
-}
-
-/*
- * Look up a route entry, return the corresponding interface. 
- */
+static void re_free(struct route_entry *rep)			//\fcvexclude
+{								//\fcvexclude
+	WRITE_ONCE(rep->re_freed, 1);				//\fcvexclude
+	free(rep);						//\fcvexclude
+}								//\fcvexclude
+								//\fcvexclude
+/*								  \fcvexclude
+ * Look up a route entry, return the corresponding interface.	  \fcvexclude
+ */								//\fcvexclude
 unsigned long route_lookup(unsigned long addr)
 {
 	struct route_entry *rep;
 	unsigned long ret;
 
-	rcu_read_lock();
+	rcu_read_lock();				//\lnlbl{lock}
 	cds_list_for_each_entry_rcu(rep, &route_list, re_next) {
 		if (rep->addr == addr) {
 			ret = rep->iface;
-			if (READ_ONCE(rep->re_freed))
-				abort();
-			rcu_read_unlock();
+			if (READ_ONCE(rep->re_freed))	//\lnlbl{chk_freed}
+				abort();		//\lnlbl{abort}
+			rcu_read_unlock();		//\lnlbl{unlock1}
 			return ret;
 		}
 	}
-	rcu_read_unlock();
+	rcu_read_unlock();				//\lnlbl{unlock2}
 	return ULONG_MAX;
 }
+//\end{snippet}
 
 /*
  * Add an element to the route table.
  */
+//\begin{snippet}[labelbase=ln:defer:route_rcu:add_del,commandchars=\\\[\]]
 int route_add(unsigned long addr, unsigned long interface)
 {
 	struct route_entry *rep;
@@ -83,38 +86,46 @@ int route_add(unsigned long addr, unsigned long interface)
 	rep->addr = addr;
 	rep->iface = interface;
 	rep->re_freed = 0;
-	spin_lock(&routelock);
-	cds_list_add_rcu(&rep->re_next, &route_list);
-	spin_unlock(&routelock);
+	spin_lock(&routelock);				//\lnlbl{add:lock}
+	cds_list_add_rcu(&rep->re_next, &route_list);	//\lnlbl{add:add_rcu}
+	spin_unlock(&routelock);			//\lnlbl{add:unlock}
 	return 0;
 }
 
-static void route_cb(struct rcu_head *rhp)
+static void route_cb(struct rcu_head *rhp)		//\lnlbl{cb:b}
 {
-	struct route_entry *rep = container_of(rhp, struct route_entry, rh);
+	struct route_entry *rep = container_of(rhp, struct route_entry, rh); //\fcvexclude
+								//\fcvexclude
+	re_free(rep);						//\fcvexclude
+/* --- Alternative code for code snippet: begin ---		  \fcvexclude
+	struct route_entry *rep;
 
-	re_free(rep);
-}
+	rep = container_of(rhp, struct route_entry, rh);
+	WRITE_ONCE(rep->re_freed, 1);
+	free(rep);
+   --- Alternative code for code snippet: end --- */		//\fcvexclude
+}							//\lnlbl{cb:e}
 
-/*
- * Remove the specified element from the route table.
- */
+/*								  \fcvexclude
+ * Remove the specified element from the route table.		  \fcvexclude
+ */								//\fcvexclude
 int route_del(unsigned long addr)
 {
 	struct route_entry *rep;
 
-	spin_lock(&routelock);
+	spin_lock(&routelock);				//\lnlbl{del:lock}
 	cds_list_for_each_entry(rep, &route_list, re_next) {
 		if (rep->addr == addr) {
-			cds_list_del_rcu(&rep->re_next);
-			spin_unlock(&routelock);
-			call_rcu(&rep->rh, route_cb);
+			cds_list_del_rcu(&rep->re_next);//\lnlbl{del:del_rcu}
+			spin_unlock(&routelock);	//\lnlbl{del:unlock1}
+			call_rcu(&rep->rh, route_cb);	//\lnlbl{del:call_rcu}
 			return 0;
 		}
 	}
-	spin_unlock(&routelock);
+	spin_unlock(&routelock);			//\lnlbl{del:unlock2}
 	return -ENOENT;
 }
+//\end{snippet}
 
 /*
  * Clear all elements from the route table.
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index ed0c8be..a6772a4 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -44,95 +44,13 @@ Section~\ref{sec:defer:RCU Usage Summary} provides a summary.
 \label{sec:defer:RCU for Pre-BSD Routing}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
- 1 struct route_entry {
- 2   struct rcu_head rh;
- 3   struct cds_list_head re_next;
- 4   unsigned long addr;
- 5   unsigned long iface;
- 6   int re_freed;
- 7 };
- 8 CDS_LIST_HEAD(route_list);
- 9 DEFINE_SPINLOCK(routelock);
-10
-11 unsigned long route_lookup(unsigned long addr)
-12 {
-13   struct route_entry *rep;
-14   unsigned long ret;
-15
-16   rcu_read_lock();
-17   cds_list_for_each_entry_rcu(rep, &route_list,
-18                               re_next) {
-19     if (rep->addr == addr) {
-20       ret = rep->iface;
-21       if (READ_ONCE(rep->re_freed))
-22         abort();
-23       rcu_read_unlock();
-24       return ret;
-25     }
-26   }
-27   rcu_read_unlock();
-28   return ULONG_MAX;
-29 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/route_rcu@lookup.fcv}
 \caption{RCU Pre-BSD Routing Table Lookup}
 \label{lst:defer:RCU Pre-BSD Routing Table Lookup}
 \end{listing}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
- 1 int route_add(unsigned long addr,
- 2               unsigned long interface)
- 3 {
- 4   struct route_entry *rep;
- 5
- 6   rep = malloc(sizeof(*rep));
- 7   if (!rep)
- 8     return -ENOMEM;
- 9   rep->addr = addr;
-10   rep->iface = interface;
-11   rep->re_freed = 0;
-12   spin_lock(&routelock);
-13   cds_list_add_rcu(&rep->re_next, &route_list);
-14   spin_unlock(&routelock);
-15   return 0;
-16 }
-17
-18 static void route_cb(struct rcu_head *rhp)
-19 {
-20   struct route_entry *rep;
-21
-22   rep = container_of(rhp, struct route_entry, rh);
-23   WRITE_ONCE(rep->re_freed, 1);
-24   free(rep);
-25 }
-26
-27 int route_del(unsigned long addr)
-28 {
-29   struct route_entry *rep;
-30
-31   spin_lock(&routelock);
-32   cds_list_for_each_entry(rep, &route_list,
-33                           re_next) {
-34     if (rep->addr == addr) {
-35       cds_list_del_rcu(&rep->re_next);
-36       spin_unlock(&routelock);
-37       call_rcu(&rep->rh, route_cb);
-38       return 0;
-39     }
-40   }
-41   spin_unlock(&routelock);
-42   return -ENOENT;
-43 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/route_rcu@add_del.fcv}
 \caption{RCU Pre-BSD Routing Table Add/Delete}
 \label{lst:defer:RCU Pre-BSD Routing Table Add/Delete}
 \end{listing}
@@ -144,17 +62,24 @@ show code for an RCU-protected Pre-BSD routing table
 The former shows data structures and \co{route_lookup()},
 and the latter shows \co{route_add()} and \co{route_del()}.
 
+\begin{lineref}[ln:defer:route_rcu:lookup]
 In Listing~\ref{lst:defer:RCU Pre-BSD Routing Table Lookup},
-line~2 adds the \co{->rh} field used by RCU reclamation,
-line~6 adds the \co{->re_freed} use-after-free-check field,
-lines~16, 17, 23, and~27 add RCU read-side protection,
-and lines~21 and~22 add the use-after-free check.
+line~\lnref{rh} adds the \co{->rh} field used by RCU reclamation,
+line~\lnref{re_freed} adds the \co{->re_freed} use-after-free-check field,
+lines~\lnref{lock}, \lnref{unlock1}, and~\lnref{unlock2}
+add RCU read-side protection,
+and lines~\lnref{chk_freed} and~\lnref{abort} add the use-after-free check.
+\end{lineref}
+\begin{lineref}[ln:defer:route_rcu:add_del]
 In Listing~\ref{lst:defer:RCU Pre-BSD Routing Table Add/Delete},
-lines~12, 14, 31, 36, and~41 add update-side locking,
-lines~13 and~35 add RCU update-side protection,
-line~37 causes \co{route_cb()} to be invoked after a grace period elapses,
-and lines~18-25 define \co{route_cb()}.
+lines~\lnref{add:lock}, \lnref{add:unlock}, \lnref{del:lock},
+\lnref{del:unlock1}, and~\lnref{del:unlock2} add update-side locking,
+lines~\lnref{add:add_rcu} and~\lnref{del:del_rcu} add RCU update-side protection,
+line~\lnref{del:call_rcu} causes \co{route_cb()} to be invoked after
+a grace period elapses,
+and lines~\lnref{cb:b}-\lnref{cb:e} define \co{route_cb()}.
 This is minimal added code for a working concurrent implementation.
+\end{lineref}
 
 \begin{figure}[tb]
 \centering
@@ -279,42 +204,27 @@ Figure~\ref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking}.
 	First, consider that the inner loop used to
 	take this measurement is as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 for (i = 0; i < CSCOUNT_SCALE; i++) {
-  2   rcu_read_lock();
-  3   rcu_read_unlock();
-  4 }
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+for (i = 0; i < CSCOUNT_SCALE; i++) {
+	rcu_read_lock();
+	rcu_read_unlock();
+}
+\end{VerbatimN}
 
 	Next, consider the effective definitions of \co{rcu_read_lock()}
 	and \co{rcu_read_unlock()}:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 #define rcu_read_lock()   do { } while (0)
-  2 #define rcu_read_unlock() do { } while (0)
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+#define rcu_read_lock()   do { } while (0)
+#define rcu_read_unlock() do { } while (0)
+\end{VerbatimN}
 
 	Consider also that the compiler does simple optimizations,
 	allowing it to replace the loop with:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
+\begin{VerbatimN}
 i = CSCOUNT_SCALE;
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimN}
 
 	So the ``measurement'' of 100 femtoseconds is simply the fixed
 	overhead of the timing measurements divided by the number of
@@ -407,16 +317,11 @@ cycle.
 	RCU read-side primitives is via the following (illegal) sequence
 	of statements:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\small
-\begin{verbatim}
+\begin{VerbatimU}
 rcu_read_lock();
 synchronize_rcu();
 rcu_read_unlock();
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 	The \co{synchronize_rcu()} cannot return until all
 	pre-existing RCU read-side critical sections complete, but
@@ -445,23 +350,18 @@ Attempting to do such an upgrade with reader-writer locking results
 in deadlock.
 A sample code fragment that does an RCU read-to-update upgrade follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 rcu_read_lock();
-  2 list_for_each_entry_rcu(p, &head, list_field) {
-  3   do_something_with(p);
-  4   if (need_update(p)) {
-  5     spin_lock(my_lock);
-  6     do_update(p);
-  7     spin_unlock(&my_lock);
-  8   }
-  9 }
- 10 rcu_read_unlock();
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+rcu_read_lock();
+list_for_each_entry_rcu(p, &head, list_field) {
+	do_something_with(p);
+	if (need_update(p)) {
+		spin_lock(my_lock);
+		do_update(p);
+		spin_unlock(&my_lock);
+	}
+}
+rcu_read_unlock();
+\end{VerbatimN}
 
 Note that \co{do_update()} is executed under
 the protection of the lock \emph{and} under RCU read-side protection.
@@ -691,17 +591,12 @@ the RCU read-side primitives may be used as a restricted
 reference-counting mechanism.
 For example, consider the following code fragment:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 rcu_read_lock();  /* acquire reference. */
-  2 p = rcu_dereference(head);
-  3 /* do something with p. */
-  4 rcu_read_unlock();  /* release reference. */
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+rcu_read_lock();  /* acquire reference. */
+p = rcu_dereference(head);
+/* do something with p. */
+rcu_read_unlock();  /* release reference. */
+\end{VerbatimN}
 
 The \co{rcu_read_lock()} primitive can be thought of as
 acquiring a reference to \co{p}, because a grace period
@@ -716,20 +611,15 @@ from one task to another.
 Regardless of these restrictions,
 the following code can safely delete \co{p}:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 spin_lock(&mylock);
-  2 p = head;
-  3 rcu_assign_pointer(head, NULL);
-  4 spin_unlock(&mylock);
-  5 /* Wait for all references to be released. */
-  6 synchronize_rcu();
-  7 kfree(p);
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+spin_lock(&mylock);
+p = head;
+rcu_assign_pointer(head, NULL);
+spin_unlock(&mylock);
+/* Wait for all references to be released. */
+synchronize_rcu();
+kfree(p);
+\end{VerbatimN}
 
 The assignment to \co{head} prevents any future references
 to \co{p} from being acquired, and the \co{synchronize_rcu()}
@@ -877,55 +767,57 @@ guaranteed to remain in existence for the duration of that RCU
 read-side critical section.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 int delete(int key)
-  2 {
-  3   struct element *p;
-  4   int b;
-  5 
-  6   b = hashfunction(key);
-  7   rcu_read_lock();
-  8   p = rcu_dereference(hashtable[b]);
-  9   if (p == NULL || p->key != key) {
- 10     rcu_read_unlock();
- 11     return 0;
- 12   }
- 13   spin_lock(&p->lock);
- 14   if (hashtable[b] == p && p->key == key) {
- 15     rcu_read_unlock();
- 16     rcu_assign_pointer(hashtable[b], NULL);
- 17     spin_unlock(&p->lock);
- 18     synchronize_rcu();
- 19     kfree(p);
- 20     return 1;
- 21   }
- 22   spin_unlock(&p->lock);
- 23   rcu_read_unlock();
- 24   return 0;
- 25 }
-\end{verbbox}
+\begin{linelabel}[ln:defer:Existence Guarantees Enable Per-Element Locking]
+\begin{VerbatimL}[commandchars=\\\@\$]
+int delete(int key)
+{
+	struct element *p;
+	int b;
+
+	b = hashfunction(key);			\lnlbl@hash$
+	rcu_read_lock();			\lnlbl@rdlock$
+	p = rcu_dereference(hashtable[b]);
+	if (p == NULL || p->key != key) {	\lnlbl@chkkey$
+		rcu_read_unlock();		\lnlbl@rdunlock1$
+		return 0;			\lnlbl@ret_0:a$
+	}
+	spin_lock(&p->lock);			\lnlbl@acq$
+	if (hashtable[b] == p && p->key == key) {\lnlbl@chkkey2$
+		rcu_read_unlock();		\lnlbl@rdunlock2$
+		rcu_assign_pointer(hashtable[b], NULL);\lnlbl@remove$
+		spin_unlock(&p->lock);		\lnlbl@rel1$
+		synchronize_rcu();		\lnlbl@sync_rcu$
+		kfree(p);			\lnlbl@kfree$
+		return 1;			\lnlbl@ret_1$
+	}
+	spin_unlock(&p->lock);			\lnlbl@rel2$
+	rcu_read_unlock();			\lnlbl@rdunlock3$
+	return 0;				\lnlbl@ret_0:b$
 }
-\centering
-\theverbbox
+\end{VerbatimL}
+\end{linelabel}
 \caption{Existence Guarantees Enable Per-Element Locking}
 \label{lst:defer:Existence Guarantees Enable Per-Element Locking}
 \end{listing}
 
+\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
 demonstrates how RCU-based existence guarantees can enable
 per-element locking via a function that deletes an element from
 a hash table.
-Line~6 computes a hash function, and line~7 enters an RCU
+Line~\lnref{hash} computes a hash function, and line~\lnref{rdlock} enters an RCU
 read-side critical section.
-If line~9 finds that the corresponding bucket of the hash table is
+If line~\lnref{chkkey} finds that the corresponding bucket of the hash table is
 empty or that the element present is not the one we wish to delete,
-then line~10 exits the RCU read-side critical section and line~11
+then line~\lnref{rdunlock1} exits the RCU read-side critical section and
+line~\lnref{ret_0:a}
 indicates failure.
+\end{lineref}
 
 \QuickQuiz{}
 	What if the element we need to delete is not the first element
-	of the list on line~9 of
+	of the list on
+        line~\ref{ln:defer:Existence Guarantees Enable Per-Element Locking:chkkey} of
 	Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}?
 \QuickQuizAnswer{
 	As with
@@ -936,24 +828,29 @@ indicates failure.
 	full chaining.
 } \QuickQuizEnd
 
-Otherwise, line~13 acquires the update-side spinlock, and
-line~14 then checks that the element is still the one that we want.
-If so, line~15 leaves the RCU read-side critical section,
-line~16 removes it from the table, line~17 releases
-the lock, line~18 waits for all pre-existing RCU read-side critical
-sections to complete, line~19 frees the newly removed element,
-and line~20 indicates success.
-If the element is no longer the one we want, line~22 releases
-the lock, line~23 leaves the RCU read-side critical section,
-and line~24 indicates failure to delete the specified key.
+\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
+Otherwise, line~\lnref{acq} acquires the update-side spinlock, and
+line~\lnref{chkkey2} then checks that the element is still the one that we want.
+If so, line~\lnref{rdunlock2} leaves the RCU read-side critical section,
+line~\lnref{remove} removes it from the table, line~\lnref{rel1} releases
+the lock, line~\lnref{sync_rcu} waits for all pre-existing RCU read-side critical
+sections to complete, line~\lnref{kfree} frees the newly removed element,
+and line~\lnref{ret_1} indicates success.
+If the element is no longer the one we want, line~\lnref{rel2} releases
+the lock, line~\lnref{rdunlock3} leaves the RCU read-side critical section,
+and line~\lnref{ret_0:b} indicates failure to delete the specified key.
+\end{lineref}
 
 \QuickQuiz{}
+	\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	Why is it OK to exit the RCU read-side critical section on
-	line~15 of
+	line~\lnref{rdunlock2} of
 	Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
-	before releasing the lock on line~17?
+	before releasing the lock on line~\lnref{rel1}?
+	\end{lineref}
 \QuickQuizAnswer{
-	First, please note that the second check on line~14 is
+	\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
+	First, please note that the second check on line~\lnref{chkkey2} is
 	necessary because some other
 	CPU might have removed this element while we were waiting
 	to acquire the lock.
@@ -970,42 +867,48 @@ and line~24 indicates failure to delete the specified key.
 	% A re-check is necessary if the key can mutate or if it is
 	% necessary to reject deleted entries (in cases where deletion
 	% is recorded by mutating the key.
+	\end{lineref}
 } \QuickQuizEnd
 
 \QuickQuiz{}
+	\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	Why not exit the RCU read-side critical section on
-	line~23 of
+	line~\lnref{rdunlock3} of
 	Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
-	before releasing the lock on line~22?
+	before releasing the lock on line~\lnref{rel2}?
+	\end{lineref}
 \QuickQuizAnswer{
+	\begin{lineref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	Suppose we reverse the order of these two lines.
 	Then this code is vulnerable to the following sequence of
 	events:
 	\begin{enumerate}
 	\item	CPU~0 invokes \co{delete()}, and finds the element
-		to be deleted, executing through line~15.
+		to be deleted, executing through line~\lnref{rdunlock2}.
 		It has not yet actually deleted the element, but
 		is about to do so.
 	\item	CPU~1 concurrently invokes \co{delete()}, attempting
 		to delete this same element.
 		However, CPU~0 still holds the lock, so CPU~1 waits
-		for it at line~13.
-	\item	CPU~0 executes lines~16 and 17, and blocks at
-		line~18 waiting for CPU~1 to exit its RCU read-side
-		critical section.
-	\item	CPU~1 now acquires the lock, but the test on line~14
+		for it at line~\lnref{acq}.
+	\item	CPU~0 executes lines~\lnref{remove} and~\lnref{rel1},
+		and blocks at line~\lnref{sync_rcu} waiting for CPU~1
+		to exit its RCU read-side critical section.
+	\item	CPU~1 now acquires the lock, but the test on line~\lnref{chkkey2}
 		fails because CPU~0 has already removed the element.
-		CPU~1 now executes line~22 (which we switched with line~23
+		CPU~1 now executes line~\lnref{rel2}
+                (which we switched with line~\lnref{rdunlock3}
 		for the purposes of this Quick Quiz)
 		and exits its RCU read-side critical section.
 	\item	CPU~0 can now return from \co{synchronize_rcu()},
-		and thus executes line~19, sending the element to
+		and thus executes line~\lnref{kfree}, sending the element to
 		the freelist.
 	\item	CPU~1 now attempts to release a lock for an element
 		that has been freed, and, worse yet, possibly
 		reallocated as some other type of data structure.
 		This is a fatal memory-corruption error.
 	\end{enumerate}
+	\end{lineref}
 } \QuickQuizEnd
 
 Alert readers will recognize this as only a slight variation on
@@ -1127,84 +1030,88 @@ A simplified version of this code is shown
 Listing~\ref{lst:defer:Using RCU to Wait for NMIs to Finish}.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct profile_buffer {
-  2   long size;
-  3   atomic_t entry[0];
-  4 };
-  5 static struct profile_buffer *buf = NULL;
-  6
-  7 void nmi_profile(unsigned long pcvalue)
-  8 {
-  9   struct profile_buffer *p = rcu_dereference(buf);
- 10
- 11   if (p == NULL)
- 12     return;
- 13   if (pcvalue >= p->size)
- 14     return;
- 15   atomic_inc(&p->entry[pcvalue]);
- 16 }
- 17
- 18 void nmi_stop(void)
- 19 {
- 20   struct profile_buffer *p = buf;
- 21
- 22   if (p == NULL)
- 23     return;
- 24   rcu_assign_pointer(buf, NULL);
- 25   synchronize_sched();
- 26   kfree(p);
- 27 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{linelabel}[ln:defer:Using RCU to Wait for NMIs to Finish]
+\begin{VerbatimL}[commandchars=\\\@\$]
+struct profile_buffer {				\lnlbl@struct:b$
+	long size;
+	atomic_t entry[0];
+};						\lnlbl@struct:e$
+static struct profile_buffer *buf = NULL;	\lnlbl@struct:buf$
+
+void nmi_profile(unsigned long pcvalue)		\lnlbl@nmi_profile:b$
+{
+	struct profile_buffer *p = rcu_dereference(buf);\lnlbl@nmi_profile:rcu_deref$
+
+	if (p == NULL)				\lnlbl@nmi_profile:if_NULL$
+		return;				\lnlbl@nmi_profile:ret:a$
+	if (pcvalue >= p->size)			\lnlbl@nmi_profile:if_oor$
+		return;				\lnlbl@nmi_profile:ret:b$
+	atomic_inc(&p->entry[pcvalue]);		\lnlbl@nmi_profile:inc$
+}						\lnlbl@nmi_profile:e$
+
+void nmi_stop(void)				\lnlbl@nmi_stop:b$
+{
+	struct profile_buffer *p = buf;		\lnlbl@nmi_stop:fetch$
+
+	if (p == NULL)				\lnlbl@nmi_stop:if_NULL$
+		return;				\lnlbl@nmi_stop:ret$
+	rcu_assign_pointer(buf, NULL);		\lnlbl@nmi_stop:NULL$
+	synchronize_sched();			\lnlbl@nmi_stop:sync_sched$
+	kfree(p);				\lnlbl@nmi_stop:kfree$
+}						\lnlbl@nmi_stop:e$
+\end{VerbatimL}
+\end{linelabel}
 \caption{Using RCU to Wait for NMIs to Finish}
 \label{lst:defer:Using RCU to Wait for NMIs to Finish}
 \end{listing}
 
-Lines~1-4 define a \co{profile_buffer} structure, containing a
+\begin{lineref}[ln:defer:Using RCU to Wait for NMIs to Finish:struct]
+Lines~\lnref{b}-\lnref{e} define a \co{profile_buffer} structure, containing a
 size and an indefinite array of entries.
-Line~5 defines a pointer to a profile buffer, which is
+Line~\lnref{buf} defines a pointer to a profile buffer, which is
 presumably initialized elsewhere to point to a dynamically allocated
 region of memory.
+\end{lineref}
 
-Lines~7-16 define the \co{nmi_profile()} function,
+\begin{lineref}[ln:defer:Using RCU to Wait for NMIs to Finish:nmi_profile]
+Lines~\lnref{b}-\lnref{e} define the \co{nmi_profile()} function,
 which is called from within an NMI handler.
 As such, it cannot be preempted, nor can it be interrupted by a normal
 interrupts handler, however, it is still subject to delays due to cache misses,
 ECC errors, and cycle stealing by other hardware threads within the same
 core.
-Line~9 gets a local pointer to the profile buffer using the
+Line~\lnref{rcu_deref} gets a local pointer to the profile buffer using the
 \co{rcu_dereference()} primitive to ensure memory ordering on
 DEC Alpha, and
-lines~11 and~12 exit from this function if there is no
-profile buffer currently allocated, while lines~13 and~14
+lines~\lnref{if_NULL} and~\lnref{ret:a} exit from this function if there is no
+profile buffer currently allocated, while lines~\lnref{if_oor} and~\lnref{ret:b}
 exit from this function if the \co{pcvalue} argument
 is out of range.
-Otherwise, line~15 increments the profile-buffer entry indexed
+Otherwise, line~\lnref{inc} increments the profile-buffer entry indexed
 by the \co{pcvalue} argument.
 Note that storing the size with the buffer guarantees that the
 range check matches the buffer, even if a large buffer is suddenly
 replaced by a smaller one.
+\end{lineref}
 
-Lines~18-27 define the \co{nmi_stop()} function,
+\begin{lineref}[ln:defer:Using RCU to Wait for NMIs to Finish:nmi_stop]
+Lines~\lnref{b}-\lnref{e} define the \co{nmi_stop()} function,
 where the caller is responsible for mutual exclusion (for example,
 holding the correct lock).
-Line~20 fetches a pointer to the profile buffer, and
-lines~22 and~23 exit the function if there is no buffer.
-Otherwise, line~24 \co{NULL}s out the profile-buffer pointer
+Line~\lnref{fetch} fetches a pointer to the profile buffer, and
+lines~\lnref{if_NULL} and~\lnref{ret} exit the function if there is no buffer.
+Otherwise, line~\lnref{NULL} \co{NULL}s out the profile-buffer pointer
 (using the \co{rcu_assign_pointer()} primitive to maintain
 memory ordering on weakly ordered machines),
-and line~25 waits for an RCU Sched grace period to elapse,
+and line~\lnref{sync_sched} waits for an RCU Sched grace period to elapse,
 in particular, waiting for all non-preemptible regions of code,
 including NMI handlers, to complete.
-Once execution continues at line~26, we are guaranteed that
+Once execution continues at line~\lnref{kfree}, we are guaranteed that
 any instance of \co{nmi_profile()} that obtained a
 pointer to the old buffer has returned.
 It is therefore safe to free the buffer, in this case using the
 \co{kfree()} primitive.
+\end{lineref}
 
 \QuickQuiz{}
 	Suppose that the \co{nmi_profile()} function was preemptible.
@@ -1218,46 +1125,42 @@ It is therefore safe to free the buffer, in this case using the
 	Listing~\ref{lst:defer:Using RCU to Wait for Mythical Preemptible NMIs to Finish}.
 %
 \begin{listing}[tb]
-{\scriptsize
-\begin{verbbox}
-  1 struct profile_buffer {
-  2   long size;
-  3   atomic_t entry[0];
-  4 };
-  5 static struct profile_buffer *buf = NULL;
-  6
-  7 void nmi_profile(unsigned long pcvalue)
-  8 {
-  9   struct profile_buffer *p;
- 10
- 11   rcu_read_lock();
- 12   p = rcu_dereference(buf);
- 13   if (p == NULL) {
- 14     rcu_read_unlock();
- 15     return;
- 16   }
- 17   if (pcvalue >= p->size) {
- 18     rcu_read_unlock();
- 19     return;
- 20   }
- 21   atomic_inc(&p->entry[pcvalue]);
- 22   rcu_read_unlock();
- 23 }
- 24
- 25 void nmi_stop(void)
- 26 {
- 27   struct profile_buffer *p = buf;
- 28
- 29   if (p == NULL)
- 30     return;
- 31   rcu_assign_pointer(buf, NULL);
- 32   synchronize_rcu();
- 33   kfree(p);
- 34 }
-\end{verbbox}
+\begin{VerbatimL}
+struct profile_buffer {
+	long size;
+	atomic_t entry[0];
+};
+static struct profile_buffer *buf = NULL;
+
+void nmi_profile(unsigned long pcvalue)
+{
+	struct profile_buffer *p;
+
+	rcu_read_lock();
+	p = rcu_dereference(buf);
+	if (p == NULL) {
+		rcu_read_unlock();
+		return;
+	}
+	if (pcvalue >= p->size) {
+		rcu_read_unlock();
+		return;
+	}
+	atomic_inc(&p->entry[pcvalue]);
+	rcu_read_unlock();
 }
-\centering
-\theverbbox
+
+void nmi_stop(void)
+{
+	struct profile_buffer *p = buf;
+
+	if (p == NULL)
+		return;
+	rcu_assign_pointer(buf, NULL);
+	synchronize_rcu();
+	kfree(p);
+}
+\end{VerbatimL}
 \caption{Using RCU to Wait for Mythical Preemptible NMIs to Finish}
 \label{lst:defer:Using RCU to Wait for Mythical Preemptible NMIs to Finish}
 \end{listing}
-- 
2.7.4


