Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbjJMXnu (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 13 Oct 2023 19:43:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16950CA
        for <perfbook@vger.kernel.org>; Fri, 13 Oct 2023 16:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697240628;
        bh=XN6ioG/7RPenREscjKrlBNubpAlc4NH+mJgT6VN2SjE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=jRFIGFbSVBNkyzesHarvu7i0UNN6tllx0TVJe+MFg5BjLNwJC1jkcqYo4W+kCxw5L
         GuIcODHiU6HCDGwT7wVbdNbY+ctO4rz80XUXdV83IctVGycTFeB0CUx1oDlgFYWdd+
         wjzE4yWquF+Xhh57F3xbX1k4d/u99vzkcaokPLG2j3cvGY/bemcnBenBj9/+Ojwi/B
         6ago6A/U//t+3I6SDZfYz/d2D8wUFBlIObi5cgYoNKQmVSRxamDE0kG4msUtTZZHVd
         723IxL13CvnvUAVXOFu45C7bgtk3Q2E5dgwc6mVsIcIhaUjTfJzWqfWHOM58npiOds
         V9X69g5SaEozQ==
Date: Fri, 13 Oct 2023 16:43:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/3] Work around errors of unstable Inkscape
Message-ID: <f832504c-3c69-451d-9ca7-4c6ecff11385@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 13, 2023 at 11:33:18PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I expected the crashing bug in Fedora's distro Inkscape would be
> resolved by the time of Fedora 39 release.
> I tested Fedora 39 beta and was disappointed to see more or less the
> same crashes of command-line runs of Inkscape as those under Fedora 38.
> 
> As a matter of fact, even when Inkscape crashes, the export of PDF
> is complete most of the time.  So the crashing bug can be worked
> around by ignoring the error code from Inkscape and continue building.
> 
> This patch set implements the ad-hoc workaround in build scripts.
> 
> As you can see in Patch 1/3, the workaround is enabled by default.
> This is because enabling it won't do any harm on systems with
> stable Inkscape.
> 
> I might be able to add some heuristics not to enable the workaround
> for stable Inkscape installs, but that can wait.
> 
> Ubuntu releases 22.04LTS, 23.04, and 23.10 are free of this issue.

Ouch!

But look like a good approach.  Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   Ignore error of unstable Inkscape
>   Ignore emergency-save SVG files from Inkscape
>   Make sure all PDF conversions are complete
> 
>  .gitignore |  1 +
>  Makefile   | 17 ++++++++++++++---
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 84759ebac65a03aa28c5b02007e6c472b3416d3d
> -- 
> 2.25.1
> 
