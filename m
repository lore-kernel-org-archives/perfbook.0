Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239288AbhKQROk (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 17 Nov 2021 12:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637169101;
        bh=iD2mEXdo3TsYKvoMLlmBASk1yjo2z/kigu/Tk5cdXx4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=NrfKs39FkAZF0VIpEtHfRPurUmywfGjBVkFvGbF3R7LXw5PA9TEWAwrqtu49qox3G
         hSUiPrw85uBBLqE0xakDEW1YjzFMgA2Upwi2s0u2S15+r9ycZSDa/qN2hJqjswnOaq
         xqPbSmZZjQIWHxKQlIQOt67ZzLtorcWVJiuBBS4Xb61SROZFj2Z9QywD9ZqGfvjWaw
         3bkUKMAwO9NNDCiBamNQyuN3OjiBXMr59o9fdyCiwS7SOrrsE7mHAllZJcfui3EiBN
         zaEVE5TXOqb+rZW5nA8OAJ1zsfReYYk9v8ahJVGfHgHX+aQ/+0IdcBgEIaKqSfi6BV
         7v/LfbBKaDV1Q==
Date: Wed, 17 Nov 2021 09:11:41 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Revert "docker: Stay with Fedora 34"
Message-ID: <20211117171141.GI641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <11bf80e4-ff2d-9be3-5272-b8ad9a3c31e1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11bf80e4-ff2d-9be3-5272-b8ad9a3c31e1@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Nov 17, 2021 at 11:29:44PM +0900, Akira Yokosawa wrote:
> This reverts commit a1f2577ee2be1a464c2e63191f17f21f24fc81f8.
> 
> Fedora's Inkscape team has proactively applied the fix to the
> issue at https://bugzilla.redhat.com/show_bug.cgi?id=2018036
> and has released inkscape-1.1.1-2.
> 
> Now it should be safe for perfbook to build container images from
> fedora:latest.
> 
> Note: Upstream Inkscape will fix this issue with the point release
> of 1.1.2, which is scheduled to be released in January 2022.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  docker/Dockerfile.fedora | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
> index c2af8d11..91633948 100644
> --- a/docker/Dockerfile.fedora
> +++ b/docker/Dockerfile.fedora
> @@ -1,4 +1,4 @@
> -FROM fedora:34
> +FROM fedora:latest
>  
>  RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
>      fig2ps graphviz inkscape make git vim nano gnuplot-minimal groff time \
> 
> base-commit: 10fb038cd0da1be1db8766a9d2df120ebf6ca28d
> -- 
> 2.17.1
> 
