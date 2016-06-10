Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47260 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751382AbcFJX2l (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Fri, 10 Jun 2016 19:28:41 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5ANSf2I139982
 for <perfbook@vger.kernel.org>; Fri, 10 Jun 2016 19:28:41 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 23g1e7y8r7-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Fri,
 10 Jun 2016 19:28:40 -0400
Received: from localhost	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 10 Jun
 2016 17:28:39 -0600
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 AE43619D8042	for <perfbook@vger.kernel.org>; Fri, 10 Jun 2016 17:28:13 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5ANSXvH40632382	for <perfbook@vger.kernel.org>; Fri, 10 Jun 2016 23:28:33
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5ANSXpK013363	for <perfbook@vger.kernel.org>; Fri, 10 Jun 2016 19:28:33
 -0400
Date: Fri, 10 Jun 2016 16:28:33 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Align numbers in Performance of Mechanisms table in qqz
Reply-To: paulmck@linux.vnet.ibm.com
References: <0b81c12a-e11c-4a3a-142a-207dd813e901@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b81c12a-e11c-4a3a-142a-207dd813e901@gmail.com>
Message-Id: <20160610232833.GM3868@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 11, 2016 at 08:09:59AM +0900, Akira Yokosawa wrote:
> >From c40b0d66448dd0065130a5042e2c42cb8b68258f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 10 Jun 2016 20:45:50 +0900
> Subject: [PATCH] Align numbers in Performance of Mechanisms table in qqz
> 
> This commit does the same tweaks to the table in qqz as commit
> b17af1e7c121 ("Align numbers in Performance of Mechanisms table").
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  cpu/overheads.tex | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index 7d33c48..311c43e 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -224,9 +224,11 @@ global agreement.
>  	\hline
>  	CAS cache miss		&          95.9	&         266.4 \\
>  	\hline
> -	Comms Fabric		&       4,500	&       7,500 \\
> +	Comms Fabric		&       4,500\textcolor{white}{.0}
> +						&	7,500\textcolor{white}{.0} \\
>  	\hline
> -	Global Comms		& 195,000,000	& 324,000,000 \\
> +	Global Comms		& 195,000,000\textcolor{white}{.0}
> +						& 324,000,000\textcolor{white}{.0} \\
>  \end{tabular}
>  \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
>  \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
> -- 
> 1.9.1
> 

