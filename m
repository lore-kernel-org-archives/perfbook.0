Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54642 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751977AbdJYT0Z (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 25 Oct 2017 15:26:25 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9PJPN5L022341
 for <perfbook@vger.kernel.org>; Wed, 25 Oct 2017 15:26:25 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2du0k40er5-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 25 Oct 2017 15:26:24 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 25 Oct
 2017 15:26:24 -0400
Date: Wed, 25 Oct 2017 12:26:21 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] defer/rcuapi: Move sidewaystable caption to top
Reply-To: paulmck@linux.vnet.ibm.com
References: <4cfc2b83-44b8-b1b8-056d-45f88f50c316@gmail.com>
 <78a844fd-a4dc-c387-2b07-c25e8d606f7b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78a844fd-a4dc-c387-2b07-c25e8d606f7b@gmail.com>
Message-Id: <20171025192621.GP3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 24, 2017 at 10:27:07PM +0900, Akira Yokosawa wrote:
> >From 72c667546d964d7fd40a1f21a6475c62e364e77c Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 24 Oct 2017 22:15:27 +0900
> Subject: [PATCH 2/2] defer/rcuapi: Move sidewaystable caption to top
> 
> Captions of sidewaystables can't be controled by float package's
> styles. We need to move the caption in LaTeX source.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
>  defer/rcuapi.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index 6da4676..d4e434d 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -20,6 +20,8 @@ presents concluding remarks.
>  \rowcolors{1}{}{lightgray}
>  \renewcommand*{\arraystretch}{1.3}
>  \centering
> +\caption{RCU Wait-to-Finish APIs}
> +\label{tab:defer:RCU Wait-to-Finish APIs}
>  \footnotesize
>  \begin{tabularx}{7.9in}{>{\raggedright\arraybackslash}p{1.08in}
>      >{\raggedright\arraybackslash}X
> @@ -115,8 +117,6 @@ Non-\tco{PREEMPT_RT} implementation &
>  		    SRCU \\
>  \bottomrule
>  \end{tabularx}
> -\caption{RCU Wait-to-Finish APIs}
> -\label{tab:defer:RCU Wait-to-Finish APIs}
>  \end{sidewaystable*}
> 
>  The most straightforward answer to ``what is RCU'' is that RCU is
> -- 
> 2.7.4
> 
> 

