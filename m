Return-Path: <SRS0=rne+=X7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nHQxkq1jcobHWzhnh9Te1YgC85zW3l3c2fqvQhSxiRk=;
        b=OGvAJvwuSsUCp9lYhndRBkfTPm4iSm40CDKmDxIR4mHMxnQpFDzB3pI1CgCQyFknKU
         XGs4eLMqBcZKlX9aQ+CtPCfCUOPAO6FnnDO9BWt0MQmakUOHOy08wFPaUhyzpuhEb+2N
         dLzsVaKSNdcrjxQxxu5eryAS1Wbsi/sAr0aJVhTi34yFT9ahu1HLTlClfmxhrZtELJ7y
         O6jDCKfWVb2dLH7n9IrbLGZolnxtKFHuwALAysWy6ibzkXEKCV3lLm6DqZ9hB9u/wZld
         cthPjWvD0NoUm41m+HBIUrXPyBmPT3KfYHWu+fnV/6/gxTq7aEvkYznMQltuWgcBHr+9
         j2pg==
Subject: [PATCH 1/3] dyntickrcu: Apply 'cleveref' way of cross reference
References: <dd51b8e0-71b8-0214-a6a7-d48988462f52@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <85ec9a90-1abf-0ac3-a5b9-d7a9a009affb@gmail.com>
Date: Mon, 7 Oct 2019 00:19:58 +0900
MIME-Version: 1.0
In-Reply-To: <dd51b8e0-71b8-0214-a6a7-d48988462f52@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dd4e9bca30a58e14ab8babcdc149e6c9c49e6cbf Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 28 Sep 2019 16:24:59 +0900
Subject: [PATCH 1/3] dyntickrcu: Apply 'cleveref' way of cross reference

Also use \clnref, \clnrefrange, and their upper-case variants for
cross-referencing line labels.

Note: There remains a few \lnref{}s, which can't be expressed
by the available macros as of this change. I.e.:

    "Lines 6 through 12"

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/dyntickrcu.tex | 291 +++++++++++++++++++-----------------------
 1 file changed, 132 insertions(+), 159 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index a7dd2d74..7b7c3909 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -75,7 +75,7 @@ More important, Promela and Spin did find a very subtle bug for me!
 	\begin{enumerate}
 	\item	Try compiler flags \co{-DCOLLAPSE} and \co{-DMA=N}
 		to reduce memory consumption.
-		See Section~\ref{sec:formal:Running the QRCU Example}.
+		See \cref{sec:formal:Running the QRCU Example}.
 	\item	Further optimize the model, reducing its memory consumption.
 	\item	Work out a pencil-and-paper proof, perhaps starting with the
 		comments in the code in the Linux kernel.
@@ -98,10 +98,11 @@ that has a smaller state space.
 Even better would be an algorithm so simple that its correctness was
 obvious to the casual observer!
 
-Sections~\ref{sec:formal:Introduction to Preemptible RCU and dynticks}-\ref{sec:formal:Grace-Period Interface}
+\Crefrange{sec:formal:Introduction to Preemptible RCU and dynticks}
+{sec:formal:Grace-Period Interface}
 give an overview of preemptible RCU's dynticks interface,
 followed by
-Section~\ref{sec:formal:Validating Preemptible RCU and dynticks}'s
+\cref{sec:formal:Validating Preemptible RCU and dynticks}'s
 discussion of the validation of the interface.
 
 \subsubsection{Introduction to Preemptible RCU and dynticks}
@@ -214,16 +215,15 @@ void rcu_irq_enter(void)
 \end{linelabel}
 
 \begin{lineref}[ln:formal:dyntickrcu:rcu_irq_enter]
-Line~\lnref{fetch} fetches the current CPU's number, while
-lines~\lnref{inc:b} and~\lnref{inc:e}
+\Clnref{fetch} fetches the current CPU's number, while \clnref{inc:b,inc:e}
 increment the \co{rcu_update_flag} nesting counter if it
 is already non-zero.
-Lines~\lnref{chk_lv:b}-\lnref{chk_lv:e} check to see whether we are
+\Clnrefrange{chk_lv:b}{chk_lv:e} check to see whether we are
 the outermost level of
 interrupt, and, if so, whether \co{dynticks_progress_counter}
 needs to be incremented.
-If so, line~\lnref{inc_cnt} increments \co{dynticks_progress_counter},
-line~\lnref{mb} executes a memory barrier, and line~\lnref{inc_flg} increments
+If so, \clnref{inc_cnt} increments \co{dynticks_progress_counter},
+\clnref{mb} executes a memory barrier, and \clnref{inc_flg} increments
 \co{rcu_update_flag}.
 As with \co{rcu_exit_nohz()}, the memory barrier ensures that
 any other CPU that sees the effects of an RCU read-side critical section
@@ -255,7 +255,7 @@ invocation) will also see the increment of
 
 \QuickQuiz{}
 	\begin{lineref}[ln:formal:dyntickrcu:rcu_irq_enter]
-	But if line~\lnref{chk_lv:b} finds that we are the outermost interrupt,
+	But if \clnref{chk_lv:b} finds that we are the outermost interrupt,
 	wouldn't we \emph{always} need to increment
 	\co{dynticks_progress_counter}?
 	\end{lineref}
@@ -289,17 +289,17 @@ void rcu_irq_exit(void)
 \end{linelabel}
 
 \begin{lineref}[ln:formal:dyntickrcu:rcu_irq_exit]
-Line~\lnref{fetch} fetches the current CPU's number, as before.
-Line~\lnref{chk_flg} checks to see if the \co{rcu_update_flag} is
+\Clnref{fetch} fetches the current CPU's number, as before.
+\Clnref{chk_flg} checks to see if the \co{rcu_update_flag} is
 non-zero, returning immediately (via falling off the end of the
 function) if not.
 Otherwise, lines~\lnref{dec_flg} through~\lnref{vrf_even:e} come into play.
-Line~\lnref{dec_flg} decrements \co{rcu_update_flag}, returning
+\Clnref{dec_flg} decrements \co{rcu_update_flag}, returning
 if the result is not zero.
-Line~\lnref{verify} verifies that we are indeed leaving the outermost
-level of nested interrupts, line~\lnref{mb} executes a memory barrier,
-line~\lnref{inc_cnt} increments \co{dynticks_progress_counter},
-and lines~\lnref{vrf_even:b} and~\lnref{vrf_even:e} verify that this
+\Clnref{verify} verifies that we are indeed leaving the outermost
+level of nested interrupts, \clnref{mb} executes a memory barrier,
+\clnref{inc_cnt} increments \co{dynticks_progress_counter},
+and \clnref{vrf_even:b,vrf_even:e} verify that this
 variable is now even.
 As with \co{rcu_enter_nohz()}, the memory barrier ensures that
 any other CPU that sees the increment of
@@ -327,7 +327,7 @@ preemptible RCU's grace-period machinery.
 \end{figure}
 
 Of the four preemptible RCU grace-period states shown in
-Figure~\ref{fig:formal:Preemptible RCU State Machine},
+\cref{fig:formal:Preemptible RCU State Machine},
 only the \co{rcu_try_flip_waitack_state}
 and \co{rcu_try_flip_waitmb_state} states need to wait
 for other CPUs to respond.
@@ -374,22 +374,22 @@ rcu_try_flip_waitack_needed(int cpu)
 \end{linelabel}
 
 \begin{lineref}[ln:formal:dyntickrcu:rcu_try_flip_waitack_needed]
-Lines~\lnref{curr} and~\lnref{snap} pick up current and snapshot versions of
+\Clnref{curr,snap} pick up current and snapshot versions of
 \co{dynticks_progress_counter}, respectively.
-The memory barrier on line~\lnref{mb} ensures that the counter checks
+The memory barrier on \clnref{mb} ensures that the counter checks
 in the later \co{rcu_try_flip_waitzero_state} follow
 the fetches of these counters.
-Lines~\lnref{chk_remain} and~\lnref{ret_0_r} return zero
+\Clnref{chk_remain,ret_0_r} return zero
 (meaning no communication with the
 specified CPU is required) if that CPU has remained in dynticks-idle
 state since the time that the snapshot was taken.
-Similarly, lines~\lnref{chk_idle} and~\lnref{ret_0_i} return zero
+Similarly, \clnref{chk_idle,ret_0_i} return zero
 if that CPU was initially
 in dynticks-idle state or if it has completely passed through a
 dynticks-idle state.
 In both these cases, there is no way that that CPU could have retained
 the old value of the grace-period counter.
-If neither of these conditions hold, line~\lnref{ret_1} returns one, meaning
+If neither of these conditions hold, \clnref{ret_1} returns one, meaning
 that the CPU needs to explicitly respond.
 \end{lineref}
 
@@ -418,8 +418,7 @@ rcu_try_flip_waitmb_needed(int cpu)
 
 \begin{lineref}[ln:formal:dyntickrcu:rcu_try_flip_waitmb_needed]
 This is quite similar to \co{rcu_try_flip_waitack_needed()},
-the difference being in lines~\lnref{chk_to_from} and~\lnref{ret_0},
-because any transition
+the difference being in \clnref{chk_to_from,ret_0}, because any transition
 either to or from dynticks-idle state executes the memory barrier
 needed by the \co{rcu_try_flip_waitmb_state} state.
 \end{lineref}
@@ -440,13 +439,13 @@ code.
 
 This section develops a Promela model for the interface between
 dynticks and RCU step by step, with each of
-Sections~\ref{sec:formal:Basic Model}-\ref{sec:formal:Validating NMI Handlers}
+\crefrange{sec:formal:Basic Model}{sec:formal:Validating NMI Handlers}
 illustrating one step, starting with the process-level code,
 adding assertions, interrupts, and finally NMIs.
 
-Section~\ref{sec:formal:Lessons (Re)Learned} lists
+\Cref{sec:formal:Lessons (Re)Learned} lists
 lessons (re)learned during this effort, and
-Sections~\ref{sec:formal:Simplicity Avoids Formal Verification}-\ref{sec:formal:Discussion}
+\crefrange{sec:formal:Simplicity Avoids Formal Verification}{sec:formal:Discussion}
 present a simpler solution to RCU's dynticks problem.
 
 \subsubsection{Basic Model}
@@ -464,26 +463,26 @@ a loop as follows:
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base@dyntick_nohz.fcv}
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base:dyntick_nohz]
-Lines~\lnref{do} and~\lnref{od} define a loop.
-Line~\lnref{break} exits the loop once the loop counter \co{i}
+\Clnref{do,od} define a loop.
+\Clnref{break} exits the loop once the loop counter \co{i}
 has exceeded the limit \co{MAX_DYNTICK_LOOP_NOHZ}.
-Line~\lnref{kick_loop} tells the loop construct to execute
-lines~\lnref{ex_inc:b}-\lnref{inc_i}
+\Clnref{kick_loop} tells the loop construct to execute
+\clnrefrange{ex_inc:b}{inc_i}
 for each pass through the loop.
-Because the conditionals on lines~\lnref{break} and~\lnref{kick_loop}
+Because the conditionals on \clnref{break,kick_loop}
 are exclusive of
 each other, the normal Promela random selection of true conditions
 is disabled.
-Lines~\lnref{ex_inc:b} and~\lnref{ex_inc:e} model
+\Clnref{ex_inc:b,ex_inc:e} model
 \co{rcu_exit_nohz()}'s non-atomic
 increment of \co{dynticks_progress_counter}, while
-line~\lnref{ex_assert} models the \co{WARN_ON()}.
+\clnref{ex_assert} models the \co{WARN_ON()}.
 The \co{atomic} construct simply reduces the Promela state space,
 given that the \co{WARN_ON()} is not strictly speaking part
 of the algorithm.
-Lines~\lnref{ent_inc:b}-\lnref{ent_inc:e} similarly models the increment and
+\Clnrefrange{ent_inc:b}{ent_inc:e} similarly models the increment and
 \co{WARN_ON()} for \co{rcu_enter_nohz()}.
-Finally, line~\lnref{inc_i} increments the loop counter.
+Finally, \clnref{inc_i} increments the loop counter.
 \end{lineref}
 
 Each pass through the loop therefore models a CPU exiting
@@ -498,7 +497,7 @@ re-entering dynticks-idle mode (for example, that same task blocking).
 	it is not necessary to model memory barriers.
 	In fact, one must instead explicitly model lack of memory barriers,
 	for example, as shown in
-	Listing~\ref{lst:formal:QRCU Unordered Summation} on
+	\cref{lst:formal:QRCU Unordered Summation} on
 	page~\pageref{lst:formal:QRCU Unordered Summation}.
 } \QuickQuizEnd
 
@@ -527,7 +526,7 @@ through preemptible RCU's grace-period processing.
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base@grace_period.fcv}
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base:grace_period]
-Lines~\lnref{print:b}-\lnref{print:e} print out the loop limit
+\Clnrefrange{print:b}{print:e} print out the loop limit
 (but only into the .trail file
 in case of error) and models a line of code
 from \co{rcu_try_flip_idle()} and its call to
@@ -536,19 +535,19 @@ snapshot of the current CPU's \co{dynticks_progress_counter}
 variable.
 These two lines are executed atomically to reduce state space.
 
-Lines~\lnref{do1}-\lnref{od1} model the relevant code in
+\Clnrefrange{do1}{od1} model the relevant code in
 \co{rcu_try_flip_waitack()} and its call to
 \co{rcu_try_flip_waitack_needed()}.
 This loop is modeling the grace-period state machine waiting for
 a counter-flip acknowledgement from each CPU, but only that part
 that interacts with dynticks-idle CPUs.
 
-Line~\lnref{snap} models a line from \co{rcu_try_flip_waitzero()}
+\Clnref{snap} models a line from \co{rcu_try_flip_waitzero()}
 and its call to \co{dyntick_save_progress_counter()}, again
 taking a snapshot of the CPU's \co{dynticks_progress_counter}
 variable.
 
-Finally, lines~\lnref{do2}-\lnref{od2} model the relevant code in
+Finally, \clnrefrange{do2}{od2} model the relevant code in
 \co{rcu_try_flip_waitack()} and its call to
 \co{rcu_try_flip_waitack_needed()}.
 This loop is modeling the grace-period state-machine waiting for
@@ -599,8 +598,7 @@ progresses through the grace-period phases, as shown below:
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base-s@grace_period.fcv}
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base-s:grace_period]
-Lines~\lnref{upd_gps1}, \lnref{upd_gps2}, \lnref{upd_gps3},
-\lnref{upd_gps4}, \lnref{upd_gps5}, and~\lnref{upd_gps6}
+\Clnref{upd_gps1,upd_gps2,upd_gps3,upd_gps4,upd_gps5,upd_gps6}
 update this variable (combining
 atomically with algorithmic operations where feasible) to
 allow the \co{dyntick_nohz()} process to verify the basic
@@ -614,9 +612,8 @@ over which RCU readers could plausibly persist.
 \QuickQuiz{}
 	\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base-s:grace_period]
 	Given there are a pair of back-to-back changes to
-	\co{grace_period_state} on
-	lines~\lnref{upd_gps3} and~\lnref{upd_gps4},
-	how can we be sure that line~\lnref{upd_gps3}'s changes won't be lost?
+	\co{grace_period_state} on \clnref{upd_gps3,upd_gps4},
+	how can we be sure that \clnref{upd_gps3}'s changes won't be lost?
 	\end{lineref}
 \QuickQuizAnswer{
 	Recall that Promela and Spin trace out
@@ -633,10 +630,10 @@ this verification as shown below:
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base-s@dyntick_nohz.fcv}
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base-s:dyntick_nohz]
-Line~\lnref{new_flg} sets a new \co{old_gp_idle} flag if the
+\Clnref{new_flg} sets a new \co{old_gp_idle} flag if the
 value of the \co{grace_period_state} variable is
 \co{GP_IDLE} at the beginning of task execution,
-and the assertion at lines~\lnref{assert:b} and~\lnref{assert:e}
+and the assertion at \clnref{assert:b,assert:e}
 fire if the \co{grace_period_state}
 variable has advanced to \co{GP_DONE} during task execution,
 which would be illegal given that a single RCU read-side critical
@@ -659,7 +656,7 @@ Although liveness can be difficult to prove, there is a simple
 trick that applies here.
 The first step is to make \co{dyntick_nohz()} indicate that
 it is done via a \co{dyntick_nohz_done} variable, as shown on
-line~\lnref{done} of the following:
+\clnref{done} of the following:
 \end{lineref}
 
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base-sl-busted@dyntick_nohz.fcv}
@@ -671,10 +668,10 @@ as follows:
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-base-sl-busted@grace_period.fcv}
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-base-sl-busted:grace_period]
-We have added the \co{shouldexit} variable on line~\lnref{shex},
-which we initialize to zero on line~\lnref{init_shex}.
-Line~\lnref{assert_shex} asserts that \co{shouldexit} is not set, while
-line~\lnref{set_shex} sets \co{shouldexit} to the \co{dyntick_nohz_done}
+We have added the \co{shouldexit} variable on \clnref{shex},
+which we initialize to zero on \clnref{init_shex}.
+\Clnref{assert_shex} asserts that \co{shouldexit} is not set, while
+\clnref{set_shex} sets \co{shouldexit} to the \co{dyntick_nohz_done}
 variable maintained by \co{dyntick_nohz()}.
 This assertion will therefore trigger if we attempt to take more than
 one pass through the wait-for-counter-flip-acknowledgement
@@ -685,13 +682,12 @@ any more state changes to force us out of the loop, so going through twice
 in this state means an infinite loop, which in turn means no end to the
 grace period.
 
-Lines~\lnref{init_shex2}, \lnref{assert_shex2}, and~\lnref{set_shex2}
-operate in a similar manner for the
-second (memory-barrier) loop.
+\Clnref{init_shex2,assert_shex2,set_shex2} operate in a similar manner
+for the second (memory-barrier) loop.
 
 However, running this
 model (\path{dyntickRCU-base-sl-busted.spin})
-results in failure, as line~\lnref{chk_2} is checking that
+results in failure, as \clnref{chk_2} is checking that
 the wrong variable
 is even.
 Upon failure, \co{spin} writes out a
@@ -713,9 +709,9 @@ at step 34 (search for ``34:''), but that the
 \co{grace_period()} process nonetheless failed to exit the loop.
 The value of \co{curr} is \co{6} (see step 35)
 and that the value of \co{snap} is \co{5} (see step 17).
-Therefore the first condition on line~\lnref{chk_1} above
+Therefore the first condition on \clnref{chk_1} above
 does not hold because
-\qco{curr != snap}, and the second condition on line~\lnref{chk_2}
+\qco{curr != snap}, and the second condition on \clnref{chk_2}
 does not hold either because \co{snap} is odd and because
 \co{curr} is only one greater than \co{snap}.
 \end{lineref}
@@ -777,7 +773,7 @@ rcu_try_flip_waitack_needed(int cpu)
 \end{linelabel}
 
 \begin{lineref}[ln:formal:dyntickrcu:rcu_try_flip_waitack_needed_fixed]
-Lines~\lnref{if:b}-\lnref{if:e} can now be combined and simplified,
+\Clnrefrange{if:b}{if:e} can now be combined and simplified,
 resulting in the following.
 A similar simplification can be applied to
 \co{rcu_try_flip_waitmb_needed()}.
@@ -849,13 +845,13 @@ EXECUTE_MAINLINE(stmt1,
 \end{VerbatimU}
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:EXECUTE_MAINLINE]
-Line~\lnref{label} of the macro creates the specified statement label.
-Lines~\lnref{atm:b}-\lnref{atm:e} are an atomic block that tests
+\Clnref{label} of the macro creates the specified statement label.
+\Clnrefrange{atm:b}{atm:e} are an atomic block that tests
 the \co{in_dyntick_irq}
 variable, and if this variable is set (indicating that the interrupt
 handler is active), branches out of the atomic block back to the
 label.
-Otherwise, line~\lnref{else} executes the specified statement.
+Otherwise, \clnref{else} executes the specified statement.
 The overall effect is that mainline execution stalls any time an interrupt
 is active, as required.
 \end{lineref}
@@ -870,8 +866,7 @@ The first step is to convert \co{dyntick_nohz()} to
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_nohz]
 It is important to note that when a group of statements is passed
-to \co{EXECUTE_MAINLINE()}, as in
-lines~\lnref{stmt2:b}-\lnref{stmt2:e}, all
+to \co{EXECUTE_MAINLINE()}, as in \clnrefrange{stmt2:b}{stmt2:e}, all
 statements in that group execute atomically.
 \end{lineref}
 
@@ -927,23 +922,19 @@ to model an interrupt handler:
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-irqnn-ssl@dyntick_irq.fcv}
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_irq]
-The loop from lines~\lnref{do}-\lnref{od} models up to
-\co{MAX_DYNTICK_LOOP_IRQ}
-interrupts, with lines~\lnref{cond1} and~\lnref{cond2} forming
-the loop condition and line~\lnref{inc_i}
-incrementing the control variable.
-Line~\lnref{in_irq} tells \co{dyntick_nohz()} that an interrupt handler
-is running, and line~\lnref{clr_in_irq} tells \co{dyntick_nohz()} that this
+The loop from \clnrefrange{do}{od} models up to \co{MAX_DYNTICK_LOOP_IRQ}
+interrupts, with \clnref{cond1,cond2} forming the loop condition and
+\clnref{inc_i} incrementing the control variable.
+\Clnref{in_irq} tells \co{dyntick_nohz()} that an interrupt handler
+is running, and \clnref{clr_in_irq} tells \co{dyntick_nohz()} that this
 handler has completed.
-Line~\lnref{irq_done} is used for liveness verification,
-just like the corresponding
+\Clnref{irq_done} is used for liveness verification, just like the corresponding
 line of \co{dyntick_nohz()}.
 \end{lineref}
 
 \QuickQuiz{}
 	\begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_irq]
-	Why are lines~\lnref{clr_in_irq} and~\lnref{inc_i}
-	(the \qco{in_dyntick_irq = 0;}
+	Why are \clnref{clr_in_irq,inc_i} (the \qco{in_dyntick_irq = 0;}
 	and the \qco{i++;}) executed atomically?
 	\end{lineref}
 \QuickQuizAnswer{
@@ -955,15 +946,13 @@ line of \co{dyntick_nohz()}.
 } \QuickQuizEnd
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_irq]
-Lines~\lnref{enter:b}-\lnref{enter:e} model \co{rcu_irq_enter()}, and
-lines~\lnref{add_prmt_cnt:b} and~\lnref{add_prmt_cnt:e}
-model the relevant snippet of \co{__irq_enter()}.
-Lines~\lnref{vrf_safe:b}-\lnref{vrf_safe:e} verify
-safety in much the same manner as do the
-corresponding lines of \co{dynticks_nohz()}.
-Lines~\lnref{irq_exit:b} and~\lnref{irq_exit:e} model the relevant snippet
-of \co{__irq_exit()},
-and finally lines~\lnref{exit:b}-\lnref{exit:e} model \co{rcu_irq_exit()}.
+\Clnrefrange{enter:b}{enter:e} model \co{rcu_irq_enter()}, and
+\clnref{add_prmt_cnt:b,add_prmt_cnt:e} model the relevant snippet
+of \co{__irq_enter()}.
+\Clnrefrange{vrf_safe:b}{vrf_safe:e} verify safety in much the same manner
+as do the corresponding lines of \co{dynticks_nohz()}.
+\Clnref{irq_exit:b,irq_exit:e} model the relevant snippet of \co{__irq_exit()},
+and finally \clnrefrange{exit:b}{exit:e} model \co{rcu_irq_exit()}.
 \end{lineref}
 
 \QuickQuiz{}
@@ -981,12 +970,10 @@ The \co{grace_period()} process then becomes as follows:
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:grace_period]
 The implementation of \co{grace_period()} is very similar
 to the earlier one.
-The only changes are the addition of line~\lnref{MDLI} to add the new
+The only changes are the addition of \clnref{MDLI} to add the new
 interrupt-count parameter, changes to
-lines~\lnref{edit1} and~\lnref{edit3} to
-add the new \co{dyntick_irq_done} variable to the liveness
-checks, and of course the optimizations on
-lines~\lnref{edit2} and~\lnref{edit4}.
+\clnref{edit1,edit3} to add the new \co{dyntick_irq_done} variable
+to the liveness checks, and of course the optimizations on \clnref{edit2,edit4}.
 \end{lineref}
 
 This model (\path{dyntickRCU-irqnn-ssl.spin})
@@ -1006,34 +993,30 @@ the loop in \co{dyntick_irq()} as follows:
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irq-ssl:dyntick_irq]
 This is similar to the earlier \co{dynticks_irq()} process.
-It adds a second counter variable \co{j} on line~\lnref{j}, so that
+It adds a second counter variable \co{j} on \clnref{j}, so that
 \co{i} counts entries to interrupt handlers and \co{j}
 counts exits.
-The \co{outermost} variable on line~\lnref{om} helps determine
+The \co{outermost} variable on \clnref{om} helps determine
 when the \co{grace_period_state} variable needs to be sampled
 for the safety checks.
-The loop-exit check on lines~\lnref{chk_ex:b} and~\lnref{chk_ex:e}
-is updated to require that the
+The loop-exit check on \clnref{chk_ex:b,chk_ex:e} is updated to require that the
 specified number of interrupt handlers are exited as well as entered,
-and the increment of \co{i} is moved to line~\lnref{inc_i}, which is
+and the increment of \co{i} is moved to \clnref{inc_i}, which is
 the end of the interrupt-entry model.
-Lines~\lnref{atm1:b}-\lnref{atm1:e}
-set the \co{outermost} variable to indicate
+\Clnrefrange{atm1:b}{atm1:e} set the \co{outermost} variable to indicate
 whether this is the outermost of a set of nested interrupts and to
 set the \co{in_dyntick_irq} variable that is used by the
 \co{dyntick_nohz()} process.
-Lines~\lnref{atm2:b}-\lnref{atm2:e}
-capture the state of the \co{grace_period_state}
+\Clnrefrange{atm2:b}{atm2:e} capture the state of the \co{grace_period_state}
 variable, but only when in the outermost interrupt handler.
 
-Line~\lnref{cnd_ex} has the do-loop conditional for interrupt-exit modeling:
+\Clnref{cnd_ex} has the do-loop conditional for interrupt-exit modeling:
 as long as we have exited fewer interrupts than we have entered, it is
 legal to exit another interrupt.
-Lines~\lnref{atm3:b}-\lnref{atm3:e}
+\Clnrefrange{atm3:b}{atm3:e}
 check the safety criterion, but only if we are exiting
 from the outermost interrupt level.
-Finally, lines~\lnref{atm4:b}-\lnref{atm4:e}
-increment the interrupt-exit count \co{j}
+Finally, \clnrefrange{atm4:b}{atm4:e} increment the interrupt-exit count \co{j}
 and, if this is the outermost interrupt level, clears
 \co{in_dyntick_irq}.
 \end{lineref}
@@ -1075,9 +1058,9 @@ to \co{EXECUTE_IRQ()} as follows:
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irq-nmi-ssl:dyntick_irq]
 Note that we have open-coded the ``if'' statements
-(for example, lines~\lnref{stmt1:b}-\lnref{stmt1:e}).
+(for example, \clnrefrange{stmt1:b}{stmt1:e}).
 In addition, statements that process strictly local state
-(such as line~\lnref{inc_i}) need not exclude \co{dyntick_nmi()}.
+(such as \clnref{inc_i}) need not exclude \co{dyntick_nmi()}.
 \end{lineref}
 
 Finally, \co{grace_period()} requires only a few changes:
@@ -1086,9 +1069,9 @@ Finally, \co{grace_period()} requires only a few changes:
 
 \begin{lineref}[ln:formal:promela:dyntick:dyntickRCU-irq-nmi-ssl:grace_period]
 We have added the \co{printf()} for the new
-\co{MAX_DYNTICK_LOOP_NMI} parameter on line~\lnref{MDL_NMI} and
+\co{MAX_DYNTICK_LOOP_NMI} parameter on \clnref{MDL_NMI} and
 added \co{dyntick_nmi_done} to the \co{shouldexit}
-assignments on lines~\lnref{nmi_done1} and~\lnref{nmi_done2}.
+assignments on \clnref{nmi_done1,nmi_done2}.
 \end{lineref}
 
 The model (\path{dyntickRCU-irq-nmi-ssl.spin})
@@ -1229,7 +1212,7 @@ struct rcu_data {
 \label{lst:formal:Variables for Simple Dynticks Interface}
 \end{listing}
 
-Listing~\ref{lst:formal:Variables for Simple Dynticks Interface}
+\Cref{lst:formal:Variables for Simple Dynticks Interface}
 shows the new per-CPU state variables.
 These variables are grouped into structs to allow multiple independent
 RCU implementations (e.g., \co{rcu} and \co{rcu_bh}) to conveniently
@@ -1329,22 +1312,22 @@ void rcu_exit_nohz(void)
 \label{lst:formal:Entering and Exiting Dynticks-Idle Mode}
 \end{listing}
 
-Listing~\ref{lst:formal:Entering and Exiting Dynticks-Idle Mode}
+\Cref{lst:formal:Entering and Exiting Dynticks-Idle Mode}
 shows the \co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
 which enter and exit dynticks-idle mode, also known as ``nohz'' mode.
 These two functions are invoked from process context.
 
 \begin{lineref}[ln:formal:Entering and Exiting Dynticks-Idle Mode]
-Line~\lnref{mb} ensures that any prior memory accesses (which might
+\Clnref{mb} ensures that any prior memory accesses (which might
 include accesses from RCU read-side critical sections) are seen
 by other CPUs before those marking entry to dynticks-idle mode.
-Lines~\lnref{irq_sv} and~\lnref{irq_rs} disable and reenable \IRQ s.
-Line~\lnref{get_ptr} acquires a pointer to the current CPU's \co{rcu_dynticks}
+\Clnref{irq_sv,irq_rs} disable and reenable \IRQ s.
+\Clnref{get_ptr} acquires a pointer to the current CPU's \co{rcu_dynticks}
 structure, and
-line~\lnref{inc_cnt} increments the current CPU's \co{dynticks} counter, which
+\clnref{inc_cnt} increments the current CPU's \co{dynticks} counter, which
 should now be even, given that we are entering dynticks-idle mode
 in process context.
-Finally, line~\lnref{dec_nst} decrements \co{dynticks_nesting},
+Finally, \clnref{dec_nst} decrements \co{dynticks_nesting},
 which should now be zero.
 \end{lineref}
 
@@ -1389,21 +1372,19 @@ void rcu_nmi_exit(void)
 \end{listing}
 
 \begin{lineref}[ln:formal:NMIs From Dynticks-Idle Mode]
-Listing~\ref{lst:formal:NMIs From Dynticks-Idle Mode}
+\Cref{lst:formal:NMIs From Dynticks-Idle Mode}
 shows the \co{rcu_nmi_enter()} and \co{rcu_nmi_exit()} functions,
 which inform RCU of NMI entry and exit, respectively, from dynticks-idle
 mode.
 However, if the NMI arrives during an \IRQ\ handler, then RCU will already
 be on the lookout for RCU read-side critical sections from this CPU,
-so lines~\lnref{chk_ext1} and~\lnref{ret1} of \co{rcu_nmi_enter()}
-and lines~\lnref{chk_ext2} and~\lnref{ret2}
+so \clnref{chk_ext1,ret1} of \co{rcu_nmi_enter()} and \clnref{chk_ext2,ret2}
 of \co{rcu_nmi_exit()} silently return if \co{dynticks} is odd.
 Otherwise, the two functions increment \co{dynticks_nmi}, with
 \co{rcu_nmi_enter()} leaving it with an odd value and \co{rcu_nmi_exit()}
 leaving it with an even value.
 Both functions execute memory barriers between this increment
-and possible RCU read-side critical sections on
-lines~\lnref{mb1} and~\lnref{mb2},
+and possible RCU read-side critical sections on \clnref{mb1,mb2},
 respectively.
 \end{lineref}
 
@@ -1447,31 +1428,30 @@ void rcu_irq_exit(void)
 \end{listing}
 
 \begin{lineref}[ln:formal:Interrupts From Dynticks-Idle Mode]
-Listing~\ref{lst:formal:Interrupts From Dynticks-Idle Mode}
+\Cref{lst:formal:Interrupts From Dynticks-Idle Mode}
 shows \co{rcu_irq_enter()} and \co{rcu_irq_exit()}, which
 inform RCU of entry to and exit from, respectively, \IRQ\ context.
-Line~\lnref{inc_nst} of \co{rcu_irq_enter()}
-increments \co{dynticks_nesting},
-and if this variable was already non-zero, line~\lnref{ret1} silently returns.
-Otherwise, line~\lnref{inc_dynt1} increments \co{dynticks},
+\Clnref{inc_nst} of \co{rcu_irq_enter()} increments \co{dynticks_nesting},
+and if this variable was already non-zero, \clnref{ret1} silently returns.
+Otherwise, \clnref{inc_dynt1} increments \co{dynticks},
 which will then have
 an odd value, consistent with the fact that this CPU can now
 execute RCU read-side critical sections.
-Line~\lnref{mb1} therefore executes a memory barrier to ensure that
+\Clnref{mb1} therefore executes a memory barrier to ensure that
 the increment of \co{dynticks} is seen before any
 RCU read-side critical sections that the subsequent \IRQ\ handler
 might execute.
 
-Line~\lnref{dec_nst} of \co{rcu_irq_exit()} decrements
+\Clnref{dec_nst} of \co{rcu_irq_exit()} decrements
 \co{dynticks_nesting}, and
-if the result is non-zero, line~\lnref{ret2} silently returns.
-Otherwise, line~\lnref{mb2} executes a memory barrier to ensure that the
-increment of \co{dynticks} on line~\lnref{inc_dynt2} is seen after any RCU
+if the result is non-zero, \clnref{ret2} silently returns.
+Otherwise, \clnref{mb2} executes a memory barrier to ensure that the
+increment of \co{dynticks} on \clnref{inc_dynt2} is seen after any RCU
 read-side critical sections that the prior \IRQ\ handler might have executed.
-Line~\lnref{chk_even} verifies that \co{dynticks} is now even, consistent with
+\Clnref{chk_even} verifies that \co{dynticks} is now even, consistent with
 the fact that no RCU read-side critical sections may appear in
 dynticks-idle mode.
-Lines~\lnref{chk_cb:b}-\lnref{chk_cb:e} check to see
+\Clnrefrange{chk_cb:b}{chk_cb:e} check to see
 if the prior \IRQ\ handlers enqueued any
 RCU callbacks, forcing this CPU out of dynticks-idle mode via
 a reschedule API if so.
@@ -1509,25 +1489,21 @@ dyntick_save_progress_counter(struct rcu_data *rdp)
 
 \noindent% @@@ \NoIndentAfterThis commented out above has side effect. @@@
 \begin{lineref}[ln:formal:Saving Dyntick Progress Counters]
-Listing~\ref{lst:formal:Saving Dyntick Progress Counters}
+\Cref{lst:formal:Saving Dyntick Progress Counters}
 shows \co{dyntick_save_progress_counter()}, which takes a snapshot
 of the specified CPU's \co{dynticks} and \co{dynticks_nmi}
 counters.
-Lines~\lnref{snap} and~\lnref{snapn} snapshot these two variables to locals,
-line~\lnref{mb}
-executes a memory barrier to pair with the memory barriers in
-the functions in
-Listings~\ref{lst:formal:Entering and Exiting Dynticks-Idle Mode},
-\ref{lst:formal:NMIs From Dynticks-Idle Mode},
-and~\ref{lst:formal:Interrupts From Dynticks-Idle Mode}.
-Lines~\lnref{rec_snap} and~\lnref{rec_snapn}
-record the snapshots for later calls to
+\Clnref{snap,snapn} snapshot these two variables to locals, \clnref{mb}
+executes a memory barrier to pair with the memory barriers in the functions in
+\cref{lst:formal:Entering and Exiting Dynticks-Idle Mode,%
+lst:formal:NMIs From Dynticks-Idle Mode,%
+lst:formal:Interrupts From Dynticks-Idle Mode}.
+\Clnref{rec_snap,rec_snapn} record the snapshots for later calls to
 \co{rcu_implicit_dynticks_qs()},
-and line~\lnref{chk_prgs} checks to see if the CPU is in dynticks-idle mode with
+and \clnref{chk_prgs} checks to see if the CPU is in dynticks-idle mode with
 neither \IRQ s nor NMIs in progress (in other words, both snapshots
 have even values), hence in an extended quiescent state.
-If so, lines~\lnref{cnt:b} and~\lnref{cnt:e} count this event,
-and line~\lnref{ret} returns
+If so, \clnref{cnt:b,cnt:e} count this event, and \clnref{ret} returns
 true if the CPU was in a quiescent state.
 \end{lineref}
 
@@ -1561,33 +1537,30 @@ rcu_implicit_dynticks_qs(struct rcu_data *rdp)
 \end{listing}
 
 \begin{lineref}[ln:formal:Checking Dyntick Progress Counters]
-Listing~\ref{lst:formal:Checking Dyntick Progress Counters}
+\Cref{lst:formal:Checking Dyntick Progress Counters}
 shows \co{rcu_implicit_dynticks_qs()}, which is called to check
 whether a CPU has entered dyntick-idle mode subsequent to a call
 to \co{dynticks_save_progress_counter()}.
-Lines~\lnref{curr} and~\lnref{currn}
-take new snapshots of the corresponding CPU's
+\Clnref{curr,currn} take new snapshots of the corresponding CPU's
 \co{dynticks} and \co{dynticks_nmi} variables, while
-lines~\lnref{snap} and~\lnref{snapn}
-retrieve the snapshots saved earlier by
+\clnref{snap,snapn} retrieve the snapshots saved earlier by
 \co{dynticks_save_progress_counter()}.
-Line~\lnref{mb} then
+\Clnref{mb} then
 executes a memory barrier to pair with the memory barriers in
 the functions in
-Listings~\ref{lst:formal:Entering and Exiting Dynticks-Idle Mode},
-\ref{lst:formal:NMIs From Dynticks-Idle Mode}, and
-\ref{lst:formal:Interrupts From Dynticks-Idle Mode}.
-Lines~\lnref{chk_q:b}-\lnref{chk_q:e}
+\cref{lst:formal:Entering and Exiting Dynticks-Idle Mode,%
+lst:formal:NMIs From Dynticks-Idle Mode,%
+lst:formal:Interrupts From Dynticks-Idle Mode}.
+\Clnrefrange{chk_q:b}{chk_q:e}
 then check to see if the CPU is either currently in
 a quiescent state (\co{curr} and \co{curr_nmi} having even values) or
 has passed through a quiescent state since the last call to
 \co{dynticks_save_progress_counter()} (the values of
 \co{dynticks} and \co{dynticks_nmi} having changed).
 If these checks confirm that the CPU has passed through a dyntick-idle
-quiescent state, then line~\lnref{cnt} counts that fact and
-line~\lnref{ret_1} returns
-an indication of this fact.
-Either way, line~\lnref{chk_race}
+quiescent state, then \clnref{cnt} counts that fact and
+\clnref{ret_1} returns an indication of this fact.
+Either way, \clnref{chk_race}
 checks for race conditions that can result in RCU
 waiting for a CPU that is offline.
 \end{lineref}
@@ -1623,7 +1596,7 @@ of the NMI handler.
 This limitation of sharing allows the individual functions to be
 understood one at a time, in happy contrast to the situation
 described in
-Section~\ref{sec:formal:Promela Parable: dynticks and Preemptible RCU},
+\cref{sec:formal:Promela Parable: dynticks and Preemptible RCU},
 where an NMI might change shared state at any point during execution of
 the \IRQ\ functions.
 
-- 
2.17.1


