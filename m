Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34192 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1751225AbcFJS7H (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 10
 Jun 2016 14:59:07 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5AIsErj119541
 for <perfbook@vger.kernel.org>; Fri, 10 Jun 2016 14:59:06 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 23g1e72msb-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Fri,
 10 Jun 2016 14:59:06 -0400
Received: from localhost	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 10 Jun
 2016 12:59:05 -0600
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 0341C3E4003B	for <perfbook@vger.kernel.org>; Fri, 10 Jun 2016 12:59:02 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5AIx3RE35127512	for <perfbook@vger.kernel.org>; Fri, 10 Jun 2016 18:59:03
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5AIx2Nu008961	for <perfbook@vger.kernel.org>; Fri, 10 Jun 2016 14:59:02
 -0400
Date: Fri, 10 Jun 2016 09:31:38 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Makefile: Possible fix for warning of duplicated target
Reply-To: paulmck@linux.vnet.ibm.com
References: <e1642a9c-14f1-6cfe-e4f5-7d726226a952@gmail.com>
 <20160609161719.GD3758@linux.vnet.ibm.com>
 <1b014e28-b9f0-4b0d-8c29-f0a04c0a39f5@gmail.com>
 <20160609230756.GK3758@linux.vnet.ibm.com>
 <a3c95150-6bf2-df10-ec23-5399175d5d56@gmail.com>
 <a30d1a2e-88e1-b75f-a3bb-21952c06f46a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a30d1a2e-88e1-b75f-a3bb-21952c06f46a@gmail.com>
Message-Id: <20160610163138.GA3868@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jun 10, 2016 at 11:46:27PM +0900, Akira Yokosawa wrote:
> >From ad4c29bc05026135cb56f66e79585b6788c2a3aa Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 10 Jun 2016 23:26:01 +0900
> Subject: [PATCH] Makefile: Possible fix for warning of duplicated target
> 
> This commit fixes use of flavors of variables in Makefile.
> We should use "simply expanded variables" for variables
> which are referenced in definitions of other variables.
> 
> Reported-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

This gets rid of the warnings, thank you!  Queued and pushed.

							Thanx, Paul

> ---
>  Makefile | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 446c5f8..b508e61 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -5,29 +5,29 @@ LATEXSOURCES = \
>  	*/*.tex \
>  	*/*/*.tex
> 
> -EPSSOURCES_FROM_TEX = \
> +EPSSOURCES_FROM_TEX := \
>  	SMPdesign/DiningPhilosopher5.eps \
>  	SMPdesign/DiningPhilosopher5TB.eps \
>  	SMPdesign/DiningPhilosopher4part-b.eps \
>  	SMPdesign/DiningPhilosopher5PEM.eps
> 
> -DOTSOURCES = $(wildcard */*.dot)
> +DOTSOURCES := $(wildcard */*.dot)
> 
>  EPSSOURCES_FROM_DOT := $(DOTSOURCES:%.dot=%.eps)
> 
> -EPSSOURCES_DUP = \
> +EPSSOURCES_DUP := \
>  	$(wildcard */*.eps) \
>  	$(wildcard */*/*.eps) \
>  	$(EPSSOURCES_FROM_TEX) \
>  	$(EPSSOURCES_FROM_DOT)
> 
> -EPSSOURCES = $(sort $(EPSSOURCES_DUP))
> +EPSSOURCES := $(sort $(EPSSOURCES_DUP))
> 
>  PDFTARGETS_OF_EPS := $(EPSSOURCES:%.eps=%.pdf)
> 
>  BIBSOURCES = bib/*.bib
> 
> -SVGSOURCES = $(wildcard */*.svg)
> +SVGSOURCES := $(wildcard */*.svg)
> 
>  PDFTARGETS_OF_SVG := $(SVGSOURCES:%.svg=%.pdf)
> 
> -- 
> 1.9.1
> 
> 

