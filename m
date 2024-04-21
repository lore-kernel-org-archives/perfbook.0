Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3184C3AC34
	for <perfbook@vger.kernel.org>; Sun, 21 Apr 2024 18:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713725889; cv=none; b=HL4iBlnYUVT1pyOTcNXsnBtiRfm6/HVHJHtuef460RIxXAMGDyKjtAUZ0yfJEUVQfaCoXM6FpexHGOwHvHWeQRtmFU7Bu+0KwgDmMwijVIV98W72GdapunpRHdsWJrwDEvdyUz6BZXHLSHS3MEDt1OtVWIW2tsOj9w55oWW/vRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713725889; c=relaxed/simple;
	bh=9DdZJMZAxah1rRxwZfJHdmay4czlpzwBOjthnR74Zk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnd/fhcXlZT/yApGA7ybArY3ticYqJCFUtxSSDVwXui7BheLQKYYRQxk5Ynor9/BqUd5ppTa/OySvYvZl7fI0SlSJf9FAXYj5hX+YF+9ZvHRDNSb15yLKFVqMGpswbyX6n7feAAZy0oDvAc85hG+oNm71Ls9MlU2ObxPH9rTeoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owdt7+4h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owdt7+4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8678C113CE;
	Sun, 21 Apr 2024 18:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713725888;
	bh=9DdZJMZAxah1rRxwZfJHdmay4czlpzwBOjthnR74Zk8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=owdt7+4hwuN9cK/zm3rU4MHwwpn9zfV6AdNgm+bQwp3bGxltVKQZ4DYxCh3fvYNIz
	 X8FDoXn4+dz1VNhJNXd9qdUw333ef0nj7UFwc9gLxaU82KuJCMWaXc8o22MkAIhrqy
	 7YPm4k9EJ78huwVnsjycKsNG3lk0Oi20eHECv5vzvhgpEhzIu5+7Vi0p1Aez212857
	 v0Cv1MavUS7ZTjlLvllbBALz5W4Bn8dizBqVy+2h/wuS/Rv7ri1I6sXBwTYq743KFa
	 JwoRQZxJVsxHxzRas2V+CEyWPWwv1WNr/pgzfAtFtuELUVc7tfQgp7qDi/k9mjrq6E
	 E4/xLuaicUA7A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4A3D8CE1BE0; Sun, 21 Apr 2024 11:58:08 -0700 (PDT)
Date: Sun, 21 Apr 2024 11:58:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] docker: Add options to tar for normal-user
 mode behavior
Message-ID: <7e085d12-d8d2-45ff-afc8-52c7f5002de1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <4f7ecd8d-4e8c-41a2-a948-a6d3f05843ff@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f7ecd8d-4e8c-41a2-a948-a6d3f05843ff@gmail.com>

On Sun, Apr 21, 2024 at 09:22:16PM +0900, Akira Yokosawa wrote:
> Default behavior of super-user mode tar is to keep uid/gid and
> permissions in extracting files/directories from archives.
> 
> It conflicts with security settings of rootless mode podman while
> building container images from recent releases of ubuntu and fedora,
> resulting in errors as follows:
> 
>   tar: latexpand-v1.3/tests/df-conflict/b: Cannot change mode to rwxrwxr-x: Operation not permitted
>   tar: latexpand-v1.3/tests/df-conflict: Cannot change mode to rwxrwxr-x: Operation not permitted
>   tar: latexpand-v1.3/tests/expected/err: Cannot change mode to rwxrwxr-x: Operation not permitted
>   tar: latexpand-v1.3/tests/expected: Cannot change mode to rwxrwxr-x: Operation not permitted
>   tar: latexpand-v1.3/tests: Cannot change mode to rwxrwxr-x: Operation not permitted
>   tar: latexpand-v1.3: Cannot change mode to rwxrwxr-x: Operation not permitted
>   tar: Exiting with failure status due to previous errors
> 
> Add --no-same-owner and --no-same-permission options to tar and make
> it behave the same way as in its normal-user mode.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  docker/Dockerfile        | 2 +-
>  docker/Dockerfile.fedora | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docker/Dockerfile b/docker/Dockerfile
> index 66fd2b3f..c3e2a237 100644
> --- a/docker/Dockerfile
> +++ b/docker/Dockerfile
> @@ -14,7 +14,7 @@ RUN apt-get update && apt-get install -y fig2ps inkscape xfig graphviz psutils \
>  COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
>  RUN fc-cache /usr/local/share/fonts/
>  WORKDIR /opt
> -RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
> +RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar --no-same-owner --no-same-permissions -xzf - && \
>      sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-*/latexpand && \
>      cp latexpand-*/latexpand /usr/local/bin
>  ARG uid=0
> diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
> index 6812163a..cb652680 100644
> --- a/docker/Dockerfile.fedora
> +++ b/docker/Dockerfile.fedora
> @@ -16,7 +16,7 @@ RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
>  COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
>  RUN fc-cache /usr/local/share/fonts/
>  WORKDIR /opt
> -RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
> +RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar --no-same-owner --no-same-permissions -xzf - && \
>      sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-*/latexpand && \
>      cp latexpand-*/latexpand /usr/local/bin
>  ARG uid=0
> 
> base-commit: ac7686132a63f3d47fd18aa3f767610346ff484b
> -- 
> 2.34.1
> 
