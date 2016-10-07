Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47147 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751627AbcJGFHh (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 7
 Oct 2016 01:07:37 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u9753i62023580
 for <perfbook@vger.kernel.org>; Fri, 7 Oct 2016 01:07:37 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 25x52tgee9-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 07 Oct 2016 01:07:36 -0400
Received: from localhost by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 6 Oct 2016
 23:07:36 -0600
Date: Thu, 6 Oct 2016 22:07:41 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Makefile: Use implicit rules for various layout options
Reply-To: paulmck@linux.vnet.ibm.com
References: <a63bd961-2db3-3348-419f-5d96bf5a5d19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a63bd961-2db3-3348-419f-5d96bf5a5d19@gmail.com>
Message-Id: <20161007050741.GK23148@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 07, 2016 at 12:24:54AM +0900, Akira Yokosawa wrote:
> >From 9300942224fc8072cad9d6582858993c5efa5131 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 6 Oct 2016 23:57:07 +0900
> Subject: [PATCH] Makefile: Use implicit rules for various layout options
> 
> This commit replaces redundant rules for perfbook.pdf,
> perfbook-1c.pdf, and perfbook-hb.pdf with custom implicit rules.
> These implicit rules will also help when you want to add
> tentative rules to try some experimental layout option.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Nice!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  Makefile | 32 ++++++++------------------------
>  1 file changed, 8 insertions(+), 24 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 0207473..55361c3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -9,6 +9,8 @@ LATEXSOURCES = \
> 
>  LATEXGENERATED = qqz.tex contrib.tex origpub.tex
> 
> +PDFTARGETS := perfbook.pdf perfbook-1c.pdf perfbook-hb.pdf
> +
>  EPSSOURCES_FROM_TEX := \
>  	SMPdesign/DiningPhilosopher5.eps \
>  	SMPdesign/DiningPhilosopher5TB.eps \
> @@ -65,14 +67,14 @@ all: $(targ)
> 
>  hb: perfbook-hb.pdf
> 
> -perfbook.pdf: perfbook.bbl
> -	sh utilities/runlatex.sh perfbook
> +$(PDFTARGETS): %.pdf: %.tex %.bbl
> +	sh utilities/runlatex.sh $(basename $@)
> 
> -perfbook.bbl: $(BIBSOURCES) perfbook.aux
> -	bibtex perfbook
> +$(PDFTARGETS:.pdf=.bbl): %.bbl: $(BIBSOURCES) %.aux
> +	bibtex $(basename $@)
> 
> -perfbook.aux: $(LATEXSOURCES) $(LATEXGENERATED)
> -	sh utilities/runfirstlatex.sh perfbook
> +$(PDFTARGETS:.pdf=.aux): $(LATEXSOURCES) $(LATEXGENERATED)
> +	sh utilities/runfirstlatex.sh $(basename $@)
> 
>  perfbook_flat.tex: perfbook.tex $(LATEXSOURCES) $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG)
>  	echo > qqz.tex
> @@ -89,30 +91,12 @@ contrib.tex: perfbook_flat.tex qqz.tex
>  origpub.tex: perfbook_flat.tex
>  	sh utilities/extractorigpub.sh < perfbook_flat.tex > origpub.tex
> 
> -perfbook-1c.pdf: perfbook-1c.tex perfbook-1c.bbl
> -	sh utilities/runlatex.sh perfbook-1c
> -
>  perfbook-1c.tex: perfbook.tex
>  	sed -e 's/,twocolumn//' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < perfbook.tex > perfbook-1c.tex
> 
> -perfbook-1c.bbl: $(BIBSOURCES) perfbook-1c.aux
> -	bibtex perfbook-1c
> -
> -perfbook-1c.aux: $(LATEXSOURCES) $(LATEXGENERATED)
> -	sh utilities/runfirstlatex.sh perfbook-1c
> -
> -perfbook-hb.pdf: perfbook-hb.tex perfbook-hb.bbl
> -	sh utilities/runlatex.sh perfbook-hb
> -
>  perfbook-hb.tex: perfbook.tex
>  	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < perfbook.tex > perfbook-hb.tex
> 
> -perfbook-hb.bbl: $(BIBSOURCES) perfbook-hb.aux
> -	bibtex perfbook-hb
> -
> -perfbook-hb.aux: $(LATEXSOURCES) $(LATEXGENERATED)
> -	sh utilities/runfirstlatex.sh perfbook-hb
> -
>  # Rules related to perfbook_html are removed as of May, 2016
> 
>  $(EPSSOURCES_FROM_TEX): %.eps: %.tex
> -- 
> 2.7.4
> 

