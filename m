Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H7vfvkYG7G89mpmV6cn/wpOKxDPL1Yig6K1nDURqIp4=;
        b=Ck5fqSsEGRqK16xPClGF9nTOrz9kFgHkf4hw2s/M4daoOUCYrMYgLh4aKASG+vhYww
         FNCtW1PjF0TzDRDTfFBkCuUwmQvJlnvKs4Y6B4lHUJIaK0e20KOk9xwZ81TM+2PD4gWx
         iD+CXst9BOQB3lZXJxj2LpueYI+epOuu8ut+d/OndWsGajE3ocVBHWLvc1PIACol7HYy
         5KtU+xmKCz6m8/hMfp3Lys88Hidcnp/rddU/F7ivdc1oj7PoXqJjwg7j+Rq7fcAuhzny
         FnY4q+kNlhjYhWzQtmNjariCdADvp5NdGROCb5kXYaWTxvC2YA65dXTwGfxzlxoWw1u3
         kmdA==
Subject: [PATCH 4/7] toolsoftrade: Employ new scheme for snippet of
 rwlockscale.c
References: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <579adfe5-3427-8cba-fcd8-d898a216aa82@gmail.com>
Date: Sat, 27 Oct 2018 00:27:17 +0900
MIME-Version: 1.0
In-Reply-To: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5f85ee80de39323a192da10c4a25ae8ec0f4cd2c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 14 Oct 2018 18:00:26 +0900
Subject: [PATCH 4/7] toolsoftrade: Employ new scheme for snippet of rwlockscale.c

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/toolsoftrade/rwlockscale.c | 54 ++++++++++----------
 toolsoftrade/toolsoftrade.tex          | 93 +++++++++++-----------------------
 2 files changed, 57 insertions(+), 90 deletions(-)

diff --git a/CodeSamples/toolsoftrade/rwlockscale.c b/CodeSamples/toolsoftrade/rwlockscale.c
index affb5a2..b46837e 100644
--- a/CodeSamples/toolsoftrade/rwlockscale.c
+++ b/CodeSamples/toolsoftrade/rwlockscale.c
@@ -26,50 +26,52 @@
 #include <errno.h>
 #include "../api.h"
 
-pthread_rwlock_t rwl = PTHREAD_RWLOCK_INITIALIZER;
-int holdtime = 0;	/* # loops holding lock. */
-int thinktime = 0;	/* # loops not holding lock. */
-long long *readcounts;
-int nreadersrunning = 0;
+//\begin{snippet}[labelbase=ln:toolsoftrade:rwlockscale:reader,commandchars=\@\^\$]
+pthread_rwlock_t rwl = PTHREAD_RWLOCK_INITIALIZER;	//\lnlbl{rwlock}
+int holdtime = 0;	/* # loops holding lock. */	//\lnlbl{holdtm}
+int thinktime = 0;	/* # loops not holding lock. */	//\lnlbl{thinktm}
+long long *readcounts;					//\lnlbl{rdcnts}
+int nreadersrunning = 0;				//\lnlbl{nrdrun}
 
-#define GOFLAG_INIT 0
+#define GOFLAG_INIT 0					//\lnlbl{goflag:b}
 #define GOFLAG_RUN  1
 #define GOFLAG_STOP 2
-char goflag = GOFLAG_INIT;
+char goflag = GOFLAG_INIT;				//\lnlbl{goflag:e}
 
-void *reader(void *arg)
+void *reader(void *arg)					//\lnlbl{reader:b}
 {
 	int en;
 	int i;
 	long long loopcnt = 0;
 	long me = (long)arg;
 
-	__sync_fetch_and_add(&nreadersrunning, 1);
-	while (READ_ONCE(goflag) == GOFLAG_INIT) {
+	__sync_fetch_and_add(&nreadersrunning, 1);	//\lnlbl{reader:atmc_inc}
+	while (READ_ONCE(goflag) == GOFLAG_INIT) {	//\lnlbl{reader:wait:b}
 		continue;
-	}
-	while (READ_ONCE(goflag) == GOFLAG_RUN) {
-		if ((en = pthread_rwlock_rdlock(&rwl)) != 0) {
+	}						//\lnlbl{reader:wait:e}
+	while (READ_ONCE(goflag) == GOFLAG_RUN) {	//\lnlbl{reader:loop:b}
+		if ((en = pthread_rwlock_rdlock(&rwl)) != 0) {	//\lnlbl{reader:acq:b}
 			fprintf(stderr,
-				"pthread_rwlock_rdlock: %s\n", strerror(en));
+			        "pthread_rwlock_rdlock: %s\n", strerror(en));
 			exit(EXIT_FAILURE);
-		}
-		for (i = 1; i < holdtime; i++) {
+		}						//\lnlbl{reader:acq:e}
+		for (i = 1; i < holdtime; i++) {	//\lnlbl{reader:hold:b}
 			barrier();
-		}
-		if ((en = pthread_rwlock_unlock(&rwl)) != 0) {
+		}					//\lnlbl{reader:hold:e}
+		if ((en = pthread_rwlock_unlock(&rwl)) != 0) {	//\lnlbl{reader:rel:b}
 			fprintf(stderr,
 				"pthread_rwlock_unlock: %s\n", strerror(en));
 			exit(EXIT_FAILURE);
-		}
-		for (i = 1; i < thinktime; i++) {
+		}						//\lnlbl{reader:rel:e}
+		for (i = 1; i < thinktime; i++) {	//\lnlbl{reader:think:b}
 			barrier();
-		}
-		loopcnt++;
-	}
-	readcounts[me] = loopcnt;
-	return NULL;
-}
+		}					//\lnlbl{reader:think:e}
+		loopcnt++;				//\lnlbl{reader:count}
+	}						//\lnlbl{reader:loop:e}
+	readcounts[me] = loopcnt;			//\lnlbl{reader:mov_cnt}
+	return NULL;					//\lnlbl{reader:return}
+}							//\lnlbl{reader:e}
+//\end{snippet}
 
 int main(int argc, char *argv[])
 {
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index e699b6e..d808df6 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -722,87 +722,47 @@ However, in practice, we need to know how much additional scalability is
 provided by reader-writer locks.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 pthread_rwlock_t rwl = PTHREAD_RWLOCK_INITIALIZER;
-  2 int holdtime = 0;
-  3 int thinktime = 0;
-  4 long long *readcounts;
-  5 int nreadersrunning = 0;
-  6 
-  7 #define GOFLAG_INIT 0
-  8 #define GOFLAG_RUN  1
-  9 #define GOFLAG_STOP 2
- 10 char goflag = GOFLAG_INIT;
- 11 
- 12 void *reader(void *arg)
- 13 {
- 14   int i;
- 15   long long loopcnt = 0;
- 16   long me = (long)arg;
- 17 
- 18   __sync_fetch_and_add(&nreadersrunning, 1);
- 19   while (READ_ONCE(goflag) == GOFLAG_INIT) {
- 20     continue;
- 21   }
- 22   while (READ_ONCE(goflag) == GOFLAG_RUN) {
- 23     if (pthread_rwlock_rdlock(&rwl) != 0) {
- 24       perror("pthread_rwlock_rdlock");
- 25       exit(EXIT_FAILURE);
- 26     }
- 27     for (i = 1; i < holdtime; i++) {
- 28       barrier();
- 29     }
- 30     if (pthread_rwlock_unlock(&rwl) != 0) {
- 31       perror("pthread_rwlock_unlock");
- 32       exit(EXIT_FAILURE);
- 33     }
- 34     for (i = 1; i < thinktime; i++) {
- 35       barrier();
- 36     }
- 37     loopcnt++;
- 38   }
- 39   readcounts[me] = loopcnt;
- 40   return NULL;
- 41 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/toolsoftrade/rwlockscale@reader.fcv}
 \caption{Measuring Reader-Writer Lock Scalability}
 \label{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}
 \end{listing}
 
+\begin{lineref}[ln:toolsoftrade:rwlockscale:reader]
 Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}
 (\path{rwlockscale.c})
 shows one way of measuring reader-writer lock scalability.
-Line~1 shows the definition and initialization of the reader-writer
-lock, line~2 shows the \co{holdtime} argument controlling the
+Line~\lnref{rwlock} shows the definition and initialization of the reader-writer
+lock, line~\lnref{holdtm} shows the \co{holdtime} argument controlling the
 time each thread holds the reader-writer lock,
-line~3 shows the \co{thinktime} argument controlling the time between
+line~\lnref{thinktm} shows the \co{thinktime} argument controlling the time between
 the release of the reader-writer lock and the next acquisition,
-line~4 defines the \co{readcounts} array into which each reader thread
+line~\lnref{rdcnts} defines the \co{readcounts} array into which each reader thread
 places the number of times it acquired the lock, and
-line~5 defines the \co{nreadersrunning} variable, which
+line~\lnref{nrdrun} defines the \co{nreadersrunning} variable, which
 determines when all reader threads have started running.
 
-Lines~7-10 define \co{goflag}, which synchronizes the start and the
+Lines~\lnref{goflag:b}-\lnref{goflag:e} define \co{goflag},
+which synchronizes the start and the
 end of the test.
 This variable is initially set to \co{GOFLAG_INIT}, then set to
 \co{GOFLAG_RUN} after all the reader threads have started, and finally
 set to \co{GOFLAG_STOP} to terminate the test run.
+\end{lineref}
 
-Lines~12-41 define \co{reader()}, which is the reader thread.
-Line~18 atomically increments the \co{nreadersrunning} variable
+\begin{lineref}[ln:toolsoftrade:rwlockscale:reader:reader]
+Lines~\lnref{b}-\lnref{e} define \co{reader()}, which is the reader thread.
+Line~\lnref{atmc_inc} atomically increments the \co{nreadersrunning} variable
 to indicate that this thread is now running, and
-lines~19-21 wait for the test to start.
+lines~\lnref{wait:b}-\lnref{wait:e} wait for the test to start.
 The \co{READ_ONCE()} primitive forces the compiler to fetch \co{goflag}
 on each pass through the loop---the compiler would otherwise be within its
 rights to assume that the value of \co{goflag} would never change.
+\end{lineref}
 
 \QuickQuiz{}
 	Instead of using \co{READ_ONCE()} everywhere, why not just
-	declare \co{goflag} as \co{volatile} on line~10 of
+	declare \co{goflag} as \co{volatile} on
+        line~\ref{ln:toolsoftrade:rwlockscale:reader:goflag:e} of
 	Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}?
 \QuickQuizAnswer{
 	A \co{volatile} declaration is in fact a reasonable alternative in
@@ -867,16 +827,21 @@ rights to assume that the value of \co{goflag} would never change.
 	\co{__thread} variable in the corresponding element.
 } \QuickQuizEnd
 
-The loop spanning lines~22-38 carries out the performance test.
-Lines~23-26 acquire the lock, lines~27-29 hold the lock for the specified
+\begin{lineref}[ln:toolsoftrade:rwlockscale:reader:reader]
+The loop spanning lines~\lnref{loop:b}-\lnref{loop:e} carries out the performance test.
+Lines~\lnref{acq:b}-\lnref{acq:e} acquire the lock,
+lines~\lnref{hold:b}-\lnref{hold:e} hold the lock for the specified
 duration (and the \co{barrier()} directive prevents the compiler from
-optimizing the loop out of existence), lines~30-33 release the lock,
-and lines~34-36 wait for the specified duration before re-acquiring the
+optimizing the loop out of existence),
+lines~\lnref{rel:b}-\lnref{rel:e} release the lock,
+and lines~\lnref{think:b}-\lnref{think:e} wait for the specified
+duration before re-acquiring the
 lock.
-Line~37 counts this lock acquisition.
+Line~\lnref{count} counts this lock acquisition.
 
-Line~39 moves the lock-acquisition count to this thread's element of the
-\co{readcounts[]} array, and line~40 returns, terminating this thread.
+Line~\lnref{mov_cnt} moves the lock-acquisition count to this thread's element of the
+\co{readcounts[]} array, and line~\lnref{return} returns, terminating this thread.
+\end{lineref}
 
 \begin{figure}[tb]
 \centering
-- 
2.7.4


