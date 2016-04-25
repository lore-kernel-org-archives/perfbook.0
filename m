Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e36.co.us.ibm.com ([32.97.110.154]:50271 "EHLO
 e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1754087AbcDYRVE (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 25 Apr 2016
 13:21:04 -0400
Received: from localhost	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 25 Apr
 2016 11:21:02 -0600
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 090223E40048	for <perfbook@vger.kernel.org>; Mon, 25 Apr 2016 11:20:59 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3PHKxKB39583868	for <perfbook@vger.kernel.org>; Mon, 25 Apr 2016 17:20:59
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3PHKxql013171	for <perfbook@vger.kernel.org>; Mon, 25 Apr 2016 13:20:59
 -0400
Date: Mon, 25 Apr 2016 10:21:35 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Fix regression in improvement of build scripts
Message-ID: <20160425172135.GG3874@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <571E0B74.6030808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571E0B74.6030808@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 25, 2016 at 09:20:04PM +0900, Akira Yokosawa wrote:
> Hi, Paul.
> 
> I realized there was a real regression in the runlatex refactoring
> patch.
> 
> Attached is the obvious fix.
> I hope nobody has been affected by the bug.
> Please apply.
>                                                    Thanks, Akira
> 
> ---
> >From 816c5fb3ae9bf1ad18e622cbee327aca1df66629 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Mon, 25 Apr 2016 20:47:31 +0900
> Subject: [PATCH] Fix regression in improvement of build scripts
> 
> In commit 4038e781ed56 ("Improve behavior of build scripts"),
> I made an obvious error in the dependency of 'perfbook.aux.'
> This commit fixes it.
> 
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 7202334..b909c81 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -173,7 +173,7 @@ perfbook.pdf: perfbook.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
>  perfbook.bbl: $(BIBSOURCES) perfbook.aux
>  	bibtex perfbook
> 
> -perfbook.aux: $(LATEXSOURCES) $(EPSSOURCES)
> +perfbook.aux: $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
>  	sh utilities/runfirstlatex.sh perfbook
> 
>  perfbook-1c.pdf: perfbook-1c.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
> -- 
> 1.9.1
> 

