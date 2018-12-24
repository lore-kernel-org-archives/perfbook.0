Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aimcut9i5ppmf6i37LqM/+BRu00gn7yMxKFZ/QxQVX8=;
        b=WiDR6hGHwhziMAYp5TVEuBykFjjbE6WoVFSOyzggAaNdVp/xP+QOp5zOe3WM0pzLhT
         fBQgc8Pv02ZBuGjhgoiYTjaqCSu1N2jzzhsFtXkUL+Bs14t/M7Oi4q3iiQ82URs5KFrO
         5wsyLEtjHUgI/vcvKo6sqvysstUeT4NYmDW4PUAd0+XglyWkuXW1UH6YwoLV/SIKjczl
         86UUrJJZiw5a/mEmhdelUMuZHgfcMV9WFd1gtL/3TQHkjT2K0JQkbL1RZEn22nTkJHPr
         iyisg2Cz/YBtep9ABuQ0vu+ZWjdOuxH1dzv2iqRxwXTZosu9/EFlU1m4QtWuvMl2tOmJ
         lOZA==
Subject: [PATCH 04/11] CodeSamples: Remove redundant \fcvexclude
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8f1b1e5c-0683-9109-b096-2b0cf711b08e@gmail.com>
Date: Mon, 24 Dec 2018 23:57:56 +0900
MIME-Version: 1.0
In-Reply-To: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 426d265864aa5865da6a331493d22996bfddd4a8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 23 Dec 2018 14:50:04 +0900
Subject: [PATCH 04/11] CodeSamples: Remove redundant \fcvexclude

Now that comment blocks are removed in snippets by default,
we can remove redundant \fcvexclude.

Also use "#ifndef FCV_SNIPPET -- #endif" instead of \fcvexclude
where applicable.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/SMPdesign/lockhdeq.c  |  4 ++--
 CodeSamples/SMPdesign/smpalloc.c  |  8 +++++---
 CodeSamples/count/count_end.c     |  8 +++++---
 CodeSamples/count/count_lim.c     |  8 +++++---
 CodeSamples/count/count_tstat.c   |  8 +++++---
 CodeSamples/defer/route_hazptr.c  | 20 ++++++++++----------
 CodeSamples/defer/route_rcu.c     | 25 +++++++++++++------------
 CodeSamples/defer/route_refcnt.c  | 16 ++++++++--------
 CodeSamples/defer/route_seq.c     | 18 +++++++++---------
 CodeSamples/defer/route_seqlock.c | 14 +++++++-------
 CodeSamples/defer/seqlock.h       | 12 +++++++-----
 CodeSamples/locking/locked_list.c |  6 ++++--
 12 files changed, 80 insertions(+), 67 deletions(-)

diff --git a/CodeSamples/SMPdesign/lockhdeq.c b/CodeSamples/SMPdesign/lockhdeq.c
index 64873be..ac5225a 100644
--- a/CodeSamples/SMPdesign/lockhdeq.c
+++ b/CodeSamples/SMPdesign/lockhdeq.c
@@ -133,14 +133,14 @@ void deq_push_r(struct cds_list_head *e, struct deq *p)
 struct pdeq {
 	spinlock_t llock;				//\lnlbl{llock}
 	int lidx;					//\lnlbl{lidx}
-	/* char pad1[CACHE_LINE_SIZE - sizeof(spinlock_t) - sizeof(int)]; */	//\fcvexclude
+	/* char pad1[CACHE_LINE_SIZE - sizeof(spinlock_t) - sizeof(int)]; */
 #ifndef FCV_SNIPPET
 	spinlock_t rlock ____cacheline_internodealigned_in_smp;
 #else /* FCV_SNIPPET */
 	spinlock_t rlock;				//\lnlbl{rlock}
 #endif /* FCV_SNIPPET */
 	int ridx;					//\lnlbl{ridx}
-	/* char pad2[CACHE_LINE_SIZE - sizeof(spinlock_t) - sizeof(int)]; */	//\fcvexclude
+	/* char pad2[CACHE_LINE_SIZE - sizeof(spinlock_t) - sizeof(int)]; */
 	struct deq bkt[PDEQ_N_BKTS];			//\lnlbl{bkt}
 };
 //\end{snippet}
diff --git a/CodeSamples/SMPdesign/smpalloc.c b/CodeSamples/SMPdesign/smpalloc.c
index 72262d6..87678b3 100644
--- a/CodeSamples/SMPdesign/smpalloc.c
+++ b/CodeSamples/SMPdesign/smpalloc.c
@@ -25,9 +25,11 @@
 #define TARGET_POOL_SIZE 3
 #define GLOBAL_POOL_SIZE 40
 
-struct memblock {				//\fcvexclude
-	char *bytes[CACHE_LINE_SIZE];		//\fcvexclude
-} memblocks[GLOBAL_POOL_SIZE];			//\fcvexclude
+#ifndef FCV_SNIPPET
+struct memblock {
+	char *bytes[CACHE_LINE_SIZE];
+} memblocks[GLOBAL_POOL_SIZE];
+#endif /* FCV_SNIPPET */
 						//\fcvexclude
 struct globalmempool {
 	spinlock_t mutex;
diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
index 61f9d81..2ccc0d2 100644
--- a/CodeSamples/count/count_end.c
+++ b/CodeSamples/count/count_end.c
@@ -46,9 +46,11 @@ static __inline__ unsigned long read_count(void)
 	return sum;					//\lnlbl{read:return}
 }
 
-__inline__ void count_init(void)		//\fcvexclude
-{						//\fcvexclude
-}						//\fcvexclude
+#ifndef FCV_SNIPPET
+__inline__ void count_init(void)
+{
+}
+#endif /* FCV_SNIPPET */
 						//\fcvexclude
 void count_register_thread(unsigned long *p)	//\lnlbl{reg:b}
 {
diff --git a/CodeSamples/count/count_lim.c b/CodeSamples/count/count_lim.c
index c207beb..db0219b 100644
--- a/CodeSamples/count/count_lim.c
+++ b/CodeSamples/count/count_lim.c
@@ -107,9 +107,11 @@ static __inline__ void balance_count(void)	//\lnlbl{balance:b}
 	globalcount -= counter;			//\lnlbl{balance:adjglobal}
 }						//\lnlbl{balance:e}
 
-void count_init(void)			//\fcvexclude
-{					//\fcvexclude
-}					//\fcvexclude
+#ifndef FCV_SNIPPET
+void count_init(void)
+{
+}
+#endif /* FCV_SNIPPET */
 					//\fcvexclude
 void count_register_thread(void)	//\lnlbl{register:b}
 {
diff --git a/CodeSamples/count/count_tstat.c b/CodeSamples/count/count_tstat.c
index 00bf957..87eab94 100644
--- a/CodeSamples/count/count_tstat.c
+++ b/CodeSamples/count/count_tstat.c
@@ -45,9 +45,11 @@ static __inline__ unsigned long read_count(void)
 	return sum;
 }
 
-void count_init(void)		//\fcvexclude
-{				//\fcvexclude
-}				//\fcvexclude
+#ifndef FCV_SNIPPET
+void count_init(void)
+{
+}
+#endif /* FCV_SNIPPET */
 				//\fcvexclude
 void count_register_thread(unsigned long *p)
 {
diff --git a/CodeSamples/defer/route_hazptr.c b/CodeSamples/defer/route_hazptr.c
index 0881c51..1d777cf 100644
--- a/CodeSamples/defer/route_hazptr.c
+++ b/CodeSamples/defer/route_hazptr.c
@@ -35,12 +35,12 @@ struct route_entry {
 struct route_entry route_list;
 DEFINE_SPINLOCK(routelock);
 								//\fcvexclude
-/* This thread's fixed-sized set of hazard pointers. */		//\fcvexclude
+/* This thread's fixed-sized set of hazard pointers. */
 hazard_pointer __thread *my_hazptr;
 
-/*								  \fcvexclude
- * Look up a route entry, return the corresponding interface. 	  \fcvexclude
- */								//\fcvexclude
+/*
+ * Look up a route entry, return the corresponding interface.
+ */
 unsigned long route_lookup(unsigned long addr)
 {
 	int offset = 0;
@@ -56,16 +56,16 @@ retry:							//\lnlbl{retry}
 		if (rep == (struct route_entry *)HAZPTR_POISON)	//\lnlbl{acq:b}
 			goto retry; /* element deleted. */
 								//\fcvexclude
-		/* Store a hazard pointer. */			//\fcvexclude
+		/* Store a hazard pointer. */
 		my_hazptr[offset].p = &rep->hh;
 		offset = !offset;
 		smp_mb(); /* Force pointer loads in order. */
 								//\fcvexclude
-		/* Recheck the hazard pointer against the original. */ //\fcvexclude
+		/* Recheck the hazard pointer against the original. */
 		if (READ_ONCE(*repp) != rep)
 			goto retry;			//\lnlbl{acq:e}
 								//\fcvexclude
-		/* Advance to next. */				//\fcvexclude
+		/* Advance to next. */
 		repp = &rep->re_next;
 	} while (rep->addr != addr);
 	if (READ_ONCE(rep->re_freed))
@@ -95,9 +95,9 @@ int route_add(unsigned long addr, unsigned long interface)
 	return 0;
 }
 
-/*								  \fcvexclude
- * Remove the specified element from the route table.		  \fcvexclude
- */								//\fcvexclude
+/*
+ * Remove the specified element from the route table.
+ */
 int route_del(unsigned long addr)
 {
 	struct route_entry *rep;
diff --git a/CodeSamples/defer/route_rcu.c b/CodeSamples/defer/route_rcu.c
index f147848..525b598 100644
--- a/CodeSamples/defer/route_rcu.c
+++ b/CodeSamples/defer/route_rcu.c
@@ -42,16 +42,17 @@ struct route_entry {
 								//\fcvexclude
 CDS_LIST_HEAD(route_list);
 DEFINE_SPINLOCK(routelock);
+#ifndef FCV_SNIPPET
+static void re_free(struct route_entry *rep)
+{
+	WRITE_ONCE(rep->re_freed, 1);
+	free(rep);
+}
+#endif /* FCV_SNIPPET */
 
-static void re_free(struct route_entry *rep)			//\fcvexclude
-{								//\fcvexclude
-	WRITE_ONCE(rep->re_freed, 1);				//\fcvexclude
-	free(rep);						//\fcvexclude
-}								//\fcvexclude
-								//\fcvexclude
-/*								  \fcvexclude
- * Look up a route entry, return the corresponding interface.	  \fcvexclude
- */								//\fcvexclude
+/*
+ * Look up a route entry, return the corresponding interface.
+ */
 unsigned long route_lookup(unsigned long addr)
 {
 	struct route_entry *rep;
@@ -107,9 +108,9 @@ static void route_cb(struct rcu_head *rhp)		//\lnlbl{cb:b}
 #endif /* FCV_SNIPPET */
 }							//\lnlbl{cb:e}
 
-/*								  \fcvexclude
- * Remove the specified element from the route table.		  \fcvexclude
- */								//\fcvexclude
+/*
+ * Remove the specified element from the route table.
+ */
 int route_del(unsigned long addr)
 {
 	struct route_entry *rep;
diff --git a/CodeSamples/defer/route_refcnt.c b/CodeSamples/defer/route_refcnt.c
index 4833919..6f37bd7 100644
--- a/CodeSamples/defer/route_refcnt.c
+++ b/CodeSamples/defer/route_refcnt.c
@@ -40,9 +40,9 @@ static void re_free(struct route_entry *rep)		//\lnlbl{re_free:b}
 	free(rep);
 }							//\lnlbl{re_free:e}
 
-/*								\fcvexclude
- * Look up a route entry, return the corresponding interface. 	\fcvexclude
- */							      //\fcvexclude
+/*
+ * Look up a route entry, return the corresponding interface.
+ */
 unsigned long route_lookup(unsigned long addr)
 {
 	int old;
@@ -61,7 +61,7 @@ retry:
 		if (rep == NULL)				//\lnlbl{lookup:check_NULL}
 			return ULONG_MAX;
 								//\fcvexclude
-		/* Acquire a reference if the count is non-zero. */ //\fcvexclude
+		/* Acquire a reference if the count is non-zero. */
 		do {						//\lnlbl{lookup:acq:b}
 			if (READ_ONCE(rep->re_freed))		//\lnlbl{lookup:check_uaf}
 				abort();			//\lnlbl{lookup:abort}
@@ -72,7 +72,7 @@ retry:
 		} while (atomic_cmpxchg(&rep->re_refcnt,
 		                        old, new) != old);	//\lnlbl{lookup:acq:e}
 								//\fcvexclude
-		/* Advance to next. */				//\fcvexclude
+		/* Advance to next. */
 		repp = &rep->re_next;
 	} while (rep->addr != addr);
 	ret = rep->iface;
@@ -104,9 +104,9 @@ int route_add(unsigned long addr, unsigned long interface)
 	return 0;
 }
 
-/*								\fcvexclude
- * Remove the specified element from the route table.		\fcvexclude
- */							      //\fcvexclude
+/*
+ * Remove the specified element from the route table.
+ */
 int route_del(unsigned long addr)
 {
 	struct route_entry *rep;
diff --git a/CodeSamples/defer/route_seq.c b/CodeSamples/defer/route_seq.c
index 535ed09..cc84e6a 100644
--- a/CodeSamples/defer/route_seq.c
+++ b/CodeSamples/defer/route_seq.c
@@ -32,9 +32,9 @@ struct route_entry {					//\lnlbl{entry:b}
 							//\fcvexclude
 CDS_LIST_HEAD(route_list);				//\lnlbl{entry:header}
 
-/*								\fcvexclude
- * Look up a route entry, return the corresponding interface. 	\fcvexclude
- */							      //\fcvexclude
+/*
+ * Look up a route entry, return the corresponding interface.
+ */
 unsigned long route_lookup(unsigned long addr)		//\lnlbl{lookup:b}
 {
 	struct route_entry *rep;
@@ -49,9 +49,9 @@ unsigned long route_lookup(unsigned long addr)		//\lnlbl{lookup:b}
 	return ULONG_MAX;
 }							//\lnlbl{lookup:e}
 
-/*								\fcvexclude
- * Add an element to the route table.				\fcvexclude
- */							      //\fcvexclude
+/*
+ * Add an element to the route table.
+ */
 int route_add(unsigned long addr, unsigned long interface)//\lnlbl{add:b}
 {
 	struct route_entry *rep;
@@ -65,9 +65,9 @@ int route_add(unsigned long addr, unsigned long interface)//\lnlbl{add:b}
 	return 0;
 }							//\lnlbl{add:e}
 
-/*								\fcvexclude
- * Remove the specified element from the route table.		\fcvexclude
- */							      //\fcvexclude
+/*
+ * Remove the specified element from the route table.
+ */
 int route_del(unsigned long addr)			//\lnlbl{del:b}
 {
 	struct route_entry *rep;
diff --git a/CodeSamples/defer/route_seqlock.c b/CodeSamples/defer/route_seqlock.c
index e87cdb1..dfdc99f 100644
--- a/CodeSamples/defer/route_seqlock.c
+++ b/CodeSamples/defer/route_seqlock.c
@@ -34,9 +34,9 @@ struct route_entry {
 struct route_entry route_list;
 DEFINE_SEQ_LOCK(sl);					//\lnlbl{struct:sl}
 
-/*								  \fcvexclude
- * Look up a route entry, return the corresponding interface. 	  \fcvexclude
- */								//\fcvexclude
+/*
+ * Look up a route entry, return the corresponding interface.
+ */
 unsigned long route_lookup(unsigned long addr)
 {
 	struct route_entry *rep;
@@ -55,7 +55,7 @@ retry:							//\lnlbl{lookup:retry}
 			return ULONG_MAX;
 		}
 								//\fcvexclude
-		/* Advance to next. */				//\fcvexclude
+		/* Advance to next. */
 		repp = &rep->re_next;
 	} while (rep->addr != addr);
 	if (READ_ONCE(rep->re_freed))			//\lnlbl{lookup:chk_freed}
@@ -88,9 +88,9 @@ int route_add(unsigned long addr, unsigned long interface)
 	return 0;
 }
 
-/*								  \fcvexclude
- * Remove the specified element from the route table.		  \fcvexclude
- */								//\fcvexclude
+/*
+ * Remove the specified element from the route table.
+ */
 int route_del(unsigned long addr)
 {
 	struct route_entry *rep;
diff --git a/CodeSamples/defer/seqlock.h b/CodeSamples/defer/seqlock.h
index 16165d0..d8bccc3 100644
--- a/CodeSamples/defer/seqlock.h
+++ b/CodeSamples/defer/seqlock.h
@@ -24,11 +24,13 @@ typedef struct {				//\lnlbl{typedef:b}
 	spinlock_t lock;
 } seqlock_t;					//\lnlbl{typedef:e}
 
-#define DEFINE_SEQ_LOCK(name) seqlock_t name = { 	/* \fcvexclude */ \
-	.seq = 0,					/* \fcvexclude */ \
-	.lock = __SPIN_LOCK_UNLOCKED(name.lock),	/* \fcvexclude */ \
-};							/* \fcvexclude */
-							/* \fcvexclude */
+#ifndef FCV_SNIPPET
+#define DEFINE_SEQ_LOCK(name) seqlock_t name = { \
+	.seq = 0,                                \
+	.lock = __SPIN_LOCK_UNLOCKED(name.lock), \
+};
+#endif /* FCV_SNIPPET */
+							//\fcvexclude
 static inline void seqlock_init(seqlock_t *slp)		//\lnlbl{init:b}
 {
 	slp->seq = 0;
diff --git a/CodeSamples/locking/locked_list.c b/CodeSamples/locking/locked_list.c
index 0580b09..a8018de 100644
--- a/CodeSamples/locking/locked_list.c
+++ b/CodeSamples/locking/locked_list.c
@@ -26,8 +26,10 @@ struct locked_list {
 	struct cds_list_head h;
 };
 
-struct cds_list_head *list_next(struct locked_list *lp,		//\fcvexclude
-				struct cds_list_head *np);	//\fcvexclude
+#ifndef FCV_SNIPPET
+struct cds_list_head *list_next(struct locked_list *lp,
+				struct cds_list_head *np);
+#endif /* FCV_SNIPPET */
 								//\fcvexclude
 struct cds_list_head *list_start(struct locked_list *lp)
 {
-- 
2.7.4


