Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229464AbhCWFXz (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 23 Mar 2021 01:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616477035;
        bh=x519n2SA1WZqo5rwfYfCkjnQhmBWJbaMnfaCz46r3Hs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LhwKSZ39zbSbpc9hFhHyxZYS95GXpjJT3KlsCDSrHC6qLkn37NK9Cpn+NAj/8nYCn
         MNrgQjbmoxyUwfrsecs8wWa0hOKfaZjd7ZDSUpU6XWAEs615EZJYcxavO4b5isXcjD
         drfoXcPWSIQ536lkcM8r7QSQLFU47cmyCYj16+PDiAgHyoFbdcQfxLQc5s5v6s21VO
         nKNE8+An6xBwX1h9f6tFcXvDmaST5zXmJjHRTvEYFzWJ5ltFmK3RRlS+g7B4f8xZIb
         dmdCaYt5sLiRm4UqZJxlUm9QDLbOAWCqB/e7j3wdkcSvphad/+ndbqLmbe5pSxxViJ
         sG1DNOWPOoFEw==
Date: Mon, 22 Mar 2021 22:23:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFC PATCH] perfbook/papersize: ebook reader size support
Message-ID: <20210323052354.GS2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210323010153.GH77072@balbir-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010153.GH77072@balbir-desktop>
List-ID: <perfbook.vger.kernel.org>
To: Balbir Singh <bsingharora@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Mar 23, 2021 at 12:01:53PM +1100, Balbir Singh wrote:
> 
> Add support for ebooksize, which is roughly the size of
> a kindle (4.5in, 6.3in) with margin size of 0.2in. The
> recommended changes were taken from stackexchange with
> links in the code. Not all tables take nicely to the
> new nice and warnings are produced, which causes warnings
> about overfull hbox's to be generated. This mode enforces
> single column output and increases the size of the pdf
> by almost 40% in terms of number of pages. The final output
> though is very readable on the kindle I own.
> 
> I've been running the command via
> 
> env PERFBOOK_PAPER=ER make perfbook-1c.pdf
> 
> and love the output so far.
> 
> Signed-off-by: Balbir singh <bsingharora@gmail.com>

Very good!

But would it be possible to create a separate build target for this
combination?  Just in case others are using 1c for normal-sized paper?

							Thanx, Paul

> ---
>  Makefile        |  7 +++++++
>  perfbook-lt.tex | 13 ++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index db20da96..3732ba18 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -178,10 +178,14 @@ ifeq ($(PERFBOOK_PAPER),A4)
>  else
>  ifeq ($(PERFBOOK_PAPER),HB)
>  	PERFBOOK_BASE = perfbook-hb.tex
> +else
> +ifeq ($(PERFBOOK_PAPER),ER)
> +	PERFBOOK_BASE = perfbook-er.tex
>  else
>  	PERFBOOK_BASE = perfbook-lt.tex
>  endif
>  endif
> +endif
>  
>  .PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mslm perfbook-mslm.pdf mslmmsg help help-official help-full
>  all: $(targ)
> @@ -283,6 +287,9 @@ perfbook-1c.tex: $(PERFBOOK_BASE)
>  perfbook-hb.tex: perfbook-lt.tex
>  	sed -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@
>  
> +perfbook-er.tex: perfbook-lt.tex
> +	sed -e 's/setboolean{ebooksize}{false}/setboolean{ebooksize}{true}/' < $< > $@
> +
>  perfbook-msns.tex: $(PERFBOOK_BASE)
>  	sed -e 's/%msfontstub/\\usepackage{courier}/' < $< > $@
>  
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index e76d4d7b..a884011a 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -116,6 +116,9 @@
>  \newboolean{hardcover}
>  \setboolean{hardcover}{false}
>  \newcommand{\IfHardCover}[2]{\ifthenelse{\boolean{hardcover}}{#1}{#2}}
> +\newboolean{ebooksize}
> +\setboolean{ebooksize}{false}
> +\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}{#1}{#2}}
>  \newboolean{afourpaper}
>  \setboolean{afourpaper}{false}
>  \newcommand{\IfAfourPaper}[2]{\ifthenelse{\boolean{afourpaper}}{#1}{#2}}
> @@ -320,6 +323,14 @@
>        \usepackage[letterpaper,body={6.5in,8.25in},twocolumn,columnsep=0.25in]{geometry}      
>  }}}{ % One Column
>    \setlength{\twocolumnwidth}{3.125in}
> +  \IfEbookSize {
> +    % From https://tex.stackexchange.com/questions/16735/latex-options-for-kindle
> +    \usepackage[papersize={4.5in,6.3in},margin=0.2in,onecolumn]{geometry}
> +    \sloppy
> +    %\pagestyle{empty}
> +    %\usepackage[scaled]{helvet}
> +    %\renewcommand{\familydefault}{\sfdefault}
> +  }{
>    \IfHardCover{
>      \usepackage[papersize={8.25in,10.75in},body={4.75in,8.25in},onecolumn]{geometry}
>    }{
> @@ -327,7 +338,7 @@
>      \usepackage[a4paper,body={4.75in,8.25in},onecolumn]{geometry}
>      }{
>      \usepackage[letterpaper,body={4.75in,8.25in},onecolumn]{geometry}
> -  }}
> +  }}}
>    \geometry{hcentering=true} % horizontal centering for 1c layouts
>  }
>  \IfAfourPaper{
> -- 
> 2.25.1
> 
