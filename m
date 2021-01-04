Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727300AbhADApe (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 3 Jan 2021 19:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609721093;
        bh=hxfZZXzh7ti7rai5j40AfDlHZ1caVnVTVZFTDYRcqWk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=kwgQn2ENDTrEhNATp6zy6StcMAHWQAgKD99F/62xnPAVnTKqA4JjalonPrMT3RVTs
         Wz1od+ucUCeDq7xPViKcBJCaD4E0zn48Nbmdb8E3NfC9J79HNY5RjuLml6aqLsAFCS
         f8fzpshBnsl9fPw/DLbbi9NXacZshBnwEo+ZA7elMdy748k0B21JutA9bS8bzmpMPl
         w9orKXUkPh1Pd72xefh1I8bpFnWudOICyv/26uTTMdTwzmrEPHm1zm0AVQvmbaHTT3
         j1N6ubea6Nhxx1qMY8DY8GhwcneheDroaGZKc1AZMt7hOaVydqc11M5zSIdBlaEAis
         iPd77EmQnQUMA==
Date: Sun, 3 Jan 2021 16:44:53 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2 -perfbook] Makefile: Cope with GhostScript 9.53.0 or
 later
Message-ID: <20210104004453.GH12032@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <29de25dd-09e4-cd0b-a743-6e5a7c8dfb36@gmail.com>
 <4f0c7f49-474d-01e7-fa73-673d5f146633@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f0c7f49-474d-01e7-fa73-673d5f146633@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: =?utf-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>, Felipe Balbi <balbi@kernel.org>, perfbook@vger.kernel.org

On Mon, Jan 04, 2021 at 08:38:35AM +0900, Akira Yokosawa wrote:
> From d48155e896265c1a26985fe26f9bf8c5fbcfd22e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 4 Jan 2021 07:58:18 +0900
> Subject: [PATCH v2 -perfbook] Makefile: Cope with GhostScript 9.53.0 or later
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Combination of GhostScript 9.53.x and pstricks-base 3.01 requires
> an additional option of "gs" to enable transparency.
> 
> Current version of a2ping can not cope with this change.
> 
> Instead, use the pair of commands "ps2pdf" and "pdfcrop" for .eps
> files originated from .tex sources if a new version of gs is detected.
> 
> Note:
> Due to the use of a deprecated command in pstricks.pro (boilerplate
> prologue code), gs 9.53.x emits repetitive warnings of:
> 
>    **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be removed in a future release
>    **** See .setfillconstantalpha/.setalphaisshape for the improved solution
> 
> I'll silence them once I'm sure the stability of new commands in
> Makefile.
> 
> Reported-by: Дмитрий Дьяченко <dimhen@gmail.com>
> Reported-by: Felipe Balbi <balbi@kernel.org>
> Tested-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi,
> 
> I thought I didn't redirect the warnings at all, but pdfcrop's stderr
> was redirected in v1.
> I removed the redirection in v2.
> 
> Changes v1 -> v2:
>   o Add Felipe's Tested-by
>   o Mention warnings from gs in commit log's note.
>   o Remove ineffective redirection at the end of pipeline.

Works for me!  Queued, and thank you all!

							Thanx, Paul

>         Thanks, Akira
> --
> Makefile | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 56ce62bf..0c58f1a0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -38,6 +38,8 @@ EPSSOURCES_FROM_TEX := \
>  	SMPdesign/DiningPhilosopher4part-b.eps \
>  	SMPdesign/DiningPhilosopher5PEM.eps
>  
> +PDFTARGETS_OF_TEX := $(EPSSOURCES_FROM_TEX:%.eps=%.pdf)
> +
>  DOTSOURCES := $(wildcard */*.dot)
>  
>  EPSSOURCES_FROM_DOT := $(DOTSOURCES:%.dot=%.eps)
> @@ -70,7 +72,7 @@ EPSORIGIN := $(filter-out $(EPSSOURCES_FROM_TEX) $(EPSSOURCES_FROM_DOT) $(EPSSOU
>  
>  PDFTARGETS_OF_EPSORIG := $(EPSORIGIN:%.eps=%.pdf)
>  
> -PDFTARGETS_OF_EPSOTHER := $(filter-out $(PDFTARGETS_OF_EPSORIG),$(PDFTARGETS_OF_EPS))
> +PDFTARGETS_OF_EPSOTHER := $(filter-out $(PDFTARGETS_OF_EPSORIG) $(PDFTARGETS_OF_TEX),$(PDFTARGETS_OF_EPS))
>  
>  BIBSOURCES := bib/*.bib alphapf.bst
>  
> @@ -124,19 +126,23 @@ ifdef A2PING
>    GS_950_OR_LATER := $(shell gs --version | grep -c -E "9\.[5-9].?")
>    A2PING_277P := $(shell a2ping --help 2>&1 | grep -c "2.77p,")
>    A2PING_283P := $(shell a2ping --help 2>&1 | grep -c "2.83p,")
> +  GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
>    ifeq ($(A2PING_277P),1)
> -    A2PING_GSCNFL := 1
> +    A2PING_GSCNFL = 1
>    else
>      ifeq ($(A2PING_283P),1)
>        ifeq ($(GS_950_OR_LATER),1)
> -        A2PING_GSCNFL := 1
> +        A2PING_GSCNFL = 1
>        else
> -        A2PING_GSCNFL := 0
> +        A2PING_GSCNFL = 0
>        endif
>      else
> -      A2PING_GSCNFL := 0
> +      A2PING_GSCNFL = 0
>      endif
>    endif
> +  ifeq ($(GS_953_OR_LATER),1)
> +    A2PING_GSCNFL = 2
> +  endif
>  endif
>  
>  LINELABEL_ENV_BEGIN := $(shell grep -l -F '\begin{linelabel}' $(LATEXSOURCES))
> @@ -395,6 +401,20 @@ endif
>  	@a2ping --below --hires --bboxfrom=compute-gs $<i $@ > /dev/null 2>&1
>  	@rm -f $<i
>  
> +$(PDFTARGETS_OF_TEX): %.pdf: %.eps
> +	@echo "$< --> $@"
> +ifndef A2PING
> +	$(error $< --> $@: a2ping not found. Please install it)
> +endif
> +ifeq ($(A2PING_GSCNFL),1)
> +	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
> +endif
> +ifeq ($(A2PING_GSCNFL),2)
> +	@ps2pdf -dALLOWPSTRANSPARENCY -dNOSAFER $< - | pdfcrop -hires - $@
> +else
> +	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1
> +endif
> +
>  $(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
>  	@echo "$< --> $@"
>  ifndef A2PING
> -- 
> 2.17.1
> 
> 
> 
