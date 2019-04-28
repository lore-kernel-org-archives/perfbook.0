Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60800 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726435AbfD1VwK (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 28 Apr 2019 17:52:10 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3SLnZFA023386
        for <perfbook@vger.kernel.org>; Sun, 28 Apr 2019 17:52:08 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2s5b1pemfj-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sun, 28 Apr 2019 17:52:08 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 28 Apr 2019 22:52:07 +0100
Date: Sun, 28 Apr 2019 04:30:27 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Question about the detection of overflow in
 rcu_nest:rcu_read_lock()
Reply-To: paulmck@linux.ibm.com
References: <20190425092526.GA17338@PhD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425092526.GA17338@PhD>
Message-Id: <20190428113027.GK3923@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org, akiyks@gmail.com

On Thu, Apr 25, 2019 at 05:25:28PM +0800, Junchang Wang wrote:
> Hi list,
> 
> I was reading rcu_nest.h and the code snippet (lines 59 - 63), which I believe
> is to detect the overflow of variable rcu_gp_ctr, confused me a lot. Can some
> of you shed light on that?

The "!= 0" and the end does look strange, no two ways about it!
Though this is a no-op, it should be fixed one way or another.

And I did write this some time ago, it appears...

> Specifically, what's the goal of line 60? Why should we compare the value of
> (rcu_gp_ctr - tmp) against "111 1111 0000 0000"? If I understand correctly,
> line 60 is to detect the scenario where rcu_gp_ctr has wrapped around and is
> currently smaller than variable tmp. If that is correct, should line 60 be the
> following?
> 
> 60             ((tmp - READ_ONCE(rcu_gp_ctr)) > RCU_GP_CTR_BOTTOM_BIT) {
> 
> Or did I misunderstand anything here? 

What is happening here is that between line 55, where rcu_gp_ctr is
loaded and line 57 where the store to *rrgp is done, the grace-period
mechanism is not aware that this reader exists.  If the grace-period
counter has advanced very far (nowhere near overflow), we want to start
over.  Yes, we could check for true overflow, but given that this should
be a rare event, there is little benefit (and some risk) to trying to
be exact.

This might be more clear with a macro set up specifically for this
purpose.  The value you have chosen would retry on any change in
rcu_gp_ctr, which is too strict.  It should be OK for it to get ahead
by 100 or so, hence the value I chose earlier.

The type of "rcu_gp_ctr" should be unsigned as well.  Signed overflow
is still undefined behavior in C.

The store into *rrgp should of course be WRITE_ONCE() because this value
is being read by other threads.

Probably other issues as well.

And thank you for looking at this!

							Thanx, Paul

>  40 static void rcu_read_lock(void)
>  41 {
>  42         long tmp;
>  43         long *rrgp;
>  44 
>  45         /*
>  46          * If this is the outermost RCU read-side critical section,
>  47          * copy the global grace-period counter.  In either case,
>  48          * increment the nesting count held in the low-order bits.
>  49          */
>  50 
>  51         rrgp = &__get_thread_var(rcu_reader_gp);
>  52 retry:
>  53         tmp = *rrgp;
>  54         if ((tmp & RCU_GP_CTR_NEST_MASK) == 0)
>  55                 tmp = READ_ONCE(rcu_gp_ctr);
>  56         tmp++;
>  57         *rrgp = tmp;
>  58         smp_mb();
>  59         if (((tmp & RCU_GP_CTR_NEST_MASK) == 1) &&
>  60             ((rcu_gp_ctr - tmp) > (RCU_GP_CTR_NEST_MASK << 8)) != 0) {
>  61                 (*rrgp)--;
>  62                 goto retry;
>  63         }
>  64 }
> 
> Thanks,
> --Junchang
> 

