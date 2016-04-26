Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e31.co.us.ibm.com ([32.97.110.149]:48605 "EHLO
 e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752394AbcDZPYM (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 26 Apr 2016
 11:24:12 -0400
Received: from localhost	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 26 Apr
 2016 09:24:10 -0600
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 85FA23E400A3	for <perfbook@vger.kernel.org>; Tue, 26 Apr 2016 09:23:59 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3QFNxdb44302582	for <perfbook@vger.kernel.org>; Tue, 26 Apr 2016 15:23:59
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3QFNwt0004234	for <perfbook@vger.kernel.org>; Tue, 26 Apr 2016 11:23:58
 -0400
Date: Tue, 26 Apr 2016 08:24:34 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Another regression fix of build script improvement
Message-ID: <20160426152434.GC3715@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <6a3c510c-f4c6-6826-46af-a91c7a45d17a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a3c510c-f4c6-6826-46af-a91c7a45d17a@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Apr 26, 2016 at 10:16:34PM +0900, Akira Yokosawa wrote:
> >From c2ea05aa026f81e4b7641b8a14144fd8caa8f661 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Tue, 26 Apr 2016 21:20:15 +0900
> Subject: [PATCH] Another regression fix of build script improvement
> 
> After commit 4038e781ed56 ("Improve behavior of build scripts"),
> it is impossible to build 'perfbook-1c.pdf' and 'perfbook-hb.pdf'
> just after cloning the git repository.
> The reason is the lack of rules for 'perfbook-1c.tex' and
> 'perfbook-hb.tex'targets, which are required for them.
> This commit adds those rules to Makefile.
> The reason I couldn't find the bug during my test is both
> 'perfbook-1c.tex' and 'perfbook-hb.tex' survive even
> 'make neatfreak' which I assumed to be used to clean everything.
> To avoid similar regression to recur, this commit also appends
> them to the 'clean' target.
> 
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  Makefile | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index b909c81..4d9ed30 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -176,20 +176,24 @@ perfbook.bbl: $(BIBSOURCES) perfbook.aux
>  perfbook.aux: $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
>  	sh utilities/runfirstlatex.sh perfbook
> 
> -perfbook-1c.pdf: perfbook-1c.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
> -	sed -e 's/,twocolumn//' -e '/^\\frontmatter/a \\\\pagestyle{plain}' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < perfbook.tex > perfbook-1c.tex
> +perfbook-1c.pdf: perfbook-1c.tex perfbook-1c.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
>  	sh utilities/runlatex.sh perfbook-1c
> 
> +perfbook-1c.tex: perfbook.tex
> +	sed -e 's/,twocolumn//' -e '/^\\frontmatter/a \\\\pagestyle{plain}' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < perfbook.tex > perfbook-1c.tex
> +
>  perfbook-1c.bbl: $(BIBSOURCES) perfbook-1c.aux
>  	bibtex perfbook-1c
> 
>  perfbook-1c.aux: $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
>  	sh utilities/runfirstlatex.sh perfbook-1c
> 
> -perfbook-hb.pdf: perfbook-hb.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
> -	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < perfbook.tex > perfbook-hb.tex
> +perfbook-hb.pdf: perfbook-hb.tex perfbook-hb.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
>  	sh utilities/runlatex.sh perfbook-hb
> 
> +perfbook-hb.tex: perfbook.tex
> +	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < perfbook.tex > perfbook-hb.tex
> +
>  perfbook-hb.bbl: $(BIBSOURCES) perfbook-hb.aux
>  	bibtex perfbook-hb
> 
> @@ -257,7 +261,7 @@ clean:
>  		-o -name '*.dvi' -o -name '*.log' \
>  		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' | xargs rm -f
>  	rm -f perfbook_flat.tex perfbook_html.tex perfbook.out perfbook-1c.out
> -	rm -f perfbook-hb.out
> +	rm -f perfbook-hb.out perfbook-1c.tex perfbook-hb.tex
>  	rm -rf perfbook_html
>  	rm -f SMPdesign/DiningPhilosopher5.eps \
>  	      SMPdesign/DiningPhilosopher5TB.eps \
> -- 
> 1.9.1
> 

