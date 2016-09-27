Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44848 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750851AbcI0XTI (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 27
 Sep 2016 19:19:08 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8RNIEis002291
 for <perfbook@vger.kernel.org>; Tue, 27 Sep 2016 19:19:07 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 25r24j8ehw-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 27 Sep 2016 19:19:06 -0400
Received: from localhost by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 27 Sep
 2016 17:19:06 -0600
Date: Tue, 27 Sep 2016 16:19:04 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 01/17] formal: Rearrange promela sample code location
Reply-To: paulmck@linux.vnet.ibm.com
References: <20160927215641.7330-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
Message-Id: <20160927231904.GA11932@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Wed, Sep 28, 2016 at 06:56:25AM +0900, SeongJae Park wrote:
> `Formal Verification` was a section in analysis chapter in initial
> version.  After that, it changed to an appendix[1], then promoted to a
> chapter[2] now while the analysis chapter has merged into debugging
> chapter[3].  However, code samples for formal verification exist under
> `CodeSamples/appendix/formal/` and `CodeSamples/analysis/` directory.
> It is unnecessary duplicate and ambiguous directory hierarchy.  This
> commit removes the unnecessarily dulicated files and changes the name of
> the directory.
> 
> [1] commit 8a7e0cb902e9, ("Move the formal-verification sections to a
>     new appendix.")
> [2] commit 87a645d2aa0b ("Promote formal-methods appendix to a
>     chapter.")
> [3] commit e0c08f843331 ("Merge the analysis chapter into debugging.")
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Applied, thank you!

							Thanx, Paul

> ---
>  CodeSamples/appendix/formal/dyntickRCU-base-s.spin | 196 --------
>  .../appendix/formal/dyntickRCU-base-sl-busted.spin | 224 ---------
>  .../appendix/formal/dyntickRCU-base-sl.spin        | 220 ---------
>  CodeSamples/appendix/formal/dyntickRCU-base.spin   | 164 -------
>  .../appendix/formal/dyntickRCU-irq-nmi-ssl.spin    | 506 ---------------------
>  .../appendix/formal/dyntickRCU-irq-ssl.spin        | 356 ---------------
>  .../appendix/formal/dyntickRCU-irqnn-ssl.spin      | 330 --------------
>  CodeSamples/appendix/formal/dyntickRCUtarball.sh   |  18 -
>  CodeSamples/appendix/formal/runspin.sh             |  31 --
>  .../{analysis => formal}/promela/.gitignore        |   0
>  .../promela/atomicincrement.spin                   |   0
>  .../formal => formal/promela/dyntick}/.gitignore   |   0
>  .../promela/dyntick/dyntickRCU-base-s.spin         |   0
>  .../promela/dyntick/dyntickRCU-base-sl-busted.spin |   0
>  .../dyntickRCU-base-sl-busted.spin.trail.txt       |   0
>  .../promela/dyntick/dyntickRCU-base-sl.spin        |   0
>  .../promela/dyntick/dyntickRCU-base.spin           |   0
>  .../promela/dyntick/dyntickRCU-irq-nmi-ssl.spin    |   0
>  .../promela/dyntick/dyntickRCU-irq-ssl.spin        |   0
>  .../promela/dyntick/dyntickRCU-irqnn-ssl.spin      |   0
>  .../promela/dyntick/dyntickRCUtarball.sh           |   0
>  .../promela/dyntick/runspin.sh                     |   0
>  .../{analysis => formal}/promela/increment.spin    |   0
>  CodeSamples/{analysis => formal}/promela/lock.h    |   0
>  CodeSamples/{analysis => formal}/promela/lock.spin |   0
>  CodeSamples/{analysis => formal}/promela/qrcu.spin |   0
>  26 files changed, 2045 deletions(-)
>  delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-base-s.spin
>  delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-base-sl-busted.spin
>  delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-base-sl.spin
>  delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-base.spin
>  delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-irq-nmi-ssl.spin
>  delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-irq-ssl.spin
>  delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-irqnn-ssl.spin
>  delete mode 100644 CodeSamples/appendix/formal/dyntickRCUtarball.sh
>  delete mode 100644 CodeSamples/appendix/formal/runspin.sh
>  rename CodeSamples/{analysis => formal}/promela/.gitignore (100%)
>  rename CodeSamples/{analysis => formal}/promela/atomicincrement.spin (100%)
>  rename CodeSamples/{appendix/formal => formal/promela/dyntick}/.gitignore (100%)
>  rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-base-s.spin (100%)
>  rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-base-sl-busted.spin (100%)
>  rename CodeSamples/{appendix/formal => formal/promela/dyntick}/dyntickRCU-base-sl-busted.spin.trail.txt (100%)
>  rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-base-sl.spin (100%)
>  rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-base.spin (100%)
>  rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-irq-nmi-ssl.spin (100%)
>  rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-irq-ssl.spin (100%)
>  rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-irqnn-ssl.spin (100%)
>  rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCUtarball.sh (100%)
>  rename CodeSamples/{analysis => formal}/promela/dyntick/runspin.sh (100%)
>  rename CodeSamples/{analysis => formal}/promela/increment.spin (100%)
>  rename CodeSamples/{analysis => formal}/promela/lock.h (100%)
>  rename CodeSamples/{analysis => formal}/promela/lock.spin (100%)
>  rename CodeSamples/{analysis => formal}/promela/qrcu.spin (100%)
> 
> diff --git a/CodeSamples/appendix/formal/dyntickRCU-base-s.spin b/CodeSamples/appendix/formal/dyntickRCU-base-s.spin
> deleted file mode 100644
> index 21aea11..0000000
> --- a/CodeSamples/appendix/formal/dyntickRCU-base-s.spin
> +++ /dev/null
> @@ -1,196 +0,0 @@
> -/*
> - * Tests a variation of RCU-dyntick interaction in the Linux 2.6.25-rc4
> - * kernel.  Note that portions of this are derived from Linux kernel code,
> - * portions of which are licensed under a GPLv2-only license.
> - *
> - * This version omits irq/NMI handlers.  It does not have liveness checks.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, you can access it online at
> - * http://www.gnu.org/licenses/gpl-2.0.html.
> - *
> - * Copyright (c) 2008 IBM Corporation.
> - */
> -
> -/*
> - * Parameters:
> - *
> - * MAX_DYNTICK_LOOP_NOHZ: The number of non-idle process level bursts
> - *	of work.
> - *
> - * Setting a given value for a given parameter covers all values up to
> - * and including the specified value.  So, if MAX_DYNTICK_LOOP_NOHZ is
> - * set to "2", then the validation will cover 0, 1, and 2 loops.
> - */
> -
> -#define MAX_DYNTICK_LOOP_NOHZ 3
> -
> -/* Variables corresponding to the 2.6.25-rc4 per-CPU variables. */
> -
> -byte dynticks_progress_counter = 0;
> -byte rcu_update_flag = 0;
> -byte in_interrupt = 0;
> -
> -/*
> - * The grace_period() process uses this to track its progress through
> - * each phase, thus allowing the other processes to make sure that
> - * grace_period() does not advance prematurely.
> - */
> -
> -#define GP_IDLE		0
> -#define GP_WAITING	1
> -#define GP_DONE		2
> -byte grace_period_state = GP_DONE;
> -
> -/*
> - * Validation code for the slice of the preemptible-RCU code that
> - * interacts with the dynticks subsystem.  This is set up to match
> - * the code in 2.6.25-rc4, namely dyntick_save_progress_counter(),
> - * rcu_try_flip_waitack_needed(), rcu_try_flip_waitmb_needed(),
> - * and portions of rcu_try_flip_waitack() and rcu_try_flip_waitmb().
> - */
> -
> -proctype grace_period()
> -{
> -	byte curr;
> -	byte snap;
> -
> -	/*
> -	 * A little code from rcu_try_flip_idle() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  As noted earlier, the grace_period_state
> -	 * variable allows the other processes to scream if we jump
> -	 * the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		printf("MAX_DYNTICK_LOOP_NOHZ = %d\n", MAX_DYNTICK_LOOP_NOHZ);
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitack()
> -	 * and its call to rcu_try_flip_waitack_needed().
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr == snap) && ((curr & 1) == 0) ->
> -				break;
> -			:: (curr - snap) > 2 || (snap & 1) == 0 ->
> -				break;
> -			:: 1 -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -
> -	/*
> -	 * A little code from rcu_try_flip_waitzero() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  As noted earlier, the grace_period_state
> -	 * variable allows the other processes to scream if we jump
> -	 * the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitmb()
> -	 * and its call to rcu_try_flip_waitmb_needed().
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr == snap) && ((curr & 1) == 0) ->
> -				break;
> -			:: (curr != snap) ->
> -				break;
> -			:: 1 -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -}
> -
> -/*
> - * Validation code for the rcu_enter_nohz() and rcu_exit_nohz()
> - * functions.  Each pass through this process's loop corresponds
> - * to exiting nohz mode, then re-entering it.  The old_gp_idle
> - * variable is used to verify that grace_period() does not incorrectly
> - * advance while this process is not in nohz mode.  This code also
> - * includes assertions corresponding to the WARN_ON() calls in
> - * rcu_exit_nohz() and rcu_enter_nohz().
> - */
> -
> -proctype dyntick_nohz()
> -{
> -	byte tmp;
> -	byte i = 0;
> -	bit old_gp_idle;
> -
> -	do
> -	:: i >= MAX_DYNTICK_LOOP_NOHZ -> break;
> -	:: i < MAX_DYNTICK_LOOP_NOHZ ->
> -
> -		/*
> -		 * The following corresponds to rcu_exit_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		tmp = dynticks_progress_counter;
> -		atomic {
> -			dynticks_progress_counter = tmp + 1;
> -			old_gp_idle = (grace_period_state == GP_IDLE);
> -			assert((dynticks_progress_counter & 1) == 1);
> -		}
> -
> -		/*
> -		 * The following corresponds to rcu_enter_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		atomic {
> -			tmp = dynticks_progress_counter;
> -			assert(!old_gp_idle || grace_period_state != GP_DONE);
> -		}
> -		atomic {
> -			dynticks_progress_counter = tmp + 1;
> -			assert((dynticks_progress_counter & 1) == 0);
> -		}
> -		i++;
> -	od;
> -}
> -
> -init {
> -	atomic {
> -		run dyntick_nohz();
> -		run grace_period();
> -	}
> -}
> diff --git a/CodeSamples/appendix/formal/dyntickRCU-base-sl-busted.spin b/CodeSamples/appendix/formal/dyntickRCU-base-sl-busted.spin
> deleted file mode 100644
> index 46e97fd..0000000
> --- a/CodeSamples/appendix/formal/dyntickRCU-base-sl-busted.spin
> +++ /dev/null
> @@ -1,224 +0,0 @@
> -/*
> - * Tests a variation of RCU-dyntick interaction in the Linux 2.6.25-rc4
> - * kernel.  Note that portions of this are derived from Linux kernel code,
> - * portions of which are licensed under a GPLv2-only license.
> - *
> - * This version omits irq/NMI handlers.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, you can access it online at
> - * http://www.gnu.org/licenses/gpl-2.0.html.
> - *
> - * Copyright (c) 2008 IBM Corporation.
> - */
> -
> -/*
> - * Parameters:
> - *
> - * MAX_DYNTICK_LOOP_NOHZ: The number of non-idle process level bursts
> - *	of work.
> - *
> - * Setting a given value for a given parameter covers all values up to
> - * and including the specified value.  So, if MAX_DYNTICK_LOOP_NOHZ is
> - * set to "2", then the validation will cover 0, 1, and 2 loops.
> - */
> -
> -#define MAX_DYNTICK_LOOP_NOHZ 3
> -
> -/* Variables corresponding to the 2.6.25-rc4 per-CPU variables. */
> -
> -byte dynticks_progress_counter = 0;
> -byte rcu_update_flag = 0;
> -byte in_interrupt = 0;
> -
> -/*
> - * The grace_period() process uses this to track its progress through
> - * each phase, thus allowing the other processes to make sure that
> - * grace_period() does not advance prematurely.
> - */
> -
> -#define GP_IDLE		0
> -#define GP_WAITING	1
> -#define GP_DONE		2
> -byte grace_period_state = GP_DONE;
> -
> -/*
> - * The following variables mark completion of the corresponding processes.
> - * This is used in grace_period() to check forward progress guarantees.
> - */
> -
> -bit dyntick_nohz_done = 0;
> -
> -/*
> - * Validation code for the slice of the preemptible-RCU code that
> - * interacts with the dynticks subsystem.  This is set up to match
> - * the code in 2.6.25-rc4, namely dyntick_save_progress_counter(),
> - * rcu_try_flip_waitack_needed(), rcu_try_flip_waitmb_needed(),
> - * and portions of rcu_try_flip_waitack() and rcu_try_flip_waitmb().
> - *
> - * This code verifies forward progress: once all of the other processes
> - * have terminated, the grace_period() code must not block.  In addition,
> - * this code maintains a progress indicator in the grace_period_state
> - * variable.  It is an error for grace_period() to advance from GP_IDLE
> - * to GP_DONE unless all the other processes are simultaneously in nohz
> - * mode at some point during the transition.
> - */
> -
> -proctype grace_period()
> -{
> -	byte curr;
> -	byte snap;
> -	bit shouldexit;
> -
> -	/*
> -	 * A little code from rcu_try_flip_idle() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  The shouldexit variable is for the
> -	 * later liveness checks.  As noted earlier, the
> -	 * grace_period_state variable allows the other processes
> -	 * to scream if we jump the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		printf("MAX_DYNTICK_LOOP_NOHZ = %d\n", MAX_DYNTICK_LOOP_NOHZ);
> -		shouldexit = 0;
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitack()
> -	 * and its call to rcu_try_flip_waitack_needed().  The shouldexit
> -	 * check ensures that we scream if we cannot immediately exit
> -	 * the loop after all other proceses have completed.
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			assert(!shouldexit);
> -			shouldexit = dyntick_nohz_done;
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr == snap) && ((curr & 1) == 0) ->
> -				break;
> -			:: (curr - snap) > 2 || (snap & 1) == 0 ->
> -				break;
> -			:: else -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -
> -	/*
> -	 * A little code from rcu_try_flip_waitzero() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  The shouldexit variable is for the
> -	 * later liveness checks.  As noted earlier, the
> -	 * grace_period_state variable allows the other processes
> -	 * to scream if we jump the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		shouldexit = 0;
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitmb()
> -	 * and its call to rcu_try_flip_waitmb_needed().  The shouldexit
> -	 * check again ensures that we scream if we cannot immediately exit
> -	 * the loop after all other proceses have completed.
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			assert(!shouldexit);
> -			shouldexit = dyntick_nohz_done;
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr == snap) && ((curr & 1) == 0) ->
> -				break;
> -			:: (curr != snap) ->
> -				break;
> -			:: else -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -}
> -
> -/*
> - * Validation code for the rcu_enter_nohz() and rcu_exit_nohz()
> - * functions.  Each pass through this process's loop corresponds
> - * to exiting nohz mode, then re-entering it.  The old_gp_idle
> - * variable is used to verify that grace_period() does not incorrectly
> - * advance while this process is not in nohz mode.  This code also
> - * includes assertions corresponding to the WARN_ON() calls in
> - * rcu_exit_nohz() and rcu_enter_nohz().
> - */
> -
> -proctype dyntick_nohz()
> -{
> -	byte tmp;
> -	byte i = 0;
> -	bit old_gp_idle;
> -
> -	do
> -	:: i >= MAX_DYNTICK_LOOP_NOHZ -> break;
> -	:: i < MAX_DYNTICK_LOOP_NOHZ ->
> -
> -		/*
> -		 * The following corresponds to rcu_exit_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		tmp = dynticks_progress_counter;
> -		atomic {
> -			dynticks_progress_counter = tmp + 1;
> -			old_gp_idle = (grace_period_state == GP_IDLE);
> -			assert((dynticks_progress_counter & 1) == 1);
> -		}
> -
> -		/*
> -		 * The following corresponds to rcu_enter_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		atomic {
> -			tmp = dynticks_progress_counter;
> -			assert(!old_gp_idle || grace_period_state != GP_DONE);
> -		}
> -		atomic {
> -			dynticks_progress_counter = tmp + 1;
> -			assert((dynticks_progress_counter & 1) == 0);
> -		}
> -		i++;
> -	od;
> -	dyntick_nohz_done = 1;
> -}
> -
> -init {
> -	atomic {
> -		run dyntick_nohz();
> -		run grace_period();
> -	}
> -}
> diff --git a/CodeSamples/appendix/formal/dyntickRCU-base-sl.spin b/CodeSamples/appendix/formal/dyntickRCU-base-sl.spin
> deleted file mode 100644
> index 3655e87..0000000
> --- a/CodeSamples/appendix/formal/dyntickRCU-base-sl.spin
> +++ /dev/null
> @@ -1,220 +0,0 @@
> -/*
> - * Tests a variation of RCU-dyntick interaction in the Linux 2.6.25-rc4
> - * kernel.  Note that portions of this are derived from Linux kernel code,
> - * portions of which are licensed under a GPLv2-only license.
> - *
> - * This version omits irq/NMI handlers.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, you can access it online at
> - * http://www.gnu.org/licenses/gpl-2.0.html.
> - *
> - * Copyright (c) 2008 IBM Corporation.
> - */
> -
> -/*
> - * Parameters:
> - *
> - * MAX_DYNTICK_LOOP_NOHZ: The number of non-idle process level bursts
> - *	of work.
> - *
> - * Setting a given value for a given parameter covers all values up to
> - * and including the specified value.  So, if MAX_DYNTICK_LOOP_NOHZ is
> - * set to "2", then the validation will cover 0, 1, and 2 loops.
> - */
> -
> -#define MAX_DYNTICK_LOOP_NOHZ 3
> -
> -/* Variables corresponding to the 2.6.25-rc4 per-CPU variables. */
> -
> -byte dynticks_progress_counter = 0;
> -byte rcu_update_flag = 0;
> -byte in_interrupt = 0;
> -
> -/*
> - * The grace_period() process uses this to track its progress through
> - * each phase, thus allowing the other processes to make sure that
> - * grace_period() does not advance prematurely.
> - */
> -
> -#define GP_IDLE		0
> -#define GP_WAITING	1
> -#define GP_DONE		2
> -byte grace_period_state = GP_DONE;
> -
> -/*
> - * The following variables mark completion of the corresponding processes.
> - * This is used in grace_period() to check forward progress guarantees.
> - */
> -
> -bit dyntick_nohz_done = 0;
> -
> -/*
> - * Validation code for the slice of the preemptible-RCU code that
> - * interacts with the dynticks subsystem.  This is set up to match
> - * the code in 2.6.25-rc4, namely dyntick_save_progress_counter(),
> - * rcu_try_flip_waitack_needed(), rcu_try_flip_waitmb_needed(),
> - * and portions of rcu_try_flip_waitack() and rcu_try_flip_waitmb().
> - *
> - * This code verifies forward progress: once all of the other processes
> - * have terminated, the grace_period() code must not block.  In addition,
> - * this code maintains a progress indicator in the grace_period_state
> - * variable.  It is an error for grace_period() to advance from GP_IDLE
> - * to GP_DONE unless all the other processes are simultaneously in nohz
> - * mode at some point during the transition.
> - */
> -
> -proctype grace_period()
> -{
> -	byte curr;
> -	byte snap;
> -	bit shouldexit;
> -
> -	/*
> -	 * A little code from rcu_try_flip_idle() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  The shouldexit variable is for the
> -	 * later liveness checks.  As noted earlier, the
> -	 * grace_period_state variable allows the other processes
> -	 * to scream if we jump the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		printf("MAX_DYNTICK_LOOP_NOHZ = %d\n", MAX_DYNTICK_LOOP_NOHZ);
> -		shouldexit = 0;
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitack()
> -	 * and its call to rcu_try_flip_waitack_needed().  The shouldexit
> -	 * check ensures that we scream if we cannot immediately exit
> -	 * the loop after all other proceses have completed.
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			assert(!shouldexit);
> -			shouldexit = dyntick_nohz_done;
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr - snap) >= 2 || (curr & 1) == 0 ->
> -				break;
> -			:: else -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -
> -	/*
> -	 * A little code from rcu_try_flip_waitzero() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  The shouldexit variable is for the
> -	 * later liveness checks.  As noted earlier, the
> -	 * grace_period_state variable allows the other processes
> -	 * to scream if we jump the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		shouldexit = 0;
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitmb()
> -	 * and its call to rcu_try_flip_waitmb_needed().  The shouldexit
> -	 * check again ensures that we scream if we cannot immediately exit
> -	 * the loop after all other proceses have completed.
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			assert(!shouldexit);
> -			shouldexit = dyntick_nohz_done;
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr != snap) || ((curr & 1) == 0) ->
> -				break;
> -			:: else -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -}
> -
> -/*
> - * Validation code for the rcu_enter_nohz() and rcu_exit_nohz()
> - * functions.  Each pass through this process's loop corresponds
> - * to exiting nohz mode, then re-entering it.  The old_gp_idle
> - * variable is used to verify that grace_period() does not incorrectly
> - * advance while this process is not in nohz mode.  This code also
> - * includes assertions corresponding to the WARN_ON() calls in
> - * rcu_exit_nohz() and rcu_enter_nohz().
> - */
> -
> -proctype dyntick_nohz()
> -{
> -	byte tmp;
> -	byte i = 0;
> -	bit old_gp_idle;
> -
> -	do
> -	:: i >= MAX_DYNTICK_LOOP_NOHZ -> break;
> -	:: i < MAX_DYNTICK_LOOP_NOHZ ->
> -
> -		/*
> -		 * The following corresponds to rcu_exit_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		tmp = dynticks_progress_counter;
> -		atomic {
> -			dynticks_progress_counter = tmp + 1;
> -			old_gp_idle = (grace_period_state == GP_IDLE);
> -			assert((dynticks_progress_counter & 1) == 1);
> -		}
> -
> -		/*
> -		 * The following corresponds to rcu_enter_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		atomic {
> -			tmp = dynticks_progress_counter;
> -			assert(!old_gp_idle || grace_period_state != GP_DONE);
> -		}
> -		atomic {
> -			dynticks_progress_counter = tmp + 1;
> -			assert((dynticks_progress_counter & 1) == 0);
> -		}
> -		i++;
> -	od;
> -	dyntick_nohz_done = 1;
> -}
> -
> -init {
> -	atomic {
> -		run dyntick_nohz();
> -		run grace_period();
> -	}
> -}
> diff --git a/CodeSamples/appendix/formal/dyntickRCU-base.spin b/CodeSamples/appendix/formal/dyntickRCU-base.spin
> deleted file mode 100644
> index 29f0345..0000000
> --- a/CodeSamples/appendix/formal/dyntickRCU-base.spin
> +++ /dev/null
> @@ -1,164 +0,0 @@
> -/*
> - * Tests a variation of RCU-dyntick interaction in the Linux 2.6.25-rc4
> - * kernel.  Note that portions of this are derived from Linux kernel code,
> - * portions of which are licensed under a GPLv2-only license.
> - *
> - * This version omits irq/NMI handlers.  It does not have either safety
> - * or liveness checks.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, you can access it online at
> - * http://www.gnu.org/licenses/gpl-2.0.html.
> - *
> - * Copyright (c) 2008 IBM Corporation.
> - */
> -
> -/*
> - * Parameters:
> - *
> - * MAX_DYNTICK_LOOP_NOHZ: The number of non-idle process level bursts
> - *	of work.
> - *
> - * Setting a given value for a given parameter covers all values up to
> - * and including the specified value.  So, if MAX_DYNTICK_LOOP_NOHZ is
> - * set to "2", then the validation will cover 0, 1, and 2 loops.
> - */
> -
> -#define MAX_DYNTICK_LOOP_NOHZ 3
> -
> -/* Variables corresponding to the 2.6.25-rc4 per-CPU variables. */
> -
> -byte dynticks_progress_counter = 0;
> -byte rcu_update_flag = 0;
> -byte in_interrupt = 0;
> -
> -/*
> - * Validation code for the slice of the preemptible-RCU code that
> - * interacts with the dynticks subsystem.  This is set up to match
> - * the code in 2.6.25-rc4, namely dyntick_save_progress_counter(),
> - * rcu_try_flip_waitack_needed(), rcu_try_flip_waitmb_needed(),
> - * and portions of rcu_try_flip_waitack() and rcu_try_flip_waitmb().
> - */
> -
> -proctype grace_period()
> -{
> -	byte curr;
> -	byte snap;
> -
> -	/*
> -	 * A little code from rcu_try_flip_idle() and its call
> -	 * to dyntick_save_progress_counter().
> -	 */
> -
> -	atomic {
> -		printf("MAX_DYNTICK_LOOP_NOHZ = %d\n", MAX_DYNTICK_LOOP_NOHZ);
> -		snap = dynticks_progress_counter;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitack()
> -	 * and its call to rcu_try_flip_waitack_needed().
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr == snap) && ((curr & 1) == 0) ->
> -				break;
> -			:: (curr - snap) > 2 || (snap & 1) == 0 ->
> -				break;
> -			:: 1 -> skip;
> -			fi;
> -		}
> -	od;
> -
> -	/*
> -	 * A little code from rcu_try_flip_waitzero() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.
> -	 */
> -
> -	snap = dynticks_progress_counter;
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitmb()
> -	 * and its call to rcu_try_flip_waitmb_needed().
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr == snap) && ((curr & 1) == 0) ->
> -				break;
> -			:: (curr != snap) ->
> -				break;
> -			:: 1 -> skip;
> -			fi;
> -		}
> -	od;
> -}
> -
> -/*
> - * Validation code for the rcu_enter_nohz() and rcu_exit_nohz()
> - * functions.  Each pass through this process's loop corresponds
> - * to exiting nohz mode, then re-entering it.  This code also
> - * includes assertions corresponding to the WARN_ON() calls in
> - * rcu_exit_nohz() and rcu_enter_nohz().
> - */
> -
> -proctype dyntick_nohz()
> -{
> -	byte tmp;
> -	byte i = 0;
> -
> -	do
> -	:: i >= MAX_DYNTICK_LOOP_NOHZ -> break;
> -	:: i < MAX_DYNTICK_LOOP_NOHZ ->
> -
> -		/*
> -		 * The following corresponds to rcu_exit_nohz().
> -		 */
> -
> -		tmp = dynticks_progress_counter;
> -		atomic {
> -			dynticks_progress_counter = tmp + 1;
> -			assert((dynticks_progress_counter & 1) == 1);
> -		}
> -
> -		/*
> -		 * The following corresponds to rcu_enter_nohz().
> -		 */
> -
> -		tmp = dynticks_progress_counter;
> -		atomic {
> -			dynticks_progress_counter = tmp + 1;
> -			assert((dynticks_progress_counter & 1) == 0);
> -		}
> -		i++;
> -	od;
> -}
> -
> -init {
> -	atomic {
> -		run dyntick_nohz();
> -		run grace_period();
> -	}
> -}
> diff --git a/CodeSamples/appendix/formal/dyntickRCU-irq-nmi-ssl.spin b/CodeSamples/appendix/formal/dyntickRCU-irq-nmi-ssl.spin
> deleted file mode 100644
> index 9a01477..0000000
> --- a/CodeSamples/appendix/formal/dyntickRCU-irq-nmi-ssl.spin
> +++ /dev/null
> @@ -1,506 +0,0 @@
> -/*
> - * Tests a variation of RCU-dyntick interaction in the Linux 2.6.25-rc4
> - * kernel.  Note that portions of this are derived from Linux kernel code,
> - * portions of which are licensed under a GPLv2-only license.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, you can access it online at
> - * http://www.gnu.org/licenses/gpl-2.0.html.
> - *
> - * Copyright (c) 2008 IBM Corporation.
> - */
> -
> -/*
> - * Parameters:
> - *
> - * MAX_DYNTICK_LOOP_NOHZ: The number of non-idle process level bursts
> - *	of work.
> - * MAX_DYNTICK_LOOP_IRQ: The number of interrupts (possibly arbitrarily
> - *	nested) to be received.
> - * MAX_DYNTICK_LOOP_NMI: The number of NMIs (never nested) to be received.
> - *
> - * Setting a given value for a given parameter covers all values up to
> - * and including the specified value.  So, if MAX_DYNTICK_LOOP_IRQ is
> - * set to "2", then the validation will cover 0, 1, and 2 interrupts,
> - * arbitrarily nested.
> - */
> -
> -#define MAX_DYNTICK_LOOP_NOHZ 1
> -#define MAX_DYNTICK_LOOP_IRQ 2
> -#define MAX_DYNTICK_LOOP_NMI 1
> -
> -/* Variables corresponding to the 2.6.25-rc4 per-CPU variables. */
> -
> -byte dynticks_progress_counter = 0;
> -byte rcu_update_flag = 0;
> -byte in_interrupt = 0;
> -
> -/* Set when IRQ code is running, to allow mainline code to lock itself out. */
> -
> -bit in_dyntick_irq = 0;
> -
> -/*
> - * Set when NMI code is running, to allow both mainline code and irq handler
> - * code to lock itself out.
> - */
> -
> -bit in_dyntick_nmi = 0;
> -
> -/*
> - * The grace_period() process uses this to track its progress through
> - * each phase, thus allowing the other processes to make sure that
> - * grace_period() does not advance prematurely.
> - */
> -
> -#define GP_IDLE		0
> -#define GP_WAITING	1
> -#define GP_DONE		2
> -byte grace_period_state = GP_DONE;
> -
> -/*
> - * The following variables mark completion of the corresponding processes.
> - * This is used in grace_period() to check forward progress guarantees.
> - */
> -
> -bit dyntick_nohz_done = 0;
> -bit dyntick_irq_done = 0;
> -bit dyntick_nmi_done = 0;
> -
> -/*
> - * Validation code for the slice of the preemptible-RCU code that
> - * interacts with the dynticks subsystem.  This is set up to match
> - * the code in 2.6.25-rc4, namely dyntick_save_progress_counter(),
> - * rcu_try_flip_waitack_needed(), rcu_try_flip_waitmb_needed(),
> - * and portions of rcu_try_flip_waitack() and rcu_try_flip_waitmb().
> - *
> - * This code verifies forward progress: once all of the other processes
> - * have terminated, the grace_period() code must not block.  In addition,
> - * this code maintains a progress indicator in the grace_period_state
> - * variable.  It is an error for grace_period() to advance from GP_IDLE
> - * to GP_DONE unless all the other processes are simultaneously in nohz
> - * mode at some point during the transition.
> - */
> -
> -proctype grace_period()
> -{
> -	byte curr;
> -	byte snap;
> -	bit shouldexit;
> -
> -	/*
> -	 * A little code from rcu_try_flip_idle() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  The shouldexit variable is for the
> -	 * later liveness checks.  As noted earlier, the
> -	 * grace_period_state variable allows the other processes
> -	 * to scream if we jump the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		printf("MAX_DYNTICK_LOOP_NOHZ = %d\n", MAX_DYNTICK_LOOP_NOHZ);
> -		printf("MAX_DYNTICK_LOOP_IRQ = %d\n", MAX_DYNTICK_LOOP_IRQ);
> -		printf("MAX_DYNTICK_LOOP_NMI = %d\n", MAX_DYNTICK_LOOP_NMI);
> -		shouldexit = 0;
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitack()
> -	 * and its call to rcu_try_flip_waitack_needed().  The shouldexit
> -	 * check ensures that we scream if we cannot immediately exit
> -	 * the loop after all other proceses have completed.
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			assert(!shouldexit);
> -			shouldexit = dyntick_nohz_done &&
> -				     dyntick_irq_done &&
> -				     dyntick_nmi_done;
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr - snap) >= 2 || (curr & 1) == 0 ->
> -				break;
> -			:: else -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -
> -	/*
> -	 * A little code from rcu_try_flip_waitzero() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  The shouldexit variable is for the
> -	 * later liveness checks.  As noted earlier, the
> -	 * grace_period_state variable allows the other processes
> -	 * to scream if we jump the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		shouldexit = 0;
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitmb()
> -	 * and its call to rcu_try_flip_waitmb_needed().  The shouldexit
> -	 * check again ensures that we scream if we cannot immediately exit
> -	 * the loop after all other proceses have completed.
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			assert(!shouldexit);
> -			shouldexit = dyntick_nohz_done &&
> -				     dyntick_irq_done &&
> -				     dyntick_nmi_done;
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr != snap) || ((curr & 1) == 0) ->
> -				break;
> -			:: else -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -}
> -
> -/*
> - * Macro that allows dyntick_irq() and dyntick_nmi() code to run atomically
> - * with respect to dyntick_nohz(), but still allows dyntick_irq() and
> - * dyntick_nmi() to be interleaved with other processes.
> - */
> -
> -#define EXECUTE_MAINLINE(label, stmt) \
> -label: skip; \
> -		atomic { \
> -			if \
> -			:: in_dyntick_irq || in_dyntick_nmi -> goto label; \
> -			:: else -> stmt; \
> -			fi; \
> -		} \
> -
> -/*
> - * Validation code for the rcu_enter_nohz() and rcu_exit_nohz()
> - * functions.  Each pass through this process's loop corresponds
> - * to exiting nohz mode, then re-entering it.  The old_gp_idle
> - * variable is used to verify that grace_period() does not incorrectly
> - * advance while this process is not in nohz mode.  This code also
> - * includes assertions corresponding to the WARN_ON() calls in
> - * rcu_exit_nohz() and rcu_enter_nohz().
> - */
> -
> -proctype dyntick_nohz()
> -{
> -	byte tmp;
> -	byte i = 0;
> -	bit old_gp_idle;
> -
> -	do
> -	:: i >= MAX_DYNTICK_LOOP_NOHZ -> break;
> -	:: i < MAX_DYNTICK_LOOP_NOHZ ->
> -
> -		/*
> -		 * The following corresponds to rcu_exit_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		EXECUTE_MAINLINE(stmt1, tmp = dynticks_progress_counter)
> -		EXECUTE_MAINLINE(stmt2, dynticks_progress_counter = tmp + 1; old_gp_idle = (grace_period_state == GP_IDLE); assert((dynticks_progress_counter & 1) == 1))
> -
> -		/*
> -		 * The following corresponds to rcu_enter_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		EXECUTE_MAINLINE(stmt3, tmp = dynticks_progress_counter; assert(!old_gp_idle || grace_period_state != GP_DONE))
> -		EXECUTE_MAINLINE(stmt4, dynticks_progress_counter = tmp + 1; assert((dynticks_progress_counter & 1) == 0))
> -		i++;
> -	od;
> -	dyntick_nohz_done = 1;
> -}
> -
> -/*
> - * Macro that allows dyntick_nmi() code to run atomically with respect
> - * to dyntick_irq(), but still allows dyntick_nmi() to be interleaved
> - * with other processes.  This macro must be used when accessing
> - * external state, but statements that access state that is purely
> - * local to dyntick_irq() can be permitted to run in parallel with
> - * dyntick_nmi().  In addition, global state that is shared only
> - * with dyntick_nohz() may also be modified even when dyntick_nmi()
> - * is running.
> - */
> -
> -#define EXECUTE_IRQ(label, stmt) \
> -label: skip; \
> -		atomic { \
> -			if \
> -			:: in_dyntick_nmi -> goto label; \
> -			:: else -> stmt; \
> -			fi; \
> -		} \
> -
> -/*
> - * Validation code corresponding to rcu_irq_enter() and rcu_irq_exit().
> - */
> -
> -proctype dyntick_irq()
> -{
> -	byte tmp;
> -	byte i = 0;
> -	byte j = 0;
> -	bit old_gp_idle;
> -	bit outermost;
> -
> -	do
> -	:: i >= MAX_DYNTICK_LOOP_IRQ && j >= MAX_DYNTICK_LOOP_IRQ -> break;
> -	:: i < MAX_DYNTICK_LOOP_IRQ ->
> -
> -		/* Tell dyntick_nohz() that we are in interrupt handler. */
> -
> -		atomic {
> -			outermost = (in_dyntick_irq == 0);
> -			in_dyntick_irq = 1;
> -		}
> -
> -		/* Validation code corresponding to rcu_irq_enter(). */
> -
> -stmt1: skip;
> -		atomic {
> -			if
> -			:: in_dyntick_nmi -> goto stmt1;
> -			:: !in_dyntick_nmi && rcu_update_flag ->
> -				goto stmt1_then;
> -			:: else -> goto stmt1_else;
> -			fi;
> -		}
> -stmt1_then: skip;
> -		EXECUTE_IRQ(stmt1_1, tmp = rcu_update_flag)
> -		EXECUTE_IRQ(stmt1_2, rcu_update_flag = tmp + 1)
> -stmt1_else: skip;
> -stmt2: skip;	atomic {
> -			if
> -			:: in_dyntick_nmi -> goto stmt2;
> -			:: !in_dyntick_nmi &&
> -			   !in_interrupt &&
> -			   (dynticks_progress_counter & 1) == 0 ->
> -			   	goto stmt2_then;
> -			:: else -> goto stmt2_else;
> -			fi;
> -		}
> -stmt2_then: skip;
> -		EXECUTE_IRQ(stmt2_1, tmp = dynticks_progress_counter)
> -		EXECUTE_IRQ(stmt2_2, dynticks_progress_counter = tmp + 1)
> -		EXECUTE_IRQ(stmt2_3, tmp = rcu_update_flag)
> -		EXECUTE_IRQ(stmt2_4, rcu_update_flag = tmp + 1)
> -stmt2_else: skip;
> -
> -		/* 
> -		 * And a snippet from __irq_enter() corresponding to
> -		 * the add_preempt_count().
> -		 */
> -
> -		EXECUTE_IRQ(stmt3, tmp = in_interrupt)
> -		EXECUTE_IRQ(stmt4, in_interrupt = tmp + 1)
> -
> -		/* Capture state to see if grace_period() is behaving. */
> -
> -stmt5: skip;
> -		atomic {
> -			if
> -			:: in_dyntick_nmi -> goto stmt4;
> -			:: !in_dyntick_nmi && outermost ->
> -				old_gp_idle = (grace_period_state == GP_IDLE);
> -			:: else -> skip;
> -			fi;
> -		}
> -
> -		/* Count the entry for termination and nesting. */
> -
> -		i++;
> -
> -	/* Note that we cannot exit a handler we have not yet entered! */
> -
> -	:: j < i ->
> -
> -		/* See if we can catch grace_period() misbehaving. */
> -
> -stmt6: skip;
> -		atomic {
> -			if
> -			:: in_dyntick_nmi -> goto stmt6;
> -			:: !in_dyntick_nmi && j + 1 == i ->
> -				assert(!old_gp_idle ||
> -				       grace_period_state != GP_DONE);
> -			:: else -> skip;
> -			fi;
> -		}
> -
> -		/*
> -		 * Validation code corresponding to the sub_preempt_count()
> -		 * in __irq_exit().
> -		 */
> -
> -		EXECUTE_IRQ(stmt7, tmp = in_interrupt);
> -		EXECUTE_IRQ(stmt8, in_interrupt = tmp - 1);
> -
> -		/* Validation code corresponding to rcu_irq_exit(). */
> -
> -stmt9: skip;
> -		atomic {
> -			if
> -			:: in_dyntick_nmi -> goto stmt9;
> -			:: !in_dyntick_nmi && rcu_update_flag != 0 ->
> -				goto stmt9_then;
> -			:: else -> goto stmt9_else;
> -			fi;
> -		}
> -stmt9_then: skip;
> -		EXECUTE_IRQ(stmt9_1, tmp = rcu_update_flag)
> -		EXECUTE_IRQ(stmt9_2, rcu_update_flag = tmp - 1)
> -stmt9_3: skip;
> -		atomic {
> -			if
> -			:: in_dyntick_nmi -> goto stmt9_3;
> -			:: !in_dyntick_nmi && rcu_update_flag == 0 ->
> -				goto stmt9_3_then;
> -			:: else -> goto stmt9_3_else;
> -			fi;
> -		}
> -stmt9_3_then: skip;
> -		EXECUTE_IRQ(stmt9_3_1, tmp = dynticks_progress_counter)
> -		EXECUTE_IRQ(stmt9_3_2, dynticks_progress_counter = tmp + 1)
> -stmt9_3_else:
> -stmt9_else: skip;
> -
> -		/*
> -		 * Count the exit and let dyntick_nohz() know if we
> -		 * have completely exited a nested set of interrupts.
> -		 */
> -
> -		atomic {
> -			j++;
> -			in_dyntick_irq = (i != j);
> -		}
> -	od;
> -	dyntick_irq_done = 1;
> -}
> -
> -/*
> - * Validation code corresponding to rcu_irq_enter() and rcu_irq_exit().
> - * Similar to dyntick_irq(), but done atomically.  This is a bit of
> - * a cheat, since the code would not really be atomic with respect
> - * to grace_period(), but one step at a time.
> - */
> -
> -proctype dyntick_nmi()
> -{
> -	byte tmp;
> -	byte i = 0;
> -	bit old_gp_idle;
> -
> -	do
> -	:: i >= MAX_DYNTICK_LOOP_NMI -> break;
> -	:: i < MAX_DYNTICK_LOOP_NMI ->
> -
> -		/* Tell dyntick_nohz() that we are in interrupt handler. */
> -
> -		in_dyntick_nmi = 1;
> -
> -		/* Validation code corresponding to rcu_irq_enter(). */
> -
> -		if
> -		:: rcu_update_flag > 0 ->
> -			tmp = rcu_update_flag;
> -			rcu_update_flag = tmp + 1;
> -		:: else -> skip;
> -		fi;
> -		if
> -		:: !in_interrupt && (dynticks_progress_counter & 1) == 0 ->
> -			tmp = dynticks_progress_counter;
> -			dynticks_progress_counter = tmp + 1;
> -			tmp = rcu_update_flag;
> -			rcu_update_flag = tmp + 1;
> -		:: else -> skip;
> -		fi;
> -
> -		/* 
> -		 * And a snippet from __irq_enter() corresponding to
> -		 * the add_preempt_count().
> -		 */
> -
> -		tmp = in_interrupt;
> -		in_interrupt = tmp + 1;
> -
> -		/* Capture state to see if grace_period() is behaving. */
> -
> -		old_gp_idle = (grace_period_state == GP_IDLE);
> -
> -		/* See if we can catch grace_period() misbehaving. */
> -
> -		assert(!old_gp_idle || grace_period_state != GP_DONE);
> -
> -		/*
> -		 * Validation code corresponding to the sub_preempt_count()
> -		 * in __irq_exit().
> -		 */
> -
> -		tmp = in_interrupt;
> -		in_interrupt = tmp - 1;
> -
> -		/* Validation code corresponding to rcu_irq_exit(). */
> -
> -		if
> -		:: rcu_update_flag != 0 ->
> -			tmp = rcu_update_flag;
> -			rcu_update_flag = tmp - 1;
> -			if
> -			:: rcu_update_flag == 0 ->
> -				tmp = dynticks_progress_counter;
> -				dynticks_progress_counter = tmp + 1;
> -			:: else -> skip;
> -			fi;
> -		:: else -> skip;
> -		fi;
> -
> -		/*
> -		 * Count the exit and let dyntick_irq() and dyntick_nohz()
> -		 * know that we have exited the NMI.
> -		 */
> -
> -		atomic {
> -			i++;
> -			in_dyntick_nmi = 0;
> -		}
> -	od;
> -	dyntick_nmi_done = 1;
> -}
> -
> -init {
> -	atomic {
> -		run dyntick_nohz();
> -		run dyntick_irq();
> -		run dyntick_nmi();
> -		run grace_period();
> -	}
> -}
> diff --git a/CodeSamples/appendix/formal/dyntickRCU-irq-ssl.spin b/CodeSamples/appendix/formal/dyntickRCU-irq-ssl.spin
> deleted file mode 100644
> index 43ba53b..0000000
> --- a/CodeSamples/appendix/formal/dyntickRCU-irq-ssl.spin
> +++ /dev/null
> @@ -1,356 +0,0 @@
> -/*
> - * Tests a variation of RCU-dyntick interaction in the Linux 2.6.25-rc4
> - * kernel.  Note that portions of this are derived from Linux kernel code,
> - * portions of which are licensed under a GPLv2-only license.
> - *
> - * This version omits NMI handlers.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, you can access it online at
> - * http://www.gnu.org/licenses/gpl-2.0.html.
> - *
> - * Copyright (c) 2008 IBM Corporation.
> - */
> -
> -/*
> - * Parameters:
> - *
> - * MAX_DYNTICK_LOOP_NOHZ: The number of non-idle process level bursts
> - *	of work.
> - * MAX_DYNTICK_LOOP_IRQ: The number of interrupts (possibly arbitrarily
> - *	nested) to be received.
> - *
> - * Setting a given value for a given parameter covers all values up to
> - * and including the specified value.  So, if MAX_DYNTICK_LOOP_IRQ is
> - * set to "2", then the validation will cover 0, 1, and 2 interrupts,
> - * arbitrarily nested.
> - */
> -
> -#define MAX_DYNTICK_LOOP_NOHZ 3
> -#define MAX_DYNTICK_LOOP_IRQ 3
> -
> -/* Variables corresponding to the 2.6.25-rc4 per-CPU variables. */
> -
> -byte dynticks_progress_counter = 0;
> -byte rcu_update_flag = 0;
> -byte in_interrupt = 0;
> -
> -/* Set when IRQ code is running, to allow mainline code to lock itself out. */
> -
> -bit in_dyntick_irq = 0;
> -
> -/*
> - * The grace_period() process uses this to track its progress through
> - * each phase, thus allowing the other processes to make sure that
> - * grace_period() does not advance prematurely.
> - */
> -
> -#define GP_IDLE		0
> -#define GP_WAITING	1
> -#define GP_DONE		2
> -byte grace_period_state = GP_DONE;
> -
> -/*
> - * The following variables mark completion of the corresponding processes.
> - * This is used in grace_period() to check forward progress guarantees.
> - */
> -
> -bit dyntick_nohz_done = 0;
> -bit dyntick_irq_done = 0;
> -
> -/*
> - * Validation code for the slice of the preemptible-RCU code that
> - * interacts with the dynticks subsystem.  This is set up to match
> - * the code in 2.6.25-rc4, namely dyntick_save_progress_counter(),
> - * rcu_try_flip_waitack_needed(), rcu_try_flip_waitmb_needed(),
> - * and portions of rcu_try_flip_waitack() and rcu_try_flip_waitmb().
> - *
> - * This code verifies forward progress: once all of the other processes
> - * have terminated, the grace_period() code must not block.  In addition,
> - * this code maintains a progress indicator in the grace_period_state
> - * variable.  It is an error for grace_period() to advance from GP_IDLE
> - * to GP_DONE unless all the other processes are simultaneously in nohz
> - * mode at some point during the transition.
> - */
> -
> -proctype grace_period()
> -{
> -	byte curr;
> -	byte snap;
> -	bit shouldexit;
> -
> -	/*
> -	 * A little code from rcu_try_flip_idle() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  The shouldexit variable is for the
> -	 * later liveness checks.  As noted earlier, the
> -	 * grace_period_state variable allows the other processes
> -	 * to scream if we jump the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		printf("MAX_DYNTICK_LOOP_NOHZ = %d\n", MAX_DYNTICK_LOOP_NOHZ);
> -		printf("MAX_DYNTICK_LOOP_IRQ = %d\n", MAX_DYNTICK_LOOP_IRQ);
> -		shouldexit = 0;
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitack()
> -	 * and its call to rcu_try_flip_waitack_needed().  The shouldexit
> -	 * check ensures that we scream if we cannot immediately exit
> -	 * the loop after all other proceses have completed.
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			assert(!shouldexit);
> -			shouldexit = dyntick_nohz_done && dyntick_irq_done;
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr - snap) >= 2 || (curr & 1) == 0 ->
> -				break;
> -			:: else -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -
> -	/*
> -	 * A little code from rcu_try_flip_waitzero() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  The shouldexit variable is for the
> -	 * later liveness checks.  As noted earlier, the
> -	 * grace_period_state variable allows the other processes
> -	 * to scream if we jump the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		shouldexit = 0;
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitmb()
> -	 * and its call to rcu_try_flip_waitmb_needed().  The shouldexit
> -	 * check again ensures that we scream if we cannot immediately exit
> -	 * the loop after all other proceses have completed.
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			assert(!shouldexit);
> -			shouldexit = dyntick_nohz_done && dyntick_irq_done;
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr != snap) || ((curr & 1) == 0) ->
> -				break;
> -			:: else -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -}
> -
> -/*
> - * Macro that allows dyntick_irq() code to run atomically with respect
> - * to dyntick_nohz(), but still allows dyntick_irq() to be interleaved
> - * with other processes.
> - */
> -
> -#define EXECUTE_MAINLINE(label, stmt) \
> -label: skip; \
> -		atomic { \
> -			if \
> -			:: in_dyntick_irq -> goto label; \
> -			:: else -> stmt; \
> -			fi; \
> -		} \
> -
> -/*
> - * Validation code for the rcu_enter_nohz() and rcu_exit_nohz()
> - * functions.  Each pass through this process's loop corresponds
> - * to exiting nohz mode, then re-entering it.  The old_gp_idle
> - * variable is used to verify that grace_period() does not incorrectly
> - * advance while this process is not in nohz mode.  This code also
> - * includes assertions corresponding to the WARN_ON() calls in
> - * rcu_exit_nohz() and rcu_enter_nohz().
> - */
> -
> -proctype dyntick_nohz()
> -{
> -	byte tmp;
> -	byte i = 0;
> -	bit old_gp_idle;
> -
> -	do
> -	:: i >= MAX_DYNTICK_LOOP_NOHZ -> break;
> -	:: i < MAX_DYNTICK_LOOP_NOHZ ->
> -
> -		/*
> -		 * The following corresponds to rcu_exit_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		EXECUTE_MAINLINE(stmt1, tmp = dynticks_progress_counter)
> -		EXECUTE_MAINLINE(stmt2,
> -				 dynticks_progress_counter = tmp + 1;
> -				 old_gp_idle = (grace_period_state == GP_IDLE);
> -				 assert((dynticks_progress_counter & 1) == 1))
> -
> -		/*
> -		 * The following corresponds to rcu_enter_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		EXECUTE_MAINLINE(stmt3,
> -			tmp = dynticks_progress_counter;
> -			assert(!old_gp_idle || grace_period_state != GP_DONE))
> -		EXECUTE_MAINLINE(stmt4,
> -			dynticks_progress_counter = tmp + 1;
> -			assert((dynticks_progress_counter & 1) == 0))
> -		i++;
> -	od;
> -	dyntick_nohz_done = 1;
> -}
> -
> -/*
> - * Validation code corresponding to rcu_irq_enter() and rcu_irq_exit().
> - */
> -
> -proctype dyntick_irq()
> -{
> -	byte tmp;
> -	byte i = 0;
> -	byte j = 0;
> -	bit old_gp_idle;
> -	bit outermost;
> -
> -	do
> -	:: i >= MAX_DYNTICK_LOOP_IRQ && j >= MAX_DYNTICK_LOOP_IRQ -> break;
> -	:: i < MAX_DYNTICK_LOOP_IRQ ->
> -
> -		/* Tell dyntick_nohz() that we are in interrupt handler. */
> -
> -		atomic {
> -			outermost = (in_dyntick_irq == 0);
> -			in_dyntick_irq = 1;
> -		}
> -
> -		/* Validation code corresponding to rcu_irq_enter(). */
> -
> -		if
> -		:: rcu_update_flag > 0 ->
> -			tmp = rcu_update_flag;
> -			rcu_update_flag = tmp + 1;
> -		:: else -> skip;
> -		fi;
> -		if
> -		:: !in_interrupt && (dynticks_progress_counter & 1) == 0 ->
> -			tmp = dynticks_progress_counter;
> -			dynticks_progress_counter = tmp + 1;
> -			tmp = rcu_update_flag;
> -			rcu_update_flag = tmp + 1;
> -		:: else -> skip;
> -		fi;
> -
> -		/* 
> -		 * And a snippet from __irq_enter() corresponding to
> -		 * the add_preempt_count().
> -		 */
> -
> -		tmp = in_interrupt;
> -		in_interrupt = tmp + 1;
> -
> -		/* Capture state to see if grace_period() is behaving. */
> -
> -		atomic {
> -			if
> -			:: outermost ->
> -				old_gp_idle = (grace_period_state == GP_IDLE);
> -			:: else -> skip;
> -			fi;
> -		}
> -
> -		/* Count the entry for termination and nesting. */
> -
> -		i++;
> -
> -	/* Note that we cannot exit a handler we have not yet entered! */
> -
> -	:: j < i ->
> -
> -		/* See if we can catch grace_period() misbehaving. */
> -
> -		atomic {
> -			if
> -			:: j + 1 == i ->
> -				assert(!old_gp_idle ||
> -				       grace_period_state != GP_DONE);
> -			:: else -> skip;
> -			fi;
> -		}
> -
> -		/*
> -		 * Validation code corresponding to the sub_preempt_count()
> -		 * in __irq_exit().
> -		 */
> -
> -		tmp = in_interrupt;
> -		in_interrupt = tmp - 1;
> -
> -		/* Validation code corresponding to rcu_irq_exit(). */
> -
> -		if
> -		:: rcu_update_flag != 0 ->
> -			tmp = rcu_update_flag;
> -			rcu_update_flag = tmp - 1;
> -			if
> -			:: rcu_update_flag == 0 ->
> -				tmp = dynticks_progress_counter;
> -				dynticks_progress_counter = tmp + 1;
> -			:: else -> skip;
> -			fi;
> -		:: else -> skip;
> -		fi;
> -
> -		/*
> -		 * Count the exit and let dyntick_nohz() know if we
> -		 * have completely exited a nested set of interrupts.
> -		 */
> -
> -		atomic {
> -			j++;
> -			in_dyntick_irq = (i != j);
> -		}
> -	od;
> -	dyntick_irq_done = 1;
> -}
> -
> -init {
> -	atomic {
> -		run dyntick_nohz();
> -		run dyntick_irq();
> -		run grace_period();
> -	}
> -}
> diff --git a/CodeSamples/appendix/formal/dyntickRCU-irqnn-ssl.spin b/CodeSamples/appendix/formal/dyntickRCU-irqnn-ssl.spin
> deleted file mode 100644
> index 8157a9f..0000000
> --- a/CodeSamples/appendix/formal/dyntickRCU-irqnn-ssl.spin
> +++ /dev/null
> @@ -1,330 +0,0 @@
> -/*
> - * Tests a variation of RCU-dyntick interaction in the Linux 2.6.25-rc4
> - * kernel.  Note that portions of this are derived from Linux kernel code,
> - * portions of which are licensed under a GPLv2-only license.
> - *
> - * This version omits NMI handlers, and disallows nested irq handlers.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, you can access it online at
> - * http://www.gnu.org/licenses/gpl-2.0.html.
> - *
> - * Copyright (c) 2008 IBM Corporation.
> - */
> -
> -/*
> - * Parameters:
> - *
> - * MAX_DYNTICK_LOOP_NOHZ: The number of non-idle process level bursts
> - *	of work.
> - * MAX_DYNTICK_LOOP_IRQ: The number of interrupts (possibly arbitrarily
> - *	nested) to be received.
> - *
> - * Setting a given value for a given parameter covers all values up to
> - * and including the specified value.  So, if MAX_DYNTICK_LOOP_IRQ is
> - * set to "2", then the validation will cover 0, 1, and 2 interrupts.
> - */
> -
> -#define MAX_DYNTICK_LOOP_NOHZ 3
> -#define MAX_DYNTICK_LOOP_IRQ 3
> -
> -/* Variables corresponding to the 2.6.25-rc4 per-CPU variables. */
> -
> -byte dynticks_progress_counter = 0;
> -byte rcu_update_flag = 0;
> -byte in_interrupt = 0;
> -
> -/* Set when IRQ code is running, to allow mainline code to lock itself out. */
> -
> -bit in_dyntick_irq = 0;
> -
> -/*
> - * The grace_period() process uses this to track its progress through
> - * each phase, thus allowing the other processes to make sure that
> - * grace_period() does not advance prematurely.
> - */
> -
> -#define GP_IDLE		0
> -#define GP_WAITING	1
> -#define GP_DONE		2
> -byte grace_period_state = GP_DONE;
> -
> -/*
> - * The following variables mark completion of the corresponding processes.
> - * This is used in grace_period() to check forward progress guarantees.
> - */
> -
> -bit dyntick_nohz_done = 0;
> -bit dyntick_irq_done = 0;
> -
> -/*
> - * Validation code for the slice of the preemptible-RCU code that
> - * interacts with the dynticks subsystem.  This is set up to match
> - * the code in 2.6.25-rc4, namely dyntick_save_progress_counter(),
> - * rcu_try_flip_waitack_needed(), rcu_try_flip_waitmb_needed(),
> - * and portions of rcu_try_flip_waitack() and rcu_try_flip_waitmb().
> - *
> - * This code verifies forward progress: once all of the other processes
> - * have terminated, the grace_period() code must not block.  In addition,
> - * this code maintains a progress indicator in the grace_period_state
> - * variable.  It is an error for grace_period() to advance from GP_IDLE
> - * to GP_DONE unless all the other processes are simultaneously in nohz
> - * mode at some point during the transition.
> - */
> -
> -proctype grace_period()
> -{
> -	byte curr;
> -	byte snap;
> -	bit shouldexit;
> -
> -	/*
> -	 * A little code from rcu_try_flip_idle() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  The shouldexit variable is for the
> -	 * later liveness checks.  As noted earlier, the
> -	 * grace_period_state variable allows the other processes
> -	 * to scream if we jump the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		printf("MAX_DYNTICK_LOOP_NOHZ = %d\n", MAX_DYNTICK_LOOP_NOHZ);
> -		printf("MAX_DYNTICK_LOOP_IRQ = %d\n", MAX_DYNTICK_LOOP_IRQ);
> -		shouldexit = 0;
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitack()
> -	 * and its call to rcu_try_flip_waitack_needed().  The shouldexit
> -	 * check ensures that we scream if we cannot immediately exit
> -	 * the loop after all other proceses have completed.
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			assert(!shouldexit);
> -			shouldexit = dyntick_nohz_done && dyntick_irq_done;
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr - snap) >= 2 || (curr & 1) == 0 ->
> -				break;
> -			:: else -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -
> -	/*
> -	 * A little code from rcu_try_flip_waitzero() and its call
> -	 * to dyntick_save_progress_counter(), plus a bunch of
> -	 * validation code.  The shouldexit variable is for the
> -	 * later liveness checks.  As noted earlier, the
> -	 * grace_period_state variable allows the other processes
> -	 * to scream if we jump the gun here.
> -	 */
> -
> -	grace_period_state = GP_IDLE;
> -	atomic {
> -		shouldexit = 0;
> -		snap = dynticks_progress_counter;
> -		grace_period_state = GP_WAITING;
> -	}
> -
> -	/*
> -	 * Each pass through the following loop corresponds to an
> -	 * invocation of the scheduling-clock interrupt handler,
> -	 * specifically a little code from rcu_try_flip_waitmb()
> -	 * and its call to rcu_try_flip_waitmb_needed().  The shouldexit
> -	 * check again ensures that we scream if we cannot immediately exit
> -	 * the loop after all other proceses have completed.
> -	 */
> -
> -	do
> -	:: 1 ->
> -		atomic {
> -			assert(!shouldexit);
> -			shouldexit = dyntick_nohz_done && dyntick_irq_done;
> -			curr = dynticks_progress_counter;
> -			if
> -			:: (curr != snap) || ((curr & 1) == 0) ->
> -				break;
> -			:: else -> skip;
> -			fi;
> -		}
> -	od;
> -	grace_period_state = GP_DONE;
> -}
> -
> -/*
> - * Macro that allows dyntick_irq() code to run atomically with respect
> - * to dyntick_nohz(), but still allows dyntick_irq() to be interleaved
> - * with other processes.
> - */
> -
> -#define EXECUTE_MAINLINE(label, stmt) \
> -label: skip; \
> -		atomic { \
> -			if \
> -			:: in_dyntick_irq -> goto label; \
> -			:: else -> stmt; \
> -			fi; \
> -		} \
> -
> -/*
> - * Validation code for the rcu_enter_nohz() and rcu_exit_nohz()
> - * functions.  Each pass through this process's loop corresponds
> - * to exiting nohz mode, then re-entering it.  The old_gp_idle
> - * variable is used to verify that grace_period() does not incorrectly
> - * advance while this process is not in nohz mode.  This code also
> - * includes assertions corresponding to the WARN_ON() calls in
> - * rcu_exit_nohz() and rcu_enter_nohz().
> - */
> -
> -proctype dyntick_nohz()
> -{
> -	byte tmp;
> -	byte i = 0;
> -	bit old_gp_idle;
> -
> -	do
> -	:: i >= MAX_DYNTICK_LOOP_NOHZ -> break;
> -	:: i < MAX_DYNTICK_LOOP_NOHZ ->
> -
> -		/*
> -		 * The following corresponds to rcu_exit_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		EXECUTE_MAINLINE(stmt1, tmp = dynticks_progress_counter)
> -		EXECUTE_MAINLINE(stmt2,
> -				 dynticks_progress_counter = tmp + 1;
> -				 old_gp_idle = (grace_period_state == GP_IDLE);
> -				 assert((dynticks_progress_counter & 1) == 1))
> -
> -		/*
> -		 * The following corresponds to rcu_enter_nohz(), along
> -		 * with code to check for grace_period() jumping the gun.
> -		 */
> -
> -		EXECUTE_MAINLINE(stmt3,
> -			tmp = dynticks_progress_counter;
> -			assert(!old_gp_idle || grace_period_state != GP_DONE))
> -		EXECUTE_MAINLINE(stmt4,
> -			dynticks_progress_counter = tmp + 1;
> -			assert((dynticks_progress_counter & 1) == 0))
> -		i++;
> -	od;
> -	dyntick_nohz_done = 1;
> -}
> -
> -/*
> - * Validation code corresponding to rcu_irq_enter() and rcu_irq_exit().
> - */
> -
> -proctype dyntick_irq()
> -{
> -	byte tmp;
> -	byte i = 0;
> -	bit old_gp_idle;
> -
> -	do
> -	:: i >= MAX_DYNTICK_LOOP_IRQ -> break;
> -	:: i < MAX_DYNTICK_LOOP_IRQ ->
> -
> -		/* Tell dyntick_nohz() that we are in interrupt handler. */
> -
> -		in_dyntick_irq = 1;
> -
> -		/* Validation code corresponding to rcu_irq_enter(). */
> -
> -		if
> -		:: rcu_update_flag > 0 ->
> -			tmp = rcu_update_flag;
> -			rcu_update_flag = tmp + 1;
> -		:: else -> skip;
> -		fi;
> -		if
> -		:: !in_interrupt && (dynticks_progress_counter & 1) == 0 ->
> -			tmp = dynticks_progress_counter;
> -			dynticks_progress_counter = tmp + 1;
> -			tmp = rcu_update_flag;
> -			rcu_update_flag = tmp + 1;
> -		:: else -> skip;
> -		fi;
> -
> -		/* 
> -		 * And a snippet from __irq_enter() corresponding to
> -		 * the add_preempt_count().
> -		 */
> -
> -		tmp = in_interrupt;
> -		in_interrupt = tmp + 1;
> -
> -		/* Capture state to see if grace_period() is behaving. */
> -
> -		old_gp_idle = (grace_period_state == GP_IDLE);
> -
> -		/* See if we can catch grace_period() misbehaving. */
> -
> -		assert(!old_gp_idle || grace_period_state != GP_DONE);
> -
> -		/*
> -		 * Validation code corresponding to the sub_preempt_count()
> -		 * in __irq_exit().
> -		 */
> -
> -		tmp = in_interrupt;
> -		in_interrupt = tmp - 1;
> -
> -		/* Validation code corresponding to rcu_irq_exit(). */
> -
> -		if
> -		:: rcu_update_flag != 0 ->
> -			tmp = rcu_update_flag;
> -			rcu_update_flag = tmp - 1;
> -			if
> -			:: rcu_update_flag == 0 ->
> -				tmp = dynticks_progress_counter;
> -				dynticks_progress_counter = tmp + 1;
> -			:: else -> skip;
> -			fi;
> -		:: else -> skip;
> -		fi;
> -
> -		/*
> -		 * Count the exit and let dyntick_nohz() know if we
> -		 * have completely exited a nested set of interrupts.
> -		 * Count the irq handler for termination. */
> -		 */
> -
> -		atomic {
> -			in_dyntick_irq = 0;
> -			i++;
> -		}
> -	od;
> -	dyntick_irq_done = 1;
> -}
> -
> -init {
> -	atomic {
> -		run dyntick_nohz();
> -		run dyntick_irq();
> -		run grace_period();
> -	}
> -}
> diff --git a/CodeSamples/appendix/formal/dyntickRCUtarball.sh b/CodeSamples/appendix/formal/dyntickRCUtarball.sh
> deleted file mode 100644
> index ee6b104..0000000
> --- a/CodeSamples/appendix/formal/dyntickRCUtarball.sh
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -rm -rf dyntickRCU
> -mkdir dyntickRCU
> -cp	dyntickRCU-base-sl-busted.spin.trail.txt \
> -	dyntickRCU-base-s.spin \
> -	dyntickRCU-irq-ssl.spin \
> -	RCUpreemptStates.fig \
> -	dyntickRCU-irqnn-ssl.spin \
> -	dyntickRCU-irq-nmi-ssl.spin \
> -	runspin.sh \
> -	dyntickRCU-base-sl.spin \
> -	dyntickRCU-base-sl-busted.spin.trail \
> -	dyntickRCU-base-sl-busted.spin \
> -	RCUpreemptStates.png \
> -	dyntickRCU-base.spin \
> -	RCUpreemptStates.eps \
> -	dyntickRCU.$1.html \
> -	dyntickRCU
> -tar -czf dyntickRCU.$1.tgz dyntickRCU
> diff --git a/CodeSamples/appendix/formal/runspin.sh b/CodeSamples/appendix/formal/runspin.sh
> deleted file mode 100644
> index 0978f4c..0000000
> --- a/CodeSamples/appendix/formal/runspin.sh
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -#!/bin/sh
> -#
> -# Run a test.  Specify the test type as the first argument, for example:
> -#
> -#	sh runtest.sh base
> -#
> -# will run the "dyntickRCU-base.spin model".  Be sure to edit the
> -# MAX_DYNTICK_LOOP_* parameters as needed to fit your needs and
> -# memory size.
> -#
> -# This program is free software; you can redistribute it and/or modify
> -# it under the terms of the GNU General Public License as published by
> -# the Free Software Foundation; either version 2 of the License, or
> -# (at your option) any later version.
> -#
> -# This program is distributed in the hope that it will be useful,
> -# but WITHOUT ANY WARRANTY; without even the implied warranty of
> -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -# GNU General Public License for more details.
> -#
> -# You should have received a copy of the GNU General Public License
> -# along with this program; if not, you can access it online at
> -# http://www.gnu.org/licenses/gpl-2.0.html.
> -#
> -# Copyright (c) 2008 Paul E. McKenney, IBM Corporation.
> -
> -type=${1-irq-nmi-ssl}
> -spin -a dyntickRCU-$type.spin
> -cc -DSAFETY -o pan pan.c
> -grep '^#.*DYN' dyntickRCU-$type.spin
> -./pan
> diff --git a/CodeSamples/analysis/promela/.gitignore b/CodeSamples/formal/promela/.gitignore
> similarity index 100%
> rename from CodeSamples/analysis/promela/.gitignore
> rename to CodeSamples/formal/promela/.gitignore
> diff --git a/CodeSamples/analysis/promela/atomicincrement.spin b/CodeSamples/formal/promela/atomicincrement.spin
> similarity index 100%
> rename from CodeSamples/analysis/promela/atomicincrement.spin
> rename to CodeSamples/formal/promela/atomicincrement.spin
> diff --git a/CodeSamples/appendix/formal/.gitignore b/CodeSamples/formal/promela/dyntick/.gitignore
> similarity index 100%
> rename from CodeSamples/appendix/formal/.gitignore
> rename to CodeSamples/formal/promela/dyntick/.gitignore
> diff --git a/CodeSamples/analysis/promela/dyntick/dyntickRCU-base-s.spin b/CodeSamples/formal/promela/dyntick/dyntickRCU-base-s.spin
> similarity index 100%
> rename from CodeSamples/analysis/promela/dyntick/dyntickRCU-base-s.spin
> rename to CodeSamples/formal/promela/dyntick/dyntickRCU-base-s.spin
> diff --git a/CodeSamples/analysis/promela/dyntick/dyntickRCU-base-sl-busted.spin b/CodeSamples/formal/promela/dyntick/dyntickRCU-base-sl-busted.spin
> similarity index 100%
> rename from CodeSamples/analysis/promela/dyntick/dyntickRCU-base-sl-busted.spin
> rename to CodeSamples/formal/promela/dyntick/dyntickRCU-base-sl-busted.spin
> diff --git a/CodeSamples/appendix/formal/dyntickRCU-base-sl-busted.spin.trail.txt b/CodeSamples/formal/promela/dyntick/dyntickRCU-base-sl-busted.spin.trail.txt
> similarity index 100%
> rename from CodeSamples/appendix/formal/dyntickRCU-base-sl-busted.spin.trail.txt
> rename to CodeSamples/formal/promela/dyntick/dyntickRCU-base-sl-busted.spin.trail.txt
> diff --git a/CodeSamples/analysis/promela/dyntick/dyntickRCU-base-sl.spin b/CodeSamples/formal/promela/dyntick/dyntickRCU-base-sl.spin
> similarity index 100%
> rename from CodeSamples/analysis/promela/dyntick/dyntickRCU-base-sl.spin
> rename to CodeSamples/formal/promela/dyntick/dyntickRCU-base-sl.spin
> diff --git a/CodeSamples/analysis/promela/dyntick/dyntickRCU-base.spin b/CodeSamples/formal/promela/dyntick/dyntickRCU-base.spin
> similarity index 100%
> rename from CodeSamples/analysis/promela/dyntick/dyntickRCU-base.spin
> rename to CodeSamples/formal/promela/dyntick/dyntickRCU-base.spin
> diff --git a/CodeSamples/analysis/promela/dyntick/dyntickRCU-irq-nmi-ssl.spin b/CodeSamples/formal/promela/dyntick/dyntickRCU-irq-nmi-ssl.spin
> similarity index 100%
> rename from CodeSamples/analysis/promela/dyntick/dyntickRCU-irq-nmi-ssl.spin
> rename to CodeSamples/formal/promela/dyntick/dyntickRCU-irq-nmi-ssl.spin
> diff --git a/CodeSamples/analysis/promela/dyntick/dyntickRCU-irq-ssl.spin b/CodeSamples/formal/promela/dyntick/dyntickRCU-irq-ssl.spin
> similarity index 100%
> rename from CodeSamples/analysis/promela/dyntick/dyntickRCU-irq-ssl.spin
> rename to CodeSamples/formal/promela/dyntick/dyntickRCU-irq-ssl.spin
> diff --git a/CodeSamples/analysis/promela/dyntick/dyntickRCU-irqnn-ssl.spin b/CodeSamples/formal/promela/dyntick/dyntickRCU-irqnn-ssl.spin
> similarity index 100%
> rename from CodeSamples/analysis/promela/dyntick/dyntickRCU-irqnn-ssl.spin
> rename to CodeSamples/formal/promela/dyntick/dyntickRCU-irqnn-ssl.spin
> diff --git a/CodeSamples/analysis/promela/dyntick/dyntickRCUtarball.sh b/CodeSamples/formal/promela/dyntick/dyntickRCUtarball.sh
> similarity index 100%
> rename from CodeSamples/analysis/promela/dyntick/dyntickRCUtarball.sh
> rename to CodeSamples/formal/promela/dyntick/dyntickRCUtarball.sh
> diff --git a/CodeSamples/analysis/promela/dyntick/runspin.sh b/CodeSamples/formal/promela/dyntick/runspin.sh
> similarity index 100%
> rename from CodeSamples/analysis/promela/dyntick/runspin.sh
> rename to CodeSamples/formal/promela/dyntick/runspin.sh
> diff --git a/CodeSamples/analysis/promela/increment.spin b/CodeSamples/formal/promela/increment.spin
> similarity index 100%
> rename from CodeSamples/analysis/promela/increment.spin
> rename to CodeSamples/formal/promela/increment.spin
> diff --git a/CodeSamples/analysis/promela/lock.h b/CodeSamples/formal/promela/lock.h
> similarity index 100%
> rename from CodeSamples/analysis/promela/lock.h
> rename to CodeSamples/formal/promela/lock.h
> diff --git a/CodeSamples/analysis/promela/lock.spin b/CodeSamples/formal/promela/lock.spin
> similarity index 100%
> rename from CodeSamples/analysis/promela/lock.spin
> rename to CodeSamples/formal/promela/lock.spin
> diff --git a/CodeSamples/analysis/promela/qrcu.spin b/CodeSamples/formal/promela/qrcu.spin
> similarity index 100%
> rename from CodeSamples/analysis/promela/qrcu.spin
> rename to CodeSamples/formal/promela/qrcu.spin
> -- 
> 2.10.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

