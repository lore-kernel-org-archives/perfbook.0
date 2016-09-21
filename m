Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KDHuXD9clhASuUhgeecySPe5T1hZ/WlvhLdwj3YAJQM=;
 b=RpSUBE3uhxva1YDOCVoacW9xQIHIZbEIVUL4cy4bqQx40ZexfTJb4k06P1a4A6A0V1
 3ZxM47VDCalSgtNSfRmvYO5mUVAxbLQSN4jIe+jokKQnZqijBFeG5N7erKD/IocR+U5H
 pl4W11T2aSkPHJHB70Jx8KqxHOwsCMlz6BsOstff9kgBEVIwa4sxo8/WNkyVEul6+2XS
 7LpK5Z5vTjNJROdOIIRNA+Wx3Pej6+8GzgQM/7p991m4Xqb2glXt0VzqHq3N3AVbfojk
 lsB2L/rzl7bm0q9RQABygwYsJfM8dQbWWp53LyZ4IiuJT9b/ADn6/9UIwMT2tqv15FTy
 iH7g==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 07/17] formal/dyntickrcu: Add missing NBSPs
Date: Wed, 21 Sep 2016 11:44:38 +0900
Message-Id: <20160921024448.24744-8-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit adds missed non-breakable spaces for line numbers.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 64 +++++++++++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 4d27d6c..3aa79f9 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -209,7 +209,7 @@ shown below:
 \end{verbatim}
 }

-Line~3 fetches the current CPU's number, while lines~5 and 6
+Line~3 fetches the current CPU's number, while lines~5 and~6
 increment the \co{rcu_update_flag} nesting counter if it
 is already non-zero.
 Lines~7-9 check to see whether we are the outermost level of
@@ -282,13 +282,13 @@ Line~3 fetches the current CPU's number, as before.
 Line~5 checks to see if the \co{rcu_update_flag} is
 non-zero, returning immediately (via falling off the end of the
 function) if not.
-Otherwise, lines~6 through 12 come into play.
+Otherwise, lines~6 through~12 come into play.
 Line~6 decrements \co{rcu_update_flag}, returning
 if the result is not zero.
 Line~8 verifies that we are indeed leaving the outermost
 level of nested interrupts, line~9 executes a memory barrier,
 line~10 increments \co{dynticks_progress_counter},
-and lines~11 and 12 verify that this variable is now even.
+and lines~11 and~12 verify that this variable is now even.
 As with \co{rcu_enter_nohz()}, the memory barrier ensures that
 any other CPU that sees the increment of
 \co{dynticks_progress_counter}
@@ -362,15 +362,15 @@ The \co{rcu_try_flip_waitack_state()} state invokes
 \end{verbatim}
 }

-Lines~7 and 8 pick up current and snapshot versions of
+Lines~7 and~8 pick up current and snapshot versions of
 \co{dynticks_progress_counter}, respectively.
 The memory barrier on line~9 ensures that the counter checks
 in the later \co{rcu_try_flip_waitzero_state} follow
 the fetches of these counters.
-Lines~10 and 11 return zero (meaning no communication with the
+Lines~10 and~11 return zero (meaning no communication with the
 specified CPU is required) if that CPU has remained in dynticks-idle
 state since the time that the snapshot was taken.
-Similarly, lines~12 and 13 return zero if that CPU was initially
+Similarly, lines~12 and~13 return zero if that CPU was initially
 in dynticks-idle state or if it has completely passed through a
 dynticks-idle state.
 In both these cases, there is no way that that CPU could have retained
@@ -402,7 +402,7 @@ invokes \co{rcu_try_flip_waitmb_needed()}, shown below:
 }

 This is quite similar to \co{rcu_try_flip_waitack_needed},
-the difference being in lines~12 and 13, because any transition
+the difference being in lines~12 and~13, because any transition
 either to or from dynticks-idle state executes the memory barrier
 needed by the \co{rcu_try_flip_waitmb_state()} state.

@@ -463,17 +463,17 @@ a loop as follows:
 \end{verbatim}
 }

-Lines~6 and 20 define a loop.
+Lines~6 and~20 define a loop.
 Line~7 exits the loop once the loop counter \co{i}
 has exceeded the limit \co{MAX_DYNTICK_LOOP_NOHZ}.
 Line~8 tells the loop construct to execute lines~9-19
 for each pass through the loop.
-Because the conditionals on lines~7 and 8 are exclusive of
+Because the conditionals on lines~7 and~8 are exclusive of
 each other, the normal Promela random selection of true conditions
 is disabled.
-Lines~9 and 11 model \co{rcu_exit_nohz()}'s non-atomic
+Lines~9 and~11 model \co{rcu_exit_nohz()}'s non-atomic
 increment of \co{dynticks_progress_counter}, while
-line 12 models the \co{WARN_ON()}.
+line~12 models the \co{WARN_ON()}.
 The \co{atomic} construct simply reduces the Promela state space,
 given that the \co{WARN_ON()} is not strictly speaking part
 of the algorithm.
@@ -687,7 +687,7 @@ progresses through the grace-period phases, as shown below:
 \end{verbatim}
 }

-Lines~6, 10, 25, 26, 29, and 44 update this variable (combining
+Lines~6, 10, 25, 26, 29, and~44 update this variable (combining
 atomically with algorithmic operations where feasible) to
 allow the \co{dyntick_nohz()} process to verify the basic
 RCU safety property.
@@ -698,7 +698,7 @@ over which RCU readers could plausibly persist.

 \QuickQuiz{}
 	Given there are a pair of back-to-back changes to
-	\co{gp_state} on lines~25 and 26,
+	\co{gp_state} on lines~25 and~26,
 	how can we be sure that line~25's changes won't be lost?
 \QuickQuizAnswer{
 	Recall that Promela and spin trace out
@@ -747,7 +747,7 @@ this verification as shown below:
 Line~13 sets a new \co{old_gp_idle} flag if the
 value of the \co{gp_state} variable is
 \co{GP_IDLE} at the beginning of task execution,
-and the assertion at lines~18 and 19 fire if the \co{gp_state}
+and the assertion at lines~18 and~19 fire if the \co{gp_state}
 variable has advanced to \co{GP_DONE} during task execution,
 which would be illegal given that a single RCU read-side critical
 section could span the entire intervening time period.
@@ -877,7 +877,7 @@ any more state changes to force us out of the loop, so going through twice
 in this state means an infinite loop, which in turn means no end to the
 grace period.

-Lines~32, 39, and 40 operate in a similar manner for the
+Lines~32, 39, and~40 operate in a similar manner for the
 second (memory-barrier) loop.

 However, running this
@@ -1216,7 +1216,7 @@ to model an interrupt handler:
 }

 The loop from lines~7-48 models up to \co{MAX_DYNTICK_LOOP_IRQ}
-interrupts, with lines~8 and 9 forming the loop condition and line~45
+interrupts, with lines~8 and~9 forming the loop condition and line~45
 incrementing the control variable.
 Line~10 tells \co{dyntick_nohz()} that an interrupt handler
 is running, and line~45 tells \co{dyntick_nohz()} that this
@@ -1225,7 +1225,7 @@ Line~49 is used for liveness verification, just like the corresponding
 line of \co{dyntick_nohz()}.

 \QuickQuiz{}
-	Why are lines~45 and 46 (the \co{in_dyntick_irq = 0;}
+	Why are lines~45 and~46 (the \co{in_dyntick_irq = 0;}
 	and the \co{i++;}) executed atomically?
 \QuickQuizAnswer{
 	These lines of code pertain to controlling the
@@ -1236,10 +1236,10 @@ line of \co{dyntick_nohz()}.
 } \QuickQuizEnd

 Lines~11-25 model \co{rcu_irq_enter()}, and
-lines~26 and 27 model the relevant snippet of \co{__irq_enter()}.
-Lines~28 and 29 verifies safety in much the same manner as do the
+lines~26 and~27 model the relevant snippet of \co{__irq_enter()}.
+Lines~28 and~29 verifies safety in much the same manner as do the
 corresponding lines of \co{dynticks_nohz()}.
-Lines~30 and 31 model the relevant snippet of \co{__irq_exit()},
+Lines~30 and~31 model the relevant snippet of \co{__irq_exit()},
 and finally lines~32-43 model \co{rcu_irq_exit()}.

 \QuickQuiz{}
@@ -1309,9 +1309,9 @@ The \co{grace_period} process then becomes as follows:
 The implementation of \co{grace_period()} is very similar
 to the earlier one.
 The only changes are the addition of line~10 to add the new
-interrupt-count parameter, changes to lines~19 and 39 to
+interrupt-count parameter, changes to lines~19 and~39 to
 add the new \co{dyntick_irq_done} variable to the liveness
-checks, and of course the optimizations on lines~22 and 42.
+checks, and of course the optimizations on lines~22 and~42.

 This model (\path{dyntickRCU-irqnn-ssl.spin})
 results in a correct verification with roughly half a million
@@ -1409,7 +1409,7 @@ counts exits.
 The \co{outermost} variable on line~7 helps determine
 when the \co{gp_state} variable needs to be sampled
 for the safety checks.
-The loop-exit check on lines~10 and 11 is updated to require that the
+The loop-exit check on lines~10 and~11 is updated to require that the
 specified number of interrupt handlers are exited as well as entered,
 and the increment of \co{i} is moved to line~41, which is
 the end of the interrupt-entry model.
@@ -1719,7 +1719,7 @@ Finally, \co{grace_period()} requires only a few changes:
 We have added the \co{printf()} for the new
 \co{MAX_DYNTICK_LOOP_NMI} parameter on line~11 and
 added \co{dyntick_nmi_done} to the \co{shouldexit}
-assignments on lines~22 and 44.
+assignments on lines~22 and~44.

 The model (\path{dyntickRCU-irq-nmi-ssl.spin})
 results in a correct verification with several hundred million
@@ -1985,7 +1985,7 @@ These two functions are invoked from process context.
 Line~6 ensures that any prior memory accesses (which might
 include accesses from RCU read-side critical sections) are seen
 by other CPUs before those marking entry to dynticks-idle mode.
-Lines~7 and 12 disable and reenable irqs.
+Lines~7 and~12 disable and reenable irqs.
 Line~8 acquires a pointer to the current CPU's \co{rcu_dynticks}
 structure, and
 line~9 increments the current CPU's \co{dynticks} counter, which
@@ -2040,13 +2040,13 @@ which inform RCU of NMI entry and exit, respectively, from dynticks-idle
 mode.
 However, if the NMI arrives during an irq handler, then RCU will already
 be on the lookout for RCU read-side critical sections from this CPU,
-so lines~6 and 7 of \co{rcu_nmi_enter} and lines~18 and 19
+so lines~6 and~7 of \co{rcu_nmi_enter} and lines~18 and~19
 of \co{rcu_nmi_exit} silently return if \co{dynticks} is odd.
 Otherwise, the two functions increment \co{dynticks_nmi}, with
 \co{rcu_nmi_enter()} leaving it with an odd value and \co{rcu_nmi_exit()}
 leaving it with an even value.
 Both functions execute memory barriers between this increment
-and possible RCU read-side critical sections on lines~11 and 21,
+and possible RCU read-side critical sections on lines~11 and~21,
 respectively.

 \subsubsection{Interrupts From Dynticks-Idle Mode}
@@ -2150,18 +2150,18 @@ Figure~\ref{fig:formal:Saving Dyntick Progress Counters}
 shows \co{dyntick_save_progress_counter()}, which takes a snapshot
 of the specified CPU's \co{dynticks} and \co{dynticks_nmi}
 counters.
-Lines~8 and 9 snapshot these two variables to locals, line~10
+Lines~8 and~9 snapshot these two variables to locals, line~10
 executes a memory barrier to pair with the memory barriers in
 the functions in
 Figures~\ref{fig:formal:Entering and Exiting Dynticks-Idle Mode},
 \ref{fig:formal:NMIs From Dynticks-Idle Mode}, and
 \ref{fig:formal:Interrupts From Dynticks-Idle Mode}.
-Lines~11 and 12 record the snapshots for later calls to
+Lines~11 and~12 record the snapshots for later calls to
 \co{rcu_implicit_dynticks_qs},
 and lines~13 and~14 check to see if the CPU is in dynticks-idle mode with
 neither irqs nor NMIs in progress (in other words, both snapshots
 have even values), hence in an extended quiescent state.
-If so, lines~15 and 16 count this event, and line~17 returns
+If so, lines~15 and~16 count this event, and line~17 returns
 true if the CPU was in a quiescent state.

 \begin{figure}[tbp]
@@ -2200,8 +2200,8 @@ Figure~\ref{fig:formal:Checking Dyntick Progress Counters}
 shows \co{dyntick_save_progress_counter}, which is called to check
 whether a CPU has entered dyntick-idle mode subsequent to a call
 to \co{dynticks_save_progress_counter()}.
-Lines~9 and 11 take new snapshots of the corresponding CPU's
-\co{dynticks} and \co{dynticks_nmi} variables, while lines~10 and 12
+Lines~9 and~11 take new snapshots of the corresponding CPU's
+\co{dynticks} and \co{dynticks_nmi} variables, while lines~10 and~12
 retrieve the snapshots saved earlier by
 \co{dynticks_save_progress_counter()}.
 Line~13 then
-- 
2.10.0

