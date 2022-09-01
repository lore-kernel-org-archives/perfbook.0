Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbiIAPTG (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 1 Sep 2022 11:19:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF3984EEE
        for <perfbook@vger.kernel.org>; Thu,  1 Sep 2022 08:19:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E2758B827EA
        for <perfbook@vger.kernel.org>; Thu,  1 Sep 2022 15:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662045542;
        bh=+XlrIgO0L8SmzoK3NFq+8MyL/8/+rMwu/ycfwqO597E=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=kKYLiBK0WYQCRHR5Qehu4adhX0nrxsws5rx7XRR2QBgzqVFLR3QyBmjpYKgWsEkqW
         s/f/dUB4/Aa2d6s19yuOjfgu+KxY7ULIOyUMVjQB1amKSxrljr4d32R9RiVlyHcH3n
         0DRa2p6TH0bMK/6ubr8yKXQPfQVbuT+HYSVlQzI4lUhv6auyHIR4UO1knebLdmHFnj
         40SXlOXdnezTDzk+2yHr2gAobBAA6A2yxwRNENtn8FCwuZpBvgCC1Ts24UkNKCbEAn
         WHFAUygHebRHQk+ydnXcZjZis3EFDbI3/mE4kCm+p3ZXWZZ7NF5yOFjuoM5eNsQ2zI
         heGLTHvOUQFXQ==
Date: Thu, 1 Sep 2022 08:19:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/2] Fix punctuation around footnotes
Message-ID: <20220901151902.GX6159@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1d99f4ec-b5a5-52ad-df97-cddaee9f98a5@gmail.com>
 <1d8f63ca-1c10-5b35-6634-3c2351af1943@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d8f63ca-1c10-5b35-6634-3c2351af1943@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Sep 01, 2022 at 10:47:22PM +0900, Akira Yokosawa wrote:
> Perfbook's convention is to put footnotes after punctuation marks.
> There are a couple of footnotes placed in front of commas.
> 
> Fix them.
> 
> While here, fill in a missing comma in front of a footnote in datastruct
> so that the phrase "even with today's large-memory systems" reads as such.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes, applied, thank you!

> ---
> I'm thinking of adding rules to catch this sort of inconsistencies in
> punctcheck.pl.
> The one in datastuct would be hard for such a dumb script, though.

Automation is a good thing, but there are always limits.  The current
scripts do frequently catch things for me, so that is good.

Back on the misspellings, there is a list of commonly misspelled words
in the Linux kernel's scripts/spelling.txt file.  This list is used by
scripts/checkpatch.pl, which often catches my commit-log and comment
spelling errors.

Just a thought, though.

							Thanx, Paul

>         Thanks, Akira
> --
>  datastruct/datastruct.tex     | 2 +-
>  intro/intro.tex               | 4 ++--
>  toolsoftrade/toolsoftrade.tex | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 714795f7c5ed..2b802e0518a5 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -2132,7 +2132,7 @@ the one hand, and performance and simplicity on the other.
>  Fortunately, the relatively large memories available on modern
>  systems have allowed us to prioritize performance and simplicity
>  over memory overhead.
> -However, even with today's large-memory systems\footnote{
> +However, even with today's large-memory systems,\footnote{
>  	Smartphones with gigabytes of memory, anyone?}
>  it is sometimes necessary to take extreme measures to reduce
>  memory overhead.
> diff --git a/intro/intro.tex b/intro/intro.tex
> index e39ea652ba0a..2c7ad97b8111 100644
> --- a/intro/intro.tex
> +++ b/intro/intro.tex
> @@ -353,7 +353,7 @@ This change in focus is due to the fact that, although \IXr{Moore's Law}
>  continues to deliver increases in transistor density, it has ceased to
>  provide the traditional single-threaded performance increases.
>  This can be seen in
> -\cref{fig:intro:Clock-Frequency Trend for Intel CPUs}\footnote{
> +\cref{fig:intro:Clock-Frequency Trend for Intel CPUs},\footnote{
>  	This plot shows clock frequencies for newer CPUs theoretically
>  	capable of retiring one or more instructions per clock, and MIPS
>  	(millions of instructions per second, usually from the old
> @@ -366,7 +366,7 @@ This can be seen in
>  	Furthermore, the benchmarks commonly used on the older CPUs
>  	are obsolete, and it is difficult to run the newer benchmarks
>  	on systems containing the old CPUs, in part because it is hard
> -	to find working instances of the old CPUs.},
> +	to find working instances of the old CPUs.}
>  which shows that writing single-threaded code and simply waiting
>  a year or two for the CPUs to catch up may no longer be an option.
>  Given the recent trends on the part of all major manufacturers towards
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index dc24571a1163..97f8f2d3ecf9 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -2488,8 +2488,8 @@ per-CPU operations.
>  shows this book's per-thread-variable API, which is patterned
>  after the Linux kernel's per-CPU-variable API\@.
>  This API provides the per-thread equivalent of global variables.
> -Although this API is, strictly speaking, not necessary\footnote{
> -	You could instead use \apig{__thread} or \apic{_Thread_local}.},
> +Although this API is, strictly speaking, not necessary,\footnote{
> +	You could instead use \apig{__thread} or \apic{_Thread_local}.}
>  it can provide a good userspace analogy to Linux kernel code.
>  
>  \begin{listing}
> -- 
> 2.25.1
> 
> 
