Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbiE3RrJ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 30 May 2022 13:47:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39AE3532FB
        for <perfbook@vger.kernel.org>; Mon, 30 May 2022 10:47:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 98CAFB80B35
        for <perfbook@vger.kernel.org>; Mon, 30 May 2022 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653932826;
        bh=PY/HNrCjOuqGELOwJqqhgmb3LbevJdgm++W9htK4jJ4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nZo1ZpccWyQepFi8s0wSppEWNKGaMai/vlAt3bHYxj9EHZIS1hmoaTuMH6q2i74ca
         AF283aJWrEfwMoPNsaw7VE4WsmAv/k2hfwv8wd9E4feFGw/7/nCwUmbaRl00Y+S3rW
         ejRYCcbI/lZ/hE3ckmhdyb8LZ8KGKlgd5UxiAw2dEWuhDFm5qgtAdMCrUkzSMZzl0P
         lBs8fjBcve0mHVoP1Uz8Qn3peX337paqBla1VwotTlKMGU6T64MbxjQP880+sI0FFF
         mB+TXCdmy0UYoRtV4CS/7Vw+bCFy8UGnCViKlIR2yEMWMGx0XQFrC3NaTBGYalQuaN
         kSQJvg1M0zziQ==
Date: Mon, 30 May 2022 10:47:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] locking: Consistently append parentheses to
 pthread_cond_wait()
Message-ID: <20220530174705.GC1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220530161236.6397-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530161236.6397-1-sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, May 30, 2022 at 09:12:36AM -0700, SeongJae Park wrote:
> Some of 'pthread_cond_wait()' mentions have '()' suffix, which indicates
> it's a function, but some mentions don't.  This commit adds the suffix
> to all mentions to be consistent.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  locking/locking.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 14690b19..4ad5e4c4 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -528,8 +528,8 @@ prevents hangs due to lost wakeups.
>  
>  	Consider a program that acquires \co{mutex_a}, and then
>  	\co{mutex_b}, in that order, and then passes \co{mutex_a}
> -	to \co{pthread_cond_wait}.
> -	Now, \co{pthread_cond_wait} will release \co{mutex_a}, but
> +	to \co{pthread_cond_wait()}.
> +	Now, \co{pthread_cond_wait()} will release \co{mutex_a}, but
>  	will re-acquire it before returning.
>  	If some other thread acquires \co{mutex_a} in the meantime
>  	and then blocks on \co{mutex_b}, the program will deadlock.
> -- 
> 2.17.1
> 
