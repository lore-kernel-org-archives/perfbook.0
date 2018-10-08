Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kfZuRaYptiDHEZ7RlT7QOx8KqNN8JmoSPEfuJzcnnzY=;
        b=X9iWIgOZszSpHiETDrzZ2cDj3ei9WZ9vK39fDOjG3c/8JcN9siVfYfwr1DNRg7e5LW
         FIfa6rhM2H1vbuuP4LkFFJmrr50JOmIHeGpVVmBdSIj5/Gk4JGyBqHOO9Q00Ze6wPhxd
         eAePAVgoKpZc8M1NKAT72+C/ircUpbQwy/Lx0fuSc1r5MSzK+3zMJzJbcEONE5z2YLMV
         pqmD0cwrcIhnu95LV1suHrf3WfpR+Y7eVYkxMRoeDaDCzSf9420yA8nzkfxTmmbUuGq9
         22g8JXKKODJlyIAoq/mNNSt2hovxHQwMrRdoqLtuR+BzynlBznPEMA/iRoCPfaa3mcS+
         kpJg==
Subject: [PATCH 3/5] count: Tweak counttorture.h to avoid segfault
References: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <811ba000-3792-6ab5-43de-31f1f445136a@gmail.com>
Date: Mon, 8 Oct 2018 10:46:29 +0900
MIME-Version: 1.0
In-Reply-To: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 19fb8b2915e5d918a6c1e98f265ab89bd373fea7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 6 Oct 2018 23:47:44 +0900
Subject: [PATCH 3/5] count: Tweak counttorture.h to avoid segfault

As has been mentioned in comment to count_read(), count_tstat
sometimes fails. The cause is the use of count_read() in
counttorture.h after wait_all_threads() returns. Because __thread
variables are freed when owning threads exit, count_read() would
access nonexistent variables.

As a workaround, add #ifndef KEEP_GCC_THREAD_LOCAL in
counttorture.h and define _wait_all_thread(),
_count_unregister_thread(), and final_wait_all_thread() as macros
which change behavior when KEEP_GCC_THREAD_LOCAL is defined.
They permit counttorture's controlling thread to participate in
the thread group to be kept alive.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_tstat.c  |  3 ++-
 CodeSamples/count/counttorture.h | 21 ++++++++++++++++++---
 count/count.tex                  |  4 ++--
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/CodeSamples/count/count_tstat.c b/CodeSamples/count/count_tstat.c
index 4b99415..d30ee48 100644
--- a/CodeSamples/count/count_tstat.c
+++ b/CodeSamples/count/count_tstat.c
@@ -34,7 +34,7 @@ static __inline__ void inc_count(void)
 }
 
 static __inline__ unsigned long read_count(void)
-                  /* known failure with counttorture! */
+                  /* need to tweak counttorture! */
 {
 	int t;
 	unsigned long sum = 0;
@@ -69,4 +69,5 @@ void count_cleanup(void)
 }
 
 #define NEED_REGISTER_THREAD
+#define KEEP_GCC_THREAD_LOCAL
 #include "counttorture.h"
diff --git a/CodeSamples/count/counttorture.h b/CodeSamples/count/counttorture.h
index bdfc7d4..60d1d11 100644
--- a/CodeSamples/count/counttorture.h
+++ b/CodeSamples/count/counttorture.h
@@ -64,6 +64,20 @@ int goflag __attribute__((__aligned__(CACHE_LINE_SIZE))) = GOFLAG_INIT;
 #define count_unregister_thread(n)	do ; while (0)
 #endif /* #ifndef NEED_REGISTER_THREAD */
 
+#ifndef KEEP_GCC_THREAD_LOCAL
+#define _wait_all_threads() wait_all_threads()
+#define _count_unregister_thread(n) count_unregister_thread(n)
+#define final_wait_all_threads()
+#else  /* #ifndef KEEP_GCC_THREAD_LOCAL */
+#define _wait_all_threads() { \
+	while (READ_ONCE(finalthreadcount) < nthreadsexpected) \
+		poll(NULL, 0, 1);}
+#define _count_unregister_thread(n) count_unregister_thread(n + 1)
+#define final_wait_all_threads() { \
+	WRITE_ONCE(finalthreadcount, nthreadsexpected + 1); \
+	wait_all_threads();}
+#endif /* #ifndef KEEP_GCC_THREAD_LOCAL */
+
 unsigned long garbage = 0; /* disable compiler optimizations. */
 
 /*
@@ -90,7 +104,7 @@ void *count_read_perf_test(void *arg)
 		n_reads_local += COUNT_READ_RUN;
 	}
 	__get_thread_var(n_reads_pt) += n_reads_local;
-	count_unregister_thread(nthreadsexpected);
+	_count_unregister_thread(nthreadsexpected);
 	garbage += j;
 
 	return (NULL);
@@ -113,7 +127,7 @@ void *count_update_perf_test(void *arg)
 		n_updates_local += COUNT_UPDATE_RUN;
 	}
 	__get_thread_var(n_updates_pt) += n_updates_local;
-	count_unregister_thread(nthreadsexpected);
+	_count_unregister_thread(nthreadsexpected);
 	return NULL;
 }
 
@@ -139,7 +153,7 @@ void perftestrun(int nthreads, int nreaders, int nupdaters)
 	smp_mb();
 	goflag = GOFLAG_STOP;
 	smp_mb();
-	wait_all_threads();
+	_wait_all_threads();
 	count_cleanup();
 	for_each_thread(t) {
 		n_reads += per_thread(n_reads_pt, t);
@@ -159,6 +173,7 @@ void perftestrun(int nthreads, int nreaders, int nupdaters)
 	        (double)n_reads),
 	       ((duration * 1000*1000.*(double)nupdaters) /
 	        (double)n_updates));
+	final_wait_all_threads();
 	exit(EXIT_SUCCESS);
 }
 
diff --git a/count/count.tex b/count/count.tex
index a4e9c7f..b008a19 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1127,9 +1127,9 @@ variables vanish when that thread exits.
 	Listing~\ref{lst:count:Per-Thread Statistical Counters With Lockless Summation}
 	(\path{count_tstat.c}).
 	Analysis of this code is left as an exercise to the reader,
-	however, please note that it does not fit well into the
+	however, please note that it requires tweaks in the
 	\path{counttorture.h} counter-evaluation scheme.
-	(Why not?)
+	(Hint: See \co{#ifndef KEEP_GCC_THREAD_LOCAL}.)
 	Chapter~\ref{chp:Deferred Processing} will introduce 
 	synchronization mechanisms that handle this situation in a much
 	more graceful manner.
-- 
2.7.4


