Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbjGGQva (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 7 Jul 2023 12:51:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E782726A4
        for <perfbook@vger.kernel.org>; Fri,  7 Jul 2023 09:51:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38440612D3
        for <perfbook@vger.kernel.org>; Fri,  7 Jul 2023 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688748680;
        bh=KivpOymAo9iug+qO+0TtKsVvpd/8YJIcEbF6y1alydI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=eSfaegVhz9LHt3CA1ogXvBy5ptuZ/lC0ZDku8KpApsVXOOwhuXfUy7hDt4EsTBXGc
         GbK1Tp/7uqBcvNeBoeTCHZEYQRQ/jobXJVY1K6u16u/m9wmIRN0mCOivTvCEXJxJ4f
         /fO/Iwyqut2HmJfmZCPyLW5yZOizwTe1X2VKo+mYi4yTwBEClHpYG1CeCgDHrdDrdb
         tjIJs6pfV89ACfz5VuRV1/lm23QapWwCSAbp4Wos3lWBYbJ0bANP3t+WLsyVjNT6uB
         6Asj5UXfUZg06MaHwZG/uW63XP6F6G2tgGctEXjbSa04JZjDHtqSr1HY/ciIzwTiWj
         cRiyBngvPpmrw==
Date: Fri, 7 Jul 2023 09:51:20 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/7] Update preamble and build scripts
Message-ID: <bfa018bc-35c8-4a4b-9b1e-fbc15455ba23@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 07, 2023 at 09:03:09PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set has two goals.
> 
> 1. Get rid of warnings in .log files as much as possible.
> 
> 2. Improve messages printed when fatal/major errors/warnings are
>    found in .log files.
> 
> Patches 1/7 -- 4/7 take care of warning messages by updating commands/
> options in the preamble.
> 
> Patch 1/7 removes twocolumn option from \documentclass{} which became
> redundant when the geometry package was employed for page layout
> settings, especially since commit dad8d409e0b1 ("Delegate geometry
> settings to 'geometry' package"). To keep the sloppy behavior for
> 2c layout, an explicit \sloppy is added. On the other hand, 1c layouts
> permit occasional horizontal overfulls now.
> 
> Patch 2/7 suppresses a warning on title page in ebook-size builds.
> 
> Patch 3/7 improves the definition of \ebresizeverb, which is used
> for resizing tall code snippets for ebook-size builds.  In commit
> 63c1b9f80996 ("perfbook-lt: Add macros to shrink floats for ebook"),
> I used varwidth inside lrbox. It turns out that varwidth causes
> a lot of "Failed to reprocess entire contents on input line xxx."
> warnings. Using plain minipage there is the right thing to do.
> 
> Patch 4/7 takes care of font warnings with regard to a missing font
> shape in sf (sans-serif) builds.  For sans-serif font family, using
> italic shape as a fallback to slanted shape is reasonable. To suppress
> those warnings, use a package named "silence" and register that
> particular message pattern to be filtered out.
> 
> Patch 5/7 improves build scripts. When there is a missing package,
> current runfirstlatex.sh fails to print the name of missing package.
> This is due to the fatal error condition is tested before those for
> emitting pin-point logs.
> 
> Reorder the tests so that the fatal condition is tested as late as
> possible.
> 
> Patch 6/7 is an obvious typo fix.
> 
> Patch 7/7 reflects the recent change of TeX Live requirement.

Very nice!!!

Queued and pushed, thank you!!!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (7):
>   Get rid of 'twocolumn' option in \documentclass
>   Prevent warning of duplicate page identifier in Ebook-size builds
>   Use minipage environment in \ebresizeverb
>   Silence font warning in sf (sans serif) builds
>   run{first}latex.sh: Reorder checks of fatal error/warning messages
>   runlatex.sh: Fix typo (exerpt -> excerpt)
>   runlatex.sh: Amend message on out-of-date cleveref
> 
>  .gitignore                 |  1 +
>  Makefile                   |  1 +
>  perfbook-lt.tex            | 26 ++++++++++++++++----------
>  utilities/runfirstlatex.sh | 34 +++++++++++++++++++++-------------
>  utilities/runlatex.sh      | 28 +++++++++++-----------------
>  5 files changed, 50 insertions(+), 40 deletions(-)
> 
> 
> base-commit: f78aed35958ba9e0e90df68574be2c7cc40c1396
> -- 
> 2.25.1
> 
