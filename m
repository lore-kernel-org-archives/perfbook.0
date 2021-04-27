Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3yrpGESe50FTNxhW0bW+3yUNGklj96hFcZbuhBS24tY=;
        b=WgRfalKXR9XhxOVMmjTLp6nl6ggd8wbGXfrFvaLn/nnhAPb10lSLDcebezSkwQBz8z
         b3phAnN/XkuRaPiUgg2zAe2gCeMbk8GBQs9ONhOK786WFFtt2UPraTqA+HnePRHfPeqs
         L+SR9GLyypvC+KOiQ58jA5TiTYJdDWc0OR6Ibz7YWx7w/Z88iD2AOlkOjVVKQPEAlZ6C
         TYImBi1GVx9MG1cAfw9OupNUdgBROsBACHLi2uKR99CD9BwsD44XWBWsKbSOGYVKNImd
         kQ6MOLNgW8ljuZdBdYYj7KIEEuZPUhuwYh2LLKchiORZ1CcO2FEvhQ47YgEGlgnAZCxh
         7rbg==
Subject: [PATCH -perfbook v2 9/9] treewide: Substitute ';' for ',' in label
 strings
References: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0464f64e-65d1-1ac5-91b1-b45f699a1b92@gmail.com>
Date: Wed, 28 Apr 2021 00:33:08 +0900
MIME-Version: 1.0
In-Reply-To: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

periodcheck.pl relies on this change for "vs." within label
strings to be ignored.

This change is also required for treewide conversion to
\cref{}/\Cref{} and their variants.
"," is a delimiter of label strings in those cleveref macros.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/beyond.tex          | 12 +++++------
 SMPdesign/partexercises.tex   | 12 +++++------
 cpu/hwfreelunch.tex           |  2 +-
 datastruct/datastruct.tex     | 40 +++++++++++++++++------------------
 defer/rcuapi.tex              |  4 ++--
 defer/refcnt.tex              |  4 ++--
 intro/intro.tex               |  4 ++--
 toolsoftrade/toolsoftrade.tex |  6 +++---
 8 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index bd0fe6f1..20b6a9e2 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -370,11 +370,11 @@ array, and line~\lnref{ret:success} returns success.
 \centering
 \resizebox{2.2in}{!}{\includegraphics{SMPdesign/500-ms_seq_fg_part-cdf}}
 \caption{CDF of Solution Times For SEQ, PWQ, and PART}
-\label{fig:SMPdesign:CDF of Solution Times For SEQ, PWQ, and PART}
+\label{fig:SMPdesign:CDF of Solution Times For SEQ; PWQ; and PART}
 \end{figure}
 
 Performance testing revealed a surprising anomaly, shown in
-Figure~\ref{fig:SMPdesign:CDF of Solution Times For SEQ, PWQ, and PART}.
+Figure~\ref{fig:SMPdesign:CDF of Solution Times For SEQ; PWQ; and PART}.
 The median solution time for PART (17 milliseconds)
 is more than four times faster than that of SEQ (79 milliseconds),
 despite running on only two threads.
@@ -393,7 +393,7 @@ The next section analyzes this anomaly.
 The first reaction to a performance anomaly is to check for bugs.
 Although the algorithms were in fact finding valid solutions, the
 plot of CDFs in
-Figure~\ref{fig:SMPdesign:CDF of Solution Times For SEQ, PWQ, and PART}
+Figure~\ref{fig:SMPdesign:CDF of Solution Times For SEQ; PWQ; and PART}
 assumes independent data points.
 This is not the case:  The performance tests randomly generate a maze,
 and then run all solvers on that maze.
@@ -577,10 +577,10 @@ were generated using -O3.
 \centering
 \resizebox{2.2in}{!}{\includegraphics{SMPdesign/1000-ms_2seqO3VfgO3_partO3-mean}}
 \caption{Mean Speedup vs.\@ Number of Threads, 1000x1000 Maze}
-\label{fig:SMPdesign:Mean Speedup vs. Number of Threads, 1000x1000 Maze}
+\label{fig:SMPdesign:Mean Speedup vs. Number of Threads; 1000x1000 Maze}
 \end{figure}
 
-Figure~\ref{fig:SMPdesign:Mean Speedup vs. Number of Threads, 1000x1000 Maze}
+Figure~\ref{fig:SMPdesign:Mean Speedup vs. Number of Threads; 1000x1000 Maze}
 shows the performance of PWQ and PART relative to COPART\@.
 For PART runs with more than two threads, the additional threads were
 started evenly spaced along the diagonal connecting the starting and
@@ -650,7 +650,7 @@ rather than as a grossly suboptimal after-the-fact micro-optimization
 to be retrofitted into existing programs.
 
 \section{Partitioning, Parallelism, and Optimization}
-\label{sec:SMPdesign:Partitioning, Parallelism, and Optimization}
+\label{sec:SMPdesign:Partitioning; Parallelism; and Optimization}
 %
 \epigraph{Knowledge is of no value unless you put it into practice.}
 	 {\emph{Anton Chekhov}}
diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 8a56663e..a84cc74f 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -64,7 +64,7 @@ shows, starvation of even a few of the philosophers is to be avoided.
 \centering
 \includegraphics[scale=.7]{SMPdesign/DiningPhilosopher5TB}
 \caption{Dining Philosophers Problem, Textbook Solution}
-\ContributedBy{Figure}{fig:SMPdesign:Dining Philosophers Problem, Textbook Solution}{Kornilios Kourtis}
+\ContributedBy{Figure}{fig:SMPdesign:Dining Philosophers Problem; Textbook Solution}{Kornilios Kourtis}
 \end{figure}
 
 \pplsur{Edsger W.}{Dijkstra}'s solution used a global semaphore,
@@ -77,7 +77,7 @@ in the late 1980s or early 1990s.\footnote{
 	is to publish something, wait 50 years, and then see
 	how well \emph{your} ideas stood the test of time.}
 More recent solutions number the forks as shown in
-Figure~\ref{fig:SMPdesign:Dining Philosophers Problem, Textbook Solution}.
+Figure~\ref{fig:SMPdesign:Dining Philosophers Problem; Textbook Solution}.
 Each philosopher picks up the lowest-numbered fork next to his or her
 plate, then picks up the other fork.
 The philosopher sitting in the uppermost position in the diagram thus
@@ -114,11 +114,11 @@ It should be possible to do better than this!
 \centering
 \includegraphics[scale=.7]{SMPdesign/DiningPhilosopher4part-b}
 \caption{Dining Philosophers Problem, Partitioned}
-\ContributedBy{Figure}{fig:SMPdesign:Dining Philosophers Problem, Partitioned}{Kornilios Kourtis}
+\ContributedBy{Figure}{fig:SMPdesign:Dining Philosophers Problem; Partitioned}{Kornilios Kourtis}
 \end{figure}
 
 One approach is shown in
-Figure~\ref{fig:SMPdesign:Dining Philosophers Problem, Partitioned},
+Figure~\ref{fig:SMPdesign:Dining Philosophers Problem; Partitioned},
 which includes four philosophers rather than five to better illustrate the
 partition technique.
 Here the upper and rightmost philosophers share a pair of forks,
@@ -134,7 +134,7 @@ the acquisition and release algorithms.
 	Philosophers Problem?
 }\QuickQuizAnswer{
 	One such improved solution is shown in
-	Figure~\ref{fig:SMPdesign:Dining Philosophers Problem, Fully Partitioned},
+	Figure~\ref{fig:SMPdesign:Dining Philosophers Problem; Fully Partitioned},
 	where the philosophers are simply provided with an additional
 	five forks.
 	All five philosophers may now eat simultaneously, and there
@@ -145,7 +145,7 @@ the acquisition and release algorithms.
 \centering
 \includegraphics[scale=.7]{SMPdesign/DiningPhilosopher5PEM}
 \caption{Dining Philosophers Problem, Fully Partitioned}
-\QContributedBy{Figure}{fig:SMPdesign:Dining Philosophers Problem, Fully Partitioned}{Kornilios Kourtis}
+\QContributedBy{Figure}{fig:SMPdesign:Dining Philosophers Problem; Fully Partitioned}{Kornilios Kourtis}
 \end{figure}
 
 	This solution might seem like cheating to some, but such
diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
index a2e85950..c4a9b495 100644
--- a/cpu/hwfreelunch.tex
+++ b/cpu/hwfreelunch.tex
@@ -196,7 +196,7 @@ atoms on each of the billions of devices on a chip will have most
 excellent bragging rights, if nothing else!
 
 \subsection{Light, Not Electrons}
-\label{sec:cpu:Light, Not Electrons}
+\label{sec:cpu:Light; Not Electrons}
 
 Although the speed of light would be a hard limit, the fact is that
 semiconductor devices are limited by the speed of electricity rather
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 6e18fda9..038f3923 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -345,11 +345,11 @@ We can test this by increasing the number of hash buckets.
 \centering
 \resizebox{2.5in}{!}{\includegraphics{CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktsizelin}}
 \caption{Read-Only Hash-Table Performance For Schr\"odinger's Zoo, Varying Buckets}
-\label{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo, Varying Buckets}
+\label{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
 \end{figure}
 
 However, as can be seen in
-Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo, Varying Buckets},
+Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets},
 changing the number of buckets has almost no effect:
 Scalability is still abysmal.
 In particular, we still see a sharp dropoff at 29~CPUs and beyond.
@@ -584,10 +584,10 @@ RCU does slightly better than hazard pointers.
 \centering
 \resizebox{2.5in}{!}{\includegraphics{CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulin}}
 \caption{Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo, Linear Scale}
-\label{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo, Linear Scale}
+\label{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo; Linear Scale}
 \end{figure}
 
-Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo, Linear Scale}
+Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo; Linear Scale}
 shows the same data on a linear scale.
 This drops the global-locking trace into the x-axis, but allows the
 non-ideal performance of RCU and hazard pointers to be more readily
@@ -615,13 +615,13 @@ advantage depends on the workload.
 \centering
 \resizebox{2.5in}{!}{\includegraphics{CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulinqsbr}}
 \caption{Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo including QSBR, Linear Scale}
-\label{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR, Linear Scale}
+\label{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR; Linear Scale}
 \end{figure}
 
 But why is RCU's performance a factor of five less than ideal?
 One possibility is that the per-thread counters manipulated by
 \co{rcu_read_lock()} and \co{rcu_read_unlock()} are slowing things down.
-Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR, Linear Scale}
+Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR; Linear Scale}
 therefore adds the results for the QSBR variant of RCU, whose read-side
 primitives do nothing.
 And although QSBR does perform slightly better than does RCU, it is still
@@ -631,10 +631,10 @@ about a factor of five short of ideal.
 \centering
 \resizebox{2.5in}{!}{\includegraphics{CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulinqsbrunsync}}
 \caption{Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo including QSBR and Unsynchronized, Linear Scale}
-\label{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR and Unsynchronized, Linear Scale}
+\label{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR and Unsynchronized; Linear Scale}
 \end{figure}
 
-Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR and Unsynchronized, Linear Scale}
+Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR and Unsynchronized; Linear Scale}
 adds completely unsynchronized results, which works because this
 is a read-only benchmark with nothing to synchronize.
 Even with no synchronization whatsoever, performance still falls far
@@ -647,7 +647,7 @@ on page~\pageref{tab:cpu:Cache Geometry for 8-Socket System With Intel Xeon Plat
 Each hash bucket (\co{struct ht_bucket}) occupies 56~bytes and each
 element (\co{struct zoo_he}) occupies 72~bytes for the RCU and QSBR runs.
 The benchmark generating
-Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR and Unsynchronized, Linear Scale}
+Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR and Unsynchronized; Linear Scale}
 used 262,144 buckets and up to 262,144 elements, for a total of
 33,554,448~bytes, which not only overflows the 1,048,576-byte L2 caches
 by more than a factor of thirty, but is also uncomfortably close to the
@@ -681,8 +681,8 @@ to about half again faster than that of either QSBR or RCU\@.
 \QuickQuiz{
 	How can we be so sure that the hash-table size is at fault here,
 	especially given that
-	Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo, Varying Buckets}
-	on page~\pageref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo, Varying Buckets}
+	Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
+	on page~\pageref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
 	shows that varying hash-table size has almost
 	no effect?
 	Might the problem instead be something like false sharing?
@@ -698,12 +698,12 @@ to about half again faster than that of either QSBR or RCU\@.
 \centering
 \resizebox{3in}{!}{\includegraphics{CodeSamples/datastruct/hash/data/hps.perf-hashsize.2020.12.29a/zoohashsize}}
 \caption{Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs, Varying Table Size}
-\label{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs, Varying Table Size}
+\label{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs; Varying Table Size}
 \end{figure}
 
 	Still unconvinced?
 	Then look at the log-log plot in
-	Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs, Varying Table Size},
+	Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs; Varying Table Size},
 	which shows performance for 448 CPUs as a function of the
 	hash-table size, that is, number of buckets and maximum number
 	of elements.
@@ -734,8 +734,8 @@ to about half again faster than that of either QSBR or RCU\@.
 	a factor of 25.
 
 	The reason that
-	Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo, Varying Buckets}
-	on page~\pageref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo, Varying Buckets}
+	Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
+	on page~\pageref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
 	shows little effect is that its data was gathered from
 	bucket-locked hash tables, where locking overhead and contention
 	drowned out cache-capacity effects.
@@ -1514,11 +1514,11 @@ the old hash table, and finally line~\lnref{ret_success} returns success.
 \centering
 \resizebox{2.7in}{!}{\includegraphics{datastruct/perftestresize}}
 \caption{Overhead of Resizing Hash Tables Between 262,144 and 524,288 Buckets vs.\@ Total Number of Elements}
-\label{fig:datastruct:Overhead of Resizing Hash Tables Between 262,144 and 524,288 Buckets vs. Total Number of Elements}
+\label{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}
 \end{figure}
 % Data from CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a
 
-Figure~\ref{fig:datastruct:Overhead of Resizing Hash Tables Between 262,144 and 524,288 Buckets vs. Total Number of Elements}
+Figure~\ref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}
 compares resizing hash tables to their fixed-sized counterparts
 for 262,144 and 2,097,152 elements in the hash table.
 The figure shows three traces for each element count, one
@@ -1558,7 +1558,7 @@ bottleneck.
 \QuickQuiz{
 	How much of the difference in performance between the large and
 	small hash tables shown in
-	Figure~\ref{fig:datastruct:Overhead of Resizing Hash Tables Between 262,144 and 524,288 Buckets vs. Total Number of Elements}
+	Figure~\ref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}
 	was due to long hash chains and how much was due to
 	memory-system bottlenecks?
 }\QuickQuizAnswer{
@@ -1579,8 +1579,8 @@ bottleneck.
 	the middle of
 	\cref{fig:datastruct:Effect of Memory-System Bottlenecks on Hash Tables}.
 	The other six traces are identical to their counterparts in
-	Figure~\ref{fig:datastruct:Overhead of Resizing Hash Tables Between 262,144 and 524,288 Buckets vs. Total Number of Elements}
-	on page~\pageref{fig:datastruct:Overhead of Resizing Hash Tables Between 262,144 and 524,288 Buckets vs. Total Number of Elements}.
+	Figure~\ref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}
+	on page~\pageref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}.
 	The gap between this new trace and the lower set of three
 	traces is a rough measure of how much of the difference in
 	performance was due to hash-chain length, and the gap between
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 315318c0..a7de666c 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -20,7 +20,7 @@ presents RCU's diagnostic APIs, and
 Section~\ref{sec:defer:Where Can RCU's APIs Be Used?}
 describes in which contexts RCU's various APIs may be used.
 Finally,
-Section~\ref{sec:defer:So, What is RCU Really?}
+Section~\ref{sec:defer:So; What is RCU Really?}
 presents concluding remarks.
 
 Readers who are not excited about kernel internals may wish to skip
@@ -1097,7 +1097,7 @@ for example, \co{srcu_read_lock()} may be used in any context
 in which \co{rcu_read_lock()} may be used.
 
 \subsubsection{So, What \emph{is} RCU Really?}
-\label{sec:defer:So, What is RCU Really?}
+\label{sec:defer:So; What is RCU Really?}
 
 At its core, RCU is nothing more nor less than an API that supports
 publication and subscription for insertions, waiting for all RCU readers
diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index 1573a927..4f815266 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -182,10 +182,10 @@ the atoms used in modern digital electronics.
 \centering
 \resizebox{2.5in}{!}{\includegraphics{CodeSamples/defer/perf-refcnt-logscale}}
 \caption{Pre-BSD Routing Table Protected by Reference Counting, Log Scale}
-\label{fig:defer:Pre-BSD Routing Table Protected by Reference Counting, Log Scale}
+\label{fig:defer:Pre-BSD Routing Table Protected by Reference Counting; Log Scale}
 \end{figure}
 
-	Figure~\ref{fig:defer:Pre-BSD Routing Table Protected by Reference Counting, Log Scale}
+	Figure~\ref{fig:defer:Pre-BSD Routing Table Protected by Reference Counting; Log Scale}
 	shows the same data, but on a log-log plot.
 	As you can see, the refcnt line drops below 5,000 at two CPUs.
 	This means that the refcnt performance at two CPUs is more than
diff --git a/intro/intro.tex b/intro/intro.tex
index 852ea82d..77e89f3c 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -592,7 +592,7 @@ programming environments:
 \centering
 \resizebox{2.5in}{!}{\includegraphics{intro/PPGrelation}}
 \caption{Software Layers and Performance, Productivity, and Generality}
-\label{fig:intro:Software Layers and Performance, Productivity, and Generality}
+\label{fig:intro:Software Layers and Performance; Productivity; and Generality}
 \end{figure}
 
 The nirvana of parallel programming environments, one that offers
@@ -601,7 +601,7 @@ not yet exist.
 Until such a nirvana appears, it will be necessary to make engineering
 tradeoffs among performance, productivity, and generality.
 One such tradeoff is shown in
-Figure~\ref{fig:intro:Software Layers and Performance, Productivity, and Generality},
+Figure~\ref{fig:intro:Software Layers and Performance; Productivity; and Generality},
 which shows how productivity becomes increasingly important at the upper layers
 of the system stack,
 while performance and generality become increasingly important at the
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index b358c22d..f9a8ee90 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1231,7 +1231,7 @@ code or whether the kernel's boot-time code is in fact the required
 initialization code.
 
 \subsection{Thread Creation, Destruction, and Control}
-\label{sec:toolsoftrade:Thread Creation, Destruction, and Control}
+\label{sec:toolsoftrade:Thread Creation; Destruction; and Control}
 
 The Linux kernel uses
 \apik{struct task_struct} pointers to track kthreads,
@@ -2135,7 +2135,7 @@ if (ptr != NULL && ptr < high_address)
 \end{VerbatimL}
 \end{fcvlabel}
 \caption{Avoiding Danger, 2018 Style}
-\label{lst:toolsoftrade:Avoiding Danger, 2018 Style}
+\label{lst:toolsoftrade:Avoiding Danger; 2018 Style}
 \end{listing}
 
 Using \apik{READ_ONCE()} on
@@ -2143,7 +2143,7 @@ line~\ref{ln:toolsoftrade:Living Dangerously Early 1990s Style:temp} of
 Listing~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style}
 avoids invented loads,
 resulting in the code shown in
-Listing~\ref{lst:toolsoftrade:Avoiding Danger, 2018 Style}.
+Listing~\ref{lst:toolsoftrade:Avoiding Danger; 2018 Style}.
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:Preventing Load Fusing]
-- 
2.17.1


