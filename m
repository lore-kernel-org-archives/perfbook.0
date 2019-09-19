Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389041AbfISOsQ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 19 Sep 2019 10:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568904495;
        bh=2KnmnA3TYeIvlvjzh2l8QliF3plDYuazCkuPpn51eh8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=zm71tO4Xt21o86WDl6rtnuFAvmOboOzcicLaMKXyN5GT7hKC2GN5lOWhzQerdnOlE
         9l+t0AzneM9aW1mtN8KKxTohyc/GwcCindGdByRRtzMnTRqiSFeisvk8dtlI92gI3Q
         9UjOrYE0/yPoON9jgbtvHdtm8FRkw6R2oyixIqE4=
Date: Thu, 19 Sep 2019 07:48:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [EXP PATCH] Make hyperlinks colorful and browsable in PDF viewer
Message-ID: <20190919144810.GM30224@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <aeaa1b9d-1917-a177-3396-da8dd736889c@gmail.com>
 <36156427-7c2b-130b-41b6-a18b425eff2e@gmail.com>
 <CAKTCnz=8penAT4UJUFvxjx8sXFHKAdP2oCuQDX2H2oo6o5mQ0g@mail.gmail.com>
 <a161e1ba-37c0-4edf-da13-463ad2f3eb6a@gmail.com>
 <c8228db6-1ebd-2b77-2b7c-bd100068d367@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8228db6-1ebd-2b77-2b7c-bd100068d367@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org

On Thu, Sep 19, 2019 at 07:52:05AM +0900, Akira Yokosawa wrote:
> From: Balbir Singh <bsingharora@gmail.com>
> 
> Without these changes the PDF does not provide a browsable TOC
> to choose for navigation, also add a bit of color to the links
> to make them screen friendly.
> 
> [akiyks: Split from patch [1].
>     As 2c layouts are supposed to be for printing, enable coloring
>     of hyperlinks only in 1c layout. To do this, add a boolean
>     variable "colorlinks" and set it true for 1c layout. This would
>     make it easy to change the condition to enable "colorlinks".
> 
>     Select "DarkBlue" via xcolor's "svgnames" option as it looks
>     less distracting than the pure "blue".
> 
>     Redundant framing of links in bibliography is disabled when
>     "colorlinks" is effective.
> 
>     Also make the page numbers in TOC hyperlinks as well.
> 
>     [1]: https://www.spinics.net/lists/perfbook/msg02350.html
> ]
> 
> Signed-off-by: Balbir Singh <bsingharora@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul and Balbir,
> 
> This is an experimental patch.
> Does the links in "DarkBlue" acceptable (in 1c layout) to you?
> Any suggestion of color choice is welcome!

Being as I am red-green colorblind, I must defer to the two of you on
color choices.  Looks just fine to me, but...  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
>  appendix/appendix.tex |  8 ++++++--
>  perfbook.tex          | 16 ++++++++++++++--
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/appendix/appendix.tex b/appendix/appendix.tex
> index d246a7f7..7b0d5c76 100644
> --- a/appendix/appendix.tex
> +++ b/appendix/appendix.tex
> @@ -14,9 +14,13 @@
>  }{
>    \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
>  }
> -\hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
> +\IfColorLinks{}{
> +  \hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
> +}
>  \bibliography{bib/RCU,bib/WFS,bib/hw,bib/os,bib/parallelsys,bib/patterns,bib/perfmeas,bib/refs,bib/syncrefs,bib/search,bib/swtools,bib/realtime,bib/TM,bib/standards,bib/OSS,bib/maze,bib/energy,bib/QC,bib/NP}
> -\hypersetup{pdfborder=0 0 0}
> +\IfColorLinks{}{
> +  \hypersetup{pdfborder=0 0 0}
> +}
>  \IfTwoColumn{
>    \end{adjustwidth*}\twocolumn
>  }{
> diff --git a/perfbook.tex b/perfbook.tex
> index 85696333..a0805831 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -42,7 +42,7 @@
>  \setlist[description]{style=unboxed}
>  %\usepackage{enumerate}
>  \usepackage{ifthen}
> -\usepackage[table]{xcolor}
> +\usepackage[table,svgnames]{xcolor}
>  \usepackage[shortcuts]{extdash}
>  \usepackage{changepage}
>  \usepackage{listings}
> @@ -58,7 +58,7 @@
>  \usepackage{tabularx}
>  \usepackage[hyphens]{url}
>  \usepackage{threeparttable}
> -\usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0}]{hyperref}
> +\usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
>  \usepackage{footnotebackref} % to enable cross-ref of footnote
>  \usepackage[all]{hypcap} % for going to the top of figure and table
>  \usepackage{epigraph}
> @@ -100,6 +100,18 @@
>  \setboolean{nimbusavail}{false}
>  \newcommand{\IfNimbusAvail}[2]{\ifthenelse{\boolean{nimbusavail}}{#1}{#2}}
>  
> +\newboolean{colorlinks}
> +\setboolean{colorlinks}{false}
> +\newcommand{\IfColorLinks}[2]{\ifthenelse{\boolean{colorlinks}}{#1}{#2}}
> +
> +\IfTwoColumn{}{
> +\setboolean{colorlinks}{true}
> +}
> +
> +\IfColorLinks{
> +\hypersetup{colorlinks=true,allcolors=DarkBlue}
> +}{}
> +
>  \IfNimbusAvail{
>  \usepackage{nimbusmononarrow}
>  }{}
> -- 
> 2.17.1
> 
> 
