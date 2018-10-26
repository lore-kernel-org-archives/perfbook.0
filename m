Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SJ27r96aSMr5QSydpEp+hYyfX9S5YF8Yiog3SIA6y/k=;
        b=ssf6TqdorvO0TXMEipvboPnfu5Hd5dwA1CTp0BwuqK+QTeXtQGctQ5rK8FyDaL4fHE
         um80fYM0WKqhLPMEZB9klhLDJn6cPfFEL5VR2KcWZ7c91LBDKy2b02Vj2QyXs3CEN0rI
         s9+XXDd1RKuM6sM3xPk6p+4Ui+ZMjbNFGNb8QgwE1QBcT4pyx/PEmZDa83mj+foC/XEn
         bOzNU8AKNGdkQQQu6UDRt6INPt41bIpcjIET7Q6pUjgQMTNu7C12WbPd7iIkWP/rybT4
         vLTfhbZgKS38c8e7ZC1Kw9HPg89ubopzDncWkDeUys2GtoEkYyZ8cProXA1SJDsHnKNS
         Du8Q==
Subject: [PATCH 3/7] toolsoftrade: Employ new scheme for snippets of lock.c
References: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3f5b8e5b-fe66-c754-baac-d6962b716990@gmail.com>
Date: Sat, 27 Oct 2018 00:26:16 +0900
MIME-Version: 1.0
In-Reply-To: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4bf3961a5c8501a9983a196119038b74cff7a18d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 14 Oct 2018 16:23:34 +0900
Subject: [PATCH 3/7] toolsoftrade: Employ new scheme for snippets of lock.c

NOTE: Several "if" statements, which are too wide for 2c layout,
are divided into a statement to get error code and a simple "if"
statement.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/toolsoftrade/lock.c |  76 +++++++++--------
 toolsoftrade/toolsoftrade.tex   | 175 +++++++++++-----------------------------
 2 files changed, 89 insertions(+), 162 deletions(-)

diff --git a/CodeSamples/toolsoftrade/lock.c b/CodeSamples/toolsoftrade/lock.c
index 6bb3c23..7b56c0f 100644
--- a/CodeSamples/toolsoftrade/lock.c
+++ b/CodeSamples/toolsoftrade/lock.c
@@ -26,62 +26,64 @@
 #include <errno.h>
 #include "../api.h"
 
-pthread_mutex_t lock_a = PTHREAD_MUTEX_INITIALIZER;
-pthread_mutex_t lock_b = PTHREAD_MUTEX_INITIALIZER;
+//\begin{snippet}[labelbase=ln:toolsoftrade:lock:reader_writer,commandchars=\$\[\]]
+pthread_mutex_t lock_a = PTHREAD_MUTEX_INITIALIZER;	//\lnlbl{lock_a}
+pthread_mutex_t lock_b = PTHREAD_MUTEX_INITIALIZER;	//\lnlbl{lock_b}
 
-int x = 0;
+int x = 0;						//\lnlbl{x}
 
-void *lock_reader(void *arg)
+void *lock_reader(void *arg)				//\lnlbl{reader:b}
 {
 	int en;
 	int i;
 	int newx = -1;
 	int oldx = -1;
-	pthread_mutex_t *pmlp = (pthread_mutex_t *)arg;
+	pthread_mutex_t *pmlp = (pthread_mutex_t *)arg;	//\lnlbl{reader:cast}
 
-	if ((en = pthread_mutex_lock(pmlp)) != 0) {
+	if ((en = pthread_mutex_lock(pmlp)) != 0) {	//\lnlbl{reader:acq:b}
 		fprintf(stderr, "lock_reader:pthread_mutex_lock: %s\n",
 			strerror(en));
 		exit(EXIT_FAILURE);
-	}
-	for (i = 0; i < 100; i++) {
-		newx = READ_ONCE(x);
+	}						//\lnlbl{reader:acq:e}
+	for (i = 0; i < 100; i++) {			//\lnlbl{reader:loop:b}
+		newx = READ_ONCE(x);			//\lnlbl{reader:read_x}
 		if (newx != oldx) {
 			printf("lock_reader(): x = %d\n", newx);
 		}
 		oldx = newx;
-		poll(NULL, 0, 1);
-	}
-	if ((en = pthread_mutex_unlock(pmlp)) != 0) {
+		poll(NULL, 0, 1);			//\lnlbl{reader:sleep}
+	}						//\lnlbl{reader:loop:e}
+	if ((en = pthread_mutex_unlock(pmlp)) != 0) {	//\lnlbl{reader:rel:b}
 		fprintf(stderr, "lock_reader:pthread_mutex_lock: %s\n",
 			strerror(en));
 		exit(EXIT_FAILURE);
-	}
-	return NULL;
-}
+	}						//\lnlbl{reader:rel:e}
+	return NULL;					//\lnlbl{reader:return}
+}							//\lnlbl{reader:e}
 
-void *lock_writer(void *arg)
+void *lock_writer(void *arg)				//\lnlbl{writer:b}
 {
 	int en;
 	int i;
-	pthread_mutex_t *pmlp = (pthread_mutex_t *)arg;
+	pthread_mutex_t *pmlp = (pthread_mutex_t *)arg;	//\lnlbl{writer:cast}
 
-	if ((en = pthread_mutex_lock(pmlp)) != 0) {
+	if ((en = pthread_mutex_lock(pmlp)) != 0) {	//\lnlbl{writer:acq:b}
 		fprintf(stderr, "lock_writer:pthread_mutex_lock: %s\n",
 			strerror(en));
 		exit(EXIT_FAILURE);
-	}
-	for (i = 0; i < 3; i++) {
-		WRITE_ONCE(x, READ_ONCE(x) + 1);
+	}						//\lnlbl{writer:acq:e}
+	for (i = 0; i < 3; i++) {			//\lnlbl{writer:loop:b}
+		WRITE_ONCE(x, READ_ONCE(x) + 1);	//\lnlbl{writer:inc}
 		poll(NULL, 0, 5);
-	}
-	if ((en = pthread_mutex_unlock(pmlp)) != 0) {
+	}						//\lnlbl{writer:loop:e}
+	if ((en = pthread_mutex_unlock(pmlp)) != 0) {	//\lnlbl{writer:rel:b}
 		fprintf(stderr, "lock_writer:pthread_mutex_lock: %s\n",
 			strerror(en));
 		exit(EXIT_FAILURE);
-	}
+	}						//\lnlbl{writer:rel:e}
 	return NULL;
-}
+}							//\lnlbl{writer:e}
+//\end{snippet}
 
 int main(int argc, char *argv[])
 {
@@ -90,31 +92,38 @@ int main(int argc, char *argv[])
 	pthread_t tid2;
 	void *vp;
 
+//\begin{snippet}[labelbase=ln:toolsoftrade:lock:same_lock,commandchars=\$\[\]]
 	printf("Creating two threads using same lock:\n");
-	if ((en = pthread_create(&tid1, NULL, lock_reader, &lock_a)) != 0) {
+	en = pthread_create(&tid1, NULL, lock_reader, &lock_a);	//\lnlbl{cr:reader:b}
+	if (en != 0) {
 		fprintf(stderr, "pthread_create: %s\n", strerror(en));
 		exit(EXIT_FAILURE);
-	}
-	if ((en = pthread_create(&tid2, NULL, lock_writer, &lock_a)) != 0) {
+	}							//\lnlbl{cr:reader:e}
+	en = pthread_create(&tid2, NULL, lock_writer, &lock_a); //\lnlbl{cr:writer:b}
+	if (en != 0) {
 		fprintf(stderr, "pthread_create: %s\n", strerror(en));
 		exit(EXIT_FAILURE);
-	}
-	if ((en = pthread_join(tid1, &vp)) != 0) {
+	}							//\lnlbl{cr:writer:e}
+	if ((en = pthread_join(tid1, &vp)) != 0) {	//\lnlbl{wait:b}
 		fprintf(stderr, "pthread_join: %s\n", strerror(en));
 		exit(EXIT_FAILURE);
 	}
 	if ((en = pthread_join(tid2, &vp)) != 0) {
 		fprintf(stderr, "pthread_join: %s\n", strerror(en));
 		exit(EXIT_FAILURE);
-	}
+	}						//\lnlbl{wait:e}
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:toolsoftrade:lock:diff_lock,commandchars=\$\[\]]
 	printf("Creating two threads w/different locks:\n");
 	x = 0;
-	if ((en = pthread_create(&tid1, NULL, lock_reader, &lock_a)) != 0) {
+	en = pthread_create(&tid1, NULL, lock_reader, &lock_a);
+	if (en != 0) {
 		fprintf(stderr, "pthread_create: %s\n", strerror(en));
 		exit(EXIT_FAILURE);
 	}
-	if ((en = pthread_create(&tid2, NULL, lock_writer, &lock_b)) != 0) {
+	en = pthread_create(&tid2, NULL, lock_writer, &lock_b);
+	if (en != 0) {
 		fprintf(stderr, "pthread_create: %s\n", strerror(en));
 		exit(EXIT_FAILURE);
 	}
@@ -126,6 +135,7 @@ int main(int argc, char *argv[])
 		fprintf(stderr, "pthread_join: %s\n", strerror(en));
 		exit(EXIT_FAILURE);
 	}
+//\end{snippet}
 
 	return EXIT_SUCCESS;
 }
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 601829c..e699b6e 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -460,82 +460,32 @@ lock~\cite{Hoare74}.
 } \QuickQuizEnd
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 pthread_mutex_t lock_a = PTHREAD_MUTEX_INITIALIZER;
-  2 pthread_mutex_t lock_b = PTHREAD_MUTEX_INITIALIZER;
-  3 int x = 0;
-  4 
-  5 void *lock_reader(void *arg)
-  6 {
-  7   int i;
-  8   int newx = -1;
-  9   int oldx = -1;
- 10   pthread_mutex_t *pmlp = (pthread_mutex_t *)arg;
- 11 
- 12   if (pthread_mutex_lock(pmlp) != 0) {
- 13     perror("lock_reader:pthread_mutex_lock");
- 14     exit(EXIT_FAILURE);
- 15   }
- 16   for (i = 0; i < 100; i++) {
- 17     newx = READ_ONCE(x);
- 18     if (newx != oldx) {
- 19       printf("lock_reader(): x = %d\n", newx);
- 20     }
- 21     oldx = newx;
- 22     poll(NULL, 0, 1);
- 23   }
- 24   if (pthread_mutex_unlock(pmlp) != 0) {
- 25     perror("lock_reader:pthread_mutex_unlock");
- 26     exit(EXIT_FAILURE);
- 27   }
- 28   return NULL;
- 29 }
- 30 
- 31 void *lock_writer(void *arg)
- 32 {
- 33   int i;
- 34   pthread_mutex_t *pmlp = (pthread_mutex_t *)arg;
- 35 
- 36   if (pthread_mutex_lock(pmlp) != 0) {
- 37     perror("lock_writer:pthread_mutex_lock");
- 38     exit(EXIT_FAILURE);
- 39   }
- 40   for (i = 0; i < 3; i++) {
- 41     WRITE_ONCE(x, READ_ONCE(x) + 1);
- 42     poll(NULL, 0, 5);
- 43   }
- 44   if (pthread_mutex_unlock(pmlp) != 0) {
- 45     perror("lock_writer:pthread_mutex_unlock");
- 46     exit(EXIT_FAILURE);
- 47   }
- 48   return NULL;
- 49 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/toolsoftrade/lock@reader_writer.fcv}
 \caption{Demonstration of Exclusive Locks}
 \label{lst:toolsoftrade:Demonstration of Exclusive Locks}
 \end{listing}
 
+\begin{lineref}[ln:toolsoftrade:lock:reader_writer]
 This exclusive-locking property is demonstrated using the code shown in
 Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
 (\path{lock.c}).
-Line~1 defines and initializes a POSIX lock named \co{lock_a}, while
-line~2 similarly defines and initializes a lock named \co{lock_b}.
-Line~3 defines and initializes a shared variable~\co{x}.
+Line~\lnref{lock_a} defines and initializes a POSIX lock named \co{lock_a}, while
+line~\lnref{lock_b} similarly defines and initializes a lock named \co{lock_b}.
+Line~\lnref{x} defines and initializes a shared variable~\co{x}.
+\end{lineref}
 
-Lines~5-28 defines a function \co{lock_reader()} which repeatedly
+\begin{lineref}[ln:toolsoftrade:lock:reader_writer:reader]
+Lines~\lnref{b}-\lnref{e} defines a function \co{lock_reader()} which repeatedly
 reads the shared variable \co{x} while holding
 the lock specified by \co{arg}.
-Line~10 casts \co{arg} to a pointer to a \co{pthread_mutex_t}, as
+Line~\lnref{cast} casts \co{arg} to a pointer to a \co{pthread_mutex_t}, as
 required by the \co{pthread_mutex_lock()} and \co{pthread_mutex_unlock()}
 primitives.
+\end{lineref}
 
 \QuickQuiz{}
 	Why not simply make the argument to \co{lock_reader()}
-	on line~5 of
+	on line~\ref{ln:toolsoftrade:lock:reader_writer:reader:b} of
 	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
 	be a pointer to a \co{pthread_mutex_t}?
 \QuickQuizAnswer{
@@ -547,9 +497,12 @@ primitives.
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	What is the \co{READ_ONCE()} on lines~17 and~41 and the
-	\co{WRITE_ONCE()} on line~41 of
+	\begin{lineref}[ln:toolsoftrade:lock:reader_writer]
+	What is the \co{READ_ONCE()} on
+        lines~\lnref{reader:read_x} and~\lnref{writer:inc} and the
+	\co{WRITE_ONCE()} on line~\lnref{writer:inc} of
 	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}?
+	\end{lineref}
 \QuickQuizAnswer{
 	These macros constrain the compiler so as to prevent it from
 	carrying out optimizations that would be problematic for concurrently
@@ -569,16 +522,21 @@ primitives.
 	Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}.
 } \QuickQuizEnd
 
-Lines~12-15 acquire the specified \co{pthread_mutex_t}, checking
+\begin{lineref}[ln:toolsoftrade:lock:reader_writer:reader]
+Lines~\lnref{acq:b}-\lnref{acq:e} acquire the specified
+\co{pthread_mutex_t}, checking
 for errors and exiting the program if any occur.
-Lines~16-23 repeatedly check the value of \co{x}, printing the new value
+Lines~\lnref{loop:b}-\lnref{loop:e} repeatedly check the value of \co{x},
+printing the new value
 each time that it changes.
-Line~22 sleeps for one millisecond, which allows this demonstration
+Line~\lnref{sleep} sleeps for one millisecond, which allows this demonstration
 to run nicely on a uniprocessor machine.
-Lines~24-27 release the \co{pthread_mutex_t}, again checking for
+Lines~\lnref{rel:b}-\lnref{rel:e} release the \co{pthread_mutex_t},
+again checking for
 errors and exiting the program if any occur.
-Finally, line~28 returns \co{NULL}, again to match the function type
+Finally, line~\lnref{return} returns \co{NULL}, again to match the function type
 required by \co{pthread_create()}.
+\end{lineref}
 
 \QuickQuiz{}
 	Writing four lines of code for each acquisition and release
@@ -593,55 +551,39 @@ required by \co{pthread_create()}.
 	\co{spin_lock()} and \co{spin_unlock()} APIs.
 } \QuickQuizEnd
 
-Lines~31-49 of
+\begin{lineref}[ln:toolsoftrade:lock:reader_writer:writer]
+Lines~\lnref{b}-\lnref{e} of
 Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
 shows \co{lock_writer()}, which
 periodically update the shared variable \co{x} while holding the
 specified \co{pthread_mutex_t}.
-As with \co{lock_reader()}, line~34 casts \co{arg} to a pointer
-to \co{pthread_mutex_t}, lines~36-39 acquires the specified lock,
-and lines~44-47 releases it.
-While holding the lock, lines~40-43 increment the shared variable \co{x},
+As with \co{lock_reader()}, line~\lnref{cast} casts \co{arg} to a pointer
+to \co{pthread_mutex_t},
+lines~\lnref{acq:b}-\lnref{acq:e} acquires the specified lock,
+and lines~\lnref{rel:b}-\lnref{rel:e} releases it.
+While holding the lock, lines~\lnref{loop:b}-\lnref{loop:e}
+increment the shared variable \co{x},
 sleeping for five milliseconds between each increment.
-Finally, lines~44-47 release the lock.
+Finally, lines~\lnref{rel:b}-\lnref{rel:e} release the lock.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1   printf("Creating two threads using same lock:\n");
-  2   if (pthread_create(&tid1, NULL,
-  3                      lock_reader, &lock_a) != 0) {
-  4     perror("pthread_create");
-  5     exit(EXIT_FAILURE);
-  6   }
-  7   if (pthread_create(&tid2, NULL,
-  8                      lock_writer, &lock_a) != 0) {
-  9     perror("pthread_create");
- 10     exit(EXIT_FAILURE);
- 11   }
- 12   if (pthread_join(tid1, &vp) != 0) {
- 13     perror("pthread_join");
- 14     exit(EXIT_FAILURE);
- 15   }
- 16   if (pthread_join(tid2, &vp) != 0) {
- 17     perror("pthread_join");
- 18     exit(EXIT_FAILURE);
- 19   }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/toolsoftrade/lock@same_lock.fcv}
 \caption{Demonstration of Same Exclusive Lock}
 \label{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
 \end{listing}
 
+\begin{lineref}[ln:toolsoftrade:lock:same_lock]
 Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
 shows a code fragment that runs \co{lock_reader()} and
 \co{lock_writer()} as threads using the same lock, namely, \co{lock_a}.
-Lines~2-6 create a thread running \co{lock_reader()}, and then
-Lines~7-11 create a thread running \co{lock_writer()}.
-Lines~12-19 wait for both threads to complete.
+Lines~\lnref{cr:reader:b}-\lnref{cr:reader:e} create a thread
+running \co{lock_reader()}, and then
+Lines~\lnref{cr:writer:b}-\lnref{cr:writer:e} create a thread
+running \co{lock_writer()}.
+Lines~\lnref{wait:b}-\lnref{wait:e} wait for both threads to complete.
 The output of this code fragment is as follows:
+\end{lineref}
 
 \begin{VerbatimU}
 Creating two threads using same lock:
@@ -672,32 +614,7 @@ by \co{lock_writer()} while holding the lock.
 } \QuickQuizEnd
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1   printf("Creating two threads w/different locks:\n");
-  2   x = 0;
-  3   if (pthread_create(&tid1, NULL,
-  4                      lock_reader, &lock_a) != 0) {
-  5     perror("pthread_create");
-  6     exit(EXIT_FAILURE);
-  7   }
-  8   if (pthread_create(&tid2, NULL,
-  9                      lock_writer, &lock_b) != 0) {
- 10     perror("pthread_create");
- 11     exit(EXIT_FAILURE);
- 12   }
- 13   if (pthread_join(tid1, &vp) != 0) {
- 14     perror("pthread_join");
- 15     exit(EXIT_FAILURE);
- 16   }
- 17   if (pthread_join(tid2, &vp) != 0) {
- 18     perror("pthread_join");
- 19     exit(EXIT_FAILURE);
- 20   }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/toolsoftrade/lock@diff_lock.fcv}
 \caption{Demonstration of Different Exclusive Locks}
 \label{lst:toolsoftrade:Demonstration of Different Exclusive Locks}
 \end{listing}
@@ -761,7 +678,7 @@ values of \co{x} stored by \co{lock_writer()}.
 	so why does it need to be initialized in
 	Listing~\ref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}?
 \QuickQuizAnswer{
-	See line~3 of
+	See line~\ref{ln:toolsoftrade:lock:reader_writer:x} of
 	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}.
 	Because the code in
 	Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
-- 
2.7.4


