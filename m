Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiFXUbI (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 24 Jun 2022 16:31:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6286B6F791
        for <perfbook@vger.kernel.org>; Fri, 24 Jun 2022 13:31:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 086B8622EE
        for <perfbook@vger.kernel.org>; Fri, 24 Jun 2022 20:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656102666;
        bh=44KbGBZR1fsYw+w4AuqVbNxxvdTn4BnicSmLTn5KWTY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=FRKPwuHcTaYK50GRMVLG1DJulCfa+dvgRVlmgXH3SG1byYN0X5AjBU72HgGqKtf0i
         7a3TZcm/s4vAbv1BBP/vvZlBFMiBJBdnMoBHqUP/gyD3uz3WLXN03lgf3o0r3Fzd4g
         RaA0C1cCcrEZpDX51BOLcWmgw6owCjhozo3333w0Xeyl4yR8aXf79idw6aoS+oqwIy
         uD01FJToK+cEiM/3RX/4qECmgHgA7BNxO1+cAdOB0X3sxKTaOEnO6VXNKeNma4PIpQ
         dq+5enpLEKRhsPIFAew2ZHCCPWeOZBb4/iRYiWi44vEhO6SKwtiNLpAgKrGWUaq5SP
         mYG45KvD3UA3Q==
Date: Fri, 24 Jun 2022 13:31:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2 -perfbook 1/2] defer/whichtochoose: Use parnotes for
 footnote in tabularx
Message-ID: <20220624203106.GD1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <9c889180-5bc3-9588-808b-d598e919c9f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c889180-5bc3-9588-808b-d598e919c9f3@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jun 24, 2022 at 11:34:19PM +0900, Akira Yokosawa wrote:
> Due to conflict between LaTeX Packages hyperref and tabularx,
> both of them attempt to tweak the internal code of \footnote{}
> command, normal footnotes don't work in tabularx.
> 
> This made Paul use a primitive approach for the footnote added in
> commit 1760abb74224 ("defer/whichtochoose: Note possibility of
> membarrier() for hazptr").
> 
> Alternative way for footnotes inside tabularx is to use the
> "parnotes" package, whose implementation is orthogonal to hyperref
> and tabularx.
> 
> This commit employs this approach and uses the command \parnote in
> tabularx, and encloses the footnote-printing \parnotes command in
> a minipage to prevent the footnote text from centered.
> 
> As hyperref is not aware of parnotes, there is no crossref to the
> footnote text.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed both, thank you!

							Thanx, Paul

> ---
> Change in v2
>   - Send from the account that matches SoB.
> 
> Notes of v1:
> --
> Hi Paul,
> 
> I'm not sure if you are happy with the addition of yet another
> LaTeX package dependency, but I just wanted to show you this is
> possible.  There might be other places where "parnotes" fits.
> 
> The trick of minipage for preventing centering should work in
> your primitive approach.
> 
> It's up to you to take this one or not.
> 
>         Thanks, Akira
> --
>  defer/whichtochoose.tex | 13 +++++++------
>  perfbook-lt.tex         |  1 +
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
> index 3c8cc2dccaef..95b355a1c471 100644
> --- a/defer/whichtochoose.tex
> +++ b/defer/whichtochoose.tex
> @@ -217,7 +217,9 @@ But those wishing more detail should continue on to the next section.
>  	Reader Per-Object Traversal Overhead
>  		& Read-modify-write atomic operations, memory\-/barrier
>  		  instructions, and cache misses
> -			& \tco{smp_mb()} *
> +			& \tco{smp_mb()}\parnote[*]{This \co{smp_mb()} can be
> +				downgraded to a compiler \co{barrier()} by using
> +				the Linux-kernel \co{membarrier()} system call.}
>  				& None, but unsafe
>  					& None (volatile accesses) \\
>  	Reader Forward Progress Guarantee
> @@ -253,11 +255,10 @@ But those wishing more detail should continue on to the next section.
>  	\bottomrule
>  \end{tabularx}
>  }
> -
> -~
> -
> -* This \co{smp_mb()} can be downgraded to a compiler \co{barrier()} by
> -using the Linux-kernel \co{membarrier()} system call.
> +\begin{minipage}{\onecolumntextwidth}
> +	\vspace*{1ex}
> +	\parnotes
> +\end{minipage}
>  \caption{Which Deferred Technique to Choose?
>  					     (Details)}
>  \label{tab:defer:Which Deferred Technique to Choose?  (Details)}
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index d70dde66f725..9cde2e4d42e5 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -75,6 +75,7 @@
>  \usepackage[split,makeindex]{splitidx}
>  \usepackage[nottoc]{tocbibind}
>  \usepackage[columns=3,totoc,indentunit=12pt,justific=raggedright,font=small,columnsep=.15in]{idxlayout}
> +\usepackage{parnotes} % for footnotes in tabularx
>  \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
>  \usepackage{footnotebackref} % to enable cross-ref of footnote
>  \usepackage[all]{hypcap} % for going to the top of figure and table
> 
> base-commit: 1760abb742247869ac06cee18289f0a36d4d973b
> -- 
> 2.25.1
> 
