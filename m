Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349840AbiA1P7L (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 28 Jan 2022 10:59:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D82BC061755
        for <perfbook@vger.kernel.org>; Fri, 28 Jan 2022 07:59:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E263D61EBD
        for <perfbook@vger.kernel.org>; Fri, 28 Jan 2022 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643385550;
        bh=CyhgJ1cApwPK3tAlwEKxaFkUaMSz4awhlFhL1IDQhGk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KAk2conqfe4Hr2Zf8ol2Wozvs5ebbxQIl/A3qiVqwm2VwbwcKUEitjxP+9qXYxkiy
         F0WqEUJWnQL1Sx5YhJlGlREbr8CO9DpaIAjmcfl4zMd7+AYvQiGvA3JZuox9u5fA3k
         hEAjWAu4yJddtStBmX0SGO6Zw2js8AJ46U/VA+NAVUiz19ed9mLRGz6EG9n78poh67
         lpF+SqPyirktBNSPO/WX2kyUj+2J2X5zKp0xaj4J+cdCFNRWpSXi3RDvq1B8xlo4iW
         73HBLSP3cK/y7QfiB+mExJFVNXWh3N+MtMutJage1lq7ZTfVT1l4UsMq8c/4uP01IX
         QB9tJQpT8wY+A==
Date: Fri, 28 Jan 2022 07:59:10 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFT PATCH -perfbook v2] Enable parallel runs of pdflatex
Message-ID: <20220128155910.GK4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <900c36af-58e5-c8db-5900-3068143cfaa5@gmail.com>
 <0605b688-6c25-f42d-9907-7f28a78ac575@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0605b688-6c25-f42d-9907-7f28a78ac575@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jan 28, 2022 at 11:46:32PM +0900, Akira Yokosawa wrote:
> On Fri, 28 Jan 2022 22:30:36 +0900, Akira Yokosawa wrote:
> > Parallel build of PDF figures and .fcv snippets by "make -jN" worked
> > when a single PDF target was given to "make", such as
> > "make neatfreak; make -j4 eb".
> > On the other hand, "make -j3 2c 1c eb" ended up in various errors
> > during parallel runs of pdflatex.
> > 
> > It turns out that the cause of the error is the \include{} commands
> > in appendix/appendix.tex and perfbook-lt.tex.
> > \include{} switches to its own .aux file, in this case,
> > appendix/questions.aux, appendix/toyrcu.aux, and so on.
> > As their names are common to different PDF targets, those .aux files
> > can be overwritten/corrupted by parallel runs of pdflatex.
> > 
> > \include{} implies \cleardoublepage both in front of and next to it.
> > In perfbook, included LaTeX sources have \chapter{} commands and
> > the implied page breaks are redundant.
> > 
> > By replacing \include{} with \input{}, parallel runs of pdflatex can
> > be enabled.
> > 
> > There is a couple of minor issues in Makefile WRT parallel runs of
> > runfirstlatex.sh.
> > 
> > When some of perfbook-xxx.tex files already existed, runfirstlatex.sh
> > for other main perfbook-yyy.tex could be invoked prematurely before
> > that .tex file got ready.
> > 
> > Fix it by adding stricter dependencies of perfbook-xxx.aux on
> > perfbook-xxx.tex.
> > 
> > Also sort out dependencies around here.
> > autodate.tex now depends only on files in Git repo.
> > Instead, perfbook_flat.tex acts as a barrier between the file
> > conversion phase and the pdflatex phase.
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> > Hi Paul,
> > 
> > This is v2 of the RFT patch.
> > 
> > Dependencies of perfbook*.aux, autodate.tex, and perfbook_flat.tex
> > are straightened up since v1.
> > 
> > As for your concern of regression in PDFs generated, I think we
> > can compare SyncTeX databases of single and parallel builds.
> > 
> > I did the following steps.
> > 
> > 1. Sequential build:
> > 
> >   $ make neatfreak; make LATEX_OPT=-synctex=1 2c 1c eb
> >   $ cp perfbook.synctex.gz /tmp/perfbook.sequ.synctex.gz
> >   $ cp perfbook-1c.synctex.gz /tmp/perfbook-1c.sequ.synctex.gz
> >   $ cp perfbook-eb.synctex.gz /tmp/perfbook-eb.sequ.synctex.gz
> > 
> >  *WARNING*: "make neatfreak" below will remove *.synctex.gz,
> >  so copy them somewhere out of your working directory!
> > 
> > 2. Parallel build:
> > 
> >   $ make neatfreak; make -j6 LATEX_OPT=-synctex=1 2c 1c eb
> >   $ cp perfbook.synctex.gz /tmp/perfbook.para.synctex.gz
> >   $ cp perfbook-1c.synctex.gz /tmp/perfbook-1c.para.synctex.gz
> >   $ cp perfbook-eb.synctex.gz /tmp/perfbook-eb.para.synctex.gz
> > 
> > 3 Compare SyncTeX databases
> > 
> >   $ cd /tmp
> >   $ cmp perfbook.sequ.synctex.gz perfbook.para.synctex.gz
> >   $ cmp perfbook-1c.sequ.synctex.gz perfbook-1c.para.synctex.gz
> >   $ cmp perfbook-eb.sequ.synctex.gz perfbook-eb.para.synctex.gz
> > 
> > In my test, there was no difference.
> > 
> > I think this is getting ready to be applied and pushed.
> 
> Please hold on!
> 
> This patch changes both LaTeX code and Makefile.
> SyncTeX database is affected by LaTeX code change because
> it is a collection of "LaTeX code (file:line:char) <->
> coordinates in PDF".
> So we can't see if changes in Makefile affect PDF or not.
> 
> I'll split this patch into a set of "preparatory LaTeX change"
> and "Makefile update" patches.

Thank you for the warning, and I am looking forward to the update!

						Thanx, Paul

>         Thanks, Akira
> 
> > 
> >         Thanks, Akira
> > --
> >  Makefile              | 12 +++++++-----
> >  appendix/appendix.tex |  8 ++++----
> >  perfbook-lt.tex       |  4 ++--
> >  3 files changed, 13 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 6ee849fd..ee1880ff 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -222,18 +222,20 @@ $(PDFTARGETS): %.pdf: %.tex %.bbl
> >  $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
> >  	bibtex $(basename $@)
> >  
> > -$(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES) $(LST_SOURCES)
> > +$(PDFTARGETS:.pdf=.aux): %.aux: %.tex $(LATEXGENERATED)
> >  ifeq ($(NEWTXTEXT),)
> >  	$(error Font package 'newtx' not found. See #9 in FAQ-BUILD.txt)
> >  endif
> >  	sh utilities/runfirstlatex.sh $(basename $@)
> >  
> > -autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) \
> > -    $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
> > -    $(GITREFSTAGS) utilities/autodate.sh
> > +autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(SOURCES_OF_SNIPPET) \
> > +    $(LST_SOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) \
> > +    $(SVGSOURCES) $(GITREFSTAGS) \
> > +    utilities/autodate.sh
> >  	sh utilities/autodate.sh
> >  
> > -perfbook_flat.tex: autodate.tex
> > +perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) \
> > +    $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
> >  ifndef LATEXPAND
> >  	$(error --> $@: latexpand not found. Please install it)
> >  endif
> > diff --git a/appendix/appendix.tex b/appendix/appendix.tex
> > index f2640157..edcfe7ef 100644
> > --- a/appendix/appendix.tex
> > +++ b/appendix/appendix.tex
> > @@ -2,9 +2,9 @@
> >  % mainfile: ../perfbook.tex
> >  % SPDX-License-Identifier: CC-BY-SA-3.0
> >  
> > -\include{appendix/questions/questions}
> > -\include{appendix/toyrcu/toyrcu}
> > -\include{appendix/whymb/whymemorybarriers}
> > -\include{appendix/styleguide/styleguide}
> > +\input{appendix/questions/questions}
> > +\input{appendix/toyrcu/toyrcu}
> > +\input{appendix/whymb/whymemorybarriers}
> > +\input{appendix/styleguide/styleguide}
> >  \renewcommand{\bottomtitlespace}{.08\textheight}
> >  \QuickQuizAnswers
> > diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> > index 085ce55d..d70dde66 100644
> > --- a/perfbook-lt.tex
> > +++ b/perfbook-lt.tex
> > @@ -667,12 +667,12 @@
> >  
> >  % Credits
> >  \setcounter{secnumdepth}{-1} % surpress section numbering in backmatter
> > -\include{ack}
> > +\input{ack}
> >  
> >  % Index if enabled
> >  \IfIndexOn{
> >  \IfIndexHier{
> > -\include{indexsee}
> > +\input{indexsee}
> >  }{}
> >  \phantomsection
> >  \IfEbookSize{
> > 
> > base-commit: f24ccfbd345eab8a70d6c08e71c84f18df46a3a1
