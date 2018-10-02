Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58174 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726758AbeJBKmF (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 2 Oct 2018 06:42:05 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w923xTSq066863
        for <perfbook@vger.kernel.org>; Tue, 2 Oct 2018 00:00:56 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2mv0xsrhah-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 02 Oct 2018 00:00:56 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 2 Oct 2018 00:00:54 -0400
Date: Mon, 1 Oct 2018 21:00:51 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Question of usage of per_thread()
Reply-To: paulmck@linux.ibm.com
References: <71206929-11cd-73bc-560e-f982c7e86cf8@gmail.com>
 <20180916150849.GW652@linux.ibm.com>
 <c6eaaa51-2063-7fb6-d308-4152d31f30be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6eaaa51-2063-7fb6-d308-4152d31f30be@gmail.com>
Message-Id: <20181002040051.GS4222@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 02, 2018 at 07:48:15AM +0900, Akira Yokosawa wrote:
> On 2018/09/17 0:08, Paul E. McKenney wrote:
> > On Sun, Sep 16, 2018 at 05:37:23PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> Every time I review code under CodeSamples/,
> >> I find myself confused where to use READ_ONCE/WRITE_ONCEs.
> >>
> >> I'm looking at Listing 5.3 of current master.
> >>
> >> There are two cases which lack READ_ONCE/WRITE_ONCE to access potentially
> >> shared variables, namely on line 5 (__get_thread_var(counter)++;) and
> >> on line 14 (sum += per_thread(counter, t);).
> >>
> >> Line 5 looks like a good candidate to be optimized out when inlined.
> >> But the performance result indicates "gcc -O3" keeps it inside the loop.
> >>
> >> Is this because the definition of __get_thread_var() contains
> >> a call to smp_thread_id() and complicated enough not to be optimized
> >> out?
> >>
> >> As for line 14, as per_thread() was derived from per_cpu() of kernel
> >> API, I looked for call sites of per_cpu() in the kernel source tree.
> >>
> >> There are very few cases where READ_ONCE/WRITE_ONCE is used along
> >> with per_cpu(). There are two READ_ONCEs with per_cpu() in
> >> kernel/rcu/srcutree.c, whose author is none other than you.
> >> Are those READ_ONCEs necessary?
> >>
> >> I don't grasp the actual definition of per_cpu() macro.
> >> Definition of per_thread() macro under CodeSamples/api-pthreads/
> >> does not look so complicated, but contains array indexing,
> >> which might be good enough to prevent optimization in the loop.
> >>
> >> I'm not sure, but my gut feeling is that READ_ONCE/WRITE_ONCE
> >> is necessary to access an unannotated variable. If we need
> >> volatility for sure, we could modify the definition of annotating
> >> macros/functions.
> >>
> >> Can you enlighten me?
> > 
> > Yes, I do need to expand on this, both in perfbook and in order to inspect
> > my usage in Linux-kernel RCU.  Please see below for my current outline,
> > and any and all feedback would be deeply appreciated!
> > 
> 
> So, I applied your outline to accesses in Listing 5.3.
> See inline comments below for my observation.
> 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > 
> > Plain accesses, that is, without either READ_ONCE() or WRITE_ONCE():
> > o	Only accessed under lock.
> > o	Only accessed by owning CPU/thread.
> > o	Only modified by owning CPU/thread under lock, and otherwise
> > 	accessed only either while holding lock or by owning CPU/thread.
> > 
> > WRITE_ONCE() for modifications, READ_ONCE() for non-owning CPUs/threads
> > not holding lock:
> > o	Only modified while holding lock by owning CPU/thread,
> > 	could be read from anywhere by anyone.
> > 
> > WRITE_ONCE() for modifications, READ_ONCE() for CPUs/threads not holding
> > lock:
> > o	Only modified while holding lock, could be read anywhere by
> > 	anyone.
> > 
> > WRITE_ONCE() for modifications, READ_ONCE() for non-owning
> > CPUs/threads:
> > o	Only modified by owning CPU/threads, could be read anywhere
> > 	by anyone.
> 
> Listing 5.3's per-thread variable "counter" looks covered here.
> So the write part of the increment on line 5 needs WRITE_ONCE().
> Read access on line 14 also needs READ_ONCE().
> 
> Read part of the increment doesn't need READ_ONCE(), I guess.
> 
> Line 5 would look like:
> 
>     WRITE_ONCE(__get_thread_var(counter), __get_thread_var(counter) + 1);
> 
> . Considering the cost of __get_thread_var(), there should be a room
> to help compilers to optimize by using a local pointer as follows:
> 
>     static __inline__ void inc_count(void)
>     {
>         long *p_counter = &__get_thread_var(counter);
> 
>         WRITE_ONCE(*p_counter, *p_counter + 1);
>     }
> 
> . Does this look reasonable to you? Or is it better to also use
> READ_ONCE()?

Yes, this is fine.  You don't need READ_ONCE() because threads only
modify the counters that they own, and this case is a thread reading
its own counter -- thus concurrent update cannot happen.

> But if __get_thread_var() does imply volatility, we can keep the
> current way of increment:
> 
>         __get_thread_var(counter)++;

Unfortunately, it does not, at least not the way that it is currently
implemented.

> Thoughts?

Your taking the pointer and using WRITE_ONCE() looks good!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Otherwise, READ_ONCE() and WRITE_ONCE() everywhere.
> > 
> > But note that READ_ONCE() and WRITE_ONCE() provide absolutely no
> > ordering guarantees unless:
> > 
> > o	There is only one variable being accesses, and all of those
> > 	accesses are of the same size and alignment.
> > 
> > o	There is only one CPU/thread doing the accesses to all
> > 	of the variables during the timeframe of interest.
> > 
> > o	There are other operations involved, for example, smp_mb().
> > 
> 

