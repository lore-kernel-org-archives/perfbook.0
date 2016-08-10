Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18583 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751497AbcHJWsU (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Wed, 10 Aug 2016 18:48:20 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u7AMhvqB014837
 for <perfbook@vger.kernel.org>; Wed, 10 Aug 2016 18:48:20 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24qm9rve5a-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Wed,
 10 Aug 2016 18:48:19 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Wed, 10 Aug
 2016 18:48:19 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 23AEFC90041
 for <perfbook@vger.kernel.org>; Wed, 10 Aug 2016 18:48:05 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u7AMmGkp57409688	for <perfbook@vger.kernel.org>; Wed, 10 Aug 2016 22:48:16
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u7AMmGVt022747	for <perfbook@vger.kernel.org>; Wed, 10 Aug 2016 18:48:16
 -0400
Date: Wed, 10 Aug 2016 15:48:20 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] toolsoftrade: minor grammar correction
Reply-To: paulmck@linux.vnet.ibm.com
References: <1470825531-2051-1-git-send-email-rppt@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1470825531-2051-1-git-send-email-rppt@linux.vnet.ibm.com>
Message-Id: <20160810224820.GQ3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org

On Wed, Aug 10, 2016 at 01:38:51PM +0300, Mike Rapoport wrote:
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

Applied, thank you!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 9ed50fe..ad838d7 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -629,7 +629,7 @@ required by \co{pthread_create()}.
>  	And for that reason, the \co{pthread_mutex_lock()} and
>  	\co{pthread_mutex_unlock()} primitives are normally wrapped
>  	in functions that do this error checking.
> -	Later on, we will wrapper them with the Linux kernel
> +	Later on, we will wrap them with the Linux kernel
>  	\co{spin_lock()} and \co{spin_unlock()} APIs.
>  } \QuickQuizEnd
> 
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

