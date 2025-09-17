Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED49369988
	for <perfbook@vger.kernel.org>; Wed, 17 Sep 2025 11:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758109855; cv=none; b=EZwckI9T9lZ6pKxu7gb5fKPcExOzK1YAEDV09pg1MEkhEzpGrlwrwYw3dMerFdcPiw8De7oemOHGAvb8fahpw3XSc24e8lxAnAzAezYyCrroYCF8bAE0pUM89eZ6IkXY4xF+Xh3WxRCN7ZcWYo0msHdQJfW6NTX6+KHQ51BgbqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758109855; c=relaxed/simple;
	bh=vp6nbH06bg7Y8fNERqlzMUMd1Cb94Tg58q1R+AimT2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcnQ9sgoADkKfwAayKTjHTrGN3+s07P/Hvj+JcVrj72xk47fRp8jmqyHCsyw3KOxEEXpMY+53b3I7tUzxb5PFINCZWQjS0hxltFK7kPj/r8Ag6usHyU9OZWad+IJSnO+qnqIVZLslpCrkzbZFaX2R6RXnh0fQgnoM36BAoxIMF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNLPgcxc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNLPgcxc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411B4C4CEF0;
	Wed, 17 Sep 2025 11:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758109855;
	bh=vp6nbH06bg7Y8fNERqlzMUMd1Cb94Tg58q1R+AimT2c=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=QNLPgcxcFqj1dfWUDyOaFtYJFBvI6V8RDXj0asYsbiJLydyud1calQ1erBEsThfLe
	 HQAweI7u2Mi+DUVAVGiGrJejgpb0OcdYYO6V75yjoYzgJNPpC633SruNgrtU7kVFiu
	 ZKbnl5R45iApDCjXqcAw5C955C+wlKKLDGX4vlYw5OLam93ARG3sWwBshSwzTJvUeL
	 S6RMp87uOK+QgNekxcRZlnH2Mm6j9jZrJjMro0hKbbnZaJ3/oAkmzeb2OfjKE0pyV+
	 IpJLyUIHjkl2wb2wkFnF8fr2BEI6WQWB/ssGy9brpYd4D3ssqHEda9jddBOnilRflQ
	 UFPseR+hj6nDQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9F086CE0836; Wed, 17 Sep 2025 04:50:54 -0700 (PDT)
Date: Wed, 17 Sep 2025 04:50:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 2/2] advsync: Add narrow space in front of
 percent sign
Message-ID: <d0a3ffd4-7ab4-4be6-bcc4-994b16a0985d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <4e1e5582-219b-4021-ab7c-efd8d34a20d3@gmail.com>
 <4884acc4-63b4-4b6f-b0bf-c236c193e2ae@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4884acc4-63b4-4b6f-b0bf-c236c193e2ae@gmail.com>

On Wed, Sep 17, 2025 at 08:28:28PM +0900, Akira Yokosawa wrote:
> Subject: [PATCH -perfbook 2/2] advsync: Add narrow space in front of percent sign
> 
> For consistency, as described in Appendix D.2.1.4.

Quued and pushed both, thank you!

I clearly need to improve my self-proofreading...  The "\%" is a very
old habit that I need to break, but I have no excuses for "atain".  ;-)

> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> I think it would be helpful to have a macro for this pattern,
> say, \pct, which can be used instead, such as:
> 
> +	latency $T$, then a 50\pct\ idle system will have latency $2 T$, a
> +	10\pct\ idle (90\pct\ utilized) system will have latency $10 T$, a 1\pct\
> +	idle system (99\pct\ utilized) will have latency $100 T$, and so on.
> 
> Or, make it a macro \pct{} that can be used as:
> 
> +	latency $T$, then a \pct{50}\ idle system will have latency $2 T$, a
> +       \pct{10}\ idle (\pct{90}\ utilized) system will have latency $10 T$, a \pct{1}\
> +	idle system (\pct{99}\ utilized) will have latency $100 T$, and so on.
> 
> , or similar.
> 
> In case you are wondering, the trailing "\" in "50\pct\" or "\pct{50}\"
> is needed to have a (normal width) space after it in the resulting document.
> This is the same as those custom macros such as \Power{}, \ARM{}, etc.
> 
> Do you have any preference between 50\pct\ and \pct{50}\ ?

Either works for me.

							Thanx, Paul

>         Thanks, Akira
> --
>  advsync/advsync.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/advsync/advsync.tex b/advsync/advsync.tex
> index 7342e323..31731f61 100644
> --- a/advsync/advsync.tex
> +++ b/advsync/advsync.tex
> @@ -458,11 +458,11 @@ largely orthogonal to those that form the basis of real-time programming:
>  	As a rough rule of thumb, latency increases as the reciprocal
>  	of the idle time.
>  	In other words, if a nearly idle system has
> -	latency $T$, then a 50\% idle system will have latency $2 T$, a
> -	10\% idle (90\% utilized) system will have latency $10 T$, a 1\%
> -	idle system (99\% utilized) will have latency $100 T$, and so on.
> +	latency $T$, then a 50\,\% idle system will have latency $2 T$, a
> +	10\,\% idle (90\,\% utilized) system will have latency $10 T$, a 1\,\%
> +	idle system (99\,\% utilized) will have latency $100 T$, and so on.
>  	This situation means that many latency-sensitive systems will
> -	actively limit load, for example, to 50\%.
> +	actively limit load, for example, to 50\,\%.
>  \item	In the not-uncommon case where a given computed result is nice
>  	to have rather than critically important, use of timeouts can
>  	cause a blocking operation to have non-blocking properties that
> -- 
> 2.43.0
> 
> 
