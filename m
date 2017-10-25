Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47366 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751753AbdJYWk2 (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 25
 Oct 2017 18:40:28 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9PMdTbi102995
 for <perfbook@vger.kernel.org>; Wed, 25 Oct 2017 18:40:28 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2du0k0fkgc-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 25 Oct 2017 18:40:28 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 25 Oct
 2017 18:40:27 -0400
Date: Wed, 25 Oct 2017 15:40:23 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] locking: Update table layout
Reply-To: paulmck@linux.vnet.ibm.com
References: <4cfc2b83-44b8-b1b8-056d-45f88f50c316@gmail.com>
 <5dee006d-1712-5383-0670-555cef1a5836@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dee006d-1712-5383-0670-555cef1a5836@gmail.com>
Message-Id: <20171025224023.GT3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Oct 26, 2017 at 06:58:44AM +0900, Akira Yokosawa wrote:
> >From aa7899ff624e41740f4ed22eb43abf856caa6940 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 26 Oct 2017 06:51:42 +0900
> Subject: [PATCH v2] locking: Update table layout
> 
> To imply vertical lines, instead of coloring alternate rows,
> put light gray boxes in blank cells.
> 
> Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Change after v1:
>   The definition of "\x" is moved to within the "table" environment
>   to make the macro local.

Applied, verified that adding a "\x" after the table gives an error,
and pushed it out, thank you!

							Thanx, Paul

> --
>  locking/locking.tex | 41 +++++++++++++++++++----------------------
>  1 file changed, 19 insertions(+), 22 deletions(-)
> 
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 9cb0176..14db27d 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -1312,43 +1312,40 @@ or even milliseconds.
>  \label{sec:locking:Beyond Reader-Writer Locks}
> 
>  \begin{table}
> +\renewcommand*{\arraystretch}{1.2}
> +\newcommand{\x}{\textcolor{gray!20}{\rule{7pt}{7pt}}}
>  \small
>  \centering
> -\begin{tabular}{l||c|c|c|c|c|c}
> -	~ ~ ~ ~ ~ ~ ~ ~ ~
> -	& \begin{picture}(6,70)(0,0)
> +\begin{tabular}{lcccccc}
> +	\toprule
> +	& \begin{picture}(6,65)(0,0)
>  		\rotatebox{90}{Null (Not Held)}
>  	  \end{picture}
> -	& \begin{picture}(6,70)(0,0)
> +	& \begin{picture}(6,65)(0,0)
>  		\rotatebox{90}{Concurrent Read}
>  	  \end{picture}
> -	& \begin{picture}(6,70)(0,0)
> +	& \begin{picture}(6,65)(0,0)
>  		\rotatebox{90}{Concurrent Write}
>  	  \end{picture}
> -	& \begin{picture}(6,70)(0,0)
> +	& \begin{picture}(6,65)(0,0)
>  		\rotatebox{90}{Protected Read}
>  	  \end{picture}
> -	& \begin{picture}(6,70)(0,0)
> +	& \begin{picture}(6,65)(0,0)
>  		\rotatebox{90}{Protected Write}
>  	  \end{picture}
> -	& \begin{picture}(6,70)(0,0)
> +	& \begin{picture}(6,65)(0,0)
>  		\rotatebox{90}{Exclusive}
>  	  \end{picture}
>  	\\
> -	\hline
> -%				 NL  CR  CW  PR    PW  EX
> -	\hline
> -	Null (Not Held)		& ~ & ~ & ~   & ~ & ~ & ~ \\
> -	\hline
> -	Concurrent Read		& ~ & ~ & ~   & ~ & ~ & X \\
> -	\hline
> -	Concurrent Write	& ~ & ~ & ~   & X & X & X \\
> -	\hline
> -	Protected Read		& ~ & ~ & X   & ~ & X & X \\
> -	\hline
> -	Protected Write		& ~ & ~ & X   & X & X & X \\
> -	\hline
> -	Exclusive		& ~ & X & X   & X & X & X \\
> +%				  NL   CR   CW     PR   PW   EX
> +	\cmidrule(r){1-1} \cmidrule{2-7}
> +	Null (Not Held)		& \x & \x & \x   & \x & \x & \x \\
> +	Concurrent Read		& \x & \x & \x   & \x & \x &  X \\
> +	Concurrent Write	& \x & \x & \x   &  X &  X &  X \\
> +	Protected Read		& \x & \x &  X   & \x &  X &  X \\
> +	Protected Write		& \x & \x &  X   &  X &  X &  X \\
> +	Exclusive		& \x &  X &  X   &  X &  X &  X \\
> +	\bottomrule
>  \end{tabular}
>  \caption{VAX/VMS Distributed Lock Manager Policy}
>  \label{tab:locking:VAX/VMS Distributed Lock Manager Policy}
> -- 
> 2.7.4
> 
> 

