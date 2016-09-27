Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36868 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1754630AbcI0WZK (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 27 Sep 2016 18:25:10 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8RMMVRR101100
 for <perfbook@vger.kernel.org>; Tue, 27 Sep 2016 18:25:09 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 25qx61g1m4-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 27 Sep 2016 18:25:09 -0400
Received: from localhost by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 27 Sep
 2016 16:25:08 -0600
Date: Tue, 27 Sep 2016 15:25:06 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] rt: Add reference to 'CPU Isolation' Figure
Reply-To: paulmck@linux.vnet.ibm.com
References: <696869d9-ec61-486c-1ec9-410d24db040b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <696869d9-ec61-486c-1ec9-410d24db040b@gmail.com>
Message-Id: <20160927222506.GS14933@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Sep 21, 2016 at 11:35:54PM +0900, Akira Yokosawa wrote:
> >From 477cba521e27c927375b393ce5547ec824f0a05c Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 21 Sep 2016 23:27:13 +0900
> Subject: [PATCH] rt: Add reference to 'CPU Isolation' Figure
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  rt/rt.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rt/rt.tex b/rt/rt.tex
> index e73ba0a..88693d1 100644
> --- a/rt/rt.tex
> +++ b/rt/rt.tex
> @@ -780,7 +780,7 @@ Section~\ref{sec:rt:Event-Driven Real-Time Support}.
> 
>  A final approach is simply to get everything out of the way of the
>  real-time process, clearing all other processing off of any CPUs that
> -this process needs.
> +this process needs, as shown in Figure~\ref{fig:rt:CPU Isolation}.
>  This was implemented in the 3.10 Linux kernel via the \co{CONFIG_NO_HZ_FULL}
>  Kconfig parameter~\cite{FredericWeisbecker2013nohz}.
>  % Need to fweisbec citation's URL. @@@
> -- 
> 1.9.1
> 

