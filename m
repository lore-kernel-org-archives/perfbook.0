Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726978AbfJDRGq (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 4 Oct 2019 13:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570208804;
        bh=BcYiFViNQOFVVjkFsfDREoFnc3WNs7t8zHDDkK9FO/s=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=uAF5kdh7WRcwOiz5uX+AEJAvTqafgosggi58H+LP2AoG36f42p3xqRtkU2DCWsAAX
         bCB2nPWydNBiN8mWqO0DBosMTB6N+np0oe4ENNKaNSLlwXzs2d3tIwVvJQ1p3X3B7w
         nIe2PulpD5LxF4iE2m+uUX/k/u4Mol4MssFfKXw4=
Date: Fri, 4 Oct 2019 10:06:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH RESEND] Make hyperlinks colorful and browsable in PDF
 viewer
Message-ID: <20191004170643.GM2689@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <aeaa1b9d-1917-a177-3396-da8dd736889c@gmail.com>
 <36156427-7c2b-130b-41b6-a18b425eff2e@gmail.com>
 <CAKTCnz=8penAT4UJUFvxjx8sXFHKAdP2oCuQDX2H2oo6o5mQ0g@mail.gmail.com>
 <a161e1ba-37c0-4edf-da13-463ad2f3eb6a@gmail.com>
 <c8228db6-1ebd-2b77-2b7c-bd100068d367@gmail.com>
 <ee324299-1a70-3ca3-7d3f-79f4b876fa4d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee324299-1a70-3ca3-7d3f-79f4b876fa4d@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org

On Sat, Oct 05, 2019 at 12:22:19AM +0900, Akira Yokosawa wrote:
> >From 8b1a3e2402b12c99a36844c642f1ce2bafdd7277 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 18 Sep 2019 19:40:14 +0900
> Subject: [PATCH v2] Make hyperlinks colorful and browsable in PDF viewer
> 
> Balbir suggested coloring hyperlinks to make them easier to
> recognize [1].
> 
> As 2c layouts are supposed to be for printing, enable coloring
> of hyperlinks only in 1c layout. To do this, add a boolean
> variable "colorlinks" and set it true for 1c layout. This would
> make it easy to change the condition to enable "colorlinks".
> 
> Select "MediumBlue" via xcolor's "svgnames" option as it looks
> less distracting than the pure "blue", but still distinguishable.
> 
> Redundant framing of links in bibliography is disabled when
> "colorlinks" is effective.
> 
> Also make the page numbers in TOC hyperlinks as well.
> 
> [1]: https://www.spinics.net/lists/perfbook/msg02350.html
> 
> Suggested-by: Balbir Singh <bsingharora@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you both!

							Thanx, Paul

> ---
> Hi Paul,
> 
> As I couldn't get Balbir's ack for a week or so, I'm resending
> this patch as the author.
> 
> Changes from EXP PATCH:
> 
>     o Color of links is changed to MediumBlue. Depending on
>       display settings/resolution, DaukBlue is sometimes hard
>       to distinguish especially with serif font. For bold
>       "Quick Quiz", DarkBlue could be a better choice. Such
>       an optimization can be done in the future.
> 
>     o Substitute Balbir's Suggested-by: for his Signed-of-by:.
> 
>     o Edit change log to reflect the circumstances.
> 
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
> index 42f39e77..6eae887c 100644
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
> +\hypersetup{colorlinks=true,allcolors=MediumBlue}
> +}{}
> +
>  \IfNimbusAvail{
>  \usepackage{nimbusmononarrow}
>  }{}
> -- 
> 2.17.1
> 
> 
