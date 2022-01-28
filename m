Return-Path: <SRS0=zzwF=SM=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UZQ5MQF2qdtYKOpdhTVW8gyQYst1Fr8GJHbBpwMvSX0=;
        b=QuvJmcvWUVxqA0AuYTqpCwTXvVzp/U+kactT9KyTa71VxmIQxzMPIyW4Ftr6Yeti3u
         3tgX+G+qgoEvoZ4kgWHkk7CzgOUVHmgqvpE8lNHnVy1o9cNAoau/903zA14+xNzO6Z1R
         +0OAFio1Ukn2ZD236AhpJvt/KjL6O3YQAO7glDSwORUDWR+XGLVfwPmwUYgyUUsDquiD
         5CqSfu2Bg6MiEuQxQeMwulWnXI2AoLS3zitdUSmbw4KuD0bEKu9DoX3BfNyjjU/++TKV
         ut6bC7XJFZaU4kJaz8ilfmsp93Z/FcW334zHQ5TS+O4J2ubFEUW4OQjd6vWCrEqZuoxx
         1uzw==
Message-ID: <0605b688-6c25-f42d-9907-7f28a78ac575@gmail.com>
Date: Fri, 28 Jan 2022 23:46:32 +0900
MIME-Version: 1.0
Subject: Re: [RFT PATCH -perfbook v2] Enable parallel runs of pdflatex
Content-Language: en-US
References: <900c36af-58e5-c8db-5900-3068143cfaa5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <900c36af-58e5-c8db-5900-3068143cfaa5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 28 Jan 2022 22:30:36 +0900, Akira Yokosawa wrote:
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
> There is a couple of minor issues in Makefile WRT parallel runs of
> runfirstlatex.sh.
> 
> When some of perfbook-xxx.tex files already existed, runfirstlatex.sh
> for other main perfbook-yyy.tex could be invoked prematurely before
> that .tex file got ready.
> 
> Fix it by adding stricter dependencies of perfbook-xxx.aux on
> perfbook-xxx.tex.
> 
> Also sort out dependencies around here.
> autodate.tex now depends only on files in Git repo.
> Instead, perfbook_flat.tex acts as a barrier between the file
> conversion phase and the pdflatex phase.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> This is v2 of the RFT patch.
> 
> Dependencies of perfbook*.aux, autodate.tex, and perfbook_flat.tex
> are straightened up since v1.
> 
> As for your concern of regression in PDFs generated, I think we
> can compare SyncTeX databases of single and parallel builds.
> 
> I did the following steps.
> 
> 1. Sequential build:
> 
>   $ make neatfreak; make LATEX_OPT=-synctex=1 2c 1c eb
>   $ cp perfbook.synctex.gz /tmp/perfbook.sequ.synctex.gz
>   $ cp perfbook-1c.synctex.gz /tmp/perfbook-1c.sequ.synctex.gz
>   $ cp perfbook-eb.synctex.gz /tmp/perfbook-eb.sequ.synctex.gz
> 
>  *WARNING*: "make neatfreak" below will remove *.synctex.gz,
>  so copy them somewhere out of your working directory!
> 
> 2. Parallel build:
> 
>   $ make neatfreak; make -j6 LATEX_OPT=-synctex=1 2c 1c eb
>   $ cp perfbook.synctex.gz /tmp/perfbook.para.synctex.gz
>   $ cp perfbook-1c.synctex.gz /tmp/perfbook-1c.para.synctex.gz
>   $ cp perfbook-eb.synctex.gz /tmp/perfbook-eb.para.synctex.gz
> 
> 3 Compare SyncTeX databases
> 
>   $ cd /tmp
>   $ cmp perfbook.sequ.synctex.gz perfbook.para.synctex.gz
>   $ cmp perfbook-1c.sequ.synctex.gz perfbook-1c.para.synctex.gz
>   $ cmp perfbook-eb.sequ.synctex.gz perfbook-eb.para.synctex.gz
> 
> In my test, there was no difference.
> 
> I think this is getting ready to be applied and pushed.

Please hold on!

This patch changes both LaTeX code and Makefile.
SyncTeX database is affected by LaTeX code change because
it is a collection of "LaTeX code (file:line:char) <->
coordinates in PDF".
So we can't see if changes in Makefile affect PDF or not.

I'll split this patch into a set of "preparatory LaTeX change"
and "Makefile update" patches.

        Thanks, Akira

> 
>         Thanks, Akira
> --
>  Makefile              | 12 +++++++-----
>  appendix/appendix.tex |  8 ++++----
>  perfbook-lt.tex       |  4 ++--
>  3 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 6ee849fd..ee1880ff 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -222,18 +222,20 @@ $(PDFTARGETS): %.pdf: %.tex %.bbl
>  $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
>  	bibtex $(basename $@)
>  
> -$(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES) $(LST_SOURCES)
> +$(PDFTARGETS:.pdf=.aux): %.aux: %.tex $(LATEXGENERATED)
>  ifeq ($(NEWTXTEXT),)
>  	$(error Font package 'newtx' not found. See #9 in FAQ-BUILD.txt)
>  endif
>  	sh utilities/runfirstlatex.sh $(basename $@)
>  
> -autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) \
> -    $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
> -    $(GITREFSTAGS) utilities/autodate.sh
> +autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(SOURCES_OF_SNIPPET) \
> +    $(LST_SOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) \
> +    $(SVGSOURCES) $(GITREFSTAGS) \
> +    utilities/autodate.sh
>  	sh utilities/autodate.sh
>  
> -perfbook_flat.tex: autodate.tex
> +perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) \
> +    $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
>  ifndef LATEXPAND
>  	$(error --> $@: latexpand not found. Please install it)
>  endif
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
