Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41151 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752397AbcL0FOC (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 27
 Dec 2016 00:14:02 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uBR0rj7F055189
 for <perfbook@vger.kernel.org>; Mon, 26 Dec 2016 19:56:25 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27k5e8pycu-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 26 Dec 2016 19:56:25 -0500
Received: from localhost by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 26 Dec
 2016 17:56:24 -0700
Date: Mon, 26 Dec 2016 16:56:24 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/4] defer/rcu: Fix a section reference typo
Reply-To: paulmck@linux.vnet.ibm.com
References: <20161226194314.7868-1-sj38.park@gmail.com>
 <20161226194314.7868-4-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161226194314.7868-4-sj38.park@gmail.com>
Message-Id: <20161227005624.GL3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Dec 27, 2016 at 04:43:14AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Thank you, queued and pushed all four.

							Thanx, Paul

> ---
>  defer/rcu.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/defer/rcu.tex b/defer/rcu.tex
> index 121f58d9e609..2ce46e2c0dc3 100644
> --- a/defer/rcu.tex
> +++ b/defer/rcu.tex
> @@ -8,7 +8,7 @@ All of the mechanisms discussed in the preceding sections
>  used one of a number of approaches to defer specific actions
>  until they may be carried out safely.
>  The reference counters discussed in
> -Section~ref{sec:defer:Reference Counting}
> +Section~\ref{sec:defer:Reference Counting}
>  use explicit counters to defer actions that could disturb readers,
>  which results in read-side contention and thus poor scalability.
>  The hazard pointers covered by
> -- 
> 2.10.0
> 

