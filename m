Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QZjcJyGrt5JphkcHvO7foZSK4YW6dyym/bvb0+1R9Po=;
        b=p2iGqdHuCN6gg54zcarr63Mb49e2aqhK4XUWJvueRqxicsW8oABRVIw9H2+WACk9b0
         QPm1AFWalO4M6SCWhvtdKSO3ho3cRrAe4dd4h7W2b25wkF4Ll+OIG9ip0pWUvI/XlzZQ
         ZscunZ93I7IKmNQi5vDdqZR+WHaLr62StCotgVTTIaQmzf0SkqgzSHHU8byUt30Q53iK
         xXABbckCNVOq2hMTIrg/hhEOU/aZfq0cHAkAlTAhKrhA7IuZ7NDqEUscEQVbh2TAUly1
         tjV/3kU9WC5QoB5GZL6di8PeOMwSrjrSc/s+h2fruMmAMwYnmFSot7RnFc8mtnTfXWSA
         Mnyw==
Subject: [PATCH 4/4] EXP CodeSamples: Add weak variant of cmpxchg() as
 cmpxchg_weak()
References: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bd89b29d-ddb2-01b1-905b-e52226695295@gmail.com>
Date: Wed, 12 Dec 2018 00:44:13 +0900
MIME-Version: 1.0
In-Reply-To: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>, Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From 61a010b7c34c1b6c05b3883637ccdf2438409408 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 11 Dec 2018 21:14:31 +0900
Subject: [PATCH 4/4] EXP CodeSamples: Add weak variant of cmpxchg() as cmpxchg_weak()

For comparison, add weak (spurious-failure permitting) ones in the
names of cmpxchg_weak() and atomic_cmpxchg_weak().
count_lim_atomic_weak.c is a copy of count_lim_atomic.c but uses
atomic_cmpxchg_weak().

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/api-pthreads/api-gcc.h        |  14 ++
 CodeSamples/count/Makefile                |   4 +
 CodeSamples/count/count_lim_atomic_weak.c | 226 ++++++++++++++++++++++++++++++
 3 files changed, 244 insertions(+)
 create mode 100644 CodeSamples/count/count_lim_atomic_weak.c

diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthreads/api-gcc.h
index b66f4b9..b27facd 100644
--- a/CodeSamples/api-pthreads/api-gcc.h
+++ b/CodeSamples/api-pthreads/api-gcc.h
@@ -178,6 +178,20 @@ static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
 	return cmpxchg(&v->counter, old, new);
 }
 
+#define cmpxchg_weak(ptr, o, n) \
+({ \
+	typeof(*ptr) _____actual = (o); \
+	typeof(*ptr) _____o = _____actual; \
+	\
+	__atomic_compare_exchange_n((ptr), (void *)&_____actual, (n), 1, \
+			__ATOMIC_SEQ_CST, __ATOMIC_RELAXED) ? _____o : _____o+1 ; \
+})
+
+static __inline__ int atomic_cmpxchg_weak(atomic_t *v, int old, int new)
+{
+	return cmpxchg_weak(&v->counter, old, new);
+}
+
 #define xchg(ptr, v) __atomic_exchange_n((ptr), (v), __ATOMIC_SEQ_CST)
 #define atomic_xchg(ptr, v) \
 	__atomic_exchange_n(&(ptr)->counter, (v), __ATOMIC_SEQ_CST)
diff --git a/CodeSamples/count/Makefile b/CodeSamples/count/Makefile
index 481eb3f..52eb466 100644
--- a/CodeSamples/count/Makefile
+++ b/CodeSamples/count/Makefile
@@ -22,6 +22,7 @@ PROGS =	count_atomic \
 	count_lim \
 	count_lim_app \
 	count_lim_atomic \
+	count_lim_atomic_weak \
 	count_lim_sig \
 	count_limd \
 	count_nonatomic \
@@ -65,6 +66,9 @@ count_lim_app: count_lim_app.c ../api.h limtorture.h
 count_lim_atomic: count_lim_atomic.c ../api.h limtorture.h
 	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_lim_atomic count_lim_atomic.c -lpthread
 
+count_lim_atomic_weak: count_lim_atomic_weak.c ../api.h limtorture.h
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_lim_atomic_weak count_lim_atomic_weak.c -lpthread
+
 count_lim_sig: count_lim_sig.c ../api.h limtorture.h
 	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_lim_sig count_lim_sig.c -lpthread
 
diff --git a/CodeSamples/count/count_lim_atomic_weak.c b/CodeSamples/count/count_lim_atomic_weak.c
new file mode 100644
index 0000000..42953f2
--- /dev/null
+++ b/CodeSamples/count/count_lim_atomic_weak.c
@@ -0,0 +1,226 @@
+/*
+ * count_lim_atomic_weak.c: simple limit counter that uses weak variant
+ *	of atomic operations to steal from other threads.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, you can access it online at
+ * http://www.gnu.org/licenses/gpl-2.0.html.
+ *
+ * Copyright (c) 2009 Paul E. McKenney, IBM Corporation.
+ */
+
+#include "../api.h"
+
+static void balance_count(void);
+
+atomic_t __thread counterandmax = ATOMIC_INIT(0);	//\lnlbl{var:candmax}
+unsigned long globalcountmax = 1 << 25;			//\lnlbl{var:def:b}
+unsigned long globalcount = 0;
+unsigned long globalreserve = 0;
+atomic_t *counterp[NR_THREADS] = { NULL };
+DEFINE_SPINLOCK(gblcnt_mutex);				//\lnlbl{var:def:e}
+#define CM_BITS (sizeof(atomic_t) * 4)			//\lnlbl{var:CM_BITS}
+#define MAX_COUNTERMAX ((1 << CM_BITS) - 1)		//\lnlbl{var:MAX_CMAX}
+
+static __inline__ void					//\lnlbl{split_int:b}
+split_counterandmax_int(int cami, int *c, int *cm)
+{
+	*c = (cami >> CM_BITS) & MAX_COUNTERMAX;	//\lnlbl{split_int:msh}
+	*cm = cami & MAX_COUNTERMAX;			//\lnlbl{split_int:lsh}
+}							//\lnlbl{split_int:e}
+
+static __inline__ void					//\lnlbl{split:b}
+split_counterandmax(atomic_t *cam, int *old, int *c, int *cm)//\lnlbl{split:func}
+{
+	unsigned int cami = atomic_read(cam);		//\lnlbl{split:int}
+
+	*old = cami;					//\lnlbl{split:old}
+	split_counterandmax_int(cami, c, cm);		//\lnlbl{split:split_int}
+}							//\lnlbl{split:e}
+
+static __inline__ int merge_counterandmax(int c, int cm)//\lnlbl{merge:b}
+{
+	unsigned int cami;
+
+	cami = (c << CM_BITS) | cm;			//\lnlbl{merge:merge}
+	return ((int)cami);
+}							//\lnlbl{merge:e}
+
+static void globalize_count(void)			//\lnlbl{globalize:b}
+{
+	int c;
+	int cm;
+	int old;
+
+	split_counterandmax(&counterandmax, &old, &c, &cm);//\lnlbl{globalize:split}
+	globalcount += c;
+	globalreserve -= cm;
+	old = merge_counterandmax(0, 0);
+	atomic_set(&counterandmax, old);
+}							//\lnlbl{globalize:e}
+
+static void flush_local_count(void)			//\lnlbl{flush:b}
+{
+	int c;
+	int cm;
+	int old;
+	int t;
+	int zero;
+
+	if (globalreserve == 0)				//\lnlbl{flush:checkrsv}
+		return;					//\lnlbl{flush:return:n}
+	zero = merge_counterandmax(0, 0);		//\lnlbl{flush:initzero}
+	for_each_thread(t)				//\lnlbl{flush:loop:b}
+		if (counterp[t] != NULL) {		//\lnlbl{flush:checkp}
+			old = atomic_xchg(counterp[t], zero);//\lnlbl{flush:atmxchg}
+			split_counterandmax_int(old, &c, &cm);//\lnlbl{flush:split}
+			globalcount += c;		//\lnlbl{flush:glbcnt}
+			globalreserve -= cm;		//\lnlbl{flush:glbrsv}
+		}					//\lnlbl{flush:loop:e}
+}							//\lnlbl{flush:e}
+
+int add_count(unsigned long delta)			//\lnlbl{add:b}
+{
+	int c;
+	int cm;
+	int old;
+	int new;
+
+	do {						//\lnlbl{add:fast:b}
+		split_counterandmax(&counterandmax, &old, &c, &cm);//\lnlbl{add:split}
+		if (delta > MAX_COUNTERMAX || c + delta > cm)//\lnlbl{add:check}
+			goto slowpath;			//\lnlbl{add:goto}
+		new = merge_counterandmax(c + delta, cm);//\lnlbl{add:merge}
+	} while (atomic_cmpxchg_weak(&counterandmax,		//\lnlbl{add:atmcmpex}
+	                        old, new) != old);	//\lnlbl{add:loop:e}
+	return 1;					//\lnlbl{add:return:fs}
+slowpath:						//\lnlbl{add:slow:b}
+	spin_lock(&gblcnt_mutex);			//\lnlbl{add:acquire}
+	globalize_count();				//\lnlbl{add:globalize}
+	if (globalcountmax - globalcount -		//\lnlbl{add:checkglb:b}
+	    globalreserve < delta) {			//\lnlbl{add:checkglb:e}
+		flush_local_count();			//\lnlbl{add:flush}
+		if (globalcountmax - globalcount -	//\lnlbl{add:checkglb:nb}
+		    globalreserve < delta) {		//\lnlbl{add:checkglb:ne}
+			spin_unlock(&gblcnt_mutex);	//\lnlbl{add:release:f}
+			return 0;			//\lnlbl{add:return:sf}
+		}
+	}
+	globalcount += delta;				//\lnlbl{add:addglb}
+	balance_count();				//\lnlbl{add:balance}
+	spin_unlock(&gblcnt_mutex);			//\lnlbl{add:release:s}
+	return 1;					//\lnlbl{add:return:ss}
+}							//\lnlbl{add:e}
+
+int sub_count(unsigned long delta)			//\lnlbl{sub:b}
+{
+	int c;
+	int cm;
+	int old;
+	int new;
+
+	do {						//\lnlbl{sub:fast:b}
+		split_counterandmax(&counterandmax, &old, &c, &cm);
+		if (delta > c)
+			goto slowpath;
+		new = merge_counterandmax(c - delta, cm);
+	} while (atomic_cmpxchg_weak(&counterandmax,
+	                        old, new) != old);
+	return 1;					//\lnlbl{sub:fast:e}
+ slowpath:						//\lnlbl{sub:slow:b}
+	spin_lock(&gblcnt_mutex);
+	globalize_count();
+	if (globalcount < delta) {
+		flush_local_count();
+		if (globalcount < delta) {
+			spin_unlock(&gblcnt_mutex);
+			return 0;
+		}
+	}
+	globalcount -= delta;
+	balance_count();
+	spin_unlock(&gblcnt_mutex);
+	return 1;					//\lnlbl{sub:slow:e}
+}							//\lnlbl{sub:e}
+
+unsigned long read_count(void)				//\lnlbl{b}
+{
+	int c;
+	int cm;
+	int old;
+	int t;
+	unsigned long sum;
+
+	spin_lock(&gblcnt_mutex);			//\lnlbl{acquire}
+	sum = globalcount;				//\lnlbl{initsum}
+	for_each_thread(t)				//\lnlbl{loop:b}
+		if (counterp[t] != NULL) {
+			split_counterandmax(counterp[t], &old, &c, &cm);//\lnlbl{split}
+			sum += c;
+		}					//\lnlbl{loop:e}
+	spin_unlock(&gblcnt_mutex);			//\lnlbl{release}
+	return sum;					//\lnlbl{return}
+}							//\lnlbl{e}
+
+void count_init(void)
+{
+}
+
+static void balance_count(void)				//\lnlbl{balance:b}
+{
+	int c;
+	int cm;
+	int old;
+	unsigned long limit;
+
+	limit = globalcountmax - globalcount -
+	        globalreserve;
+	limit /= num_online_threads();
+	if (limit > MAX_COUNTERMAX)
+		cm = MAX_COUNTERMAX;
+	else
+		cm = limit;
+	globalreserve += cm;
+	c = cm / 2;
+	if (c > globalcount)
+		c = globalcount;
+	globalcount -= c;
+	old = merge_counterandmax(c, cm);
+	atomic_set(&counterandmax, old);		//\lnlbl{balance:atmcset}
+}							//\lnlbl{balance:e}
+
+void count_register_thread(void)			//\lnlbl{register:b}
+{
+	int idx = smp_thread_id();
+
+	spin_lock(&gblcnt_mutex);
+	counterp[idx] = &counterandmax;
+	spin_unlock(&gblcnt_mutex);
+}
+
+void count_unregister_thread(int nthreadsexpected)	//\lnlbl{unregister:b}
+{
+	int idx = smp_thread_id();
+
+	spin_lock(&gblcnt_mutex);
+	globalize_count();
+	counterp[idx] = NULL;
+	spin_unlock(&gblcnt_mutex);
+}
+
+void count_cleanup(void)
+{
+}
+
+#define NEED_REGISTER_THREAD
+#include "limtorture.h"
-- 
2.7.4


