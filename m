Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729493AbgHOWKb (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 15 Aug 2020 18:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597459756;
        bh=4y+TnuTviRj0ho+eo/CR3r7W2Xid9FSJMXIW6cJZNcU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Ldwv92h+Yps+0rteoDX0Mpe8oIRZgIzRHuY6ekM5uStRPB7pVF2SDvhI9qd7ZjnwX
         pdirFGoj5fhLvajtLslI9ThIR68QsglnKS2PiAhB41FZkCkpNAKXAd51aOjmtzCwKZ
         LofRBuMU8YANrJ4PUka0rhvBtY9Y9dWm0ueWBOjw=
Date: Fri, 14 Aug 2020 19:49:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Makefile: Prevent parallel runs of divideqqz.pl
Message-ID: <20200815024916.GW4295@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <791a999e-5eb4-4a02-f3da-65b9527fc810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791a999e-5eb4-4a02-f3da-65b9527fc810@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 15, 2020 at 07:58:00AM +0900, Akira Yokosawa wrote:
> >From 425dc57b802e1b9b2d5838da3408edbc827a6d62 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 15 Aug 2020 00:44:30 +0900
> Subject: [PATCH] Makefile: Prevent parallel runs of divideqqz.pl
> 
> Parallel make runs divideqqz.pl redundantly:
> 
>     $ make -j4
>     sh ./utilities/gen_snippet_d.sh
>     cp perfbook-lt.tex perfbook.tex
>     sh utilities/autodate.sh >autodate.tex
>     echo > qqz.tex
>     echo > contrib.tex
>     echo > origpub.tex
>     latexpand --empty-comments perfbook-lt.tex 1> perfbook_flat.tex 2> /dev/null
>     sh utilities/extractqqz.sh < perfbook_flat.tex | perl utilities/qqzreorder.pl > qqz.tex
>     sh utilities/extractorigpub.sh < perfbook_flat.tex > origpub.tex
>     cat perfbook_flat.tex qqz.tex | sh utilities/extractcontrib.sh > contrib.tex
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     utilities/divideqqz.pl
>     sh utilities/runfirstlatex.sh perfbook
>     ...
> 
> Racy runs of divideqqz.pl can cause corruption in qqz*.tex files.
> Fix this by using an empty target.
> 
> Fixes: 1716487bd983 ("Enhance qqz scheme for chapterwise QQZ answers")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
>  .gitignore |  1 +
>  Makefile   | 10 ++++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index a25a00b7..6d928c3c 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -25,6 +25,7 @@
>  *.synctex*
>  perfbook_flat.tex
>  qqz*.tex
> +sub_qqz
>  contrib.tex
>  origpub.tex
>  perfbook*.out
> diff --git a/Makefile b/Makefile
> index 3e0503d7..a3f98442 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -21,7 +21,10 @@ SUB_QQZ := qqzhowto.tex qqzintro.tex qqzcpu.tex qqztoolsoftrade.tex \
>  	qqzdefer.tex qqzdatastruct.tex qqzdebugging.tex qqzformal.tex \
>  	qqztogether.tex	qqzadvsync.tex qqzmemorder.tex qqzeasy.tex \
>  	qqzfuture.tex qqzquestions.tex qqztoyrcu.tex qqzwhymb.tex
> -LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex $(SUB_QQZ)
> +
> +LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex sub_qqz
> +# Note: Empty target "sub_qqz" is used on behalf of $(SUB_QQZ) to prevent
> +# parallel runs of divideqqz.pl.
>  
>  TWOCOLTARGETS := mstx msr msn msnt sf qq nq
>  ABBREVTARGETS := lt hb a4 1c tcb msns mss $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
> @@ -250,8 +253,10 @@ contrib.tex: perfbook_flat.tex qqz.tex
>  origpub.tex: perfbook_flat.tex
>  	sh utilities/extractorigpub.sh < $< > $@
>  
> -$(SUB_QQZ): qqz.tex
> +# Empty target to generate $(SUB_QQZ) files
> +sub_qqz: qqz.tex
>  	utilities/divideqqz.pl
> +	@touch sub_qqz
>  
>  perfbook.tex: $(PERFBOOK_BASE)
>  	cp $< $@
> @@ -502,6 +507,7 @@ clean:
>  		-o -name '*.pdfp' -o -name '*.pdfq' | xargs rm -f
>  	rm -f perfbook_flat.tex perfbook*.out $(GENERATED_MAIN)
>  	rm -f $(LATEXGENERATED)
> +	rm -f qqz*.tex
>  	rm -f CodeSamples/snippets.d
>  	rm -f *.synctex*
>  	@rm -f $(OBSOLETE_FILES)
> -- 
> 2.17.1
> 
