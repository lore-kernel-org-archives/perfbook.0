Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e36.co.us.ibm.com ([32.97.110.154]:34858 "EHLO
 e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1756103AbcECPtt (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 3 May 2016
 11:49:49 -0400
Received: from localhost	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 3 May 2016
 09:49:42 -0600
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 9E7E63E40052	for <perfbook@vger.kernel.org>; Tue, 3 May 2016 09:49:41 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u43Fnfv933095866	for <perfbook@vger.kernel.org>; Tue, 3 May 2016 15:49:41 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u43Fneqo015456	for <perfbook@vger.kernel.org>; Tue, 3 May 2016 11:49:40 -0400
Date: Tue, 3 May 2016 08:49:46 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Makefile: Denote phony targets explicitly
Message-ID: <20160503154946.GL3800@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <8c5ebd01-e036-0e4e-bb73-35095ce6d6eb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c5ebd01-e036-0e4e-bb73-35095ce6d6eb@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, May 04, 2016 at 12:14:46AM +0900, Akira Yokosawa wrote:
> >From a79124b5e603b3961242e882910e713d7ce0149a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Wed, 4 May 2016 00:00:30 +0900
> Subject: [PATCH] Makefile: Denote phony targets explicitly
> 
> By this change, even if a file having the same name is created
> accidentally, behavior of the Makefile won't be affected any more.
> 
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 1b508b1..7653c80 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -167,6 +167,7 @@ BIBSOURCES = \
>  	bib/swtools.bib \
>  	bib/syncrefs.bib
> 
> +.PHONY: all extraction embedfonts clean distclean neatfreak
>  all: perfbook.pdf
> 
>  perfbook.pdf: perfbook.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

