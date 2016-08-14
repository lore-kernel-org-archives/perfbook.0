Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56594 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751243AbcHNIrA (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Sun, 14 Aug 2016 04:47:00 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u7E2XnBa110124
 for <perfbook@vger.kernel.org>; Sat, 13 Aug 2016 22:35:26 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24svfw2vra-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sat,
 13 Aug 2016 22:35:26 -0400
Received: from localhost	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 13 Aug
 2016 20:35:26 -0600
Date: Sat, 13 Aug 2016 19:35:30 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Some more hyphenation of compound words
Reply-To: paulmck@linux.vnet.ibm.com
References: <fde6fc31-0847-2395-0e7d-ecefcdb50444@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fde6fc31-0847-2395-0e7d-ecefcdb50444@gmail.com>
Message-Id: <20160814023530.GF3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Aug 12, 2016 at 06:12:32PM +0900, Akira Yokosawa wrote:
> >From 9761c723cb8a53b257878fd4fff0b042d0ccebbb Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 10 Aug 2016 20:30:56 +0900
> Subject: [PATCH] Some more hyphenation of compound words
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued, thank you!

							Thanx, Paul

> ---
>  SMPdesign/criteria.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
> index a84f301..f2f4602 100644
> --- a/SMPdesign/criteria.tex
> +++ b/SMPdesign/criteria.tex
> @@ -48,7 +48,7 @@ contention, overhead, read-to-write ratio, and complexity:
>  	This may be lock contention, memory contention, or a host
>  	of other performance killers.
>  \item[Work-to-Synchronization Ratio:]  A uniprocessor,
> -	single-threaded, non-preemptible, and non-interruptible\footnote{
> +	single\-/threaded, non-preemptible, and non\-/interruptible\footnote{
>  		Either by masking interrupts or by being oblivious to them.}
>  	version of a given parallel
>  	program would not need any synchronization primitives.
> -- 
> 1.9.1
> 

