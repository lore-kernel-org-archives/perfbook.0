Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232142AbhCOP4l (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 15 Mar 2021 11:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615823799;
        bh=7kj92HIJN0Wc/PPJiJ5tHHR1W9pWRj1LXtQjFVkDRAY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=dwSJKpWWoKROC9V9a3Gpy7ntdbGU14f2DbfdvyCp7onrnkke56AtK84/yO4zCmGNi
         H+1Oh5VRvlWNP4mxfXvnmHuoD9vlAudrJK+9KB9a6GgfRLTRea1BX04eoijylB2RNf
         bNfq6CGjNLPrPzJRxZKY7+JQTHqeZa7x2wVAjzjIcgbduBpAcXAFMUR1KfmrZ9xRUp
         AbMH/Fd//pR1CuI6aRZP4Ve0DHPQXtgX35m4Lh/I4LO4G7iWRWCMAMnyRBoGFwQBP8
         1xrUa/iuxPI/8OLrooHEn+hYkI/1CNHMGzb0n7d2jbUa7DwdQNUA0Ll4GM+cjVIhCS
         kaF2+onm8L/kA==
Date: Mon, 15 Mar 2021 08:56:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] legal: Remove MIPS from the trademark list
Message-ID: <20210315155639.GM2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <2586d1bf-d475-b153-0e18-9bfbf9e186ab@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2586d1bf-d475-b153-0e18-9bfbf9e186ab@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Mar 16, 2021 at 12:03:17AM +0900, Akira Yokosawa wrote:
> Subject: [PATCH] legal: Remove MIPS from the trademark list
> 
> They say Wave Computing will become new "MIPS" [1].
> However, there is no official statement regarding the status of MIPS
> trademark at the moment.
> Tentatively remove MIPS from the explicit list and delegate it to
> the final "Other company, ..." item.
> 
> [1]: https://www.prnewswire.com/news-releases/wave-computing-and-mips-emerge-from-chapter-11-bankruptcy-301237051.html
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I well remember that time back in the early 1990s when MIPS was going
to take over the world.  I guess that it didn't turn out that way.  ;-)

Queued, and thank you!

							Thanx, Paul

> ---
> FWIW, the old entry of "Wave, Inc." was missing "Computing"...
> Few people read such Legal pages, if any. ;-)
> 
>         Thanks, Akira
> 
> --
>  legal.tex | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/legal.tex b/legal.tex
> index b2b827c4..89ce7715 100644
> --- a/legal.tex
> +++ b/legal.tex
> @@ -18,8 +18,6 @@ Trademarks:
>  	other countries, or both.
>  \item	Arm is a registered trademark of Arm Limited (or its subsidiaries)
>  	in the US and/or elsewhere.
> -\item	MIPS is a registered trademark of Wave, Inc. in the United States
> -	and other countries.
>  \item	SPARC is a registered trademark of SPARC International, Inc.
>  	Products bearing SPARC trademarks are based on an architecture
>  	developed by Sun Microsystems, Inc.
> -- 
> 2.17.1
> 
