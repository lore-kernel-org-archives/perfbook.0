Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40675 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S932570AbcFOXvl (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed, 15
 Jun 2016 19:51:41 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5FNmjtt123431
 for <perfbook@vger.kernel.org>; Wed, 15 Jun 2016 19:51:41 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 23jgpeg33p-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Wed,
 15 Jun 2016 19:51:41 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Wed, 15 Jun
 2016 19:51:39 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id A802B6E8040
 for <perfbook@vger.kernel.org>; Wed, 15 Jun 2016 19:51:19 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5FNpb8r53674108	for <perfbook@vger.kernel.org>; Wed, 15 Jun 2016 23:51:37
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5FNpbnS030157	for <perfbook@vger.kernel.org>; Wed, 15 Jun 2016 19:51:37
 -0400
Date: Wed, 15 Jun 2016 16:51:38 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] cpu: Fix numbers in Performance of Mechanisms table in
 qqz
Reply-To: paulmck@linux.vnet.ibm.com
References: <9b971ea3-e84c-b4e1-e75b-7c545b24f7e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b971ea3-e84c-b4e1-e75b-7c545b24f7e3@gmail.com>
Message-Id: <20160615235138.GG3923@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 11, 2016 at 03:39:31PM +0900, Akira Yokosawa wrote:
> >From 1ff97081c713ff51d5bc2e15f8ba7649427fac4f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 11 Jun 2016 15:28:20 +0900
> Subject: [PATCH] cpu: Fix numbers in Performance of Mechanisms table in qqz
> 
> Numbers given in 'Comms Fabric' and 'Global Comms' rows in
> Table D.1 seem wrong.
> 
> Their costs are given in ns unit, so they should match those given
> in Table 3.1.
> 
> Also, their ratio should be calculated by cost(ns)/0.36(ns).
> 
> This commit fixes those numbers.

Great catch, but let's talk about the fix.

The 130ms is the time required for light to circumnavigate the earth
in a vacuum.  The 195ms is that for light to circumnavigate the earth
in glass, as in an optical fiber.  There is some variation due to
different refractive indexes of different types of fiber.

So making both of those entries be 195,000,000 seems like the right
approach.  An even better approach would be to use the ping time to
some system on the other side of the world, but I am coming up empty.
Pinging google.com gets me 216.58.217.46 for about 47ms.  If you are
far away from West Coast USA, please see what you get.  Not that I
would put it past Google to spread a single IP address worldwide to
defeat this, but worth a try...

On the Comms Fabric number, I suspect that I just googled this at
two different times and got two different numbers.  Not surprising,
as different products would be optimized differently at different
times.

So how about https://en.wikipedia.org/wiki/InfiniBand?  Choose the
value in effect when Nehalem was released for the QQ table, and choose
the value in effect when the AMD Opteron 844 was released for the
table in Chapter 3.

Seem reasonable?

Oh, and also add a Latex comment saying where the data came from!  ;-)

							Thanx, Paul

> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  cpu/overheads.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index 311c43e..0cf83f3 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -224,11 +224,11 @@ global agreement.
>  	\hline
>  	CAS cache miss		&          95.9	&         266.4 \\
>  	\hline
> -	Comms Fabric		&       4,500\textcolor{white}{.0}
> -						&	7,500\textcolor{white}{.0} \\
> +	Comms Fabric		&       3,000\textcolor{white}{.0}
> +						&	8,330\textcolor{white}{.0} \\
>  	\hline
> -	Global Comms		& 195,000,000\textcolor{white}{.0}
> -						& 324,000,000\textcolor{white}{.0} \\
> +	Global Comms		& 130,000,000\textcolor{white}{.0}
> +						& 361,000,000\textcolor{white}{.0} \\
>  \end{tabular}
>  \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
>  \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
> -- 
> 1.9.1
> 

