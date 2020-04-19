Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgDSQ2P (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 19 Apr 2020 12:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587313695;
        bh=hfBznm3zKA/BrBzxE36Uy8ke1SuS2wOXkqfY/pUIFlQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=aoKAYVeCycarfoYPI2B6X/IOJ93mRcH6YUwuEFjbsdm3s41+2KLPsll4+4kBIFUnj
         2eZrtQq9pC8Y8miy/N3hUG+HIhhasqCY14GvHhK4CJcsprzjzi7hC3Oecgpyz8tj7V
         pV5vDWdQQUJM7ZU6S6s3uFPR+Hsl/NfIblTA5atg=
Date: Sun, 19 Apr 2020 09:28:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Update output option for Inkscape 1.0
Message-ID: <20200419162814.GV17661@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <f6427c58-7766-aabd-4b0c-49c71e19c3ed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6427c58-7766-aabd-4b0c-49c71e19c3ed@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 20, 2020 at 12:17:53AM +0900, Akira Yokosawa wrote:
> >From 07acec1a052399df5e38773111ab9bcf4153e826 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 19 Apr 2020 23:43:09 +0900
> Subject: [PATCH] Update output option for Inkscape 1.0
> 
> Inkscape 1.0-rc1 now undergoing public test has renamed the option
> "--export-file=" to "--export-filename=".
> 
> This change is not reflected in the wiki page at [1] yet.
> 
> "inkscape --help" says that the short option "-o output_file" is
> common to beta and rc1 versions. So this commit uses the short option
> instead.  Also redirect pango version emitted to stderr by
> rc1's "inkscape --version".
> 
> [1]: https://wiki.inkscape.org/wiki/index.php?title=Using_the_Command_Line#Deprecations_and_Replacements
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e24c5729..5fb252eb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -69,7 +69,7 @@ FIG2EPS := $(shell which fig2eps 2>/dev/null)
>  A2PING := $(shell which a2ping 2>/dev/null)
>  INKSCAPE := $(shell which inkscape 2>/dev/null)
>  ifdef INKSCAPE
> -  INKSCAPE_ONE := $(shell inkscape --version | grep -c "Inkscape 1")
> +  INKSCAPE_ONE := $(shell inkscape --version 2>/dev/null | grep -c "Inkscape 1")
>  endif
>  LATEXPAND := $(shell which latexpand 2>/dev/null)
>  QPDF := $(shell which qpdf 2>/dev/null)
> @@ -402,7 +402,7 @@ endif
>  ifeq ($(INKSCAPE_ONE),0)
>  	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
>  else
> -	@inkscape --export-file=$@ $<i > /dev/null 2>&1
> +	@inkscape -o $@ $<i > /dev/null 2>&1
>  endif
>  	@rm -f $<i
>  ifeq ($(chkpagegroup),on)
> -- 
> 2.17.1
> 
