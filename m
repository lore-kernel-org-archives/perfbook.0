Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VmSXP68lSYeaGj1LkQH+hutrakEhLqj1aTZMg7wdpSI=;
        b=Ex5jgUDvjvc6hIEz6pY1V6AAHvEakmrcth+EKo/v25bCBisrTkm9vorvU4XMgNa1L9
         xtKPO8b1TSziTYllNk9ixdg+p9E1z+fSx5Fl1pq2bJyd+e2B52DSlu+hPLJEke9Y3eZS
         HmOTGcDlAIJXjzC+aKxCdob2jer9Sx263D8Cfvq/tpS27mVboszvifgm8sZ4epUb7YlO
         AGLG7JuAS4iyzEpH24WGntpjh+ZaXUZMAmaPIdrU7oEFHJKkw0hi593mMx0q6KCcORFT
         9OA7yoZ3/GTG5hgx53mJRf6qtlZNzwSsqzqAgQ0oHw/bZKvdfMjLK7sceEYRrGddZCsI
         4U6A==
Subject: [PATCH 1/5] count: Employ new scheme for snippet of count_end and
 count_tstat
References: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c9d65757-6079-798c-208e-e0cae7916d53@gmail.com>
Date: Mon, 8 Oct 2018 10:42:20 +0900
MIME-Version: 1.0
In-Reply-To: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From eca7914e5161de426bb04a623e9586bae89d8a73 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 6 Oct 2018 18:49:11 +0900
Subject: [PATCH 1/5] count: Employ new scheme for snippet of count_end and count_tstat

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_end.c   |  50 ++++++++-------
 CodeSamples/count/count_tstat.c |  15 +++--
 count/count.tex                 | 139 ++++++++++------------------------------
 3 files changed, 68 insertions(+), 136 deletions(-)

diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
index 00335f2..94b9273 100644
--- a/CodeSamples/count/count_end.c
+++ b/CodeSamples/count/count_end.c
@@ -21,53 +21,55 @@
 
 #include "../api.h"
 
-unsigned long __thread counter = 0;
+//\begin{snippet}[labelbase=ln:count:count_end:whole,commandchars=\\\@\$]
+unsigned long __thread counter = 0;		//\lnlbl{var:b}
 unsigned long *counterp[NR_THREADS] = { NULL };
 unsigned long finalcount = 0;
-DEFINE_SPINLOCK(final_mutex);
+DEFINE_SPINLOCK(final_mutex);			//\lnlbl{var:e}
 
-__inline__ void inc_count(void)
+static __inline__ void inc_count(void)		//\lnlbl{inc:b}
 {
 	WRITE_ONCE(counter,
 		   READ_ONCE(counter) + 1);
-}
+}						//\lnlbl{inc:e}
 
-unsigned long read_count(void)
+static __inline__ unsigned long read_count(void)
 {
 	int t;
 	unsigned long sum;
 
-	spin_lock(&final_mutex);
-	sum = finalcount;
-	for_each_thread(t)
-		if (counterp[t] != NULL)
-			sum += *counterp[t];
-	spin_unlock(&final_mutex);
-	return sum;
-}
-
-__inline__ void count_init(void)
-{
+	spin_lock(&final_mutex);			//\lnlbl{read:acquire}
+	sum = finalcount;				//\lnlbl{read:sum:init}
+	for_each_thread(t)				//\lnlbl{read:loop:b}
+		if (counterp[t] != NULL)		//\lnlbl{read:check}
+			sum += *counterp[t];		//\lnlbl{read:loop:e}
+	spin_unlock(&final_mutex);			//\lnlbl{read:release}
+	return sum;					//\lnlbl{read:return}
 }
 
-void count_register_thread(unsigned long *p)
+__inline__ void count_init(void)		//\fcvexclude
+{						//\fcvexclude
+}						//\fcvexclude
+						//\fcvexclude
+void count_register_thread(unsigned long *p)	//\lnlbl{reg:b}
 {
 	int idx = smp_thread_id();
 
 	spin_lock(&final_mutex);
 	counterp[idx] = &counter;
 	spin_unlock(&final_mutex);
-}
+}						//\lnlbl{reg:e}
 
-void count_unregister_thread(int nthreadsexpected)
+void count_unregister_thread(int nthreadsexpected)	//\lnlbl{unreg:b}
 {
 	int idx = smp_thread_id();
 
-	spin_lock(&final_mutex);
-	finalcount += counter;
-	counterp[idx] = NULL;
-	spin_unlock(&final_mutex);
-}
+	spin_lock(&final_mutex);			//\lnlbl{unreg:acquire}
+	finalcount += counter;				//\lnlbl{unreg:add}
+	counterp[idx] = NULL;				//\lnlbl{unreg:NULL}
+	spin_unlock(&final_mutex);			//\lnlbl{unreg:release}
+}							//\lnlbl{unreg:e}
+//\end{snippet}
 
 __inline__ void count_cleanup(void)
 {
diff --git a/CodeSamples/count/count_tstat.c b/CodeSamples/count/count_tstat.c
index 59e4025..4318bc3 100644
--- a/CodeSamples/count/count_tstat.c
+++ b/CodeSamples/count/count_tstat.c
@@ -22,18 +22,20 @@
 
 #include "../api.h"
 
+//\begin{snippet}[labelbase=ln:count:count_tstat:whole,commandchars=\\\@\$]
 unsigned long __thread counter = 0;
 unsigned long *counterp[NR_THREADS] = { NULL };
 int finalthreadcount = 0;
 DEFINE_SPINLOCK(final_mutex);
 
-void inc_count(void)
+static __inline__ void inc_count(void)
 {
 	WRITE_ONCE(counter,
 		   READ_ONCE(counter) + 1);
 }
 
-unsigned long read_count(void)  /* known failure with counttorture! */
+static __inline__ unsigned long read_count(void)
+                  /* known failure with counttorture! */
 {
 	int t;
 	unsigned long sum = 0;
@@ -44,10 +46,10 @@ unsigned long read_count(void)  /* known failure with counttorture! */
 	return sum;
 }
 
-void count_init(void)
-{
-}
-
+void count_init(void)		//\fcvexclude
+{				//\fcvexclude
+}				//\fcvexclude
+				//\fcvexclude
 void count_register_thread(unsigned long *p)
 {
 	counterp[smp_thread_id()] = &counter;
@@ -61,6 +63,7 @@ void count_unregister_thread(int nthreadsexpected)
 	while (finalthreadcount < nthreadsexpected)
 		poll(NULL, 0, 1);
 }
+//\end{snippet}
 
 void count_cleanup(void)
 {
diff --git a/count/count.tex b/count/count.tex
index aea7b93..a4e9c7f 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -930,55 +930,7 @@ comes at the cost of the additional thread running \co{eventual()}.
 \label{sec:count:Per-Thread-Variable-Based Implementation}
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
-  1 long __thread counter = 0;
-  2 long *counterp[NR_THREADS] = { NULL };
-  3 long finalcount = 0;
-  4 DEFINE_SPINLOCK(final_mutex);
-  5 
-  6 void inc_count(void)
-  7 {
-  8   WRITE_ONCE(counter,
-  9              READ_ONCE(counter) + 1);counter++;
- 10 }
- 11 
- 12 long read_count(void)
- 13 {
- 14   int t;
- 15   long sum;
- 16 
- 17   spin_lock(&final_mutex);
- 18   sum = finalcount;
- 19   for_each_thread(t)
- 20     if (counterp[t] != NULL)
- 21       sum += *counterp[t];
- 22   spin_unlock(&final_mutex);
- 23   return sum;
- 24 }
- 25 
- 26 void count_register_thread(void)
- 27 {
- 28   int idx = smp_thread_id();
- 29 
- 30   spin_lock(&final_mutex);
- 31   counterp[idx] = &counter;
- 32   spin_unlock(&final_mutex);
- 33 }
- 34 
- 35 void count_unregister_thread(int nthreadsexpected)
- 36 {
- 37   int idx = smp_thread_id();
- 38 
- 39   spin_lock(&final_mutex);
- 40   finalcount += counter;
- 41   counterp[idx] = NULL;
- 42   spin_unlock(&final_mutex);
- 43 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_end@whole.fcv}
 \caption{Per-Thread Statistical Counters}
 \label{lst:count:Per-Thread Statistical Counters}
 \end{listing}
@@ -992,11 +944,14 @@ a statistical counter that not only scales, but that also incurs little
 or no performance penalty to incrementers compared to simple non-atomic
 increment.
 
-Lines~1-4 define needed variables: \co{counter} is the per-thread counter
+\begin{lineref}[ln:count:count_end:whole]
+Lines~\lnref{var:b}-\lnref{var:e} define needed variables:
+\co{counter} is the per-thread counter
 variable, the \co{counterp[]} array allows threads to access each others'
 counters, \co{finalcount} accumulates the total as individual threads exit,
 and \co{final_mutex} coordinates between threads accumulating the total
 value of the counter and exiting threads.
+\end{lineref}
 
 \QuickQuiz{}
 	Why do we need an explicit array to find the other threads'
@@ -1041,24 +996,31 @@ value of the counter and exiting threads.
 	that it will someday appear.
 } \QuickQuizEnd
 
+\begin{lineref}[ln:count:count_end:whole:inc]
 The \co{inc_count()} function used by updaters is quite simple, as can
-be seen on lines~6-10.
+be seen on lines~\lnref{b}-\lnref{e}.
+\end{lineref}
 
+\begin{lineref}[ln:count:count_end:whole:read]
 The \co{read_count()} function used by readers is a bit more complex.
-Line~17 acquires a lock to exclude exiting threads, and line~22 releases
-it.
-Line~18 initializes the sum to the count accumulated by those threads that
-have already exited, and lines~19-21 sum the counts being accumulated
+Line~\lnref{acquire} acquires a lock to exclude exiting threads, and
+line~\lnref{release} releases it.
+Line~\lnref{sum:init} initializes the sum to the count accumulated by those threads that
+have already exited, and
+lines~\lnref{loop:b}-\lnref{loop:e} sum the counts being accumulated
 by threads currently running.
-Finally, line~23 returns the sum.
+Finally, line~\lnref{return} returns the sum.
+\end{lineref}
 
 \QuickQuiz{}
-	Doesn't the check for \co{NULL} on line~20 of
+	\begin{lineref}[ln:count:count_end:whole:read]
+	Doesn't the check for \co{NULL} on line~\lnref{check} of
 	Listing~\ref{lst:count:Per-Thread Statistical Counters}
 	add extra branch mispredictions?
 	Why not have a variable set permanently to zero, and point
 	unused counter-pointers to that variable rather than setting
 	them to \co{NULL}?
+	\end{lineref}
 \QuickQuizAnswer{
 	This is a reasonable strategy.
 	Checking for the performance difference is left as an exercise
@@ -1093,10 +1055,13 @@ Finally, line~23 returns the sum.
 	\co{inc_count()} fastpath.
 } \QuickQuizEnd
 
-Lines~26-33 show the \co{count_register_thread()} function, which
+\begin{lineref}[ln:count:count_end:whole:reg]
+Lines~\lnref{b}-\lnref{e} show the \co{count_register_thread()}
+function, which
 must be called by each thread before its first use of this counter.
 This function simply sets up this thread's element of the \co{counterp[]}
 array to point to its per-thread \co{counter} variable.
+\end{lineref}
 
 \QuickQuiz{}
 	Why on earth do we need to acquire the lock in
@@ -1114,18 +1079,23 @@ array to point to its per-thread \co{counter} variable.
 	a hundred or so CPUs, there is no need to get fancy.
 } \QuickQuizEnd
 
-Lines~35-43 show the \co{count_unregister_thread()} function, which
+\begin{lineref}[ln:count:count_end:whole:unreg]
+Lines~\lnref{b}-\lnref{e} show the \co{count_unregister_thread()}
+function, which
 must be called prior to exit by each thread that previously called
 \co{count_register_thread()}.
-Line~39 acquires the lock, and line~42 releases it, thus excluding any
+Line~\lnref{acquire} acquires the lock, and
+line~\lnref{release} releases it, thus excluding any
 calls to \co{read_count()} as well as other calls to
 \co{count_unregister_thread()}.
-Line~40 adds this thread's \co{counter} to the global \co{finalcount},
-and then line~41 \co{NULL}s out its \co{counterp[]} array entry.
+Line~\lnref{add} adds this thread's \co{counter} to the global
+\co{finalcount},
+and then line~\lnref{NULL} \co{NULL}s out its \co{counterp[]} array entry.
 A subsequent call to \co{read_count()} will see the exiting thread's
 count in the global \co{finalcount}, and will skip the exiting thread
 when sequencing through the \co{counterp[]} array, thus obtaining
 the correct total.
+\end{lineref}
 
 This approach gives updaters almost exactly the same performance as
 a non-atomic add, and also scales linearly.
@@ -1147,50 +1117,7 @@ variables vanish when that thread exits.
 	if the corresponding CPU never existed and never will exist.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
-  1 long __thread counter = 0;
-  2 long *counterp[NR_THREADS] = { NULL };
-  3 int finalthreadcount = 0;
-  4 DEFINE_SPINLOCK(final_mutex);
-  5 
-  6 void inc_count(void)
-  7 {
-  8   counter++;
-  9 }
- 10 
- 11 long read_count(void)
- 12 {
- 13   int t;
- 14   long sum = 0;
- 15 
- 16   for_each_thread(t)
- 17     if (counterp[t] != NULL)
- 18       sum += *counterp[t];
- 19   return sum;
- 20 }
- 21 
- 22 void count_init(void)
- 23 {
- 24 }
- 25 
- 26 void count_register_thread(void)
- 27 {
- 28   counterp[smp_thread_id()] = &counter;
- 29 }
- 30 
- 31 void count_unregister_thread(int nthreadsexpected)
- 32 {
- 33   spin_lock(&final_mutex);
- 34   finalthreadcount++;
- 35   spin_unlock(&final_mutex);
- 36   while (finalthreadcount < nthreadsexpected)
- 37     poll(NULL, 0, 1);
- 38 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_tstat@whole.fcv}
 \caption{Per-Thread Statistical Counters With Lockless Summation}
 \label{lst:count:Per-Thread Statistical Counters With Lockless Summation}
 \end{listing}
-- 
2.7.4


