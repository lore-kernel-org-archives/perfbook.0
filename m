Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF92112BEB4
	for <perfbook@vger.kernel.org>; Wed,  8 May 2024 17:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715189972; cv=none; b=hzl2yEtZbWIrqgMfD3Re7lUx49Z2InJpctUyMMPrH/AnELtWQn2Ef7lIzVPPf5Uwcip30f+GnXmCOeqIGhrfW96Eu8zup8EYh3OrHFdyoeHh2qLcCE/J6JMsdJABGgQEcQl2nF9dZQrulk0b/5qGKql9xPitVWSQDhL8vtdCGgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715189972; c=relaxed/simple;
	bh=UMlSsN1mH7xSMtcukGiqUegrG408KOoxaiv6+JUk324=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4VB3Z0b8uLFlVrzlQV6iSSaJUp8kJsYoKRHWvru34C40ruaxhPHbzhrUwFdioDOqTTyqIjYLRsnTL24j6jArGnSAKFRbv2p+rz89DIx/eDU7oRoro81V7ByZIM/06OilKawoNIbS4AtkBv2klLYMgJ5gFnkBL/ctwkFjZVo6EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/wwkRcs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/wwkRcs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9C3C113CC;
	Wed,  8 May 2024 17:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715189972;
	bh=UMlSsN1mH7xSMtcukGiqUegrG408KOoxaiv6+JUk324=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=R/wwkRcsGTZlHsj9fNpkLfJLyZJ9SpkNJPG+Q/4lGrbf/T15MA48YE15N1X/w3hCm
	 z7astQ/1TaZZbNzMEHCK9KMNxsmOzni7hokhf5DVrYol45jMPe2nfbO/ENVFiAoIsW
	 2fYqbM2yYKAcks9Fsu+/+4I8hiPkUddHmZUaNJCNE/jA7kboPc+9KvEUcHydRg2CM1
	 r0jmblClG0NsmsQYcPTijkHeu3tnUzrFILu8bLbtHXSI9VkOMilqlTYsmBKTaZmf0R
	 fYoaFlF2ivE3raxhN7YSZD+Sw0ifjuNpGkqJTx/m+TeX7Q0sdlqBzTjIDpKbPEXTa2
	 jUVDNjlh+Wmpg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A5B0ECE0448; Wed,  8 May 2024 10:39:31 -0700 (PDT)
Date: Wed, 8 May 2024 10:39:31 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] locking: Mark sentence-ending period as
 such
Message-ID: <0aa0ec43-c89e-417d-b63a-3d98749f2f13@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <bc5fc6da-1f06-43b3-b065-3292652d78f8@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc5fc6da-1f06-43b3-b065-3292652d78f8@gmail.com>

On Thu, May 09, 2024 at 12:16:13AM +0900, Akira Yokosawa wrote:
> Silence warning from "make punctcheck":
> 
>     vvv Hint: sentence ending with an uppercase needs "\@." vvv
>     ./locking/locking.tex:2039:traditionally used in scheduling disk I/O.
> 
> It is needed because commit 678e6cc3c0f1 ("locking: Cite Dice et al.
> for hierarchical lock") have added a sentence in the paragraph.
> 
> Fixes: 678e6cc3c0f1 ("locking: Cite Dice et al. for hierarchical lock")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Apologies, I was clearly in way too much of a hurry...

Queued and pushed both, thank you!!!

							Thanx, Paul

> ---
>  locking/locking.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/locking/locking.tex b/locking/locking.tex
> index e4ebce51..e0e17253 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -2036,7 +2036,7 @@ into account, preferentially granting locks locally, while also taking
>  steps to avoid
>  starvation~\cite{McKenney02e,radovic03hierarchical,radovic02efficient,BenJackson02,McKenney02d}.
>  Many of these can be thought of as analogous to the elevator algorithms
> -traditionally used in scheduling disk I/O.
> +traditionally used in scheduling disk I/O\@.
>  Dice et al.~discuss use of local and global locks in order to transform
>  any architecture-oblivious lock into a local/global locking scheme
>  that optimizes for the system's structure by providing (for example)
> 
> base-commit: 15fc91c0c6dafb32337f505069a0805a4e3c5858
> -- 
> 2.34.1
> 
> 
