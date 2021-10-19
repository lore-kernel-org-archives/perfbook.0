Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229630AbhJSEFq (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 19 Oct 2021 00:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634616214;
        bh=qtqsYC+ApQZQRbXaSDtfyDOZH+rES8ulP8FusGSYP+g=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=IgPyjt2As16IwLsgI9xbrKMcczPbGqM5Xj7npcuG6aZyDHtH/Ae7+lQ4j1+CcHDCC
         XZitUbmXstg+gDhmKR9Sx/c2OtpCctEHfxTpyDRRqLXFUlk0F6uo0qG5Ro9MBadFks
         026blytH50D1Cp8xUl6Px4xbW5K5Xn4nWpiqdPqzwt1wF6v7PbuYRB0f2sAKD7xE7C
         Liu+5HUwc5F7v/D2/zZQLUAzWgvhJG/M3wAZ0GuxFS4v/jKnT1y6wJbpn6JAB986IK
         qRVaMEk6BNQgdRKCgecnxCWNYpD7v6T0FohEbMst6CbqDQwOvUOa5z66EOX2nJlJPI
         ngNq2LXDeoQog==
Date: Mon, 18 Oct 2021 21:03:33 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] fixsvgfonts-urwps: Add patterns for 'URW
 Gothic'
Message-ID: <20211019040333.GD880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <2ac75ef4-c43a-195a-f788-15f375e3b20b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ac75ef4-c43a-195a-f788-15f375e3b20b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 19, 2021 at 11:06:41AM +0900, Akira Yokosawa wrote:
> When built on Ubuntu Focal, Figure 3.9
> (cartoons/r-2014-CPU-track-meet-phone-booth.pdf) does not have the
> "TELE" sign.
> 
> Ubuntu Hirsute and Fedora 34 don't have this issue, so it looks
> like Ubuntu Focal lacks some configs for font-name aliases under
> /etc/fonts/.
> 
> As a workaround, add patterns taking care of "URL Gothic".
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> I'm not sure if you have the same issue on your Ubuntu 20.04,
> but I noticed it and tested the workaround on the container image at
> docker.io/akiyks/perfbook-build-focal:latest.

I did not notice until just now.  ;-)

I built a Fedora system, and it shows the "TELE" just fine even without
this change.  But even with this change, I do not see the "TELE" on
Ubuntu 20.04.  Quite possibly because I am missing fonts?

							Thanx, Paul

>         Thanks, Akira
> --
>  utilities/fixsvgfonts-urwps.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/utilities/fixsvgfonts-urwps.sh b/utilities/fixsvgfonts-urwps.sh
> index a3dcd91a..21eb1534 100644
> --- a/utilities/fixsvgfonts-urwps.sh
> +++ b/utilities/fixsvgfonts-urwps.sh
> @@ -17,4 +17,6 @@ sed	-e 's+:Helvetica+:Nimbus Sans+g' \
>  	-e 's+:Nimbus Sans L+:Nimbus Sans+g' \
>  	-e 's+="Nimbus Sans L+="Nimbus Sans+g' \
>  	-e 's+:Nimbus Mono L+:Nimbus Mono PS+g' \
> -	-e 's+="Nimbus Mono L+="Nimbus Mono PS+g'
> +	-e 's+="Nimbus Mono L+="Nimbus Mono PS+g' \
> +	-e 's+:URW Gothic L+:URW Gothic+g' \
> +	-e 's+="URW Gothic L+="URW Gothic+g'
> 
> base-commit: 6991663ee8e326bae30cf6e82c69afb310c2b250
> -- 
> 2.17.1
> 
