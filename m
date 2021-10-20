Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhJTBF0 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 19 Oct 2021 21:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634691793;
        bh=ajkS3mqQA/Linbs3F+JzKnYgNoD2MD3pKXbwny5tz0Y=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=fTEQ51JCIMYreIW9AVxtYDnxtjkEJzeAORGljk+AbQoJ+uGs8XJpi/0Tg5/Gd6go3
         0AHdExQ5BKXILraSWmML9G8e6OcGWoqEtx0P7nzUMbzMt/IWTGu2DJKmTx3ZRTKtFm
         GNjXe8DtuxaQHGw0G1d6XLF5y2+Z48H6Q8typGtsIfSnmMDGWwO0OnbJtI2H+ZK4KD
         V8s2ztVpOeM+ZiPsIjfNoIqUbdfdyEqKxlpwiJjT+5KyROSxfxeC2Agea1mx69MIqr
         dzCnLH/LMs9JonScVoAoHDwh8zo8nEMTSi+YPJOtIbDVjOuygDGdxyA2iBfIpsviD+
         hK5oasoOrue7Q==
Date: Tue, 19 Oct 2021 18:03:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Makefile: Add dependencies to font-conversion
 scripts
Message-ID: <20211020010312.GI880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <4e8b3e73-5024-8e6a-913a-c1deffe05dd4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e8b3e73-5024-8e6a-913a-c1deffe05dd4@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Oct 20, 2021 at 09:04:55AM +0900, Akira Yokosawa wrote:
> One might miss the rebuild of .pdf files when a font-conversion
> script is updated.
> 
> Automate the rebuild by writing down such dependencies as make rules.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  Makefile         | 4 ++++
>  a2ping-rule.mk   | 1 +
>  epstopdf-rule.mk | 1 +
>  3 files changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 0702fdb7..6ee849fd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -393,6 +393,7 @@ perfbook-a4.tex:
>  
>  # Rules related to perfbook_html are removed as of May, 2016
>  
> +$(EPSSOURCES_FROM_TEX): $(FIXANEPSFONTS) $(FIXFONTS)
>  $(EPSSOURCES_FROM_TEX): %.eps: %.tex
>  	@echo "$< --> $(suffix $@)"
>  	sh utilities/mpostcheck.sh
> @@ -400,6 +401,7 @@ $(EPSSOURCES_FROM_TEX): %.eps: %.tex
>  	@dvips -Pdownload35 -E $(patsubst %.tex,%.dvi,$<) -o $@ > /dev/null 2>&1
>  	@sh $(FIXANEPSFONTS) $@
>  
> +$(EPSSOURCES_FROM_DOT): $(FIXANEPSFONTS) $(FIXFONTS)
>  $(EPSSOURCES_FROM_DOT): %.eps: %.dot
>  	@echo "$< --> $(suffix $@)"
>  ifndef DOT
> @@ -408,6 +410,7 @@ endif
>  	@dot -Tps -o $@ $<
>  	@sh $(FIXANEPSFONTS) $@
>  
> +$(EPSSOURCES_FROM_FIG): $(FIXANEPSFONTS) $(FIXFONTS)
>  $(EPSSOURCES_FROM_FIG): %.eps: %.fig
>  	@echo "$< --> $(suffix $@)"
>  ifndef FIG2EPS
> @@ -423,6 +426,7 @@ else
>    include epstopdf-rule.mk
>  endif
>  
> +$(PDFTARGETS_OF_SVG): $(FIXSVGFONTS)
>  $(PDFTARGETS_OF_SVG): %.pdf: %.svg
>  	@echo "$< --> $(suffix $@)"
>  ifeq ($(STEELFONT),0)
> diff --git a/a2ping-rule.mk b/a2ping-rule.mk
> index 2a312560..5260ec92 100644
> --- a/a2ping-rule.mk
> +++ b/a2ping-rule.mk
> @@ -29,6 +29,7 @@ ifdef A2PING
>    endif
>  endif
>  
> +$(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): $(FIXANEPSFONTS) $(FIXFONTS)
>  $(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): %.pdf: %.eps
>  	@echo "$< --> $(suffix $@) (by a2ping)"
>  ifndef A2PING
> diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
> index 8e824fbe..4efad17a 100644
> --- a/epstopdf-rule.mk
> +++ b/epstopdf-rule.mk
> @@ -8,6 +8,7 @@ EPSTOPDF := $(shell which epstopdf 2>/dev/null)
>  GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
>  GS_OPT=--gsopt=-dPDFSETTINGS=/ebook
>  
> +$(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): $(FIXFONTS)
>  $(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): %.pdf: %.eps
>  	@echo "$< --> $(suffix $@)"
>  ifndef EPSTOPDF
> 
> base-commit: 25705d5d0328cabdc48af567b253f73e027928a1
> -- 
> 2.17.1
> 
