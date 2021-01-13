Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728485AbhAMTBY (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 13 Jan 2021 14:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610564443;
        bh=Rf56kc0bhfQ1FjrEPK35XI1CWT2HHwx6XpZr2Qp7lkg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=EPdn4RCJglcA+oMKDHbsnb3xCkie7n0Zes2B8U19JqHA4aenp/XZg+0EUbaoqA+wZ
         PxnypiWFYwe2b/v5VQUM5hkQALmyOLnhIWf/Bu2WO+WG82gVuVzUyWUxTohWBQygqh
         NF3WnOz3Kkkxg/fBhZvCL6TNCGNGUDW5Eghn/wQ7RLQcUY2xe6fCXXupBcynWQT+/+
         wHzhUdZoIROBNiuHMy+myx4dkLl/TwG65AiX1ftg7RK3EoJoJBQ0sU/PLV/fycDPwv
         OranAaHhksprWnfxd6wI5YL4zT0Vejkpkd8xjAdu+pxonqstcfyU21bbR1ibYJr9TI
         5J7Az6ASG4zbQ==
Date: Wed, 13 Jan 2021 11:00:43 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] FAQ-BUILD: Fix answer to #14
Message-ID: <20210113190043.GA2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <dfbeceb7-fc20-0963-9fb9-dc662656ee2e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfbeceb7-fc20-0963-9fb9-dc662656ee2e@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 12, 2021 at 08:41:24PM +0900, Akira Yokosawa wrote:
> >From bc1d4d5dac45513181c60bc3877a743c08991a8f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 12 Jan 2021 20:32:11 +0900
> Subject: [PATCH -perfbook] FAQ-BUILD: Fix answer to #14
> 
> There were some confusions in the answer updated in commit
> 5462db2929fa ("Add Fedora-based Dockerfile").
> 
> If you have a different uid:gid pair, you need to explicitely
> specify them in a "-u" option to the "docker run" command.
> 
> Also fix the tag name of the Fedora-based container image.
> 
> Fixes: 5462db2929fa ("Add Fedora-based Dockerfile")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I queued and pushed both, thank you!

							Thanx, Paul

> ---
>  FAQ-BUILD.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> index a7a0711d..0d3330b3 100644
> --- a/FAQ-BUILD.txt
> +++ b/FAQ-BUILD.txt
> @@ -297,7 +297,12 @@
>  
>  		Note:
>  		The prebuilt container image assumes <uid:pid> = <1000:1000>.
> -		If you have different IDs, bash prompt will be in the
> +		If you have different IDs, you can still run the image by
> +		adding the option:
> +
> +		     -u $(id -u):$(id -g)
> +
> +		to the "docker run" command.  The bash prompt will be in the
>  		form of "I have no name!@abcdef012345:/work$".	Builds of
>  		perfbook will nevertheless succeed.  You can also build
>  		a container image of your own:
> @@ -307,7 +312,7 @@
>  		      --build-arg uid=$(id -u) --build-arg gid=$(id -g) .
>  
>  		For those prefer a Fedora-based container image,
> -		akiyks/perfbook-build-focal:latest is also available.
> +		akiyks/perfbook-build-fedora:latest is also available.
>  		It is built from docker/Dockerfile.fedora.
>  
>  		If you have podman already installed, you can run the image
> -- 
> 2.17.1
> 
