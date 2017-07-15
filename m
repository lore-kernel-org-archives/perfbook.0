Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41124 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751192AbdGOMHr (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 15 Jul 2017 08:07:47 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6FBwTPR018680
 for <perfbook@vger.kernel.org>; Sat, 15 Jul 2017 08:07:47 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2bqf2bnxu8-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 15 Jul 2017 08:07:46 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 15 Jul
 2017 08:07:46 -0400
Date: Sat, 15 Jul 2017 05:07:42 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Readjust spacing for one-column layout
Reply-To: paulmck@linux.vnet.ibm.com
References: <7b4d4adf-c186-554f-9d14-58267cc29715@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b4d4adf-c186-554f-9d14-58267cc29715@gmail.com>
Message-Id: <20170715120742.GA2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 14, 2017 at 07:28:44AM +0900, Akira Yokosawa wrote:
> >From 451df962a4cd6a0138714f1ddde5bc82e0fb04a9 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 14 Jul 2017 07:18:09 +0900
> Subject: [PATCH] advsync: Readjust spacing for one-column layout
> 
> The spacing parameters in commit 360582b94cb2 ("advsync: Adjust
> spacing in Tables 14.1 and 14.2, consistent indirection") was
> chosen for different changes of the tables in mind. Readjust them
> to match the now narrower tables.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied, thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index c9c975c..0fd0b87 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -179,7 +179,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
> 
>  \begin{table*}
>  \small
> -\centering\OneColumnHSpace{-.2in}
> +\centering\OneColumnHSpace{-0.1in}
>  \begin{tabular}{r||l|l|l||l|l|l}
>  	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
>  	\cline{2-7}
> @@ -343,7 +343,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
> 
>  \begin{table*}
>  \small
> -\centering\OneColumnHSpace{-0.2in}
> +\centering\OneColumnHSpace{-0.1in}
>  \begin{tabular}{r||l|l|l||l|l|l}
>  	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
>  	\cline{2-7}
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

