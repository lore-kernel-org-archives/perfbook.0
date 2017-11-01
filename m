Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54386 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S933449AbdKAWsJ (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed,
 1 Nov 2017 18:48:09 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vA1MhtRp050832
 for <perfbook@vger.kernel.org>; Wed, 1 Nov 2017 18:48:08 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dynu83qs5-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 01 Nov 2017 18:48:08 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 1 Nov 2017
 18:48:07 -0400
Date: Wed, 1 Nov 2017 15:48:04 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] locking: Use helper macro in Table 7.1
Reply-To: paulmck@linux.vnet.ibm.com
References: <0337637d-91f3-df97-7dd0-2f7b66676145@gmail.com>
 <20171101145145.GR3659@linux.vnet.ibm.com>
 <e1024867-a2d4-1b6c-72aa-24c716ebc2f1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1024867-a2d4-1b6c-72aa-24c716ebc2f1@gmail.com>
Message-Id: <20171101224804.GY3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Nov 02, 2017 at 07:09:26AM +0900, Akira Yokosawa wrote:
> >From af9e5f272a12304067120b79a86d6673b605b7b3 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 2 Nov 2017 07:02:07 +0900
> Subject: [PATCH] locking: Use helper macro in Table 7.1
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied, thank you very much!

							Thanx, Paul

> ---
>  locking/locking.tex | 25 +++++++------------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 025320b..12a0240 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -1314,28 +1314,17 @@ or even milliseconds.
>  \begin{table}
>  \renewcommand*{\arraystretch}{1.2}
>  \newcommand{\x}{\textcolor{gray!20}{\rule{7pt}{7pt}}}
> +\newcommand{\rothead}[1]{\begin{picture}(6,65)(0,0)\rotatebox{90}{#1}\end{picture}}
>  \small
>  \centering
>  \begin{tabular}{lcccccc}
>  	\toprule
> -	& \begin{picture}(6,65)(0,0)
> -		\rotatebox{90}{Null (Not Held)}
> -	  \end{picture}
> -	& \begin{picture}(6,65)(0,0)
> -		\rotatebox{90}{Concurrent Read}
> -	  \end{picture}
> -	& \begin{picture}(6,65)(0,0)
> -		\rotatebox{90}{Concurrent Write}
> -	  \end{picture}
> -	& \begin{picture}(6,65)(0,0)
> -		\rotatebox{90}{Protected Read}
> -	  \end{picture}
> -	& \begin{picture}(6,65)(0,0)
> -		\rotatebox{90}{Protected Write}
> -	  \end{picture}
> -	& \begin{picture}(6,65)(0,0)
> -		\rotatebox{90}{Exclusive}
> -	  \end{picture}
> +	& \rothead{Null (Not Held)}
> +	& \rothead{Concurrent Read}
> +	& \rothead{Concurrent Write}
> +	& \rothead{Protected Read}
> +	& \rothead{Protected Write}
> +	& \rothead{Exclusive}
>  	\\
>  %				  NL   CR   CW     PR   PW   EX
>  	\cmidrule(r){1-1} \cmidrule{2-7}
> -- 
> 2.7.4
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

