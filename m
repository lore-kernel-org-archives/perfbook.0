Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46376 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725899AbeLBQJc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 2 Dec 2018 11:09:32 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB2G9HFn045992
        for <perfbook@vger.kernel.org>; Sun, 2 Dec 2018 11:09:27 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2p48aphy7e-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sun, 02 Dec 2018 11:09:26 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 2 Dec 2018 16:09:26 -0000
Date: Sun, 2 Dec 2018 08:09:23 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] defer: Update Hlist RCU API table
Reply-To: paulmck@linux.ibm.com
References: <92d5a836-db9d-1333-b2cf-9e2664c7744c@gmail.com>
 <cf4362c2-8070-d547-8f0a-4684faddad8e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf4362c2-8070-d547-8f0a-4684faddad8e@gmail.com>
Message-Id: <20181202160922.GC4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Dec 02, 2018 at 11:57:47PM +0900, Akira Yokosawa wrote:
> >From 8cd7d7bb4b42f67e67d2273c6c048b26a9ec3366 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 2 Dec 2018 23:35:43 +0900
> Subject: [PATCH v2 1/2] defer: Update Hlist RCU API table
> 
> Current Linux kernel API does not have hlist_add_after_rcu()
> but has hlist_add_behind_rcu().
> 
> It was renamed in the 3.17 development cycle due to swapping of
> the arguments.
> 
> While we are here, reference the table by the label instead of
> just saying "the following table".
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied both, thank you!

							Thanx, Paul

> ---
> Hi Paul,
> 
> This one keeps the original API name in the table.
> It also fixes "Hlist Update" -> "Hlist update" for consistency.
> 
> I'm submitting v2 of [1/2] only.
> 
>         Thanks, Akira
> --
>  defer/rcuapi.tex         | 12 ++++++++----
>  defer/rcufundamental.tex |  4 ++--
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index 5502092..a50dcbe 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -439,8 +439,9 @@ their scope.
>  \label{sec:defer:RCU has Publish-Subscribe and Version-Maintenance APIs}
>  
>  Fortunately, the RCU publish-subscribe and version-maintenance
> -primitives shown in the following
> -table apply to all of the variants of RCU discussed above.
> +primitives shown in
> +Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}
> +apply to all of the variants of RCU discussed above.
>  This commonality can in some cases allow more code to be shared,
>  which certainly reduces the API proliferation that would otherwise
>  occur.
> @@ -491,10 +492,13 @@ Hlist traversal &
>  	\tco{hlist_for_each_entry_rcu()} &
>  		2.6.8 &
>  			Simple instructions (memory barrier on Alpha) \\
> -&
> -	\tco{hlist_add_after_rcu()} &
> +\midrule
> +Hlist update &
> +	\tco{hlist_add_behind_rcu()} &
>  		2.6.14 &
>  			Memory barrier \\
> +&	\multicolumn{2}{l}{(Renamed from \tco{hlist_add_after_rcu()} in 3.17)} &
> +			\\ \addlinespace[2pt]
>  &
>  	\tco{hlist_add_before_rcu()} &
>  		2.6.14 &
> diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> index c4a8905..2660e7d 100644
> --- a/defer/rcufundamental.tex
> +++ b/defer/rcufundamental.tex
> @@ -399,8 +399,8 @@ Lists     & \parbox[c][0.37in][c]{1.3in}{
>  					& \tco{list_for_each_entry_rcu()} \\
>  \midrule
>  Hlists    & \parbox[c][0.5in][c]{1.3in}{
> -		\co{hlist_add_after_rcu()} \\
> -		\co{hlist_add_before_rcu()}  \\
> +		\co{hlist_add_behind_rcu()} \\
> +		\co{hlist_add_before_rcu()} \\
>  		\co{hlist_add_head_rcu()} \\
>  		\co{hlist_replace_rcu()} }
>  			& \tco{hlist_del_rcu()}
> -- 
> 2.7.4
> 
> 

