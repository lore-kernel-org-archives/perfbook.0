Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34239 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752279AbdGDWVl (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 4 Jul 2017 18:21:41 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v64MJAii065692
 for <perfbook@vger.kernel.org>; Tue, 4 Jul 2017 18:21:39 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2bg9tpvex3-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 04 Jul 2017 18:21:39 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 4 Jul 2017
 18:21:39 -0400
Date: Tue, 4 Jul 2017 15:21:38 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Fix store-buffering sequence table
Reply-To: paulmck@linux.vnet.ibm.com
References: <1e3fe2af-cce3-7327-488d-fb27ec7d9fc8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e3fe2af-cce3-7327-488d-fb27ec7d9fc8@gmail.com>
Message-Id: <20170704222138.GR2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jul 05, 2017 at 12:23:09AM +0900, Akira Yokosawa wrote:
> >From 2845eb208a6e63493997de47293a47ef774a9d49 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 4 Jul 2017 23:18:30 +0900
> Subject: [PATCH] advsync: Fix store-buffering sequence table
> 
> Row 6 of the table added in commit 2d5bf8d25a71 ("advsync: Add
> memory-barriered store-buffering example") needs some context
> adjustment.
> 
> Also tweak horizontal spacing of wide tables for one-column layout.
> Also add a few words to the footnote giving definition of
> __atomic_thread_fence().
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catches!  Queued and pushed.  I reworded the footnote a bit, so
please let me know if I overdid it.

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 4ae3ca8..f26a7c5 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -174,7 +174,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
> 
>  \begin{table*}
>  \small
> -\centering
> +\centering\OneColumnHSpace{-.1in}
>  \begin{tabular}{r||l|l|l||l|l|l}
>  	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
>  	\cline{2-7}
> @@ -318,6 +318,8 @@ ordering and memory barriers work, read on!
>  The first stop is
>  Figure~\ref{fig:advsync:Memory Ordering: Store-Buffering Litmus Test},
>  which has \co{__atomic_thread_fence()} directives\footnote{
> +	One of GCC's atomic intrinsics briefly introduced in
> +	Section~\ref{sec:toolsoftrade:Atomic Operations (C11)}.
>  	Similar to the Linux kernel's \co{smp_mb()} full memory barrier.}
>  placed between
>  the store and load in both \co{P0()} and \co{P1()}, but is otherwise
> @@ -339,7 +341,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
> 
>  \begin{table*}
>  \small
> -\centering
> +\centering\OneColumnHSpace{-0.75in}
>  \begin{tabular}{r||l|l|l||l|l|l}
>  	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
>  	\cline{2-7}
> @@ -362,8 +364,8 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
>  	5 & (Finish store) & & \tco{x0==2} &
>  		(Finish store) & & \tco{x1==2} \\
>  	\hline
> -	6 & \tco{r2 = *x1;} (2) & \tco{x0==2} & \tco{x1==0} &
> -		\tco{r2 = *x0;} (2) & \tco{x1==2} & \tco{x0==0} \\
> +	6 & \tco{r2 = *x1;} (2) & & \tco{x1==2} &
> +		\tco{r2 = *x0;} (2) & & \tco{x0==2} \\
>  \end{tabular}
>  \caption{Memory Ordering: Store-Buffering Sequence of Events}
>  \label{tab:advsync:Memory Ordering: Store-Buffering Sequence of Events}
> -- 
> 2.7.4
> 

