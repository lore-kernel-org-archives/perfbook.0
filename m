Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7dIeMSNSLcdKNif0v354vtejoCHJUqN2Y88yQ7YIjBw=;
        b=jm8olVbsMUA2dbZK0XD7UVoxcmqrb3q2oFk3tt+LHzn+9bmdLH4WAZMSCjX+6Os+OM
         LbCOmosMtvZQoTop/xRMkXxqMPpdUgsZPg5tBSegcLs3r+CHCr1CDf5Nvh/odDdC29Hq
         1wDJBckjQa6WsT3YMkT6zWRXB9bCIPlAcM6U6iTAHv0LV3dH0Mppi1Ay3XIKhAP+Hmxj
         68Vy6B5nHQGd6PCFGBI2qu51lcVN/atZszNomLRKMBw+8hSm7Hv+uom+CtmVAhVP5J32
         zXPfKBm/oc3P8O0a7FKRhXN6TZ4HsKW8IvIij+B0BqFJy2X+KyLlyEqrLKJQmHBCV72n
         aNbg==
Subject: [PATCH 2/6] defer: Employ new scheme for snippets of route_hazptr.c
References: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <76a9e321-e26f-c8a7-58a8-f6af9024a5f4@gmail.com>
Date: Tue, 4 Dec 2018 00:37:59 +0900
MIME-Version: 1.0
In-Reply-To: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From be603d83f1555cea7c2e1e6d1306c613ceb79b21 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 4 Dec 2018 00:15:18 +0900
Subject: [PATCH 2/6] defer: Employ new scheme for snippets of route_hazptr.c

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/route_hazptr.c |  50 ++++++++++--------
 defer/hazptr.tex                 | 110 +++++----------------------------------
 2 files changed, 40 insertions(+), 120 deletions(-)

diff --git a/CodeSamples/defer/route_hazptr.c b/CodeSamples/defer/route_hazptr.c
index 49e6e4a..c9285c6 100644
--- a/CodeSamples/defer/route_hazptr.c
+++ b/CodeSamples/defer/route_hazptr.c
@@ -23,58 +23,61 @@
 #include "hazptr.h"
 
 /* Route-table entry to be included in the routing list. */
+//\begin{snippet}[labelbase=ln:defer:route_hazptr:lookup,commandchars=\\\[\]]
 struct route_entry {
-	struct hazptr_head hh;
+	struct hazptr_head hh;				//\lnlbl{hh}
 	struct route_entry *re_next;
 	unsigned long addr;
 	unsigned long iface;
-	int re_freed;
+	int re_freed;					//\lnlbl{re_freed}
 };
-
+								//\fcvexclude
 struct route_entry route_list;
 DEFINE_SPINLOCK(routelock);
-
-/* This thread's fixed-sized set of hazard pointers. */
+								//\fcvexclude
+/* This thread's fixed-sized set of hazard pointers. */		//\fcvexclude
 hazard_pointer __thread *my_hazptr;
 
-/*
- * Look up a route entry, return the corresponding interface. 
- */
+/*								  \fcvexclude
+ * Look up a route entry, return the corresponding interface. 	  \fcvexclude
+ */								//\fcvexclude
 unsigned long route_lookup(unsigned long addr)
 {
 	int offset = 0;
 	struct route_entry *rep;
 	struct route_entry **repp;
 
-retry:
+retry:							//\lnlbl{retry}
 	repp = &route_list.re_next;
 	do {
 		rep = READ_ONCE(*repp);
 		if (rep == NULL)
 			return ULONG_MAX;
-		if (rep == (struct route_entry *)HAZPTR_POISON)
+		if (rep == (struct route_entry *)HAZPTR_POISON)	//\lnlbl{acq:b}
 			goto retry; /* element deleted. */
-
-		/* Store a hazard pointer. */
+								//\fcvexclude
+		/* Store a hazard pointer. */			//\fcvexclude
 		my_hazptr[offset].p = &rep->hh;
 		offset = !offset;
 		smp_mb(); /* Force pointer loads in order. */
-
-		/* Recheck the hazard pointer against the original. */
+								//\fcvexclude
+		/* Recheck the hazard pointer against the original. */ //\fcvexclude
 		if (READ_ONCE(*repp) != rep)
-			goto retry;
-
-		/* Advance to next. */
+			goto retry;			//\lnlbl{acq:e}
+								//\fcvexclude
+		/* Advance to next. */				//\fcvexclude
 		repp = &rep->re_next;
 	} while (rep->addr != addr);
 	if (READ_ONCE(rep->re_freed))
 		abort();
 	return rep->iface;
 }
+//\end{snippet}
 
 /*
  * Add an element to the route table.
  */
+//\begin{snippet}[labelbase=ln:defer:route_hazptr:add_del,commandchars=\\\[\]]
 int route_add(unsigned long addr, unsigned long interface)
 {
 	struct route_entry *rep;
@@ -84,7 +87,7 @@ int route_add(unsigned long addr, unsigned long interface)
 		return -ENOMEM;
 	rep->addr = addr;
 	rep->iface = interface;
-	rep->re_freed = 0;
+	rep->re_freed = 0;				//\lnlbl{init_freed}
 	spin_lock(&routelock);
 	rep->re_next = route_list.re_next;
 	route_list.re_next = rep;
@@ -92,9 +95,9 @@ int route_add(unsigned long addr, unsigned long interface)
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
@@ -108,9 +111,9 @@ int route_del(unsigned long addr)
 			break;
 		if (rep->addr == addr) {
 			*repp = rep->re_next;
-			rep->re_next = (struct route_entry *)HAZPTR_POISON;
+			rep->re_next = (struct route_entry *)HAZPTR_POISON; //\lnlbl{poison}
 			spin_unlock(&routelock);
-			hazptr_free_later(&rep->hh);
+			hazptr_free_later(&rep->hh);	//\lnlbl{free_later}
 			return 0;
 		}
 		repp = &rep->re_next;
@@ -118,6 +121,7 @@ int route_del(unsigned long addr)
 	spin_unlock(&routelock);
 	return -ENOENT;
 }
+//\end{snippet}
 
 /*
  * Clear all elements from the route table.
diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 588f603..98ba002 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -181,101 +181,13 @@ Chapter~\ref{chp:Data Structures}
 and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.2483867,MagedMichael04a}.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
- 1 struct route_entry {
- 2   struct hazptr_head hh;
- 3   struct route_entry *re_next;
- 4   unsigned long addr;
- 5   unsigned long iface;
- 6   int re_freed;
- 7 };
- 8 struct route_entry route_list;
- 9 DEFINE_SPINLOCK(routelock);
-10 hazard_pointer __thread *my_hazptr;
-11
-12 unsigned long route_lookup(unsigned long addr)
-13 {
-14   int offset = 0;
-15   struct route_entry *rep;
-16   struct route_entry **repp;
-17
-18 retry:
-19   repp = &route_list.re_next;
-20   do {
-21     rep = READ_ONCE(*repp);
-22     if (rep == NULL)
-23       return ULONG_MAX;
-24     if (rep == (struct route_entry *)HAZPTR_POISON)
-25       goto retry;
-26     my_hazptr[offset].p = &rep->hh;
-27     offset = !offset;
-28     smp_mb();
-29     if (READ_ONCE(*repp) != rep)
-30       goto retry;
-31     repp = &rep->re_next;
-32   } while (rep->addr != addr);
-33   if (READ_ONCE(rep->re_freed))
-34     abort();
-35   return rep->iface;
-36 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/route_hazptr@lookup.fcv}
 \caption{Hazard-Pointer Pre-BSD Routing Table Lookup}
 \label{lst:defer:Hazard-Pointer Pre-BSD Routing Table Lookup}
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
-13   rep->re_next = route_list.re_next;
-14   route_list.re_next = rep;
-15   spin_unlock(&routelock);
-16   return 0;
-17 }
-18
-19 int route_del(unsigned long addr)
-20 {
-21   struct route_entry *rep;
-22   struct route_entry **repp;
-23
-24   spin_lock(&routelock);
-25   repp = &route_list.re_next;
-26   for (;;) {
-27     rep = *repp;
-28     if (rep == NULL)
-29       break;
-30     if (rep->addr == addr) {
-31       *repp = rep->re_next;
-32       rep->re_next =
-33           (struct route_entry *)HAZPTR_POISON;
-34       spin_unlock(&routelock);
-35       hazptr_free_later(&rep->hh);
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
+\input{CodeSamples/defer/route_hazptr@add_del.fcv}
 \caption{Hazard-Pointer Pre-BSD Routing Table Add/Delete}
 \label{lst:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete}
 \end{listing}
@@ -293,24 +205,28 @@ on
 page~\pageref{lst:defer:Sequential Pre-BSD Routing Table},
 so only differences will be discussed.
 
+\begin{lineref}[ln:defer:route_hazptr:lookup]
 Starting with
 Listing~\ref{lst:defer:Hazard-Pointer Pre-BSD Routing Table Lookup},
-line~2 shows the \co{->hh} field used to queue objects pending
+line~\lnref{hh} shows the \co{->hh} field used to queue objects pending
 hazard-pointer free,
-line~6 shows the \co{->re_freed} field used to detect use-after-free bugs,
-and lines~24-30 attempt to acquire a hazard pointer, branching
-to line~18's \co{retry} label on failure.
+line~\lnref{re_freed} shows the \co{->re_freed} field used to detect use-after-free bugs,
+and lines~\lnref{acq:b}-\lnref{acq:e} attempt to acquire a hazard pointer, branching
+to line~\lnref{retry}'s \co{retry} label on failure.
+\end{lineref}
 
+\begin{lineref}[ln:defer:route_hazptr:add_del]
 In
 Listing~\ref{lst:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete},
-line~11 initializes \co{->re_freed},
-lines~32 and~33 poison the \co{->re_next} field of the newly removed
+line~\lnref{init_freed} initializes \co{->re_freed},
+line~\lnref{poison} poisons the \co{->re_next} field of the newly removed
 object, and
-line~35 passes that object to the hazard pointers's
+line~\lnref{free_later} passes that object to the hazard pointers's
 \co{hazptr_free_later()} function, which will free that object once it
 is safe to do so.
 The spinlocks work the same as in
 Listing~\ref{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}.
+\end{lineref}
 
 \begin{figure}[tb]
 \centering
-- 
2.7.4


