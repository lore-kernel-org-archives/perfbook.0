Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dgo+J03WT9I6HcMmOxlEkRJBYlYBQxK0J5vJZg4AN0U=;
        b=U9hnZwtOTdpCsh1UHlFjH6M1vp+ucadLDeuVQ9LZrtgdTFaN3W5c4DhIaBgWaj2lAo
         t2xEKRCix325bbApcOieODdoJkqUjVPVoFxsP/4FeGFOSVZPrpzwTiVrN243z3c8AZFs
         Zy+6PDGE1WSAc5b5LSl8UIDGzfz5tosh3UMKIPNMLXIDjCfqcMCBFKGVad8RJ6Lo/jLs
         kQPliQTUE0A260UqpeY2xC/RFn/LE4cwgzvxccnlfIMt4f9mSF1jv/W18GnKmR3vC3FA
         w7xKNwnyWKMMo5laNiiVt6VqMfR/ZInURU6qA00qWNgaTktORsHor6vEzbfY4ZnCYetw
         D9IQ==
Subject: [PATCH 3/3] defer: Employ new scheme for snippets of route_refcnt.c
References: <1c49a5ed-290f-f81c-a768-b2d5d2450b43@gmail.com>
 <9aab89ea-ac22-6f48-fc7e-fe4bda4e5cf1@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a3c41da0-1839-0c22-be26-b70c4609e346@gmail.com>
Date: Sun, 25 Nov 2018 23:50:13 +0900
MIME-Version: 1.0
In-Reply-To: <9aab89ea-ac22-6f48-fc7e-fe4bda4e5cf1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4ebe85f38ed5f0e003847854b64bc8773bec8ebb Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 25 Nov 2018 23:27:25 +0900
Subject: [PATCH 3/3] defer: Employ new scheme for snippets of route_refcnt.c

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/route_refcnt.c |  67 +++++++++--------
 defer/refcnt.tex                 | 152 +++++++++------------------------------
 2 files changed, 71 insertions(+), 148 deletions(-)

diff --git a/CodeSamples/defer/route_refcnt.c b/CodeSamples/defer/route_refcnt.c
index 8a48faf..4833919 100644
--- a/CodeSamples/defer/route_refcnt.c
+++ b/CodeSamples/defer/route_refcnt.c
@@ -22,26 +22,27 @@
 #include "../api.h"
 
 /* Route-table entry to be included in the routing list. */
+//\begin{snippet}[labelbase=ln:defer:route_refcnt:lookup,commandchars=\\\[\]]
 struct route_entry {
-	atomic_t re_refcnt;
+	atomic_t re_refcnt;				//\lnlbl{entry:refcnt}
 	struct route_entry *re_next;
 	unsigned long addr;
 	unsigned long iface;
-	int re_freed;
+	int re_freed;					//\lnlbl{entry:freed}
 };
-
+							//\fcvexclude
 struct route_entry route_list;
-DEFINE_SPINLOCK(routelock);
+DEFINE_SPINLOCK(routelock);				//\lnlbl{entry:routelock}
 
-static void re_free(struct route_entry *rep)
+static void re_free(struct route_entry *rep)		//\lnlbl{re_free:b}
 {
 	WRITE_ONCE(rep->re_freed, 1);
 	free(rep);
-}
+}							//\lnlbl{re_free:e}
 
-/*
- * Look up a route entry, return the corresponding interface. 
- */
+/*								\fcvexclude
+ * Look up a route entry, return the corresponding interface. 	\fcvexclude
+ */							      //\fcvexclude
 unsigned long route_lookup(unsigned long addr)
 {
 	int old;
@@ -54,23 +55,24 @@ retry:
 	repp = &route_list.re_next;
 	rep = NULL;
 	do {
-		if (rep && atomic_dec_and_test(&rep->re_refcnt))
-			re_free(rep);
+		if (rep && atomic_dec_and_test(&rep->re_refcnt)) //\lnlbl{lookup:relprev:b}
+			re_free(rep);				//\lnlbl{lookup:relprev:e}
 		rep = READ_ONCE(*repp);
-		if (rep == NULL)
+		if (rep == NULL)				//\lnlbl{lookup:check_NULL}
 			return ULONG_MAX;
-
-		/* Acquire a reference if the count is non-zero. */
-		do {
-			if (READ_ONCE(rep->re_freed))
-				abort();
+								//\fcvexclude
+		/* Acquire a reference if the count is non-zero. */ //\fcvexclude
+		do {						//\lnlbl{lookup:acq:b}
+			if (READ_ONCE(rep->re_freed))		//\lnlbl{lookup:check_uaf}
+				abort();			//\lnlbl{lookup:abort}
 			old = atomic_read(&rep->re_refcnt);
 			if (old <= 0)
 				goto retry;
 			new = old + 1;
-		} while (atomic_cmpxchg(&rep->re_refcnt, old, new) != old);
-
-		/* Advance to next. */
+		} while (atomic_cmpxchg(&rep->re_refcnt,
+		                        old, new) != old);	//\lnlbl{lookup:acq:e}
+								//\fcvexclude
+		/* Advance to next. */				//\fcvexclude
 		repp = &rep->re_next;
 	} while (rep->addr != addr);
 	ret = rep->iface;
@@ -78,10 +80,12 @@ retry:
 		re_free(rep);
 	return ret;
 }
+//\end{snippet}
 
 /*
  * Add an element to the route table.
  */
+//\begin{snippet}[labelbase=ln:defer:route_refcnt:add_del,commandchars=\\\[\]]
 int route_add(unsigned long addr, unsigned long interface)
 {
 	struct route_entry *rep;
@@ -92,23 +96,23 @@ int route_add(unsigned long addr, unsigned long interface)
 	atomic_set(&rep->re_refcnt, 1);
 	rep->addr = addr;
 	rep->iface = interface;
-	spin_lock(&routelock);
+	spin_lock(&routelock);				//\lnlbl{acq1}
 	rep->re_next = route_list.re_next;
-	rep->re_freed = 0;
+	rep->re_freed = 0;				//\lnlbl{init:freed}
 	route_list.re_next = rep;
-	spin_unlock(&routelock);
+	spin_unlock(&routelock);			//\lnlbl{rel1}
 	return 0;
 }
 
-/*
- * Remove the specified element from the route table.
- */
+/*								\fcvexclude
+ * Remove the specified element from the route table.		\fcvexclude
+ */							      //\fcvexclude
 int route_del(unsigned long addr)
 {
 	struct route_entry *rep;
 	struct route_entry **repp;
 
-	spin_lock(&routelock);
+	spin_lock(&routelock);				//\lnlbl{acq2}
 	repp = &route_list.re_next;
 	for (;;) {
 		rep = *repp;
@@ -116,16 +120,17 @@ int route_del(unsigned long addr)
 			break;
 		if (rep->addr == addr) {
 			*repp = rep->re_next;
-			spin_unlock(&routelock);
-			if (atomic_dec_and_test(&rep->re_refcnt))
-				re_free(rep);
+			spin_unlock(&routelock);	//\lnlbl{rel2}
+			if (atomic_dec_and_test(&rep->re_refcnt)) //\lnlbl{re_free:b}
+				re_free(rep);		//\lnlbl{re_free:e}
 			return 0;
 		}
 		repp = &rep->re_next;
 	}
-	spin_unlock(&routelock);
+	spin_unlock(&routelock);			//\lnlbl{rel3}
 	return -ENOENT;
 }
+//\end{snippet}
 
 /*
  * Clear all elements from the route table.
diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index ebf9111..1ad5f97 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -4,115 +4,13 @@
 \label{sec:defer:Reference Counting}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
- 1 struct route_entry { /* BUGGY!!! */
- 2   atomic_t re_refcnt;
- 3   struct route_entry *re_next;
- 4   unsigned long addr;
- 5   unsigned long iface;
- 6   int re_freed;
- 7 };
- 8 struct route_entry route_list;
- 9 DEFINE_SPINLOCK(routelock);
-10
-11 static void re_free(struct route_entry *rep)
-12 {
-13   WRITE_ONCE(rep->re_freed, 1);
-14   free(rep);
-15 }
-16
-17 unsigned long route_lookup(unsigned long addr)
-18 {
-19   int old;
-20   int new;
-21   struct route_entry *rep;
-22   struct route_entry **repp;
-23   unsigned long ret;
-24
-25 retry:
-26   repp = &route_list.re_next;
-27   rep = NULL;
-28   do {
-29     if (rep &&
-30         atomic_dec_and_test(&rep->re_refcnt))
-31       re_free(rep);
-32     rep = READ_ONCE(*repp);
-33     if (rep == NULL)
-34       return ULONG_MAX;
-35     do {
-36       if (READ_ONCE(rep->re_freed))
-37         abort();
-38       old = atomic_read(&rep->re_refcnt);
-39       if (old <= 0)
-40         goto retry;
-41       new = old + 1;
-42     } while (atomic_cmpxchg(&rep->re_refcnt,
-43                             old, new) != old);
-44     repp = &rep->re_next;
-45   } while (rep->addr != addr);
-46   ret = rep->iface;
-47   if (atomic_dec_and_test(&rep->re_refcnt))
-48     re_free(rep);
-49   return ret;
-50 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/route_refcnt@lookup.fcv}
 \caption{Reference-Counted Pre-BSD Routing Table Lookup (BUGGY!!!)}
 \label{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup}
 \end{listing}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
- 1 int route_add(unsigned long addr, /* BUGGY!!! */
- 2               unsigned long interface)
- 3 {
- 4   struct route_entry *rep;
- 5
- 6   rep = malloc(sizeof(*rep));
- 7   if (!rep)
- 8     return -ENOMEM;
- 9   atomic_set(&rep->re_refcnt, 1);
-10   rep->addr = addr;
-11   rep->iface = interface;
-12   spin_lock(&routelock);
-13   rep->re_next = route_list.re_next;
-14   rep->re_freed = 0;
-15   route_list.re_next = rep;
-16   spin_unlock(&routelock);
-17   return 0;
-18 }
-19
-20 int route_del(unsigned long addr)
-21 {
-22   struct route_entry *rep;
-23   struct route_entry **repp;
-24
-25   spin_lock(&routelock);
-26   repp = &route_list.re_next;
-27   for (;;) {
-28     rep = *repp;
-29     if (rep == NULL)
-30       break;
-31     if (rep->addr == addr) {
-32       *repp = rep->re_next;
-33       spin_unlock(&routelock);
-34       if (atomic_dec_and_test(&rep->re_refcnt))
-35         re_free(rep);
-36       return 0;
-37     }
-38     repp = &rep->re_next;
-39   }
-40   spin_unlock(&routelock);
-41   return -ENOENT;
-42 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/route_refcnt@add_del.fcv}
 \caption{Reference-Counted Pre-BSD Routing Table Add/Delete (BUGGY!!!)}
 \label{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
 \end{listing}
@@ -143,18 +41,28 @@ shown in
 Listing~\ref{lst:defer:Sequential Pre-BSD Routing Table},
 only the differences will be discussed.
 
+\begin{lineref}[ln:defer:route_refcnt:lookup:entry]
 Starting with
 Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup},
-line~2 adds the actual reference counter, line~6 adds a \co{->re_freed}
-use-after-free check field, line~9 adds the \co{routelock} that will
+line~\lnref{refcnt} adds the actual reference counter,
+line~\lnref{freed} adds a \co{->re_freed}
+use-after-free check field,
+line~\lnref{routelock} adds the \co{routelock} that will
 be used to synchronize concurrent updates,
-and lines~11-15 add \co{re_free()}, which sets
+\end{lineref}
+\begin{lineref}[ln:defer:route_refcnt:lookup:re_free]
+and lines~\lnref{b}-\lnref{e} add \co{re_free()}, which sets
 \co{->re_freed}, enabling \co{route_lookup()} to check for
 use-after-free bugs.
-In \co{route_lookup()} itself, lines~29-31 release the reference
+\end{lineref}
+\begin{lineref}[ln:defer:route_refcnt:lookup:lookup]
+In \co{route_lookup()} itself,
+lines~\lnref{relprev:b}-\lnref{relprev:e} release the reference
 count of the prior element and free it if the count becomes zero,
-and lines~35-43 acquire a reference on the new element, with lines~36
-and~37 performing the use-after-free check.
+and lines~\lnref{acq:b}-\lnref{acq:e} acquire a reference on the new element,
+with lines~\lnref{check_uaf}
+and~\lnref{abort} performing the use-after-free check.
+\end{lineref}
 
 \QuickQuiz{}
 	Why bother with a use-after-free check?
@@ -174,12 +82,16 @@ and~37 performing the use-after-free check.
 	of increasing the probability of finding bugs.
 } \QuickQuizEnd
 
+\begin{lineref}[ln:defer:route_refcnt:add_del]
 In Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete},
-lines~12, 16, 25, 33, and~40 introduce locking to synchronize
+lines~\lnref{acq1}, \lnref{rel1}, \lnref{acq2}, \lnref{rel2},
+and~\lnref{rel3} introduce locking to synchronize
 concurrent updates.
-Line~14 initializes the \co{->re_freed} use-after-free-check field,
-and finally lines~34-35 invoke \co{re_free()} if the new value of
+Line~\lnref{init:freed} initializes the \co{->re_freed} use-after-free-check field,
+and finally lines~\lnref{re_free:b}-\lnref{re_free:e} invoke
+\co{re_free()} if the new value of
 the reference count is zero.
+\end{lineref}
 
 \QuickQuiz{}
 	Why doesn't \co{route_del()} in
@@ -249,7 +161,8 @@ But it gets worse.
 
 Running multiple updater threads repeatedly invoking
 \co{route_add()} and \co{route_del()} will quickly encounter the
-\co{abort()} statement on line~37 of
+\co{abort()} statement on
+line~\ref{ln:defer:route_refcnt:lookup:lookup:abort} of
 Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup},
 which indicates a use-after-free bug.
 This in turn means that the reference counts are not only profoundly
@@ -260,8 +173,10 @@ One sequence of events leading to the use-after-free bug is as follows,
 given the list shown in
 Figure~\ref{fig:defer:Pre-BSD Packet Routing List}:
 
+\begin{lineref}[ln:defer:route_refcnt:lookup]
 \begin{enumerate}
-\item	Thread~A looks up address~42, reaching line~33 of
+\item	Thread~A looks up address~42, reaching
+	line~\lnref{lookup:check_NULL} of
 	\co{route_lookup()} in
 	Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup}.
 	In other words, Thread~A has a pointer to the first element,
@@ -273,10 +188,13 @@ Figure~\ref{fig:defer:Pre-BSD Packet Routing List}:
 	field was equal to the value one, it invokes
 	\co{re_free()} to set the \co{->re_freed} field and to free the entry.
 \item	Thread~A continues execution of \co{route_lookup()}.
-	Its \co{rep} pointer is non-\co{NULL}, but line~36 sees that
-	its \co{->re_freed} field is non-zero, so line~37 invokes
+	Its \co{rep} pointer is non-\co{NULL}, but
+	line~\lnref{lookup:check_uaf} sees that
+	its \co{->re_freed} field is non-zero,
+        so line~\lnref{lookup:abort} invokes
 	\co{abort()}.
 \end{enumerate}
+\end{lineref}
 
 The problem is that the reference count is located in the object
 to be protected, but that means that there is no protection during
-- 
2.7.4


