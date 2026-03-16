Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731961C5D5E
	for <perfbook@vger.kernel.org>; Mon, 16 Mar 2026 21:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773695383; cv=none; b=TIa/y8w6Q2lLJBEyAp/crFBYI+paFoKIvSMh4Xi7gcWvf29nTiVccH+7RklCMj8hJwpOXah3MmhFOXmAeR+Zci2SxY7M7dun+cXmwtDEijct7AzNJWv+eyreaUPF8O/6H7JZ2G9IRjoIxW99WRrVr3iPx9qp+78ErWQGtH4MDec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773695383; c=relaxed/simple;
	bh=NFHg2fp8Kx+7xYAVzLw6WJ6G2s188u3Xobdz2/KJDRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwYsboQ2LOc1WqyNCXR+O6v+izsQNRMo+CvEYsUm6Bw3gCTYd8EeqvPmuReVLIzFc5odrIK7YDok1tnZ5NydVwLSN3EeLFiYnAjRs8jyqz4JYaoudGFMZ1LjNVWAMCj9yZbMmC+XxEeKukwvnSBWwFL6J1bX++qO5n11g7w9zl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hb5++GMd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hb5++GMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC8DC19421;
	Mon, 16 Mar 2026 21:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773695383;
	bh=NFHg2fp8Kx+7xYAVzLw6WJ6G2s188u3Xobdz2/KJDRE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hb5++GMdz2cEHzQCNKWSHiyuyD2O1dh/A+tPlzWCGGf5r7pliQokeQXCBtLFCP6I6
	 6lUxOOkzokDb0bolk6EPrlyTu+kKZSeyJCUmhzxCYYkwQgBG5ZKOXoh0G/HK6b6Laj
	 qVOhaHZYQJszUHllVBA2EcYHG1jO7dPobR3J6Mvr6nctuRGxWValPdqXXkHoK3FcXo
	 SHfV59UIFuqAaUu2LCk4kcoxuBvh7O9TAajPph6oKJqJp8QVNQmRpd7Fx6733HK5DU
	 Sv2qEKTgHGoYShM5Ujzbexl6nBTe7GQUYxKPmxqEDx2Zl6VBsJv0lwnk7gcnuF95nP
	 QisS7SKKaPiGA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DFD94CE098F; Mon, 16 Mar 2026 14:09:40 -0700 (PDT)
Date: Mon, 16 Mar 2026 14:09:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] Extend buggy fvextra version range
Message-ID: <d73323f6-769b-4ca5-8a43-dc67264922a8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <7e535d83-2f19-4423-9a7d-297fb4b4d8fc@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e535d83-2f19-4423-9a7d-297fb4b4d8fc@gmail.com>

On Mon, Mar 16, 2026 at 06:15:56PM +0900, Akira Yokosawa wrote:
> Unfortunately, the tentative fix to the regression of fvextra has
> failed to convince the maintainer [1] and fvextra v1.14.0 was
> released with the regression unresolved [2].
> 
> Extend the buggy range of fvextra.
> 
> Link: https://github.com/gpoore/fvextra/issues/32#issuecomment-3942491507 [1]
> Link: https://github.com/gpoore/fvextra/releases/tag/v1.14.0 [2]
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Looks like Archlinux's texlive-latexextra (2026.0-3) comes with
> fvextra.sty v1.14.0.

Rather annoying, I will admit.  But I am glad that you have a workaround!

Thank you very much, queued and pushed.

							Thanx, Paul

> --
>  utilities/autodate.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> index 839db7f3..c72194fa 100644
> --- a/utilities/autodate.sh
> +++ b/utilities/autodate.sh
> @@ -136,7 +136,7 @@ fi
>  
>  # check if fvextra is buggy ("samepage=true")
>  FVEXTRA_BUGGY_SINCE=v1.11.0
> -FVEXTRA_BUGGY_UNTIL=v1.13.2
> +FVEXTRA_BUGGY_UNTIL=v1.14.0 # as of 2026/02/25
>  
>  fvextra_sty=`kpsewhich fvextra.sty`
>  if [ "x$fvextra_sty" != "x" ] ; then
> 
> base-commit: 492e8f9483d3e1dfd3768ef43dd462dd78e40c3b
> -- 
> 2.43.0
> 
