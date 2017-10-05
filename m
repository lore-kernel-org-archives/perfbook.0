Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:37569 "EHLO
 mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751526AbdJEP47 (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 5
 Oct 2017 11:56:59 -0400
Received: by mail-pg0-f65.google.com with SMTP id o1so14744421pga.4 for
 <perfbook@vger.kernel.org>; Thu, 05 Oct 2017 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JgL4VYzuupOIEqWcU9CJJu2RfOomsBMgibHKC0QS5e8=;
 b=TnveDQByU8gx7kpUHAxS/lN7pYFSMfXk5ym/IQCcnC/ZZV6UloQ+VnlbV39NUb31qF
 9+xKXcHnlM0WUxG2O0387WUt0mzKHEnNIHxpt1r7QFGytXTm2t3q7C22YUM3K4diA7Ov
 xB4mK3WsIKB2VIKrJczfARuSgOnnEQOgGynwig4h+qr0EinEvwwJjilUpxVTlufu6/hl
 653cs82lHZFunqI0iDHhygl/+ZD+kxZyG0sLEfH8StWPIu3FJpoHi5AWvfpRgFRdXKaE
 QGJLK5MMHL+ye81W/3AbqwB6JLK/esSr3nKxtAgIp0+sEQXUYhMgMEvm5JtVPG0/sfcH
 BEKg==
Subject: [PATCH 08/10] treewide: Use "IRQ" instead of "irq" used as
 abbreviation
References: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <56f5a0db-9a9a-44c4-2265-9a5b285c2fde@gmail.com>
Date: Fri, 6 Oct 2017 00:56:55 +0900
MIME-Version: 1.0
In-Reply-To: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 07346d744227b79263c044034a03fc56c032dd0b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 1 Oct 2017 18:44:13 +0900
Subject: [PATCH 08/10] treewide: Use "IRQ" instead of "irq" used as abbreviation

"IRQ" is defined as a macro "\IRQ" in preamble for ease of customization.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex      |  6 +++---
 formal/dyntickrcu.tex | 50 +++++++++++++++++++++++++-------------------------
 perfbook.tex          |  2 ++
 rt/rt.tex             | 14 +++++++-------
 4 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 158ebff..d60a0dd 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -93,7 +93,7 @@ Read side overhead &
     Preempt disable/enable (free on non-\tco{PREEMPT}) &
 	BH disable/enable &
 	    Preempt disable/enable (free on non-\tco{PREEMPT}) &
-	        Simple instructions, irq disable/enable &
+	        Simple instructions, \IRQ\ disable/enable &
 		    Simple instructions, preempt disable/enable, memory barriers \\
 \hline
 Asynchronous update-side overhead &
@@ -420,12 +420,12 @@ and also by their scope, as follows:
 	(\co{softirq}) handlers.
 	RCU BH is global in scope.
 \item	RCU Sched: read-side critical sections must guarantee forward
-	progress against everything except for NMI and irq handlers,
+	progress against everything except for NMI and \IRQ\ handlers,
 	including \co{softirq} handlers.
 	RCU Sched is global in scope.
 \item	RCU (both classic and real-time): read-side critical sections
 	must guarantee forward progress against everything except for
-	NMI handlers, irq handlers, \co{softirq} handlers, and (in the
+	NMI handlers, \IRQ\ handlers, \co{softirq} handlers, and (in the
 	real-time case) higher-priority real-time tasks.
 	RCU is global in scope.
 \item	SRCU: read-side critical sections need not guarantee
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index ec3c78c..2ae41ae 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1829,7 +1829,7 @@ This effort provided some lessons (re)learned:
 	is buggy.
 \item	{\bf Use of atomic instructions can simplify verification.}
 	Unfortunately, use of the \co{cmpxchg} atomic instruction
-	would also slow down the critical irq fastpath, so they
+	would also slow down the critical \IRQ\ fastpath, so they
 	are not appropriate in this case.
 \item	{\bf The need for complex formal verification often indicates
 	a need to re-think your design.}
@@ -1842,10 +1842,10 @@ the dynticks problem, which is presented in the next section.
 \label{sec:formal:Simplicity Avoids Formal Verification}

 The complexity of the dynticks interface for preemptible RCU is primarily
-due to the fact that both irqs and NMIs use the same code path and the
+due to the fact that both \IRQ s and NMIs use the same code path and the
 same state variables.
 This leads to the notion of providing separate code paths and variables
-for irqs and NMIs, as has been done for
+for \IRQ s and NMIs, as has been done for
 hierarchical RCU~\cite{PaulEMcKenney2008HierarchicalRCU}
 as indirectly suggested by
 Manfred Spraul~\cite{ManfredSpraul2008StateMachineRCU}.
@@ -1884,7 +1884,7 @@ and efficiently share dynticks state.
 In what follows, they can be thought of as independent per-CPU variables.

 The \co{dynticks_nesting}, \co{dynticks}, and \co{dynticks_snap} variables
-are for the irq code paths, and the \co{dynticks_nmi} and
+are for the \IRQ\ code paths, and the \co{dynticks_nmi} and
 \co{dynticks_nmi_snap} variables are for the NMI code paths, although
 the NMI code path will also reference (but not modify) the
 \co{dynticks_nesting} variable.
@@ -1895,18 +1895,18 @@ These variables are used as follows:
 	This counts the number of reasons that the corresponding
 	CPU should be monitored for RCU read-side critical sections.
 	If the CPU is in dynticks-idle mode, then this counts the
-	irq nesting level, otherwise it is one greater than the
-	irq nesting level.
+	\IRQ\ nesting level, otherwise it is one greater than the
+	\IRQ\ nesting level.
 \item	[\tco{dynticks}]
 	This counter's value is even if the corresponding CPU is
-	in dynticks-idle mode and there are no irq handlers currently
+	in dynticks-idle mode and there are no \IRQ\ handlers currently
 	running on that CPU, otherwise the counter's value is odd.
 	In other words, if this counter's value is odd, then the
 	corresponding CPU might be in an RCU read-side critical section.
 \item	[\tco{dynticks_nmi}]
 	This counter's value is odd if the corresponding CPU is
 	in an NMI handler, but only if the NMI arrived while this
-	CPU was in dyntick-idle mode with no irq handlers running.
+	CPU was in dyntick-idle mode with no \IRQ\ handlers running.
 	Otherwise, the counter's value will be even.
 \item	[\tco{dynticks_snap}]
 	This will be a snapshot of the \co{dynticks} counter, but
@@ -1924,11 +1924,11 @@ passed through a quiescent state during that interval.

 \QuickQuiz{}
 	But what happens if an NMI handler starts running before
-	an irq handler completes, and if that NMI handler continues
-	running until a second irq handler starts?
+	an \IRQ\ handler completes, and if that NMI handler continues
+	running until a second \IRQ\ handler starts?
 \QuickQuizAnswer{
 	This cannot happen within the confines of a single CPU.
-	The first irq handler cannot complete until the NMI handler
+	The first \IRQ\ handler cannot complete until the NMI handler
 	returns.
 	Therefore, if each of the \co{dynticks} and \co{dynticks_nmi}
 	variables have taken on an even value during a given time
@@ -1985,7 +1985,7 @@ These two functions are invoked from process context.
 Line~6 ensures that any prior memory accesses (which might
 include accesses from RCU read-side critical sections) are seen
 by other CPUs before those marking entry to dynticks-idle mode.
-Lines~7 and~12 disable and reenable irqs.
+Lines~7 and~12 disable and reenable \IRQ s.
 Line~8 acquires a pointer to the current CPU's \co{rcu_dynticks}
 structure, and
 line~9 increments the current CPU's \co{dynticks} counter, which
@@ -2038,7 +2038,7 @@ Figure~\ref{fig:formal:NMIs From Dynticks-Idle Mode}
 shows the \co{rcu_nmi_enter()} and \co{rcu_nmi_exit()} functions,
 which inform RCU of NMI entry and exit, respectively, from dynticks-idle
 mode.
-However, if the NMI arrives during an irq handler, then RCU will already
+However, if the NMI arrives during an \IRQ\ handler, then RCU will already
 be on the lookout for RCU read-side critical sections from this CPU,
 so lines~6 and~7 of \co{rcu_nmi_enter()} and lines~18 and~19
 of \co{rcu_nmi_exit()} silently return if \co{dynticks} is odd.
@@ -2091,7 +2091,7 @@ respectively.

 Figure~\ref{fig:formal:Interrupts From Dynticks-Idle Mode}
 shows \co{rcu_irq_enter()} and \co{rcu_irq_exit()}, which
-inform RCU of entry to and exit from, respectively, irq context.
+inform RCU of entry to and exit from, respectively, \IRQ\ context.
 Line~6 of \co{rcu_irq_enter()} increments \co{dynticks_nesting},
 and if this variable was already non-zero, line~7 silently returns.
 Otherwise, line~8 increments \co{dynticks}, which will then have
@@ -2099,18 +2099,18 @@ an odd value, consistent with the fact that this CPU can now
 execute RCU read-side critical sections.
 Line~10 therefore executes a memory barrier to ensure that
 the increment of \co{dynticks} is seen before any
-RCU read-side critical sections that the subsequent irq handler
+RCU read-side critical sections that the subsequent \IRQ\ handler
 might execute.

 Line~18 of \co{rcu_irq_exit()} decrements \co{dynticks_nesting}, and
 if the result is non-zero, line~19 silently returns.
 Otherwise, line~20 executes a memory barrier to ensure that the
 increment of \co{dynticks} on line~21 is seen after any RCU
-read-side critical sections that the prior irq handler might have executed.
+read-side critical sections that the prior \IRQ\ handler might have executed.
 Line~22 verifies that \co{dynticks} is now even, consistent with
 the fact that no RCU read-side critical sections may appear in
 dynticks-idle mode.
-Lines~23-25 check to see if the prior irq handlers enqueued any
+Lines~23-25 check to see if the prior \IRQ\ handlers enqueued any
 RCU callbacks, forcing this CPU out of dynticks-idle mode via
 a reschedule API if so.

@@ -2159,7 +2159,7 @@ Figures~\ref{fig:formal:Entering and Exiting Dynticks-Idle Mode},
 Lines~11 and~12 record the snapshots for later calls to
 \co{rcu_implicit_dynticks_qs()},
 and lines~13 and~14 check to see if the CPU is in dynticks-idle mode with
-neither irqs nor NMIs in progress (in other words, both snapshots
+neither \IRQ s nor NMIs in progress (in other words, both snapshots
 have even values), hence in an extended quiescent state.
 If so, lines~15 and~16 count this event, and line~17 returns
 true if the CPU was in a quiescent state.
@@ -2225,15 +2225,15 @@ waiting for a CPU that is offline.
 	This is still pretty complicated.
 	Why not just have a \co{cpumask_t} that has a bit set for
 	each CPU that is in dyntick-idle mode, clearing the bit
-	when entering an irq or NMI handler, and setting it upon
+	when entering an \IRQ\ or NMI handler, and setting it upon
 	exit?
 \QuickQuizAnswer{
 	Although this approach would be functionally correct, it
-	would result in excessive irq entry/exit overhead on
+	would result in excessive \IRQ\ entry/exit overhead on
 	large machines.
 	In contrast, the approach laid out in this section allows
-	each CPU to touch only per-CPU data on irq and NMI entry/exit,
-	resulting in much lower irq entry/exit overhead, especially
+	each CPU to touch only per-CPU data on \IRQ\ and NMI entry/exit,
+	resulting in much lower \IRQ\ entry/exit overhead, especially
 	on large machines.
 } \QuickQuizEnd

@@ -2243,9 +2243,9 @@ waiting for a CPU that is offline.
 A slight shift in viewpoint resulted in a substantial simplification
 of the dynticks interface for RCU.
 The key change leading to this simplification was minimizing of
-sharing between irq and NMI contexts.
+sharing between \IRQ\ and NMI contexts.
 The only sharing in this simplified interface is references from NMI
-context to irq variables (the \co{dynticks} variable).
+context to \IRQ\ variables (the \co{dynticks} variable).
 This type of sharing is benign, because the NMI functions never update
 this variable, so that its value remains constant through the lifetime
 of the NMI handler.
@@ -2254,6 +2254,6 @@ understood one at a time, in happy contrast to the situation
 described in
 Section~\ref{sec:formal:Promela Parable: dynticks and Preemptible RCU},
 where an NMI might change shared state at any point during execution of
-the irq functions.
+the \IRQ\ functions.

 Verification can be a good thing, but simplicity is even better.
diff --git a/perfbook.tex b/perfbook.tex
index dc28079..906d71b 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -142,6 +142,8 @@
 \newcommand{\GNUC}{GNU~C}
 \newcommand{\GCC}{GCC}
 %\newcommand{\GCC}{\co{gcc}} % For those who prefer "gcc"
+\newcommand{\IRQ}{IRQ}
+%\newcommand{\IRQ}{irq}      % For those who prefer "irq"

 \newcommand{\Epigraph}[2]{\epigraphhead[65]{\rmfamily\epigraph{#1}{#2}}}

diff --git a/rt/rt.tex b/rt/rt.tex
index 21e7117..f1c0ae1 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -995,20 +995,20 @@ indefinitely, thus indefinitely degrading real-time latencies.

 One way of addressing this problem is the use of threaded interrupts shown in
 Figure~\ref{fig:rt:Threaded Interrupt Handler}.
-Interrupt handlers run in the context of a preemptible IRQ thread,
+Interrupt handlers run in the context of a preemptible \IRQ\ thread,
 which runs at a configurable priority.
 The device interrupt handler then runs for only a short time, just
-long enough to make the IRQ thread aware of the new event.
+long enough to make the \IRQ\ thread aware of the new event.
 As shown in the figure, threaded interrupts can greatly improve
 real-time latencies, in part because interrupt handlers running in
-the context of the IRQ thread may be preempted by high-priority real-time
+the context of the \IRQ\ thread may be preempted by high-priority real-time
 threads.

 However, there is no such thing as a free lunch, and there are downsides
 to threaded interrupts.
 One downside is increased interrupt latency.
 Instead of immediately running the interrupt handler, the handler's execution
-is deferred until the IRQ thread gets around to running it.
+is deferred until the \IRQ\ thread gets around to running it.
 Of course, this is not a problem unless the device generating the interrupt
 is on the real-time application's critical path.

@@ -1025,16 +1025,16 @@ which can be caused by, among other things, locks acquired by
 preemptible interrupt handlers~\cite{LuiSha1990PriorityInheritance}.
 Suppose that a low-priority thread holds a lock, but is preempted by
 a group of medium-priority threads, at least one such thread per CPU.
-If an interrupt occurs, a high-priority IRQ thread will preempt one
+If an interrupt occurs, a high-priority \IRQ\ thread will preempt one
 of the medium-priority threads, but only until it decides to acquire
 the lock held by the low-priority thread.
 Unfortunately, the low-priority thread cannot release the lock until
 it starts running, which the medium-priority threads prevent it from
 doing.
-So the high-priority IRQ thread cannot acquire the lock until after one
+So the high-priority \IRQ\ thread cannot acquire the lock until after one
 of the medium-priority threads releases its CPU.
 In short, the medium-priority threads are indirectly blocking the
-high-priority IRQ threads, a classic case of priority inversion.
+high-priority \IRQ\ threads, a classic case of priority inversion.

 Note that this priority inversion could not happen with non-threaded
 interrupts because the low-priority thread would have to disable interrupts
-- 
2.7.4


