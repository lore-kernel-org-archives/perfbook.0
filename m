Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732146AbgDAQHC (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 1 Apr 2020 12:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585757221;
        bh=7IcA/XSiJ6g67Gr/W5NESxF3m7TDJgVt+L9aOi+SqVo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Z7ZM8oDI9cu6mngOid/xlEVJbvKB4St81UMsXIVwbbZej3hjQIiPjb25061WR1P8m
         8t2tC5kp7/u0yjxHjIrvqPkvVSdHjAVU/IAjmNHYGwBeM/0A+kmKwpkTj3OTgxbkI+
         dxne8NK6NINnV0XrWwsLkxxbyMll94vv/D7QnWgM=
Date: Wed, 1 Apr 2020 09:07:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Makefile: Keep perfbook-lt.tex in 'make clean'
Message-ID: <20200401160701.GY19865@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <f1ffa8ee-6fc3-141d-e9c3-8230d5037f44@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1ffa8ee-6fc3-141d-e9c3-8230d5037f44@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 02, 2020 at 12:14:50AM +0900, Akira Yokosawa wrote:
> >From a6bd9bf5fa162e8b2c271e51163da3f2f27ac8c1 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 2 Apr 2020 00:04:56 +0900
> Subject: [PATCH] Makefile: Keep perfbook-lt.tex in 'make clean'
> 
> Commit 39cb8ba9cf56 ("Let paper size be orthogonal to 1c/2c layout
> variations") changed the base of main .tex file from perfbook.tex to
> perfbook-lt.tex.
> However, the recipe of "clean" was not updated and it removes
> perfbook-lt.tex rather than perfbook.tex.
> 
> Fix this by using a new variable GENERATED_MAIN in "clean".
> 
> Fixes: 39cb8ba9cf56 ("Let paper size be orthogonal to 1c/2c layout variations")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you, Akira!

							Thanx, Paul

> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index a2786b1b..e24c5729 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -22,6 +22,7 @@ TWOCOLTARGETS := mstx msr msn msnt sf qq nq
>  ABBREVTARGETS := lt hb a4 1c tcb msns mss $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
>  
>  PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)
> +GENERATED_MAIN := $(filter-out perfbook-lt.tex,$(foreach v,$(ABBREVTARGETS),perfbook-$(v).tex)) perfbook.tex
>  
>  EPSSOURCES_FROM_TEX := \
>  	SMPdesign/DiningPhilosopher5.eps \
> @@ -490,7 +491,7 @@ clean:
>  		-o -name '*.dvi' -o -name '*.log' \
>  		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' \
>  		-o -name '*.pdfp' -o -name '*.pdfq' | xargs rm -f
> -	rm -f perfbook_flat.tex perfbook*.out perfbook-*.tex
> +	rm -f perfbook_flat.tex perfbook*.out $(GENERATED_MAIN)
>  	rm -f $(LATEXGENERATED)
>  	rm -f CodeSamples/snippets.d
>  	rm -f *.synctex*
> -- 
> 2.17.1
> 
