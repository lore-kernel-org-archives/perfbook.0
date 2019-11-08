Return-Path: <SRS0=HxeD=ZA=foxmail.com=laokz@kernel.org>
Message-ID: <5dc51e76.1c69fb81.b298d.6c9aSMTPIN_ADDED_BROKEN@mx.google.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1573199471;
	bh=IzuwpdpwLU+Zx8HANvPFy0KmUOlBcOZrPgQYI7/btic=;
	h=Message-ID:Subject:From:To:Date:MIME-Version;
	b=ki20XUBmaeLOUVQqBxtGGgzayupUDTN2QucQoBSJvugZpcMLpqJai4i7yc5sLE5i7
	 QuH4AqvvjyW1ul7hNrOj5nkXlqkVQggIHud7YqK3gqD5WpqBwgrSfmDTD47xUNLPWv
	 LNpioqgE3uIGubm7jlatFfTSAmArYJjamO5XB0pQ=
Subject: [PATCH] A little typos of perfbook
From: laokz <laokz@foxmail.com>
Date: Fri, 08 Nov 2019 15:47:46 +0800
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook mailing list <perfbook@vger.kernel.org>
List-ID: <perfbook.vger.kernel.org>

Hello Paul,

Thanks for your great book!

Here a little typos(replace my earlier email). Mostly might be trivial, the
2nd I think, barrier() cannot prevent CPU from reordering that two
irrelevant loads, so smp_rmb() may be appropriate.

Best regards,
laokz

Signed-off-by: Zhang, Kai <laokz@foxmail.com>

-----

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 7b53ebab..9b6d7a7f 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -966,7 +966,7 @@ straightforward.
 add one to the global free-running \co{rcu_gp_ctr}
 variable and stores the resulting odd-numbered value into the
 \co{rcu_reader_gp} per-thread variable.
-Clnref{mb} executes a memory barrier to prevent the content of the
+\Clnref{mb} executes a memory barrier to prevent the content of the
 subsequent RCU read-side critical section from ``leaking out''.
 \end{lineref}
 
diff --git a/appendix/whymb/whymemorybarriers.tex
b/appendix/whymb/whymemorybarriers.tex
index 7d5e1f5c..016b8bcb 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1482,14 +1482,14 @@ Therefore, CPU~2's assertion on line~9 is guaranteed
\emph{not} to fire.
 \QuickQuizAnswer{
 	The assertion must ensure that the load of
 	``e'' precedes that of ``a''.
-	In the Linux kernel, the \co{barrier()} primitive may be used to
+	In the Linux kernel, the \co{smp_rmb()} primitive may be used to
 	accomplish this in much the same way that the memory barrier was
 	used in the assertions in the previous examples.
 	For example, the assertion can be modified as follows:
 
 \begin{VerbatimU}[fontsize=\footnotesize]
 r1 = e;
-barrier();
+smp_rmb();
 assert(r1 == 0 || a == 1);
 \end{VerbatimU}
 
diff --git a/defer/RCUListInsertClassic.svg b/defer/RCUListInsertClassic.svg
index f18a20e9..f93f4189 100644
--- a/defer/RCUListInsertClassic.svg
+++ b/defer/RCUListInsertClassic.svg
@@ -324,7 +324,7 @@
        id="text64"
        style="font-size:108px;font-style:normal;font-weight:bold;text-
anchor:middle;fill:#000000;font-family:Courier"><tspan
          style="font-size:108.53968048px;font-style:normal;font-
variant:normal;font-weight:bold;font-stretch:normal;font-family:Liberation
Mono;-inkscape-font-specification:Liberation Mono Bold"
-         id="tspan3836">gptr = smp_load_acquire(&amp;p);</tspan></text>
+         id="tspan3836">smp_store_release(&amp;gptr, p);</tspan></text>
     <!-- Text -->
     <!-- Text -->
     <!-- Text -->
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 2c3b9451..94128bdb 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -260,10 +260,10 @@ Figure~\ref{fig:defer:RCU Reader and Earlier Grace
Period}.
 If any portion of a given critical section follows the end of
 a given grace period, then RCU guarantees that all of that critical
 section will follow the beginning of that grace period.
-In the figure, because \co{P0()}'s access to \co{x} follows
+In the figure, because \co{P0()}'s access to \co{y} follows
 \co{P1()}'s access to this same variable, it is guaranteed that
-\co{P0()}'s access to \co{y} will precede \co{P1()}'s access.
-In this case, if \co{x}'s final value is 1, then \co{y}'s
+\co{P0()}'s access to \co{x} will follow \co{P1()}'s access.
+In this case, if \co{y}'s final value is 1, then \co{x}'s
 final value is guaranteed to also be 1.
 
 \begin{figure}[tb]
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 8ccdc6bc..7f7deef2 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -367,7 +367,7 @@ void synchronize_rcu(void)
 \end{VerbatimN}
 
 The \co{for_each_online_cpu()} primitive iterates over all CPUs, and
-the \co{sched_setaffinity_on()} function causes the current thread to
+the \co{sched_setaffinity()} function causes the current thread to
 execute on the specified CPU, which forces the destination CPU to execute
 a context switch.
 Therefore, once the \co{for_each_online_cpu()} has completed, each CPU
diff --git a/future/cpu.tex b/future/cpu.tex
index a503989c..815a5cde 100644
--- a/future/cpu.tex
+++ b/future/cpu.tex
@@ -190,7 +190,7 @@ And one more quote from
2004~\cite{PaulEdwardMcKenneyPhD}:
 	to instruction-execution overhead.
 	Systems such as Linux that have significant use of RCU will find
 	additional use of RCU to be profitable, as shown in
-	\cref{fig:future:Breakevens vs. r; lambda Large; Four CPUs}
+	\cref{fig:future:Breakevens vs. r; lambda Large; Four CPUs}.
 	As can be seen in this figure, if RCU is heavily used, increasing
 	memory-latency ratios give RCU an increasing advantage over other
 	synchronization mechanisms.
diff --git a/locking/locking.tex b/locking/locking.tex
index a841dd48..40fe77d8 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -2170,15 +2170,15 @@ However, this approach has a couple of
vulnerabilities:
 	This could again result in arbitrary memory corruption.
 \end{enumerate}
 
-The \co{atfork()} function is provided to help deal with these situations.
+The \co{pthread_atfork()} function is provided to help deal with these
situations.
 The idea is to register a triplet of functions, one to be called by the
 parent before the \co{fork()}, one to be called by the parent after the
 \co{fork()}, and one to be called by the child after the \co{fork()}.
 Appropriate cleanups can then be carried out at these three points.
 
-Be warned, however, that coding of \co{atfork()} handlers is quite subtle
+Be warned, however, that coding of \co{pthread_atfork()} handlers is quite
subtle
 in general.
-The cases where \co{atfork()} works best are cases where the data structure
+The cases where \co{pthread_atfork()} works best are cases where the data
structure
 in question can simply be re-initialized by the child.
 
 \subsubsection{Parallel Libraries: Discussion}
diff --git a/memorder/RCU2G2R.svg b/memorder/RCU2G2R.svg
index 124649e9..ac339491 100644
--- a/memorder/RCU2G2R.svg
+++ b/memorder/RCU2G2R.svg
@@ -823,7 +823,7 @@
            x="39.021881"
            y="793.81842"
            id="tspan4936-7"
-           style="text-align:start;text-anchor:start">WRITE_ONCE(x0,
2);</tspan></text>
+           style="text-align:start;text-anchor:start">WRITE_ONCE(x1,
2);</tspan></text>
     </g>
     <g
        transform="matrix(1.0007732,0,0,1.1198315,132.03049,64.767338)"
@@ -876,7 +876,7 @@
            id="tspan5356-1"
            y="792.81842"
            x="35.972801"
-           sodipodi:role="line">r2 = READ_ONCE(x1);</tspan></text>
+           sodipodi:role="line">r2 = READ_ONCE(x2);</tspan></text>
     </g>
     <text
        xml:space="preserve"
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index ffb8c796..2c574187 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1277,7 +1277,7 @@ in pre-v4.15 Linux kernels.
 \QuickQuizAnswer{
 	Answering this requires identifying three major groups of platforms:
 	(1)~Total-store-order (TSO) platforms,
-	(2)~Weakly ordered platorms, and
+	(2)~Weakly ordered platforms, and
 	(3)~DEC Alpha.
 
 	\begin{lineref}[ln:memorder:Enforced Ordering of Message-Passing
Address-Dependency Litmus Test (Before v4.15)]
@@ -1523,7 +1523,7 @@ situation arises.
 	\cref{lst:memorder:Cache-Coherent IRIW Litmus Test},
 	wouldn't be just as bad if \co{P2()}'s \co{r1} and \co{r2}
 	obtained the values 2 and 1, respectively, while \co{P3()}'s
-	\co{r1} and \co{r2} obtained the values 1 and 2, respectively?
+	\co{r3} and \co{r4} obtained the values 1 and 2, respectively?
 \QuickQuizAnswer{
 	Yes, it would.
 	Feel free to modify the \co{exists} clause to
@@ -2020,11 +2020,11 @@ The result is shown in
 	\begin{lineref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
 	As a rough rule of thumb, the \co{smp_mb()} barrier's
 	propagation property is sufficient to maintain ordering
-	through only one store-to-load link between
+	through only one load-to-store link between
 	processes.
 	Unfortunately,
 	\cref{lst:memorder:W+RWC Litmus Test With Release (No Ordering)}
-	has not one but two store-to-load links, with the
+	has not one but two load-to-store links, with the
 	first being from the \co{READ_ONCE()} on \clnref{P1:ld} to the
 	\co{WRITE_ONCE()} on \clnref{P2:st} and the second being from
 	the \co{READ_ONCE()} on \clnref{P2:ld} to the \co{WRITE_ONCE()}
@@ -3591,7 +3591,7 @@ beginning of that same grace period, which happens to
also be after the
 end of \co{P0()}'s grace period.
 Therefore, \co{P3()}'s critical section must start after the beginning
 of \co{P0()}'s grace period, which in turn means that \co{P3()}'s
-read from \co{x0} cannot possibly precede \co{P0()}'s read.
+read from \co{x0} cannot possibly precede \co{P0()}'s write.
 Therefore, the cycle is forbidden because RCU read-side critical sections
 cannot span full RCU grace periods.
 
diff --git a/memorder/store15tred.dot b/memorder/store15tred.dot
index ba6a277e..03a2f22c 100644
--- a/memorder/store15tred.dot
+++ b/memorder/store15tred.dot
@@ -1,5 +1,6 @@
 digraph sequence15CPUs {
 	1 -> 6;
+	2 -> 3;
 	2 -> 15;
 	3 -> 9;
 	4 -> 10;
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 6f5c04dc..edc9f614 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -233,7 +233,7 @@ references.
 	scales linearly, then the lock-based implementation shown in
 	\cref{lst:count:Per-Thread Statistical Counters}
 	simply will not work for you.
-	On the other hand, if calls to \co{count_read()} are sufficiently
+	On the other hand, if calls to \co{read_count()} are sufficiently
 	rare, then the lock-based version is simpler and might thus be
 	better, although much of the size difference is due
 	to the structure definition, memory allocation, and \co{NULL}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index b4c1e044..73d4b2e3 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2444,7 +2444,7 @@ the celebrated compare-and-swap (CAS) operation is
provided by
 \co{atomic_cmpxchg()}.
 Both of these return the old value.
 Many additional atomic RMW primitives are available in the Linux kernel,
-see the \co{Documentation/atomic_ops.txt} file in the Linux-kernel
+see the \co{Documentation/core-api/atomic_ops.rst} file in the Linux-kernel
 source tree.
 
 This book's CodeSamples API closely follows that of the Linux kernel.

