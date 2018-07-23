Return-Path: <imrep.amz@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8gCNqfiTIWbmfLY4tVv0aPvvWspeX3tE1a49t0pao7Q=;
 b=vbFQRM9LY7gJDgYR/eusYb2MbtRn/rdjqrtG8KyM9D3wqM/cHDe1LO6u3HC1iIzFO8
 cenVC9Nw69SQS4dc3H5U1gjmwx/j8yfzQOMCSdeaDS79Asr3m1HK7jp6kQwVlMan/7YW
 rFLZp5vDQsK5EdH0UUoiDpBOBM7hrEH6KDk24JZ9CIQIe0ouGwtKsyoj01+2kTqlHcEa
 HHmr3G3thvj/CkLz1jLPKGAqvwnFz+Jl6ZyUe3ga+bZbV8zVBkInuEa60K1WSKuzIZHB
 Q6m+YMnosyZnP2yuXg+E7n9wVHSE6bhe+b6ZKBRjUPASMBMB9ITWytyoTKO7TkuI4X2v
 om2g==
From: Imre Palik <imrep.amz@gmail.com>
Subject: [PATCH 2/4] Making the counter implementations safer
Date: Mon, 23 Jul 2018 22:07:26 +0200
Message-Id: <1532376448-15103-3-git-send-email-imrep.amz@gmail.com>
In-Reply-To: <1532376448-15103-1-git-send-email-imrep.amz@gmail.com>
References: <1532376448-15103-1-git-send-email-imrep.amz@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, "Palik, Imre" <imrep.amz@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: "Palik, Imre" <imrep.amz@gmail.com>

Relevant parts of some of the counter implementations were prone to be optimised
out by an overly eager compiler/linker.

This patch makes the compiler's task easier, by declaring big parts of the
implementation inline.  Then proceeds to fix the issue.

Some barriers from the countertorture framework also got removed, as a proper
multithreaded implementation should provide its own ordering guarantees.

Signed-off-by: Imre Palik <imrep.amz@gmail.com>
---
 CodeSamples/count/Makefile              | 30 ++++++++++++++++--------------
 CodeSamples/count/count_atomic.c        |  6 +++---
 CodeSamples/count/count_end.c           |  9 +++++----
 CodeSamples/count/count_end_rcu.c       |  7 ++++---
 CodeSamples/count/count_nonatomic.c     |  8 ++++----
 CodeSamples/count/count_stack.c         |  9 +++++----
 CodeSamples/count/count_stat.c          |  6 +++---
 CodeSamples/count/count_stat_atomic.c   |  6 +++---
 CodeSamples/count/count_stat_eventual.c |  2 +-
 CodeSamples/count/count_tstat.c         |  3 ++-
 CodeSamples/count/counttorture.h        |  2 --
 11 files changed, 46 insertions(+), 42 deletions(-)

diff --git a/CodeSamples/count/Makefile b/CodeSamples/count/Makefile
index eacdb57..481eb3f 100644
--- a/CodeSamples/count/Makefile
+++ b/CodeSamples/count/Makefile
@@ -43,49 +43,51 @@ else
 all: $(PROGS)
 endif

+CC?=cc
+
 include $(top)/recipes.mk

 count_atomic: count_atomic.c ../api.h counttorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_atomic count_atomic.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_atomic count_atomic.c -lpthread

 count_end: count_end.c ../api.h counttorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_end count_end.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_end count_end.c -lpthread

 count_end_rcu: count_end_rcu.c ../api.h counttorture.h $(RCU_SRCS)
-	cc $(GCC_ARGS) $(CFLAGS) -o count_end_rcu count_end_rcu.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_end_rcu count_end_rcu.c -lpthread

 count_lim: count_lim.c ../api.h limtorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_lim count_lim.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_lim count_lim.c -lpthread

 count_lim_app: count_lim_app.c ../api.h limtorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_lim_app count_lim_app.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_lim_app count_lim_app.c -lpthread

 count_lim_atomic: count_lim_atomic.c ../api.h limtorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_lim_atomic count_lim_atomic.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_lim_atomic count_lim_atomic.c -lpthread

 count_lim_sig: count_lim_sig.c ../api.h limtorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_lim_sig count_lim_sig.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_lim_sig count_lim_sig.c -lpthread

 count_limd: count_limd.c ../api.h limtorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_limd count_limd.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_limd count_limd.c -lpthread

 count_nonatomic: count_nonatomic.c ../api.h counttorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_nonatomic count_nonatomic.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_nonatomic count_nonatomic.c -lpthread

 count_stack: count_stack.c ../api.h counttorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_stack count_stack.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_stack count_stack.c -lpthread

 count_stat: count_stat.c ../api.h counttorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_stat count_stat.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_stat count_stat.c -lpthread

 count_stat_atomic: count_stat_atomic.c ../api.h counttorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_stat_atomic count_stat_atomic.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_stat_atomic count_stat_atomic.c -lpthread

 count_stat_eventual: count_stat_eventual.c ../api.h counttorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_stat_eventual count_stat_eventual.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_stat_eventual count_stat_eventual.c -lpthread

 count_tstat: count_tstat.c ../api.h counttorture.h
-	cc $(GCC_ARGS) $(CFLAGS) -o count_tstat count_tstat.c -lpthread
+	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_tstat count_tstat.c -lpthread

 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/count/count_atomic.c b/CodeSamples/count/count_atomic.c
index 0457aa1..fc73717 100644
--- a/CodeSamples/count/count_atomic.c
+++ b/CodeSamples/count/count_atomic.c
@@ -27,16 +27,16 @@ void inc_count(void)
 	atomic_inc(&counter);
 }

-long read_count(void)
+__inline__ long read_count(void)
 {
 	return atomic_read(&counter);
 }

-void count_init(void)
+__inline__ void count_init(void)
 {
 }

-void count_cleanup(void)
+__inline__ void count_cleanup(void)
 {
 }

diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
index a39c0c9..00335f2 100644
--- a/CodeSamples/count/count_end.c
+++ b/CodeSamples/count/count_end.c
@@ -26,9 +26,10 @@ unsigned long *counterp[NR_THREADS] = { NULL };
 unsigned long finalcount = 0;
 DEFINE_SPINLOCK(final_mutex);

-void inc_count(void)
+__inline__ void inc_count(void)
 {
-	counter++;
+	WRITE_ONCE(counter,
+		   READ_ONCE(counter) + 1);
 }

 unsigned long read_count(void)
@@ -45,7 +46,7 @@ unsigned long read_count(void)
 	return sum;
 }

-void count_init(void)
+__inline__ void count_init(void)
 {
 }

@@ -68,7 +69,7 @@ void count_unregister_thread(int nthreadsexpected)
 	spin_unlock(&final_mutex);
 }

-void count_cleanup(void)
+__inline__ void count_cleanup(void)
 {
 }

diff --git a/CodeSamples/count/count_end_rcu.c b/CodeSamples/count/count_end_rcu.c
index e6614b9..ca0a392 100644
--- a/CodeSamples/count/count_end_rcu.c
+++ b/CodeSamples/count/count_end_rcu.c
@@ -32,9 +32,10 @@ unsigned long __thread counter = 0;
 struct countarray *countarrayp = NULL;
 DEFINE_SPINLOCK(final_mutex);

-void inc_count(void)
+__inline__ void inc_count(void)
 {
-	counter++;
+	WRITE_ONCE(counter,
+		   READ_ONCE(counter) + 1);
 }

 unsigned long read_count(void)
@@ -94,7 +95,7 @@ void count_unregister_thread(int nthreadsexpected)
 	free(capold);
 }

-void count_cleanup(void)
+__inline__ void count_cleanup(void)
 {
 }

diff --git a/CodeSamples/count/count_nonatomic.c b/CodeSamples/count/count_nonatomic.c
index 868b0fe..90979c5 100644
--- a/CodeSamples/count/count_nonatomic.c
+++ b/CodeSamples/count/count_nonatomic.c
@@ -23,21 +23,21 @@

 unsigned long counter = 0;

-void inc_count(void)
+__inline__ void inc_count(void)
 {
 	counter++;
 }

-unsigned long read_count(void)
+__inline__ unsigned long read_count(void)
 {
 	return counter;
 }

-void count_init(void)
+__inline__ void count_init(void)
 {
 }

-void count_cleanup(void)
+__inline__ void count_cleanup(void)
 {
 }

diff --git a/CodeSamples/count/count_stack.c b/CodeSamples/count/count_stack.c
index aa6185d..975db48 100644
--- a/CodeSamples/count/count_stack.c
+++ b/CodeSamples/count/count_stack.c
@@ -26,9 +26,10 @@ unsigned long *counterp[NR_THREADS] = { NULL };
 unsigned long finalcount = 0;
 DEFINE_SPINLOCK(final_mutex);

-void inc_count(void)
+__inline__ void inc_count(void)
 {
-	(*counter)++;
+	WRITE_ONCE(*counter,
+		   READ_ONCE(*counter) + 1);
 }

 unsigned long read_count(void)
@@ -45,7 +46,7 @@ unsigned long read_count(void)
 	return sum;
 }

-void count_init(void)
+__inline__ void count_init(void)
 {
 }

@@ -69,7 +70,7 @@ void count_unregister_thread(int nthreadsexpected)
 	spin_unlock(&final_mutex);
 }

-void count_cleanup(void)
+__inline__ void count_cleanup(void)
 {
 }

diff --git a/CodeSamples/count/count_stat.c b/CodeSamples/count/count_stat.c
index b483022..1d72f99 100644
--- a/CodeSamples/count/count_stat.c
+++ b/CodeSamples/count/count_stat.c
@@ -27,7 +27,7 @@ void inc_count(void)
 	__get_thread_var(counter)++;
 }

-unsigned long read_count(void)
+__inline__ unsigned long read_count(void)
 {
 	int t;
 	unsigned long sum = 0;
@@ -37,11 +37,11 @@ unsigned long read_count(void)
 	return sum;
 }

-void count_init(void)
+__inline__ void count_init(void)
 {
 }

-void count_cleanup(void)
+__inline__ void count_cleanup(void)
 {
 }

diff --git a/CodeSamples/count/count_stat_atomic.c b/CodeSamples/count/count_stat_atomic.c
index 732ab6d..d1ff10b 100644
--- a/CodeSamples/count/count_stat_atomic.c
+++ b/CodeSamples/count/count_stat_atomic.c
@@ -27,7 +27,7 @@ void inc_count(void)
 	atomic_inc(&__get_thread_var(counter));
 }

-unsigned long read_count(void)
+__inline__ unsigned long read_count(void)
 {
 	int t;
 	unsigned long sum = 0;
@@ -37,11 +37,11 @@ unsigned long read_count(void)
 	return sum;
 }

-void count_init(void)
+__inline__ void count_init(void)
 {
 }

-void count_cleanup(void)
+__inline__ void count_cleanup(void)
 {
 }

diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 2b23dbd..324bc24 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -31,7 +31,7 @@ void inc_count(void)
 		   READ_ONCE(__get_thread_var(counter)) + 1);
 }

-unsigned long read_count(void)
+__inline__ unsigned long read_count(void)
 {
 	return READ_ONCE(global_count);
 }
diff --git a/CodeSamples/count/count_tstat.c b/CodeSamples/count/count_tstat.c
index 1fa4e52..59e4025 100644
--- a/CodeSamples/count/count_tstat.c
+++ b/CodeSamples/count/count_tstat.c
@@ -29,7 +29,8 @@ DEFINE_SPINLOCK(final_mutex);

 void inc_count(void)
 {
-	counter++;
+	WRITE_ONCE(counter,
+		   READ_ONCE(counter) + 1);
 }

 unsigned long read_count(void)  /* known failure with counttorture! */
diff --git a/CodeSamples/count/counttorture.h b/CodeSamples/count/counttorture.h
index ff0dd72..bdfc7d4 100644
--- a/CodeSamples/count/counttorture.h
+++ b/CodeSamples/count/counttorture.h
@@ -86,7 +86,6 @@ void *count_read_perf_test(void *arg)
 	while (READ_ONCE(goflag) == GOFLAG_RUN) {
 		for (i = COUNT_READ_RUN; i > 0; i--) {
 			j += read_count();
-			barrier();
 		}
 		n_reads_local += COUNT_READ_RUN;
 	}
@@ -110,7 +109,6 @@ void *count_update_perf_test(void *arg)
 	while (READ_ONCE(goflag) == GOFLAG_RUN) {
 		for (i = COUNT_UPDATE_RUN; i > 0; i--) {
 			inc_count();
-			barrier();
 		}
 		n_updates_local += COUNT_UPDATE_RUN;
 	}
-- 
2.7.4

