Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57630 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751935AbdGFUMo (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 6
 Jul 2017 16:12:44 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v66K99X7013044
 for <perfbook@vger.kernel.org>; Thu, 6 Jul 2017 16:12:44 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2bhu1x2b0j-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 06 Jul 2017 16:12:43 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 6 Jul 2017
 16:12:42 -0400
Date: Thu, 6 Jul 2017 13:12:40 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync/memorybarriers: Fix a typo:
 s/documention/documentation
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170706180445.25261-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170706180445.25261-1-sj38.park@gmail.com>
Message-Id: <20170706201240.GP2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 07, 2017 at 03:04:45AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catch, applied and pushed, thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 4ae3ca8..659a8c2 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -54,7 +54,7 @@ After all, if \nbco{0:r2=0} as shown in the \co{exists} clause,\footnote{
>  	That is, Thread~\co{P0()}'s instance of local variable \co{r2}
>  	equals zero.
>  	See Section~\ref{sec:formal:Anatomy of a Litmus Test}
> -	for documention of litmus-test nomenclature.}
> +	for documentation of litmus-test nomenclature.}
>  we might hope that Thread~\co{P0()}'s
>  load from~\co{x1} must have happened before Thread~\co{P1()}'s store to~\co{x1},
>  which might raise
> -- 
> 2.10.0
> 

