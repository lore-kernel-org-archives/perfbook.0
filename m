Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49598 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726060AbfDZOR5 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 26 Apr 2019 10:17:57 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3QEEtcn079498
        for <perfbook@vger.kernel.org>; Fri, 26 Apr 2019 10:17:56 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2s42mdm7uj-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Fri, 26 Apr 2019 10:17:56 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 26 Apr 2019 15:17:55 +0100
Date: Fri, 26 Apr 2019 07:17:50 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 1/5] toolsoftrade: Polish an ambiguous sentence
Reply-To: paulmck@linux.ibm.com
References: <20190426005704.10952-1-sj38.park@gmail.com>
 <20190426005704.10952-2-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190426005704.10952-2-sj38.park@gmail.com>
Message-Id: <20190426141750.GE3923@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 26, 2019 at 09:57:00AM +0900, SeongJae Park wrote:
> A sentence calls a 'signal or interrupt handler' as 'interrupt handler'.
> This commit modifies the sentence to call it just a handler to minimize
> any confusion.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes!!!  All five applied and pushed, thank you!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 4e0764d..1cf118b 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -2365,8 +2365,8 @@ for other accesses to that same variable:
>  	All other code must use \co{READ_ONCE()} and \co{WRITE_ONCE()}.
>  \item	A shared variable is only accessed by a given CPU or thread
>  	and by a signal or interrupt handler running in that CPU's
> -	or thread's context, and the interrupt handler always restores
> -	the values of any variables that it has written before return.
> +	or thread's context, and the handler always restores the values of any
> +	variables that it has written before return.
>  	The handler can use plain loads and stores, as can any code
>  	that has prevented the handler from being invoked, that is,
>  	code that has blocked signals and/or interrupts.
> -- 
> 2.10.0
> 

