Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiIVQt3 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 22 Sep 2022 12:49:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33F3E9CE9
        for <perfbook@vger.kernel.org>; Thu, 22 Sep 2022 09:49:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8208361174
        for <perfbook@vger.kernel.org>; Thu, 22 Sep 2022 16:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663865366;
        bh=+/+6Pw1zohW3Fkqq9RjhQnOI/LrVrlZIg+hJKMgwNI0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=a9CNX7dySeR6TErenDKWK/C44OgAMmfLXXLcN+hpqK4Jz0AQqdGWL/4fohLg+AsGO
         EsBp3B34rWjIg7dRT2k1rPF47cEIzhK5/0ypRCZaZ/JDR4MbUF8QfQgmq3ALX+Og/l
         WpOyOF/4KedR5feOf0d9jS8Po5UfUfrq89H+pwnuN2sumt4j1GxeCYJiugURlrD8ze
         576rR3yWrTfMnR2RfQNM4gjURGAliFeRfOoRx6/lToEIEgbE0m9Lxu+cxqfoRzCxYJ
         adpU364OK+BfM7IRJ2RSWB/CZZQh6gjvNQs9cbMpD9kxVl2JLjSWDp62bz884C/3ba
         lThKywsdgI/TA==
Date: Thu, 22 Sep 2022 09:49:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Cope with Ghostscript 10.00.0 and later
Message-ID: <20220922164926.GK4196@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <9b1809dc-a03c-e239-494b-89207ecaa4aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b1809dc-a03c-e239-494b-89207ecaa4aa@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Sep 22, 2022 at 11:45:00PM +0900, Akira Yokosawa wrote:
> Ghostscript 10.00.0 has graduated from its RC stages recently [1].
> Expand regular expressions for detecting modern versions of
> Ghostscript.
> 
> Link: [1]: https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/tag/gs1000
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi,
> 
> Despite the increment of major version to 10, there seems to be no
> outstanding backward-incompatible changes like the early days of
> 9.5x releases.
> 
> One notable change mentioned in the release note is the switch of
> the default PDF interpreter to the brand new implementation in the
> C language (appeared in 9.56) from the one written in PostScript.
> 
> If we encounter any behavior change, we are supposed to file a
> bug report :-)
> 
> Ubuntu's and Fedora's distro packages will wait the upgrade
> until next spring, I guess, but who knows.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks Akira
> --
>  a2ping-rule.mk   | 4 ++--
>  epstopdf-rule.mk | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/a2ping-rule.mk b/a2ping-rule.mk
> index 5260ec92e7f2..6db633deed24 100644
> --- a/a2ping-rule.mk
> +++ b/a2ping-rule.mk
> @@ -7,10 +7,10 @@
>  A2PING := $(shell which a2ping 2>/dev/null)
>  
>  ifdef A2PING
> -  GS_950_OR_LATER := $(shell gs --version | grep -c -E "9\.[5-9].?")
> +  GS_950_OR_LATER := $(shell gs --version | grep -c -E "^(9\.[5-9]|10\.[0-9]).?")
>    A2PING_277P := $(shell a2ping --help 2>&1 | grep -c "2.77p,")
>    A2PING_283P := $(shell a2ping --help 2>&1 | grep -c "2.83p,")
> -  GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
> +  GS_953_OR_LATER := $(shell gs --version | grep -c -E "^(9\.5[3-9]|10\.[0-9]).?")
>    ifeq ($(A2PING_277P),1)
>      A2PING_GSCNFL = 1
>    else
> diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
> index d248ce750d68..e33e476c2c74 100644
> --- a/epstopdf-rule.mk
> +++ b/epstopdf-rule.mk
> @@ -5,7 +5,7 @@
>  # Authors: Akira Yokosawa <akiyks@gmail.com>
>  
>  EPSTOPDF := $(shell which epstopdf 2>/dev/null)
> -GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
> +GS_953_OR_LATER := $(shell gs --version | grep -c -E "^(9\.5[3-9]|10\.[0-9]).?")
>  GS_OPT=--gsopt=-dPDFSETTINGS=/ebook
>  
>  $(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): $(FIXFONTS)
> 
> base-commit: 36e0babae953969d16bc5254b79412bc873cf8c0
> -- 
> 2.25.1
> 
