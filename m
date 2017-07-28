Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40976 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751667AbdG1CVl (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 27
 Jul 2017 22:21:41 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6S2Is9d011545
 for <perfbook@vger.kernel.org>; Thu, 27 Jul 2017 22:21:41 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2byu1sjwxv-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 27 Jul 2017 22:21:41 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 27 Jul
 2017 22:21:40 -0400
Date: Thu, 27 Jul 2017 18:00:05 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Fix typo in MP litmus test
Reply-To: paulmck@linux.vnet.ibm.com
References: <8ac841a3-b0d5-de98-6956-9914cfbe28e9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ac841a3-b0d5-de98-6956-9914cfbe28e9@gmail.com>
Message-Id: <20170728010005.GV3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 28, 2017 at 06:50:38AM +0900, Akira Yokosawa wrote:
> >From 467d89c42ab562e73f891830976ccc0c8726eeed Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 27 Jul 2017 21:51:56 +0900
> Subject: [PATCH] advsync: Fix typo in MP litmus test
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, queued and pushed, thank you!

Not sure how I managed to mess this one up, but good job on spotting
it and fixing it!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 894de6d..6754ba5 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -609,8 +609,8 @@ loads and stores.
>  17   int r2;
>  18   int r3;
>  19
> -20   r2 = READ_ONCE(*x0);
> -21   r3 = READ_ONCE(*x1);
> +20   r2 = READ_ONCE(*x1);
> +21   r3 = READ_ONCE(*x0);
>  22
>  23 }
>  24
> -- 
> 2.7.4
> 

