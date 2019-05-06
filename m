Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33618 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726575AbfEFSO0 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 6 May 2019 14:14:26 -0400
Date: Mon, 6 May 2019 11:14:24 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] rcu_nest: fix concurrency issues
Message-ID: <20190506181424.GJ3923@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <1556596959-11571-1-git-send-email-junchangwang@gmail.com>
 <20190502145951.GL3923@linux.ibm.com>
 <20190505131651.GA8130@PhD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190505131651.GA8130@PhD>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Sun, May 05, 2019 at 09:16:53PM +0800, Junchang Wang wrote:
> On Thu, May 02, 2019 at 07:59:51AM -0700, Paul E. McKenney wrote:
> >On Tue, Apr 30, 2019 at 12:02:39PM +0800, Junchang Wang wrote:
> >> Variable "rcu_gp_ctr" is incremented by the updater and is fetched by
> >> readers concurrently. So protect this variable by using READ_ONCE()
> >> and WRITE_ONCE().
> >> 
> >> Per-thread variable "rcu_read_gp" is updated by the reader and is read
> >> by the updater. So protect it by using READ_ONCE() and WRITE_ONCE().
> >> 
> >> The type of "rcu_gp_ctr" is changed to unsigned long because the behavior
> >> of the overflow of a signed long integer is not well defined in C yet.
> >> 
> >> Refine the code snippet in "rcu_read_lock" that allows a reader to start
> >> over. In this version, we add micro MAX_GP_ADV_DISTANCE which is by
> >> default set to (RCU_GP_CTR_NEST_MASK << 8). Once a reader notices that
> >> MAX_GP_ADV_DISTANCE grace-periods have elapsed since fetching the value of
> >> "rcu_reader_gp", the reader starts over.
> >> 
> >>  
> >> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> >
> >First, thank you for doing this!  Lots of good improvements!!!
> >
> >A few comments below.
> >
> >							Thanx, Paul
> >
> >> ---
> >>  CodeSamples/defer/rcu_nest.c |  5 +++--
> >>  CodeSamples/defer/rcu_nest.h | 25 +++++++++++++++++--------
> >>  2 files changed, 20 insertions(+), 10 deletions(-)
> >> 
> >> diff --git a/CodeSamples/defer/rcu_nest.c b/CodeSamples/defer/rcu_nest.c
> >> index 64e4087..362f466 100644
> >> --- a/CodeSamples/defer/rcu_nest.c
> >> +++ b/CodeSamples/defer/rcu_nest.c
> >> @@ -35,7 +35,7 @@ void synchronize_rcu(void)
> >>  
> >>  	/* Advance to a new grace-period number, enforce ordering. */
> >>  
> >> -	rcu_gp_ctr += RCU_GP_CTR_BOTTOM_BIT;
> >> +	WRITE_ONCE(rcu_gp_ctr, rcu_gp_ctr + RCU_GP_CTR_BOTTOM_BIT);
> >>  	smp_mb();
> >>  
> >>  	/*
> >> @@ -45,7 +45,8 @@ void synchronize_rcu(void)
> >>  
> >>  	for_each_thread(t) {
> >>  		while (rcu_gp_ongoing(t) &&
> >> -		       ((per_thread(rcu_reader_gp, t) - rcu_gp_ctr) < 0)) {
> >> +		       ((READ_ONCE(per_thread(rcu_reader_gp, t)) -
> >> +			 rcu_gp_ctr) < 0)) {
> >>  			/*@@@ poll(NULL, 0, 10); */
> >>  			barrier();
> >>  		}
> >> diff --git a/CodeSamples/defer/rcu_nest.h b/CodeSamples/defer/rcu_nest.h
> >> index bcc4cde..65ce203 100644
> >> --- a/CodeSamples/defer/rcu_nest.h
> >> +++ b/CodeSamples/defer/rcu_nest.h
> >> @@ -24,8 +24,9 @@ DEFINE_SPINLOCK(rcu_gp_lock);
> >>  #define RCU_GP_CTR_SHIFT 7
> >>  #define RCU_GP_CTR_BOTTOM_BIT (1 << RCU_GP_CTR_SHIFT)
> >>  #define RCU_GP_CTR_NEST_MASK (RCU_GP_CTR_BOTTOM_BIT - 1)
> >> -long rcu_gp_ctr = 0;	/* increment by RCU_GP_CTR_BOTTOM_BIT each gp. */
> >> -DEFINE_PER_THREAD(long, rcu_reader_gp);
> >> +#define MAX_GP_ADV_DISTANCE (RCU_GP_CTR_NEST_MASK << 8)
> >> +unsigned long rcu_gp_ctr = 0;	/* increment by RCU_GP_CTR_BOTTOM_BIT each gp. */
> >> +DEFINE_PER_THREAD(unsigned long, rcu_reader_gp);
> >>  
> >>  static inline int rcu_gp_ongoing(int cpu)
> >>  {
> >> @@ -39,8 +40,8 @@ static void rcu_init(void)
> >>  
> >>  static void rcu_read_lock(void)
> >>  {
> >> -	long tmp;
> >> -	long *rrgp;
> >> +	unsigned long tmp;
> >> +	unsigned long *rrgp;
> >>  
> >>  	/*
> >>  	 * If this is the outermost RCU read-side critical section,
> >> @@ -52,13 +53,21 @@ static void rcu_read_lock(void)
> >>  retry:
> >>  	tmp = *rrgp;
> >>  	if ((tmp & RCU_GP_CTR_NEST_MASK) == 0)
> >> -		tmp = rcu_gp_ctr;
> >> +		tmp = READ_ONCE(rcu_gp_ctr);
> >>  	tmp++;
> >> -	*rrgp = tmp;
> >> +	WRITE_ONCE(*rrgp, tmp);
> >>  	smp_mb();
> >> +
> >> +	/*
> >> +	 * A reader could be suspended in between fetching the value of *rrgp
> >> +	 * and writting the updated value back into *rrgp. During this
> >
> >s/writting/writing/
> >
> >> +	 * time period, the grace-period counter might have advanced very far.
> >> +	 * In this case, we force the reader to start over.
> >> +	 */
> >> +
> >>  	if (((tmp & RCU_GP_CTR_NEST_MASK) == 1) &&
> >> -	    ((rcu_gp_ctr - tmp) > (RCU_GP_CTR_NEST_MASK << 8)) != 0) {
> >> -		(*rrgp)--;
> >> +	    (READ_ONCE(rcu_gp_ctr) > tmp + MAX_GP_ADV_DISTANCE)) {
> >
> >Does this work correctly if the value of tmp is just a bit less than
> >ULONG_MAX?  It looks to me like it does not.
> >
> 
> Hi Paul,
> 
> Thanks for reviewing the code. Yes, the statement you pointed out is buggy
> when both rcu_gp_ctr and tmp are close to ULONG_MAX. I was trying to
> rewrite to code to check for true overflow, but, as you have pointed out
> in a previous mail, that could make the code complex if we want to be
> exact. So I go back to the logic you used before. Please check the updated
> code below: 
> 
> +
> +	/*
> +	 * A reader could be suspended in between fetching the value of *rrgp
> +	 * and writting the updated value back into *rrgp. During this
> +	 * time period, the grace-period counter might have advanced very far.
> +	 * In this case, we force the reader to start over.
> +	 */
> +
>  	if (((tmp & RCU_GP_CTR_NEST_MASK) == 1) &&
> -	    ((rcu_gp_ctr - tmp) > (RCU_GP_CTR_NEST_MASK << 8)) != 0) {
> -		(*rrgp)--;
> +	    (READ_ONCE(rcu_gp_ctr) - (tmp-1)) > MAX_GP_ADV_DISTANCE) {
> +		WRITE_ONCE(*rrgp, *rrgp - 1);
>  		goto retry;
>  	}
>  }
> 
> Note that if *rcu_gp_ctr* has not been changed since its value was first
> read and stored in *tmp*, then its value is less than *tmp* by 1. 
> Since both *rcu_gp_ctr* and *tmp* are now unsigned long integers,
> (rcu_gp_ctr - tmp) will generate a very large integer number, so I replace
> that with (READ_ONCE(rcu_gp_ctr) - (tmp-1)). Please let me know if that looks OK.

There are a couple of ways to make this work.  One of them is as shown
in time_after() in the Linux kernel, and another is as shown in
ULONG_CMP_GE().

And yes, the C standard is less helpful than it might be in this area.
You can thank old ones-complement machines and newer machines that
trap on signed integer overflow.  ;-)

							Thanx, Paul

> Thanks,
> --Junchang
> 
> >> +		WRITE_ONCE(*rrgp, *rrgp - 1);
> >>  		goto retry;
> >>  	}
> >>  }
> >> -- 
> >> 2.7.4
> >> 
> >
> 

