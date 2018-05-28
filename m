Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41028 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932523AbeE1P6g (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 28
 May 2018 11:58:36 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w4SFs7GX057066
 for <perfbook@vger.kernel.org>; Mon, 28 May 2018 11:58:36 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2j8h0d1n5s-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Mon, 28 May 2018 11:58:35 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 28 May
 2018 11:58:34 -0400
Date: Mon, 28 May 2018 09:00:14 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] SMPdesign: Add a missed unbreakble space for line number
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180528150607.3513-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180528150607.3513-1-sj38.park@gmail.com>
Message-Id: <20180528160014.GY3803@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 29, 2018 at 12:06:07AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catch, queued and pushed, thank you!

							Thanx, Paul

> ---
>  SMPdesign/SMPdesign.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> index 8078c4b..824de41 100644
> --- a/SMPdesign/SMPdesign.tex
> +++ b/SMPdesign/SMPdesign.tex
> @@ -1109,7 +1109,7 @@ Line~6 gets a pointer to this thread's pool, and
>  line~7 checks to see if this per-thread pool is full.
> 
>  If so, lines~8-15 empty half of the per-thread pool into the global pool,
> -with lines~8 and 14 acquiring and releasing the spinlock.
> +with lines~8 and~14 acquiring and releasing the spinlock.
>  Lines~9-12 implement the loop moving blocks from the local to the
>  global pool, and line~13 sets the per-thread pool's count to the proper
>  value.
> -- 
> 2.10.0
> 

