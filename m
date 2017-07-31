Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48669 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751046AbdGaPrs (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 31 Jul 2017 11:47:48 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6VFhvDA026225
 for <perfbook@vger.kernel.org>; Mon, 31 Jul 2017 11:47:47 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2c26e03d9d-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 31 Jul 2017 11:47:47 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 31 Jul
 2017 11:47:46 -0400
Date: Mon, 31 Jul 2017 08:47:46 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] howto: Add unbreakable space for volume number
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170731055005.18716-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170731055005.18716-1-sj38.park@gmail.com>
Message-Id: <20170731154746.GC3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jul 31, 2017 at 02:50:05PM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catch, applied, thank you!

							Thanx, Paul

> ---
>  howto/howto.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 323f95f..90abb14 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -276,10 +276,10 @@ Fortunately, there are many alternatives available to you:
>  	on programming-language pragmatics.
>  \item	If you are interested in an object-oriented patternist
>  	treatment of parallel programming focussing on C++,
> -	you might try Volumes~2 and 4 of Schmidt's POSA
> +	you might try Volumes~2 and~4 of Schmidt's POSA
>  	series~\cite{SchmidtStalRohnertBuschmann2000v2Textbook,
>  	BuschmannHenneySchmidt2007v4Textbook}.
> -	Volume 4 in particular has some interesting chapters
> +	Volume~4 in particular has some interesting chapters
>  	applying this work to a warehouse application.
>  	The realism of this example is attested to by
>  	the section entitled ``Partitioning the Big Ball of Mud'',
> -- 
> 2.10.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

