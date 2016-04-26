Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e17.ny.us.ibm.com ([129.33.205.207]:40314 "EHLO
 e17.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1750749AbcDZBif (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 25 Apr 2016
 21:38:35 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 25 Apr
 2016 21:38:34 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 617F66E8041
 for <perfbook@vger.kernel.org>; Mon, 25 Apr 2016 21:38:16 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3Q1cVEX38404292	for <perfbook@vger.kernel.org>; Tue, 26 Apr 2016 01:38:31
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3Q1cUod018295	for <perfbook@vger.kernel.org>; Mon, 25 Apr 2016 21:38:31
 -0400
Date: Mon, 25 Apr 2016 18:39:06 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: fix trivial typos
Message-ID: <20160426013906.GX3874@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1461633750-17992-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461633750-17992-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Apr 26, 2016 at 10:22:30AM +0900, SeongJae Park wrote:
> Earlier two commits to advsync/memorybarriers.tex file, commit
> 8de1474e3282 ("Add larger multiple-value-write scenario") and commit
> 514f21cd4156 ("Add caveats to the Software Logic Analyzer") has made few
> trivial typos.  This commit fixes them.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes!  Queued and pushed.

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index cc39d2d..a0ef76d 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -363,7 +363,7 @@ consistent with the increase in number of CPUs.
>  The remaining 15 columns in the table record the values most recently
>  observed by the corresponding CPU at each point in time, with changes
>  in value marked by italics and parentheses.
> -Again, CPU 0 coordinates the test, so does not record any values.
> +Again, CPU~0 coordinates the test, so does not record any values.
> 
>  \begin{table*}[htbp]
>  \scriptsize
> @@ -508,7 +508,7 @@ We have entered a regime where we must bid a fond farewell to
>  comfortable intuitions about values of variables and the passage of time.
>  This is the regime where memory barriers are needed.
> 
> -All that aside, is is important to remember the lessons from
> +All that aside, it is important to remember the lessons from
>  Chapters~\ref{chp:Hardware and its Habits}
>  and~\ref{cha:Partitioning and Synchronization Design}.
>  Having all CPUs write concurrently to the same variable
> -- 
> 1.9.1
> 

