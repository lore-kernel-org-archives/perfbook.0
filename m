Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57034 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751665AbdJ2TGt (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 29
 Oct 2017 15:06:49 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9TJ60Va107080
 for <perfbook@vger.kernel.org>; Sun, 29 Oct 2017 15:06:49 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dwj6pnhge-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 29 Oct 2017 15:06:49 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 29 Oct
 2017 15:06:48 -0400
Date: Sun, 29 Oct 2017 12:06:45 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] defer: Correct grammar
Reply-To: paulmck@linux.vnet.ibm.com
References: <3a7d438a-7b9c-8862-1f6e-3bc47e5f3c28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a7d438a-7b9c-8862-1f6e-3bc47e5f3c28@gmail.com>
Message-Id: <20171029190645.GJ3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Oct 29, 2017 at 11:37:50AM +0800, Yubin Ruan wrote:
> >From 9d049c1dcc544588c12c989ff433fa88e999e4bb Mon Sep 17 00:00:00 2001
> From: Yubin Ruan <ablacktshirt@gmail.com>
> Date: Sun, 29 Oct 2017 11:36:21 +0800
> Subject: [PATCH] defer: Correct grammar
> 
> Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>

Good catch, much clearer!  Applied and pushed, thank you!

							Thanx, Paul

> ---
>  defer/rcufundamental.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> index ef3e4d4..4c16478 100644
> --- a/defer/rcufundamental.tex
> +++ b/defer/rcufundamental.tex
> @@ -157,8 +157,8 @@ cause the values of \co{p->a}, \co{p->b}, and
>  \co{p->c} to be fetched before the value of \co{p}.
>  This is perhaps easiest to see in the case of value-speculation
>  compiler optimizations, where the compiler guesses the value
> -of \co{p} fetches \co{p->a}, \co{p->b}, and
> -\co{p->c} then fetches the actual value of \co{p}
> +of \co{p}, fetches \co{p->a}, \co{p->b}, and
> +\co{p->c}, and then fetches the actual value of \co{p}
>  in order to check whether its guess was correct.
>  This sort of optimization is quite aggressive, perhaps insanely so,
>  but does actually occur in the context of profile-driven optimization.
> -- 
> 2.7.4
> 

