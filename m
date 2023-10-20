Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjJTRhl (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 20 Oct 2023 13:37:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E4C124
        for <perfbook@vger.kernel.org>; Fri, 20 Oct 2023 10:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697823459;
        bh=00p1XtsfT33R0vFvKVFj1DTRNcSMy97Zkx4y7OqRQRY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rMiDgUqT7yaSl228zDMs7tjI8E7MSazw7ZiD8l/O6lm36G6CULISkF4KmbT8DdqLK
         WQ+6HnjvFux97Y5nSHlO8BtcFZ85mNV4D2l3N7GNIcwTQ3p1/HqViBc7MTDUpR0Wj9
         R/GFQEeCtzU/E45+l7OsrqiNIiKSr9e66945KCBDYuxiPbFyHbEHxJH2DkpYSDoQ7b
         /Pz3bHziGNDH+tqfkS4Z5oE+SVPOB+YeKWl2zhD6BWT3Ytyw2X8DyZmRXpSEhbBck+
         5FcEQLsIgnLhXwFUL2y3s/KYENUZVRo85T0iwxr65jrRwzFKVxFw7L5Pz5ZMT/jlik
         xkoOEbV5oviYQ==
Date: Fri, 20 Oct 2023 10:37:38 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Prevent inkscape from interacting with desktop
 manager
Message-ID: <071a156b-a8c3-4665-9e78-359b9f421edc@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f3621f4d-17b8-4c36-8d92-f8f031fe1281@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3621f4d-17b8-4c36-8d92-f8f031fe1281@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 20, 2023 at 06:29:32PM +0900, Akira Yokosawa wrote:
> Crashes of command-line Inkscape happens when it exits too soon
> before it can be properly removed from window manager's list of
> applications it is aware of.
> Glib 2.75.3 has removed GSlice allocator [1], which was permissive
> about UAF issues.
> 
> Question is, "why is the command-line Inkscape registered in
> such a list in the first place?"
> 
> There is mention of an option named "--without-gui" in Inkscape's
> wiki page on "Using the Command Line" [2]:
> 
>     The --without-gui option has been removed. Most parameters
>     trigger Inkscape to run without GUI by default now. Instead
>     enable GUI mode specifically using --with-gui if needed.
> 
> However, current Inkscape does *initialize* itself as a GUI
> application regardless of the need of GUI.
> 
> Alternatively, Inkscape can be forced to run isolated from window/
> desktop managers with bogus strings set to a couple of env variables.
> 
> After some tries and errors, these two env variables turned out
> to be essential here:
> 
>     - XDG_RUNTIME_DIR
>     - DBUS_SESSION_BUS_ADDRESS
> 
> Update Makefile and set bogus strings to them, which sounds a little
> rough but should be better than ignoring error codes, after reverting
> commits:
> 
>     - c2f9a99366b3 ("Ignore error of unstable Inkscape")
>     - a01629a5f734 ("Make sure all PDF conversions are complete")
> 
> This change resolves crashes of Inkscape observed under Fedora 38,
> Fedora 39 beta, Ubuntu 23.04, and openSUSE tumbleweed.
> 
> [1]: https://gitlab.gnome.org/GNOME/glib/-/issues/1079
> [2]: https://wiki.inkscape.org/wiki/index.php/Using_the_Command_Line
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

This issue is a bit annoying, isn't it?  Thank you for persisting
with it!  I have queued and pushed this patch.

							Thanx, Paul

> ---
>  Makefile | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 3875c52b..424a166c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -111,7 +111,6 @@ INKSCAPE := $(shell $(WHICH) inkscape 2>/dev/null)
>  ifdef INKSCAPE
>    INKSCAPE_ONE := $(shell inkscape --version 2>/dev/null | grep -c "Inkscape 1")
>  endif
> -IGNORE_INKSCAPE_ERROR ?= 1
>  LATEXPAND := $(shell $(WHICH) latexpand 2>/dev/null)
>  QPDF := $(shell $(WHICH) qpdf 2>/dev/null)
>  
> @@ -267,10 +266,6 @@ endif
>  autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(LST_SOURCES) \
>      $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
>       $(GITREFSTAGS) utilities/autodate.sh
> -ifneq ($(IGNORE_INKSCAPE_ERROR),0)
> -	# Make sure all SVG --> PDF conversions are complete
> -	$(MAKE) -j1 figs
> -endif
>  	sh utilities/autodate.sh
>  
>  perfbook_flat.tex: autodate.tex
> @@ -455,6 +450,9 @@ else
>    include epstopdf-rule.mk
>  endif
>  
> +# bogus settings for preventing Inkscape from interacting with desktop manager
> +ISOLATE_INKSCAPE ?= XDG_RUNTIME_DIR=na DBUS_SESSION_BUS_ADDRESS=na
> +
>  $(PDFTARGETS_OF_SVG): $(FIXSVGFONTS)
>  $(PDFTARGETS_OF_SVG): %.pdf: %.svg
>  	@echo "$< --> $(suffix $@)"
> @@ -488,11 +486,7 @@ endif
>  ifeq ($(INKSCAPE_ONE),0)
>  	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
>  else
> -  ifneq ($(IGNORE_INKSCAPE_ERROR),0)
> -	-@inkscape -o $@ $<i > /dev/null 2>&1
> -  else
> -	@inkscape -o $@ $<i > /dev/null 2>&1
> -  endif
> +	@$(ISOLATE_INKSCAPE) inkscape -o $@ $<i > /dev/null 2>&1
>  endif
>  	@rm -f $<i
>  ifeq ($(chkpagegroup),on)
> 
> base-commit: 0ecdabe67aae15f616e4a6ffeda8c4f76ff385ae
> -- 
> 2.34.1
> 
