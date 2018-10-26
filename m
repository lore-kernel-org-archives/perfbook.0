Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zkehxMGBS7uIDRh+BbzL6y3T0CphhzTIN/dD4Hcqk6M=;
        b=ksm585pb7EREElXLBIZnWsEPjl0ezdgcq84ceKLg95xz+PMFKobDDp90Fdriuo95/w
         a3wuUKLSTtfH2UJpmq12Kc91NBPmaH7v/TVDZYA82JRTr/fJ1xGCSk7kFiQNjGjS1awU
         hLNj4gD8v2cWW4VE6zb2hik8Fv8SyVwx7ugJD8KOOeOrH3nPLrHKfzoDsZ6a7NC+GS0U
         vttEMGo9nT4rDHNeW9vjJ9I+7Jwi9FNrivFeRL6pBCMqIpjSXJscY7njiAvX4k7wr0iG
         5JPa1L0JJqT3lfgfcKhayap3lBhu3dt1Rm3XED400aB2X4ZYRcV45EFzz+RphDxbSXMn
         iUAQ==
Subject: [PATCH 6/7] toolsoftrade: Employ new scheme for snippets of
 threadcreate.c
References: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f58d5bb6-42a8-0491-475d-eca87f4761f8@gmail.com>
Date: Sat, 27 Oct 2018 00:29:28 +0900
MIME-Version: 1.0
In-Reply-To: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 334b421f68729c28fac868f5d89af6d4aa6d1090 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 14 Oct 2018 20:47:07 +0900
Subject: [PATCH 6/7] toolsoftrade: Employ new scheme for snippets of threadcreate.c

Also convert snippets of thread API, locking API, and per-thread API.
As the snippet of thread API fits the column width of 2c layout,
use "listing" environment instead of "listing*".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/intro/threadcreate.c | 20 +++++----
 toolsoftrade/toolsoftrade.tex    | 90 ++++++++++------------------------------
 2 files changed, 34 insertions(+), 76 deletions(-)

diff --git a/CodeSamples/intro/threadcreate.c b/CodeSamples/intro/threadcreate.c
index 94cde89..381742a 100644
--- a/CodeSamples/intro/threadcreate.c
+++ b/CodeSamples/intro/threadcreate.c
@@ -20,14 +20,16 @@
 
 #include "../api.h"
 
+//\begin{snippet}[labelbase=ln:intro:threadcreate:thread_test,commandchars=\@\[\]]
 void *thread_test(void *arg)
 {
 	int myarg = (intptr_t)arg;
 
 	printf("child thread %d: smp_thread_id() = %d\n",
 	       myarg, smp_thread_id());
-	return NULL;
+	return NULL;				//\lnlbl{return}
 }
+//\end{snippet}
 
 void usage(char *progname)
 {
@@ -36,29 +38,31 @@ void usage(char *progname)
 	exit(-1);
 }
 
+//\begin{snippet}[labelbase=ln:intro:threadcreate:main,commandchars=\@\^\$]
 int main(int argc, char *argv[])
 {
 	int i;
 	int nkids = 1;
 
-	smp_init();
+	smp_init();					//\lnlbl{smp_init}
 
-	if (argc > 1) {
+	if (argc > 1) {					//\lnlbl{parse:b}
 		nkids = strtoul(argv[1], NULL, 0);
 		if (nkids > NR_THREADS) {
 			fprintf(stderr, "nkids = %d too large, max = %d\n",
 				nkids, NR_THREADS);
 			usage(argv[0]);
 		}
-	}
-	printf("Parent thread spawning %d threads.\n", nkids);
+	}						//\lnlbl{parse:e}
+	printf("Parent thread spawning %d threads.\n", nkids); //\lnlbl{announce}
 
-	for (i = 0; i < nkids; i++)
-		create_thread(thread_test, (void *)(intptr_t)i);
+	for (i = 0; i < nkids; i++)			//\lnlbl{create:b}
+		create_thread(thread_test, (void *)(intptr_t)i); //\lnlbl{create:e}
 
-	wait_all_threads();
+	wait_all_threads();				//\lnlbl{wait}
 
 	printf("All spawned threads completed.\n");
 
 	exit(0);
 }
+//\end{snippet}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index f1a96ff..12dabd0 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1247,22 +1247,18 @@ The thread API is shown in
 Listing~\ref{lst:toolsoftrade:Thread API}, and members are described in the
 following sections.
 
-\begin{listing*}[tbp]
-{ \scriptsize
-\begin{verbbox}
+\begin{listing}[tbp]
+\begin{VerbatimL}[numbers=none,xleftmargin=2pt]
 int smp_thread_id(void)
 thread_id_t create_thread(void *(*func)(void *), void *arg)
 for_each_thread(t)
 for_each_running_thread(t)
 void *wait_thread(thread_id_t tid)
 void wait_all_threads(void)
-\end{verbbox}
-}
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Thread API}
 \label{lst:toolsoftrade:Thread API}
-\end{listing*}
+\end{listing}
 
 \subsubsection{\tco{create_thread()}}
 
@@ -1327,73 +1323,39 @@ a run, so such synchronization is normally not needed.
 
 \subsubsection{Example Usage}
 
-Listing~\ref{lst:toolsoftrade:Example Child Thread}
+Listing~\ref{lst:toolsoftrade:Example Child Thread} (\path{threadcreate.c})
 shows an example hello-world-like child thread.
 As noted earlier, each thread is allocated its own stack, so
 each thread has its own private \co{arg} argument and \co{myarg} variable.
 Each child simply prints its argument and its \co{smp_thread_id()}
 before exiting.
-Note that the \co{return} statement on line~7 terminates the thread,
+Note that the \co{return} statement on
+line~\ref{ln:intro:threadcreate:thread_test:return} terminates the thread,
 returning a \co{NULL} to whoever invokes \co{wait_thread()} on this
 thread.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 void *thread_test(void *arg)
-  2 {
-  3   int myarg = (int)arg;
-  4
-  5   printf("child thread %d: smp_thread_id() = %d\n",
-  6          myarg, smp_thread_id());
-  7   return NULL;
-  8 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/intro/threadcreate@thread_test.fcv}
 \caption{Example Child Thread}
 \label{lst:toolsoftrade:Example Child Thread}
 \end{listing}
 
+\begin{lineref}[ln:intro:threadcreate:main]
 The parent program is shown in
 Listing~\ref{lst:toolsoftrade:Example Parent Thread}.
 It invokes \co{smp_init()} to initialize the threading system on
-line~6,
-parses arguments on lines~7-14, and announces its presence on line~15.
-It creates the specified number of child threads on lines~16-17,
-and waits for them to complete on line~18.
+line~\lnref{smp_init},
+parses arguments on lines~\lnref{parse:b}-\lnref{parse:e},
+and announces its presence on line~\lnref{announce}.
+It creates the specified number of child threads on
+lines~\lnref{create:b}-\lnref{create:e},
+and waits for them to complete on line~\lnref{wait}.
 Note that \co{wait_all_threads()} discards the threads return values,
 as in this case they are all \co{NULL}, which is not very interesting.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 int main(int argc, char *argv[])
-  2 {
-  3   int i;
-  4   int nkids = 1;
-  5
-  6   smp_init();
-  7   if (argc > 1) {
-  8     nkids = strtoul(argv[1], NULL, 0);
-  9     if (nkids > NR_THREADS) {
- 10       fprintf(stderr, "nkids=%d too big, max=%d\n",
- 11         nkids, NR_THREADS);
- 12       usage(argv[0]);
- 13     }
- 14   }
- 15   printf("Parent spawning %d threads.\n", nkids);
- 16   for (i = 0; i < nkids; i++)
- 17     create_thread(thread_test, (void *)i);
- 18   wait_all_threads();
- 19   printf("All threads completed.\n", nkids);
- 20   return EXIT_SUCCESS;
- 21 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/intro/threadcreate@main.fcv}
 \caption{Example Parent Thread}
 \label{lst:toolsoftrade:Example Parent Thread}
 \end{listing}
@@ -1417,16 +1379,12 @@ each API element being described in the following sections.
 This book's CodeSamples locking API closely follows that of the Linux kernel.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
+\begin{VerbatimL}[numbers=none]
 void spin_lock_init(spinlock_t *sp);
 void spin_lock(spinlock_t *sp);
 int spin_trylock(spinlock_t *sp);
 void spin_unlock(spinlock_t *sp);
-\end{verbbox}
-}
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Locking API}
 \label{lst:toolsoftrade:Locking API}
 \end{listing}
@@ -2271,18 +2229,14 @@ Although this API is, strictly speaking, not necessary\footnote{
 	You could instead use \co{__thread} or \co{_Thread_local}.},
 it can provide a good userspace analogy to Linux kernel code.
 
-\begin{listing}[htbp]
-{ \scriptsize
-\begin{verbbox}
+\begin{listing}[tbp]
+\begin{VerbatimL}[numbers=none]
 DEFINE_PER_THREAD(type, name)
 DECLARE_PER_THREAD(type, name)
 per_thread(name, thread)
 __get_thread_var(name)
 init_per_thread(name, v)
-\end{verbbox}
-}
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Per-Thread-Variable API}
 \label{lst:toolsoftrade:Per-Thread-Variable API}
 \end{listing}
-- 
2.7.4


