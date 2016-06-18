Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14231 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1750918AbcFRD5h (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 17
 Jun 2016 23:57:37 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5I3sWv1018074
 for <perfbook@vger.kernel.org>; Fri, 17 Jun 2016 23:57:37 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 23kr63c4vs-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Fri,
 17 Jun 2016 23:57:37 -0400
Received: from localhost	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 17 Jun
 2016 21:57:36 -0600
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 2318819D8026	for <perfbook@vger.kernel.org>; Fri, 17 Jun 2016 21:57:12 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5I3vYJY44826702	for <perfbook@vger.kernel.org>; Sat, 18 Jun 2016 03:57:34
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5I3vWvY027633	for <perfbook@vger.kernel.org>; Fri, 17 Jun 2016 23:57:32
 -0400
Date: Fri, 17 Jun 2016 20:57:31 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] cpu: Fix numbers in Performance of Mechanisms tables
Reply-To: paulmck@linux.vnet.ibm.com
References: <9b971ea3-e84c-b4e1-e75b-7c545b24f7e3@gmail.com>
 <20160615235138.GG3923@linux.vnet.ibm.com>
 <aa44a017-bd59-6961-b968-d40eadd81579@gmail.com>
 <5bf94f38-609b-c37f-4cab-458fc6de142c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bf94f38-609b-c37f-4cab-458fc6de142c@gmail.com>
Message-Id: <20160618035731.GJ3923@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 18, 2016 at 11:50:53AM +0900, Akira Yokosawa wrote:
> >From 3b2c58c7e7f7abe4303383437502513f948d7401 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 18 Jun 2016 10:38:57 +0900
> Subject: [PATCH v2] cpu: Fix numbers in Performance of Mechanisms tables
> 
> Numbers given in 'Comms Fabric' and 'Global Comms' rows in
> Table D.1 seem inconsistent.
> 
> 'Comms Fabric' latency in Table 3.1 is 3 microsecond.
> The latency of Infiniband DDR, which was available in 2005 (at the
> time of AMD Opteron 844) is 2.5 microsecond.
> 'Comms Fabric' latency in Table D.1 is 4.5 microsecond.
> The latency of Infiniband QDR, which was available in 2009 (at the
> time of Intel X5550 (Nehalem)) is 1.3 microsecond.
> These latencies are of one-way communication.
> In the other rows in the tables, costs are for at least one round-
> trip. So we need to double these numbers for consistency.
> 
> For 'Comms Fabric', we'd be better to use 5 microsecond in Table 3.1,
> and 2.6 microsecond in Table D.1.
> 
> Of course, these numbers are for bast cases. Actual latency would
> depend on the topology and the configuration of fabric.
> 
> 'Global Comms' latency in Table 3.1 is 130 ms.
> This is based on the speed-of-light in vacuum.
> On the other hand, 'Global Comms' latency in Table D.1 is 195 ms.
> This is based on the speed-of-light in optical fiber.
> The number in Table D.1 is more realistic and we should use it
> in both tables.
> 
> This commit fixes these inconsistencies and modifies the related
> explanation in the text accordingly.
> 
> Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Nice!!! Applied and pushed.

							Thanx, Paul

> ---
>  cpu/overheads.tex | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index 311c43e..bfdd711 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -126,12 +126,12 @@ This simplified sequence is just the beginning of a discipline called
>  	\hline
>  	CAS cache miss		&         306.0	&         510.0 \\
>  	\hline
> -	Comms Fabric		&       3,000\textcolor{white}{.0}
> -						&       5,000\textcolor{white}{.0}
> +	Comms Fabric		&       5,000\textcolor{white}{.0}
> +						&       8,330\textcolor{white}{.0}
>  								\\
>  	\hline
> -	Global Comms		& 130,000,000\textcolor{white}{.0}
> -						& 216,000,000\textcolor{white}{.0}
> +	Global Comms		& 195,000,000\textcolor{white}{.0}
> +						& 325,000,000\textcolor{white}{.0} \\
>  								\\
>  \end{tabular}
>  \caption{Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
> @@ -224,11 +224,11 @@ global agreement.
>  	\hline
>  	CAS cache miss		&          95.9	&         266.4 \\
>  	\hline
> -	Comms Fabric		&       4,500\textcolor{white}{.0}
> -						&	7,500\textcolor{white}{.0} \\
> +	Comms Fabric		&       2,600\textcolor{white}{.0}
> +						&	7,220\textcolor{white}{.0} \\
>  	\hline
>  	Global Comms		& 195,000,000\textcolor{white}{.0}
> -						& 324,000,000\textcolor{white}{.0} \\
> +						& 542,000,000\textcolor{white}{.0} \\
>  \end{tabular}
>  \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
>  \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
> @@ -264,15 +264,19 @@ I/O operations are even more expensive.
>  As shown in the ``Comms Fabric'' row,
>  high performance (and expensive!) communications fabric, such as
>  InfiniBand or any number of proprietary interconnects, has a latency
> -of roughly three microseconds, during which time five \emph{thousand}
> -instructions might have been executed.
> +of roughly five microseconds for an end-to-end round trip, during which
> +time more than eight \emph{thousand} instructions might have been executed.
>  Standards-based communications networks often require some sort of
>  protocol processing, which further increases the latency.
>  Of course, geographic distance also increases latency, with the
> -theoretical speed-of-light latency around the world coming to
> -roughly 130 \emph{milliseconds}, or more than 200 million clock
> +speed-of-light through optical fiber latency around the world coming to
> +roughly 195 \emph{milliseconds}, or more than 300 million clock
>  cycles, as shown in the ``Global Comms'' row.
> 
> +% Reference of Infiniband latency:
> +% http://www.hpcadvisorycouncil.com/events/2014/swiss-workshop/presos/Day_1/1_Mellanox.pdf
> +%     page 6/76 'Leading Interconnect, Leading Performance'
> +
>  \QuickQuiz{}
>  	These numbers are insanely large!
>  	How can I possibly get my head around them?
> -- 
> 1.9.1
> 
> 

