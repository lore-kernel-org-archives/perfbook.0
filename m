Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34480 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726119AbeKTMLx (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 20 Nov 2018 07:11:53 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wAK1dHJT146586
        for <perfbook@vger.kernel.org>; Mon, 19 Nov 2018 20:45:17 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2nv6r8m23v-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 19 Nov 2018 20:45:16 -0500
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 20 Nov 2018 01:45:16 -0000
Date: Mon, 19 Nov 2018 17:45:15 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 1/7] datastruct: Fix wrong line number
Reply-To: paulmck@linux.ibm.com
References: <20181120000057.389-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181120000057.389-1-sj38.park@gmail.com>
Message-Id: <20181120014515.GV4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Nov 20, 2018 at 09:00:51AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes!  I queued and pushed the series, thank you!!!

							Thanx, Paul

> ---
>  datastruct/datastruct.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 1dc2b49..fb8fc20 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -1549,7 +1549,7 @@ Line~17 conditionally acquires the top-level \co{->ht_lock}, and if
>  this acquisition fails, line~18 returns \co{-EBUSY} to indicate that
>  a resize is already in progress.
>  Otherwise, line~19 picks up a reference to the current hash table,
> -and lines~21-24 allocate a new hash table of the desired size.
> +and lines~20-24 allocate a new hash table of the desired size.
>  If a new set of hash/key functions have been specified, these are
>  used for the new table, otherwise those of the old table are preserved.
>  If line~25 detects memory-allocation failure, line~26 releases \co{->ht_lock}
> -- 
> 2.10.0
> 

