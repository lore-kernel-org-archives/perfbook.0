Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40494 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751738AbeBYXAx (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 25 Feb 2018 18:00:53 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w1PMweQW030276
 for <perfbook@vger.kernel.org>; Sun, 25 Feb 2018 18:00:53 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2gbp1cnq7a-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 25 Feb 2018 18:00:52 -0500
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 25 Feb
 2018 18:00:52 -0500
Date: Sun, 25 Feb 2018 15:01:18 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] future/QC: Remove 'Readout' in header of 'entanglement
 error rate' row
Reply-To: paulmck@linux.vnet.ibm.com
References: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
 <20180225182303.GE2855@linux.vnet.ibm.com>
 <b8083f74-2290-0280-de67-cdcd69083502@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8083f74-2290-0280-de67-cdcd69083502@gmail.com>
Message-Id: <20180225230118.GH2855@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Feb 26, 2018 at 07:30:08AM +0900, Akira Yokosawa wrote:
> >From 4d1964b2296525414181b8e9b8fc7a77297fa838 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 26 Feb 2018 07:10:27 +0900
> Subject: [PATCH] future/QC: Remove 'Readout' in header of 'entanglement error rate' row
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Paul,
> 
> Looking at the retouched table once again, I find
> "readout of entanglement gate" doesn't make sense. The "Readout"
> in the header should be removed, shouldn't it?

It is quite confusing, now that you mention it!

I took a slightly different approach with your Reported-by, so please
take a look and tell me what you think.  I considered adding a few
qubit operators to the "Qubit Operator" heading like I did for "Qubit
Entanglement", but wasn't sure whether this would help.  Thoughts?

							Thanx, Paul

>         Thanks, Akra
> --
>  future/QC.tex | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/future/QC.tex b/future/QC.tex
> index 1afae2c..a5b1758 100644
> --- a/future/QC.tex
> +++ b/future/QC.tex
> @@ -677,26 +677,26 @@ $10^{-4}$).
>  }
> 
>  \subfloat[Multi-Qubit Gate Properties (Entanglement)]{
> -\begin{tabular}{@{}ll*{6}{S[table-format=2.2]}@{}}
> +\begin{tabular}{@{}l*{6}{S[table-format=2.2]}@{}}
>  	\toprule
> -	& & \multicolumn{6}{c}{Entanglement Connection} \\
> -	\cmidrule{3-8}
> -	\multicolumn{2}{c}{Gate Property} &
> +	 & \multicolumn{6}{c}{Entanglement Connection} \\
> +	\cmidrule{2-7}
> +	Gate Property &
>  		\multicolumn{1}{c}{CX0\_1} &
>  			\multicolumn{1}{c}{CX1\_2} &
>  				\multicolumn{1}{c}{CX0\_2} &
>  					\multicolumn{1}{c}{CX3\_2} &
>  						\multicolumn{1}{c}{CX4\_2} &
>  							\multicolumn{1}{c@{}}{CX3\_4} \\
> -	\cmidrule(r){1-2} \cmidrule{3-8}
> -	Readout & Error Rate (\%) &
> +	\cmidrule(r){1-1} \cmidrule{2-7}
> +	Error Rate (\%) &
>  		 3.46 &
>  			 4.07 &
>  				 3.26 &
>  					 2.76 &
>  						 2.23 &
>  							 2.66 \\
> -	& Fidelity (\%) &
> +	Fidelity (\%) &
>  		 96.54 &
>  			95.93 &
>  				96.74 &
> -- 
> 2.7.4
> 
> 

