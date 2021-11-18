Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229922AbhKRNhX (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 18 Nov 2021 08:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637242463;
        bh=nxH9sCwva9rjwjc82UpNadcG3JK/Mo9r2lhPgoLfQD0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KHG+KyoTV0EN9gtWQFlUgc8BYvCW4TZp2cYevvpi6++KNThJHSpub8CfLQYQ3hZ0y
         vl4c9PsCcnT2Dasv5/miiF39601VgmK48+tYIUqxsOWQaDrboMNqmPf7pyTOO2wVva
         BEGkILsF8ls3M17cCj3krOWzCccuo8/r9BNWL33TWHkgVPG5NlZZ5oeza2ORTvK4yw
         mqbLcud9CkCPHdvMESuqDkHMvqgGEe4EUnsSoQoie5baX7wUeyA7WL8SrGTYPtlU0J
         k/vZzVFIjie41toBS8GmKANqKlrJBwAV9c32aRruNMnhu1xX4OcE41vngtfWYmJpb+
         E5s3wnmz4hS0g==
Date: Thu, 18 Nov 2021 05:34:22 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] ordering: fix typo in QQ A.5
Message-ID: <20211118133422.GT641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211118065830.14709-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118065830.14709-1-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, luyang.co@gmail.com

On Thu, Nov 18, 2021 at 02:58:30PM +0800, Zhouyi Zhou wrote:
> In QQ A.5, the pronoun "that" should be preposition "than". And the
> word "imptementations" should be "implementations".
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>

Good eyes, queued and pushed, thank you!  (It is QQ A.3 over here,
so I adjusted the commit log.)

							Thanx, Paul

> ---
> Hi Paul,
> 
> I fixes some typo in QQ A.5
> 
> Thanks Zhouyi
> --
>  appendix/questions/ordering.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/appendix/questions/ordering.tex b/appendix/questions/ordering.tex
> index 298600f9..05217bc8 100644
> --- a/appendix/questions/ordering.tex
> +++ b/appendix/questions/ordering.tex
> @@ -97,8 +97,8 @@ than the semantics given by the options above.
>  
>  \QuickQuiz{
>  	But if fully ordered implementations cannot offer stronger
> -	guarantees that the better performing and more scalable weakly
> -	ordered imptementations, why bother with full ordering?
> +	guarantees than the better performing and more scalable weakly
> +	ordered implementations, why bother with full ordering?
>  }\QuickQuizAnswer{
>  	Because strongly ordered implementations are sometimes
>  	able to provide greater consistency among sets of calls to
> -- 
> 2.25.1
> 
