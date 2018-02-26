Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60968 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751455AbeBZQhV (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 26 Feb 2018 11:37:21 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w1QGbHfe036998
 for <perfbook@vger.kernel.org>; Mon, 26 Feb 2018 11:37:20 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2gcm1enc21-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 26 Feb 2018 11:37:17 -0500
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 26 Feb
 2018 11:35:20 -0500
Date: Mon, 26 Feb 2018 08:35:45 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] future/QC: Tweak horizontal spacing of Table 17.5
Reply-To: paulmck@linux.vnet.ibm.com
References: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
 <20180225182303.GE2855@linux.vnet.ibm.com>
 <b8083f74-2290-0280-de67-cdcd69083502@gmail.com>
 <20180225230118.GH2855@linux.vnet.ibm.com>
 <ed46ece9-7825-3204-a101-a16982e44af8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed46ece9-7825-3204-a101-a16982e44af8@gmail.com>
Message-Id: <20180226163545.GO2855@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Feb 27, 2018 at 12:38:53AM +0900, Akira Yokosawa wrote:
> >From ff12fb77a17717794935078d8068c1718e867c56 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 26 Feb 2018 23:56:48 +0900
> Subject: [PATCH] future/QC: Tweak horizontal spacing of Table 17.5
> 
> By employing \multirow command of the "multirow" package, the width
> of the 1st column of entanglement table can be reduced.
> 
> Note: The 1st argument of \multirow specifies the number of rows to span,
> and the 2nd argument, in this case {1in}, specifies the width of the
> column. Internally it is translated to a \parbox. 
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Much better, and thank you again!  Queued and pushed.

							Thanx, Paul

> ---
> Hi Paul,
> 
> Other header structures can be possible, but this looks good enough
> for the moment.
> 
>         Thanks, Akira
> --
>  future/QC.tex | 3 ++-
>  perfbook.tex  | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/future/QC.tex b/future/QC.tex
> index bbddf83..13e5dd7 100644
> --- a/future/QC.tex
> +++ b/future/QC.tex
> @@ -674,6 +674,7 @@ $10^{-4}$).
>  \end{tabular}
>  }
> 
> +\OneColumnHSpace{-0.15in}%
>  \subfloat[Multi-Qubit Gate Properties]{
>  \begin{tabular}{@{}ll*{6}{S[table-format=2.2]}@{}}
>  	\toprule
> @@ -686,7 +687,7 @@ $10^{-4}$).
>  						\multicolumn{1}{c}{CX4\_2} &
>  							\multicolumn{1}{c@{}}{CX3\_4} \\
>  	\cmidrule(r){1-2} \cmidrule{3-8}
> -	Qubit Entanglement (\qop{CNOT}) & Error Rate (\%) &
> +	\multirow{2}{1in}{Qubit Entanglement (\qop{CNOT})} & Error Rate (\%) &
>  		 3.46 &
>  			 4.07 &
>  				 3.26 &
> diff --git a/perfbook.tex b/perfbook.tex
> index 8c2288a..efb6750 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -59,6 +59,7 @@
>  \usepackage{braket} % for \ket{} macro in QC section
>  \usepackage{siunitx} % for \num{} macro
>  \sisetup{group-minimum-digits=4,group-separator={,},group-digits=integer}
> +\usepackage{multirow}
> 
>  % custom packages
> 
> -- 
> 2.7.4
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

