Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dr+A/XU++nrWvGP1HQJrw9WS8/gaoTkKunzJSOgDruk=;
        b=uym7kWUgMLdwcmJSdK8YqPGCjSIiT7HIzCDDSdAJ9QUWDhecCSjHk3GNiSsvA7+9m+
         wZbkmDfvxSEfsI0y8occrML4WRhPWqkDkAXGrgG/J/Zu8fPD9BFLh4uHndKNX8Vy4nbh
         YrXO4LVJQ5fmHerwxh70+OHvVH157Dh0dUQ5K8RqgXZFjCpJ9Svi1650wpPkGhQG2wBz
         LUjEVIYDKsxjLvmfLxcu7mP63sAqA+XcNbVsPkv0gTr81gQ5UVCYnLgiXK9KvjrRE6MN
         Iw9IgtO1a6WnfQsNGxSmILyXDkiNV/m5AJ4g+qwhoQIp/mAKow3ply+77/QTVEojSRW/
         Wxaw==
Subject: [PATCH 3/6] count: Employ new scheme for snippet of count_lim_atomic
References: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <eb1a1ce4-ae1e-8416-0290-af018cdfcec6@gmail.com>
Date: Sat, 13 Oct 2018 23:56:04 +0900
MIME-Version: 1.0
In-Reply-To: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 95838d3aa0446586b7e7ef84b942e2a51a3daa88 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 8 Oct 2018 19:45:06 +0900
Subject: [PATCH 3/6] count: Employ new scheme for snippet of count_lim_atomic

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_lim_atomic.c | 209 ++++++++--------
 count/count.tex                      | 457 ++++++++++++-----------------------
 2 files changed, 265 insertions(+), 401 deletions(-)

diff --git a/CodeSamples/count/count_lim_atomic.c b/CodeSamples/count/count_lim_atomic.c
index 491d700..6190a9f 100644
--- a/CodeSamples/count/count_lim_atomic.c
+++ b/CodeSamples/count/count_lim_atomic.c
@@ -21,51 +21,58 @@
 
 #include "../api.h"
 
-atomic_t __thread counterandmax = ATOMIC_INIT(0);
-unsigned long globalcountmax = 1 << 25;
+static void balance_count(void);
+
+//\begin{snippet}[labelbase=ln:count:count_lim_atomic:var_access,commandchars=\\\@\$]
+atomic_t __thread counterandmax = ATOMIC_INIT(0);	//\lnlbl{var:candmax}
+unsigned long globalcountmax = 1 << 25;			//\lnlbl{var:def:b}
 unsigned long globalcount = 0;
 unsigned long globalreserve = 0;
 atomic_t *counterp[NR_THREADS] = { NULL };
-DEFINE_SPINLOCK(gblcnt_mutex);
-#define CM_BITS (sizeof(atomic_t) * 4)
-#define MAX_COUNTERMAX ((1 << CM_BITS) - 1)
+DEFINE_SPINLOCK(gblcnt_mutex);				//\lnlbl{var:def:e}
+#define CM_BITS (sizeof(atomic_t) * 4)			//\lnlbl{var:CM_BITS}
+#define MAX_COUNTERMAX ((1 << CM_BITS) - 1)		//\lnlbl{var:MAX_CMAX}
 
-static void split_counterandmax_int(int cami, int *c, int *cm)
+static __inline__ void					//\lnlbl{split_int:b}
+split_counterandmax_int(int cami, int *c, int *cm)
 {
-	*c = (cami >> CM_BITS) & MAX_COUNTERMAX;
-	*cm = cami & MAX_COUNTERMAX;
-}
+	*c = (cami >> CM_BITS) & MAX_COUNTERMAX;	//\lnlbl{split_int:msh}
+	*cm = cami & MAX_COUNTERMAX;			//\lnlbl{split_int:lsh}
+}							//\lnlbl{split_int:e}
 
-static void split_counterandmax(atomic_t *cam, int *old, int *c, int *cm)
+static __inline__ void					//\lnlbl{split:b}
+split_counterandmax(atomic_t *cam, int *old, int *c, int *cm)//\lnlbl{split:func}
 {
-	unsigned int cami = atomic_read(cam);
+	unsigned int cami = atomic_read(cam);		//\lnlbl{split:int}
 
-	*old = cami;
-	split_counterandmax_int(cami, c, cm);
-}
+	*old = cami;					//\lnlbl{split:old}
+	split_counterandmax_int(cami, c, cm);		//\lnlbl{split:split_int}
+}							//\lnlbl{split:e}
 
-static int merge_counterandmax(int c, int cm)
+static __inline__ int merge_counterandmax(int c, int cm)//\lnlbl{merge:b}
 {
 	unsigned int cami;
 
-	cami = (c << CM_BITS) | cm;
+	cami = (c << CM_BITS) | cm;			//\lnlbl{merge:merge}
 	return ((int)cami);
-}
+}							//\lnlbl{merge:e}
+//\end{snippet}
 
-static void globalize_count(void)
+//\begin{snippet}[labelbase=ln:count:count_lim_atomic:utility1,commandchars=\\\@\$]
+static void globalize_count(void)			//\lnlbl{globalize:b}
 {
 	int c;
 	int cm;
 	int old;
 
-	split_counterandmax(&counterandmax, &old, &c, &cm);
+	split_counterandmax(&counterandmax, &old, &c, &cm);//\lnlbl{globalize:split}
 	globalcount += c;
 	globalreserve -= cm;
 	old = merge_counterandmax(0, 0);
 	atomic_set(&counterandmax, old);
-}
+}							//\lnlbl{globalize:e}
 
-static void flush_local_count(void)
+static void flush_local_count(void)			//\lnlbl{flush:b}
 {
 	int c;
 	int cm;
@@ -73,85 +80,69 @@ static void flush_local_count(void)
 	int t;
 	int zero;
 
-	if (globalreserve == 0)
-		return;
-	zero = merge_counterandmax(0, 0);
-	for_each_thread(t)
-		if (counterp[t] != NULL) {
-			old = atomic_xchg(counterp[t], zero);
-			split_counterandmax_int(old, &c, &cm);
-			globalcount += c;
-			globalreserve -= cm;
-		}
-}
-
-static void balance_count(void)
-{
-	int c;
-	int cm;
-	int old;
-	unsigned long limit;
-
-	limit = globalcountmax - globalcount - globalreserve;
-	limit /= num_online_threads();
-	if (limit > MAX_COUNTERMAX)
-		cm = MAX_COUNTERMAX;
-	else
-		cm = limit;
-	globalreserve += cm;
-	c = cm / 2;
-	if (c > globalcount)
-		c = globalcount;
-	globalcount -= c;
-	old = merge_counterandmax(c, cm);
-	atomic_set(&counterandmax, old);
-}
-
-int add_count(unsigned long delta)
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
+//\end{snippet}
+
+//\begin{snippet}[labelbase=ln:count:count_lim_atomic:add_sub,commandchars=\\\@\$]
+int add_count(unsigned long delta)			//\lnlbl{add:b}
 {
 	int c;
 	int cm;
 	int old;
 	int new;
 
-	do {
-		split_counterandmax(&counterandmax, &old, &c, &cm);
-		if (delta > MAX_COUNTERMAX || c + delta > cm)
-			goto slowpath;
-		new = merge_counterandmax(c + delta, cm);
-	} while (atomic_cmpxchg(&counterandmax, old, new) != old);
-	return 1;
-slowpath:
-	spin_lock(&gblcnt_mutex);
-	globalize_count();
-	if (globalcountmax - globalcount - globalreserve < delta) {
-		flush_local_count();
-		if (globalcountmax - globalcount - globalreserve < delta) {
-			spin_unlock(&gblcnt_mutex);
-			return 0;
+	do {						//\lnlbl{add:fast:b}
+		split_counterandmax(&counterandmax, &old, &c, &cm);//\lnlbl{add:split}
+		if (delta > MAX_COUNTERMAX || c + delta > cm)//\lnlbl{add:check}
+			goto slowpath;			//\lnlbl{add:goto}
+		new = merge_counterandmax(c + delta, cm);//\lnlbl{add:merge}
+	} while (atomic_cmpxchg(&counterandmax,		//\lnlbl{add:atmcmpex}
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
 		}
 	}
-	globalcount += delta;
-	balance_count();
-	spin_unlock(&gblcnt_mutex);
-	return 1;
-}
+	globalcount += delta;				//\lnlbl{add:addglb}
+	balance_count();				//\lnlbl{add:balance}
+	spin_unlock(&gblcnt_mutex);			//\lnlbl{add:release:s}
+	return 1;					//\lnlbl{add:return:ss}
+}							//\lnlbl{add:e}
 
-int sub_count(unsigned long delta)
+int sub_count(unsigned long delta)			//\lnlbl{sub:b}
 {
 	int c;
 	int cm;
 	int old;
 	int new;
 
-	do {
+	do {						//\lnlbl{sub:fast:b}
 		split_counterandmax(&counterandmax, &old, &c, &cm);
 		if (delta > c)
-			goto slowpath;
+		  goto slowpath;
 		new = merge_counterandmax(c - delta, cm);
-	} while (atomic_cmpxchg(&counterandmax, old, new) != old);
-	return 1;
-slowpath:
+	} while (atomic_cmpxchg(&counterandmax,
+	                        old, new) != old);
+	return 1;					//\lnlbl{sub:fast:e}
+ slowpath:						//\lnlbl{sub:slow:b}
 	spin_lock(&gblcnt_mutex);
 	globalize_count();
 	if (globalcount < delta) {
@@ -164,10 +155,12 @@ slowpath:
 	globalcount -= delta;
 	balance_count();
 	spin_unlock(&gblcnt_mutex);
-	return 1;
-}
+	return 1;					//\lnlbl{sub:slow:e}
+}							//\lnlbl{sub:e}
+//\end{snippet}
 
-unsigned long read_count(void)
+//\begin{snippet}[labelbase=ln:count:count_lim_atomic:read,commandchars=\\\@\$]
+unsigned long read_count(void)				//\lnlbl{b}
 {
 	int c;
 	int cm;
@@ -175,22 +168,47 @@ unsigned long read_count(void)
 	int t;
 	unsigned long sum;
 
-	spin_lock(&gblcnt_mutex);
-	sum = globalcount;
-	for_each_thread(t)
+	spin_lock(&gblcnt_mutex);			//\lnlbl{acquire}
+	sum = globalcount;				//\lnlbl{initsum}
+	for_each_thread(t)				//\lnlbl{loop:b}
 		if (counterp[t] != NULL) {
-			split_counterandmax(counterp[t], &old, &c, &cm);
+			split_counterandmax(counterp[t], &old, &c, &cm);//\lnlbl{split}
 			sum += c;
-		}
-	spin_unlock(&gblcnt_mutex);
-	return sum;
-}
+		}					//\lnlbl{loop:e}
+	spin_unlock(&gblcnt_mutex);			//\lnlbl{release}
+	return sum;					//\lnlbl{return}
+}							//\lnlbl{e}
+//\end{snippet}
 
 void count_init(void)
 {
 }
 
-void count_register_thread(void)
+//\begin{snippet}[labelbase=ln:count:count_lim_atomic:utility2,commandchars=\\\@\$]
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
 {
 	int idx = smp_thread_id();
 
@@ -199,7 +217,7 @@ void count_register_thread(void)
 	spin_unlock(&gblcnt_mutex);
 }
 
-void count_unregister_thread(int nthreadsexpected)
+void count_unregister_thread(int nthreadsexpected)	//\lnlbl{unregister:b}
 {
 	int idx = smp_thread_id();
 
@@ -208,6 +226,7 @@ void count_unregister_thread(int nthreadsexpected)
 	counterp[idx] = NULL;
 	spin_unlock(&gblcnt_mutex);
 }
+//\end{snippet}
 
 void count_cleanup(void)
 {
diff --git a/count/count.tex b/count/count.tex
index 90d0936..bdda590 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1867,71 +1867,36 @@ represent \co{counter} and the low-order 16 bits to represent
 } \QuickQuizEnd
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 atomic_t __thread ctrandmax = ATOMIC_INIT(0);
-  2 unsigned long globalcountmax = 10000;
-  3 unsigned long globalcount = 0;
-  4 unsigned long globalreserve = 0;
-  5 atomic_t *counterp[NR_THREADS] = { NULL };
-  6 DEFINE_SPINLOCK(gblcnt_mutex);
-  7 #define CM_BITS (sizeof(atomic_t) * 4)
-  8 #define MAX_COUNTERMAX ((1 << CM_BITS) - 1)
-  9 
- 10 static void
- 11 split_ctrandmax_int(int cami, int *c, int *cm)
- 12 {
- 13   *c = (cami >> CM_BITS) & MAX_COUNTERMAX;
- 14   *cm = cami & MAX_COUNTERMAX;
- 15 }
- 16 
- 17 static void
- 18 split_ctrandmax(atomic_t *cam, int *old,
- 19                     int *c, int *cm)
- 20 {
- 21   unsigned int cami = atomic_read(cam);
- 22 
- 23   *old = cami;
- 24   split_ctrandmax_int(cami, c, cm);
- 25 }
- 26 
- 27 static int merge_ctrandmax(int c, int cm)
- 28 {
- 29   unsigned int cami;
- 30 
- 31   cami = (c << CM_BITS) | cm;
- 32   return ((int)cami);
- 33 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_atomic@var_access.fcv}
 \caption{Atomic Limit Counter Variables and Access Functions}
 \label{lst:count:Atomic Limit Counter Variables and Access Functions}
 \end{listing}
 
+\begin{lineref}[ln:count:count_lim_atomic:var_access:var]
 The variables and access functions for a simple atomic limit counter
 are shown in
 Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}
 (\path{count_lim_atomic.c}).
 The \co{counter} and \co{countermax} variables in earlier algorithms
-are combined into the single variable \co{ctrandmax} shown on
-line~1, with \co{counter} in the upper half and \co{countermax} in
+are combined into the single variable \co{counterandmax} shown on
+line~\lnref{candmax}, with \co{counter} in the upper half and \co{countermax} in
 the lower half.
 This variable is of type \co{atomic_t}, which has an underlying
 representation of \co{int}.
 
-Lines~2-6 show the definitions for \co{globalcountmax}, \co{globalcount},
+Lines~\lnref{def:b}-\lnref{def:e} show the definitions for \co{globalcountmax}, \co{globalcount},
 \co{globalreserve}, \co{counterp}, and \co{gblcnt_mutex}, all of which
 take on roles similar to their counterparts in
 Listing~\ref{lst:count:Approximate Limit Counter Variables}.
-Line~7 defines \co{CM_BITS}, which gives the number of bits in each half
-of \co{ctrandmax}, and line~8 defines \co{MAX_COUNTERMAX}, which
+Line~\lnref{CM_BITS} defines \co{CM_BITS}, which gives the number of bits in each half
+of \co{counterandmax}, and line~\lnref{MAX_CMAX} defines \co{MAX_COUNTERMAX}, which
 gives the maximum value that may be held in either half of
-\co{ctrandmax}.
+\co{counterandmax}.
+\end{lineref}
 
 \QuickQuiz{}
-	In what way does line~7 of
+	In what way does
+        line~\ref{ln:count:count_lim_atomic:var_access:var:CM_BITS} of
 	Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}
 	violate the C standard?
 \QuickQuizAnswer{
@@ -1944,39 +1909,48 @@ gives the maximum value that may be held in either half of
 	standard?  What drawbacks would it have?)
 } \QuickQuizEnd
 
-Lines~10-15 show the \co{split_ctrandmax_int()} function, which,
-when given the underlying \co{int} from the \co{atomic_t
-ctrandmax} variable, splits it into its \co{counter} (\co{c})
+\begin{lineref}[ln:count:count_lim_atomic:var_access:split_int]
+Lines~\lnref{b}-\lnref{e} show the \co{split_counterandmax_int()}
+function, which,
+when given the underlying \co{int} from the
+\co{atomic_t counterandmax} variable, splits it into its
+\co{counter} (\co{c})
 and \co{countermax} (\co{cm}) components.
-Line~13 isolates the most-significant half of this \co{int},
+Line~\lnref{msh} isolates the most-significant half of this \co{int},
 placing the result as specified by argument \co{c},
-and line~14 isolates the least-significant half of this \co{int},
+and line~\lnref{lsh} isolates the least-significant half of this \co{int},
 placing the result as specified by argument \co{cm}.
+\end{lineref}
 
-Lines~17-25 show the \co{split_ctrandmax()} function, which
+\begin{lineref}[ln:count:count_lim_atomic:var_access:split]
+Lines~\lnref{b}-\lnref{e} show the \co{split_counterandmax()} function, which
 picks up the underlying \co{int} from the specified variable
-on line~21, stores it as specified by the \co{old} argument on
-line~23, and then invokes \co{split_ctrandmax_int()} to split
-it on line~24.
+on line~\lnref{int}, stores it as specified by the \co{old} argument on
+line~\lnref{old}, and then invokes \co{split_counterandmax_int()} to split
+it on line~\lnref{split_int}.
+\end{lineref}
 
 \QuickQuiz{}
-	Given that there is only one \co{ctrandmax} variable,
-	why bother passing in a pointer to it on line~18 of
+	Given that there is only one \co{counterandmax} variable,
+	why bother passing in a pointer to it on
+        line~\ref{ln:count:count_lim_atomic:var_access:split:func} of
 	Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}?
 \QuickQuizAnswer{
-	There is only one \co{ctrandmax} variable \emph{per thread}.
+	There is only one \co{counterandmax} variable \emph{per thread}.
 	Later, we will see code that needs to pass other threads'
-	\co{ctrandmax} variables to \co{split_ctrandmax()}.
+	\co{counterandmax} variables to \co{split_counterandmax()}.
 } \QuickQuizEnd
 
-Lines~27-33 show the \co{merge_ctrandmax()} function, which
-can be thought of as the inverse of \co{split_ctrandmax()}.
-Line~31 merges the \co{counter} and \co{countermax}
+\begin{lineref}[ln:count:count_lim_atomic:var_access:merge]
+Lines~\lnref{b}-\lnref{e} show the \co{merge_counterandmax()} function, which
+can be thought of as the inverse of \co{split_counterandmax()}.
+Line~\lnref{merge} merges the \co{counter} and \co{countermax}
 values passed in \co{c} and \co{cm}, respectively, and returns
 the result.
+\end{lineref}
 
 \QuickQuiz{}
-	Why does \co{merge_ctrandmax()} in
+	Why does \co{merge_counterandmax()} in
 	Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}
 	return an \co{int} rather than storing directly into an
 	\co{atomic_t}?
@@ -1986,75 +1960,7 @@ the result.
 } \QuickQuizEnd
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 int add_count(unsigned long delta)
-  2 {
-  3   int c;
-  4   int cm;
-  5   int old;
-  6   int new;
-  7 
-  8   do {
-  9     split_ctrandmax(&ctrandmax, &old, &c, &cm);
- 10     if (delta > MAX_COUNTERMAX || c + delta > cm)
- 11       goto slowpath;
- 12     new = merge_ctrandmax(c + delta, cm);
- 13   } while (atomic_cmpxchg(&ctrandmax,
- 14                           old, new) != old);
- 15   return 1;
- 16 slowpath:
- 17   spin_lock(&gblcnt_mutex);
- 18   globalize_count();
- 19   if (globalcountmax - globalcount -
- 20       globalreserve < delta) {
- 21     flush_local_count();
- 22     if (globalcountmax - globalcount -
- 23         globalreserve < delta) {
- 24       spin_unlock(&gblcnt_mutex);
- 25       return 0;
- 26     }
- 27   }
- 28   globalcount += delta;
- 29   balance_count();
- 30   spin_unlock(&gblcnt_mutex);
- 31   return 1;
- 32 }
- 33 
- 34 int sub_count(unsigned long delta)
- 35 {
- 36   int c;
- 37   int cm;
- 38   int old;
- 39   int new;
- 40 
- 41   do {
- 42     split_ctrandmax(&ctrandmax, &old, &c, &cm);
- 43     if (delta > c)
- 44       goto slowpath;
- 45     new = merge_ctrandmax(c - delta, cm);
- 46   } while (atomic_cmpxchg(&ctrandmax,
- 47                           old, new) != old);
- 48   return 1;
- 49 slowpath:
- 50   spin_lock(&gblcnt_mutex);
- 51   globalize_count();
- 52   if (globalcount < delta) {
- 53     flush_local_count();
- 54     if (globalcount < delta) {
- 55       spin_unlock(&gblcnt_mutex);
- 56       return 0;
- 57     }
- 58   }
- 59   globalcount -= delta;
- 60   balance_count();
- 61   spin_unlock(&gblcnt_mutex);
- 62   return 1;
- 63 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_atomic@add_sub.fcv}
 \caption{Atomic Limit Counter Add and Subtract}
 \label{lst:count:Atomic Limit Counter Add and Subtract}
 \end{listing}
@@ -2062,33 +1968,42 @@ the result.
 Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
 shows the \co{add_count()} and \co{sub_count()} functions.
 
-Lines~1-32 show \co{add_count()}, whose fastpath spans lines~8-15,
+\begin{lineref}[ln:count:count_lim_atomic:add_sub:add]
+Lines~\lnref{b}-\lnref{e} show \co{add_count()}, whose fastpath spans
+lines~\lnref{fast:b}-\lnref{return:fs},
 with the remainder of the function being the slowpath.
-Lines~8-14 of the fastpath form a compare-and-swap (CAS) loop, with
-the \co{atomic_cmpxchg()} primitives on lines~13-14 performing the
+Lines~\lnref{fast:b}-\lnref{loop:e} of the fastpath form a compare-and-swap
+(CAS) loop, with
+the \co{atomic_cmpxchg()} primitives on
+lines~\lnref{atmcmpex}-\lnref{loop:e} performing the
 actual CAS.
-Line~9 splits the current thread's \co{ctrandmax} variable into its
+Line~\lnref{split} splits the current thread's \co{counterandmax} variable into its
 \co{counter} (in \co{c}) and \co{countermax} (in \co{cm}) components,
 while placing the underlying \co{int} into \co{old}.
-Line~10 checks whether the amount \co{delta} can be accommodated
+Line~\lnref{check} checks whether the amount \co{delta} can be accommodated
 locally (taking care to avoid integer overflow), and if not,
-line~11 transfers to the slowpath.
-Otherwise, line~12 combines an updated \co{counter} value with the
+line~\lnref{goto} transfers to the slowpath.
+Otherwise, line~\lnref{merge} combines an updated \co{counter} value with the
 original \co{countermax} value into \co{new}.
-The \co{atomic_cmpxchg()} primitive on lines~13-14 then atomically
-compares this thread's \co{ctrandmax} variable to \co{old},
+The \co{atomic_cmpxchg()} primitive on
+lines~\lnref{atmcmpex}-\lnref{loop:e} then atomically
+compares this thread's \co{counterandmax} variable to \co{old},
 updating its value to \co{new} if the comparison succeeds.
-If the comparison succeeds, line~15 returns success, otherwise,
-execution continues in the loop at line~9.
+If the comparison succeeds, line~\lnref{return:fs} returns success, otherwise,
+execution continues in the loop at line~\lnref{fast:b}.
+\end{lineref}
 
 \QuickQuiz{}
 	Yecch!
-	Why the ugly \co{goto} on line~11 of
+	Why the ugly \co{goto} on
+        line~\ref{ln:count:count_lim_atomic:add_sub:add:goto} of
 	Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}?
 	Haven't you heard of the \co{break} statement???
 \QuickQuizAnswer{
 	Replacing the \co{goto} with a \co{break} would require keeping
-	a flag to determine whether or not line~15 should return, which
+	a flag to determine whether or not
+        line~\ref{ln:count:count_lim_atomic:add_sub:add:return:fs}
+        should return, which
 	is not the sort of thing you want on a fastpath.
 	If you really hate the \co{goto} that much, your best bet would
 	be to pull the fastpath into a separate function that returned
@@ -2098,175 +2013,90 @@ execution continues in the loop at line~9.
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	Why would the \co{atomic_cmpxchg()} primitive at lines~13-14 of
+        \begin{lineref}[ln:count:count_lim_atomic:add_sub:add]
+	Why would the \co{atomic_cmpxchg()} primitive at
+        lines~\lnref{atmcmpex}-\lnref{loop:e} of
 	Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
 	ever fail?
-	After all, we picked up its old value on line~9 and have not
+	After all, we picked up its old value on line~\lnref{split} and have not
 	changed it!
+	\end{lineref}
 \QuickQuizAnswer{
+	\begin{lineref}[ln:count:count_lim_atomic:add_sub:add]
 	Later, we will see how the \co{flush_local_count()} function in
 	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1}
-	might update this thread's \co{ctrandmax} variable concurrently
-	with the execution of the fastpath on lines~8-14 of
+	might update this thread's \co{counterandmax} variable concurrently
+	with the execution of the fastpath on
+        lines~\lnref{fast:b}-\lnref{loop:e} of
 	Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}.
+	\end{lineref}
 } \QuickQuizEnd
 
-Lines~16-31 of
+\begin{lineref}[ln:count:count_lim_atomic:add_sub:add]
+Lines~\lnref{slow:b}-\lnref{return:ss} of
 Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
 show \co{add_count()}'s slowpath, which is protected by \co{gblcnt_mutex},
-which is acquired on line~17 and released on lines~24 and~30.
-Line~18 invokes \co{globalize_count()}, which moves this thread's
+which is acquired on line~\lnref{acquire} and released on
+lines~\lnref{release:f} and~\lnref{release:s}.
+Line~\lnref{globalize} invokes \co{globalize_count()},
+which moves this thread's
 state to the global counters.
-Lines~19-20 check whether the \co{delta} value can be accommodated by
-the current global state, and, if not, line~21 invokes
+Lines~\lnref{checkglb:b}-\lnref{checkglb:e} check whether
+the \co{delta} value can be accommodated by
+the current global state, and, if not, line~\lnref{flush} invokes
 \co{flush_local_count()} to flush all threads' local state to the
-global counters, and then lines~22-23 recheck whether \co{delta} can
+global counters, and then
+lines~\lnref{checkglb:nb}-\lnref{checkglb:ne} recheck whether \co{delta} can
 be accommodated.
 If, after all that, the addition of \co{delta} still cannot be accommodated,
-then line~24 releases \co{gblcnt_mutex} (as noted earlier), and
-then line~25 returns failure.
-
-Otherwise, line~28 adds \co{delta} to the global counter, line~29
-spreads counts to the local state if appropriate, line~30 releases
-\co{gblcnt_mutex} (again, as noted earlier), and finally, line~31
+then line~\lnref{release:f} releases \co{gblcnt_mutex} (as noted earlier), and
+then line~\lnref{return:sf} returns failure.
+
+Otherwise, line~\lnref{addglb} adds \co{delta} to the global counter,
+line~\lnref{balance}
+spreads counts to the local state if appropriate, line~\lnref{release:s} releases
+\co{gblcnt_mutex} (again, as noted earlier), and finally,
+line~\lnref{return:ss}
 returns success.
+\end{lineref}
 
-Lines~34-63 of
+\begin{lineref}[ln:count:count_lim_atomic:add_sub:sub]
+Lines~\lnref{b}-\lnref{e} of
 Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
 show \co{sub_count()}, which is structured similarly to
-\co{add_count()}, having a fastpath on lines~41-48 and a slowpath on
-lines~49-62.
+\co{add_count()}, having a fastpath on
+lines~\lnref{fast:b}-\lnref{fast:e} and a slowpath on
+lines~\lnref{slow:b}-\lnref{slow:e}.
 A line-by-line analysis of this function is left as an exercise to
 the reader.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 unsigned long read_count(void)
-  2 {
-  3   int c;
-  4   int cm;
-  5   int old;
-  6   int t;
-  7   unsigned long sum;
-  8 
-  9   spin_lock(&gblcnt_mutex);
- 10   sum = globalcount;
- 11   for_each_thread(t)
- 12     if (counterp[t] != NULL) {
- 13       split_ctrandmax(counterp[t], &old, &c, &cm);
- 14       sum += c;
- 15     }
- 16   spin_unlock(&gblcnt_mutex);
- 17   return sum;
- 18 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_atomic@read.fcv}
 \caption{Atomic Limit Counter Read}
 \label{lst:count:Atomic Limit Counter Read}
 \end{listing}
 
+\begin{lineref}[ln:count:count_lim_atomic:read]
 Listing~\ref{lst:count:Atomic Limit Counter Read} shows \co{read_count()}.
-Line~9 acquires \co{gblcnt_mutex} and line~16 releases it.
-Line~10 initializes local variable \co{sum} to the value of
-\co{globalcount}, and the loop spanning lines~11-15 adds the
+Line~\lnref{acquire} acquires \co{gblcnt_mutex} and
+line~\lnref{release} releases it.
+Line~\lnref{initsum} initializes local variable \co{sum} to the value of
+\co{globalcount}, and the loop spanning
+lines~\lnref{loop:b}-\lnref{loop:e} adds the
 per-thread counters to this sum, isolating each per-thread counter
-using \co{split_ctrandmax} on line~13.
-Finally, line~17 returns the sum.
+using \co{split_counterandmax} on line~\lnref{split}.
+Finally, line~\lnref{return} returns the sum.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 static void globalize_count(void)
-  2 {
-  3   int c;
-  4   int cm;
-  5   int old;
-  6 
-  7   split_ctrandmax(&ctrandmax, &old, &c, &cm);
-  8   globalcount += c;
-  9   globalreserve -= cm;
- 10   old = merge_ctrandmax(0, 0);
- 11   atomic_set(&ctrandmax, old);
- 12 }
- 13 
- 14 static void flush_local_count(void)
- 15 {
- 16   int c;
- 17   int cm;
- 18   int old;
- 19   int t;
- 20   int zero;
- 21 
- 22   if (globalreserve == 0)
- 23     return;
- 24   zero = merge_ctrandmax(0, 0);
- 25   for_each_thread(t)
- 26     if (counterp[t] != NULL) {
- 27       old = atomic_xchg(counterp[t], zero);
- 28       split_ctrandmax_int(old, &c, &cm);
- 29       globalcount += c;
- 30       globalreserve -= cm;
- 31     }
- 32 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_atomic@utility1.fcv}
 \caption{Atomic Limit Counter Utility Functions 1}
 \label{lst:count:Atomic Limit Counter Utility Functions 1}
 \end{listing}
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
-  1 static void balance_count(void)
-  2 {
-  3   int c;
-  4   int cm;
-  5   int old;
-  6   unsigned long limit;
-  7 
-  8   limit = globalcountmax - globalcount -
-  9           globalreserve;
- 10   limit /= num_online_threads();
- 11   if (limit > MAX_COUNTERMAX)
- 12     cm = MAX_COUNTERMAX;
- 13   else
- 14     cm = limit;
- 15   globalreserve += cm;
- 16   c = cm / 2;
- 17   if (c > globalcount)
- 18     c = globalcount;
- 19   globalcount -= c;
- 20   old = merge_ctrandmax(c, cm);
- 21   atomic_set(&ctrandmax, old);
- 22 }
- 23 
- 24 void count_register_thread(void)
- 25 {
- 26   int idx = smp_thread_id();
- 27 
- 28   spin_lock(&gblcnt_mutex);
- 29   counterp[idx] = &ctrandmax;
- 30   spin_unlock(&gblcnt_mutex);
- 31 }
- 32 
- 33 void count_unregister_thread(int nthreadsexpected)
- 34 {
- 35   int idx = smp_thread_id();
- 36 
- 37   spin_lock(&gblcnt_mutex);
- 38   globalize_count();
- 39   counterp[idx] = NULL;
- 40   spin_unlock(&gblcnt_mutex);
- 41 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_atomic@utility2.fcv}
 \caption{Atomic Limit Counter Utility Functions 2}
 \label{lst:count:Atomic Limit Counter Utility Functions 2}
 \end{listing}
@@ -2279,36 +2109,47 @@ shows the utility functions
 \co{balance_count()},
 \co{count_register_thread()}, and
 \co{count_unregister_thread()}.
-The code for \co{globalize_count()} is shown on lines~1-12,
+\begin{lineref}[ln:count:count_lim_atomic:utility1:globalize]
+The code for \co{globalize_count()} is shown on
+lines~\lnref{b}-\lnref{e},
 of Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1} and
 is similar to that of previous algorithms, with the addition of
-line~7, which is now required to split out \co{counter} and
-\co{countermax} from \co{ctrandmax}.
+line~\lnref{split}, which is now required to split out \co{counter} and
+\co{countermax} from \co{counterandmax}.
+\end{lineref}
 
+\begin{lineref}[ln:count:count_lim_atomic:utility1:flush]
 The code for \co{flush_local_count()}, which moves all threads' local
-counter state to the global counter, is shown on lines~14-32.
-Line~22 checks to see if the value of \co{globalreserve} permits
-any per-thread counts, and, if not, line~23 returns.
-Otherwise, line~24 initializes local variable \co{zero} to a combined
+counter state to the global counter, is shown on
+lines~\lnref{b}-\lnref{e}.
+Line~\lnref{checkrsv} checks to see if the value of
+\co{globalreserve} permits
+any per-thread counts, and, if not, line~\lnref{return:n} returns.
+Otherwise, line~\lnref{initzero} initializes local variable \co{zero} to a combined
 zeroed \co{counter} and \co{countermax}.
-The loop spanning lines~25-31 sequences through each thread.
-Line~26 checks to see if the current thread has counter state,
-and, if so, lines~27-30 move that state to the global counters.
-Line~27 atomically fetches the current thread's state
+The loop spanning lines~\lnref{loop:b}-\lnref{loop:e} sequences
+through each thread.
+Line~\lnref{checkp} checks to see if the current thread has counter state,
+and, if so, lines~\lnref{atmxchg}-\lnref{glbrsv} move that state
+to the global counters.
+Line~\lnref{atmxchg} atomically fetches the current thread's state
 while replacing it with zero.
-Line~28 splits this state into its \co{counter} (in local variable \co{c})
+Line~\lnref{split} splits this state into its \co{counter}
+(in local variable \co{c})
 and \co{countermax} (in local variable \co{cm}) components.
-Line~29 adds this thread's \co{counter} to \co{globalcount}, while
-line~30 subtracts this thread's \co{countermax} from \co{globalreserve}.
+Line~\lnref{glbcnt} adds this thread's \co{counter} to \co{globalcount}, while
+line~\lnref{glbrsv} subtracts this thread's \co{countermax} from \co{globalreserve}.
+\end{lineref}
 
 \QuickQuiz{}
 	What stops a thread from simply refilling its
-	\co{ctrandmax} variable immediately after
-	\co{flush_local_count()} on line~14 of
+	\co{counterandmax} variable immediately after
+	\co{flush_local_count()} on
+        line~\ref{ln:count:count_lim_atomic:utility1:flush:b} of
 	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1}
 	empties it?
 \QuickQuizAnswer{
-	This other thread cannot refill its \co{ctrandmax}
+	This other thread cannot refill its \co{counterandmax}
 	until the caller of \co{flush_local_count()} releases the
 	\co{gblcnt_mutex}.
 	By that time, the caller of \co{flush_local_count()} will have
@@ -2320,8 +2161,9 @@ line~30 subtracts this thread's \co{countermax} from \co{globalreserve}.
 \QuickQuiz{}
 	What prevents concurrent execution of the fastpath of either
 	\co{add_count()} or \co{sub_count()} from interfering with
-	the \co{ctrandmax} variable while
-	\co{flush_local_count()} is accessing it on line~27 of
+	the \co{counterandmax} variable while
+	\co{flush_local_count()} is accessing it on
+        line~\ref{ln:count:count_lim_atomic:utility1:flush:atmxchg} of
 	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1}
 	empties it?
 \QuickQuizAnswer{
@@ -2329,12 +2171,12 @@ line~30 subtracts this thread's \co{countermax} from \co{globalreserve}.
 	Consider the following three cases:
 	\begin{enumerate}
 	\item	If \co{flush_local_count()}'s \co{atomic_xchg()} executes
-		before the \co{split_ctrandmax()} of either fastpath,
+		before the \co{split_counterandmax()} of either fastpath,
 		then the fastpath will see a zero \co{counter} and
 		\co{countermax}, and will thus transfer to the slowpath
 		(unless of course \co{delta} is zero).
 	\item	If \co{flush_local_count()}'s \co{atomic_xchg()} executes
-		after the \co{split_ctrandmax()} of either fastpath,
+		after the \co{split_counterandmax()} of either fastpath,
 		but before that fastpath's \co{atomic_cmpxchg()},
 		then the \co{atomic_cmpxchg()} will fail, causing the
 		fastpath to restart, which reduces to case~1 above.
@@ -2342,25 +2184,28 @@ line~30 subtracts this thread's \co{countermax} from \co{globalreserve}.
 		after the \co{atomic_cmpxchg()} of either fastpath,
 		then the fastpath will (most likely) complete successfully
 		before \co{flush_local_count()} zeroes the thread's
-		\co{ctrandmax} variable.
+		\co{counterandmax} variable.
 	\end{enumerate}
 	Either way, the race is resolved correctly.
 } \QuickQuizEnd
 
-Lines~1-22 on
+\begin{lineref}[ln:count:count_lim_atomic:utility2]
+Lines~\lnref{balance:b}-\lnref{balance:e} on
 Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 2}
 show the code for \co{balance_count()}, which refills
-the calling thread's local \co{ctrandmax} variable.
+the calling thread's local \co{counterandmax} variable.
 This function is quite similar to that of the preceding algorithms,
-with changes required to handle the merged \co{ctrandmax} variable.
+with changes required to handle the merged \co{counterandmax} variable.
 Detailed analysis of the code is left as an exercise for the reader,
 as it is with the \co{count_register_thread()} function starting on
-line~24 and the \co{count_unregister_thread()} function starting on
-line~33.
+line~\lnref{register:b} and the \co{count_unregister_thread()} function starting on
+line~\lnref{unregister:b}.
+\end{lineref}
 
 \QuickQuiz{}
 	Given that the \co{atomic_set()} primitive does a simple
-	store to the specified \co{atomic_t}, how can line~21 of
+	store to the specified \co{atomic_t}, how can
+        line~\ref{ln:count:count_lim_atomic:utility2:balance:atmcset} of
 	\co{balance_count()} in
 	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 2}
 	work correctly in face of concurrent \co{flush_local_count()}
-- 
2.7.4


