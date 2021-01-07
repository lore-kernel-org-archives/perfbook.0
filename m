Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:32924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728362AbhAGRz1 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 7 Jan 2021 12:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610042087;
        bh=bGyCaFTSANNUBfOlUwu8tCNPl1DhRb8pcu7QfLhKKE4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=lMvklQLwV7nD3NbAPzZFs6YM5mKTdCZnb5AG0y9bntSC3kFuFJ9DUfsTYqBzhlo+y
         mM4GPGVNj7HmMXtDBcuhwNytReeOHmcQUh9DQxKhHY0ifaBQPjVL2Lup+mU3MKpWHx
         ySRtKLFHZBJ1qViitMUVOQwpi2qQJU+cJZuAWLJw4VJAf5Pkgw0daYWv5VKYhyjDTf
         4PE09VD+hsohAWG6Ragzu7oUfkgLJTH4f0A5zvY8hIZLLXCrUH9NHSh5Le1bSdpsN0
         dEu0t9VlEvHjWA6TVArHU3sW+CTFGGeGjlyRG3licdts3tivSh11VAwBr6HCfcvs59
         bZyQBrDddQD7w==
Date: Thu, 7 Jan 2021 09:54:46 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2 0/2 -perfbook] Add Dockerfile and Q&A
Message-ID: <20210107175446.GN2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <63638566-e9e8-4be6-2d25-b0919b3805d1@gmail.com>
 <37b28839-4534-b567-02e6-2ca4c7afe261@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37b28839-4534-b567-02e6-2ca4c7afe261@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jan 07, 2021 at 10:49:08PM +0900, Akira Yokosawa wrote:
> Hi,
> 
> This is the v2 of the patch set.
> 
> The strange -nq build Paul thought he had encountered prompted me
> to prepare a Docker image for stable build environment.
> Such an environment can be helpful as a contingency plan when
> some package's update causes breakage in perfbook's build scripts,
> such as the build error recently reported by Dmitry and Felipe.
> 
> This patch set adds a Dockerfile I used and a Q&A entry in
> FAQ-BUILD.txt.
> docker/ subdirectory also holds steel city comic font to be copied
> to the image.
> 
> Changes v1 -> v2:
>   o Add a few ARG commands in Dockerfile for custimizable uid and gid.
>   o Entry #14 in FAQ-BUILD.txt recommends the use of -u option to
>     use uid:gid of host side.
>   o Changed dockerhub repository name to perfbook-build-focal.
>   o Reference #14 from #5 in FAQ-BUILD.text
> 
>         Thanks, Akira

Applied and pushed, thank you!  I did the usual wordsmithing, so please
let me know if I messed anything up.

Showing my ignorance of Docker...

My guess from reading the FAQ is that the new docker/Dockerfile is
used to build a new docker image, and that it is not needed by those
using your akiyks/perfbook-build-focal:latest.  Is my guess correct?

						Thanx, Paul

> --
> Akira Yokosawa (2):
>   Add files to build Docker image for perfbook build
>   FAQ-BUILD: Add Q&A on Docker image
> 
>  FAQ-BUILD.txt                       |  38 +++++++++++++++++++++++++---
>  docker/Dockerfile                   |  21 +++++++++++++++
>  docker/steel-city-comic.regular.ttf | Bin 0 -> 23280 bytes
>  3 files changed, 56 insertions(+), 3 deletions(-)
>  create mode 100644 docker/Dockerfile
>  create mode 100644 docker/steel-city-comic.regular.ttf
> 
> -- 
> 2.17.1
> 
> 
