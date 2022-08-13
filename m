Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiHMXIC (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 13 Aug 2022 19:08:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5474F832D0
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 16:08:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E646D60F5F
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 23:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660432080;
        bh=wm8P04kwwSFiXIjkyEelBLvz+88US46Gg1KKPZzBXRo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=gp0mSZtfzxA6jr3j/FdOvJ6sHNY8o+KePYWhC12nRCdTApFNt9hSV6GQga2ZLkdNK
         rp83vvgq1iMfcR+H8DHUxtPSJ6N18a3uHftnfZGCl8gy6s3zkHIkoFh4QJe4TiE/NW
         6HOOX9Hs5iHVKRNri3bndd1zbRVgbXxRGFM1WQL5JklVq47zyL6nR9ZGMEk4LUXstT
         Zcz/oex2A9ll75svAO8uJfidkvw2apjWTwbG4S7x3jl7JgV9/7rByLcTpRMgWLGDKu
         QOkgiTmRa86sEie4N6J5EgKdXSUbeo8bU/zRbTJju/Ms/IVetnyzKjtejuh5XcwDjK
         UxxU0PnkylcIA==
Date: Sat, 13 Aug 2022 16:08:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] count: Switch from GCC to C11 thread-local storage
Message-ID: <20220813230800.GL2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220813114559.2082323-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220813114559.2082323-1-e2lahav@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 13, 2022 at 07:45:59AM -0400, Elad Lahav wrote:
> Signed-off-by: Elad Lahav <e2lahav@gmail.com>

Nice, thank you!

But did you verify that none of the text describing count_end.c needed
changing?  (It seems unlikely that any would, but could you please check?)

> ---
>  CodeSamples/count/count_end.c | 12 ++++++------
>  count/count.tex               |  4 ++--
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
> index 722ad2f7..5e7b9ee1 100644
> --- a/CodeSamples/count/count_end.c
> +++ b/CodeSamples/count/count_end.c
> @@ -1,6 +1,6 @@
>  /*
>   * count_end.c: Per-thread statistical counters that provide sum at end.
> - *	Uses __thread for each thread's counter.
> + *	Uses _Thread_local for each thread's counter.
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License as published by
> @@ -23,17 +23,17 @@
>  #include "../api.h"
>  
>  //\begin{snippet}[labelbase=ln:count:count_end:whole,commandchars=\\\@\$]
> -unsigned long __thread counter = 0;		//\lnlbl{var:b}
> +unsigned long _Thread_local counter = 0;		//\lnlbl{var:b}
>  unsigned long *counterp[NR_THREADS] = { NULL };
>  unsigned long finalcount = 0;
>  DEFINE_SPINLOCK(final_mutex);			//\lnlbl{var:e}
>  
> -static __inline__ void inc_count(void)		//\lnlbl{inc:b}
> +static inline void inc_count(void)		//\lnlbl{inc:b}
>  {
>  	WRITE_ONCE(counter, counter + 1);
>  }						//\lnlbl{inc:e}
>  
> -static __inline__ unsigned long read_count(void)
> +static inline unsigned long read_count(void)
>  {
>  	int t;
>  	unsigned long sum;
> @@ -48,7 +48,7 @@ static __inline__ unsigned long read_count(void)
>  }
>  
>  #ifndef FCV_SNIPPET
> -__inline__ void count_init(void)
> +inline void count_init(void)
>  {
>  }
>  #endif /* FCV_SNIPPET */
> @@ -73,7 +73,7 @@ void count_unregister_thread(int nthreadsexpected)	//\lnlbl{unreg:b}
>  }							//\lnlbl{unreg:e}
>  //\end{snippet}
>  
> -__inline__ void count_cleanup(void)
> +inline void count_cleanup(void)
>  {
>  }
>  
> diff --git a/count/count.tex b/count/count.tex
> index 523789e2..173b964c 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -721,8 +721,8 @@ This is the topic of the next section.
>  \subsection{Per-Thread-Variable-Based Implementation}
>  \label{sec:count:Per-Thread-Variable-Based Implementation}
>  
> -\GCC\ provides an \apig{__thread} storage class that provides
> -per-thread storage.
> +The C language, since C11, features a \apig{_Thread_local} storage class that
> +provides per-thread storage.

Could you please mention __thread as the old way?  Either in the text
directly, in parentheses, as a footnote, or as a quick quiz, your choice.

							Thanx, Paul

>  This can be used as shown in
>  \cref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
>  to implement
> -- 
> 2.25.1
> 
