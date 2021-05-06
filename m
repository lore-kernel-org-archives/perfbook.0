Return-Path: <SRS0=jSvE=KB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8fMEzliHltEq/rdjjjl3hNfkjb3WcWqBMRkxwqsLDdM=;
        b=L4quoq3yCi+Bb/AhU324h6P6TNFW1y9bRGLmTUpF27QzKZXJa3uflabOg5LXL6MN+F
         DINAcV6zeJKjvFzF+Nrm3DR/0YeOGiuuVobgI4hEpxN7ejDGnxpfeeAgk+UB//l7yHLV
         ju6nd09p/TRFq+YLqlIneLScUQGuDezK5Bxz5GBEyHHxRsXFbXfwYryBEX8s28RWvwSE
         B6N+Fr3dXxmgOSIVqXNqrS7DQTXMXTFNXIZiuzydSGqKGWMoCiIBPUk/FlzfcELWcMLc
         eDBUsjl7ubeytlBXju3IEOOP4ViCSu9Rbi5dI+pO4o/ElSlCFeo1SRF55+14p+yKGeMu
         VtUw==
Subject: [PATCH -perfbook 3/4] cpu: Employ \cref{} and its variants
References: <9fabe167-7282-e0c0-affa-1ae11acee698@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2a342da8-a411-8c84-11b8-19d625bfc5c2@gmail.com>
Date: Thu, 6 May 2021 23:26:02 +0900
MIME-Version: 1.0
In-Reply-To: <9fabe167-7282-e0c0-affa-1ae11acee698@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/cpu.tex         |  6 +++---
 cpu/hwfreelunch.tex | 12 ++++++------
 cpu/overheads.tex   | 26 +++++++++++++-------------
 cpu/overview.tex    | 32 ++++++++++++++++----------------
 cpu/swdesign.tex    | 18 +++++++-----------
 5 files changed, 45 insertions(+), 49 deletions(-)

diff --git a/cpu/cpu.tex b/cpu/cpu.tex
index 44b470a4..183feb8c 100644
--- a/cpu/cpu.tex
+++ b/cpu/cpu.tex
@@ -63,11 +63,11 @@ So, to sum up:
 The remainder of this book describes ways of handling this bad news.
 
 In particular,
-Chapter~\ref{chp:Tools of the Trade} will cover some of the low-level
+\cref{chp:Tools of the Trade} will cover some of the low-level
 tools used for parallel programming,
-Chapter~\ref{chp:Counting} will investigate problems and solutions to
+\cref{chp:Counting} will investigate problems and solutions to
 parallel counting, and
-Chapter~\ref{cha:Partitioning and Synchronization Design}
+\cref{cha:Partitioning and Synchronization Design}
 will discuss design disciplines that promote performance and scalability.
 
 \QuickQuizAnswersChp{qqzcpu}
diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
index c4a9b495..92f04f16 100644
--- a/cpu/hwfreelunch.tex
+++ b/cpu/hwfreelunch.tex
@@ -17,8 +17,8 @@ induced single-threaded
 performance increases
 (or ``free lunch''~\cite{HerbSutter2008EffectiveConcurrency}),
 as shown in
-Figure~\ref{fig:intro:Clock-Frequency Trend for Intel CPUs} on
-page~\pageref{fig:intro:Clock-Frequency Trend for Intel CPUs}.
+\cref{fig:intro:Clock-Frequency Trend for Intel CPUs} on
+\cpageref{fig:intro:Clock-Frequency Trend for Intel CPUs}.
 This section briefly surveys a few ways that hardware designers
 might bring back the ``free lunch''.
 
@@ -27,8 +27,8 @@ obstacles to exploiting concurrency.
 One severe physical limitation that hardware designers face is the
 finite speed of light.
 As noted in
-Figure~\ref{fig:cpu:System Hardware Architecture} on
-page~\pageref{fig:cpu:System Hardware Architecture},
+\cref{fig:cpu:System Hardware Architecture} on
+\cpageref{fig:cpu:System Hardware Architecture},
 light can manage only about an 8-centimeters round trip in a vacuum
 during the duration of a 1.8\,GHz clock period.
 This distance drops to about 3~centimeters for a 5\,GHz clock.
@@ -140,7 +140,7 @@ significant fabrication challenges~\cite{JohnKnickerbocker2008:3DI}.
 
 Perhaps the most important benefit of 3DI is decreased path length through
 the system, as shown in
-Figure~\ref{fig:cpu:Latency Benefit of 3D Integration}.
+\cref{fig:cpu:Latency Benefit of 3D Integration}.
 A 3-centimeter silicon die is replaced with a stack of four 1.5-centimeter
 dies, in theory decreasing the maximum path through the system by a factor
 of two, keeping in mind that each layer is quite thin.
@@ -266,7 +266,7 @@ The purpose of these accelerators is to improve energy efficiency
 and thus extend battery life: special purpose hardware can often
 compute more efficiently than can a general-purpose CPU\@.
 This is another example of the principle called out in
-Section~\ref{sec:intro:Generality}: \IX{Generality} is almost never free.
+\cref{sec:intro:Generality}: \IX{Generality} is almost never free.
 
 Nevertheless, given the end of \IXaltr{Moore's-Law}{Moore's Law}-induced
 single-threaded performance increases, it seems safe to assume that
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 3505b4f4..cb6b4f83 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -24,7 +24,7 @@ architecture, which is the subject of the next section.
 \label{fig:cpu:System Hardware Architecture}
 \end{figure}
 
-Figure~\ref{fig:cpu:System Hardware Architecture}
+\Cref{fig:cpu:System Hardware Architecture}
 shows a rough schematic of an eight-core computer system.
 Each die has a pair of CPU cores, each with its cache, as well as an
 interconnect allowing the pair of CPUs to communicate with each other.
@@ -116,7 +116,7 @@ events might ensue:
 This simplified sequence is just the beginning of a discipline called
 \emph{cache-coherency protocols}~\cite{Hennessy95a,DavidECuller1999,MiloMKMartin2012scale,DanielJSorin2011MemModel},
 which is discussed in more detail in
-Appendix~\ref{chp:app:whymb:Why Memory Barriers?}.
+\cref{chp:app:whymb:Why Memory Barriers?}.
 As can be seen in the sequence of events triggered by a \IXacr{cas} operation,
 a single instruction can cause considerable protocol traffic, which
 can significantly degrade your parallel program's performance.
@@ -126,7 +126,7 @@ interval during which it is never updated, that variable can be replicated
 across all CPUs' caches.
 This replication permits all CPUs to enjoy extremely fast access to
 this \emph{read-mostly} variable.
-Chapter~\ref{chp:Deferred Processing} presents synchronization
+\Cref{chp:Deferred Processing} presents synchronization
 mechanisms that take full advantage of this important hardware read-mostly
 optimization.
 
@@ -174,7 +174,7 @@ optimization.
 
 The overheads of some common operations important to parallel programs are
 displayed in
-Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}.
+\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}.
 This system's clock period rounds to 0.5\,ns.
 Although it is not unusual for modern microprocessors to be able to
 retire multiple instructions per clock period, the operations' costs are
@@ -351,16 +351,16 @@ thousand clock cycles.
 	10\,GHz.
 
 	In addition,
-	Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
+	\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	on
-	page~\pageref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
+	\cpageref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	represents a reasonably large system with no fewer 448~hardware
 	threads.
 	Smaller systems often achieve better latency, as may be seen in
-	Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System},
+	\cref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System},
 	which represents a much smaller system with only 16 hardware threads.
 	A similar view is provided by the rows of
-	Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
+	\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	down to and including the two ``Off-core'' rows.
 
 \begin{table*}
@@ -404,7 +404,7 @@ thousand clock cycles.
 	Alternatively, a 64-CPU system in the mid 1990s had
 	cross-interconnect latencies in excess of five microseconds,
 	so even the eight-socket 448-hardware-thread monster shown in
-	Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
+	\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	represents more than a five-fold improvement over its
 	25-years-prior counterparts.
 
@@ -420,7 +420,7 @@ thousand clock cycles.
 	for concurrent software, even when running on relatively
 	small systems.
 
-	Section~\ref{sec:cpu:Hardware Free Lunch?}
+	\Cref{sec:cpu:Hardware Free Lunch?}
 	looks at what else hardware designers might be
 	able to do to ease the plight of parallel programmers.
 }\QuickQuizEnd
@@ -543,7 +543,7 @@ of store instructions to execute quickly even when the stores are to
 non-consecutive addresses and when none of the needed cachelines are
 present in the CPU's cache.
 The dark side of this optimization is memory misordering, for which see
-Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}.
+\cref{chp:Advanced Synchronization: Memory Ordering}.
 
 A fourth hardware optimization is speculative execution, which can
 allow the hardware to make good use of the store buffers without
@@ -571,7 +571,7 @@ data that is frequently read but rarely updated is present in all
 CPUs' caches.
 This optimization allows the read-mostly data to be accessed
 exceedingly efficiently, and is the subject of
-Chapter~\ref{chp:Deferred Processing}.
+\cref{chp:Deferred Processing}.
 
 \begin{figure}
 \centering
@@ -583,7 +583,7 @@ Chapter~\ref{chp:Deferred Processing}.
 In short, hardware and software engineers are really on the same side,
 with both trying to make computers go fast despite the best efforts of
 the laws of physics, as fancifully depicted in
-Figure~\ref{fig:cpu:Hardware and Software: On Same Side}
+\cref{fig:cpu:Hardware and Software: On Same Side}
 where our data stream is trying its best to exceed the speed of light.
 The next section discusses some additional things that the hardware engineers
 might (or might not) be able to do, depending on how well recent
diff --git a/cpu/overview.tex b/cpu/overview.tex
index 95899b35..d1d23b36 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -10,7 +10,7 @@
 
 Careless reading of computer-system specification sheets might lead one
 to believe that CPU performance is a footrace on a clear track, as
-illustrated in Figure~\ref{fig:cpu:CPU Performance at its Best},
+illustrated in \cref{fig:cpu:CPU Performance at its Best},
 where the race always goes to the swiftest.
 
 \begin{figure}
@@ -21,7 +21,7 @@ where the race always goes to the swiftest.
 \end{figure}
 
 Although there are a few CPU-bound benchmarks that approach the ideal case
-shown in Figure~\ref{fig:cpu:CPU Performance at its Best},
+shown in \cref{fig:cpu:CPU Performance at its Best},
 the typical program more closely resembles an obstacle course than
 a race track.
 This is because the internal architecture of CPUs has changed dramatically
@@ -53,7 +53,7 @@ Some cores have more than one hardware thread, which is variously called
 each of which appears as
 an independent CPU to software, at least from a functional viewpoint.
 These modern hardware features can greatly improve performance, as
-illustrated by Figure~\ref{fig:cpu:CPUs Old and New}.
+illustrated by \cref{fig:cpu:CPUs Old and New}.
 
 Achieving full performance with a CPU having a long pipeline requires
 highly predictable control flow through the program.
@@ -90,7 +90,7 @@ speculatively executed instructions following the corresponding
 branch, resulting in a pipeline flush.
 If pipeline flushes appear too frequently, they drastically reduce
 overall performance, as fancifully depicted in
-Figure~\ref{fig:cpu:CPU Meets a Pipeline Flush}.
+\cref{fig:cpu:CPU Meets a Pipeline Flush}.
 
 \begin{figure}
 \centering
@@ -168,7 +168,7 @@ have extremely unpredictable memory-access patterns---after all,
 if the pattern was predictable, us software types would not bother
 with the pointers, right?
 Therefore, as shown in
-Figure~\ref{fig:cpu:CPU Meets a Memory Reference},
+\cref{fig:cpu:CPU Meets a Memory Reference},
 memory references often pose severe obstacles to modern CPUs.
 
 Thus far, we have only been considering obstacles that can arise during
@@ -211,7 +211,7 @@ store buffer, without the need to wait for cacheline ownership.
 Although there are a number of hardware optimizations that can sometimes
 hide cache latencies, the resulting effect on performance is all too
 often as depicted in
-Figure~\ref{fig:cpu:CPU Meets an Atomic Operation}.
+\cref{fig:cpu:CPU Meets an Atomic Operation}.
 
 Unfortunately, atomic operations usually apply only to single elements
 of data.
@@ -234,20 +234,20 @@ as described in the next section.
 	By early 2014, several mainstream systems provided limited
 	hardware transactional memory implementations, which is covered
 	in more detail in
-	Section~\ref{sec:future:Hardware Transactional Memory}.
+	\cref{sec:future:Hardware Transactional Memory}.
 	The jury is still out on the applicability of software transactional
 	memory~\cite{McKenney2007PLOSTM,DonaldEPorter2007TRANSACT,
 	ChistopherJRossbach2007a,CalinCascaval2008tmtoy,
 	AleksandarDragovejic2011STMnotToy,AlexanderMatveev2012PessimisticTM},
-	which is covered in Section~\ref{sec:future:Transactional Memory}.
+	which is covered in \cref{sec:future:Transactional Memory}.
 }\QuickQuizEnd
 
 \subsection{Memory Barriers}
 \label{sec:cpu:Memory Barriers}
 
 Memory barriers will be considered in more detail in
-Chapter~\ref{chp:Advanced Synchronization: Memory Ordering} and
-Appendix~\ref{chp:app:whymb:Why Memory Barriers?}.
+\cref{chp:Advanced Synchronization: Memory Ordering} and
+\cref{chp:app:whymb:Why Memory Barriers?}.
 In the meantime, consider the following simple lock-based \IX{critical
 section}:
 
@@ -273,7 +273,7 @@ either explicit or implicit memory barriers.
 Because the whole purpose of these memory barriers is to prevent reorderings
 that the CPU would otherwise undertake in order to increase performance,
 memory barriers almost always reduce performance, as depicted in
-Figure~\ref{fig:cpu:CPU Meets a Memory Barrier}.
+\cref{fig:cpu:CPU Meets a Memory Barrier}.
 
 As with atomic operations, CPU designers have been working hard to
 reduce memory-barrier overhead, and have made substantial progress.
@@ -299,9 +299,9 @@ This is because when a given CPU wishes to modify the variable, it is
 most likely the case that some other CPU has modified it recently.
 In this case, the variable will be in that other CPU's cache, but not
 in this CPU's cache, which will therefore incur an expensive cache miss
-(see Section~\ref{sec:app:whymb:Cache Structure} for more detail).
+(see \cref{sec:app:whymb:Cache Structure} for more detail).
 Such cache misses form a major obstacle to CPU performance, as shown
-in Figure~\ref{fig:cpu:CPU Meets a Cache Miss}.
+in \cref{fig:cpu:CPU Meets a Cache Miss}.
 
 \QuickQuiz{
 	So have CPU designers also greatly reduced the overhead of
@@ -312,7 +312,7 @@ in Figure~\ref{fig:cpu:CPU Meets a Cache Miss}.
 	but the finite speed of light and the atomic nature of
 	matter limits their ability to reduce cache-miss overhead
 	for larger systems.
-	Section~\ref{sec:cpu:Hardware Free Lunch?}
+	\Cref{sec:cpu:Hardware Free Lunch?}
 	discusses some possible avenues for possible future progress.
 }\QuickQuizEnd
 
@@ -332,7 +332,7 @@ I/O operations involving networking, mass storage, or (worse yet) human
 beings pose much greater obstacles than the internal obstacles called
 out in the prior sections,
 as illustrated by
-Figure~\ref{fig:cpu:CPU Waits for I/O Completion}.
+\cref{fig:cpu:CPU Waits for I/O Completion}.
 
 This is one of the differences between shared-memory and distributed-system
 parallelism: shared-memory parallel programs must normally deal with no
@@ -345,7 +345,7 @@ that of the actual work being performed is a key design parameter.
 A major goal of parallel hardware design is to reduce this ratio as
 needed to achieve the relevant performance and scalability goals.
 In turn, as will be seen in
-Chapter~\ref{cha:Partitioning and Synchronization Design},
+\cref{cha:Partitioning and Synchronization Design},
 a major goal of parallel software design is to reduce the
 frequency of expensive operations like communications cache misses.
 
diff --git a/cpu/swdesign.tex b/cpu/swdesign.tex
index c59a70eb..63b6222f 100644
--- a/cpu/swdesign.tex
+++ b/cpu/swdesign.tex
@@ -12,7 +12,7 @@
 	 {\emph{Ella Wheeler Wilcox}}
 
 The values of the ratios in
-Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
+\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 are critically important, as they limit the
 efficiency of a given parallel application.
 To see this, suppose that the parallel application uses \IXacr{cas}
@@ -51,7 +51,7 @@ be extremely infrequent and to enable very large quantities of processing.
 		cache-miss latencies than do smaller system.
 		To see this, compare
 		\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
-		on page~\pageref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
+		on \cpageref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 		with
 		\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 12-CPU Intel Core i7-8750H CPU @ 2.20GHz}.
 	\item	The distributed-systems communications operations do
@@ -88,20 +88,16 @@ One approach is to run nearly independent threads.
 The less frequently the threads communicate, whether by \IX{atomic} operations,
 locks, or explicit messages, the better the application's performance
 and scalability will be.
-This approach will be touched on in
-Chapter~\ref{chp:Counting},
-explored in
-Chapter~\ref{cha:Partitioning and Synchronization Design},
-and taken to its logical extreme in
-Chapter~\ref{chp:Data Ownership}.
+This approach will be touched on in \cref{chp:Counting},
+explored in \cref{cha:Partitioning and Synchronization Design},
+and taken to its logical extreme in \cref{chp:Data Ownership}.
 
 Another approach is to make sure that any sharing be read-mostly, which
 allows the CPUs' caches to replicate the read-mostly data, in turn
 allowing all CPUs fast access.
 This approach is touched on in
-Section~\ref{sec:count:Eventually Consistent Implementation},
-and explored more deeply in
-Chapter~\ref{chp:Deferred Processing}.
+\cref{sec:count:Eventually Consistent Implementation},
+and explored more deeply in \cref{chp:Deferred Processing}.
 
 In short, achieving excellent parallel performance and scalability means
 striving for embarrassingly parallel algorithms and implementations,
-- 
2.17.1


