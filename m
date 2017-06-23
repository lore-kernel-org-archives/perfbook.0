Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38534 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1754126AbdFWRai (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Fri, 23 Jun 2017 13:30:38 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5NHTJJK004443
 for <perfbook@vger.kernel.org>; Fri, 23 Jun 2017 13:30:37 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2b93r6j8v2-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 23 Jun 2017 13:30:37 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 23 Jun
 2017 13:30:36 -0400
Date: Fri, 23 Jun 2017 10:30:33 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Substitute 'Figure' for 'Table'
Reply-To: paulmck@linux.vnet.ibm.com
References: <4ce849ae-c0d1-bbee-1438-fa953206d7a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ce849ae-c0d1-bbee-1438-fa953206d7a4@gmail.com>
Message-Id: <20170623173033.GN3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 24, 2017 at 12:17:50AM +0900, Akira Yokosawa wrote:
> >From b65cb246b772bf16020ef1f1dab55208a5444fcd Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 24 Jun 2017 00:04:14 +0900
> Subject: [PATCH] advsync: Substitute 'Figure' for 'Table'
> 
> Commit 96ab6febd94c ("advsync: Convert memory-misordering table to
> herd7 litmus test") missed these substitutions.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I knew I was forgetting something! ;-)

Good catch, queued and pushed, thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index f165946..901c5a6 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -49,7 +49,7 @@ Unfortunately, these intuitions break down completely in face of
>  code that makes direct use of explicit memory barriers for data structures
>  in shared memory.
>  For example, the litmus test in
> -Table~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
> +Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
>  appears to guarantee that the assertion never fires.
>  After all, if \nbco{0:r2=0},\footnote{
>  	That is, Thread~\co{P0()}'s instance of local variable \co{r2}
> @@ -65,7 +65,7 @@ assertion.
>  The example is symmetric, so similar hopeful reasoning might lead
>  us to hope that \nbco{1:r2=0} guarantees that \nbco{0:r2=1}.
>  Unfortunately, the lack of memory barriers in
> -Table~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
> +Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
>  dashes these hopes.
>  Both the compiler and the CPU are within their rights to reorder
>  the statements within both Thread~\co{P0()} and Thread~\co{P1()},
> -- 
> 2.7.4
> 

