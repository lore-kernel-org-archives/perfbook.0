Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34008 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726360AbfAEX17 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 5 Jan 2019 18:27:59 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x05NNehw084581
        for <perfbook@vger.kernel.org>; Sat, 5 Jan 2019 18:27:57 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2pu64f87er-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 05 Jan 2019 18:27:57 -0500
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 5 Jan 2019 23:27:56 -0000
Date: Sat, 5 Jan 2019 15:28:15 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 1/2] memorder: Fix typos
Reply-To: paulmck@linux.ibm.com
References: <20190105191957.3050-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190105191957.3050-1-sj38.park@gmail.com>
Message-Id: <20190105232815.GP4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jan 06, 2019 at 04:19:56AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catches, applied and pushed both, thank you!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index cb4d037..56786fa 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -541,13 +541,13 @@ Blank cells indicate that no ordering is supplied.
>  The ``Store'' row also covers the store portion of an atomic RMW operation.
>  In addition, the ``Load'' row covers the load
>  component of a successful value-returning \co{_relaxed()} RMW atomic
> -operation, although the combined ``\co{_relaxed()} RMW Operations''
> +operation, although the combined ``\co{_relaxed()} RMW operation''
>  line provides a convenient combined reference in the value-returning case.
>  A CPU executing unsuccessful value-returning atomic RMW operations must
>  invalidate the corresponding variable from all other CPUs' caches.
>  Therefore, oddly enough, unsuccessful value-returning atomic RMW
>  operations have many of the properties of a store, which means that the
> -``\co{_relaxed()} RMW Operations'' line also applies to unsuccessful
> +``\co{_relaxed()} RMW operation'' line also applies to unsuccessful
>  value-returning atomic RMW operations.
>  
>  The \co{*_acquire} row covers \co{smp_load_acquire()},
> -- 
> 2.10.0
> 

