Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:55376 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiA0Epc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 26 Jan 2022 23:45:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DDD7361660
        for <perfbook@vger.kernel.org>; Thu, 27 Jan 2022 04:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643258731;
        bh=OABt/G/+crU6WvmchOIZ7oOfUB7Np2jR9haRBhExK6E=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=CC65QxA2ADNNXl8++L3Q9tCY6ZkBR1WCQKrA/TsxMwJZzm8DDEnU4or2m7M2POXRI
         rmQPAM5AXpHoL1BZFwe//8sODF/B5ctdYPGE6GAaEGdAIXi06tgSsnyCj0RIodXoDZ
         01GiGZpgii0P9wvApCcjRhQTGQrMoMGkDLAeeb5FrQ4e6NtPSRpyOeiIH7zBPTjuhL
         Uban5p68iHIqpXPTw5Hk/Unh2Vw/dctLh/fjRncafSZAAjnspM+MwH7qbWeO5DYwuE
         jnCBzrOi1/XbK3ZAcAA4B7SvJA7OaGIkZM6aSs38VrsXdFpNtc7CByufUB4cENy7zw
         9tC6sbVGFJbkQ==
Date: Wed, 26 Jan 2022 20:45:30 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFT PATCH -perfbook] Enable parallel runs of pdflatex
Message-ID: <20220127044530.GD4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <b27908db-9717-5d37-12ea-05dda137dd55@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b27908db-9717-5d37-12ea-05dda137dd55@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jan 27, 2022 at 10:51:25AM +0900, Akira Yokosawa wrote:
> Parallel build of PDF figures and .fcv snippets by "make -jN" worked
> when a single PDF target was given to "make", such as
> "make neatfreak; make -j4 eb".
> On the other hand, "make -j3 2c 1c eb" ended up in various errors
> during parallel runs of pdflatex.
> 
> It turns out that the cause of the error is the \include{} commands
> in appendix/appendix.tex and perfbook-lt.tex.
> \include{} switches to its own .aux file, in this case,
> appendix/questions.aux, appendix/toyrcu.aux, and so on.
> As their names are common to different PDF targets, those .aux files
> can be overwritten/corrupted by parallel runs of pdflatex.
> 
> \include{} implies \cleardoublepage both in front of and next to it.
> In perfbook, included LaTeX sources have \chapter{} commands and
> the implied page breaks are redundant.
> 
> By replacing \include{} with \input{}, parallel runs of pdflatex can
> be enabled.
> 
> There were a couple of minor issues in Makefile WRT parallel runs of
> runfirstlatex.sh.
> 
> When some of perfbook-xxx.tex files already existed, runfirstlatex.sh
> for other main perfbook-yyy.tex could be invoked prematurely before
> that .tex file was ready.
> 
> Fix it by adding stricter dependencies of perfbook-xxx.aux on
> perfbook-xxx.tex.
> Also remove some redundant dependencies around here.
> 
> Note: LATEXSOURCES contains perfbook-lt.tex
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> For quite a while, I was wondering why "make -j3 2c 1c eb"
> didn't work as expected.
> 
> I think I have managed to get it work.
> 
> But changes in Makefile need extra testing.  Especially,
> those involving parallelizing.
> 
> So I'd like you to give this a fair amount of testing before
> pushing it.

OK, I am applying it to an experimental repo.  Let's give it a go:

	$ time make -j32 2c 1c eb a4 nq sf sfnq
	[ . . . ]
	'perfbook-sf.pdf' is ready.
	'perfbook-1c.pdf' is ready.
	'perfbook.pdf' is ready.
	'perfbook-sfnq.pdf' is ready.
	'perfbook-a4.pdf' is ready.
	'perfbook-eb.pdf' is ready.
	'perfbook-nq.pdf' is ready.

	real    2m31.412s
	user    16m45.778s
	sys     1m48.385s

Not bad, actually!  Might be worth redoing my release scripts to take
advantage of this.  ;-)

I (very) quickly glanced at the PDFs, and they look OK.

I then did a "make clean" and:

	$ time make
	[ . . . ]
	'perfbook.pdf' is ready.
	utilities/punctcheck.sh
	utilities/cleverefcheck.sh

	real    1m47.823s
	user    1m45.715s
	sys     0m1.226s

Another "make clean" and:

	$ time make -j32
	[ . . . ]
	'perfbook.pdf' is ready.
	utilities/punctcheck.sh
	utilities/cleverefcheck.sh

	real    1m49.484s
	user    1m47.206s
	sys     0m1.437s

So, as one would expect, the sweet spot for -j is when rebuilding
all the images from scratch or when building multiple PDFs.

Nice!

Huh.  It would be good to have a way of diff-ing PDF files.  Then
a single-threaded-generated PDF could be automatically compared to
its counterpart from a concurrent build.  But the search engines
were not kind to me.

Thoughts?

							Thanx, Paul

>         Thanks, Akira
> --
>  Makefile              | 6 +++---
>  appendix/appendix.tex | 8 ++++----
>  perfbook-lt.tex       | 4 ++--
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 6ee849fd..9946be3a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -222,14 +222,14 @@ $(PDFTARGETS): %.pdf: %.tex %.bbl
>  $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
>  	bibtex $(basename $@)
>  
> -$(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES) $(LST_SOURCES)
> +$(PDFTARGETS:.pdf=.aux): %.aux: %.tex $(LATEXGENERATED) $(LST_SOURCES)
>  ifeq ($(NEWTXTEXT),)
>  	$(error Font package 'newtx' not found. See #9 in FAQ-BUILD.txt)
>  endif
>  	sh utilities/runfirstlatex.sh $(basename $@)
>  
> -autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) \
> -    $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
> +autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(PDFTARGETS_OF_EPS) \
> +    $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
>      $(GITREFSTAGS) utilities/autodate.sh
>  	sh utilities/autodate.sh
>  
> diff --git a/appendix/appendix.tex b/appendix/appendix.tex
> index f2640157..edcfe7ef 100644
> --- a/appendix/appendix.tex
> +++ b/appendix/appendix.tex
> @@ -2,9 +2,9 @@
>  % mainfile: ../perfbook.tex
>  % SPDX-License-Identifier: CC-BY-SA-3.0
>  
> -\include{appendix/questions/questions}
> -\include{appendix/toyrcu/toyrcu}
> -\include{appendix/whymb/whymemorybarriers}
> -\include{appendix/styleguide/styleguide}
> +\input{appendix/questions/questions}
> +\input{appendix/toyrcu/toyrcu}
> +\input{appendix/whymb/whymemorybarriers}
> +\input{appendix/styleguide/styleguide}
>  \renewcommand{\bottomtitlespace}{.08\textheight}
>  \QuickQuizAnswers
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index 085ce55d..d70dde66 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -667,12 +667,12 @@
>  
>  % Credits
>  \setcounter{secnumdepth}{-1} % surpress section numbering in backmatter
> -\include{ack}
> +\input{ack}
>  
>  % Index if enabled
>  \IfIndexOn{
>  \IfIndexHier{
> -\include{indexsee}
> +\input{indexsee}
>  }{}
>  \phantomsection
>  \IfEbookSize{
> 
> base-commit: f24ccfbd345eab8a70d6c08e71c84f18df46a3a1
> -- 
> 2.17.1
> 
