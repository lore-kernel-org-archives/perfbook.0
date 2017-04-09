Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35512 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752511AbdDIRjn (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 9 Apr 2017 13:39:43 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v39HcWsu058360
 for <perfbook@vger.kernel.org>; Sun, 9 Apr 2017 13:39:42 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 29qs13gtqg-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 09 Apr 2017 13:39:42 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 9 Apr 2017
 13:39:41 -0400
Date: Sun, 9 Apr 2017 10:39:38 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] toolsoftrade: Typo fix and context adjustment
Reply-To: paulmck@linux.vnet.ibm.com
References: <b9d8dcca-eeec-dab7-e7c4-535187f15c1c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9d8dcca-eeec-dab7-e7c4-535187f15c1c@gmail.com>
Message-Id: <20170409173938.GN1600@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Apr 09, 2017 at 08:02:23PM +0900, Akira Yokosawa wrote:
> >From 80b39e5d9acfec943c28d41077494be696d4ac60 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 9 Apr 2017 18:54:40 +0900
> Subject: [PATCH] toolsoftrade: Typo fix and context adjustment
> 
> There are three primitives introduced here now: barrier(),
> READ_ONCE(), and WRITE_ONCE().
> 
> Fixes: 7945ae1a06c5 ("Further editing to Tools of Trade")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, applied, thank you!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index c225bee..483d287 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1247,8 +1247,8 @@ avoids optimizing away a given memory read, in which case the
>  \co{READ_ONCE()} primitive may be used, as it was on line~17 of
>  Figure~\ref{fig:toolsoftrade:Demonstration of Exclusive Locks}.
>  Similarly, the \co{WRITE_ONCE()} primitive may be used to prevent the
> -compiler from optimizing a way a given memory write.
> -These last two primitives are not provided directly by gcc,
> +compiler from optimizing away a given memory write.
> +These last three primitives are not provided directly by gcc,
>  but may be implemented straightforwardly as follows:
> 
>  \vspace{5pt}
> -- 
> 2.7.4
> 

