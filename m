Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237169AbhKHDKK (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 7 Nov 2021 22:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636340847;
        bh=3oMTka2vKl5+ZVRHEzdVH+47B59l7IQFabUjlgAd9w0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=HIgvQJ8tR8sOY5Rc8XXj/tuDwi3ui+Wk6ncuKUIYg7E45oWjk9GoHsUKMkAy27CV8
         OTrnWYwGtPfvErKScKOeSQ6Zm1cF8oFxzcUhiUYQvgO49lCklhePB3oiDxbMaeHelj
         aPFmO68xvj0KyNMBQeVDrkIGgrehSi/g/b2hcm6kYfcHymPkWzC9NN7vCAH0/6cCCi
         kMPJCVREOXotngWSdrFTIw0ay0OuoN4Ue46LodItpIdspdZ6sY7xzidw2t32uT8Y6b
         jpEmEDxL0vcLRHiWyVtgQkhESsRnfX+hb+UUia728jzZ5Hpo4AZjB2EPFJDNAqskYf
         lTJka1FkrlS2Q==
Date: Sun, 7 Nov 2021 19:07:26 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] docker: Stay with Fedora 34
Message-ID: <20211108030726.GP641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <af676f98-034c-658e-5ff0-890b0f267d18@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af676f98-034c-658e-5ff0-890b0f267d18@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Nov 08, 2021 at 08:41:26AM +0900, Akira Yokosawa wrote:
> The container image tag of fedora:latest has advanced to fedora:35.
> However, current distro packages of Inkscape and pango on Fedora 35
> are not compatible with each other and multi-line text in SVG are
> not rendered properly [1, 2].
> 
> [1]: https://gitlab.com/inkscape/inkscape/-/issues/2864
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=2018036
> 
> Explicitly use fedora:34 for the time being.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Very good!  Queue and pushed, thank you!

							Thanx, Paul

> ---
>  docker/Dockerfile.fedora | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
> index 91633948..c2af8d11 100644
> --- a/docker/Dockerfile.fedora
> +++ b/docker/Dockerfile.fedora
> @@ -1,4 +1,4 @@
> -FROM fedora:latest
> +FROM fedora:34
>  
>  RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
>      fig2ps graphviz inkscape make git vim nano gnuplot-minimal groff time \
> 
> base-commit: 2f38b15c1e6e35a374c51ec07fd02c0a33e62219
> -- 
> 2.17.1
> 
