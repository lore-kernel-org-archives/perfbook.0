Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234501AbiHLVPN (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 12 Aug 2022 17:15:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7135522F
        for <perfbook@vger.kernel.org>; Fri, 12 Aug 2022 14:15:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 21A1FB82441
        for <perfbook@vger.kernel.org>; Fri, 12 Aug 2022 21:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660338908;
        bh=wA1NGtZU1RURa+3k8Koj2Iri3E1JRDu+PJicH+STDsk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=s2NNa2fcB9QNBiXatmjh+6H9VsuqQFiY2M+uBuNa8T1oO4pqyYxutepkcQfAjxno+
         ii+x0U/GLpTK47cuBl7qpaqYZQPiV5BDnfetzwKDwlFYEsdL6aP9v7ZMNfG+3sMBal
         27Kz94O0sLNFCHVp4duIB5BSlB+uyc8SZqXsLUaP+zu4YKW5X3iEyl+6qPwOpzQ5jS
         GTN8WVTpAToGdH+PvJmYGgXGPgJ0dlEBnkvhvKlY2S8Wg2bO8LQvmiRaeAccn54Vpk
         USP9BsZPNiq8NrPTUfiuzdSeDGXXgJU31Z0hDiqfqCHFad4gLL//AOMkyK75mZg6nf
         WhECT1jCEveBw==
Date: Fri, 12 Aug 2022 14:15:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] count: The fast path is for the write side
Message-ID: <20220812211508.GF2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FV_ngVf2dKkaTMD0QM1713ppDBj-yfQJTOuqmnUUyOncw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FV_ngVf2dKkaTMD0QM1713ppDBj-yfQJTOuqmnUUyOncw@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Aug 12, 2022 at 02:38:06PM -0400, Elad Lahav wrote:
> Sent as an attachment because I'm behind a corporate firewall and can
> only use Gmail's ^$*&^@# web interface. If that's not acceptable I'll
> find another method to send a Real Text Email, just like mother nature
> intended it to be.

For the time being, it is fine.  Longer term, it would be good to find
a way to send a Real Text Email, for old time's sake.  ;-)

Queued and pushed, thank you!

							Thanx, Paul

> --Elad

> From 153cd4261fe58ed7f26bb0b1232eae2de43070ad Mon Sep 17 00:00:00 2001
> From: Elad Lahav <elahav@qnx.com>
> Date: Fri, 12 Aug 2022 13:04:08 -0400
> Subject: [PATCH] count: The fast path is for the write side, not the read
>  side.
> 
> Signed-off-by: Elad Lahav <e2lahav@gmail.com>
> ---
>  count/count.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index 7e74d58f..523789e2 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -2262,7 +2262,7 @@ be run all the way to either of its limits, but it does so at the
>  expense of adding atomic operations to the fastpaths, which slow down
>  the fastpaths significantly on some systems.
>  Although some workloads might tolerate this slowdown, it is worthwhile
> -looking for algorithms with better read-side performance.
> +looking for algorithms with better write-side performance.
>  One such algorithm uses a signal handler to steal counts from other
>  threads.
>  Because signal handlers run in the context of the signaled thread,
> -- 
> 2.25.1
> 

