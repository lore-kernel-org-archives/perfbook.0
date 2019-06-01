Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58348 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728506AbfFANio (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 1 Jun 2019 09:38:44 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x51DcgMw008719
        for <perfbook@vger.kernel.org>; Sat, 1 Jun 2019 09:38:43 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2sunvdecwr-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 01 Jun 2019 09:38:42 -0400
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 1 Jun 2019 14:37:23 +0100
Date: Sat, 1 Jun 2019 06:37:21 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 1/2] defer/hazptr: Fix a typo: updatesa -> updates
Reply-To: paulmck@linux.ibm.com
References: <20190601005425.22065-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190601005425.22065-1-sj38.park@gmail.com>
Message-Id: <20190601133721.GV28207@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 01, 2019 at 09:54:24AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes, applied and pushed, thank you!

							Thanx, Paul

> ---
>  defer/hazptr.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/defer/hazptr.tex b/defer/hazptr.tex
> index b491c59..be93342 100644
> --- a/defer/hazptr.tex
> +++ b/defer/hazptr.tex
> @@ -332,7 +332,7 @@ object traversed.
>  Therefore, hazard pointers's performance is far short of ideal.
>  On the other hand, unlike naive approaches to concurrent reference-counting,
>  hazard pointers do operate correctly for workloads
> -involving concurrent updatesa.
> +involving concurrent updates.
>  Additional performance comparisons with other mechanisms may be found in
>  Chapter~\ref{chp:Data Structures}
>  and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.2483867,MagedMichael04a}.
> -- 
> 2.10.0
> 

