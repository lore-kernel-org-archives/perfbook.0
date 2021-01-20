Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729820AbhATXnU (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 20 Jan 2021 18:43:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611186139;
        bh=yLTRBAZnn6TPOBqKXnfuRcHcfiSohnLVpk4nNW2GQxI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PRDDnwNPO96TVkhRlh8evwXmho/ncG7BFNUwtGsGZdm4eyrAP3Tf9h6xOHCgJvTDt
         G4u4CWoaKQW7cxGAGd7r0HVq5rZEEQNaA73SI3NcmBhMmiQZh2QdVt5oZMHF6o58l6
         C6YCu1tDumu4uW0uTPXjVUJwZz3nra/Xr4timubw/GXn+I7E3NjTmvsLyt3ecf60Py
         YQTG4QognP4uf6Hj9ZwCCWMWnjaegJJazYViV2SigiVZ4SLotqtbU+jq020c9I877C
         b/NhcsH+MPsmuYQa4q7bsptjqj4ayGB4nCcfp/CEK23wjc8QgEez6tddlsuy8GRlL0
         skYEFAmtHxX2Q==
Date: Wed, 20 Jan 2021 15:42:18 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/3] Makefile: Fix timing of autodate.tex generation
Message-ID: <20210120234218.GK2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <25e9a0f4-8903-1523-9d04-ce34d7d97db6@gmail.com>
 <56807712-d5c4-b477-6fa7-ea346fea0215@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56807712-d5c4-b477-6fa7-ea346fea0215@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 18, 2021 at 12:04:23AM +0900, Akira Yokosawa wrote:
> Commit bd1310a7bcd1 ("Makefile: Cope with GhostScript 9.53.0 or later")
> introduced ps2pdf and pdfcrop commands in .eps --> .pdf conversion
> of figures drawn by pstricks.
> 
> There commands generate a couple of temporary files during conversion
> and cropping.
> This causes autodate.sh to observe untracked files when perfbook is
> first built by parallel make (-jN option).
> 
> Delay the generation of autodate.tex until after all those conversions
> have finished by moving most dependencies of perfbook_flat.tex to
> those of autodate.tex.
> 
> Fixes: bd1310a7bcd1 ("Makefile: Cope with GhostScript 9.53.0 or later")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

As advertised, recloned and built with "make -j24" and no "(m)".

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 0c58f1a0..9d36156d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -213,10 +213,12 @@ ifeq ($(NEWTXTEXT),)
>  endif
>  	sh utilities/runfirstlatex.sh $(basename $@)
>  
> -autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) $(SOURCES_OF_SNIPPET) $(GITREFSTAGS) utilities/fcvextract.pl utilities/autodate.sh
> +autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) \
> +    $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
> +    $(GITREFSTAGS) utilities/autodate.sh
>  	sh utilities/autodate.sh >autodate.tex
>  
> -perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
> +perfbook_flat.tex: autodate.tex
>  ifndef LATEXPAND
>  	$(error --> $@: latexpand not found. Please install it)
>  endif
> -- 
> 2.17.1
> 
> 
