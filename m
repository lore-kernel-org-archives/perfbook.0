Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233541AbhJQS3w (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 17 Oct 2021 14:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634495262;
        bh=SvC+JdauP1EaeJxohETtBavwgvmiaN5o+reP0JOKNbM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=EDVrJ7or2gTANMLcb+ri5jf0MLAu7W3R1fsizmXwo/AwCfN7ywoF1r5orRrAHXfMq
         yHbuf/ie3nvVE5ymkxUxj2/19DFAV7i8LxRvY2ltcxtorIf5cmqVZPotvg7pc8Pd4F
         wgLwU/48aRzv/6MlRCNENn6w0Vu4T3IWXj7z1CvFX8dIemh3PVUgzq6QCsckdmVfgI
         CgWvs+B4339YpKTtcjsk45cOfy029YnWAj6I3NxuwjBjpxqZepdb+WRlaJ/1JHDLkQ
         gDZ5HbuTtfTdV/76i/BSP/i3vtjKn8gx4xDYPuLVBmNtmrhAL/VZXp9wBquE6DGqeN
         zpraPhK8j0X/g==
Date: Sun, 17 Oct 2021 11:27:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/3] Updates of docker/ and Makefile
Message-ID: <20211017182742.GQ880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <e803eeb3-d39d-8bbf-4e5e-d7c3fbbfcd84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e803eeb3-d39d-8bbf-4e5e-d7c3fbbfcd84@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Oct 17, 2021 at 05:13:37PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set consists of updates under docker/ and Makefile.
> 
> Patch 1/3 updates Dockerfiles under docker/.
> It adds a couple of font packages in Dockerfile.fedora and
> adds "gnuplot" and "time" commands in all three Dockerfiles.
> 
> Patch 2/3 shortens progress reports from "make".
> 
>     Old example: intro/PPGrelation.svg --> intro/PPGrelation.pdf
>     New example: intro/PPGrelation.svg --> .pdf
> 
> Patch 3/3 switches the default "esp --> pdf" rules to those in
> epstopdf-rule.mk.
> 
> To see the effect of patches 2/3 and 3/3, a "make neatfreak"
> before "make" or "make -jN" is needed.

The shorter progress reports are nice!  Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   docker: Add some fonts and commands
>   Makefile: Shorten progress report (dir/filename.src --> .dst)
>   Makefile: Promote epstopdf-rule.mk as the default
> 
>  Makefile                 | 16 ++++++++--------
>  a2ping-rule.mk           |  6 +++---
>  docker/Dockerfile        |  8 +++++---
>  docker/Dockerfile.bionic |  8 +++++---
>  docker/Dockerfile.fedora | 11 ++++++++---
>  epstopdf-rule.mk         |  6 +++---
>  6 files changed, 32 insertions(+), 23 deletions(-)
> 
> 
> base-commit: d28c5aa8c1dad57c76554743cc4e59a18d367303
> -- 
> 2.17.1
> 
