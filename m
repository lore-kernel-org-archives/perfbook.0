Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51304 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727910AbeLLSp7 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 12 Dec 2018 13:45:59 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBCIhhKX133082
        for <perfbook@vger.kernel.org>; Wed, 12 Dec 2018 13:45:58 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2pb5y2ddwj-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Wed, 12 Dec 2018 13:45:57 -0500
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 12 Dec 2018 18:45:57 -0000
Date: Wed, 12 Dec 2018 10:45:55 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH v2] Makefile: Add recipe to remove obsolete intermediate
 files
Reply-To: paulmck@linux.ibm.com
References: <28055f52-bc17-b9b4-b81f-d286b930e096@gmail.com>
 <398dbc5f-7e83-cc5a-0029-b6125fba8f1b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <398dbc5f-7e83-cc5a-0029-b6125fba8f1b@gmail.com>
Message-Id: <20181212184555.GA4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 12, 2018 at 08:27:15PM +0900, Akira Yokosawa wrote:
> >From 33b506548ce3b09cbf7a7e4e8bf1a80496dd9e1a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 12 Dec 2018 20:11:21 +0900
> Subject: [PATCH v2] Makefile: Add recipe to remove obsolete intermediate files
> 
> Commit 3ab5541f7404 ("intro: Add containers and hypervisor to
> "iron triangle" diagram") replaced intro/PPGrelation.fig with
> intro/PPGrelation.svg.  Left-over intermediate file
> intro/PPGrelation.eps causes duplicated targets in the Makefile.
> 
> Therefore, add a list OBSOLETE_FILES in the Makefile and exclude
> such files from EPSSOURCES.
> 
> Add "extraction" to the list since it was once an empty target
> and obsolete now.
> 
> "make clean" will remove those files.
> 
> Also remove PPGrelation.eps from intro/.gitignore.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> This is an improved update.
> 
> v1 -> v2:
> 
> o   To prevent warning of "make" even if the obsolete .eps file
>     exists, exclude OBSOLETE_FILES from EPSSOURCES.
> 
> o   "extraction" is also obsolete, so add it to OBSOLETE_FILES.
> 
>         Thanks, Akira

Queued and pushed, and it did get rid of my intro/PPGrelation.eps.  ;-)
Thank you!

							Thanx, Paul

> --
>  Makefile         | 6 +++---
>  intro/.gitignore | 1 -
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c928c80..79ccd99 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -12,6 +12,7 @@ LATEXSOURCES = \
>  	*/*/*.tex
>  
>  LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex
> +OBSOLETE_FILES = intro/PPGrelation.eps extraction
>  
>  ABBREVTARGETS := tcb 1c hb msns mss mstx msr msn msnt 1csf
>  
> @@ -38,7 +39,7 @@ EPSSOURCES_DUP := \
>  	$(EPSSOURCES_FROM_DOT) \
>  	$(EPSSOURCES_FROM_FIG)
>  
> -EPSSOURCES := $(sort $(EPSSOURCES_DUP))
> +EPSSOURCES := $(sort $(filter-out $(OBSOLETE_FILES),$(EPSSOURCES_DUP)))
>  
>  PDFTARGETS_OF_EPS := $(EPSSOURCES:%.eps=%.pdf)
>  
> @@ -293,8 +294,7 @@ clean:
>  		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' \
>  		-o -name '*.fcv' -o -name '*.ltms' | xargs rm -f
>  	rm -f perfbook_flat.tex perfbook*.out perfbook-*.tex
> -	rm -f $(LATEXGENERATED)
> -	rm -f extraction
> +	rm -f $(LATEXGENERATED) $(OBSOLETE_FILES)
>  	rm -f CodeSamples/snippets.mk CodeSamples/snippets.d
>  
>  distclean: clean
> diff --git a/intro/.gitignore b/intro/.gitignore
> index c29b706..cffadec 100644
> --- a/intro/.gitignore
> +++ b/intro/.gitignore
> @@ -1,4 +1,3 @@
>  FourTaskCategories.eps
>  FourTaskOrder.eps
>  Generality.eps
> -PPGrelation.eps
> -- 
> 2.7.4
> 
> 

