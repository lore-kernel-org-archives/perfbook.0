Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b8aMCQQKwE7PcITxHPjE4YpgJ9ZXnAcI00MKGCx5zNM=;
        b=sSio5/De60k19e/Wbk7IUjhH6oO5XtVVOJ3dgp90c+C8oJeL2uPuhKjBdZCnnpN7DZ
         4v8TQeIuN3QX6O/HW+e+z8mKmZ2NJ/fdYuX7GKN1nBrnVNQVbazRswNUPCA9H95vHop8
         hqAuHoCTUP6F8pmq7D4r/5PoMqEGdq/18+n84bPhacgOHWF7SHcbOyuzwcDZx4YMyCgK
         Wd8uU1SitA+YxAxecTPo2LwkmcOkYZ/sNxIQ5JIo5GPCw3eZzrqSwXB9P1ozVfUA2WcY
         1lHQOInD3r5Pd6p6ZokgQ3bqPxwYeK6cwI7e1VNmd2AjCop9nWCcjBgKcBFcxoGvV35U
         apgw==
Subject: [PATCH 5/6] defer: Employ new scheme for snippets in rcuintro and
 rcufundamental
References: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <512348b9-e78b-2ac9-d831-23f572a34a6a@gmail.com>
Date: Tue, 4 Dec 2018 00:42:24 +0900
MIME-Version: 1.0
In-Reply-To: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7bd805e63060278c9222b39c8c238227835f04a4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 4 Dec 2018 00:16:42 +0900
Subject: [PATCH 5/6] defer: Employ new scheme for snippets in rcuintro and rcufundamental

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcufundamental.tex | 381 ++++++++++++++++++++++-------------------------
 defer/rcuintro.tex       |  13 +-
 2 files changed, 179 insertions(+), 215 deletions(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 2660e7d..3a5fad2 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -69,26 +69,22 @@ summarizes RCU fundamentals.
 \label{sec:defer:Publish-Subscribe Mechanism}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct foo {
-  2   int a;
-  3   int b;
-  4   int c;
-  5 };
-  6 struct foo *gp = NULL;
-  7
-  8 /* . . . */
-  9
- 10 p = kmalloc(sizeof(*p), GFP_KERNEL);
- 11 p->a = 1;
- 12 p->b = 2;
- 13 p->c = 3;
- 14 gp = p;
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{VerbatimL}
+struct foo {
+	int a;
+	int b;
+	int c;
+};
+struct foo *gp = NULL;
+
+/* . . . */
+
+p = kmalloc(sizeof(*p), GFP_KERNEL);
+p->a = 1;
+p->b = 2;
+p->c = 3;
+gp = p;
+\end{VerbatimL}
 \caption{Data Structure Publication (Unsafe)}
 \label{lst:defer:Data Structure Publication (Unsafe)}
 \end{listing}
@@ -116,17 +112,12 @@ We therefore encapsulate them into a primitive
 \co{rcu_assign_pointer()} that has publication semantics.
 The last four lines would then be as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 p->a = 1;
-  2 p->b = 2;
-  3 p->c = 3;
-  4 rcu_assign_pointer(gp, p);
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+p->a = 1;
+p->b = 2;
+p->c = 3;
+rcu_assign_pointer(gp, p);
+\end{VerbatimN}
 
 The \co{rcu_assign_pointer()}
 would \emph{publish} the new structure, forcing both the compiler
@@ -137,17 +128,12 @@ However, it is not sufficient to only enforce ordering at the
 updater, as the reader must enforce proper ordering as well.
 Consider for example the following code fragment:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 p = gp;
-  2 if (p != NULL) {
-  3   do_something_with(p->a, p->b, p->c);
-  4 }
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+p = gp;
+if (p != NULL) {
+	do_something_with(p->a, p->b, p->c);
+}
+\end{VerbatimN}
 
 Although this code fragment might well seem immune to misordering,
 unfortunately, the
@@ -177,19 +163,14 @@ directives are required for this purpose:\footnote{
 	\co{memory_order_acquire}, thus emitting a needless memory-barrier
 	instruction on weakly ordered systems.)}
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 rcu_read_lock();
-  2 p = rcu_dereference(gp);
-  3 if (p != NULL) {
-  4   do_something_with(p->a, p->b, p->c);
-  5 }
-  6 rcu_read_unlock();
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+rcu_read_lock();
+p = rcu_dereference(gp);
+if (p != NULL) {
+	do_something_with(p->a, p->b, p->c);
+}
+rcu_read_unlock();
+\end{VerbatimN}
 
 The \co{rcu_dereference()} primitive can thus be thought of
 as \emph{subscribing} to a given value of the specified pointer,
@@ -240,27 +221,25 @@ Figure~\ref{fig:defer:Linux Linked List Abbreviated},
 which shows only the non-header (blue) elements.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct foo {
-  2   struct list_head *list;
-  3   int a;
-  4   int b;
-  5   int c;
-  6 };
-  7 LIST_HEAD(head);
-  8
-  9 /* . . . */
- 10
- 11 p = kmalloc(sizeof(*p), GFP_KERNEL);
- 12 p->a = 1;
- 13 p->b = 2;
- 14 p->c = 3;
- 15 list_add_rcu(&p->list, &head);
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{linelabel}[ln:defer:RCU Data Structure Publication]
+\begin{VerbatimL}[commandchars=\\\[\]]
+struct foo {
+	struct list_head *list;
+	int a;
+	int b;
+	int c;
+};
+LIST_HEAD(head);
+
+/* . . . */
+
+p = kmalloc(sizeof(*p), GFP_KERNEL);
+p->a = 1;
+p->b = 2;
+p->c = 3;
+list_add_rcu(&p->list, &head);		\lnlbl[add_rcu]
+\end{VerbatimL}
+\end{linelabel}
 \caption{RCU Data Structure Publication}
 \label{lst:defer:RCU Data Structure Publication}
 \end{listing}
@@ -269,7 +248,8 @@ Adapting the pointer-publish example for the linked list results in
 the code shown in
 Listing~\ref{lst:defer:RCU Data Structure Publication}.
 
-Line~15 must be protected by some synchronization mechanism (most
+Line~\ref{ln:defer:RCU Data Structure Publication:add_rcu}
+must be protected by some synchronization mechanism (most
 commonly some sort of lock) to prevent multiple \co{list_add_rcu()}
 instances from executing concurrently.
 However, such synchronization does not prevent this \co{list_add()}
@@ -277,18 +257,13 @@ instance from executing concurrently with RCU readers.
 
 Subscribing to an RCU-protected list is straightforward:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 rcu_read_lock();
-  2 list_for_each_entry_rcu(p, head, list) {
-  3   do_something_with(p->a, p->b, p->c);
-  4 }
-  5 rcu_read_unlock();
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+rcu_read_lock();
+list_for_each_entry_rcu(p, head, list) {
+	do_something_with(p->a, p->b, p->c);
+}
+rcu_read_unlock();
+\end{VerbatimN}
 
 The \co{list_add_rcu()} primitive publishes an entry, inserting it at
 the head of the specified list, guaranteeing that the corresponding
@@ -331,27 +306,25 @@ in the same way lists are, as shown in
 Figure~\ref{fig:defer:Linux Linked List Abbreviated}.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct foo {
-  2   struct hlist_node *list;
-  3   int a;
-  4   int b;
-  5   int c;
-  6 };
-  7 HLIST_HEAD(head);
-  8
-  9 /* . . . */
- 10
- 11 p = kmalloc(sizeof(*p), GFP_KERNEL);
- 12 p->a = 1;
- 13 p->b = 2;
- 14 p->c = 3;
- 15 hlist_add_head_rcu(&p->list, &head);
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{linelabel}[ln:defer:RCU hlist Publication]
+\begin{VerbatimL}[commandchars=\\\[\]]
+struct foo {
+	struct hlist_node *list;
+	int a;
+	int b;
+	int c;
+};
+HLIST_HEAD(head);
+
+/* . . . */
+
+p = kmalloc(sizeof(*p), GFP_KERNEL);
+p->a = 1;
+p->b = 2;
+p->c = 3;
+hlist_add_head_rcu(&p->list, &head);	\lnlbl[add_head]
+\end{VerbatimL}
+\end{linelabel}
 \caption{RCU {\tt hlist} Publication}
 \label{lst:defer:RCU hlist Publication}
 \end{listing}
@@ -360,24 +333,20 @@ Publishing a new element to an RCU-protected hlist is quite similar
 to doing so for the circular list,
 as shown in Listing~\ref{lst:defer:RCU hlist Publication}.
 
-As before, line~15 must be protected by some sort of synchronization
+As before, line~\ref{ln:defer:RCU hlist Publication:add_head}
+must be protected by some sort of synchronization
 mechanism, for example, a lock.
 
 Subscribing to an RCU-protected hlist is also similar to the
 circular list:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 rcu_read_lock();
-  2 hlist_for_each_entry_rcu(p, head, list) {
-  3   do_something_with(p->a, p->b, p->c);
-  4 }
-  5 rcu_read_unlock();
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+rcu_read_lock();
+hlist_for_each_entry_rcu(p, head, list) {
+	do_something_with(p->a, p->b, p->c);
+}
+rcu_read_unlock();
+\end{VerbatimN}
 
 \begin{table*}[tb]
 \renewcommand*{\arraystretch}{1.2}
@@ -488,33 +457,31 @@ RCU to wait for readers:
 \end{enumerate}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct foo {
-  2   struct list_head *list;
-  3   int a;
-  4   int b;
-  5   int c;
-  6 };
-  7 LIST_HEAD(head);
-  8
-  9 /* . . . */
- 10
- 11 p = search(head, key);
- 12 if (p == NULL) {
- 13   /* Take appropriate action, unlock, & return. */
- 14 }
- 15 q = kmalloc(sizeof(*p), GFP_KERNEL);
- 16 *q = *p;
- 17 q->b = 2;
- 18 q->c = 3;
- 19 list_replace_rcu(&p->list, &q->list);
- 20 synchronize_rcu();
- 21 kfree(p);
-\end{verbbox}
+\begin{linelabel}[ln:defer:Canonical RCU Replacement Example]
+\begin{VerbatimL}[commandchars=\\\[\]]
+struct foo {
+	struct list_head *list;
+	int a;
+	int b;
+	int c;
+};
+LIST_HEAD(head);
+
+/* . . . */
+
+p = search(head, key);			\lnlbl[search]
+if (p == NULL) {
+	/* Take appropriate action, unlock, & return. */
 }
-\centering
-\theverbbox
+q = kmalloc(sizeof(*p), GFP_KERNEL);
+*q = *p;				\lnlbl[copy]
+q->b = 2;				\lnlbl[update]
+q->c = 3;
+list_replace_rcu(&p->list, &q->list);	\lnlbl[replace]
+synchronize_rcu();			\lnlbl[sync_rcu]
+kfree(p);				\lnlbl[kfree]
+\end{VerbatimL}
+\end{linelabel}
 \caption{Canonical RCU Replacement Example}
 \label{lst:defer:Canonical RCU Replacement Example}
 \end{listing}
@@ -524,10 +491,15 @@ Listing~\ref{lst:defer:Canonical RCU Replacement Example},
 adapted from those in Section~\ref{sec:defer:Publish-Subscribe Mechanism},
 demonstrates this process, with field \co{a} being the search key.
 
-Lines~19, 20, and~21 implement the three steps called out above.
-Lines~16-19 gives RCU (``read-copy update'') its name: while permitting
-concurrent \emph{reads}, line~16 \emph{copies} and lines~17-19
+\begin{lineref}[ln:defer:Canonical RCU Replacement Example]
+Lines~\lnref{replace}, \lnref{sync_rcu}, and~\lnref{kfree}
+implement the three steps called out above.
+Lines~\lnref{copy}-\lnref{replace}
+gives RCU (``read-copy update'') its name: while permitting
+concurrent \emph{reads}, line~\lnref{copy} \emph{copies} and
+lines~\lnref{update}-\lnref{replace}
 do an \emph{update}.
+\end{lineref}
 
 As discussed in Section~\ref{sec:defer:Introduction to RCU},
 the \co{synchronize_rcu()} primitive can be quite simple
@@ -563,24 +535,24 @@ We can now revisit the deletion example from
 Section~\ref{sec:defer:Introduction to RCU},
 but now with the benefit of a firm understanding of the fundamental
 concepts underlying RCU.
+\begin{lineref}[ln:defer:Canonical RCU Replacement Example]
 To begin this new version of the deletion example,
-we will modify lines~11-21 in
+we will modify
+lines~\lnref{search}-\lnref{kfree} in
 Listing~\ref{lst:defer:Canonical RCU Replacement Example}
 to read as follows:
-
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 p = search(head, key);
-  2 if (p != NULL) {
-  3   list_del_rcu(&p->list);
-  4   synchronize_rcu();
-  5   kfree(p);
-  6 }
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{lineref}
+
+\begin{linelabel}[ln:defer:RCU Deletion From Linked List]
+\begin{VerbatimN}[commandchars=\\\[\]]
+p = search(head, key);
+if (p != NULL) {
+	list_del_rcu(&p->list);		\lnlbl[del_rcu]
+	synchronize_rcu();		\lnlbl[sync_rcu]
+	kfree(p);
+}
+\end{VerbatimN}
+\end{linelabel}
 
 \begin{figure}[tb]
 \centering
@@ -601,8 +573,9 @@ Please note that
 we have omitted the backwards pointers and the link from the tail
 of the list to the head for clarity.
 
+\begin{lineref}[ln:defer:RCU Deletion From Linked List]
 After the \co{list_del_rcu()} on
-line~3 has completed, the \co{5,6,7}~element
+line~\lnref{del_rcu} has completed, the \co{5,6,7}~element
 has been removed from the list, as shown in the second row of
 Figure~\ref{fig:defer:RCU Deletion From Linked List}.
 Since readers do not synchronize directly with updaters,
@@ -626,12 +599,13 @@ element~\co{5,6,7} after exiting from their RCU read-side
 critical sections.
 Therefore,
 once the \co{synchronize_rcu()} on
-line~4 completes, so that all pre-existing readers are
+line~\lnref{sync_rcu} completes, so that all pre-existing readers are
 guaranteed to have completed,
 there can be no more readers referencing this
 element, as indicated by its green shading on the third row of
 Figure~\ref{fig:defer:RCU Deletion From Linked List}.
 We are thus back to a single version of the list.
+\end{lineref}
 
 At this point, the \co{5,6,7}~element may safely be
 freed, as shown on the final row of
@@ -648,20 +622,17 @@ here are the last few lines of the
 example shown in
 Listing~\ref{lst:defer:Canonical RCU Replacement Example}:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 q = kmalloc(sizeof(*p), GFP_KERNEL);
-  2 *q = *p;
-  3 q->b = 2;
-  4 q->c = 3;
-  5 list_replace_rcu(&p->list, &q->list);
-  6 synchronize_rcu();
-  7 kfree(p);
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{linelabel}[ln:defer:Canonical RCU Replacement Example (2nd)]
+\begin{VerbatimN}[commandchars=\\\[\],firstnumber=15]
+q = kmalloc(sizeof(*p), GFP_KERNEL);	\lnlbl[kmalloc]
+*q = *p;				\lnlbl[copy]
+q->b = 2;				\lnlbl[update1]
+q->c = 3;				\lnlbl[update2]
+list_replace_rcu(&p->list, &q->list);	\lnlbl[replace]
+synchronize_rcu();			\lnlbl[sync_rcu]
+kfree(p);				\lnlbl[kfree]
+\end{VerbatimN}
+\end{linelabel}
 
 \begin{figure}[tbp]
 \centering
@@ -689,24 +660,26 @@ The following text describes how to replace the \co{5,6,7} element
 with \co{5,2,3} in such a way that any given reader sees one of these
 two values.
 
-Line~1 \co{kmalloc()}s a replacement element, as follows,
+\begin{lineref}[ln:defer:Canonical RCU Replacement Example (2nd)]
+Line~\lnref{kmalloc} \co{kmalloc()}s a replacement element, as follows,
 resulting in the state as shown in the second row of
 Figure~\ref{fig:defer:RCU Replacement in Linked List}.
 At this point, no reader can hold a reference to the newly allocated
 element (as indicated by its green shading), and it is uninitialized
 (as indicated by the question marks).
 
-Line~2 copies the old element to the new one, resulting in the
+Line~\lnref{copy} copies the old element to the new one, resulting in the
 state as shown in the third row of
 Figure~\ref{fig:defer:RCU Replacement in Linked List}.
 The newly allocated element still cannot be referenced by readers, but
 it is now initialized.
 
-Line~3 updates \co{q->b} to the value ``2'', and
-line~4 updates \co{q->c} to the value ``3'', as shown on the fourth row of
+Line~\lnref{update1} updates \co{q->b} to the value ``2'', and
+line~\lnref{update2} updates \co{q->c} to the value ``3'',
+as shown on the fourth row of
 Figure~\ref{fig:defer:RCU Replacement in Linked List}.
 
-Now, line~5 does the replacement, so that the new element is
+Now, line~\lnref{replace} does the replacement, so that the new element is
 finally visible to readers, and hence is shaded red, as shown on
 the fifth row of
 Figure~\ref{fig:defer:RCU Replacement in Linked List}.
@@ -716,7 +689,7 @@ therefore now shaded yellow), but
 new readers will instead see the \co{5,2,3} element.
 But any given reader is guaranteed to see some well-defined list.
 
-After the \co{synchronize_rcu()} on line~6 returns,
+After the \co{synchronize_rcu()} on line~\lnref{sync_rcu} returns,
 a grace period will have elapsed, and so all reads that started before the
 \co{list_replace_rcu()} will have completed.
 In particular, any readers that might have been holding references
@@ -729,9 +702,10 @@ Figure~\ref{fig:defer:RCU Replacement in Linked List}.
 As far as the readers are concerned, we are back to having a single version
 of the list, but with the new element in place of the old.
 
-After the \co{kfree()} on line~7 completes, the list will
+After the \co{kfree()} on line~\lnref{kfree} completes, the list will
 appear as shown on the final row of
 Figure~\ref{fig:defer:RCU Replacement in Linked List}.
+\end{lineref}
 
 Despite the fact that RCU was named after the replacement case,
 the vast majority of RCU usage within the Linux kernel relies on
@@ -753,23 +727,18 @@ versions of the list active at a given time.
 	Listing~\ref{lst:defer:Concurrent RCU Deletion}.
 
 \begin{listing}[htbp]
-\scriptsize
-{
-\begin{verbbox}
-  1 spin_lock(&mylock);
-  2 p = search(head, key);
-  3 if (p == NULL)
-  4   spin_unlock(&mylock);
-  5 else {
-  6   list_del_rcu(&p->list);
-  7   spin_unlock(&mylock);
-  8   synchronize_rcu();
-  9   kfree(p);
- 10 }
-\end{verbbox}
+\begin{VerbatimL}
+spin_lock(&mylock);
+p = search(head, key);
+if (p == NULL)
+	spin_unlock(&mylock);
+else {
+	list_del_rcu(&p->list);
+	spin_unlock(&mylock);
+	synchronize_rcu();
+	kfree(p);
 }
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Concurrent RCU Deletion}
 \label{lst:defer:Concurrent RCU Deletion}
 \end{listing}
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 6e909c9..3259a19 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -146,15 +146,10 @@ with time advancing from the top of the figure to the bottom.
 Although production-quality implementations of this approach can be
 quite complex, a toy implementation is exceedingly simple:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 for_each_online_cpu(cpu)
-  2   run_on(cpu);
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+for_each_online_cpu(cpu)
+	run_on(cpu);
+\end{VerbatimN}
 
 The \co{for_each_online_cpu()} primitive iterates over all CPUs, and
 the \co{run_on()} function causes the current thread to execute on the
-- 
2.7.4


