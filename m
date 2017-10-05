Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BDV7wrgMgaMdwx7IA7XJpOeJ0GUd322Fh3xTHJ3W2KI=;
 b=RrRtffYlwL3i+sDSy8M3LDLwUpEdX6iRJ9sDAtYbi7YsT+h41QdutbhGiEN/SSdF4o
 vd8gJeshLMr1hak0g6LSDYG1YtsqCOIrR3GEu8jJNKVi6hcYu+hvKbkR3JHWHP+F/29E
 28G93xLujrOwcWWQgCuTESVC5MikbT/63h994sCMwN+SfKiWEWiHAYdlNLeCxutdeB5u
 rtVoLctIepHibXBu8fxSQPz3JoVHWUPMBlhQyM/e5fxG4NHqMSnBrs9kMCuAcRE39fQm
 TBWtaYbc6IoCppYy7kFHRcgMq/vjsdFjZ9J1tDWOVUjtx5Pp0QMBmfbD0Y4Bjm7dd62k
 CaTw==
Subject: [PATCH 05/10] treewide: Insert narrow space in front of percent
 symbol
References: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bb64f683-c5f3-979d-475f-73687d898089@gmail.com>
Date: Fri, 6 Oct 2017 00:53:35 +0900
MIME-Version: 1.0
In-Reply-To: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ffbf7756c160eaa59e8a93c1bdd09c1497dfe449 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 1 Oct 2017 12:17:43 +0900
Subject: [PATCH 05/10] treewide: Insert narrow space in front of percent symbol

In SMPdesign/beyond.tex, there are two cases where "percent" is
spelled out in compound words.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex |  2 +-
 SMPdesign/beyond.tex    | 14 +++++++-------
 advsync/advsync.tex     |  2 +-
 count/count.tex         |  4 ++--
 cpu/hwfreelunch.tex     |  4 ++--
 defer/rcuusage.tex      |  4 ++--
 formal/dyntickrcu.tex   |  2 +-
 formal/spinhint.tex     |  2 +-
 future/htm.tex          |  2 +-
 future/tm.tex           |  4 ++--
 intro/intro.tex         |  6 +++---
 rt/rt.tex               |  8 ++++----
 12 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 1936d27..81219cb 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -1186,7 +1186,7 @@ which fortunately is usually quite easy to do in actual
 practice~\cite{McKenney01e}, especially given today's large memories.
 For example, in most systems, it is quite reasonable to set
 \co{TARGET_POOL_SIZE} to 100, in which case allocations and frees
-are guaranteed to be confined to per-thread pools at least 99\% of
+are guaranteed to be confined to per-thread pools at least 99\,\% of
 the time.

 As can be seen from the figure, the situations where the common-case
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 7ba351e..1fb2a6b 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -401,8 +401,8 @@ large algorithmic superlinear speedups.
 \end{figure}

 Further investigation showed that
-PART sometimes visited fewer than 2\% of the maze's cells,
-while SEQ and PWQ never visited fewer than about 9\%.
+PART sometimes visited fewer than 2\,\% of the maze's cells,
+while SEQ and PWQ never visited fewer than about 9\,\%.
 The reason for this difference is shown by
 Figure~\ref{fig:SMPdesign:Reason for Small Visit Percentages}.
 If the thread traversing the solution from the upper left reaches
@@ -473,11 +473,11 @@ optimizations are quite attractive.
 Cache alignment and padding often improves performance by reducing
 false sharing.
 However, for these maze-solution algorithms, aligning and padding the
-maze-cell array \emph{degrades} performance by up to 42\% for 1000x1000 mazes.
+maze-cell array \emph{degrades} performance by up to 42\,\% for 1000x1000 mazes.
 Cache locality is more important than avoiding
 false sharing, especially for large mazes.
 For smaller 20-by-20 or 50-by-50 mazes, aligning and padding can produce
-up to a 40\% performance improvement for PART,
+up to a 40\,\% performance improvement for PART,
 but for these small sizes, SEQ performs better anyway because there
 is insufficient time for PART to make up for the overhead of
 thread creation and destruction.
@@ -508,7 +508,7 @@ context-switch overhead and visit percentage.
 As can be seen in
 Figure~\ref{fig:SMPdesign:Partitioned Coroutines},
 this coroutine algorithm (COPART) is quite effective, with the performance
-on one thread being within about 30\% of PART on two threads
+on one thread being within about 30\,\% of PART on two threads
 (\path{maze_2seq.c}).

 \subsection{Performance Comparison II}
@@ -532,7 +532,7 @@ Figures~\ref{fig:SMPdesign:Varying Maze Size vs. SEQ}
 and~\ref{fig:SMPdesign:Varying Maze Size vs. COPART}
 show the effects of varying maze size, comparing both PWQ and PART
 running on two threads
-against either SEQ or COPART, respectively, with 90\%-confidence
+against either SEQ or COPART, respectively, with 90\=/percent\-/confidence
 error bars.
 PART shows superlinear scalability against SEQ and modest scalability
 against COPART for 100-by-100 and larger mazes.
@@ -565,7 +565,7 @@ a thread is connected to both beginning and end).
 PWQ performs quite poorly, but
 PART hits breakeven at two threads and again at five threads, achieving
 modest speedups beyond five threads.
-Theoretical energy efficiency breakeven is within the 90\% confidence
+Theoretical energy efficiency breakeven is within the 90\=/percent\-/confidence
 interval for seven and eight threads.
 The reasons for the peak at two threads are (1) the lower complexity
 of termination detection in the two-thread case and (2) the fact that
diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 98e6986..adf1dc9 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -85,7 +85,7 @@ basis of real-time programming:
 	bound.
 \item	Real-time forward-progress guarantees are sometimes
 	probabilistic, as in the soft-real-time guarantee that
-	``at least 99.9\% of the time, scheduling latency must
+	``at least 99.9\,\% of the time, scheduling latency must
 	be less than 100 microseconds.''
 	In contrast, NBS's forward-progress
 	guarantees have traditionally been unconditional.
diff --git a/count/count.tex b/count/count.tex
index f1645ee..73b6866 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -55,7 +55,7 @@ counting.
 	whatever ``true value'' might mean in this context.
 	However, the value read out should maintain roughly the same
 	absolute error over time.
-	For example, a 1\% error might be just fine when the count
+	For example, a 1\,\% error might be just fine when the count
 	is on the order of a million or so, but might be absolutely
 	unacceptable once the count reaches a trillion.
 	See Section~\ref{sec:count:Statistical Counters}.
@@ -204,7 +204,7 @@ On my dual-core laptop, a short run invoked \co{inc_count()}
 100,014,000 times, but the final value of the counter was only
 52,909,118.
 Although approximate values do have their place in computing,
-accuracies far greater than 50\% are almost always necessary.
+accuracies far greater than 50\,\% are almost always necessary.

 \QuickQuiz{}
 	But doesn't the \co{++} operator produce an x86 add-to-memory
diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
index b449ba2..152f691 100644
--- a/cpu/hwfreelunch.tex
+++ b/cpu/hwfreelunch.tex
@@ -193,13 +193,13 @@ excellent bragging rights, if nothing else!
 Although the speed of light would be a hard limit, the fact is that
 semiconductor devices are limited by the speed of electricity rather
 than that of light, given that electric waves in semiconductor materials
-move at between 3\% and 30\% of the speed of light in a vacuum.
+move at between 3\,\% and 30\,\% of the speed of light in a vacuum.
 The use of copper connections on silicon devices is one way to increase
 the speed of electricity, and it is quite possible that additional
 advances will push closer still to the actual speed of light.
 In addition, there have been some experiments with tiny optical fibers
 as interconnects within and between chips, based on the fact that
-the speed of light in glass is more than 60\% of the speed of light
+the speed of light in glass is more than 60\,\% of the speed of light
 in a vacuum.
 One obstacle to such optical fibers is the inefficiency conversion
 between electricity and light and vice versa, resulting in both
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index af4faff..74be9fc 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -193,7 +193,7 @@ ideal synchronization-free workload, as desired.
 	each search is taking on average about 13~nanoseconds,
 	which is short enough for small differences in code
 	generation to make their presence felt.
-	The difference ranges from about 1.5\% to about 11.1\%, which is
+	The difference ranges from about 1.5\,\% to about 11.1\,\%, which is
 	quite small when you consider that the RCU QSBR code can handle
 	concurrent updates and the ``ideal'' code cannot.

@@ -775,7 +775,7 @@ again showing data taken on a 16-CPU 3\,GHz Intel x86 system.
 	Most likely NUMA effects.
 	However, there is substantial variance in the values measured for the
 	refcnt line, as can be seen by the error bars.
-	In fact, standard deviations range in excess of 10\% of measured
+	In fact, standard deviations range in excess of 10\,\% of measured
 	values in some cases.
 	The dip in overhead therefore might well be a statistical aberration.
 } \QuickQuizEnd
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 80fa3e7..ec3c78c 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1748,7 +1748,7 @@ states, passing without errors.
 	\end{quote}

 	This means that any attempt to optimize the production of code should
-	place at least 66\% of its emphasis on optimizing the debugging process,
+	place at least 66\,\% of its emphasis on optimizing the debugging process,
 	even at the expense of increasing the time and effort spent coding.
 	Incremental coding and testing is one way to optimize the debugging
 	process, at the expense of some increase in coding effort.
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index a40d2c3..27df639 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -416,7 +416,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	run \co{top} in one window and \co{./pan} in another.  Keep the
 	focus on the \co{./pan} window so that you can quickly kill
 	execution if need be.  As soon as CPU time drops much below
-	100\%, kill \co{./pan}.  If you have removed focus from the
+	100\,\%, kill \co{./pan}.  If you have removed focus from the
 	window running \co{./pan}, you may wait a long time for the
 	windowing system to grab enough memory to do anything for
 	you.
diff --git a/future/htm.tex b/future/htm.tex
index e26ee2a..0c3801d 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -1185,7 +1185,7 @@ by Siakavaras et al.~\cite{Siakavaras2017CombiningHA},
 is to use RCU for read-only traversals and HTM
 only for the actual updates themselves.
 This combination outperformed other transactional-memory techniques by
-up to 220\%, a speedup similar to that observed by
+up to 220\,\%, a speedup similar to that observed by
 Howard and Walpole~\cite{PhilHoward2011RCUTMRBTree}
 when they combined RCU with STM.
 In both cases, the weak atomicity is implemented in software rather than
diff --git a/future/tm.tex b/future/tm.tex
index ec5373d..8420331 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -711,8 +711,8 @@ representing the lock as part of the transaction, and everything works
 out perfectly.
 In practice, a number of non-obvious complications~\cite{Volos2008TRANSACT}
 can arise, depending on implementation details of the TM system.
-These complications can be resolved, but at the cost of a 45\% increase in
-overhead for locks acquired outside of transactions and a 300\% increase
+These complications can be resolved, but at the cost of a 45\,\% increase in
+overhead for locks acquired outside of transactions and a 300\,\% increase
 in overhead for locks acquired within transactions.
 Although these overheads might be acceptable for transactional
 programs containing small amounts of locking, they are often completely
diff --git a/intro/intro.tex b/intro/intro.tex
index ca991bd..8bed518 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -414,7 +414,7 @@ To see this, consider that the price of early computers was tens
 of millions of dollars at
 a time when engineering salaries were but a few thousand dollars a year.
 If dedicating a team of ten engineers to such a machine would improve
-its performance, even by only 10\%, then their salaries
+its performance, even by only 10\,\%, then their salaries
 would be repaid many times over.

 One such machine was the CSIRAC, the oldest still-intact stored-program
@@ -863,11 +863,11 @@ been extremely narrowly focused, and hence unable to demonstrate any
 general results.
 Furthermore, given that the normal range of programmer productivity
 spans more than an order of magnitude, it is unrealistic to expect
-an affordable study to be capable of detecting (say) a 10\% difference
+an affordable study to be capable of detecting (say) a 10\,\% difference
 in productivity.
 Although the multiple-order-of-magnitude differences that such studies
 \emph{can} reliably detect are extremely valuable, the most impressive
-improvements tend to be based on a long series of 10\% improvements.
+improvements tend to be based on a long series of 10\,\% improvements.

 We must therefore take a different approach.

diff --git a/rt/rt.tex b/rt/rt.tex
index 2f5d4fe..21e7117 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -48,7 +48,7 @@ are clearly required.
 We might therefore say that a given soft real-time application must meet
 its response-time requirements at least some fraction of the time, for
 example, we might say that it must execute in less than 20 microseconds
-99.9\% of the time.
+99.9\,\% of the time.

 This of course raises the question of what is to be done when the application
 fails to meet its response-time requirements.
@@ -267,7 +267,7 @@ or even avoiding interrupts altogether in favor of polling.

 Overloading can also degrade response times due to queueing effects,
 so it is not unusual for real-time systems to overprovision CPU bandwidth,
-so that a running system has (say) 80\% idle time.
+so that a running system has (say) 80\,\% idle time.
 This approach also applies to storage and networking devices.
 In some cases, separate storage and networking hardware might be reserved
 for the sole use of high-priority portions of the real-time application.
@@ -351,7 +351,7 @@ on the hardware and software implementing those operations.
 For each such operation, these constraints might include a maximum
 response time (and possibly also a minimum response time) and a
 probability of meeting that response time.
-A probability of 100\% indicates that the corresponding operation
+A probability of 100\,\% indicates that the corresponding operation
 must provide hard real-time service.

 In some cases, both the response times and the required probabilities of
@@ -1583,7 +1583,7 @@ These constraints include:
 	latencies are provided only to the highest-priority threads.
 \item	Sufficient bandwidth to support the workload.
 	An implementation rule supporting this constraint might be
-	``There will be at least 50\% idle time on all CPUs
+	``There will be at least 50\,\% idle time on all CPUs
 	during normal operation,''
 	or, more formally, ``The offered load will be sufficiently low
 	to allow the workload to be schedulable at all times.''
-- 
2.7.4


