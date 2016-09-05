Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=I329Oq5e6NdmMplr5PcZTtBAXhVmW/Qr9iSl1vDMZxE=;
 b=cq1PjX+87rFig71Shh7ET11eY4pvd8OhDkbgqk42eARNUjJCmVbJe0b54eMDNl4sr4
 b7U3aqjivibjZsyh7NhIzQkz/c2jEccAK2Clm0BDBsHCJMEGZDjmi+yEGFcv7HYE2dLj
 zyIPxUR0F/lz0VTg998VU8+5wUmVGDwBDiJtuBnldFjHWtTL3P33R1PF9cuwAyHl4Cm/
 hfXbLdhUWnOIksYyrW2Z8ScQkwv76g7APXvrSRJNzHtr2KvTEqJO380p0XB+2xMdCRb6
 B/HUoP991wyeStUCAWugrNSI26BOIOLSl9P6+jWAoEepLhmNNUqOlz/a17qeeX/b1F+g
 gnFA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v2] treewide: Add \noindent where necessary
Message-ID: <7080142c-a8de-3fb8-c7e0-de2939730beb@gmail.com>
Date: Mon, 5 Sep 2016 23:47:56 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3590a93264e8497f5464397de1644076cd28f467 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 4 Sep 2016 08:01:50 +0900
Subject: [PATCH v2] treewide: Add \noindent where necessary

When there is some environment definition just after a section
heading, the implicit non-indentation of first paragraph is lost.

This seems inconsistent.

This commit adds "\noindent"s just before such first paragraphs
to recover the non-indentation.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/beyond.tex          | 1 +
 appendix/questions/time.tex   | 1 +
 count/count.tex               | 6 ++++++
 datastruct/datastruct.tex     | 3 +++
 debugging/debugging.tex       | 1 +
 defer/rcufundamental.tex      | 1 +
 defer/rcuusage.tex            | 1 +
 defer/refcnt.tex              | 1 +
 defer/toyrcu.tex              | 9 +++++++++
 formal/axiomatic.tex          | 1 +
 formal/dyntickrcu.tex         | 7 +++++++
 formal/ppcmem.tex             | 1 +
 formal/spinhint.tex           | 3 +++
 future/cpu.tex                | 1 +
 locking/locking-existence.tex | 1 +
 locking/locking.tex           | 3 +++
 rt/rt.tex                     | 3 +++
 together/applyrcu.tex         | 4 ++++
 18 files changed, 48 insertions(+)

diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index c64f580..3a8b3a0 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -86,6 +86,7 @@ presents future directions and concluding remarks.
 \label{fig:SMPdesign:SEQ Pseudocode}
 \end{figure}

+\noindent
 PWQ is based on SEQ, which is shown in
 Figure~\ref{fig:SMPdesign:SEQ Pseudocode}
 (\path{maze_seq.c}).
diff --git a/appendix/questions/time.tex b/appendix/questions/time.tex
index 137375e..063307c 100644
--- a/appendix/questions/time.tex
+++ b/appendix/questions/time.tex
@@ -11,6 +11,7 @@
 \ContributedBy{Figure}{fig:app:questions:What Time Is It?}{Melissa Broussard}
 \end{figure}

+\noindent
 A key issue with timekeeping on multicore computer systems is illustrated
 by Figure~\ref{fig:app:questions:What Time Is It?}.
 One problem is that it takes time to read out the time.
diff --git a/count/count.tex b/count/count.tex
index e433bac..8ffd8b6 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -187,6 +187,7 @@ are more appropriate for advanced students.
 \label{fig:count:Just Count!}
 \end{figure}

+\noindent
 Let's start with something simple, for example, the straightforward
 use of arithmetic shown in
 Figure~\ref{fig:count:Just Count!} (\path{count_nonatomic.c}).
@@ -986,6 +987,7 @@ comes at the cost of the additional thread running \co{eventual()}.
 \label{fig:count:Per-Thread Statistical Counters}
 \end{figure}

+\noindent
 Fortunately, gcc provides an \co{__thread} storage class that provides
 per-thread storage.
 This can be used as shown in
@@ -1412,6 +1414,7 @@ Section~\ref{sec:SMPdesign:Parallel Fastpath}.
 \label{fig:count:Simple Limit Counter Variable Relationships}
 \end{figure}

+\noindent
 Figure~\ref{fig:count:Simple Limit Counter Variables}
 shows both the per-thread and global variables used by this
 implementation.
@@ -1944,6 +1947,7 @@ This task is undertaken in the next section.
 \label{fig:count:Approximate Limit Counter Balancing}
 \end{figure}

+\noindent
 Because this implementation (\path{count_lim_app.c}) is quite similar to
 that in the previous section
 (Figures~\ref{fig:count:Simple Limit Counter Variables},
@@ -2580,6 +2584,7 @@ atomic operations are not necessary, as shown in the next section.
 \label{fig:count:Signal-Theft State Machine}
 \end{figure}

+\noindent
 Even though per-thread state will now be manipulated only by the
 corresponding thread, there will still need to be synchronization
 with the signal handlers.
@@ -2695,6 +2700,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
 \label{fig:count:Signal-Theft Limit Counter Data}
 \end{figure}

+\noindent
 Figure~\ref{fig:count:Signal-Theft Limit Counter Data}
 (\path{count_lim_sig.c})
 shows the data structures used by the signal-theft based counter
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index c963da5..89dd86f 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -172,6 +172,7 @@ offers excellent scalability.
 \label{fig:datastruct:Hash-Table Data-Structure Diagram}
 \end{figure}

+\noindent
 Figure~\ref{fig:datastruct:Hash-Table Data Structures}
 (\path{hash_bkt.c})
 shows a set of data structures used in a simple fixed-sized hash
@@ -568,6 +569,7 @@ section~\cite{McKenney:2013:SDS:2483852.2483867}.
 \label{fig:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}
 \end{figure}

+\noindent
 For an RCU-protected hash table with per-bucket locking,
 updaters use locking exactly as described in
 Section~\ref{sec:datastruct:Partitionable Data Structures},
@@ -1055,6 +1057,7 @@ which is the subject of the next section.
 \label{fig:datastruct:Resizable Hash-Table Data Structures}
 \end{figure}

+\noindent
 Resizing is accomplished by the classic approach of inserting a level
 of indirection, in this case, the \co{ht} structure shown on
 lines~12-25 of
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 2207a0e..988e6af 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2305,6 +2305,7 @@ detecting interference via measurement
 \ContributedBy{Figure}{fig:debugging:Choose Validation Methods Wisely}{Melissa Broussard}
 \end{figure}

+\noindent
 Although validation never will be an exact science, much can be gained
 by taking an organized approach to it, as an organized approach will
 help you choose the right validation tools for your job, avoiding
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index cf73f30..10c2caa 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -93,6 +93,7 @@ summarizes RCU fundamentals.
 \label{fig:defer:Data Structure Publication (Unsafe)}
 \end{figure}

+\noindent
 One key attribute of RCU is the ability to safely scan data, even
 though that data is being modified concurrently.
 To provide this ability for concurrent insertion,
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index a8c0973..2f32e8a 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -135,6 +135,7 @@ Section~\ref{sec:defer:RCU Usage Summary} provides a summary.
 \label{fig:defer:RCU Pre-BSD Routing Table Add/Delete}
 \end{figure}

+\noindent
 Figures~\ref{fig:defer:RCU Pre-BSD Routing Table Lookup}
 and~\ref{fig:defer:RCU Pre-BSD Routing Table Add/Delete}
 show code for an RCU-protected Pre-BSD routing table
diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index 14aaf4d..424d181 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -117,6 +117,7 @@
 \label{fig:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
 \end{figure}

+\noindent
 Reference counting tracks the number of references to a given object in
 order to prevent that object from being prematurely freed.
 As such, it has a long and honorable history of use dating back to
diff --git a/defer/toyrcu.tex b/defer/toyrcu.tex
index cd334ed..dfb69e1 100644
--- a/defer/toyrcu.tex
+++ b/defer/toyrcu.tex
@@ -59,6 +59,7 @@ provides a summary and a list of desirable RCU properties.
 \label{fig:defer:Lock-Based RCU Implementation}
 \end{figure}

+\noindent
 Perhaps the simplest RCU implementation leverages locking, as
 shown in
 Figure~\ref{fig:defer:Lock-Based RCU Implementation}
@@ -201,6 +202,7 @@ in the next section.
 \label{fig:defer:Per-Thread Lock-Based RCU Implementation}
 \end{figure}

+\noindent
 Figure~\ref{fig:defer:Per-Thread Lock-Based RCU Implementation}
 (\path{rcu_lock_percpu.h} and \path{rcu_lock_percpu.c})
 shows an implementation based on one lock per thread.
@@ -324,6 +326,7 @@ the shortcomings of the lock-based implementation.
 \label{fig:defer:RCU Implementation Using Single Global Reference Counter}
 \end{figure}

+\noindent
 A slightly more sophisticated RCU implementation is shown in
 Figure~\ref{fig:defer:RCU Implementation Using Single Global Reference Counter}
 (\path{rcu_rcg.h} and \path{rcu_rcg.c}).
@@ -492,6 +495,7 @@ scheme that is more favorable to writers.
 \label{fig:defer:RCU Read-Side Using Global Reference-Count Pair}
 \end{figure}

+\noindent
 Figure~\ref{fig:defer:RCU Read-Side Using Global Reference-Count Pair}
 (\path{rcu_rcgp.h})
 shows the read-side primitives of an RCU implementation that uses a pair
@@ -826,6 +830,7 @@ scheme that provides greatly improved read-side performance and scalability.
 \label{fig:defer:RCU Read-Side Using Per-Thread Reference-Count Pair}
 \end{figure}

+\noindent
 Figure~\ref{fig:defer:RCU Read-Side Using Per-Thread Reference-Count Pair}
 (\path{rcu_rcpl.h})
 shows the read-side primitives of an RCU implementation that uses per-thread
@@ -1033,6 +1038,7 @@ concurrent RCU updates.
 \label{fig:defer:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
 \end{figure}

+\noindent
 Figure~\ref{fig:defer:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
 (\path{rcu_rcpls.h})
 shows the read-side primitives for an RCU implementation using per-thread
@@ -1262,6 +1268,7 @@ thread-local accesses to one, as is done in the next section.
 \label{fig:defer:Free-Running Counter Using RCU}
 \end{figure}

+\noindent
 Figure~\ref{fig:defer:Free-Running Counter Using RCU}
 (\path{rcu.h} and \path{rcu.c})
 shows an RCU implementation based on a single global free-running counter
@@ -1463,6 +1470,7 @@ variables.
 \label{fig:defer:Nestable RCU Using a Free-Running Counter}
 \end{figure}

+\noindent
 Figure~\ref{fig:defer:Nestable RCU Using a Free-Running Counter}
 (\path{rcu_nest.h} and \path{rcu_nest.c})
 show an RCU implementation based on a single global free-running counter,
@@ -1730,6 +1738,7 @@ overhead.
 \label{fig:defer:Quiescent-State-Based RCU Read Side}
 \end{figure}

+\noindent
 Figure~\ref{fig:defer:Quiescent-State-Based RCU Read Side}
 (\path{rcu_qs.h})
 shows the read-side primitives used to construct a user-level
diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index cc420cf..2a32ca2 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -31,6 +31,7 @@
 \label{fig:formal:IRIW Litmus Test}
 \end{figure*}

+\noindent
 Although the PPCMEM tool can solve the famous ``independent reads of
 independent writes'' (IRIW) litmus test shown in
 Figure~\ref{fig:formal:IRIW Litmus Test}, doing so requires no less than
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 2cd8310..ade08c6 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -313,6 +313,7 @@ preemptible RCU's grace-period machinery.
 \label{fig:formal:Preemptible RCU State Machine}
 \end{figure}

+\noindent
 Of the four preemptible RCU grace-period states shown in
 Figure~\ref{fig:formal:Preemptible RCU State Machine},
 only the \co{rcu_try_flip_waitack_state()}
@@ -1796,6 +1797,7 @@ states, passing without errors.
 \label{fig:formal:Variable-Name-Typo Fix Patch}
 \end{figure}

+\noindent
 This effort provided some lessons (re)learned:

 \begin{enumerate}
@@ -1876,6 +1878,7 @@ Manfred Spraul~\cite{ManfredSpraul2008StateMachineRCU}.
 \label{fig:formal:Variables for Simple Dynticks Interface}
 \end{figure}

+\noindent
 Figure~\ref{fig:formal:Variables for Simple Dynticks Interface}
 shows the new per-CPU state variables.
 These variables are grouped into structs to allow multiple independent
@@ -1977,6 +1980,7 @@ passed through a quiescent state during that interval.
 \label{fig:formal:Entering and Exiting Dynticks-Idle Mode}
 \end{figure}

+\noindent
 Figure~\ref{fig:formal:Entering and Exiting Dynticks-Idle Mode}
 shows the \co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
 which enter and exit dynticks-idle mode, also known as ``nohz'' mode.
@@ -2034,6 +2038,7 @@ the opposite \co{dynticks} polarity.
 \label{fig:formal:NMIs From Dynticks-Idle Mode}
 \end{figure}

+\noindent
 Figure~\ref{fig:formal:NMIs From Dynticks-Idle Mode}
 shows the \co{rcu_nmi_enter()} and \co{rcu_nmi_exit()} functions,
 which inform RCU of NMI entry and exit, respectively, from dynticks-idle
@@ -2089,6 +2094,7 @@ respectively.
 \label{fig:formal:Interrupts From Dynticks-Idle Mode}
 \end{figure}

+\noindent
 Figure~\ref{fig:formal:Interrupts From Dynticks-Idle Mode}
 shows \co{rcu_irq_enter()} and \co{rcu_irq_exit()}, which
 inform RCU of entry to and exit from, respectively, irq context.
@@ -2146,6 +2152,7 @@ a reschedule API if so.
 \label{fig:formal:Saving Dyntick Progress Counters}
 \end{figure}

+\noindent
 Figure~\ref{fig:formal:Saving Dyntick Progress Counters}
 shows \co{dyntick_save_progress_counter()}, which takes a snapshot
 of the specified CPU's \co{dynticks} and \co{dynticks_nmi}
diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index c5ec6ed..99c48f3 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -85,6 +85,7 @@ discusses the implications.
 \label{fig:sec:formal:PPCMEM Litmus Test}
 \end{figure}

+\noindent
 An example PowerPC litmus test for PPCMEM is shown in
 Figure~\ref{fig:sec:formal:PPCMEM Litmus Test}.
 The ARM interface works exactly the same way, but with ARM instructions
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index a5630f3..a7c9a7e 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -109,6 +109,7 @@ more complex uses.
 \label{fig:analysis:Promela Code for Non-Atomic Increment}
 \end{figure}

+\noindent
 Figure~\ref{fig:analysis:Promela Code for Non-Atomic Increment}
 demonstrates the textbook race condition
 resulting from non-atomic increment.
@@ -337,6 +338,7 @@ unreached in proctype :init:
 \label{fig:analysis:Atomic Increment spin Output}
 \end{figure}

+\noindent
 It is easy to fix this example by placing the body of the incrementer
 processes in an atomic blocks as shown in
 Figure~\ref{fig:analysis:Promela Code for Atomic Increment}.
@@ -632,6 +634,7 @@ Now we are ready for more complex examples.
 \label{fig:analysis:Promela Code for Spinlock}
 \end{figure}

+\noindent
 Since locks are generally useful, \co{spin_lock()} and
 \co{spin_unlock()}
 macros are provided in \path{lock.h}, which may be included from
diff --git a/future/cpu.tex b/future/cpu.tex
index 31cbc18..18a69f4 100644
--- a/future/cpu.tex
+++ b/future/cpu.tex
@@ -180,6 +180,7 @@ Servers seem to be choosing the former, while embedded systems on a chip
 \label{fig:future:Breakevens vs. r, Worst-Case lambda, Four CPUs}
 \end{figure}

+\noindent
 And one more quote from 2004~\cite{PaulEdwardMcKenneyPhD}:

 \begin{quote}
diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 506f0b5..b50cb00 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -29,6 +29,7 @@
 \label{fig:locking:Per-Element Locking Without Existence Guarantees}
 \end{figure}

+\noindent
 A key challenge in parallel programming is to provide
 \emph{existence guarantees}~\cite{Gamsa99},
 so that attempts to access a given object can rely on that object
diff --git a/locking/locking.tex b/locking/locking.tex
index c5e45bf..8821629 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -531,6 +531,7 @@ this is unlikely.
 \label{fig:locking:Protocol Layering and Deadlock}
 \end{figure}

+\noindent
 But suppose that there is no reasonable locking hierarchy.
 This can happen in real life, for example, in layered network protocol stacks
 where packets flow in both directions.
@@ -874,6 +875,7 @@ quite useful in many settings.
 \label{fig:locking:Abusing Conditional Locking}
 \end{figure}

+\noindent
 Although conditional locking can be an effective deadlock-avoidance
 mechanism, it can be abused.
 Consider for example the beautifully symmetric example shown in
@@ -1649,6 +1651,7 @@ environments.
 \label{fig:locking:Sample Lock Based on Atomic Exchange}
 \end{figure}

+\noindent
 This section reviews the implementation shown in
 Figure~\ref{fig:locking:Sample Lock Based on Atomic Exchange}.
 The data structure for this lock is just an \co{int}, as shown on
diff --git a/rt/rt.tex b/rt/rt.tex
index 1fe1e7c..4d629a2 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -80,6 +80,7 @@ some measure of exactly how soft it is.
 \ContributedBy{Figure}{fig:rt:Hard Real-Time Response Guarantee, Meet Hammer}{Melissa Broussard}
 \end{figure}

+\noindent
 In contrast, the definition of hard real time is quite definite.
 After all, a given system either always meets its deadlines or it
 doesn't.
@@ -685,6 +686,7 @@ the next section.
 \label{fig:rt:Linux Ported to RTOS}
 \end{figure}

+\noindent
 There are a number of strategies that may be used to implement a
 real-time system.
 One approach is to port a general-purpose non-real-time OS on top
@@ -1882,6 +1884,7 @@ data-structure access to real-time programs.
 \ContributedBy{Figure}{fig:rt:The Dark Side of Real-Fast Computing}{Sarah McKenney}
 \end{figure}

+\noindent
 The choice between real-time and real-fast computing can be a difficult one.
 Because real-time systems often inflict a throughput penalty on non-real-time
 computing, using real-time when it is not required can cause problems,
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 7309fe2..5cab8da 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -189,6 +189,7 @@ held constant, ensuring that \co{read_count()} sees consistent data.
 \label{fig:together:RCU and Per-Thread Statistical Counters}
 \end{figure}

+\noindent
 Lines~1-4 of
 Figure~\ref{fig:together:RCU and Per-Thread Statistical Counters}
 show the \co{countarray} structure, which contains a
@@ -306,6 +307,7 @@ Line~69 can then safely free the old \co{countarray} structure.
 	Figure~\ref{fig:together:RCU and Per-Thread Statistical Counters}!
 } \QuickQuizEnd

+\noindent
 Use of RCU enables exiting threads to wait until other threads are
 guaranteed to be done using the exiting threads' \co{__thread} variables.
 This allows the \co{read_count()} function to dispense with locking,
@@ -404,6 +406,7 @@ tradeoff.
 \label{fig:together:RCU-Protected Variable-Length Array}
 \end{figure}

+\noindent
 Suppose we have an RCU-protected variable-length array, as shown in
 Figure~\ref{fig:together:RCU-Protected Variable-Length Array}.
 The length of the array \co{->a[]} can change dynamically, and at any
@@ -499,6 +502,7 @@ A more general version of this approach is presented in the next section.
 \label{fig:together:Uncorrelated Measurement Fields}
 \end{figure}

+\noindent
 Suppose that each of Sch\"odinger's animals is represented by the
 data element shown in
 Figure~\ref{fig:together:Uncorrelated Measurement Fields}.
-- 
1.9.1

