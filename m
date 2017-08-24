Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39783 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1753712AbdHXQub (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 24
 Aug 2017 12:50:31 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7OGnhVW076206
 for <perfbook@vger.kernel.org>; Thu, 24 Aug 2017 12:50:31 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cj15k5t09-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 24 Aug 2017 12:50:30 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 24 Aug
 2017 12:50:29 -0400
Date: Thu, 24 Aug 2017 09:50:35 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Fix typo
Reply-To: paulmck@linux.vnet.ibm.com
References: <80b3d435-7485-0e5c-ba2d-c2d8c463f4a7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80b3d435-7485-0e5c-ba2d-c2d8c463f4a7@gmail.com>
Message-Id: <20170824165035.GR11320@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Aug 24, 2017 at 11:49:54PM +0900, Akira Yokosawa wrote:
> >From 8d70beda36d683ee6869581155db91153b68338c Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 24 Aug 2017 23:30:50 +0900
> Subject: [PATCH] advsync: Fix typo
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> This patch fixes a few typos after your self-review.
> I'm not sure if the 1st hunk of "stop -> step" is necessary.
> If "stop" was your intended word choice, please omit it.

I took your second and third changes, and added words in a separate commit
to (hopefully) clarify "stop" as in "stop along a journey".  Please let
me know what you think!

							Thanx, Paul

>      Thanks, Akira
> --
>  advsync/memorybarriers.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index dd8acf8..db6d486 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -341,7 +341,7 @@ exists (1:r2=0 /\ 0:r2=0)
>  However, if you need to implement the synchronization primitives
>  themselves, or if you are simply interested in understanding how memory
>  ordering and memory barriers work, read on!
> -The first stop is
> +The first step is
>  Listing~\ref{lst:advsync:Memory Ordering: Store-Buffering Litmus Test}
>  (\path{C-SB+o-mb-o+o-mb-o.litmus}),
>  which the \co{smp_mb()} Linux-kernel full memory barrier placed between
> @@ -613,7 +613,7 @@ Section~\ref{sec:advsync:Memory Ordering and Memory Barriers}
>  showed that even relatively strongly ordered systems like x86
>  can reorder prior stores with later loads, at least when the
>  store and load are to different variables.
> -This section buids on that result, looking at the other combinations of
> +This section builds on that result, looking at the other combinations of
>  loads and stores.
> 
>  % @@@ Rationale for further reordering.
> @@ -665,7 +665,7 @@ but no ordering is specified for the reads.
>  Relatively strongly ordered architectures, such as x86, do enforce ordering.
>  However, weakly ordered architectures often do
>  not~\cite{JadeAlglave2011ppcmem}.
> -Therefore, the \co{exists} clause on line~25 of the figure \emph{can}
> +Therefore, the \co{exists} clause on line~25 of the listing \emph{can}
>  trigger.
> 
>  \begin{listing}[tbp]
> -- 
> 2.7.4
> 

