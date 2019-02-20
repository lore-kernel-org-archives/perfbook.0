Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42352 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725616AbfBTBqF (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 19 Feb 2019 20:46:05 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x1K1i0w9134894
        for <perfbook@vger.kernel.org>; Tue, 19 Feb 2019 20:46:04 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2qrqrj57qh-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 19 Feb 2019 20:46:04 -0500
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 20 Feb 2019 01:46:03 -0000
Date: Tue, 19 Feb 2019 17:45:58 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] defer/rcuapi: Fix typo in Table 9.3
Reply-To: paulmck@linux.ibm.com
References: <0c37be8f-b406-9f93-32f7-42bd40a509d6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c37be8f-b406-9f93-32f7-42bd40a509d6@gmail.com>
Message-Id: <20190220014558.GB11787@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Feb 20, 2019 at 07:12:32AM +0900, Akira Yokosawa wrote:
> >From d33317bade3316f46fe01bd7dec3f6c8b0bf9e09 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 19 Feb 2019 22:30:05 +0900
> Subject: [PATCH] defer/rcuapi: Fix typo in Table 9.3
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, good eyes, thank you!

							Thanx, Paul

> ---
>  defer/rcuapi.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index 5620eb1..a98b5e8 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -801,7 +801,7 @@ Section~\ref{sec:defer:Maintain Multiple Versions of Recently Updated Objects}.
>  			      \tco{hlist_next_rcu()}
>  			      \tco{hlist_pprev_rcu()}} &
>  	\tco{hlist_nulls_first_rcu()}
> -	\tco{hlist_nulls_first_rcu()} &
> +	\tco{hlist_nulls_next_rcu()} &
>  	    \tco{hlist_bl_first_rcu()} \\
>  \multicolumn{4}{l}{{\bf Add}} \\
>  \multicolumn{1}{p{1.2in}}{\tco{list_add_rcu()}
> -- 
> 2.7.4
> 

