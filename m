Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ya3UZimIIpk26hexGxCIbgWrVw+D4gkKWY9qNbcrBEQ=;
        b=J9U3gQ1V5S88V9FAVIfqy0DyKVNKGk2rQSgQblwaKR5xnP/GtXGtjgc5pt8w2WLz80
         93KTWAkrYraxeiotEsKru6iUYC9QEsfWZ4iym639vlTiRtTKQWLaKIXOMfrCnrNhVi5b
         q9wFQMxJDpzf66nD6BLZ+dyiHRmnakYi7veteIPveyXyILpv/oK4WCpPiQvbnaWipxmV
         7OYZfpITz7K4leHiFX/ceEMxksOHdY+3g38KPGjk7JYz000QubK3i6NLZZi5xs2cs/5G
         KMBlbU1R7N0oeZXAhJwpxBSh8yvIPyctCO3LkE3lTx+CXoGxUWVfAeCdbnu5SgCKP7fy
         l4ZA==
Subject: [PATCH 4/6] defer: Employ new scheme for snippets of route_seqlock.c
References: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <128a87ac-0154-5c65-cf7e-1b8c0f235e57@gmail.com>
Date: Tue, 4 Dec 2018 00:41:03 +0900
MIME-Version: 1.0
In-Reply-To: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8232875eee86903a48912cacdd5d2268e5ff8d64 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 4 Dec 2018 00:16:17 +0900
Subject: [PATCH 4/6] defer: Employ new scheme for snippets of route_seqlock.c

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/route_seqlock.c |  56 ++++++++++---------
 defer/seqlock.tex                 | 113 ++++++--------------------------------
 2 files changed, 48 insertions(+), 121 deletions(-)

diff --git a/CodeSamples/defer/route_seqlock.c b/CodeSamples/defer/route_seqlock.c
index 8224682..969704b 100644
--- a/CodeSamples/defer/route_seqlock.c
+++ b/CodeSamples/defer/route_seqlock.c
@@ -23,19 +23,20 @@
 #include "seqlock.h"
 
 /* Route-table entry to be included in the routing list. */
+//\begin{snippet}[labelbase=ln:defer:route_seqlock:lookup,commandchars=\\\[\]]
 struct route_entry {
 	struct route_entry *re_next;
 	unsigned long addr;
 	unsigned long iface;
-	int re_freed;
+	int re_freed;					//\lnlbl{struct:re_freed}
 };
-
+								//\fcvexclude
 struct route_entry route_list;
-DEFINE_SEQ_LOCK(sl);
+DEFINE_SEQ_LOCK(sl);					//\lnlbl{struct:sl}
 
-/*
- * Look up a route entry, return the corresponding interface. 
- */
+/*								  \fcvexclude
+ * Look up a route entry, return the corresponding interface. 	  \fcvexclude
+ */								//\fcvexclude
 unsigned long route_lookup(unsigned long addr)
 {
 	struct route_entry *rep;
@@ -43,31 +44,33 @@ unsigned long route_lookup(unsigned long addr)
 	unsigned long ret;
 	unsigned long s;
 
-retry:
-	s = read_seqbegin(&sl);
+retry:							//\lnlbl{lookup:retry}
+	s = read_seqbegin(&sl);				//\lnlbl{lookup:r_sqbegin}
 	repp = &route_list.re_next;
 	do {
 		rep = READ_ONCE(*repp);
 		if (rep == NULL) {
-			if (read_seqretry(&sl, s))
-				goto retry;
+			if (read_seqretry(&sl, s))	//\lnlbl{lookup:r_sqretry1}
+				goto retry;		//\lnlbl{lookup:goto_retry1}
 			return ULONG_MAX;
 		}
-
-		/* Advance to next. */
+								//\fcvexclude
+		/* Advance to next. */				//\fcvexclude
 		repp = &rep->re_next;
 	} while (rep->addr != addr);
-	if (READ_ONCE(rep->re_freed))
-		abort();
+	if (READ_ONCE(rep->re_freed))			//\lnlbl{lookup:chk_freed}
+		abort();				//\lnlbl{lookup:abort}
 	ret = rep->iface;
-	if (read_seqretry(&sl, s))
-		goto retry;
+	if (read_seqretry(&sl, s))			//\lnlbl{lookup:r_sqretry2}
+		goto retry;				//\lnlbl{lookup:goto_retry2}
 	return ret;
 }
+//\end{snippet}
 
 /*
  * Add an element to the route table.
  */
+//\begin{snippet}[labelbase=ln:defer:route_seqlock:add_del,commandchars=\\\[\]]
 int route_add(unsigned long addr, unsigned long interface)
 {
 	struct route_entry *rep;
@@ -77,23 +80,23 @@ int route_add(unsigned long addr, unsigned long interface)
 		return -ENOMEM;
 	rep->addr = addr;
 	rep->iface = interface;
-	rep->re_freed = 0;
-	write_seqlock(&sl);
+	rep->re_freed = 0;			//\lnlbl{add:clr_freed}
+	write_seqlock(&sl);			//\lnlbl{add:w_sqlock}
 	rep->re_next = route_list.re_next;
 	route_list.re_next = rep;
-	write_sequnlock(&sl);
+	write_sequnlock(&sl);			//\lnlbl{add:w_squnlock}
 	return 0;
 }
 
-/*
- * Remove the specified element from the route table.
- */
+/*								  \fcvexclude
+ * Remove the specified element from the route table.		  \fcvexclude
+ */								//\fcvexclude
 int route_del(unsigned long addr)
 {
 	struct route_entry *rep;
 	struct route_entry **repp;
 
-	write_seqlock(&sl);
+	write_seqlock(&sl);				//\lnlbl{del:w_sqlock}
 	repp = &route_list.re_next;
 	for (;;) {
 		rep = *repp;
@@ -101,17 +104,18 @@ int route_del(unsigned long addr)
 			break;
 		if (rep->addr == addr) {
 			*repp = rep->re_next;
-			write_sequnlock(&sl);
+			write_sequnlock(&sl);		//\lnlbl{del:w_squnlock1}
 			smp_mb();
-			rep->re_freed = 1;
+			rep->re_freed = 1;		//\lnlbl{del:set_freed}
 			free(rep);
 			return 0;
 		}
 		repp = &rep->re_next;
 	}
-	write_sequnlock(&sl);
+	write_sequnlock(&sl);				//\lnlbl{del:w_squnlock2}
 	return -ENOENT;
 }
+//\end{snippet}
 
 /*
  * Clear all elements from the route table.
diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index 7fabc35..3eabf31 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -263,100 +263,13 @@ increment of the sequence number on line~\lnref{inc}, then releases the lock.
 } \QuickQuizEnd
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
- 1 struct route_entry {
- 2   struct route_entry *re_next;
- 3   unsigned long addr;
- 4   unsigned long iface;
- 5   int re_freed;
- 6 };
- 7 struct route_entry route_list;
- 8 DEFINE_SEQ_LOCK(sl);
- 9
-10 unsigned long route_lookup(unsigned long addr)
-11 {
-12   struct route_entry *rep;
-13   struct route_entry **repp;
-14   unsigned long ret;
-15   unsigned long s;
-16
-17 retry:
-18   s = read_seqbegin(&sl);
-19   repp = &route_list.re_next;
-20   do {
-21     rep = READ_ONCE(*repp);
-22     if (rep == NULL) {
-23       if (read_seqretry(&sl, s))
-24         goto retry;
-25       return ULONG_MAX;
-26     }
-27     repp = &rep->re_next;
-28   } while (rep->addr != addr);
-29   if (READ_ONCE(rep->re_freed))
-30     abort();
-31   ret = rep->iface;
-32   if (read_seqretry(&sl, s))
-33     goto retry;
-34   return ret;
-35 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/route_seqlock@lookup.fcv}
 \caption{Sequence-Locked Pre-BSD Routing Table Lookup (BUGGY!!!)}
 \label{lst:defer:Sequence-Locked Pre-BSD Routing Table Lookup}
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
-12   write_seqlock(&sl);
-13   rep->re_next = route_list.re_next;
-14   route_list.re_next = rep;
-15   write_sequnlock(&sl);
-16   return 0;
-17 }
-18
-19 int route_del(unsigned long addr)
-20 {
-21   struct route_entry *rep;
-22   struct route_entry **repp;
-23
-24   write_seqlock(&sl);
-25   repp = &route_list.re_next;
-26   for (;;) {
-27     rep = *repp;
-28     if (rep == NULL)
-29       break;
-30     if (rep->addr == addr) {
-31       *repp = rep->re_next;
-32       write_sequnlock(&sl);
-33       smp_mb();
-34       rep->re_freed = 1;
-35       free(rep);
-36       return 0;
-37     }
-38     repp = &rep->re_next;
-39   }
-40   write_sequnlock(&sl);
-41   return -ENOENT;
-42 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/route_seqlock@add_del.fcv}
 \caption{Sequence-Locked Pre-BSD Routing Table Add/Delete (BUGGY!!!)}
 \label{lst:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete}
 \end{listing}
@@ -370,19 +283,29 @@ shows \co{route_add()} and \co{route_del()} (\path{route_seqlock.c}).
 This implementation is once again similar to its counterparts in earlier
 sections, so only the differences will be highlighted.
 
+\begin{lineref}[ln:defer:route_seqlock:lookup]
 In
 Listing~\ref{lst:defer:Sequence-Locked Pre-BSD Routing Table Lookup},
-line~5 adds \co{->re_freed}, which is checked on lines~29 and~30.
-Line~8 adds a sequence lock, which is used by \co{route_lookup()}
-on lines~18, 23, and~32, with lines~24 and~33 branching back to
-the \co{retry} label on line~17.
+line~\lnref{struct:re_freed} adds \co{->re_freed}, which is checked on
+lines~\lnref{lookup:chk_freed} and~\lnref{lookup:abort}.
+Line~\lnref{struct:sl} adds a sequence lock, which is used by \co{route_lookup()}
+\end{lineref}
+\begin{lineref}[ln:defer:route_seqlock:lookup:lookup]
+on lines~\lnref{r_sqbegin}, \lnref{r_sqretry1}, and~\lnref{r_sqretry2},
+with lines~\lnref{goto_retry1} and~\lnref{goto_retry2} branching back to
+the \co{retry} label on line~\lnref{retry}.
 The effect is to retry any lookup that runs concurrently with an update.
+\end{lineref}
 
+\begin{lineref}[ln:defer:route_seqlock:add_del]
 In
 Listing~\ref{lst:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete},
-lines~12, 15, 24, and~40 acquire and release the sequence lock,
-while lines~11, 33, and~44 handle \co{->re_freed}.
+lines~\lnref{add:w_sqlock}, \lnref{add:w_squnlock}, \lnref{del:w_sqlock},
+\lnref{del:w_squnlock1}, and~\lnref{del:w_squnlock2}
+acquire and release the sequence lock,
+while lines~\lnref{add:clr_freed} and~\lnref{del:set_freed} handle \co{->re_freed}.
 This implementation is therefore quite straightforward.
+\end{lineref}
 
 \begin{figure}[tb]
 \centering
-- 
2.7.4


