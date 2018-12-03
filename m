Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xY0wf/1PMkA1q+L0Dp6zJ+6EQyxd934njk9J7HNB0Ik=;
        b=XD9N6V0xQeLcIgl3ZS0AzR8Ky/PkWRz/IDhvi0ZyuUtKs7hk+jKH9+4b1gz+mjzRBj
         QBGSIrlqMVJ+3Rl0nblfX/SPi3frv8PX8qQzpt4hQ9Dwe8YSj3NmuO64SKzZsIrcXjsb
         OKntFQzkLtTVwmZDVKDHVJZ2UO2Mt3vPMNJ5/YcxS0Qt0VRIipTU2L16urSThSCHo8Nw
         XHkdDIWe+uaLj4NTHzFrsJZxYjHoBMW3e87sbj9ojAi1rwPt0VU0cdZJhs9OnI0Cx6gV
         8BofJR/B3x2eMq12GnRtdyjG/JZ0jkO5D4TqF+xRyICYvRrX5uRlmXZE1dRPK7GsAhIX
         WDGw==
Subject: [PATCH 3/6] defer: Employ new scheme for snippet of seqlock.h
References: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3146cd36-f60a-e090-25e7-7b02d750f4f2@gmail.com>
Date: Tue, 4 Dec 2018 00:39:40 +0900
MIME-Version: 1.0
In-Reply-To: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6a5f865a117ceea5b924506b9bd55f622b95365f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 4 Dec 2018 00:15:45 +0900
Subject: [PATCH 3/6] defer: Employ new scheme for snippet of seqlock.h

Also convert inline snippets in hazptr.tex.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/seqlock.h |  55 +++++++++--------
 defer/seqlock.tex           | 146 +++++++++++++++++---------------------------
 2 files changed, 85 insertions(+), 116 deletions(-)

diff --git a/CodeSamples/defer/seqlock.h b/CodeSamples/defer/seqlock.h
index c994285..dece371 100644
--- a/CodeSamples/defer/seqlock.h
+++ b/CodeSamples/defer/seqlock.h
@@ -18,50 +18,53 @@
  * Copyright (c) 2008 Paul E. McKenney, IBM Corporation.
  */
 
-typedef struct {
-	unsigned long seq;
+//\begin{snippet}[labelbase=ln:defer:seqlock:impl,commandchars=\\\[\]]
+typedef struct {				//\lnlbl{typedef:b}
+	unsigned long seq;			//\lnlbl{typedef:seq}
 	spinlock_t lock;
-} seqlock_t;
+} seqlock_t;					//\lnlbl{typedef:e}
 
-#define DEFINE_SEQ_LOCK(name) seqlock_t name = { \
-	.seq = 0, \
-	.lock = __SPIN_LOCK_UNLOCKED(name.lock), \
-};
-
-static inline void seqlock_init(seqlock_t *slp)
+#define DEFINE_SEQ_LOCK(name) seqlock_t name = { 	/* \fcvexclude */ \
+	.seq = 0,					/* \fcvexclude */ \
+	.lock = __SPIN_LOCK_UNLOCKED(name.lock),	/* \fcvexclude */ \
+};							/* \fcvexclude */
+							/* \fcvexclude */
+static inline void seqlock_init(seqlock_t *slp)		//\lnlbl{init:b}
 {
 	slp->seq = 0;
 	spin_lock_init(&slp->lock);
-}
+}							//\lnlbl{init:e}
 
-static inline unsigned long read_seqbegin(seqlock_t *slp)
+static inline unsigned long read_seqbegin(seqlock_t *slp) //\lnlbl{read_seqbegin:b}
 {
 	unsigned long s;
 
-	s = READ_ONCE(slp->seq);
-	smp_mb();
-	return s & ~0x1UL;
-}
+	s = READ_ONCE(slp->seq);			//\lnlbl{read_seqbegin:fetch}
+	smp_mb();					//\lnlbl{read_seqbegin:mb}
+	return s & ~0x1UL;				//\lnlbl{read_seqbegin:ret}
+}							//\lnlbl{read_seqbegin:e}
 
-static inline int read_seqretry(seqlock_t *slp, unsigned long oldseq)
+static inline int read_seqretry(seqlock_t *slp,		//\lnlbl{read_seqretry:b}
+                                unsigned long oldseq)
 {
 	unsigned long s;
 
-	smp_mb();
-	s = READ_ONCE(slp->seq);
-	return s != oldseq;
-}
+	smp_mb();					//\lnlbl{read_seqretry:mb}
+	s = READ_ONCE(slp->seq);			//\lnlbl{read_seqretry:fetch}
+	return s != oldseq;				//\lnlbl{read_seqretry:ret}
+}							//\lnlbl{read_seqretry:e}
 
-static inline void write_seqlock(seqlock_t *slp)
+static inline void write_seqlock(seqlock_t *slp)	//\lnlbl{write_seqlock:b}
 {
 	spin_lock(&slp->lock);
 	++slp->seq;
 	smp_mb();
-}
+}							//\lnlbl{write_seqlock:e}
 
-static inline void write_sequnlock(seqlock_t *slp)
+static inline void write_sequnlock(seqlock_t *slp)	//\lnlbl{write_sequnlock:b}
 {
-	smp_mb();
-	++slp->seq;
+	smp_mb();					//\lnlbl{write_sequnlock:mb}
+	++slp->seq;					//\lnlbl{write_sequnlock:inc}
 	spin_unlock(&slp->lock);
-}
+}							//\lnlbl{write_sequnlock:e}
+//\end{snippet}
diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index 84da3c0..7fabc35 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -50,30 +50,22 @@ very rarely need to retry.
 } \QuickQuizEnd
 
 \begin{listing}[bp]
-{ \scriptsize
-\begin{verbbox}
-  1 do {
-  2   seq = read_seqbegin(&test_seqlock);
-  3   /* read-side access. */
-  4 } while (read_seqretry(&test_seqlock, seq));
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{VerbatimL}
+do {
+	seq = read_seqbegin(&test_seqlock);
+	/* read-side access. */
+} while (read_seqretry(&test_seqlock, seq));
+\end{VerbatimL}
 \caption{Sequence-Locking Reader}
 \label{lst:defer:Sequence-Locking Reader}
 \end{listing}
 
 \begin{listing}[bp]
-{ \scriptsize
-\begin{verbbox}
-  1 write_seqlock(&test_seqlock);
-  2 /* Update */
-  3 write_sequnlock(&test_seqlock);
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{VerbatimL}
+write_seqlock(&test_seqlock);
+/* Update */
+write_sequnlock(&test_seqlock);
+\end{VerbatimL}
 \caption{Sequence-Locking Writer}
 \label{lst:defer:Sequence-Locking Writer}
 \end{listing}
@@ -101,55 +93,7 @@ quantities used for timekeeping.
 It is also used in pathname traversal to detect concurrent rename operations.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1  typedef struct {
- 2    unsigned long seq;
- 3    spinlock_t lock;
- 4  } seqlock_t;
- 5
- 6  static void seqlock_init(seqlock_t *slp)
- 7  {
- 8    slp->seq = 0;
- 9    spin_lock_init(&slp->lock);
-10  }
-11
-12  static unsigned long read_seqbegin(seqlock_t *slp)
-13  {
-14    unsigned long s;
-15
-16    s = READ_ONCE(slp->seq);
-17    smp_mb();
-18    return s & ~0x1UL;
-19  }
-20
-21  static int read_seqretry(seqlock_t *slp,
-22                           unsigned long oldseq)
-23  {
-24    unsigned long s;
-25
-26    smp_mb();
-27    s = READ_ONCE(slp->seq);
-28    return s != oldseq;
-29  }
-30
-31  static void write_seqlock(seqlock_t *slp)
-32  {
-33    spin_lock(&slp->lock);
-34    ++slp->seq;
-35    smp_mb();
-36  }
-37
-38  static void write_sequnlock(seqlock_t *slp)
-39  {
-40    smp_mb();
-41    ++slp->seq;
-42    spin_unlock(&slp->lock);
-43  }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/seqlock@impl.fcv}
 \caption{Sequence-Locking Implementation}
 \label{lst:defer:Sequence-Locking Implementation}
 \end{listing}
@@ -157,18 +101,26 @@ It is also used in pathname traversal to detect concurrent rename operations.
 A simple implementation of sequence locks is shown in
 Listing~\ref{lst:defer:Sequence-Locking Implementation}
 (\path{seqlock.h}).
-The \co{seqlock_t} data structure is shown on lines~1-4, and contains
+\begin{lineref}[ln:defer:seqlock:impl:typedef]
+The \co{seqlock_t} data structure is shown on
+lines~\lnref{b}-\lnref{e}, and contains
 the sequence number along with a lock to serialize writers.
-Lines~6-10 show \co{seqlock_init()}, which, as the name indicates,
+\end{lineref}
+\begin{lineref}[ln:defer:seqlock:impl:init]
+Lines~\lnref{b}-\lnref{e} show \co{seqlock_init()}, which, as the name indicates,
 initializes a \co{seqlock_t}.
+\end{lineref}
 
-Lines~12-19 show \co{read_seqbegin()}, which begins a sequence-lock
+\begin{lineref}[ln:defer:seqlock:impl:read_seqbegin]
+Lines~\lnref{b}-\lnref{e} show \co{read_seqbegin()}, which begins a sequence-lock
 read-side critical section.
-Line~16 takes a snapshot of the sequence counter, and line~17 orders
+Line~\lnref{fetch} takes a snapshot of the sequence counter, and
+line~\lnref{mb} orders
 this snapshot operation before the caller's critical section.
-Finally, line~18 returns the value of the snapshot (with the least-significant
+Finally, line~\lnref{ret} returns the value of the snapshot (with the least-significant
 bit cleared), which the caller
 will pass to a later call to \co{read_seqretry()}.
+\end{lineref}
 
 \QuickQuiz{}
 	Why not have \co{read_seqbegin()} in
@@ -185,17 +137,20 @@ will pass to a later call to \co{read_seqretry()}.
 	check internal to \co{read_seqbegin()} might be preferable.
 } \QuickQuizEnd
 
-Lines~21-29 show \co{read_seqretry()}, which returns true if there
+\begin{lineref}[ln:defer:seqlock:impl:read_seqretry]
+Lines~\lnref{b}-\lnref{e} show \co{read_seqretry()}, which returns true if there
 was at least one writer since the time of the corresponding
 call to \co{read_seqbegin()}.
-Line~26 orders the caller's prior critical section before line~27's
+Line~\lnref{mb} orders the caller's prior critical section before line~\lnref{fetch}'s
 fetch of the new snapshot of the sequence counter.
-Finally, line~28 checks whether the sequence counter has changed,
+Finally, line~\lnref{ret} checks whether the sequence counter has changed,
 in other words, whether there has been at least one writer, and returns
 true if so.
+\end{lineref}
 
 \QuickQuiz{}
-	Why is the \co{smp_mb()} on line~26 of
+	Why is the \co{smp_mb()} on
+	line~\ref{ln:defer:seqlock:impl:read_seqretry:mb} of
 	Listing~\ref{lst:defer:Sequence-Locking Implementation}
 	needed?
 \QuickQuizAnswer{
@@ -213,19 +168,23 @@ true if so.
 \QuickQuizAnswer{
 	In older versions of the Linux kernel, no.
 
-	In very new versions of the Linux kernel, line~16 could use
+	\begin{lineref}[ln:defer:seqlock:impl]
+	In very new versions of the Linux kernel,
+        line~\lnref{read_seqbegin:fetch} could use
 	\co{smp_load_acquire()} instead of \co{READ_ONCE()}, which
-	in turn would allow the \co{smp_mb()} on line~17 to be dropped.
-	Similarly, line~41 could use an \co{smp_store_release()}, for
+	in turn would allow the \co{smp_mb()} on
+        line~\lnref{read_seqbegin:mb} to be dropped.
+	Similarly, line~\lnref{write_sequnlock:inc} could use an
+        \co{smp_store_release()}, for
 	example, as follows:
 
-\begin{minipage}[c][5ex][c]{\columnwidth}\scriptsize
-\begin{verbatim}
+\begin{VerbatimU}
 smp_store_release(&slp->seq, READ_ONCE(slp->seq) + 1);
-\end{verbatim}
-\end{minipage}
+\end{VerbatimU}
 
-	This would allow the \co{smp_mb()} on line~40 to be dropped.
+	This would allow the \co{smp_mb()} on
+	line~\lnref{write_sequnlock:mb} to be dropped.
+	\end{lineref}
 } \QuickQuizEnd
 
 \QuickQuiz{}
@@ -239,12 +198,16 @@ smp_store_release(&slp->seq, READ_ONCE(slp->seq) + 1);
 	situation, in which case, go wild with the sequence-locking updates!
 } \QuickQuizEnd
 
-Lines~31-36 show \co{write_seqlock()}, which simply acquires the lock,
+\begin{lineref}[ln:defer:seqlock:impl:write_seqlock]
+Lines~\lnref{b}-\lnref{e} show \co{write_seqlock()}, which simply acquires the lock,
 increments the sequence number, and executes a memory barrier to ensure
 that this increment is ordered before the caller's critical section.
-Lines~38-43 show \co{write_sequnlock()}, which executes a memory barrier
+\end{lineref}
+\begin{lineref}[ln:defer:seqlock:impl:write_sequnlock]
+Lines~\lnref{b}-\lnref{e} show \co{write_sequnlock()}, which executes a memory barrier
 to ensure that the caller's critical section is ordered before the
-increment of the sequence number on line~44, then releases the lock.
+increment of the sequence number on line~\lnref{inc}, then releases the lock.
+\end{lineref}
 
 \QuickQuiz{}
 	What if something else serializes writers, so that the lock
@@ -255,7 +218,8 @@ increment of the sequence number on line~44, then releases the lock.
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	Why isn't \co{seq} on line~2 of
+	Why isn't \co{seq} on
+	line~\ref{ln:defer:seqlock:impl:typedef:seq} of
 	Listing~\ref{lst:defer:Sequence-Locking Implementation}
 	\co{unsigned} rather than \co{unsigned long}?
 	After all, if \co{unsigned} is good enough for the Linux
@@ -266,7 +230,9 @@ increment of the sequence number on line~44, then releases the lock.
 	it to ignore the following sequence of events:
 	\begin{enumerate}
 	\item	Thread~0 executes \co{read_seqbegin()}, picking up
-		\co{->seq} in line~16, noting that the value is even,
+		\co{->seq} in
+		line~\ref{ln:defer:seqlock:impl:read_seqbegin:fetch},
+		noting that the value is even,
 		and thus returning to the caller.
 	\item	Thread~0 starts executing its read-side critical section,
 		but is then preempted for a long time.
-- 
2.7.4


