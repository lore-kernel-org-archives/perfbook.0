Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727567AbgBOALz (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 14 Feb 2020 19:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581725514;
        bh=xMmpzzcbQLP4uarfmijxf1JrajTtSEWC7mg1bC5kUHA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=hEdnLjdclfnmKlnvG588I4BChDjpGC7TxcIizpTJWmeuxczluYagdPf00dFAwmlwP
         LyTs8FdhA0jGy3dA+z+E/PYqtjbpPjHDvGuSOcj4GR7LLXQcsXCYKwTuNaGGtMmXgm
         I67Ym0jcnsEmemX64g31V25zrElVqGJw1AMKdN+0=
Date: Fri, 14 Feb 2020 16:11:52 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] Makefile: Add check of \crefrange and \clnrefrange
 misuse
Message-ID: <20200215001152.GU2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <d124a04e-8933-69c6-34b1-86057ff5567a@gmail.com>
 <74810782-6250-d9fb-1243-4e1183851517@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74810782-6250-d9fb-1243-4e1183851517@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Feb 15, 2020 at 08:49:26AM +0900, Akira Yokosawa wrote:
> >From f445ac887a125bbff303b80921f981ea0704c748 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 15 Feb 2020 08:36:53 +0900
> Subject: [PATCH v2] Makefile: Add check of \crefrange and \clnrefrange misuse
> 
> To prevent typos simillar to the one fixed in commit b3b06a98bb7c
> ("datastruct.tex: fix some minor typos") to happen again,
> add checks to detect the following patterns of misuses:
> 
> ... \cref{label A}{label B} ...
> 
> ... \cref{long label X}
> {another long label Y}
> 
> In the formar case, counts of violating lines are presented in
> the error message.
> In the latter case, only the file name can be presented due
> to the "-zo" option to enable multi-line pattern search.
> 
> Note: There can be false negatives in the check.
> For example, it can't not detect:
> 
> ... \cref{label E}% some comment
> {label F}
> 
> , at the moment.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> This one uses a regex to cover both \cref and \clnref pattern.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
>  Makefile | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index ccc840be..7d1ec630 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -131,6 +131,9 @@ LINEREF_ENV_END     := $(shell grep -l -F '\end{lineref}'     $(LATEXSOURCES))
>  LINELABEL_ENV := $(sort $(LINELABEL_ENV_BEGIN) $(LINELABEL_ENV_END))
>  LINEREF_ENV   := $(sort $(LINEREF_ENV_BEGIN) $(LINEREF_ENV_END))
>  
> +CREFPTN    := '\\[Cc](ln)?ref{[^{]+}\s*{[^}]+}'
> +CREFPAIR   := $(shell grep -l -zo -E $(CREFPTN)   $(LATEXSOURCES))
> +
>  SOURCES_OF_SNIPPET_ALL := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
>  SOURCES_OF_LITMUS      := $(shell grep -r -l -F '\begin[snippet]' CodeSamples)
>  SOURCES_OF_LTMS        := $(patsubst %.litmus,%.ltms,$(SOURCES_OF_LITMUS))
> @@ -202,6 +205,18 @@ endif
>  		echo "Substitute 'fcvref' for 'lineref' in $(LINEREF_ENV)." ; \
>  		exit 1 ; \
>  	fi
> +	@if [ ! -z "$(CREFPAIR)" -a "$(CREFPAIR)" != " " ]; then \
> +		echo "------" ; \
> +		if grep -q -E $(CREFPTN) $(CREFPAIR) ; then \
> +			grep -n -B 2 -A 2 -E $(CREFPTN) $(CREFPAIR) ; \
> +		else \
> +			grep -zo -B 2 -A 2 -E $(CREFPTN) $(CREFPAIR) ; \
> +			echo ; \
> +		fi ; \
> +		echo "------" ; \
> +		echo "Need to use \[Cc]refrange or \[Cc]lnrefrangein $(CREFPAIR)." ; \
> +		exit 1 ; \
> +	fi
>  	echo > qqz.tex
>  	echo > contrib.tex
>  	echo > origpub.tex
> -- 
> 2.17.1
> 
> 
