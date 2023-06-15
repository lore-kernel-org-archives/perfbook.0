Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237257AbjFOQtb (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 15 Jun 2023 12:49:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6F42D45
        for <perfbook@vger.kernel.org>; Thu, 15 Jun 2023 09:49:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A04C62D40
        for <perfbook@vger.kernel.org>; Thu, 15 Jun 2023 16:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686847768;
        bh=+BMeOIbia8n42q1uqGyTKZPD+md4ouVcgHg4PCv+etE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=AEuEGaNuXgu3Hek0SfJi4/Foi3TbmYisn31R7VVXwXl4D3tvm8G1egRUACdubbEBx
         rXGkxTfzffk96k0151sSyzCmFv+9miEe8vUe1iphF546Jhzi34vF5favwui5LnBg8p
         cURhKW7xFrxCbzAILOPw1Nh3Ppxu+4ix4QowQKrp596CSuSE+JXXU/vsE0K7nrxBPC
         StqfzLB5GkDR+Yqy50v38vejdWwgp9DliMMxFsFCkL0vlvz99JlI7ucs1CePT0/1oS
         jBNVj4oHWe95BRRPIRwNe/UAM2dNBUzeGmAxecupTqmcT1JcdNL9ANNAMUXmeXpoLj
         ilWCrbTcaDm3g==
Date: Thu, 15 Jun 2023 09:49:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/6] Update Dockerfiles
Message-ID: <5281d87b-4a92-4131-99a5-c07f94fde021@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jun 15, 2023 at 06:48:00PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Commit a80a57b21a5e ("fixsvgfonts.sh: Convert sans-serif into 'DejaVu Sans'")
> assumed that having "DejaVu Sans Mono" is sufficent for "DejaVu Sans".
> 
> It turns out that docker/Dockerfile.fedora doesn't cover "DejaVu Sans".
> Fedora's dejavu-sans-mono-fonts package doesn't contain "DejaVu Sans Mono"!
> There is a meta package of the name dejavu-fonts-all which covers them
> both as well as dejavu-serif-fonts.
> 
> It also turns out that Answer to #9 in FAQ-BUILD.txt saying:
> 
>     As for Ubuntu and Fedora, packages listed in #5 should cover
>     all the font families needed.
> 
> is wrong on the Fedora front.  DejaVu and Liberation fonts need
> font packages dejavu-fonts-all and liberation-fonts.
> 
> Furthermore, Fedora 38 (released this April) has a regression of
> Inkscape where font markup is corrupted in SVG --> PDF conversion.
> 
> So Deckerfile.fedora should stay with Fedora 37 for the moment.
> 
> Quick search of upstream Inkscape's issue tracker didn't hit the
> font markup regression.  I'll open an issue there unless somebody
> else beats me to it.
> 
> So, this patch set consists of the following
> 
> Patch 1/6 adds check of "DejaVu Sans" as nice-to-have font.
> 
> Patch 2/6 updates FAQ-BUILD.txt and Dockerfile.fedora for nice-to-have
> font packages.
> 
> Patch 3/6 updates Dockerfile.fedora to stay with Fedora 37, using an ARG
> variable so that building from fedora:38 can be possible.
> It also adds popller-utils to check the font markup info in PDF properties.
> 
> Patch 4/6 updates Dockerfile (from ubuntu) so that the default base
> image is the "latest" (jammy at the moment).  There is no reason to stick
> with focal (20.04).
> 
> Patch 5/6 adds poppler-utils to Dockerfile (from ubuntu) to detect
> Inkscape regression early in case it actually sneaks in.
> (Note: Ubuntu 23.04 is safe at the moment.)
> 
> Patch 6/6 changes the default uid:gid pair of container images built
> from Dockerfiles to 0:0, which is for rootless mode docker/podman.
> Repository at dockerhub for prebuilt images is changed to
> akiyks/perfbook-build, where the tags "latest" and "fedora" have
> uid:gid pair of 0:0.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (6):
>   Makefile: Add 'DejaVu Sans' to nice-to-have fonts
>   FAQ-BUILD: Update nice-to-have fonts for SVG figures
>   docker/Dockerfile.fedora: Stay with Fedora 37 for the moment
>   docker/Dockerfile: Use 'latest' as the default tag
>   docker/Dockerfile: Add poppler-utils package
>   Dockerfile: Make uid:gid = 0:0 the default
> 
>  FAQ-BUILD.txt            | 37 ++++++++++++++++++++-----------------
>  Makefile                 | 15 ++++++++++++---
>  docker/Dockerfile        |  9 +++++----
>  docker/Dockerfile.fedora | 16 +++++++++++-----
>  4 files changed, 48 insertions(+), 29 deletions(-)
> 
> 
> base-commit: a80a57b21a5e8ea3dfa90471126920a1131682f7
> -- 
> 2.25.1
> 
