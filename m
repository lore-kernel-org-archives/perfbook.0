Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50968 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751573AbdJWSAx (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 23
 Oct 2017 14:00:53 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9NI04gb109545
 for <perfbook@vger.kernel.org>; Mon, 23 Oct 2017 14:00:53 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dsjy2xn76-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 23 Oct 2017 14:00:50 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 23 Oct
 2017 14:00:46 -0400
Date: Mon, 23 Oct 2017 11:00:43 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] whymb: Update table layout
Reply-To: paulmck@linux.vnet.ibm.com
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
 <20171023022430.GJ3659@linux.vnet.ibm.com>
 <96ff162d-2670-3038-f9c8-c6921d4f374c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96ff162d-2670-3038-f9c8-c6921d4f374c@gmail.com>
Message-Id: <20171023180043.GQ3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 24, 2017 at 12:27:59AM +0900, Akira Yokosawa wrote:
> >From 0bec999ee614a8c92d42876957b1072329b62829 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 23 Oct 2017 23:13:26 +0900
> Subject: [PATCH 1/3] whymb: Update table layout
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

All three look good, queued and pushed, thank you!

							Thanx, Paul

> ---
>  appendix/whymb/whymemorybarriers.tex | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index b52c2e5..422948e 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -565,29 +565,25 @@ Finally, CPU~1 reads the cache line at address~8, which uses a
>  \begin{table*}
>  \small
>  \centering
> -\begin{tabular}{r|c|l||c|c|c|c||c|c}
> -	& & & \multicolumn{4}{c||}{CPU Cache} & \multicolumn{2}{c}{Memory} \\
> -	\cline{4-7}
> +\renewcommand*{\arraystretch}{1.2}
> +\rowcolors{6}{}{lightgray}
> +\begin{tabular}{rclcccccc}
> +	\toprule
> +	& & & \multicolumn{4}{c}{CPU Cache} & \multicolumn{2}{c}{Memory} \\
> +	\cmidrule(lr){4-7} \cmidrule(l){8-9}
>  	Sequence \# & CPU \# & Operation & 0 & 1 & 2 & 3 & 0 & 8 \\
> -	\hline
> +	\cmidrule(r){1-3} \cmidrule(lr){4-7} \cmidrule(l){8-9}
>  %	Seq CPU Operation	------------- CPU -------------   - Memory -
>  %				   0	   1	   2	   3	    0   8
> -	\hline
>  	0 &   & Initial State	& $-$/I & $-$/I & $-$/I & $-$/I   & V & V \\
> -	\hline
>  	1 & 0 & Load		& 0/S &   $-$/I & $-$/I & $-$/I   & V & V \\
> -	\hline
>  	2 & 3 & Load		& 0/S &   $-$/I & $-$/I & 0/S     & V & V \\
> -	\hline
>  	3 & 0 & Invalidation	& 8/S &   $-$/I & $-$/I & 0/S     & V & V \\
> -	\hline
>  	4 & 2 & RMW		& 8/S &   $-$/I & 0/E &   $-$/I   & V & V \\
> -	\hline
>  	5 & 2 & Store		& 8/S &   $-$/I & 0/M &   $-$/I   & I & V \\
> -	\hline
>  	6 & 1 & Atomic Inc	& 8/S &   0/M &   $-$/I & $-$/I   & I & V \\
> -	\hline
>  	7 & 1 & Writeback	& 8/S &   8/S &   $-$/I & $-$/I   & V & V \\
> +	\bottomrule
>  \end{tabular}
>  \caption{Cache Coherence Example}
>  \label{tab:app:whymb:Cache Coherence Example}
> -- 
> 2.7.4
> 
> 

