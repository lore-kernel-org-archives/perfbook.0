Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51150 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S932921AbdKAOvu (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed,
 1 Nov 2017 10:51:50 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vA1EnLDq078435
 for <perfbook@vger.kernel.org>; Wed, 1 Nov 2017 10:51:49 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2dyd2r4b3f-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 01 Nov 2017 10:51:48 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 1 Nov 2017
 10:51:47 -0400
Date: Wed, 1 Nov 2017 07:51:45 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Adjust height of Table 15.5's header
Reply-To: paulmck@linux.vnet.ibm.com
References: <0337637d-91f3-df97-7dd0-2f7b66676145@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0337637d-91f3-df97-7dd0-2f7b66676145@gmail.com>
Message-Id: <20171101145145.GR3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Nov 01, 2017 at 11:27:10PM +0900, Akira Yokosawa wrote:
> >From a7e4a7ee67e980055dbef5808b89335fc0eba483 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 1 Nov 2017 23:14:44 +0900
> Subject: [PATCH] memorder: Adjust height of Table 15.5's header
> 
> While we are here, for the ease of maintenance of the table,
> define a helper macro "\cpufml{}" to be used in the header.
> 
> Also adjust hspace for 1c layout and comment out a paragraph
> which is pointless for the moment.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch on the stray paragraph, and \cpufml{} does make things much
nicer, thank you!!!  Queued and pushed.

There is another tables that could use this trick in locking/locking.tex.
I believe that the definitions should be local to each table because
the heights differ, and which quite oddly seem to need to be hard-coded.

							Thanx, Paul

> ---
>  memorder/memorder.tex | 45 ++++++++++++++-------------------------------
>  1 file changed, 14 insertions(+), 31 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index db5e065..b7d20f0 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -3980,39 +3980,22 @@ dependencies.
>  \rowcolors{4}{}{lightgray}
>  \small
>  \centering
> -\renewcommand*{\arraystretch}{1.2}\OneColumnHSpace{-.6in}
> +\newcommand{\cpufml}[1]{\begin{picture}(6,50)(0,0)\rotatebox{90}{#1}\end{picture}}
> +\renewcommand*{\arraystretch}{1.2}\OneColumnHSpace{-.35in}
>  \begin{tabular}{llccccccccc}
>  	\toprule
>  	\multicolumn{2}{l}{~} & \multicolumn{9}{c}{CPU Family} \\
>  	\cmidrule{3-11}
>  	\multicolumn{2}{c}{\raisebox{.5ex}{Property}}
> -	& \begin{picture}(6,60)(0,0)
> -		\rotatebox{90}{Alpha}
> -	  \end{picture}
> -	& \begin{picture}(6,60)(0,0)
> -		\rotatebox{90}{ARMv8}
> -	  \end{picture}
> -	& \begin{picture}(6,60)(0,0)
> -		\rotatebox{90}{ARMv7-A/R}
> -	  \end{picture}
> -	& \begin{picture}(6,60)(0,0)
> -		\rotatebox{90}{Itanium}
> -	  \end{picture}
> -	& \begin{picture}(6,60)(0,0)
> -		\rotatebox{90}{MIPS}
> -	  \end{picture}
> -	& \begin{picture}(6,60)(0,0)
> -		\rotatebox{90}{\Power{}}
> -	  \end{picture}
> -	& \begin{picture}(6,60)(0,0)
> -		\rotatebox{90}{SPARC TSO}
> -	  \end{picture}
> -	& \begin{picture}(6,60)(0,0)
> -		\rotatebox{90}{x86}
> -	  \end{picture}
> -	& \begin{picture}(6,60)(0,0)
> -		\rotatebox{90}{z~Systems}
> -	  \end{picture}
> +	& \cpufml{Alpha}
> +	& \cpufml{ARMv8}
> +	& \cpufml{ARMv7-A/R}
> +	& \cpufml{Itanium}
> +	& \cpufml{MIPS}
> +	& \cpufml{\Power{}}
> +	& \cpufml{SPARC TSO}
> +	& \cpufml{x86}
> +	& \cpufml{z~Systems}
>  	\\
>  	\cmidrule(r){1-2} \cmidrule{3-11}
>  %		 Alpha ARMv8 ARMv7 Itanium MIPS PPC SPARC x86 z Systems
> @@ -4070,7 +4053,7 @@ dependencies.
>  	~ & ~ & C: & Compare-and-exchange instruction \\
>  	~ & ~ & L: & Load-linked/store-conditional instruction \\
>  \end{tabular}
> -}\OneColumnHSpace{-0.7in}
> +}\OneColumnHSpace{-0.4in}
>  \caption{Summary of Memory Ordering}
>  \label{tab:memorder:Summary of Memory Ordering}
>  \end{table*}
> @@ -4132,8 +4115,8 @@ instruction cache and pipeline.
>  Such CPUs require special instructions be executed for self-modifying
>  code.
> 
> -Parenthesized CPU names indicate modes that are architecturally allowed,
> -but rarely used in practice.
> +%Parenthesized CPU names indicate modes that are architecturally allowed,
> +%but rarely used in practice.
> 
>  The common ``just say no'' approach to memory-ordering operations
>  can be eminently reasonable where it applies,
> -- 
> 2.7.4
> 

