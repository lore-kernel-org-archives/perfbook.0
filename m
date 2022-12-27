Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiL0S3Y (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 27 Dec 2022 13:29:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB4EB7E4
        for <perfbook@vger.kernel.org>; Tue, 27 Dec 2022 10:29:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0CB7AB811CF
        for <perfbook@vger.kernel.org>; Tue, 27 Dec 2022 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672165760;
        bh=wiCv7MYBCM4qQzXRmy2BZOeCBx0ICGSP3g412dQMoF8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=YvrAggQZFDwP1caLE8wK6YfOVASR/GSp2mWdFy3La0kHSmZgcLYjKl9C3qNsdjxmF
         6Eg7bTT+shMsJf6hnTqkkRtU5w0/Of0MVasWHQVRj+3sCAmI9Hhox1WI42Tade0a6D
         7MwVByk+B7XokWNCbx+WIECRfNIRGrmOQVM/855VG/U14x9XVXaFZdGar/l0NJFWFL
         IW0hAMNbHeYcQKqKojvdIbpy324XDzAeHbl/JbQgnP6JmlCKq1ETjkkp6UWAnhlfLA
         AoJ0BVilM9lRKmaRYY6Tg2LAI3UQlpv194LOFeaR+G9ddhPiCmSlguUprIAsPax2CR
         iEr1P65KUt7tQ==
Date: Tue, 27 Dec 2022 10:29:20 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] datastruct: Add missed unbreakable spaces
Message-ID: <20221227182920.GH4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20221227002650.GF4001@paulmck-ThinkPad-P17-Gen-1>
 <20221227160619.16609-1-sj38.park@gmail.com>
 <20221227160619.16609-2-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221227160619.16609-2-sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Tue, Dec 27, 2022 at 08:06:19AM -0800, SeongJae Park wrote:
> Add missing unbreakable spaces for 'CPUs' and 'elements'.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Works for me, thank you!

I have queued this, and if Akira (who tests with a much wider variety
of environments than I do) does not object, then I will push it out.

							Thanx, Paul

> ---
> Changes from v1
> - Fix build error by removing unbreakable space from \cref{}
> 
>  datastruct/datastruct.tex | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 99c92d9a..c095b846 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -664,7 +664,7 @@ shows the same data on a linear scale.
>  This drops the global-locking trace into the x-axis, but allows the
>  non-ideal performance of RCU and hazard pointers to be more readily
>  discerned.
> -Both show a change in slope at 224 CPUs, and this is due to hardware
> +Both show a change in slope at 224~CPUs, and this is due to hardware
>  multithreading.
>  At 32 and fewer CPUs, each thread has a core to itself.
>  In this regime, RCU does better than does hazard pointers because the
> @@ -672,11 +672,11 @@ latter's read-side \IXpl{memory barrier} result in dead time within the core.
>  In short, RCU is better able to utilize a core from a single hardware
>  thread than is hazard pointers.
>  
> -This situation changes above 224 CPUs.
> +This situation changes above 224~CPUs.
>  Because RCU is using more than half of each core's resources from a
>  single hardware thread, RCU gains relatively little benefit from the
>  second hardware thread in each core.
> -The slope of the hazard-pointers trace also decreases at 224 CPUs, but
> +The slope of the hazard-pointers trace also decreases at 224~CPUs, but
>  less dramatically,
>  because the second hardware thread is able to fill in the time
>  that the first hardware thread is stalled due to \IXh{memory-barrier}{latency}.
> @@ -776,7 +776,7 @@ to about half again faster than that of either QSBR or RCU\@.
>  	Still unconvinced?
>  	Then look at the log-log plot in
>  	\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs; Varying Table Size},
> -	which shows performance for 448 CPUs as a function of the
> +	which shows performance for 448~CPUs as a function of the
>  	hash-table size, that is, number of buckets and maximum number
>  	of elements.
>  	A hash-table of size 1,024 has 1,024~buckets and contains
> @@ -785,14 +785,13 @@ to about half again faster than that of either QSBR or RCU\@.
>  	Because this is a read-only benchmark, the actual occupancy is
>  	always equal to the average occupancy.
>  
> -	This figure shows near-ideal performance below about 8,000
> -	elements, that is, when the hash table comprises less than
> -	1\,MB of data.
> +	This figure shows near-ideal performance below about 8,000~elements,
> +	that is, when the hash table comprises less than 1\,MB of data.
>  	This near-ideal performance is consistent with that for the
>  	pre-BSD routing table shown in
>  	\cref{fig:defer:Pre-BSD Routing Table Protected by RCU}
>  	on \cpageref{fig:defer:Pre-BSD Routing Table Protected by RCU},
> -	even at 448 CPUs.
> +	even at 448~CPUs.
>  	However, the performance drops significantly (this is a log-log
>  	plot) at about 8,000~elements, which is where the 1,048,576-byte
>  	L2 cache overflows.
> @@ -835,7 +834,7 @@ data structure represented by the pre-BSD routing table.
>  
>  \QuickQuiz{
>  	The memory system is a serious bottleneck on this big system.
> -	Why bother putting 448 CPUs on a system without giving them
> +	Why bother putting 448~CPUs on a system without giving them
>  	enough memory bandwidth to do something useful???
>  }\QuickQuizAnswer{
>  	It would indeed be a bad idea to use this large and expensive
> @@ -905,10 +904,10 @@ concurrency control to begin with.
>  \Cref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates}
>  therefore shows the effect of updates on readers.
>  At the extreme left-hand side of this graph, all but one of the CPUs
> -are doing lookups, while to the right all 448 CPUs are doing updates.
> +are doing lookups, while to the right all 448~CPUs are doing updates.
>  For all four implementations, the number of lookups per millisecond
>  decreases as the number of updating CPUs increases, of course reaching
> -zero lookups per millisecond when all 448 CPUs are updating.
> +zero lookups per millisecond when all 448~CPUs are updating.
>  Both hazard pointers and RCU do well compared to per-bucket locking
>  because their readers do not increase update-side lock contention.
>  RCU does well relative to hazard pointers as the number of updaters
> @@ -931,7 +930,7 @@ showed the effect of increasing update rates on lookups,
>  \cref{fig:datastruct:Update-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo}
>  shows the effect of increasing update rates on the updates themselves.
>  Again, at the left-hand side of the figure all but one of the CPUs are
> -doing lookups and at the right-hand side of the figure all 448 CPUs are
> +doing lookups and at the right-hand side of the figure all 448~CPUs are
>  doing updates.
>  Hazard pointers and RCU start off with a significant advantage because,
>  unlike bucket locking, readers do not exclude updaters.
> -- 
> 2.17.1
> 
