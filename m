Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sBaAXJNu/JR1tzn/3AoGv4jxD7on+E+fmzMzaBMNiIM=;
 b=KCgaNOPKTVBF1S5tg3V7kPhDra3VDcE1W5f/Qgp/F86i/+zUxskb8vJs9i8lb5Yzoz
 65rYgiZ3C/ELAwP+LrG/ujNv0qcxNZxJ2wVqSRDel+mMnHUUM7u0Bhub3RmwqzA2QgMn
 uLkoTVbNDG0WJxtGp0uiMgbN7BfuLSDp/KTpqQZTK9ALbPtG05cSxupJiLsvBBxTcuIE
 pibviRSmeFGu//Z+qLMYRAvyAzYWsKxTOjfQqCIghZ8Ww0tpFKgHih+B3jnHF/vR3P9k
 QUWZsF11ABq7o4Qn4o0auL6Xo1EraV94fz55MNwRU7jnclS4HcX96IIclfnqy5Ol5GTN
 KckA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 08/17] formal/dyntickrcu: Append `()` to function name
 quotations
Date: Wed, 21 Sep 2016 11:44:39 +0900
Message-Id: <20160921024448.24744-9-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Few sentences do not append `()` to function name quotations while
others do.  This commit let them append `()` to function name quotations
consistently.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 3aa79f9..5ede587 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -147,7 +147,7 @@ of any prior RCU read-side critical sections.

 Similarly, when a CPU that is in dynticks-idle mode prepares to
 start executing a newly runnable task, it invokes
-\co{rcu_exit_nohz}:
+\co{rcu_exit_nohz()}:

 { \scriptsize
 \begin{verbatim}
@@ -169,7 +169,7 @@ then that other CPU will also see the incremented value of
 Finally, \co{rcu_exit_nohz()} checks that the result of the
 increment is an odd value.

-The \co{rcu_enter_nohz()} and \co{rcu_exit_nohz}
+The \co{rcu_enter_nohz()} and \co{rcu_exit_nohz()}
 functions handle the case where a CPU enters and exits dynticks-idle
 mode due to task execution, but does not handle interrupts, which are
 covered in the following section.
@@ -187,7 +187,7 @@ and is decremented upon exit (in \co{rcu_irq_exit()}).
 In addition, the pre-existing \co{in_interrupt()} primitive is
 used to distinguish between an outermost or a nested interrupt/NMI.

-Interrupt entry is handled by the \co{rcu_irq_enter}
+Interrupt entry is handled by the \co{rcu_irq_enter()}
 shown below:

 { \scriptsize
@@ -327,7 +327,7 @@ the preceding state takes a snapshot of each CPU's
 snapshot in another per-CPU variable,
 \co{rcu_dyntick_snapshot}.
 This is accomplished by invoking
-\co{dyntick_save_progress_counter}, shown below:
+\co{dyntick_save_progress_counter()}, shown below:

 { \scriptsize
 \begin{verbatim}
@@ -365,7 +365,7 @@ The \co{rcu_try_flip_waitack_state()} state invokes
 Lines~7 and~8 pick up current and snapshot versions of
 \co{dynticks_progress_counter}, respectively.
 The memory barrier on line~9 ensures that the counter checks
-in the later \co{rcu_try_flip_waitzero_state} follow
+in the later \co{rcu_try_flip_waitzero_state()} follow
 the fetches of these counters.
 Lines~10 and~11 return zero (meaning no communication with the
 specified CPU is required) if that CPU has remained in dynticks-idle
@@ -378,7 +378,7 @@ the old value of the grace-period counter.
 If neither of these conditions hold, line~14 returns one, meaning
 that the CPU needs to explicitly respond.

-For its part, the \co{rcu_try_flip_waitmb_state} state
+For its part, the \co{rcu_try_flip_waitmb_state()} state
 invokes \co{rcu_try_flip_waitmb_needed()}, shown below:

 { \scriptsize
@@ -401,7 +401,7 @@ invokes \co{rcu_try_flip_waitmb_needed()}, shown below:
 \end{verbatim}
 }

-This is quite similar to \co{rcu_try_flip_waitack_needed},
+This is quite similar to \co{rcu_try_flip_waitack_needed()},
 the difference being in lines~12 and~13, because any transition
 either to or from dynticks-idle state executes the memory barrier
 needed by the \co{rcu_try_flip_waitmb_state()} state.
@@ -966,7 +966,7 @@ The corrected C code is as follows:
 Lines~10-13 can now be combined and simplified,
 resulting in the following.
 A similar simplification can be applied to
-\co{rcu_try_flip_waitmb_needed}.
+\co{rcu_try_flip_waitmb_needed()}.

 { \scriptsize
 \begin{verbatim}
@@ -1250,7 +1250,7 @@ and finally lines~32-43 model \co{rcu_irq_exit()}.
 	which are handled in the following section.
 } \QuickQuizEnd

-The \co{grace_period} process then becomes as follows:
+The \co{grace_period()} process then becomes as follows:

 { \scriptsize
 \begin{verbatim}
@@ -2040,8 +2040,8 @@ which inform RCU of NMI entry and exit, respectively, from dynticks-idle
 mode.
 However, if the NMI arrives during an irq handler, then RCU will already
 be on the lookout for RCU read-side critical sections from this CPU,
-so lines~6 and~7 of \co{rcu_nmi_enter} and lines~18 and~19
-of \co{rcu_nmi_exit} silently return if \co{dynticks} is odd.
+so lines~6 and~7 of \co{rcu_nmi_enter()} and lines~18 and~19
+of \co{rcu_nmi_exit()} silently return if \co{dynticks} is odd.
 Otherwise, the two functions increment \co{dynticks_nmi}, with
 \co{rcu_nmi_enter()} leaving it with an odd value and \co{rcu_nmi_exit()}
 leaving it with an even value.
@@ -2102,7 +2102,7 @@ the increment of \co{dynticks} is seen before any
 RCU read-side critical sections that the subsequent irq handler
 might execute.

-Line~18 of \co{rcu_irq_exit} decrements \co{dynticks_nesting}, and
+Line~18 of \co{rcu_irq_exit()} decrements \co{dynticks_nesting}, and
 if the result is non-zero, line~19 silently returns.
 Otherwise, line~20 executes a memory barrier to ensure that the
 increment of \co{dynticks} on line~21 is seen after any RCU
@@ -2157,7 +2157,7 @@ Figures~\ref{fig:formal:Entering and Exiting Dynticks-Idle Mode},
 \ref{fig:formal:NMIs From Dynticks-Idle Mode}, and
 \ref{fig:formal:Interrupts From Dynticks-Idle Mode}.
 Lines~11 and~12 record the snapshots for later calls to
-\co{rcu_implicit_dynticks_qs},
+\co{rcu_implicit_dynticks_qs()},
 and lines~13 and~14 check to see if the CPU is in dynticks-idle mode with
 neither irqs nor NMIs in progress (in other words, both snapshots
 have even values), hence in an extended quiescent state.
-- 
2.10.0

