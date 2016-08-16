Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56376 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1751562AbcHPOSB (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 16
 Aug 2016 10:18:01 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u7GEELIL119642
 for <perfbook@vger.kernel.org>; Tue, 16 Aug 2016 10:18:00 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 24t0325uky-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Tue,
 16 Aug 2016 10:18:00 -0400
Received: from localhost	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 16 Aug
 2016 08:17:58 -0600
Date: Tue, 16 Aug 2016 07:18:05 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Makefile: Remove empty target 'extraction'
Reply-To: paulmck@linux.vnet.ibm.com
References: <c752dd9e-4b36-93d4-af4f-ee769e529d21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c752dd9e-4b36-93d4-af4f-ee769e529d21@gmail.com>
Message-Id: <20160816141805.GL3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 16, 2016 at 08:17:40PM +0900, Akira Yokosawa wrote:
> >From f224cf6d4b4fe21edd23d712a4b102396fa66755 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 16 Aug 2016 18:53:45 +0900
> Subject: [PATCH] Makefile: Remove empty target 'extraction'
> 
> As commit 69523c880c9a ("Remove generated files contrib.tex and
> origpub.tex from archive") removed files I called out as
> necessary in commit 7f46bce80811 ("Makefile: Add comment on why
> 'extraction' is an empty target"), I noticed that the comment
> added then was simply bogus.
> We can safely remove the target "extraction" and define rules
> for qqz.tex, contrib.tex, and origpug.tex in Makefile.
> 
> This commit adds those rules instead of target "extraction",
> and removes the wrong comment.
> 
> "extraction" is intentionally left in the "clean" rule and
> in .gitignore for the time being. They can be removed later,
> say after the next release.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch!  I should have looked more carefully at the output from
a from-scratch build after my ill-considered change:

	texexpand: include origpub failed. Reinserting  command
	texexpand: include contrib failed. Reinserting  command

This is much nicer -- the issue was that the gitk command would show
origpub.tex and contrib.tex as modified if you hit F5 during a build.
It was necessary to do a "git status" to get rid of this.  With this
change, this doesn't happen (as was the case with my change), but also
the above errors don't appear.

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  Makefile | 41 ++++++++++++++---------------------------
>  1 file changed, 14 insertions(+), 27 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 60e8e96..570b79e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -6,6 +6,8 @@ LATEXSOURCES = \
>  	*/*.tex \
>  	*/*/*.tex
> 
> +LATEXGENERATED = qqz.tex contrib.tex origpub.tex
> +
>  EPSSOURCES_FROM_TEX := \
>  	SMPdesign/DiningPhilosopher5.eps \
>  	SMPdesign/DiningPhilosopher5TB.eps \
> @@ -68,18 +70,23 @@ perfbook.pdf: perfbook.bbl
>  perfbook.bbl: $(BIBSOURCES) perfbook.aux
>  	bibtex perfbook
> 
> -perfbook.aux: $(LATEXSOURCES) extraction
> +perfbook.aux: $(LATEXSOURCES) $(LATEXGENERATED)
>  	sh utilities/runfirstlatex.sh perfbook
> 
> -perfbook_flat.tex qqz.tex: perfbook.tex $(LATEXSOURCES) $(EPSSOURCES) $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG)
> +perfbook_flat.tex: perfbook.tex $(LATEXSOURCES) $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG)
>  	echo > qqz.tex
> +	echo > contrib.tex
> +	echo > origpub.tex
>  	texexpand perfbook.tex > perfbook_flat.tex
> +
> +qqz.tex: perfbook_flat.tex
>  	sh utilities/extractqqz.sh < perfbook_flat.tex > qqz.tex
> 
> -extraction: perfbook_flat.tex
> +contrib.tex: perfbook_flat.tex qqz.tex
>  	cat perfbook_flat.tex qqz.tex | sh utilities/extractcontrib.sh > contrib.tex
> +
> +origpub.tex: perfbook_flat.tex
>  	sh utilities/extractorigpub.sh < perfbook_flat.tex > origpub.tex
> -	touch extraction
> 
>  perfbook-1c.pdf: perfbook-1c.tex perfbook-1c.bbl
>  	sh utilities/runlatex.sh perfbook-1c
> @@ -90,7 +97,7 @@ perfbook-1c.tex: perfbook.tex
>  perfbook-1c.bbl: $(BIBSOURCES) perfbook-1c.aux
>  	bibtex perfbook-1c
> 
> -perfbook-1c.aux: $(LATEXSOURCES) extraction
> +perfbook-1c.aux: $(LATEXSOURCES) $(LATEXGENERATED)
>  	sh utilities/runfirstlatex.sh perfbook-1c
> 
>  perfbook-hb.pdf: perfbook-hb.tex perfbook-hb.bbl
> @@ -102,7 +109,7 @@ perfbook-hb.tex: perfbook.tex
>  perfbook-hb.bbl: $(BIBSOURCES) perfbook-hb.aux
>  	bibtex perfbook-hb
> 
> -perfbook-hb.aux: $(LATEXSOURCES) extraction
> +perfbook-hb.aux: $(LATEXSOURCES) $(LATEXGENERATED)
>  	sh utilities/runfirstlatex.sh perfbook-hb
> 
>  # Rules related to perfbook_html are removed as of May, 2016
> @@ -148,7 +155,7 @@ clean:
>  		-o -name '*.dvi' -o -name '*.log' \
>  		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' | xargs rm -f
>  	rm -f perfbook_flat.tex perfbook.out perfbook-1c.out
> -	rm -f qqz.tex
> +	rm -f $(LATEXGENERATED)
>  	rm -f perfbook-hb.out perfbook-1c.tex perfbook-hb.tex
>  	rm -f extraction
> 
> @@ -165,23 +172,3 @@ ls-unused:
>  neatfreak: distclean
>  	# Don't forget to regenerate the .pdf from each .svg file
>  	find . -name '*.pdf' | xargs rm -f
> -
> -# Note on why 'extraction' should be an empty target
> -#
> -# There are dependency loops around perfbook_flat.tex.
> -# perfbook_flat.tex requires an empty qqz.tex and up-to-date
> -# contrib.tex and origpub.tex for texexpand to work properly.
> -#
> -# Both contrib.tex and origpub.tex requires perfbook_flat.tex.
> -# contrib.tex also requires up-to-date qqz.tex.
> -#
> -# So at first glance, rules for contrib.tex and origpub.tex
> -# can be defined, but that requires 'extraction' to be a phony
> -# target.
> -#
> -# 'extraction' is prerequisite for perfbook.aux.
> -# If you make it a phony target, the rule for perfbook.aux is
> -# always executed. That means runfirstlatex.run will run even
> -# if no source file is updated.
> -# To avoid the redundant run, we need to make 'extraction' an
> -# empty target.
> -- 
> 1.9.1
> 

