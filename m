Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34916 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731369AbfDBNcX (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 2 Apr 2019 09:32:23 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x32DQCZO135503
        for <perfbook@vger.kernel.org>; Tue, 2 Apr 2019 09:32:21 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2rm7kavaj1-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 02 Apr 2019 09:32:21 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 2 Apr 2019 14:32:19 +0100
Date: Tue, 2 Apr 2019 06:32:22 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] memorder: Fix two trivial typos
Reply-To: paulmck@linux.ibm.com
References: <20190402001457.31848-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190402001457.31848-1-sj38.park@gmail.com>
Message-Id: <20190402133222.GY4102@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Apr 02, 2019 at 09:14:57AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catch, queued and pushed, thank you!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 1649ce9..bb380ad 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -3125,7 +3125,7 @@ Sections~\ref{sec:toolsoftrade:A Volatile Solution}-\ref{sec:toolsoftrade:Avoidi
>  	cause the compiler to discard a previously loaded value from
>  	its register, and then reload it later on.
>  	Invented loads can be prevented by using \co{READ_ONCE()} or by
> -	enforcing ordering as callout out above between the load and a
> +	enforcing ordering as called out above between the load and a
>  	later use of its value using \co{barrier()}.
>  \item	Stores can be invented before a plain store, for example, by
>  	using the stored-to location as temporary storage.
> @@ -3160,7 +3160,7 @@ optimizing your parallel algorithm out of existence.
>  Compilers are starting to provide other mechanisms for avoiding
>  load and store tearing, for example, \co{memory_order_relaxed}
>  atomic loads and stores, however, work is still
> -needed~/\cite{JonathanCorbet2016C11atomics}
> +needed~\cite{JonathanCorbet2016C11atomics}.
>  In addition, compiler issues aside, \co{volatile} is still needed
>  to avoid fusing and invention of accesses, including C11 atomic accesses.
>  
> -- 
> 2.10.0
> 

