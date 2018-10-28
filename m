Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=6E977E6RTEav6KHMqHqtSXkcjmXDQwkHdHOC50PTwoE=;
 b=NhsIvgg/mkdoiW1Ux+32nx+YQ4iqa99bmvfUdMfTKdvm1LkYtJi/F1OAAohwOCmQW0
 V7TFTGdZvCflaiDUZEUwjNeH7RyVZzfPQTt635Hovzt26uX/B62xfetOLXp3w11hgVCO
 JTENexl3gIEHIgjgC8GauCda6wKQjxZVyKAT8ng46dZj84SkhnQaJ20umlKgvE2WsP2e
 BMsiqstd4aNSZq/6xwpx6sdfuU6KCQYbF/W5kKaEUP7kL15eTy3nqRe0kvT+2QU1zMLy
 SHDJwt/+GuVdgLBiKCTNhzplqKD3NpjjzrS1T6iQz6GHOhW1SM7haCAx72SoTLlfUWhn
 0ZIw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] Let (atomic_)cmpxchg directly return true or false
Date: Sun, 28 Oct 2018 20:30:20 +0800
Message-Id: <1540729820-18343-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.vnet.ibm.com, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

To change the definition of (atomic_)cmpxchg. This patch is for code review
only.

Before the patch:
old/(old+1) (atomic_)cmpxchg(*ptr, old, new)

After the patch:
true/false (atomic_)cmpxchg(*ptr, *old, new)


Signed-off-by: Junchang@T470s <junchangwang@gmail.com>
---
 CodeSamples/advsync/q.c              |  2 +-
 CodeSamples/advsync/singleq.c        |  3 ++-
 CodeSamples/api-pthreads/api-gcc.h   | 12 ++++--------
 CodeSamples/count/count_lim_atomic.c |  8 ++++----
 CodeSamples/defer/rcu64_atomicgp.c   |  2 +-
 CodeSamples/defer/route_refcnt.c     |  2 +-
 6 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/CodeSamples/advsync/q.c b/CodeSamples/advsync/q.c
index 5fade3e..4e8abd3 100644
--- a/CodeSamples/advsync/q.c
+++ b/CodeSamples/advsync/q.c
@@ -51,7 +51,7 @@ struct el *q_pop(struct queue *q)
 			pnext = p->next;
 			if (pnext == NULL)
 				return NULL;
-		} while (cmpxchg(&q->head, p, pnext) != p);
+		} while (!cmpxchg(&q->head, &p, pnext));
 		if (p != &q->dummy)
 			return p;
 		q_push(&q->dummy, q);
diff --git a/CodeSamples/advsync/singleq.c b/CodeSamples/advsync/singleq.c
index 6586561..c56c8d8 100644
--- a/CodeSamples/advsync/singleq.c
+++ b/CodeSamples/advsync/singleq.c
@@ -31,7 +31,8 @@ void init_q(struct queue *qp)

 int q_push(struct el *ep, struct queue *qp)
 {
-	return cmpxchg(&qp->head, NULL, ep) == NULL;
+	void *nil = NULL;
+	return cmpxchg(&qp->head, &nil, ep);
 }

 struct el *q_pop(struct queue *qp)
diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthreads/api-gcc.h
index 3afe340..9cb5998 100644
--- a/CodeSamples/api-pthreads/api-gcc.h
+++ b/CodeSamples/api-pthreads/api-gcc.h
@@ -166,13 +166,11 @@ struct __xchg_dummy {

 #define cmpxchg(ptr, o, n) \
 ({ \
-	typeof(*ptr) _____actual = (o); \
-	\
-	__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
-			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
+	__atomic_compare_exchange_n(ptr, (void *)(o), (n), 1, \
+			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
 })

-static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
+static __inline__ int atomic_cmpxchg(atomic_t *v, int *old, int new)
 {
 	return cmpxchg(&v->counter, old, new);
 }
@@ -197,10 +195,8 @@ static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
 	for (;;) {						\
 		if (unlikely(c == (u)))				\
 			break;					\
-		old = atomic_cmpxchg((v), c, c + (a));		\
-		if (likely(old == c))				\
+		if (likely(atomic_cmpxchg((v), &c, c + (a))))	\
 			break;					\
-		c = old;					\
 	}							\
 	c != (u);						\
 })
diff --git a/CodeSamples/count/count_lim_atomic.c b/CodeSamples/count/count_lim_atomic.c
index 02f4e6d..72bdb65 100644
--- a/CodeSamples/count/count_lim_atomic.c
+++ b/CodeSamples/count/count_lim_atomic.c
@@ -106,8 +106,8 @@ int add_count(unsigned long delta)			//\lnlbl{add:b}
 		if (delta > MAX_COUNTERMAX || c + delta > cm)//\lnlbl{add:check}
 			goto slowpath;			//\lnlbl{add:goto}
 		new = merge_counterandmax(c + delta, cm);//\lnlbl{add:merge}
-	} while (atomic_cmpxchg(&counterandmax,		//\lnlbl{add:atmcmpex}
-	                        old, new) != old);	//\lnlbl{add:loop:e}
+	} while (!atomic_cmpxchg(&counterandmax,	//\lnlbl{add:atmcmpex}
+	                        &old, new));		//\lnlbl{add:loop:e}
 	return 1;					//\lnlbl{add:return:fs}
 slowpath:						//\lnlbl{add:slow:b}
 	spin_lock(&gblcnt_mutex);			//\lnlbl{add:acquire}
@@ -139,8 +139,8 @@ int sub_count(unsigned long delta)			//\lnlbl{sub:b}
 		if (delta > c)
 			goto slowpath;
 		new = merge_counterandmax(c - delta, cm);
-	} while (atomic_cmpxchg(&counterandmax,
-	                        old, new) != old);
+	} while (!atomic_cmpxchg(&counterandmax,
+	                        &old, new));
 	return 1;					//\lnlbl{sub:fast:e}
  slowpath:						//\lnlbl{sub:slow:b}
 	spin_lock(&gblcnt_mutex);
diff --git a/CodeSamples/defer/rcu64_atomicgp.c b/CodeSamples/defer/rcu64_atomicgp.c
index f7cb6ff..923df93 100644
--- a/CodeSamples/defer/rcu64_atomicgp.c
+++ b/CodeSamples/defer/rcu64_atomicgp.c
@@ -39,7 +39,7 @@ void synchronize_rcu(void)
 	 */

 	oldval = rcu_gp_ctr;
-	(void)cmpxchg(&rcu_gp_ctr, oldval, oldval - 1);
+	(void)cmpxchg(&rcu_gp_ctr, &oldval, oldval - 1);
 	smp_mb();

 	/*
diff --git a/CodeSamples/defer/route_refcnt.c b/CodeSamples/defer/route_refcnt.c
index 8a48faf..c202548 100644
--- a/CodeSamples/defer/route_refcnt.c
+++ b/CodeSamples/defer/route_refcnt.c
@@ -68,7 +68,7 @@ retry:
 			if (old <= 0)
 				goto retry;
 			new = old + 1;
-		} while (atomic_cmpxchg(&rep->re_refcnt, old, new) != old);
+		} while (!atomic_cmpxchg(&rep->re_refcnt, &old, new));

 		/* Advance to next. */
 		repp = &rep->re_next;
-- 
2.7.4

