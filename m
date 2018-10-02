Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36402 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726492AbeJBKxt (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 2 Oct 2018 06:53:49 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9249LsZ149117
        for <perfbook@vger.kernel.org>; Tue, 2 Oct 2018 00:12:38 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2muwsueff5-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 02 Oct 2018 00:12:37 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 2 Oct 2018 00:12:37 -0400
Date: Mon, 1 Oct 2018 21:12:33 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] defer: Fix wrong code line
Reply-To: paulmck@linux.ibm.com
References: <20181002023231.7280-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181002023231.7280-1-sj38.park@gmail.com>
Message-Id: <20181002041233.GW4222@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 02, 2018 at 11:32:31AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes!  Queued and pushed, thank you!!!

							Thanx, Paul

> ---
>  defer/hazptr.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/defer/hazptr.tex b/defer/hazptr.tex
> index 7550a8d..44928e9 100644
> --- a/defer/hazptr.tex
> +++ b/defer/hazptr.tex
> @@ -56,8 +56,8 @@ out quite carefully in order to avoid destructive races with concurrent
>  deletion.
>  One implementation is shown in
>  Listing~\ref{lst:defer:Hazard-Pointer Storage and Erasure},
> -which shows \co{hp_store()} on lines~1-13 and \co{hp_erase()} on
> -lines~15-20.
> +which shows \co{hp_store()} on lines~1-14 and \co{hp_erase()} on
> +lines~16-21.
>  The \co{smp_mb()} primitive will be described in detail in
>  Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}, but may be ignored for
>  the purposes of this brief overview.
> -- 
> 2.10.0
> 

