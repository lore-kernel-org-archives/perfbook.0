Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbjC2XZq (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 29 Mar 2023 19:25:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB2761A5
        for <perfbook@vger.kernel.org>; Wed, 29 Mar 2023 16:25:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D51BCB8252E
        for <perfbook@vger.kernel.org>; Wed, 29 Mar 2023 23:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680132342;
        bh=Q3QLAEnl8O58tkeSn9PLKoax9svVfMUSIbkFxn6YSfw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KsD+gdn9cvMDdytBzStcGbS+TUTY/vWnmws3HjgYxbhHIUy0hqCwOOZ+kTZ2UO1NQ
         BO+g7taD9g2GMNXThZvTU7o1/Sx1F5IvL89YK9oGNoLW377v0FDPH9ugegOXpWMlRP
         1rrgWxpr4HxtwaxIshWuZoizzyM+q89Fq2PMf5v0g8TTVnupd50zZpkBzcBPeCpsaf
         A6TiTlxsCOPCwkeK2K9APO6wITqTjw0Z4OSh8oDb2Age82HLltHTabe/ouWanNx70K
         TmT58CgR7p4z/3fZ9JJJtDjiIzIoKI3iO1wNcTdFdJahxLaTS1iWH7BKmBUJrO1Av5
         9K4CdAtV4Imzw==
Date: Wed, 29 Mar 2023 16:25:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] docker: Cope with change in
 latexpand-v1.3.tar.gz from gitlab
Message-ID: <c42bb7d8-4565-49f2-ad8d-d892cf6839c9@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c25e014e-9fe0-8007-cebd-ba7b1e171fd4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c25e014e-9fe0-8007-cebd-ba7b1e171fd4@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Mar 29, 2023 at 10:30:47PM +0900, Akira Yokosawa wrote:
> latexpand-v1.3.tar.gz downloaded from gitlab has changed slightly
> and latexpand (script) is now extracted under latexpand-<commit-id>/.
> 
> Use wildcard for the directory name.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> I'm working on rewriting these Dockerfiles, but it is not ready.
> Please apply this urgent fix in case there is somebody who wants to
> build an image on their own.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
>  docker/Dockerfile        | 4 ++--
>  docker/Dockerfile.fedora | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/docker/Dockerfile b/docker/Dockerfile
> index 3a3991bbe09e..1fec609a0043 100644
> --- a/docker/Dockerfile
> +++ b/docker/Dockerfile
> @@ -14,8 +14,8 @@ COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
>  RUN fc-cache /usr/local/share/fonts/
>  WORKDIR /opt
>  RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
> -    sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-v1.3/latexpand && \
> -    cp latexpand-v1.3/latexpand /usr/local/bin
> +    sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-*/latexpand && \
> +    cp latexpand-*/latexpand /usr/local/bin
>  ARG uid=1000
>  ARG gid=1000
>  ARG user=perfbook
> diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
> index 916339488851..ff56ac4c751e 100644
> --- a/docker/Dockerfile.fedora
> +++ b/docker/Dockerfile.fedora
> @@ -14,8 +14,8 @@ COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
>  RUN fc-cache /usr/local/share/fonts/
>  WORKDIR /opt
>  RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
> -    sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-v1.3/latexpand && \
> -    cp latexpand-v1.3/latexpand /usr/local/bin
> +    sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-*/latexpand && \
> +    cp latexpand-*/latexpand /usr/local/bin
>  ARG uid=1000
>  ARG gid=1000
>  ARG user=perfbook
> 
> base-commit: 3f8f4bf82c2cf1947b8dcef6af1daf71ba4feff1
> -- 
> 2.25.1
> 
