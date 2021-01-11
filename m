Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbhAKFPI (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 11 Jan 2021 00:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610342068;
        bh=QntP+fqjuBStDppmxEKaW6XtiQTdISI8Zg2r5dtq7MQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=qUwdazMkGHU1Kg0PR2Lhw4GaL2sEKpRIHPoXYrss+TERP/7z+lEsucBKvfx0F9RbA
         mPrInNk0Fgh7iYkuFAxYHQgKLT4KbHq0vtbMH5azvFUrhcOfXLLnyGusNNFsGpTlj+
         rzoZAcOYPEkNlIxLYdzNFrUgIg35Fh34bwmrYygr5BxO+GbHNB+QKzyAvd5GymXKAI
         YOkVqWmvbMbXtoLMHokIbHbfbzOzgPntTXc1hkE/KNdEdjjF4ifVyk006nmT3uCnGN
         nKRmcx/Lqdxc1RqN8lLzRua9uHw4zwto1UJ9gv4HiDVx6n57gNj1wKBvZkWEkuCf5B
         lDziZ4UvyYqrw==
Date: Sun, 10 Jan 2021 21:14:27 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Add Fedora-based Dockerfile
Message-ID: <20210111051427.GA2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <8643e9db-be44-edd9-df06-c9f87348d669@gmail.com>
 <0d374dd3-542e-046c-789a-559e997ccb2c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d374dd3-542e-046c-789a-559e997ccb2c@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 11, 2021 at 10:50:08AM +0900, Akira Yokosawa wrote:
> On Mon, 11 Jan 2021 08:08:39 +0900, Akira Yokosawa wrote:
> > From d37f98e4ca6cd968af2248d3c719b07ce313a7ec Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Mon, 11 Jan 2021 07:57:58 +0900
> > Subject: [PATCH -perfbook] Add Fedora-based Dockerfile
> > 
> > For those who prefer Fedora, add an alternative Dockerfile as
> > docker/Dockerfile.fedora and mention it in FAQ-BUILD.txt.
> > Also add a few commands in the Focal-based Dockerfile.
> > 
> > Other updates in FAQ-BUILD.txt:
> >   o Add "texlive-collection-fontutils" to the Fedora package list,
> >     which includes "epstopdf".
> 
> Hi Paul,
> 
> You might be wondering where epstopdf came from.
> It is another alternative to a2ping I'm experimenting with.
> On Ubuntu, the existing list of packages covers it.
> 
> FWIW, a2ping was forked from early version of epstopdf.
> Current maintainer of epstopdf is Karl Berry, who is a key maintainer
> of upstream TeX Live.
> So in case Ghostscript breaks backward compatibility ever again,
> I expect epstopdf would get updated soon.

Sounds good!  (I queued and pushed this just before cutting -rc2.)

							Thanx, Paul

>         Thanks, Akira
> 
> >   o Omit some options to "docker run" as they are specified in
> >     both Dockerfiles.
> >   o For those who prefer "podman", add instructions to use the
> >     images with podman.
> >   o Substitutions:
> >       "Docker container" -> "container image"
> >       "docker image"" -> "container image"
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> 
> [...]
