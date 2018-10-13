Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7IDRuW2RXJ7NuqFWu+B9kKBk1Ugg2ZoTUmviN89tT9M=;
        b=F419YuOwPIXzTsNQLnlVWd2/IxtrXGFLDRDOWEZ1hSZ7bYICqSKYIRHtTeNxdoXnxq
         BZaOwe2dszQciPiFzEvwgx6qd2EnT33SzPGUC/CHaF+W9NhaFKIBDlb/91aqO54zLwM7
         jasqSg9ThXW1uOcLj9VDkPwTOSrv59SkTFYYKvoZS5lgnteSPTybxfAbUVR7nswPtSeD
         3m7i+sY/mJywMtp85Bh3aPckbCz4YMcBpyiLvTun1CBx1aM6MvDN8u5N/6w8PH+/1yCf
         G7SJp///AfOwivDCETa/A/cbX+PVedyh5t5wYv9O3wkl02F9iE6niJTc/qE0uzEVJWjC
         Lvdw==
Subject: [PATCH 4/6] count: Employ new scheme for snippet of count_lim_sig
References: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0b08d321-5a04-5db7-5f72-06ad4b2aac90@gmail.com>
Date: Sat, 13 Oct 2018 23:56:50 +0900
MIME-Version: 1.0
In-Reply-To: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3db4be0993d4c955dfed6a625c622c33b52bf2a5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 9 Oct 2018 01:45:32 +0900
Subject: [PATCH 4/6] count: Employ new scheme for snippet of count_lim_sig

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_lim_sig.c | 148 +++++++-------
 count/count.tex                   | 395 ++++++++++----------------------------
 2 files changed, 184 insertions(+), 359 deletions(-)

diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
index 5eae9ba..f22bfef 100644
--- a/CodeSamples/count/count_lim_sig.c
+++ b/CodeSamples/count/count_lim_sig.c
@@ -22,77 +22,81 @@
 #include "../api.h"
 #include <signal.h>
 
-#define THEFT_IDLE	0
-#define THEFT_REQ	1
-#define	THEFT_ACK	2
-#define THEFT_READY	3
+//\begin{snippet}[labelbase=ln:count:count_lim_sig:data,commandchars=\\\@\$]
+#define THEFT_IDLE   0					//\lnlbl{value:b}
+#define THEFT_REQ    1
+#define	THEFT_ACK    2
+#define THEFT_READY  3
 
 int __thread theft = THEFT_IDLE;
-int __thread counting = 0;
-unsigned long __thread counter = 0;
+int __thread counting = 0;				//\lnlbl{value:e}
+unsigned long __thread counter = 0;			//\lnlbl{var:b}
 unsigned long __thread countermax = 0;
 unsigned long globalcountmax = 10000;
 unsigned long globalcount = 0;
 unsigned long globalreserve = 0;
 unsigned long *counterp[NR_THREADS] = { NULL };
-unsigned long *countermaxp[NR_THREADS] = { NULL };
-int *theftp[NR_THREADS] = { NULL };
+unsigned long *countermaxp[NR_THREADS] = { NULL };	//\lnlbl{maxp}
+int *theftp[NR_THREADS] = { NULL };			//\lnlbl{theftp}
 DEFINE_SPINLOCK(gblcnt_mutex);
-#define MAX_COUNTERMAX 100
+#define MAX_COUNTERMAX 100				//\lnlbl{var:e}
+//\end{snippet}
 
-static void globalize_count(void)
+//\begin{snippet}[labelbase=ln:count:count_lim_sig:migration,commandchars=\\\@\$]
+static void globalize_count(void)		//\lnlbl{globalize:b}
 {
 	globalcount += counter;
 	counter = 0;
 	globalreserve -= countermax;
 	countermax = 0;
-}
+}						//\lnlbl{globalize:e}
 
-static void flush_local_count_sig(int unused)
+static void flush_local_count_sig(int unused)	//\lnlbl{flush_sig:b}
 {
-	if (READ_ONCE(theft) != THEFT_REQ)
-		return;
-	smp_mb();
-	WRITE_ONCE(theft, THEFT_ACK);
-	if (!counting) {
-		WRITE_ONCE(theft, THEFT_READY);
+	if (READ_ONCE(theft) != THEFT_REQ)	//\lnlbl{flush_sig:check:REQ}
+		return;				//\lnlbl{flush_sig:return:n}
+	smp_mb();				//\lnlbl{flush_sig:mb:1}
+	WRITE_ONCE(theft, THEFT_ACK);		//\lnlbl{flush_sig:set:ACK}
+	if (!counting) {			//\lnlbl{flush_sig:check:fast}
+		WRITE_ONCE(theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
 	}
 	smp_mb();
-}
+}						//\lnlbl{flush_sig:e}
 
-static void flush_local_count(void)
+static void flush_local_count(void)			//\lnlbl{flush:b}
 {
 	int t;
 	thread_id_t tid;
 
-	for_each_tid(t, tid)
-		if (theftp[t] != NULL) {
-			if (*countermaxp[t] == 0) {
-				WRITE_ONCE(*theftp[t], THEFT_READY);
-				continue;
+	for_each_tid(t, tid)				//\lnlbl{flush:loop:b}
+		if (theftp[t] != NULL) {		//\lnlbl{flush:skip}
+			if (*countermaxp[t] == 0) {	//\lnlbl{flush:checkmax}
+				WRITE_ONCE(*theftp[t], THEFT_READY);//\lnlbl{flush:READY}
+				continue;		//\lnlbl{flush:next}
 			}
-			WRITE_ONCE(*theftp[t], THEFT_REQ);
-			pthread_kill(tid, SIGUSR1);
-		}
-	for_each_tid(t, tid) {
-		if (theftp[t] == NULL)
-			continue;
-		while (READ_ONCE(*theftp[t]) != THEFT_READY) {
-			poll(NULL, 0, 1);
-			if (READ_ONCE(*theftp[t]) == THEFT_REQ)
-				pthread_kill(tid, SIGUSR1);
-		}
-		globalcount += *counterp[t];
+			WRITE_ONCE(*theftp[t], THEFT_REQ);//\lnlbl{flush:REQ}
+			pthread_kill(tid, SIGUSR1);	//\lnlbl{flush:signal}
+		}					//\lnlbl{flush:loop:e}
+	for_each_tid(t, tid) {				//\lnlbl{flush:loop2:b}
+		if (theftp[t] == NULL)			//\lnlbl{flush:skip:nonexist}
+			continue;			//\lnlbl{flush:next2}
+		while (READ_ONCE(*theftp[t]) != THEFT_READY) {//\lnlbl{flush:loop3:b}
+			poll(NULL, 0, 1);		//\lnlbl{flush:block}
+			if (READ_ONCE(*theftp[t]) == THEFT_REQ)//\lnlbl{flush:check:REQ}
+				pthread_kill(tid, SIGUSR1);//\lnlbl{flush:signal2}
+		}					//\lnlbl{flush:loop3:e}
+		globalcount += *counterp[t];		//\lnlbl{flush:thiev:b}
 		*counterp[t] = 0;
 		globalreserve -= *countermaxp[t];
-		*countermaxp[t] = 0;
-		WRITE_ONCE(*theftp[t], THEFT_IDLE);
-	}
-}
+		*countermaxp[t] = 0;			//\lnlbl{flush:thiev:e}
+		WRITE_ONCE(*theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
+	}						//\lnlbl{flush:loop2:e}
+}							//\lnlbl{flush:e}
 
-static void balance_count(void)
+static void balance_count(void)				//\lnlbl{balance:b}
 {
-	countermax = globalcountmax - globalcount - globalreserve;
+	countermax = globalcountmax - globalcount -
+	             globalreserve;
 	countermax /= num_online_threads();
 	if (countermax > MAX_COUNTERMAX)
 		countermax = MAX_COUNTERMAX;
@@ -101,42 +105,49 @@ static void balance_count(void)
 	if (counter > globalcount)
 		counter = globalcount;
 	globalcount -= counter;
-}
+}							//\lnlbl{balance:e}
+//\end{snippet}
 
-int add_count(unsigned long delta)
+//\begin{snippet}[labelbase=ln:count:count_lim_sig:add,commandchars=\\\@\$]
+int add_count(unsigned long delta)			//\lnlbl{b}
 {
 	int fastpath = 0;
 
-	counting = 1;
-	barrier();
-	if (countermax - counter >= delta && READ_ONCE(theft) <= THEFT_REQ) {
-		counter += delta;
-		fastpath = 1;
+	counting = 1;					//\lnlbl{fast:b}
+	barrier();					//\lnlbl{barrier:1}
+	if (countermax - counter >= delta &&		//\lnlbl{check:b}
+	    READ_ONCE(theft) <= THEFT_REQ) {		//\lnlbl{check:e}
+		counter += delta;			//\lnlbl{add:f}
+		fastpath = 1;				//\lnlbl{fasttaken}
 	}
-	barrier();
-	counting = 0;
-	barrier();
-	if (READ_ONCE(theft) == THEFT_ACK) {
-		smp_mb();
-		WRITE_ONCE(theft, THEFT_READY);
+	barrier();					//\lnlbl{barrier:2}
+	counting = 0;					//\lnlbl{clearcnt}
+	barrier();					//\lnlbl{barrier:3}
+	if (READ_ONCE(theft) == THEFT_ACK) {		//\lnlbl{check:ACK}
+		smp_mb();				//\lnlbl{mb}
+		WRITE_ONCE(theft, THEFT_READY);		//\lnlbl{READY}
 	}
 	if (fastpath)
-		return 1;
-	spin_lock(&gblcnt_mutex);
+		return 1;				//\lnlbl{return:fs}
+	spin_lock(&gblcnt_mutex);			//\lnlbl{acquire}
 	globalize_count();
-	if (globalcountmax - globalcount - globalreserve < delta) {
+	if (globalcountmax - globalcount -
+	    globalreserve < delta) {
 		flush_local_count();
-		if (globalcountmax - globalcount - globalreserve < delta) {
-			spin_unlock(&gblcnt_mutex);
-			return 0;
+		if (globalcountmax - globalcount -
+		    globalreserve < delta) {
+			spin_unlock(&gblcnt_mutex);	//\lnlbl{release:f}
+			return 0;			//\lnlbl{return:sf}
 		}
 	}
 	globalcount += delta;
 	balance_count();
 	spin_unlock(&gblcnt_mutex);
-	return 1;
-}
+	return 1;					//\lnlbl{return:ss}
+}							//\lnlbl{e}
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:count:count_lim_sig:sub,commandchars=\\\@\$]
 int sub_count(unsigned long delta)
 {
 	int fastpath = 0;
@@ -170,7 +181,9 @@ int sub_count(unsigned long delta)
 	spin_unlock(&gblcnt_mutex);
 	return 1;
 }
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:count:count_lim_sig:read,commandchars=\\\@\$]
 unsigned long read_count(void)
 {
 	int t;
@@ -184,8 +197,10 @@ unsigned long read_count(void)
 	spin_unlock(&gblcnt_mutex);
 	return sum;
 }
+//\end{snippet}
 
-void count_init(void)
+//\begin{snippet}[labelbase=ln:count:count_lim_sig:initialization,commandchars=\\\@\$]
+void count_init(void)					//\lnlbl{init:b}
 {
 	struct sigaction sa;
 
@@ -196,7 +211,7 @@ void count_init(void)
 		perror("sigaction");
 		exit(EXIT_FAILURE);
 	}
-}
+}							//\lnlbl{init:e}
 
 void count_register_thread(void)
 {
@@ -220,6 +235,7 @@ void count_unregister_thread(int nthreadsexpected)
 	theftp[idx] = NULL;
 	spin_unlock(&gblcnt_mutex);
 }
+//\end{snippet}
 
 void count_cleanup(void)
 {
diff --git a/count/count.tex b/count/count.tex
index bdda590..d8d60db 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2342,131 +2342,54 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
 \label{sec:count:Signal-Theft Limit Counter Implementation}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 #define THEFT_IDLE  0
-  2 #define THEFT_REQ   1
-  3 #define THEFT_ACK   2
-  4 #define THEFT_READY 3
-  5 
-  6 int __thread theft = THEFT_IDLE;
-  7 int __thread counting = 0;
-  8 unsigned long __thread counter = 0;
-  9 unsigned long __thread countermax = 0;
- 10 unsigned long globalcountmax = 10000;
- 11 unsigned long globalcount = 0;
- 12 unsigned long globalreserve = 0;
- 13 unsigned long *counterp[NR_THREADS] = { NULL };
- 14 unsigned long *countermaxp[NR_THREADS] = { NULL };
- 15 int *theftp[NR_THREADS] = { NULL };
- 16 DEFINE_SPINLOCK(gblcnt_mutex);
- 17 #define MAX_COUNTERMAX 100
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_sig@data.fcv}
 \caption{Signal-Theft Limit Counter Data}
 \label{lst:count:Signal-Theft Limit Counter Data}
 \end{listing}
 
+\begin{lineref}[ln:count:count_lim_sig:data]
 Listing~\ref{lst:count:Signal-Theft Limit Counter Data}
 (\path{count_lim_sig.c})
 shows the data structures used by the signal-theft based counter
 implementation.
-Lines~1-7 define the states and values for the per-thread theft state machine
+Lines~\lnref{value:b}-\lnref{value:e} define the states and values
+for the per-thread theft state machine
 described in the preceding section.
-Lines~8-17 are similar to earlier implementations, with the addition of
-lines~14 and~15 to allow remote access to a thread's \co{countermax}
+Lines~\lnref{var:b}-\lnref{var:e} are similar to earlier implementations,
+with the addition of
+lines~\lnref{maxp} and~\lnref{theftp} to allow remote access to a
+thread's \co{countermax}
 and \co{theft} variables, respectively.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 static void globalize_count(void)
-  2 {
-  3   globalcount += counter;
-  4   counter = 0;
-  5   globalreserve -= countermax;
-  6   countermax = 0;
-  7 }
-  8 
-  9 static void flush_local_count_sig(int unused)
- 10 {
- 11   if (READ_ONCE(theft) != THEFT_REQ)
- 12     return;
- 13   smp_mb();
- 14   WRITE_ONCE(theft, THEFT_ACK);
- 15   if (!counting) {
- 16     WRITE_ONCE(theft, THEFT_READY);
- 17   }
- 18   smp_mb();
- 19 }
- 20 
- 21 static void flush_local_count(void)
- 22 {
- 23   int t;
- 24   thread_id_t tid;
- 25 
- 26   for_each_tid(t, tid)
- 27     if (theftp[t] != NULL) {
- 28       if (*countermaxp[t] == 0) {
- 29         WRITE_ONCE(*theftp[t], THEFT_READY);
- 30         continue;
- 31       }
- 32       WRITE_ONCE(*theftp[t], THEFT_REQ);
- 33       pthread_kill(tid, SIGUSR1);
- 34     }
- 35   for_each_tid(t, tid) {
- 36     if (theftp[t] == NULL)
- 37       continue;
- 38     while (READ_ONCE(*theftp[t]) != THEFT_READY) {
- 39       poll(NULL, 0, 1);
- 40       if (READ_ONCE(*theftp[t]) == THEFT_REQ)
- 41         pthread_kill(tid, SIGUSR1);
- 42     }
- 43     globalcount += *counterp[t];
- 44     *counterp[t] = 0;
- 45     globalreserve -= *countermaxp[t];
- 46     *countermaxp[t] = 0;
- 47     WRITE_ONCE(*theftp[t], THEFT_IDLE);
- 48   }
- 49 }
- 50 
- 51 static void balance_count(void)
- 52 {
- 53   countermax = globalcountmax -
- 54     globalcount - globalreserve;
- 55   countermax /= num_online_threads();
- 56   if (countermax > MAX_COUNTERMAX)
- 57     countermax = MAX_COUNTERMAX;
- 58   globalreserve += countermax;
- 59   counter = countermax / 2;
- 60   if (counter > globalcount)
- 61     counter = globalcount;
- 62   globalcount -= counter;
- 63 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_sig@migration.fcv}
 \caption{Signal-Theft Limit Counter Value-Migration Functions}
 \label{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
 \end{listing}
 
+\begin{lineref}[ln:count:count_lim_sig:migration:globalize]
 Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
 shows the functions responsible for migrating counts between per-thread
 variables and the global variables.
-Lines~1-7 shows \co{globalize_count()}, which is identical to earlier
+Lines~\lnref{b}-\lnref{e} shows \co{globalize_count()},
+which is identical to earlier
 implementations.
-Lines~9-19 shows \co{flush_local_count_sig()}, which is the signal
+\end{lineref}
+\begin{lineref}[ln:count:count_lim_sig:migration:flush_sig]
+Lines~\lnref{b}-\lnref{e} shows \co{flush_local_count_sig()},
+which is the signal
 handler used in the theft process.
-Lines~11 and~12 check to see if the \co{theft} state is REQ, and, if not
+Lines~\lnref{check:REQ} and~\lnref{return:n} check to see if
+the \co{theft} state is REQ, and, if not
 returns without change.
-Line~13 executes a memory barrier to ensure that the sampling of the
+Line~\lnref{mb:1} executes a memory barrier to ensure that the sampling of the
 theft variable happens before any change to that variable.
-Line~14 sets the \co{theft} state to ACK, and, if line~15 sees that
-this thread's fastpaths are not running, line~16 sets the \co{theft}
+Line~\lnref{set:ACK} sets the \co{theft} state to ACK, and, if
+line~\lnref{check:fast} sees that
+this thread's fastpaths are not running, line~\lnref{set:READY} sets the \co{theft}
 state to READY.
+\end{lineref}
 
 \QuickQuiz{}
 	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
@@ -2475,42 +2398,44 @@ state to READY.
 	the uses of the
 	\co{theft} per-thread variable?
 \QuickQuizAnswer{
-	The first one (on line~11) can be argued to be unnecessary.
-	The last two (lines~14 and~16) are important.
+	\begin{lineref}[ln:count:count_lim_sig:migration:flush_sig]
+	The first one (on line~\lnref{check:REQ}) can be argued to be unnecessary.
+	The last two (lines~\lnref{set:ACK} and~\lnref{set:READY}) are important.
 	If these are removed, the compiler would be within its rights
-	to rewrite lines~14-17 as follows:
-
-	\vspace{5pt}
-	\begin{minipage}[t]{\columnwidth}
-	\small
-	\begin{verbatim}
- 14   theft = THEFT_READY;
- 15   if (counting) {
- 16     theft = THEFT_ACK;
- 17   }
-	\end{verbatim}
-	\end{minipage}
-	\vspace{5pt}
+	to rewrite lines~\lnref{set:ACK}-\lnref{set:READY} as follows:
+	\end{lineref}
+
+\begin{VerbatimN}[firstnumber=14]
+theft = THEFT_READY;
+if (counting) {
+	theft = THEFT_ACK;
+}
+\end{VerbatimN}
 
 	This would be fatal, as the slowpath might see the transient
 	value of \co{THEFT_READY}, and start stealing before the
 	corresponding thread was ready.
 } \QuickQuizEnd
 
-Lines~21-49 shows \co{flush_local_count()}, which is called from the
+\begin{lineref}[ln:count:count_lim_sig:migration:flush]
+Lines~\lnref{b}-\lnref{e} shows \co{flush_local_count()}, which is called from the
 slowpath to flush all threads' local counts.
-The loop spanning lines~26-34 advances the \co{theft} state for each
+The loop spanning
+lines~\lnref{loop:b}-{loop:e} advances the \co{theft} state for each
 thread that has local count, and also sends that thread a signal.
-Line~27 skips any non-existent threads.
-Otherwise, line~28 checks to see if the current thread holds any local
-count, and, if not, line~29 sets the thread's \co{theft} state to READY
-and line~30 skips to the next thread.
-Otherwise, line~32 sets the thread's \co{theft} state to REQ and
-line~33 sends the thread a signal.
+Line~\lnref{skip} skips any non-existent threads.
+Otherwise, line~\lnref{checkmax} checks to see if the current thread holds any local
+count, and, if not, line~\lnref{READY} sets the thread's \co{theft} state to READY
+and line~\lnref{next} skips to the next thread.
+Otherwise, line~\lnref{REQ} sets the thread's \co{theft} state to REQ and
+line~\lnref{signal} sends the thread a signal.
+\end{lineref}
 
 \QuickQuiz{}
 	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
-	why is it safe for line~28 to directly access the other thread's
+	why is it safe for
+        line~\ref{ln:count:count_lim_sig:migration:flush:checkmax}
+        to directly access the other thread's
 	\co{countermax} variable?
 \QuickQuizAnswer{
 	Because the other thread is not permitted to change the value
@@ -2524,7 +2449,9 @@ line~33 sends the thread a signal.
 
 \QuickQuiz{}
 	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
-	why doesn't line~33 check for the current thread sending itself
+	why doesn't
+        line~\ref{ln:count:count_lim_sig:migration:flush:signal}
+        check for the current thread sending itself
 	a signal?
 \QuickQuizAnswer{
 	There is no need for an additional check.
@@ -2544,19 +2471,26 @@ line~33 sends the thread a signal.
 	handler and the code interrupted by the signal.
 } \QuickQuizEnd
 
-The loop spanning lines~35-48 waits until each thread reaches READY state,
+\begin{lineref}[ln:count:count_lim_sig:migration:flush]
+The loop spanning lines~\lnref{loop2:b}-\lnref{loop2:e} waits until each
+thread reaches READY state,
 then steals that thread's count.
-Lines~36-37 skip any non-existent threads, and the loop spanning
-lines~38-42 wait until the current thread's \co{theft} state becomes READY.
-Line~39 blocks for a millisecond to avoid priority-inversion problems,
-and if line~40 determines that the thread's signal has not yet arrived,
-line~41 resends the signal.
-Execution reaches line~43 when the thread's \co{theft} state becomes
-READY, so lines~43-46 do the thieving.
-Line~47 then sets the thread's \co{theft} state back to IDLE.
+Lines~\lnref{skip:nonexist}-\lnref{next2} skip any non-existent threads,
+and the loop spanning
+lines~\lnref{loop3:b}-\lnref{loop3:e} wait until the current
+thread's \co{theft} state becomes READY.
+Line~\lnref{block} blocks for a millisecond to avoid priority-inversion problems,
+and if line~\lnref{check:REQ} determines that the thread's signal has not yet arrived,
+line~\lnref{signal2} resends the signal.
+Execution reaches line~\lnref{thiev:b} when the thread's \co{theft} state becomes
+READY, so lines~\lnref{thiev:b}-\lnref{thiev:e} do the thieving.
+Line~\lnref{IDLE} then sets the thread's \co{theft} state back to IDLE.
+\end{lineref}
 
 \QuickQuiz{}
-	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}, why does line~41 resend the signal?
+	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
+        why does line~\ref{ln:count:count_lim_sig:migration:flush:signal2}
+        resend the signal?
 \QuickQuizAnswer{
 	Because many operating systems over several decades have
 	had the property of losing the occasional signal.
@@ -2568,153 +2502,66 @@ Line~47 then sets the thread's \co{theft} state back to IDLE.
 	\emph{Your} user application hanging!
 } \QuickQuizEnd
 
-Lines~51-63 show \co{balance_count()}, which is similar to that of
+\begin{lineref}[ln:count:count_lim_sig:migration:balance]
+Lines~\lnref{b}-\lnref{e} show \co{balance_count()}, which is similar to that of
 earlier examples.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 int add_count(unsigned long delta)
-  2 {
-  3   int fastpath = 0;
-  4 
-  5   counting = 1;
-  6   barrier();
-  7   if (countermax - counter >= delta &&
-  8       READ_ONCE(theft) <= THEFT_REQ) {
-  9     counter += delta;
- 10     fastpath = 1;
- 11   }
- 12   barrier();
- 13   counting = 0;
- 14   barrier();
- 15   if (READ_ONCE(theft) == THEFT_ACK) {
- 16     smp_mb();
- 17     WRITE_ONCE(theft, THEFT_READY);
- 18   }
- 19   if (fastpath)
- 20     return 1;
- 21   spin_lock(&gblcnt_mutex);
- 22   globalize_count();
- 23   if (globalcountmax - globalcount -
- 24       globalreserve < delta) {
- 25     flush_local_count();
- 26     if (globalcountmax - globalcount -
- 27         globalreserve < delta) {
- 28       spin_unlock(&gblcnt_mutex);
- 29       return 0;
- 30     }
- 31   }
- 32   globalcount += delta;
- 33   balance_count();
- 34   spin_unlock(&gblcnt_mutex);
- 35   return 1;
- 36 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_sig@add.fcv}
 \caption{Signal-Theft Limit Counter Add Function}
 \label{lst:count:Signal-Theft Limit Counter Add Function}
 \end{listing}
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 38 int sub_count(unsigned long delta)
- 39 {
- 40   int fastpath = 0;
- 41 
- 42   counting = 1;
- 43   barrier();
- 44   if (counter >= delta &&
- 45       READ_ONCE(theft) <= THEFT_REQ) {
- 46     counter -= delta;
- 47     fastpath = 1;
- 48   }
- 49   barrier();
- 50   counting = 0;
- 51   barrier();
- 52   if (READ_ONCE(theft) == THEFT_ACK) {
- 53     smp_mb();
- 54     WRITE_ONCE(theft, THEFT_READY);
- 55   }
- 56   if (fastpath)
- 57     return 1;
- 58   spin_lock(&gblcnt_mutex);
- 59   globalize_count();
- 60   if (globalcount < delta) {
- 61     flush_local_count();
- 62     if (globalcount < delta) {
- 63       spin_unlock(&gblcnt_mutex);
- 64       return 0;
- 65     }
- 66   }
- 67   globalcount -= delta;
- 68   balance_count();
- 69   spin_unlock(&gblcnt_mutex);
- 70   return 1;
- 71 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_sig@sub.fcv}
 \caption{Signal-Theft Limit Counter Subtract Function}
 \label{lst:count:Signal-Theft Limit Counter Subtract Function}
 \end{listing}
 
+\begin{lineref}[ln:count:count_lim_sig:add]
 Listing~\ref{lst:count:Signal-Theft Limit Counter Add Function}
 shows the \co{add_count()} function.
-The fastpath spans lines~5-20, and the slowpath lines~21-35.
-Line~5 sets the per-thread \co{counting} variable to 1 so that
+The fastpath spans lines~\lnref{fast:b}-\lnref{return:fs}, and the slowpath
+lines~\lnref{acquire}-\lnref{return:ss}.
+Line~\lnref{fast:b} sets the per-thread \co{counting} variable to 1 so that
 any subsequent signal handlers interrupting this thread will
 set the \co{theft} state to ACK rather than READY, allowing this
 fastpath to complete properly.
-Line~6 prevents the compiler from reordering any of the fastpath body
+Line~\lnref{barrier:1} prevents the compiler from reordering any of the fastpath body
 to precede the setting of \co{counting}.
-Lines~7 and~8 check to see if the per-thread data can accommodate
+Lines~\lnref{check:b} and~\lnref{check:e} check to see
+if the per-thread data can accommodate
 the \co{add_count()} and if there is no ongoing theft in progress,
-and if so line~9 does the fastpath addition and line~10 notes that
+and if so line~\lnref{add:f} does the fastpath addition and
+line~\lnref{fasttaken} notes that
 the fastpath was taken.
 
-In either case, line~12 prevents the compiler from reordering the
-fastpath body to follow line~13, which permits any subsequent signal
+In either case, line~\lnref{barrier:2} prevents the compiler from reordering the
+fastpath body to follow line~\lnref{clearcnt}, which permits any subsequent signal
 handlers to undertake theft.
-Line~14 again disables compiler reordering, and then line~15
+Line~\lnref{barrier:3} again disables compiler reordering, and then
+line~\lnref{check:ACK}
 checks to see if the signal handler deferred the \co{theft}
-state-change to READY, and, if so, line~16 executes a memory
-barrier to ensure that any CPU that sees line~17 setting state to
-READY also sees the effects of line~9.
-If the fastpath addition at line~9 was executed, then line~20 returns
+state-change to READY, and, if so, line~\lnref{mb} executes a memory
+barrier to ensure that any CPU that sees line~\lnref{READY} setting state to
+READY also sees the effects of line~\lnref{add:f}.
+If the fastpath addition at line~\lnref{add:f} was executed, then
+line~\lnref{return:fs} returns
 success.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 unsigned long read_count(void)
-  2 {
-  3   int t;
-  4   unsigned long sum;
-  5 
-  6   spin_lock(&gblcnt_mutex);
-  7   sum = globalcount;
-  8   for_each_thread(t)
-  9     if (counterp[t] != NULL)
- 10       sum += *counterp[t];
- 11   spin_unlock(&gblcnt_mutex);
- 12   return sum;
- 13 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_sig@read.fcv}
 \caption{Signal-Theft Limit Counter Read Function}
 \label{lst:count:Signal-Theft Limit Counter Read Function}
 \end{listing}
 
-Otherwise, we fall through to the slowpath starting at line~21.
+\begin{lineref}[ln:count:count_lim_sig:add]
+Otherwise, we fall through to the slowpath starting at line~\lnref{acquire}.
 The structure of the slowpath is similar to those of earlier examples,
 so its analysis is left as an exercise to the reader.
+\end{lineref}
 Similarly, the structure of \co{sub_count()} on
 Listing~\ref{lst:count:Signal-Theft Limit Counter Subtract Function}
 is the same
@@ -2724,52 +2571,13 @@ left as an exercise for the reader, as is the analysis of
 Listing~\ref{lst:count:Signal-Theft Limit Counter Read Function}.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 void count_init(void)
-  2 {
-  3   struct sigaction sa;
-  4 
-  5   sa.sa_handler = flush_local_count_sig;
-  6   sigemptyset(&sa.sa_mask);
-  7   sa.sa_flags = 0;
-  8   if (sigaction(SIGUSR1, &sa, NULL) != 0) {
-  9     perror("sigaction");
- 10     exit(-1);
- 11   }
- 12 }
- 13 
- 14 void count_register_thread(void)
- 15 {
- 16   int idx = smp_thread_id();
- 17 
- 18   spin_lock(&gblcnt_mutex);
- 19   counterp[idx] = &counter;
- 20   countermaxp[idx] = &countermax;
- 21   theftp[idx] = &theft;
- 22   spin_unlock(&gblcnt_mutex);
- 23 }
- 24 
- 25 void count_unregister_thread(int nthreadsexpected)
- 26 {
- 27   int idx = smp_thread_id();
- 28 
- 29   spin_lock(&gblcnt_mutex);
- 30   globalize_count();
- 31   counterp[idx] = NULL;
- 32   countermaxp[idx] = NULL;
- 33   theftp[idx] = NULL;
- 34   spin_unlock(&gblcnt_mutex);
- 35 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_sig@initialization.fcv}
 \caption{Signal-Theft Limit Counter Initialization Functions}
 \label{lst:count:Signal-Theft Limit Counter Initialization Functions}
 \end{listing}
 
-Lines~1-12 of
+\begin{lineref}[ln:count:count_lim_sig:initialization:init]
+Lines~\lnref{b}-\lnref{e} of
 Listing~\ref{lst:count:Signal-Theft Limit Counter Initialization Functions}
 show \co{count_init()}, which set up \co{flush_local_count_sig()}
 as the signal handler for \co{SIGUSR1},
@@ -2778,6 +2586,7 @@ to invoke \co{flush_local_count_sig()}.
 The code for thread registry and unregistry is similar to that of
 earlier examples, so its analysis is left as an exercise for the
 reader.
+\end{lineref}
 
 \subsection{Signal-Theft Limit Counter Discussion}
 
-- 
2.7.4


