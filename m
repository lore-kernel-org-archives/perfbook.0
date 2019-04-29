Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hGe/uOcz+Ww37EPHMReJAcm44NUqKdD9k63jZl8AULM=;
        b=TWw4mFG8ahzWbPrFlxJ/e7Hnj+5Ur2HL414ujkTtWv74dLIuf9EOCnNWO5dd/3XOjX
         wo1pCYJSYyo/FG+QSlfjFr+sLO8W1xXf8JovvTWKkAhiX3af6N1WBBhFFEssmQ5kvQdb
         4JhX4VE2SXLjh/GCMUmJCDgcQx+UWUYCBWN+7+GrBMe12KfNFINcu349KouZnZO1qDP9
         73VF84oAWDe5IQ4zeRIpdxZw8MSgWCJI1Ih6XNEGGFrxrg1ipfaFE82OGvvwpD0a3TYy
         rYi/s0VDrypqVVMVvgupsSetvSxe5wd3RjjPUw/P4r6q6R3aB8Aj7+YKlyo4aERheNXd
         pfdA==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH v3 1/2] rcu: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
Date: Mon, 29 Apr 2019 22:38:43 +0800
Message-Id: <1556548724-17844-2-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1556548724-17844-1-git-send-email-junchangwang@gmail.com>
References: <1556548724-17844-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Replace the plain accesses with READ_ONCE()/WRITE_ONCE(). And then update
the tex file accordingly. A new scheme, which directly extracts snippet
from rcu.[hc], is applied.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/rcu.c    | 30 ++++++++-------
 CodeSamples/defer/rcu.h    | 21 ++++++----
 appendix/toyrcu/toyrcu.tex | 95 +++++++++++++++++++---------------------------
 3 files changed, 68 insertions(+), 78 deletions(-)

diff --git a/CodeSamples/defer/rcu.c b/CodeSamples/defer/rcu.c
index 4b868cc..4ca2739 100644
--- a/CodeSamples/defer/rcu.c
+++ b/CodeSamples/defer/rcu.c
@@ -21,45 +21,47 @@
 #include "../api.h"
 #include "rcu.h"
 
-void synchronize_rcu(void)
+//\begin{snippet}[labelbase=ln:defer:rcu:synchronize,gobbleblank=yes,commandchars=\%\@\$]
+void synchronize_rcu(void)			//\lnlbl{syn:b}
 {
 	int t;
 
 	/* Memory barrier ensures mutation seen before grace period. */
 
-	smp_mb();
+	smp_mb();				//\lnlbl{syn:mb1}
 
 	/* Only one synchronize_rcu() at a time. */
 
-	spin_lock(&rcu_gp_lock);
+	spin_lock(&rcu_gp_lock);		//\lnlbl{syn:spinlock}
 
 	/* Advance to a new grace-period number, enforce ordering. */
 
-	rcu_gp_ctr += 2;
-	smp_mb();
+	WRITE_ONCE(rcu_gp_ctr, rcu_gp_ctr + 2); //\lnlbl{syn:increasegp}
+	smp_mb();				//\lnlbl{syn:mb2}
 
 	/*
 	 * Wait until all threads are either out of their RCU read-side
 	 * critical sections or are aware of the new grace period.
 	 */
 
-	for_each_thread(t) {
-		while ((per_thread(rcu_reader_gp, t) & 0x1) &&
-		       ((per_thread(rcu_reader_gp, t) - rcu_gp_ctr) < 0)) {
+	for_each_thread(t) {			//\lnlbl{syn:scan:b}
+		while ((per_thread(rcu_reader_gp, t) & 0x1) &&//\lnlbl{syn:even}
+		       ((per_thread(rcu_reader_gp, t) -	//\lnlbl{syn:gt1}
+		         rcu_gp_ctr) < 0)) {		//\lnlbl{syn:gt2}
 			/*@@@ poll(NULL, 0, 10); */
-			barrier();
+			barrier();		//\lnlbl{syn:barrier}
 		}
-	}
+	}					//\lnlbl{syn:scan:e}
 
 	/* Let other synchronize_rcu() instances move ahead. */
 
-	spin_unlock(&rcu_gp_lock);
+	spin_unlock(&rcu_gp_lock);		//\lnlbl{syn:spinunlock}
 
 	/* Ensure that any subsequent free()s happen -after- above checks. */
 
-	smp_mb();
-}
-
+	smp_mb();				//\lnlbl{syn:mb3}
+}						//\lnlbl{syn:e}
+//\end{snippet}
 #ifdef TEST
 #include "rcutorture.h"
 #endif /* #ifdef TEST */
diff --git a/CodeSamples/defer/rcu.h b/CodeSamples/defer/rcu.h
index f493f8b..3641c33 100644
--- a/CodeSamples/defer/rcu.h
+++ b/CodeSamples/defer/rcu.h
@@ -31,7 +31,8 @@ static inline void rcu_init(void)
 	init_per_thread(rcu_reader_gp_snap, 0);
 }
 
-static inline void rcu_read_lock(void)
+//\begin{snippet}[labelbase=ln:defer:rcu:read_lock_unlock,gobbleblank=yes,commandchars=\%\@\$]
+static inline void rcu_read_lock(void)			//\lnlbl{lock:b}
 {
 	/*
 	 * Copy the current GP counter to this thread's counter, setting
@@ -41,11 +42,12 @@ static inline void rcu_read_lock(void)
 	 * periodic per-thread processing.)
 	 */
 
-	__get_thread_var(rcu_reader_gp) = rcu_gp_ctr + 1;
-	smp_mb();
-}
-
-static inline void rcu_read_unlock(void)
+	__get_thread_var(rcu_reader_gp) =		//\lnlbl{lock:gp1}
+		READ_ONCE(rcu_gp_ctr) + 1;		//\lnlbl{lock:gp2}
+	smp_mb();					//\lnlbl{lock:mb}
+}							//\lnlbl{lock:e}
+								//\fcvblank
+static inline void rcu_read_unlock(void)		//\lnlbl{unlock:b}
 {
 	/*
 	 * Copy the current GP counter to this thread's counter, but
@@ -54,8 +56,11 @@ static inline void rcu_read_unlock(void)
 	 * the memory barrier requires periodic per-thread processing.)
 	 */
 
-	smp_mb();
-	__get_thread_var(rcu_reader_gp) = rcu_gp_ctr;
+	smp_mb();					//\lnlbl{unlock:mb}
+	__get_thread_var(rcu_reader_gp) =		//\lnlbl{unlock:gp1}
+		READ_ONCE(rcu_gp_ctr);			//\lnlbl{unlock:gp2}
 }
+								//\fcvblank
+//\end{snippet}
 
 extern void synchronize_rcu(void);
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index c0a45a8..f7fc07b 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1218,44 +1218,8 @@ thread-local accesses to one, as is done in the next section.
 \end{listing}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
- 1 static void rcu_read_lock(void)
- 2 {
- 3   __get_thread_var(rcu_reader_gp) =
- 4     ACCESS_ONCE(rcu_gp_ctr) + 1;
- 5   smp_mb();
- 6 }
- 7 
- 8 static void rcu_read_unlock(void)
- 9 {
-10   smp_mb();
-11   __get_thread_var(rcu_reader_gp) =
-12     ACCESS_ONCE(rcu_gp_ctr);
-13 }
-14 
-15 void synchronize_rcu(void)
-16 {
-17   int t;
-18 
-19   smp_mb();
-20   spin_lock(&rcu_gp_lock);
-21   ACCESS_ONCE(rcu_gp_ctr) += 2;
-22   smp_mb();
-23   for_each_thread(t) {
-24     while ((per_thread(rcu_reader_gp, t) & 0x1) &&
-25             ((per_thread(rcu_reader_gp, t) -
-26               ACCESS_ONCE(rcu_gp_ctr)) < 0)) {
-27       poll(NULL, 0, 10);
-28     }
-29   }
-30   spin_unlock(&rcu_gp_lock);
-31   smp_mb();
-32 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/rcu@read_lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
+\input{CodeSamples/defer/rcu@synchronize.fcv}\fvset{firstnumber=auto}
 \caption{Free-Running Counter Using RCU}
 \label{lst:app:toyrcu:Free-Running Counter Using RCU}
 \end{listing}
@@ -1267,25 +1231,34 @@ that takes on only even-numbered values, with data shown in
 Listing~\ref{lst:app:toyrcu:Data for Free-Running Counter Using RCU}.
 The resulting \co{rcu_read_lock()} implementation is extremely
 straightforward.
-Lines~3 and~4 simply add one to the global free-running \co{rcu_gp_ctr}
+\begin{lineref}[ln:defer:rcu:read_lock_unlock:lock]
+Lines~\lnref{gp1} and~\lnref{gp2} simply
+add one to the global free-running \co{rcu_gp_ctr}
 variable and stores the resulting odd-numbered value into the
 \co{rcu_reader_gp} per-thread variable.
-Line~5 executes a memory barrier to prevent the content of the
+Line~\lnref{mb} executes a memory barrier to prevent the content of the
 subsequent RCU read-side critical section from ``leaking out''.
+\end{lineref}
 
+\begin{lineref}[ln:defer:rcu:read_lock_unlock:unlock]
 The \co{rcu_read_unlock()} implementation is similar.
-Line~10 executes a memory barrier, again to prevent the prior RCU
+Line~\lnref{mb} executes a memory barrier, again to prevent the prior RCU
 read-side critical section from ``leaking out''.
-Lines~11 and~12 then copy the \co{rcu_gp_ctr} global variable to the
+Lines~\lnref{gp1} and~\lnref{gp2} then
+copy the \co{rcu_gp_ctr} global variable to the
 \co{rcu_reader_gp} per-thread variable, leaving this per-thread
 variable with an even-numbered value so that a concurrent instance
 of \co{synchronize_rcu()} will know to ignore it.
+\end{lineref}
 
 \QuickQuiz{}
+	\begin{lineref}[ln:defer:rcu:read_lock_unlock:unlock]
 	If any even value is sufficient to tell \co{synchronize_rcu()}
-	to ignore a given task, why don't lines~10 and~11 of
+	to ignore a given task, why don't lines~\lnref{gp1}
+	and~\lnref{gp2} of
 	Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU}
 	simply assign zero to \co{rcu_reader_gp}?
+	\end{lineref}
 \QuickQuizAnswer{
 	Assigning zero (or any other even-numbered constant)
 	would in fact work, but assigning the value of
@@ -1294,39 +1267,46 @@ of \co{synchronize_rcu()} will know to ignore it.
 	thread last exited an RCU read-side critical section.
 } \QuickQuizEnd
 
+\begin{lineref}[ln:defer:rcu:synchronize:syn]
 Thus, \co{synchronize_rcu()} could wait for all of the per-thread
 \co{rcu_reader_gp} variables to take on even-numbered values.
 However, it is possible to do much better than that because
 \co{synchronize_rcu()} need only wait on \emph{pre-existing}
 RCU read-side critical sections.
-Line~19 executes a memory barrier to prevent prior manipulations
+Line~\lnref{mb1} executes a memory barrier to prevent prior manipulations
 of RCU-protected data structures from being reordered (by either
-the CPU or the compiler) to follow the increment on line~21.
-Line~20 acquires the \co{rcu_gp_lock} (and line~30 releases it)
+the CPU or the compiler) to follow the increment on
+line~\lnref{increasegp}.
+Line~\lnref{spinlock} acquires the \co{rcu_gp_lock}
+(and line~\lnref{spinunlock} releases it)
 in order to prevent multiple
 \co{synchronize_rcu()} instances from running concurrently.
-Line~21 then increments the global \co{rcu_gp_ctr} variable by
+Line~\lnref{increasegp} then increments the global \co{rcu_gp_ctr} variable by
 two, so that all pre-existing RCU read-side critical sections will
 have corresponding per-thread \co{rcu_reader_gp} variables with
 values less than that of \co{rcu_gp_ctr}, modulo the machine's
 word size.
 Recall also that threads with even-numbered values of \co{rcu_reader_gp}
 are not in an RCU read-side critical section,
-so that lines~23-29 scan the \co{rcu_reader_gp} values until they
-all are either even (line~24) or are greater than the global
-\co{rcu_gp_ctr} (lines~25-26).
-Line~27 blocks for a short period of time to wait for a
+so that lines~\lnref{scan:b}-\lnref{scan:e}
+scan the \co{rcu_reader_gp} values until they
+all are either even (line~\lnref{even}) or are greater than the global
+\co{rcu_gp_ctr} (lines~\lnref{gt1}-\lnref{gt2}).
+Line~\lnref{barrier} blocks for a short period of time to wait for a
 pre-existing RCU read-side critical section, but this can be replaced with
 a spin-loop if grace-period latency is of the essence.
-Finally, the memory barrier at line~31 ensures that any subsequent
+Finally, the memory barrier at line~\lnref{mb3} ensures that any subsequent
 destruction will not be reordered into the preceding loop.
+\end{lineref}
 
 \QuickQuiz{}
-	Why are the memory barriers on lines~19 and~31 of
+	\begin{lineref}[ln:defer:rcu:synchronize:syn]
+	Why are the memory barriers on lines~\lnref{mb1} and~\lnref{mb3} of
 	Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU}
 	needed?
 	Aren't the memory barriers inherent in the locking
-	primitives on lines~20 and~30 sufficient?
+	primitives on lines~\lnref{spinlock} and~\lnref{spinunlock} sufficient?
+	\end{lineref}
 \QuickQuizAnswer{
 	These memory barriers are required because the locking
 	primitives are only guaranteed to confine the critical
@@ -1355,11 +1335,12 @@ such CPUs.
 	This work is left as an exercise for the reader.
 } \QuickQuizEnd
 
+\begin{lineref}[ln:defer:rcu:read_lock_unlock:lock]
 This implementation suffers from some serious shortcomings in
 addition to the high update-side overhead noted earlier.
 First, it is no longer permissible to nest RCU read-side critical
 sections, a topic that is taken up in the next section.
-Second, if a reader is preempted at line~3 of
+Second, if a reader is preempted at line~\lnref{gp1} of
 Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU} after fetching from
 \co{rcu_gp_ctr} but before storing to \co{rcu_reader_gp},
 and if the \co{rcu_gp_ctr} counter then runs through more than half
@@ -1371,7 +1352,8 @@ variables.
 
 \QuickQuiz{}
 	Is the possibility of readers being preempted in
-	lines~3-4 of Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU}
+	lines~\lnref{gp1}-\lnref{gp2} of
+	Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU}
 	a real problem, in other words, is there a real sequence
 	of events that could lead to failure?
 	If not, why not?
@@ -1388,6 +1370,7 @@ variables.
 	added in that section greatly reduces the time required to
 	overflow the counter.
 } \QuickQuizEnd
+\end{lineref}
 
 \section{Nestable RCU Based on Free-Running Counter}
 \label{sec:app:toyrcu:Nestable RCU Based on Free-Running Counter}
-- 
2.7.4

