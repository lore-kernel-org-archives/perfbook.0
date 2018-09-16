Return-Path: <paulmck@linux.vnet.ibm.com>
Date: Sun, 16 Sep 2018 08:08:49 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Question of usage of per_thread()
Message-ID: <20180916150849.GW652@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <71206929-11cd-73bc-560e-f982c7e86cf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71206929-11cd-73bc-560e-f982c7e86cf8@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, Sep 16, 2018 at 05:37:23PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Every time I review code under CodeSamples/,
> I find myself confused where to use READ_ONCE/WRITE_ONCEs.
> 
> I'm looking at Listing 5.3 of current master.
> 
> There are two cases which lack READ_ONCE/WRITE_ONCE to access potentially
> shared variables, namely on line 5 (__get_thread_var(counter)++;) and
> on line 14 (sum += per_thread(counter, t);).
> 
> Line 5 looks like a good candidate to be optimized out when inlined.
> But the performance result indicates "gcc -O3" keeps it inside the loop.
> 
> Is this because the definition of __get_thread_var() contains
> a call to smp_thread_id() and complicated enough not to be optimized
> out?
> 
> As for line 14, as per_thread() was derived from per_cpu() of kernel
> API, I looked for call sites of per_cpu() in the kernel source tree.
> 
> There are very few cases where READ_ONCE/WRITE_ONCE is used along
> with per_cpu(). There are two READ_ONCEs with per_cpu() in
> kernel/rcu/srcutree.c, whose author is none other than you.
> Are those READ_ONCEs necessary?
> 
> I don't grasp the actual definition of per_cpu() macro.
> Definition of per_thread() macro under CodeSamples/api-pthreads/
> does not look so complicated, but contains array indexing,
> which might be good enough to prevent optimization in the loop.
> 
> I'm not sure, but my gut feeling is that READ_ONCE/WRITE_ONCE
> is necessary to access an unannotated variable. If we need
> volatility for sure, we could modify the definition of annotating
> macros/functions.
> 
> Can you enlighten me?

Yes, I do need to expand on this, both in perfbook and in order to inspect
my usage in Linux-kernel RCU.  Please see below for my current outline,
and any and all feedback would be deeply appreciated!

							Thanx, Paul

------------------------------------------------------------------------


Plain accesses, that is, without either READ_ONCE() or WRITE_ONCE():
o	Only accessed under lock.
o	Only accessed by owning CPU/thread.
o	Only modified by owning CPU/thread under lock, and otherwise
	accessed only either while holding lock or by owning CPU/thread.

WRITE_ONCE() for modifications, READ_ONCE() for non-owning CPUs/threads
not holding lock:
o	Only modified while holding lock by owning CPU/thread,
	could be read from anywhere by anyone.

WRITE_ONCE() for modifications, READ_ONCE() for CPUs/threads not holding
lock:
o	Only modified while holding lock, could be read anywhere by
	anyone.

WRITE_ONCE() for modifications, READ_ONCE() for non-owning
CPUs/threads:
o	Only modified by owning CPU/threads, could be read anywhere
	by anyone.

Otherwise, READ_ONCE() and WRITE_ONCE() everywhere.

But note that READ_ONCE() and WRITE_ONCE() provide absolutely no
ordering guarantees unless:

o	There is only one variable being accesses, and all of those
	accesses are of the same size and alignment.

o	There is only one CPU/thread doing the accesses to all
	of the variables during the timeframe of interest.

o	There are other operations involved, for example, smp_mb().
