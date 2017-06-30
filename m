Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54853 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751333AbdF3AQO (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 29 Jun 2017 20:16:14 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5U0Dkvi150400
 for <perfbook@vger.kernel.org>; Thu, 29 Jun 2017 20:16:13 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2bcv5rs8xu-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 29 Jun 2017 20:16:13 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 29 Jun
 2017 20:16:12 -0400
Date: Thu, 29 Jun 2017 17:16:11 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Trivial typo fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <58a4e2f1-3296-f9a7-5d50-2f7896783341@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58a4e2f1-3296-f9a7-5d50-2f7896783341@gmail.com>
Message-Id: <20170630001611.GK2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jun 30, 2017 at 12:20:20AM +0900, Akira Yokosawa wrote:
> >From 309126f6728e3b2b9abf98f77fc97788afb527ea Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 30 Jun 2017 00:10:01 +0900
> Subject: [PATCH] advsync: Trivial typo fixes
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes!  Applied and pushed, thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index dfa7681..03ad184 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -136,7 +136,7 @@ from multiple CPUs to a set of shared variables.
>  In cache-coherent systems, if the caches hold multiple copies of a given
>  variable, all the copies of that variable must have the same value.
>  This works extremely well for concurrent reads, but not so well for
> -concurrent writes:  Each write musd do something about all
> +concurrent writes:  Each write must do something about all
>  copies of the old value (another cache miss!), which, given the finite
>  speed of light and the atomic nature of matter, will be slower
>  than impatient software hackers would like.
> @@ -163,7 +163,7 @@ of order, which can in turn cause serious confusion, as illustrated in
>  Figure~\ref{fig:advsync:CPUs Can Do Things Out of Order}.
>  In particular, these store buffers can cause the memory misordering
>  shown in the store-buffering litmus test in
> -Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
> +Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
> 
>  % @@@ More here.  Some sort of illustration of store-buffering misordering
> 
> -- 
> 2.7.4
> 

