Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58751 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752512AbdEIOrf (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 9 May 2017 10:47:35 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v49EcpO3089720
 for <perfbook@vger.kernel.org>; Tue, 9 May 2017 10:47:35 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2abd21gcpg-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 09 May 2017 10:47:34 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 9 May 2017
 10:47:34 -0400
Date: Tue, 9 May 2017 07:47:30 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] Remove unnecessary memory fence
Reply-To: paulmck@linux.vnet.ibm.com
References: <1494306511-9022-1-git-send-email-junchangwang@gmail.com>
 <1494306511-9022-3-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494306511-9022-3-git-send-email-junchangwang@gmail.com>
Message-Id: <20170509144730.GL3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 09, 2017 at 01:08:31PM +0800, Junchang Wang wrote:
> count_stat_eventual.c uses a single global variable (stopflag) to synchronize
> two separate threads (main and eventual) probably running on two different CPU
> cores. My understanding is that for this model, memory fence instruction
> (mfence) which typically are expensive can be avoided, only if we make sure (1)
> that compiler neither reorder the code around nor cache the variable, and (2)
> that the CPU core running code precedes in program order.
> 
> We use keyword ``volatile'' to prevent compilers from reordering the code and
> caching the variable, and instruction barrier() to force CPU core running the
> code to obey program order.

Please take another look at the barrier() macro.  It does not emit any
instructions, so cannot force the CPU to do much of anything.  Keep in
mind that this code needs to run on weakly ordered systems, not just x86.

							Thanx, Paul

> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> ---
>  CodeSamples/count/count_stat_eventual.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> index 059ab8b..5ffc4aa 100644
> --- a/CodeSamples/count/count_stat_eventual.c
> +++ b/CodeSamples/count/count_stat_eventual.c
> @@ -23,7 +23,7 @@
> 
>  DEFINE_PER_THREAD(unsigned long, counter);
>  unsigned long global_count;
> -int stopflag;
> +volatile int stopflag;
> 
>  void inc_count(void)
>  {
> @@ -47,7 +47,7 @@ void *eventual(void *arg)
>  		ACCESS_ONCE(global_count) = sum;
>  		poll(NULL, 0, 1);
>  		if (stopflag) {
> -			smp_mb();
> +			barrier();
>  			stopflag++;
>  		}
>  	}
> @@ -67,9 +67,9 @@ void count_init(void)
>  void count_cleanup(void)
>  {
>  	stopflag = 1;
> +	barrier();
>  	while (stopflag < 3)
>  		poll(NULL, 0, 1);
> -	smp_mb();
>  }
> 
>  #include "counttorture.h"
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

