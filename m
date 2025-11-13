Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD3018D636
	for <perfbook@vger.kernel.org>; Thu, 13 Nov 2025 01:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762996560; cv=none; b=e55EW3Gj71t2xmxg5GYobazF6u7zBQoxbWNaloQ0elmsHiyElK5MvhB8IkS2ggCIfMVRmJFE3rUQqF/U76SUL31ep+q0heGfucgRltNZHEMoI8fjfg4Tdsbeu+o/uiIg56meeJFPceNwbBwoKOz8k9x4z754xbPSzfBK9o+vGeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762996560; c=relaxed/simple;
	bh=EJ8QNRFxHk5ZURXunn8dof0Yuy40aJERdAbeOilKFV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJERDVoDru+AB2LOP7pH71rEWu/iQAVnKh5f43PZDG3k/966stoWgO3Dsh2wpnvR2cNd/nRCfUWzxkhycp9+nblDjoALeKFTeyAfIIf9bdfk8VBZqVBfSwt7jFiep6nlgL/PI3++65XixbacMmbgF7DOEquMNHscrk/BxHZIH+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F31c2qP2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F31c2qP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAD7C4CEF1;
	Thu, 13 Nov 2025 01:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762996559;
	bh=EJ8QNRFxHk5ZURXunn8dof0Yuy40aJERdAbeOilKFV4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=F31c2qP2ZLhlr1Q5iS30HC9rcAkrSBAzR6hnVxZ2Cx02wJfe6t5V8Wq3R1ps/b2Sa
	 IJB1O0i41P+b8lMC3EOGBZkLSy97N1Ue86l1U79sHZtVRDvrKLj1BwwlMLQ3kRyn9g
	 sphM5Ql57xFVVNOdbQiDnCYbSLIZtgX4t+ZJndWLTW1YfM+8iZcAe7r/xfdwPSQCgQ
	 7GvoOA3vgkmhfVZWAFg4UXRSUGl2jV77P7V+UVVPvF307Av9Nxes85hYBcZnIZmGWv
	 LjooBBiRFrLWXfyDR4SaVYMNy+Ip/xoH/c900upGY2MNeaVanyw2zeD76UjPEUUX15
	 aTL0/YxmV8U2g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5B1B5CE0876; Wed, 12 Nov 2025 17:15:59 -0800 (PST)
Date: Wed, 12 Nov 2025 17:15:59 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] defer/hazptr: Fix markers of final qqz in a
 series for "nq" builds
Message-ID: <69a722b2-b833-4113-815c-2a14e7099e37@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <23edc53b-c087-45ce-a874-8142da4286fd@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23edc53b-c087-45ce-a874-8142da4286fd@gmail.com>

On Thu, Nov 13, 2025 at 09:19:29AM +0900, Akira Yokosawa wrote:
> Final one needs to be marked by the sequence of:
> 
>   \QuickQuizE{ ... }\QuickQuizAnswerE{ ... }\QuickQuizEndE
> 
> Fixes: e736a602fdcf ("defer/hazptr: Add steps to move from refctr to hazptr")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> This will remove extra "," in the box of "QQ 9.11, 9.12, 9.13," of
> "nq" builds.

What I get for doing perfbook while distracted!  Thank you for catching
and fixing this, and it is queued and pushed.

							Thanx, Paul

>         Thanks, Akira
> --
>  defer/hazptr.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/defer/hazptr.tex b/defer/hazptr.tex
> index 0fd63d78..22fca499 100644
> --- a/defer/hazptr.tex
> +++ b/defer/hazptr.tex
> @@ -398,10 +398,10 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
>  	operation needs a minimal number of hazard pointers.
>  }\QuickQuizEndM
>  %
> -\QuickQuizM{
> +\QuickQuizE{
>  	What needs to be done to convert reference-counted code to
>  	instead use hazard pointers?
> -}\QuickQuizAnswerM{
> +}\QuickQuizAnswerE{
>  	You will need to:
>  	\begin{enumerate}
>  	\item	Allocate and deallocate the hazard pointers,
> @@ -415,7 +415,7 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
>  	counters, there is no efficient and scalable way to determine
>  	precisely when the number of hazard pointers referencing a given
>  	data element has dropped to zero.
> -}\QuickQuizEndM
> +}\QuickQuizEndE
>  }
>  
>  On June 17, 2023, the ISO C++ Standards committee voted hazard pointers
> 
> base-commit: e736a602fdcf8ff57537b2f692a745eb331c74c8
> -- 
> 2.43.0
> 
