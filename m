Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49186 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726704AbfEIXSu (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 9 May 2019 19:18:50 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x49NH7sa034129
        for <perfbook@vger.kernel.org>; Thu, 9 May 2019 19:18:49 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2scuysbfwg-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Thu, 09 May 2019 19:18:49 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 10 May 2019 00:18:48 +0100
Date: Thu, 9 May 2019 16:18:46 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH v2] rcu_nest: fix concurrency issues
Reply-To: paulmck@linux.ibm.com
References: <1557325561-8506-1-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557325561-8506-1-git-send-email-junchangwang@gmail.com>
Message-Id: <20190509231846.GO3923@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, May 08, 2019 at 10:26:01PM +0800, Junchang Wang wrote:
> Variable "rcu_gp_ctr" is incremented by the updater and is fetched by
> readers concurrently. So protect this variable by using READ_ONCE()
> and WRITE_ONCE().
> 
> Per-thread variable "rcu_read_gp" is updated by the reader and is read
> by the updater. So protect it by using READ_ONCE() and WRITE_ONCE().
> 
> The type of "rcu_gp_ctr" is changed to unsigned long because the behavior
> of the overflow of a signed long integer is not well defined in C yet.
> "rcu_gp_ctr" could wrap around. To compare it to "rcu_reader_gp" correctly,
> helper function ULONG_CMP_GE() is used.
> 
> Refine the code snippet in "rcu_read_lock" that allows a reader to start
> over. In this version, we add micro MAX_GP_ADV_DISTANCE which is by
> default set to (RCU_GP_CTR_NEST_MASK << 8). Once a reader notices that
> MAX_GP_ADV_DISTANCE grace-periods have elapsed since fetching the value of
> "rcu_reader_gp", the reader starts over.
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>

Queued and pushed, thank you!!!

							Thanx, Paul

> ---
> Changes from v1:
>  - Use ULONG_CMP_GE() to compare variables correctly.
> 
> 
>  CodeSamples/defer/rcu_nest.c |  5 +++--
>  CodeSamples/defer/rcu_nest.h | 32 ++++++++++++++++++++++++--------
>  2 files changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/CodeSamples/defer/rcu_nest.c b/CodeSamples/defer/rcu_nest.c
> index 64e4087..362f466 100644
> --- a/CodeSamples/defer/rcu_nest.c
> +++ b/CodeSamples/defer/rcu_nest.c
> @@ -35,7 +35,7 @@ void synchronize_rcu(void)
>  
>  	/* Advance to a new grace-period number, enforce ordering. */
>  
> -	rcu_gp_ctr += RCU_GP_CTR_BOTTOM_BIT;
> +	WRITE_ONCE(rcu_gp_ctr, rcu_gp_ctr + RCU_GP_CTR_BOTTOM_BIT);
>  	smp_mb();
>  
>  	/*
> @@ -45,7 +45,8 @@ void synchronize_rcu(void)
>  
>  	for_each_thread(t) {
>  		while (rcu_gp_ongoing(t) &&
> -		       ((per_thread(rcu_reader_gp, t) - rcu_gp_ctr) < 0)) {
> +		       ((READ_ONCE(per_thread(rcu_reader_gp, t)) -
> +			 rcu_gp_ctr) < 0)) {
>  			/*@@@ poll(NULL, 0, 10); */
>  			barrier();
>  		}
> diff --git a/CodeSamples/defer/rcu_nest.h b/CodeSamples/defer/rcu_nest.h
> index bcc4cde..7e7b7de 100644
> --- a/CodeSamples/defer/rcu_nest.h
> +++ b/CodeSamples/defer/rcu_nest.h
> @@ -20,12 +20,17 @@
>  
>  #include "rcu_pointer.h"
>  
> +/* Borrow from rcupdate.h in Linux kernel */
> +#define ULONG_CMP_GE(a, b)      (ULONG_MAX / 2 >= (a) - (b))
> +#define ULONG_CMP_LT(a, b)      (ULONG_MAX / 2 < (a) - (b))
> +
>  DEFINE_SPINLOCK(rcu_gp_lock);
>  #define RCU_GP_CTR_SHIFT 7
>  #define RCU_GP_CTR_BOTTOM_BIT (1 << RCU_GP_CTR_SHIFT)
>  #define RCU_GP_CTR_NEST_MASK (RCU_GP_CTR_BOTTOM_BIT - 1)
> -long rcu_gp_ctr = 0;	/* increment by RCU_GP_CTR_BOTTOM_BIT each gp. */
> -DEFINE_PER_THREAD(long, rcu_reader_gp);
> +#define MAX_GP_ADV_DISTANCE (RCU_GP_CTR_NEST_MASK << 8)
> +unsigned long rcu_gp_ctr = 0;	/* increment by RCU_GP_CTR_BOTTOM_BIT each gp. */
> +DEFINE_PER_THREAD(unsigned long, rcu_reader_gp);
>  
>  static inline int rcu_gp_ongoing(int cpu)
>  {
> @@ -39,8 +44,8 @@ static void rcu_init(void)
>  
>  static void rcu_read_lock(void)
>  {
> -	long tmp;
> -	long *rrgp;
> +	unsigned long tmp;
> +	unsigned long *rrgp;
>  
>  	/*
>  	 * If this is the outermost RCU read-side critical section,
> @@ -52,13 +57,24 @@ static void rcu_read_lock(void)
>  retry:
>  	tmp = *rrgp;
>  	if ((tmp & RCU_GP_CTR_NEST_MASK) == 0)
> -		tmp = rcu_gp_ctr;
> +		tmp = READ_ONCE(rcu_gp_ctr);
>  	tmp++;
> -	*rrgp = tmp;
> +	WRITE_ONCE(*rrgp, tmp);
>  	smp_mb();
> +
> +	/*
> +	 * A reader could be suspended in between fetching the value of *rrgp
> +	 * and writting the updated value back into *rrgp. During this
> +	 * time period, the grace-period counter might have advanced very far.
> +	 * In this case, we force the reader to start over. One special case
> +	 * is that "rcu_gp_ctr" may have wrapped around while "tmp" is close to
> +	 * ULONG_MAX. To handle this correctly, we adopt the helper function
> +	 * ULONG_CMP_GE.
> +	 */
> +
>  	if (((tmp & RCU_GP_CTR_NEST_MASK) == 1) &&
> -	    ((rcu_gp_ctr - tmp) > (RCU_GP_CTR_NEST_MASK << 8)) != 0) {
> -		(*rrgp)--;
> +	     ULONG_CMP_GE(READ_ONCE(rcu_gp_ctr), tmp + MAX_GP_ADV_DISTANCE)) {
> +		WRITE_ONCE(*rrgp, *rrgp - 1);
>  		goto retry;
>  	}
>  }
> -- 
> 2.7.4
> 

