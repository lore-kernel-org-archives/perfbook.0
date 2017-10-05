Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wr9smsQSSDHB1nS/RXSqWKPA+pMq8zC7Uun47QJFo4g=;
 b=JNPVR/1ZHzYq/YcZhvyVu5Ab98jr94KLdHpc8h9OVVnpDx0J40SHSKtOkA8mhKIWcj
 kXMnkl5bUiZNe0WsRkAsXMZLzFJJ2hoRrkE4wxohoI6oK7HpQagi00ZHbBh+r9rPssD+
 vqLudz6J5kiTYX5QjTGHI9pX7mbPsvMgDWm4Vmt+ignLRiEGgatyQLPFFQoISUMRUHJm
 YGSdkzXRhlz1ApPyfI4PmWqP1lxTzogtKJ2DHACvyC+ZhGyF2MPZ/sL/RF0nNMLtk4eO
 5cZYlj2TfQByY7wahiWdBVzBSHWpxJaE3r8Ub913ID5qaKug/mwnR0vsoLyksEKI7cd+
 mV9w==
Subject: [PATCH 06/10] treewide: Use \Power{} macro for POWER CPU family
References: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7873ebb2-714c-e68d-3130-1ed7710bbde4@gmail.com>
Date: Fri, 6 Oct 2017 00:54:38 +0900
MIME-Version: 1.0
In-Reply-To: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c7255fa8b6fc7835c0eb6ab524aed3349cea1dca Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 1 Oct 2017 12:40:18 +0900
Subject: [PATCH 06/10] treewide: Use \Power{} macro for POWER CPU family

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/toyrcu/toyrcu.tex    | 26 +++++++++++++-------------
 count/count.tex               |  6 +++---
 intro/intro.tex               |  2 +-
 memorder/memorder.tex         | 30 +++++++++++++++---------------
 perfbook.tex                  |  1 +
 toolsoftrade/toolsoftrade.tex |  4 ++--
 6 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index db45fad..2c65f74 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -73,7 +73,7 @@ Of course, only one RCU reader may be in its read-side critical section
 at a time, which almost entirely defeats the purpose of RCU.
 In addition, the lock operations in \co{rcu_read_lock()} and
 \co{rcu_read_unlock()} are extremely heavyweight,
-with read-side overhead ranging from about 100~nanoseconds on a single Power5
+with read-side overhead ranging from about 100~nanoseconds on a single \Power{5}
 CPU up to more than 17~\emph{microseconds} on a 64-CPU system.
 Worse yet,
 these same lock operations permit \co{rcu_read_lock()}
@@ -216,7 +216,7 @@ with a single global lock.
 Furthermore, the read-side overhead, though high at roughly 140 nanoseconds,
 remains at about 140 nanoseconds regardless of the number of CPUs.
 However, the update-side overhead ranges from about 600 nanoseconds
-on a single Power5 CPU
+on a single \Power{5} CPU
 up to more than 100 \emph{microseconds} on 64 CPUs.

 \QuickQuiz{}
@@ -368,7 +368,7 @@ However, this implementations still has some serious shortcomings.
 First, the atomic operations in \co{rcu_read_lock()} and
 \co{rcu_read_unlock()} are still quite  heavyweight,
 with read-side overhead ranging from about 100~nanoseconds on
-a single Power5 CPU up to almost 40~\emph{microseconds}
+a single \Power{5} CPU up to almost 40~\emph{microseconds}
 on a 64-CPU system.
 This means that the RCU read-side critical sections
 have to be extremely long in order to get any real
@@ -718,9 +718,9 @@ In fact, they are more complex than those
 of the single-counter variant shown in
 Figure~\ref{fig:app:toyrcu:RCU Implementation Using Single Global Reference Counter},
 with the read-side primitives consuming about 150~nanoseconds on a single
-Power5 CPU and almost 40~\emph{microseconds} on a 64-CPU system.
+\Power{5} CPU and almost 40~\emph{microseconds} on a 64-CPU system.
 The update-side \co{synchronize_rcu()} primitive is more costly as
-well, ranging from about 200~nanoseconds on a single Power5 CPU to
+well, ranging from about 200~nanoseconds on a single \Power{5} CPU to
 more than 40~\emph{microseconds} on a 64-CPU system.
 This means that the RCU read-side critical sections
 have to be extremely long in order to get any real
@@ -963,9 +963,9 @@ environments.

 That said, the read-side primitives scale very nicely, requiring about
 115~nanoseconds regardless of whether running on a single-CPU or a 64-CPU
-Power5 system.
+\Power{5} system.
 As noted above, the \co{synchronize_rcu()} primitive does not scale,
-ranging in overhead from almost a microsecond on a single Power5 CPU
+ranging in overhead from almost a microsecond on a single \Power{5} CPU
 up to almost 200~microseconds on a 64-CPU system.
 This implementation could conceivably form the basis for a
 production-quality user-level RCU implementation.
@@ -1340,9 +1340,9 @@ destruction will not be reordered into the preceding loop.

 This approach achieves much better read-side performance, incurring
 roughly 63~nanoseconds of overhead regardless of the number of
-Power5 CPUs.
+\Power{5} CPUs.
 Updates incur more overhead, ranging from about 500~nanoseconds on
-a single Power5 CPU to more than 100~\emph{microseconds} on 64
+a single \Power{5} CPU to more than 100~\emph{microseconds} on 64
 such CPUs.

 \QuickQuiz{}
@@ -1542,9 +1542,9 @@ This approach achieves read-side performance almost equal to that
 shown in
 Section~\ref{sec:app:toyrcu:RCU Based on Free-Running Counter}, incurring
 roughly 65~nanoseconds of overhead regardless of the number of
-Power5 CPUs.
+\Power{5} CPUs.
 Updates again incur more overhead, ranging from about 600~nanoseconds on
-a single Power5 CPU to more than 100~\emph{microseconds} on 64
+a single \Power{5} CPU to more than 100~\emph{microseconds} on 64
 such CPUs.

 \QuickQuiz{}
@@ -1866,11 +1866,11 @@ This implementation has blazingly fast read-side primitives, with
 an \co{rcu_read_lock()}-\co{rcu_read_unlock()} round trip incurring
 an overhead of roughly 50~\emph{picoseconds}.
 The \co{synchronize_rcu()} overhead ranges from about 600~nanoseconds
-on a single-CPU Power5 system up to more than 100~microseconds on
+on a single-CPU \Power{5} system up to more than 100~microseconds on
 a 64-CPU system.

 \QuickQuiz{}
-	To be sure, the clock frequencies of Power
+	To be sure, the clock frequencies of \Power{}
 	systems in 2008 were quite high, but even a 5\,GHz clock
 	frequency is insufficient to allow
 	loops to be executed in 50~picoseconds!
diff --git a/count/count.tex b/count/count.tex
index 73b6866..a38aba1 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -3330,7 +3330,7 @@ will expand on these lessons.
 	\path{count_end_rcu.c} & \ref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters} &
 		5.7 ns & 354 ns & 501 ns \\
 \end{tabular}
-\caption{Statistical Counter Performance on Power-6}
+\caption{Statistical Counter Performance on \Power{6}}
 \label{tab:count:Statistical Counter Performance on Power-6}
 \end{table*}

@@ -3410,14 +3410,14 @@ courtesy of eventual consistency.
 	\path{count_lim_sig.c} & \ref{sec:count:Signal-Theft Limit Counter Implementation} &
 		Y & 10.2 ns & 370 ns & 54,000 ns \\
 \end{tabular}
-\caption{Limit Counter Performance on Power-6}
+\caption{Limit Counter Performance on \Power{6}}
 \label{tab:count:Limit Counter Performance on Power-6}
 \end{table*}

 Figure~\ref{tab:count:Limit Counter Performance on Power-6}
 shows the performance of the parallel limit-counting algorithms.
 Exact enforcement of the limits incurs a substantial performance
-penalty, although on this 4.7\,GHz Power-6 system that penalty can be reduced
+penalty, although on this 4.7\,GHz \Power{6} system that penalty can be reduced
 by substituting signals for atomic operations.
 All of these implementations suffer from read-side lock contention
 in the face of concurrent readers.
diff --git a/intro/intro.tex b/intro/intro.tex
index 8bed518..293a02f 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -77,7 +77,7 @@ that of a bicycle, courtesy of Moore's Law.
 Papers calling out the advantages of multicore CPUs were published
 as early as 1996~\cite{Olukotun96}.
 IBM introduced simultaneous multi-threading
-into its high-end POWER family in 2000, and multicore in 2001.
+into its high-end \Power{} family in 2000, and multicore in 2001.
 Intel introduced hyperthreading into its commodity Pentium line in
 November 2000, and both AMD and Intel introduced
 dual-core CPUs in 2005.
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 7dc3fb4..944c17a 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -314,7 +314,7 @@ synchronization primitives (such as locking and RCU)
 that are responsible for maintaining the illusion of ordering through use of
 \emph{memory barriers} (for example, \co{smp_mb()} in the Linux kernel).
 These memory barriers can be explicit instructions, as they are on
-ARM, POWER, Itanium, and Alpha, or they can be implied by other instructions,
+ARM, \Power{}, Itanium, and Alpha, or they can be implied by other instructions,
 as they often are on x86.
 Since these standard synchronization primitives preserve the illusion of
 ordering, your path of least resistance is to simply use these primitives,
@@ -827,7 +827,7 @@ if the shared variable had changed before entry into the loop.
 This allows us to plot each CPU's view of the value of \co{state.variable}
 over a 532-nanosecond time period, as shown in
 Figure~\ref{fig:memorder:A Variable With Multiple Simultaneous Values}.
-This data was collected in 2006 on 1.5\,GHz POWER5 system with 8 cores,
+This data was collected in 2006 on 1.5\,GHz \Power{5} system with 8 cores,
 each containing a pair of hardware threads.
 CPUs~1, 2, 3, and~4 recorded the values, while CPU~0 controlled the test.
 The timebase counter period was about 5.32\,ns, sufficiently fine-grained
@@ -2043,7 +2043,7 @@ communicated to \co{P1()} long before it was communicated to \co{P2()}.
 \QuickQuizAnswer{
 	You need to face the fact that it really can trigger.
 	Akira Yokosawa used the \co{litmus7} tool to run this litmus test
-	on a Power8 system.
+	on a \Power{8} system.
 	Out of 1,000,000,000 runs, 4 triggered the \co{exists} clause.
 	Thus, triggering the \co{exists} clause is not merely a one-in-a-million
 	occurrence, but rather a one-in-a-hundred-million occurrence.
@@ -3707,7 +3707,7 @@ dependencies.
 		\rotatebox{90}{PA-RISC CPUs}
 	  \end{picture}
 	& \begin{picture}(6,60)(0,0)
-		\rotatebox{90}{POWER}
+		\rotatebox{90}{\Power{}}
 	  \end{picture}
 	& \begin{picture}(6,60)(0,0)
 		\rotatebox{90}{SPARC TSO}
@@ -4134,7 +4134,7 @@ For more on Alpha, see its reference manual~\cite{ALPHA2002}.

 The ARM family of CPUs is extremely popular in embedded applications,
 particularly for power-constrained applications such as cellphones.
-Its memory model is similar to that of Power
+Its memory model is similar to that of \Power{}
 (see Section~\ref{sec:memorder:POWER / PowerPC}, but ARM uses a
 different set of memory-barrier instructions~\cite{ARMv7A:2010}:

@@ -4144,7 +4144,7 @@ different set of memory-barrier instructions~\cite{ARMv7A:2010}:
 	subsequent operations of the same type.
 	The ``type'' of operations can be all operations or can be
 	restricted to only writes (similar to the Alpha \co{wmb}
-	and the POWER \co{eieio} instructions).
+	and the \Power{} \co{eieio} instructions).
 	In addition, ARM allows cache coherence to have one of three
 	scopes: single processor, a subset of the processors
 	(``inner'') and global (``outer'').
@@ -4168,7 +4168,7 @@ None of these instructions exactly match the semantics of Linux's
 \co{DMB}.
 The \co{DMB} and \co{DSB} instructions have a recursive definition
 of accesses ordered before and after the barrier, which has an effect
-similar to that of POWER's cumulativity.
+similar to that of \Power{}'s cumulativity.

 ARM also implements control dependencies, so that if a conditional
 branch depends on a load, then any store executed after that conditional
@@ -4292,7 +4292,7 @@ memory barriers.
 \subsection{MIPS}

 The MIPS memory model~\cite[Table 6.6]{MIPSvII-A-2015}
-appears to resemble that of ARM, Itanium, and Power,
+appears to resemble that of ARM, Itanium, and \Power{},
 being weakly ordered by default, but respecting dependencies.
 MIPS has a wide variety of memory-barrier instructions, but ties them
 not to hardware considerations, but rather to the use cases provided
@@ -4325,7 +4325,7 @@ in a manner similar to the ARM64 additions:

 Informal discussions with MIPS architects indicates that MIPS has a
 definition of transitivity or cumulativity similar to that of
-ARM and Power.
+ARM and \Power{}.
 However, it appears that different MIPS implementations can have
 different memory-ordering properties, so it is important to consult
 the documentation for the specific MIPS implementation you are using.
@@ -4339,10 +4339,10 @@ no code, however, they do use the gcc {\tt memory} attribute to disable
 compiler optimizations that would reorder code across the memory
 barrier.

-\subsection{POWER / PowerPC}
+\subsection{\Power{} / PowerPC}
 \label{sec:memorder:POWER / PowerPC}

-The POWER and PowerPC\textsuperscript{\textregistered}
+The \Power{} and PowerPC\textsuperscript{\textregistered}
 CPU families have a wide variety of memory-barrier
 instructions~\cite{PowerPC94,MichaelLyons05a}:
 \begin{description}
@@ -4388,7 +4388,7 @@ The \co{smp_mb()} instruction is also defined to be the {\tt sync}
 instruction, but both \co{smp_rmb()} and \co{rmb()} are defined to
 be the lighter-weight {\tt lwsync} instruction.

-Power features ``cumulativity'', which can be used to obtain
+\Power{} features ``cumulativity'', which can be used to obtain
 transitivity.
 When used properly, any code seeing the results of an earlier
 code fragment will also see the accesses that this earlier code
@@ -4396,11 +4396,11 @@ fragment itself saw.
 Much more detail is available from
 McKenney and Silvera~\cite{PaulEMcKenneyN2745r2009}.

-Power respects control dependencies in much the same way that ARM
-does, with the exception that the Power \co{isync} instruction
+\Power{} respects control dependencies in much the same way that ARM
+does, with the exception that the \Power{} \co{isync} instruction
 is substituted for the ARM \co{ISB} instruction.

-Many members of the POWER architecture have incoherent instruction
+Many members of the \Power{} architecture have incoherent instruction
 caches, so that a store to memory will not necessarily be reflected
 in the instruction cache.
 Thankfully, few people write self-modifying code these days, but JITs
diff --git a/perfbook.tex b/perfbook.tex
index da9cfa8..cc4f4b0 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -138,6 +138,7 @@
 \newcommand{\qop}[1]{{\sffamily #1}} % QC operator such as H, T, S, etc.

 \DeclareRobustCommand{\euler}{\ensuremath{\mathrm{e}}}
+\newcommand{\Power}[1]{POWER#1}

 \newcommand{\Epigraph}[2]{\epigraphhead[65]{\rmfamily\epigraph{#1}{#2}}}

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 9cf3312..97a37d3 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1038,7 +1038,7 @@ Line~39 moves the lock-acquisition count to this thread's element of the
 \end{figure}

 Figure~\ref{fig:toolsoftrade:Reader-Writer Lock Scalability}
-shows the results of running this test on a 64-core Power-5 system
+shows the results of running this test on a 64-core \Power{5} system
 with two hardware threads per core for a total of 128 software-visible
 CPUs.
 The \co{thinktime} parameter was zero for all these tests, and the
@@ -1137,7 +1137,7 @@ This situation will only get worse as you add CPUs.
 } \QuickQuizEnd

 \QuickQuiz{}
-	Power-5 is several years old, and new hardware should
+	\Power{5} is several years old, and new hardware should
 	be faster.
 	So why should anyone worry about reader-writer locks being slow?
 \QuickQuizAnswer{
-- 
2.7.4


