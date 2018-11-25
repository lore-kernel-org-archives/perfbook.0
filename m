Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UUIvirQgCIkwqUwi8FExc5DkHbKLdJZnrWYm0O/k8ss=;
        b=pVkBTDeslU3gLRDfLAhRUxf1+c7MIh90Vn5QmjbHpRy1iVzJJ8l73ZbYqtHFhU5NRr
         4annZIzKuNfQer6OI41tvYgMyAcA9d8PhClMzs5iedqp9hXVetE4PB2LmY+bHFHt+Ojp
         GXOmmWy4TzICv7FVbejmSKFIZa9YILSN9BSYG1UyrmbyiDbYYwpj4EHw5C/JF9R4q2Au
         iFv2ny8KtaXzJbWYOPigcbCbSbQhkwtEj65pJQ0qfr/OC942/9whaCadiDa18NlNLTdx
         ZD+xSGhdhu7zx5cQxTI+fXQ0+RMsjHcxaIkBfNeU+XDH8pxWBLGVemZI7JwUMh2ZAnfa
         bmGQ==
Subject: [PATCH 2/3] defer: Employ new snippet scheme for route_seq.c
References: <1c49a5ed-290f-f81c-a768-b2d5d2450b43@gmail.com>
 <9aab89ea-ac22-6f48-fc7e-fe4bda4e5cf1@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3efd69fe-c15b-09f1-49b2-eab730f03c33@gmail.com>
Date: Sun, 25 Nov 2018 23:48:14 +0900
MIME-Version: 1.0
In-Reply-To: <9aab89ea-ac22-6f48-fc7e-fe4bda4e5cf1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9bf0f2fcf35a1a627ca92204dc6dcda316616c71 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 25 Nov 2018 21:26:58 +0900
Subject: [PATCH 2/3] defer: Employ new snippet scheme for route_seq.c

Also mention the source file name.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/route_seq.c | 42 ++++++++++++------------
 defer/defer.tex               | 76 +++++++++----------------------------------
 2 files changed, 37 insertions(+), 81 deletions(-)

diff --git a/CodeSamples/defer/route_seq.c b/CodeSamples/defer/route_seq.c
index 042aed0..535ed09 100644
--- a/CodeSamples/defer/route_seq.c
+++ b/CodeSamples/defer/route_seq.c
@@ -23,18 +23,19 @@
 #include "../api.h"
 
 /* Route-table entry to be included in the routing list. */
-struct route_entry {
+//\begin{snippet}[labelbase=ln:defer:route_seq:lookup_add_del,commandchars=\\\[\]]
+struct route_entry {					//\lnlbl{entry:b}
 	struct cds_list_head re_next;
 	unsigned long addr;
 	unsigned long iface;
-};
-
-CDS_LIST_HEAD(route_list);
-
-/*
- * Look up a route entry, return the corresponding interface. 
- */
-unsigned long route_lookup(unsigned long addr)
+};							//\lnlbl{entry:e}
+							//\fcvexclude
+CDS_LIST_HEAD(route_list);				//\lnlbl{entry:header}
+
+/*								\fcvexclude
+ * Look up a route entry, return the corresponding interface. 	\fcvexclude
+ */							      //\fcvexclude
+unsigned long route_lookup(unsigned long addr)		//\lnlbl{lookup:b}
 {
 	struct route_entry *rep;
 	unsigned long ret;
@@ -46,12 +47,12 @@ unsigned long route_lookup(unsigned long addr)
 		}
 	}
 	return ULONG_MAX;
-}
+}							//\lnlbl{lookup:e}
 
-/*
- * Add an element to the route table.
- */
-int route_add(unsigned long addr, unsigned long interface)
+/*								\fcvexclude
+ * Add an element to the route table.				\fcvexclude
+ */							      //\fcvexclude
+int route_add(unsigned long addr, unsigned long interface)//\lnlbl{add:b}
 {
 	struct route_entry *rep;
 
@@ -62,12 +63,12 @@ int route_add(unsigned long addr, unsigned long interface)
 	rep->iface = interface;
 	cds_list_add(&rep->re_next, &route_list);
 	return 0;
-}
+}							//\lnlbl{add:e}
 
-/*
- * Remove the specified element from the route table.
- */
-int route_del(unsigned long addr)
+/*								\fcvexclude
+ * Remove the specified element from the route table.		\fcvexclude
+ */							      //\fcvexclude
+int route_del(unsigned long addr)			//\lnlbl{del:b}
 {
 	struct route_entry *rep;
 
@@ -79,7 +80,8 @@ int route_del(unsigned long addr)
 		}
 	}
 	return -ENOENT;
-}
+}							//\lnlbl{del:e}
+//\end{snippet}
 
 /*
  * Clear all elements from the route table.
diff --git a/defer/defer.tex b/defer/defer.tex
index e396dbf..69437a3 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -69,80 +69,34 @@ list to evaluate a number of read-mostly synchronization techniques.
 \end{figure}
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 struct route_entry {
- 2   struct cds_list_head re_next;
- 3   unsigned long addr;
- 4   unsigned long iface;
- 5 };
- 6 CDS_LIST_HEAD(route_list);
- 7
- 8 unsigned long route_lookup(unsigned long addr)
- 9 {
-10   struct route_entry *rep;
-11   unsigned long ret;
-12
-13   cds_list_for_each_entry(rep,
-14                           &route_list, re_next) {
-15     if (rep->addr == addr) {
-16       ret = rep->iface;
-17       return ret;
-18     }
-19   }
-20   return ULONG_MAX;
-21 }
-22
-23 int route_add(unsigned long addr,
-24               unsigned long interface)
-25 {
-26   struct route_entry *rep;
-27
-28   rep = malloc(sizeof(*rep));
-29   if (!rep)
-30     return -ENOMEM;
-31   rep->addr = addr;
-32   rep->iface = interface;
-33   cds_list_add(&rep->re_next, &route_list);
-34   return 0;
-35 }
-36
-37 int route_del(unsigned long addr)
-38 {
-39   struct route_entry *rep;
-40
-41   cds_list_for_each_entry(rep,
-42                           &route_list, re_next) {
-43     if (rep->addr == addr) {
-44       cds_list_del(&rep->re_next);
-45       free(rep);
-46       return 0;
-47     }
-48   }
-49   return -ENOENT;
-50 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/route_seq@lookup_add_del.fcv}
 \caption{Sequential Pre-BSD Routing Table}
 \label{lst:defer:Sequential Pre-BSD Routing Table}
 \end{listing}
 
-Listing~\ref{lst:defer:Sequential Pre-BSD Routing Table}
+Listing~\ref{lst:defer:Sequential Pre-BSD Routing Table} (\path{route_sec.c})
 shows a simple single-threaded implementation corresponding to
 Figure~\ref{fig:defer:Pre-BSD Packet Routing List}.
-Lines~1-5 define a \co{route_entry} structure and line~6 defines
+\begin{lineref}[ln:defer:route_seq:lookup_add_del:entry]
+Lines~\lnref{b}-\lnref{e} define a \co{route_entry} structure and
+line~\lnref{header} defines
 the \co{route_list} header.
-Lines~8-21 define \co{route_lookup()}, which sequentially searches
+\end{lineref}
+\begin{lineref}[ln:defer:route_seq:lookup_add_del:lookup]
+Lines~\lnref{b}-\lnref{e} define \co{route_lookup()}, which sequentially searches
 \co{route_list}, returning the corresponding \co{->iface}, or
 \co{ULONG_MAX} if there is no such route entry.
-Lines~23-35 define \co{route_add()}, which allocates a
+\end{lineref}
+\begin{lineref}[ln:defer:route_seq:lookup_add_del:add]
+Lines~\lnref{b}-\lnref{e} define \co{route_add()}, which allocates a
 \co{route_entry} structure, initializes it, and adds it to the
 list, returning \co{-ENOMEM} in case of memory-allocation failure.
-Finally, lines~37-50 define \co{route_del()}, which removes and
+\end{lineref}
+\begin{lineref}[ln:defer:route_seq:lookup_add_del:del]
+Finally, lines~\lnref{b}-\lnref{e} define \co{route_del()}, which removes and
 frees the specified \co{route_entry} structure if it exists,
 or returns \co{-ENOENT} otherwise.
+\end{lineref}
 
 This single-threaded implementation serves as a prototype for the various
 concurrent implementations in this chapter, and also as an estimate of
-- 
2.7.4


