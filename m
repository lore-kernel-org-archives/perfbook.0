Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:39338 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiAaBsT (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 30 Jan 2022 20:48:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 105DA6117F
        for <perfbook@vger.kernel.org>; Mon, 31 Jan 2022 01:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643593698;
        bh=eowZNs/tCv8VB6buqsbwst4ih5C/ZP6DfaxA+DR8WzA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Fr79Uz+IGNrSFX4pBOiAu2UxmGY767GhWWNYOHXrappVtfO150VycPrgy2nF5/hQx
         RnsuO+u0v1andT9A8nKDicYYQ/D90+Nd4ZrSU2lipj1mO/8N+xspLUPL9otIxhIyrR
         cDU/8OPuM4ojxqxs3jlNy5SAMN1xlEErn6PCdl8IgOo9lsz5hydYhmzZMh4UfX/xNu
         GtSMdBKbRbnP4K8mqMoCxtB+UCdtIHYY/rD1s7CL4dzk6jmGl+5nSqNiVjpQoSd9ZE
         23JOU66fXjXZ+40tGh+FavzgLEO8NQNG18iYTXRMLTMgOayZC1Y66FYTq6Tk7IxWx3
         76anPru8VRWfA==
Date: Sun, 30 Jan 2022 17:48:18 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFT PATCH -perfbook v3 5/4] Makefile: Fix regression of
 parallel run of autodate.sh
Message-ID: <20220131014818.GT4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <e4f48e3d-7efe-f822-1002-6836d63b542f@gmail.com>
 <a786b98d-037a-649e-863a-f72aa8c224e5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a786b98d-037a-649e-863a-f72aa8c224e5@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jan 30, 2022 at 06:38:37PM +0900, Akira Yokosawa wrote:
> Commit xxxxxxxxxxxx ("Makefile: Fix issues WRT parallel runs of
> pdflatex") changed dependency around autodate.tex so that it
> depends only on files in the Git repository.
> 
> However, this change causes autodate.sh to see untracked temporary
> intermediate files from concurrent conversion of figures.
> It ends up adding the "(m)" maker in autodate.tex even when there is
> no untracked file in the beginning.
> 
> Fix the regression by partially reverting xxxxxxxxxxxx and restoring
> dependencies of autodate.tex on converted PDF and .fcv files.
> 
> Note: This regression was caught by parallel-latex-regress.sh
> when Paul ran it under clean Git repository.
> 
> Fixes: xxxxxxxxxxxx ("Makefile: Fix issues WRT parallel runs of pdflatex")
> Reported-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Much better!  Queued with SHA-1 applied and pushed, thank you!!!

At least this way we tested the test.  ;-)

							Thanx, Paul

> ---
> Paul,
> 
> I can merge this with 2/4, but I'd rather keep this partial revert
> as an example of regression found by the script.
> 
> If you push this series to master, please amend the commit ids
> in the change log.
> 
>        Thanks, Akira
> --
>  Makefile | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index ee1880ff..e09ba32d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -228,14 +228,12 @@ ifeq ($(NEWTXTEXT),)
>  endif
>  	sh utilities/runfirstlatex.sh $(basename $@)
>  
> -autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(SOURCES_OF_SNIPPET) \
> -    $(LST_SOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) \
> -    $(SVGSOURCES) $(GITREFSTAGS) \
> -    utilities/autodate.sh
> +autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(LST_SOURCES) \
> +    $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
> +     $(GITREFSTAGS) utilities/autodate.sh
>  	sh utilities/autodate.sh
>  
> -perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) \
> -    $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
> +perfbook_flat.tex: autodate.tex
>  ifndef LATEXPAND
>  	$(error --> $@: latexpand not found. Please install it)
>  endif
> -- 
> 2.17.1
> 
> 
