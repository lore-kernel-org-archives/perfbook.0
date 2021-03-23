Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232897AbhCWQKM (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 23 Mar 2021 12:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616515812;
        bh=Yf9geHDivv8spU+yPu32hjMJ/XpsQ3EEKGCwZ2YiMzo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=XWHOl2BCPIAd6xPPe28YDdkK/Dy885nHOw0jC+BiRE1xzUM2uraw8vF3/i7+rw221
         FY2G6YMqt6/WKB6WzRXgALZUsdHYzLuuXLOLjkbk0uXxKEWpmU4g9PCHm0itjyjnGX
         Ri9Oa3HevwkfWF/Bx+wUq5b1lsEaIOYdKlwfNUMH4OCjJWU5kvvJFo3vZWqiAOoYdC
         DAnzcOooFa3J2NyG/QNXC7Z7fTWJCqHF306ZpnBwlap32xUmYmV8TDdzEpwWy8kMIH
         I/6GYiHwqc36GhTrdBmL8GuFe1edNj4FirSauMPIAY68BFZ5UXso8v7msjQfPFct8l
         hXXGHi9TqjJhw==
Date: Tue, 23 Mar 2021 09:10:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFC PATCH] perfbook/papersize: ebook reader size support
Message-ID: <20210323161012.GV2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210323010153.GH77072@balbir-desktop>
 <20210323052354.GS2696@paulmck-ThinkPad-P72>
 <20210323093822.GJ77072@balbir-desktop>
 <3a81ce2e-3c94-9609-b6a3-e4597425e838@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a81ce2e-3c94-9609-b6a3-e4597425e838@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org

On Tue, Mar 23, 2021 at 10:39:50PM +0900, Akira Yokosawa wrote:
> Hi Balbir,
> 
> I am surprised to see perfbook's LaTeX codebase works fairly well
> in the ebook paper size.
> 
> Impressive, indeed!
> 
> A few inline comments:
> 
> On Tue, 23 Mar 2021 20:38:22 +1100, Balbir Singh wrote:
> > On Mon, Mar 22, 2021 at 10:23:54PM -0700, Paul E. McKenney wrote:
> >> On Tue, Mar 23, 2021 at 12:01:53PM +1100, Balbir Singh wrote:
> > ...
> >> Very good!
> >>
> >> But would it be possible to create a separate build target for this
> >> combination?  Just in case others are using 1c for normal-sized paper?
> >>
> > 
> > Add support for ebooksize, which is roughly the size of
> > a kindle (4.5in, 6.3in) with margin size of 0.2in. The
> > recommended changes were taken from stackexchange with
> > links in the code. Not all tables take nicely to the
> > new size and warnings are produced, these warnings are about
> > about overfull hbox's. This size/target also enforces
> > single column output and increases the size of the pdf
> > by almost 40% in terms of number of pages. The actual size
> > on the disk is not all that different. The final output
> > though is very readable on the kindle I own.
> > 
> > I've been running the command via
> > 
> > env PERFBOOK_PAPER=ER make perfbook-er.pdf
> 
> Do you still need to set PERFBOOK_PAPER? 
> 
> > 
> > TODOs:
> > 1. Make tables and some figures work nicely in this mode
> 
> Shrinking tables and figures is not so hard, but to shrink tall
> code snippets might be tricky.
> 
> I have some ideas to do them.  Can you wait a couple of days?
> I'll post some PoC scheme for you to base your further tuning.
> 
> Just shrinking tables and code snippets might result in
> illegibly small font, though.
> 
> > 2. Consider scaling the font
> 
> You mean the font size of 10pt is too large for ebook readers?

What fraction of ebook readers allow zooming in to small figures?
Smartphones do, but I have no idea on Kindles and the like.

And thank you both -- this is something that people have been
requesting for a long time!

						Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Signed-off-by: Balbir singh <bsingharora@gmail.com>
> > ---
> >  Makefile        | 10 +++++++++-
> >  perfbook-lt.tex | 13 ++++++++++++-
> >  2 files changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index db20da96..37ee76aa 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -29,7 +29,7 @@ LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex sub_qqz
> >  # parallel runs of divideqqz.pl.
> >  
> >  TWOCOLTARGETS := mstx msr msn msnt sf qq nq ix
> > -ABBREVTARGETS := lt hb a4 1c tcb msns mss $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
> > +ABBREVTARGETS := lt hb a4 1c tcb msns mss er $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
> >  
> >  PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)
> >  GENERATED_MAIN := $(filter-out perfbook-lt.tex,$(foreach v,$(ABBREVTARGETS),perfbook-$(v).tex)) perfbook.tex
> > @@ -178,10 +178,14 @@ ifeq ($(PERFBOOK_PAPER),A4)
> >  else
> >  ifeq ($(PERFBOOK_PAPER),HB)
> >  	PERFBOOK_BASE = perfbook-hb.tex
> > +else
> > +ifeq ($(PERFBOOK_PAPER),ER)
> > +	PERFBOOK_BASE = perfbook-er.tex
> >  else
> >  	PERFBOOK_BASE = perfbook-lt.tex
> >  endif
> >  endif
> > +endif
> >  
> >  .PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mslm perfbook-mslm.pdf mslmmsg help help-official help-full
> >  all: $(targ)
> > @@ -283,6 +287,10 @@ perfbook-1c.tex: $(PERFBOOK_BASE)
> >  perfbook-hb.tex: perfbook-lt.tex
> >  	sed -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@
> >  
> > +perfbook-er.tex: perfbook-lt.tex
> > +	sed -e 's/setboolean{ebooksize}{false}/setboolean{ebooksize}{true}/' < $< > $@
> > +	sed -i 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' $@
> > +
> >  perfbook-msns.tex: $(PERFBOOK_BASE)
> >  	sed -e 's/%msfontstub/\\usepackage{courier}/' < $< > $@
> >  
> > diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> > index e76d4d7b..a884011a 100644
> > --- a/perfbook-lt.tex
> > +++ b/perfbook-lt.tex
> > @@ -116,6 +116,9 @@
> >  \newboolean{hardcover}
> >  \setboolean{hardcover}{false}
> >  \newcommand{\IfHardCover}[2]{\ifthenelse{\boolean{hardcover}}{#1}{#2}}
> > +\newboolean{ebooksize}
> > +\setboolean{ebooksize}{false}
> > +\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}{#1}{#2}}
> >  \newboolean{afourpaper}
> >  \setboolean{afourpaper}{false}
> >  \newcommand{\IfAfourPaper}[2]{\ifthenelse{\boolean{afourpaper}}{#1}{#2}}
> > @@ -320,6 +323,14 @@
> >        \usepackage[letterpaper,body={6.5in,8.25in},twocolumn,columnsep=0.25in]{geometry}      
> >  }}}{ % One Column
> >    \setlength{\twocolumnwidth}{3.125in}
> > +  \IfEbookSize {
> > +    % From https://tex.stackexchange.com/questions/16735/latex-options-for-kindle
> > +    \usepackage[papersize={4.5in,6.3in},margin=0.2in,onecolumn]{geometry}
> > +    \sloppy
> > +    %\pagestyle{empty}
> > +    %\usepackage[scaled]{helvet}
> > +    %\renewcommand{\familydefault}{\sfdefault}
> > +  }{
> >    \IfHardCover{
> >      \usepackage[papersize={8.25in,10.75in},body={4.75in,8.25in},onecolumn]{geometry}
> >    }{
> > @@ -327,7 +338,7 @@
> >      \usepackage[a4paper,body={4.75in,8.25in},onecolumn]{geometry}
> >      }{
> >      \usepackage[letterpaper,body={4.75in,8.25in},onecolumn]{geometry}
> > -  }}
> > +  }}}
> >    \geometry{hcentering=true} % horizontal centering for 1c layouts
> >  }
> >  \IfAfourPaper{
> > 
