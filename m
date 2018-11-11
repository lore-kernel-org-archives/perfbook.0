Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56256 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727876AbeKLC22 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 11 Nov 2018 21:28:28 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wABGXxFP141291
        for <perfbook@vger.kernel.org>; Sun, 11 Nov 2018 11:39:28 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2npd75vqbq-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sun, 11 Nov 2018 11:39:27 -0500
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 11 Nov 2018 16:39:26 -0000
Date: Sun, 11 Nov 2018 08:39:24 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] cpu: Fix typos
Reply-To: paulmck@linux.ibm.com
References: <1541854161-4556-1-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541854161-4556-1-git-send-email-junchangwang@gmail.com>
Message-Id: <20181111163924.GT4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Nov 10, 2018 at 08:49:21PM +0800, Junchang Wang wrote:
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>

Applied and soon to be pushed, thank you!

							Thanx, Paul

> ---
> Hi Paul,
> 
> This is the only patch for Chapter CPU. Please take a look.
> 
> 
> Thanks,
> --Junchang
> 
> --
>  cpu/overheads.tex | 4 ++--
>  cpu/overview.tex  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index 2474cfe..17b120b 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -155,7 +155,7 @@ displayed in
>  Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}.
>  This system's clock period rounds to 0.6\,ns.
>  Although it is not unusual for modern microprocessors to be able to
> -retire multiple instructions per clock period, the operations's costs are
> +retire multiple instructions per clock period, the operations' costs are
>  nevertheless normalized to a clock period in the third column, labeled
>  ``Ratio''.
>  The first thing to note about this table is the large values of many of
> @@ -360,7 +360,7 @@ It is clear that the combination of speculative execution and cloud
>  computing needs more than a bit of rework!
> 
>  A fifth hardware optimization is large caches, allowing individual
> -CPUs to operate on larger datasets without incuring expensive cache
> +CPUs to operate on larger datasets without incurring expensive cache
>  misses.
>  Although large caches can degrade energy efficiency and cache-miss
>  latency, the ever-growing cache sizes on production microprocessors
> diff --git a/cpu/overview.tex b/cpu/overview.tex
> index 071cf7c..9e91a7b 100644
> --- a/cpu/overview.tex
> +++ b/cpu/overview.tex
> @@ -15,7 +15,7 @@ where the race always goes to the swiftest.
>  \ContributedBy{Figure}{fig:cpu:CPU Performance at its Best}{Melissa Broussard}
>  \end{figure}
> 
> -Although there are a few CPU-bound benchmarks that approach the ideal
> +Although there are a few CPU-bound benchmarks that approach the ideal case
>  shown in Figure~\ref{fig:cpu:CPU Performance at its Best},
>  the typical program more closely resembles an obstacle course than
>  a race track.
> -- 
> 2.7.4
> 

