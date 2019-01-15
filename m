Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35376 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727397AbfAOAaL (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 14 Jan 2019 19:30:11 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x0F0PgCN183392
        for <perfbook@vger.kernel.org>; Mon, 14 Jan 2019 19:30:10 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2q14ybg35t-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 14 Jan 2019 19:30:09 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 15 Jan 2019 00:30:09 -0000
Date: Mon, 14 Jan 2019 16:30:06 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 1/2] Makefile: Automate OBSOLETE_FILES definition
Reply-To: paulmck@linux.ibm.com
References: <91c8ec61-e42c-9768-150f-39db5ac2280d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91c8ec61-e42c-9768-150f-39db5ac2280d@gmail.com>
Message-Id: <20190115003006.GW1215@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 15, 2019 at 07:24:22AM +0900, Akira Yokosawa wrote:
> >From 96dd811c7e084d97cbf4ef3b4b3f68099f6e15eb Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 15 Jan 2019 07:10:15 +0900
> Subject: [PATCH 1/2] Makefile: Automate OBSOLETE_FILES definition
> 
> Commit 2da175371873 ('defer/rcu: Rework "Introduction to RCU"')
> obsoleted .eps files used to be generated from the removed .fig
> files. Instead of manually updating the variable in Makefile,
> automate the definition of OBSOLETE_FILES for replacements of
> ".fig -> .svg".
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Nice automation!  I queued and pushed this plus the .gitignore update,
thank you!!!

							Thanx, Paul

> ---
>  Makefile | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 79ccd99..b76eea0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -12,7 +12,6 @@ LATEXSOURCES = \
>  	*/*/*.tex
>  
>  LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex
> -OBSOLETE_FILES = intro/PPGrelation.eps extraction
>  
>  ABBREVTARGETS := tcb 1c hb msns mss mstx msr msn msnt 1csf
>  
> @@ -32,6 +31,12 @@ FIGSOURCES := $(wildcard */*.fig) $(wildcard */*/*.fig)
>  
>  EPSSOURCES_FROM_FIG := $(FIGSOURCES:%.fig=%.eps)
>  
> +SVGSOURCES := $(wildcard */*.svg)
> +FAKE_EPS_FROM_SVG := $(SVGSOURCES:%.svg=%.eps)
> +PDFTARGETS_OF_SVG := $(SVGSOURCES:%.svg=%.pdf)
> +
> +OBSOLETE_FILES = extraction $(FAKE_EPS_FROM_SVG)
> +
>  EPSSOURCES_DUP := \
>  	$(wildcard */*.eps) \
>  	$(wildcard */*/*.eps) \
> @@ -51,9 +56,6 @@ PDFTARGETS_OF_EPSOTHER := $(filter-out $(PDFTARGETS_OF_EPSORIG),$(PDFTARGETS_OF_
>  
>  BIBSOURCES := bib/*.bib alphapf.bst
>  
> -SVGSOURCES := $(wildcard */*.svg)
> -PDFTARGETS_OF_SVG := $(SVGSOURCES:%.svg=%.pdf)
> -
>  DOT := $(shell which dot 2>/dev/null)
>  FIG2EPS := $(shell which fig2eps 2>/dev/null)
>  A2PING := $(shell which a2ping 2>/dev/null)
> @@ -294,8 +296,9 @@ clean:
>  		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' \
>  		-o -name '*.fcv' -o -name '*.ltms' | xargs rm -f
>  	rm -f perfbook_flat.tex perfbook*.out perfbook-*.tex
> -	rm -f $(LATEXGENERATED) $(OBSOLETE_FILES)
> +	rm -f $(LATEXGENERATED)
>  	rm -f CodeSamples/snippets.mk CodeSamples/snippets.d
> +	@rm -f $(OBSOLETE_FILES)
>  
>  distclean: clean
>  	sh utilities/cleanpdf.sh
> -- 
> 2.7.4
> 

