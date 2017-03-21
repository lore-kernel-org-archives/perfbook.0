Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59474 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1757176AbdCUSgp (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 21
 Mar 2017 14:36:45 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2LITCjx018825
 for <perfbook@vger.kernel.org>; Tue, 21 Mar 2017 14:35:58 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 29b532enb3-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 21 Mar 2017 14:35:58 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 21 Mar
 2017 14:35:56 -0400
Date: Tue, 21 Mar 2017 11:35:53 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Choose 'cmtt' font for code snippets in targets 'msnt'
 and 'mstx'
Reply-To: paulmck@linux.vnet.ibm.com
References: <a0f0786c-d28a-1a9d-0159-58656f6490eb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0f0786c-d28a-1a9d-0159-58656f6490eb@gmail.com>
Message-Id: <20170321183553.GP3637@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Mar 20, 2017 at 01:58:15PM +0900, Akira Yokosawa wrote:
> >From 25fb5aea63049454a5df2c923dac59285fe40720 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 20 Mar 2017 13:10:38 +0900
> Subject: [PATCH] Choose 'cmtt' font for code snippets in targets 'msnt' and 'mstx'
> 
> By specifying "cmtt" (Computer Modern Teletype) font as \ttdefault
> in verbatim, verbbox, table, tabular, tabulary, and minipage
> environments, we can improve consistency of looks independent of
> monospace font choice for main text. cmtt font is more than suitable
> for listing of code snippet and program output.
> 
> However, when mixed used with Times Roman (clone) font, cmtt's
> slightly lower x-height than Times Roman, and its similar thickness
> as Times Roman, it is not distinctive enough as can be seen in
> "mslm" target.
> 
> In this respect, "txtt" and its enhanced version "newtxtt" fonts
> are more suitable as is described in [1].
> 
> This commit enables the font choice of cmtt for code snippets in
> targets "msnt" and "mstx".
> 
> Help messages in Makefile are updated accordingly.
> 
> Any feedback on the font choice is welcome.
> 
> [1] Excerpt from newtxtt documentation:
> 
>     This package provides an interface to another alternative---the
>     typewriter fonts provided with txfonts, with some enhancements.
>     They have the same widths as cmtt, but are taller, heavier,
>     more geometric and less shapely, with very low contrast, and
>     are more suited to match Roman fonts of height and weight
>     approximating that of Times.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

I did remove some trailing whitespace that this patch added to
perfbook.tex.  Please let me know if this whitespace was needed for
some reason.

							Thanx, Paul

> ---
>  Makefile     | 17 +++++++++++------
>  perfbook.tex | 13 +++++++++++++
>  2 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 2c88e6c..e5f620c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -110,7 +110,8 @@ perfbook-msns.tex: perfbook.tex
>  	sed -e 's/\[scaled=\.94\]{couriers}/{courier}/' < $< > $@
> 
>  perfbook-mstx.tex: perfbook.tex
> -	sed -e 's/usepackage\[scaled=\.94\]{couriers}/renewcommand*\\ttdefault{txtt}/' < $< > $@
> +	sed -e 's/usepackage\[scaled=\.94\]{couriers}/renewcommand*\\ttdefault{txtt}/' \
> +	    -e 's/setboolean{cmttforcode}{false}/setboolean{cmttforcode}{true}/' < $< > $@
> 
>  perfbook-msr.tex: perfbook.tex
>  	sed -e 's/\[scaled=\.94\]{couriers}/[scaled=.94]{nimbusmono}/' < $< > $@
> @@ -121,8 +122,10 @@ perfbook-msn.tex: perfbook.tex
>  	@echo "## This target requires font package nimbus15. ##"
> 
>  perfbook-msnt.tex: perfbook.tex
> -	sed -e 's/\[scaled=\.94\]{couriers}/[zerostyle=a]{newtxtt}/' < $< > $@
> +	sed -e 's/\[scaled=\.94\]{couriers}/[zerostyle=a]{newtxtt}/' \
> +	    -e 's/setboolean{cmttforcode}{false}/setboolean{cmttforcode}{true}/' < $< > $@
>  	@echo "## This target requires font package newtxtt. ##"
> +	@echo "## If build fails, try target 'mstx' instead. ##"
> 
>  perfbook-mslm.tex: perfbook.tex
>  	sed -e 's/%\\usepackage{lmodern}/\\usepackage{lmodern}/' \
> @@ -181,17 +184,19 @@ help:
>  	@echo
>  	@echo "Experimental targets:"
>  	@echo "  Full,              Abbr."
> -	@echo "  perfbook-msr.pdf,  msr:  2c with regular thickness courier clone"
> -	@echo "  perfbook-msn.pdf,  msn:  2c with narrow courier clone"
> -	@echo "  perfbook-mstx.pdf, mstx: 2c with txtt as monospace"
>  	@echo "  perfbook-msnt.pdf, msnt: 2c with newtxtt as monospace (non-slashed 0)"
> +	@echo "  perfbook-mstx.pdf, mstx: 2c with txtt as monospace"
>  	@echo "  perfbook-mslm.pdf, mslm: 2c with lmtt (Latin Modern Typewriter) as monospace"
>  	@echo "       (Latin Modern is a clone of Computer Modern with additional type faces)"
> +	@echo "  perfbook-msr.pdf,  msr:  2c with regular thickness courier clone"
> +	@echo "  perfbook-msn.pdf,  msn:  2c with narrow courier clone"
> +
>  	@echo "  perfbook-1csf.pdf, 1csf: 1c with sans serif font"
>  	@echo "  perfbook-msns.pdf, msns: 2c with non-scaled courier"
> +	@echo "  \"msnt\" requires \"newtxtt\". \"mstx\" is fallback target for older TeX env."
> +	@echo "  \"msnt\" and \"mstx\" use \"cmtt\" font for code snippet."
>  	@echo "  \"msr\" and \"msn\" require \"nimbus15\"."
>  	@echo "  \"msn\" doesn't cover bold face for monospace."
> -	@echo "  \"msnt\" requires \"newtxtt\"."
>  	@echo "  \"1csf\" requires recent version (>=1.3i) of \"mathastext\"."
> 
>  clean:
> diff --git a/perfbook.tex b/perfbook.tex
> index e8234c4..94f2f4b 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -15,6 +15,7 @@
>  % Improves the text layout
>  \usepackage{microtype}
>  \UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
> +\usepackage{etoolbox}
> 
>  \usepackage{lscape}
>  \usepackage{epsfig}
> @@ -64,6 +65,9 @@
>  \newboolean{sansserif}
>  \setboolean{sansserif}{false}
>  \newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}{#1}{#2}}
> +\newboolean{cmttforcode}
> +\setboolean{cmttforcode}{false}
> +\newcommand{\IfCmttForCode}[2]{\ifthenelse{\boolean{cmttforcode}}{#1}{#2}}
> 
>  \newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}
> 
> @@ -74,6 +78,15 @@
>  \renewcommand{\path}[1]{\nolinkurl{#1}} % workaround of interference with mathastext
>  }{}
> 
> +\IfCmttForCode{
> +\AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{cmtt}}
> +\AtBeginEnvironment{verbbox}{\renewcommand{\ttdefault}{cmtt}}
> +\AtBeginEnvironment{table}{\renewcommand{\ttdefault}{cmtt}}
> +\AtBeginEnvironment{tabular}{\renewcommand{\ttdefault}{cmtt}}
> +\AtBeginEnvironment{tabulary}{\renewcommand{\ttdefault}{cmtt}}
> +\AtBeginEnvironment{minipage}{\renewcommand{\ttdefault}{cmtt}}
> +}{}
> +                   
>  \begin{document}
> 
>  %%HTMLSKIP
> -- 
> 2.7.4
> 

