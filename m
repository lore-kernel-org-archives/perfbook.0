Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42075 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751761AbdF3XdN (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 30
 Jun 2017 19:33:13 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5UNTQgt010637
 for <perfbook@vger.kernel.org>; Fri, 30 Jun 2017 19:33:12 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2bdxm8u2wc-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 30 Jun 2017 19:33:12 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 30 Jun
 2017 19:33:11 -0400
Date: Fri, 30 Jun 2017 16:33:09 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Move footnote to avoid confusion
Reply-To: paulmck@linux.vnet.ibm.com
References: <e2fe6182-afed-b38d-c1f0-25916e072b0f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2fe6182-afed-b38d-c1f0-25916e072b0f@gmail.com>
Message-Id: <20170630233309.GM2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jul 01, 2017 at 06:48:14AM +0900, Akira Yokosawa wrote:
> >From b1ef8b3ee5697202ae96fc8c7ebd85633aa0a703 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 30 Jun 2017 21:23:07 +0900
> Subject: [PATCH] advsync: Move footnote to avoid confusion
> 
> This footnote marker placed just after number "0" looks like as if
> it were math mode $0^1$. Move the marker backward to avoid confusion.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes, queued and pushed!

I am so used to seeing things like 0:r2=0 as separate entities that
the possibility of superscript confusion didn't even occur to me.  ;-)

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 03ad184..a2e4a20 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -50,12 +50,12 @@ code that fails to use standard mechanisms.
>  For example, the trivial-seeming litmus test in
>  Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
>  appears to guarantee that the \co{exists} clause is never satisfied.
> -After all, if \nbco{0:r2=0}\footnote{
> +After all, if \nbco{0:r2=0} as shown in the \co{exists} clause,\footnote{
>  	That is, Thread~\co{P0()}'s instance of local variable \co{r2}
>  	equals zero.
>  	See Section~\ref{sec:formal:Anatomy of a Litmus Test}
>  	for documention of litmus-test nomenclature.}
> -as shown in the \co{exists} clause, we might hope that Thread~\co{P0()}'s
> +we might hope that Thread~\co{P0()}'s
>  load from~\co{x1} must have happened before Thread~\co{P1()}'s store to~\co{x1},
>  which might raise
>  further hopes that Thread~\co{P1()}'s load from~\co{x0} must happen after
> -- 
> 2.7.4
> 

