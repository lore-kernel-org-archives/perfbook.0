Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42236 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751602AbdIUCKb (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 20
 Sep 2017 22:10:31 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8L29Uvd038582
 for <perfbook@vger.kernel.org>; Wed, 20 Sep 2017 22:10:31 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2d3umubtd5-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 20 Sep 2017 22:10:31 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 20 Sep
 2017 22:10:29 -0400
Date: Wed, 20 Sep 2017 19:10:27 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] styleguide: Substitute experimental table
Reply-To: paulmck@linux.vnet.ibm.com
References: <ce6f1746-3285-caa7-c1b6-74b7cf77ecde@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce6f1746-3285-caa7-c1b6-74b7cf77ecde@gmail.com>
Message-Id: <20170921021027.GZ3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Sep 21, 2017 at 07:38:14AM +0900, Akira Yokosawa wrote:
> >From 3f03b3a2728c1bb72c9ad687c430980d45df7445 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 21 Sep 2017 07:02:12 +0900
> Subject: [PATCH] styleguide: Substitute experimental table
> 
> The original table was substituted in commit 3162ff468ef4 ("memorder:
> Substitute WRC for WWC to illustrate non-MCA").
> 
> Also tweak hspace of cheat sheet in 1c layout.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied, thank you!

							Thanx, Paul

> ---
>  appendix/styleguide/styleguide.tex | 52 ++++++++++++++++++--------------------
>  memorder/memorder.tex              |  2 +-
>  2 files changed, 25 insertions(+), 29 deletions(-)
> 
> diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
> index 07d2e72..46d93f6 100644
> --- a/appendix/styleguide/styleguide.tex
> +++ b/appendix/styleguide/styleguide.tex
> @@ -1389,7 +1389,7 @@ and~\ref{tab:memorder:Memory Ordering: WRC Sequence of Events}
>  recently added in Chapter~\ref{chp:memorder:Memory Ordering}
>  can be typeset as
>  Tables~\ref{tab:app:styleguide:Linux-Kernel Memory-Ordering Cheat Sheet}
> -and~\ref{tab:app:styleguide:Memory Ordering: WWC Sequence of Events}
> +and~\ref{tab:app:styleguide:Memory Ordering: WRC Sequence of Events}
>  using booktabs' ruled lines.
> 
>  \begin{table*}
> @@ -1448,7 +1448,7 @@ using booktabs' ruled lines.
>  		& RMW: & Atomic read-modify-write operation \\
>  		& SV: & Same-variable access \\
>  \end{tabular}
> -}
> +}\OneColumnHSpace{-0.9in}
>  \caption{Linux-Kernel Memory-Ordering Cheat Sheet}
>  \label{tab:app:styleguide:Linux-Kernel Memory-Ordering Cheat Sheet}
>  \end{table*}
> @@ -1466,35 +1466,31 @@ using booktabs' ruled lines.
>  			Instruction & Store Buffer & Cache \\
>  	\cmidrule{1-1} \cmidrule(l){2-2} \cmidrule(l){3-3} \cmidrule(l){4-4}
>  		\cmidrule(lr){5-5} \cmidrule(l){6-6} \cmidrule(l){7-7} \cmidrule(l){8-8}
> -	1 & (Initial state) & & \tco{y==&b} &
> +	1 & (Initial state) & & \tco{y==0} &
>  		(Initial state) &
> -			(Initial state) & & \tco{x==&a} \\
> -	2 & \tco{x = &x;} & \tco{x==&x} & \tco{y==&b} &
> -		 & & & \tco{x==&a} \\
> -	3 & (Read-Invalidate \tco{x}) & \tco{x==&x} & \tco{y==&b} & \tco{r1 = x} (\tco{&x})
> -		 & & & \tco{x==&a} \\
> -	4 &  & \tco{x==&x} \tco{y==&x} & \tco{y==&b} & \tco{y = r1}
> -		 & \tco{r2 = y} & & \tco{x==&a} \\
> -	5 &  & \tco{x==&x} & \tco{y==&x} & (Finish store)
> -		 & (Read \tco{y}) & & \tco{x==&a} \\
> -	6 & & \tco{x==&x} & \tco{y==&x} &
> -		 & (\tco{r2==&x}) & & \tco{x==&a} \tco{y==&x} \\
> -	7 & & \tco{x==&x} & \tco{y==&x} &
> -		 & \tco{*r2 = &c} & \tco{y==&c} & \tco{x==&a} \tco{y==&x} \\
> -	8 & & \tco{x==&x} & \tco{y==&x} &
> -		 & (Read Invalidate \tco{y}) & \tco{y==&c} & \tco{x==&a} \tco{y==&x} \\
> -	9 & & \tco{x==&x} &  &
> -		 &  & \tco{y==&c} & \tco{x==&a} \tco{y==&x} \\
> -	10 & & \tco{x==&x} &  &
> -		 & (Finish store) & & \tco{x==&a} \tco{y==&c} \\
> -	11 & & \tco{x==&x} & \tco{x==&a} &
> -		 & (Respond \co{x}) & & \tco{y==&c} \\
> -	12 & (Finish store) & & \tco{x==&x} &
> -		 &  & & \tco{y==&c} \\
> +			(Initial state) & & \tco{x==0} \\
> +	2 & \tco{x = 1;} & \tco{x==1} & \tco{y==0} &
> +		 & & & \tco{x==0} \\
> +	3 & (Read-Invalidate \tco{x}) & \tco{x==1} & \tco{y==0} & \tco{r1 = x} (1)
> +		 & & & \tco{x==0} \\
> +	4 &  & \tco{x==1} \tco{y==1} & \tco{y==0} & \tco{y = r1}
> +		 & \tco{r2 = y} & & \tco{x==0} \\
> +	5 &  & \tco{x==1} & \tco{y==1} & (Finish store)
> +		 & (Read \tco{y}) & & \tco{x==0} \\
> +	6 & (Respond \tco{y}) & \tco{x==1} & \tco{y==1} &
> +		 & (\tco{r2==1}) & & \tco{x==0} \tco{y==1} \\
> +	7 & & \tco{x==1} & \tco{y==1} &
> +		 & \tco{smp_rmb()} & & \tco{x==0} \tco{y==1} \\
> +	8 & & \tco{x==1} & \tco{y==1} &
> +		 & \tco{r3 = x (0)} & & \tco{x==0} \tco{y==1} \\
> +	9 & & \tco{x==1} & \tco{x==0} \tco{y==1} &
> +		 & (Respond \tco{x}) & & \tco{y==1} \\
> +	10 & (Finish store) & & \tco{x==1} \tco{y==1} &
> +		 &  & & \tco{y==1} \\
>  	\bottomrule
>  \end{tabular}
> -\caption{Memory Ordering: WWC Sequence of Events}
> -\label{tab:app:styleguide:Memory Ordering: WWC Sequence of Events}
> +\caption{Memory Ordering: WRC Sequence of Events}
> +\label{tab:app:styleguide:Memory Ordering: WRC Sequence of Events}
>  \end{table*}
> 
>  \floatstyle{plain}
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 316bab7..16de2b6 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -428,7 +428,7 @@ instances straighten things out in the end.
> 
>  \begin{table*}
>  \small
> -\centering\OneColumnHSpace{-0.7in}
> +\centering\OneColumnHSpace{-0.8in}
>  \begin{tabular}{l||c||c|c|c|c||c|c|c|c|c|c|c}
>  	& & \multicolumn{4}{c||}{Prior Ordered Operation} &
>  		\multicolumn{7}{c}{Subsequent Ordered Operation} \\
> -- 
> 2.7.4
> 

