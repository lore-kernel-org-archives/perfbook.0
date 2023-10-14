Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233326AbjJNX5X (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 14 Oct 2023 19:57:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE72DDA
        for <perfbook@vger.kernel.org>; Sat, 14 Oct 2023 16:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697327841;
        bh=MpOPIUs1pPARK7cBlV5DaOkDExM9CMUbHngHT+I5nlY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=mUnKyy4M/caY0YtAtjgLlV8vzrM9ZSujkr8aAjGmyVW0Q88ej0KMQGQ9AeUVyNJ+c
         EtMrLS0vq9FVEa4NqBIcZTuzpY5LKyc00W1ZuwHXVApQ1DYdvjxeMIZovZ4yXSC7po
         mIWlEX6DSYb/Q/FmO/55YT5sGhu/Z7vCuja9L67U8QpoHplfG3SV4YmULO9l1poAmg
         tolChLkrFV1MwMVu8QZbAMSzgijvwF5u+MMeUWNcGlaWRuWud8kNgp1jy7hPX/nOYc
         FGLnmCE2P8IAftaC1oRqZ9Ydt0itTAJPqhiPH9rGoTUhwfEJQiSUvH5xzYcB/HeZ4l
         r+MVU8LMW1zeA==
Date: Sat, 14 Oct 2023 16:57:20 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/3] Work around errors of unstable Inkscape
Message-ID: <fd871edf-2322-4a2a-893f-6ef56c7593cd@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
 <d2caff5c-21bf-41c1-874f-194933ce0891@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2caff5c-21bf-41c1-874f-194933ce0891@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Oct 15, 2023 at 08:22:44AM +0900, Akira Yokosawa wrote:
> On 2023/10/13 23:33, Akira Yokosawa wrote:
> > Hi Paul,
> > 
> > I expected the crashing bug in Fedora's distro Inkscape would be
> > resolved by the time of Fedora 39 release.
> > I tested Fedora 39 beta and was disappointed to see more or less the
> > same crashes of command-line runs of Inkscape as those under Fedora 38.
> > 
> > As a matter of fact, even when Inkscape crashes, the export of PDF
> > is complete most of the time.  So the crashing bug can be worked
> > around by ignoring the error code from Inkscape and continue building.
> > 
> > This patch set implements the ad-hoc workaround in build scripts.
> > 
> > As you can see in Patch 1/3, the workaround is enabled by default.
> > This is because enabling it won't do any harm on systems with
> > stable Inkscape.
> > 
> > I might be able to add some heuristics not to enable the workaround
> > for stable Inkscape installs, but that can wait.
> > 
> > Ubuntu releases 22.04LTS, 23.04, and 23.10 are free of this issue.
> 
> No, Ubuntu 23.04 shows this symptom, rarer than Fedora but still...

Even more reason for it to be applied, then.  ;-)

Again, thank you!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> >         Thanks, Akira
> > --
> > Akira Yokosawa (3):
> >   Ignore error of unstable Inkscape
> >   Ignore emergency-save SVG files from Inkscape
> >   Make sure all PDF conversions are complete
> > 
> >  .gitignore |  1 +
> >  Makefile   | 17 ++++++++++++++---
> >  2 files changed, 15 insertions(+), 3 deletions(-)
> > 
> > 
> > base-commit: 84759ebac65a03aa28c5b02007e6c472b3416d3d
