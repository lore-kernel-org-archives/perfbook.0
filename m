Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA032A47
	for <perfbook@vger.kernel.org>; Tue,  6 Aug 2024 04:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722917760; cv=none; b=XvMo9nJPcJTX/uIqlZimOPR0vV5n8V3DQC1oHM2udQ4dzbuQWC4Yphl33t2hoF1TQuVNgbGSul1zq+HK1eimi5tV9QTV9MyX3UUmJW2fPjsw7UZikqm1w8mpIjAfm6a94EK0YqLOtuDerHURGkQvA77aDJxhK0AskENL0zTIvBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722917760; c=relaxed/simple;
	bh=44jDZ0QVYF5mOYDkxPIJ3LQbdTmMTeerU7uDCHpczXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jz0xoP0CmGXxITUO1JjJZ/Ki/xB0+h2ZYcmySoLXeCi4k5YPmxqdS7IgHEVx94038XUYU4DblPN49sqGlqAtBvZsSVm8SZHtLjMFkEyJVwLyozD9Z0IUc1X1GqbGNoJr99JKaxyLncYqydU/9kGo1gMkHpK7TGh/CuSC2m7WYsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q28foaIg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q28foaIg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6A7C32786;
	Tue,  6 Aug 2024 04:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722917760;
	bh=44jDZ0QVYF5mOYDkxPIJ3LQbdTmMTeerU7uDCHpczXE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Q28foaIgWCD0sa7FOz/sG62SBh0Rhjn0a1xx9vVOYBiA7qK2sJNEHaQ7nqgMKkybH
	 qCcw/AxGkoFX160t9SGLarPHy8rP8lGnGVvs66r1MLIq5hWwunY0Cl+tN4hHoDxoLK
	 hsxGBQcZZZI/ECRNNFRq9BY9q5bQy40kQk3pyjupgSJw5+iGTidXiGB+b1X2uaFfMg
	 1dXrc8iHZN3E+q3r91vqZMCCBaVt+MhhqPuwwx4Dbi9wZ7HEXbIPgHq0EpynjJ/mY9
	 ZVVnjGabF617Wht66hYfFX2I3Nh1A19bfKCtuNPFs34fzux1bJ511Tm+QRZWniUaVE
	 EZWExtbsVWkJQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E3409CE10CC; Mon,  5 Aug 2024 21:15:59 -0700 (PDT)
Date: Mon, 5 Aug 2024 21:15:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] whymb: Tweak width of Table C.1 for -eb
 builds
Message-ID: <b04fe27f-5869-4320-bfd8-1f63f4f51b9a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f7f4e7b0-9843-42d3-b79f-3d18404140cc@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7f4e7b0-9843-42d3-b79f-3d18404140cc@gmail.com>

On Tue, Aug 06, 2024 at 01:03:12PM +0900, Akira Yokosawa wrote:
> Commit ffdab3a2e986 ("whymb: Show "permissions" misses in C.1")
> made Table C.1 too wide for -eb builds.
> 
> Add \ebresizewidth{ ... } around the table.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes!  Queued, thank you!

							Thanx, Paul

> ---
>  appendix/whymb/whymemorybarriers.tex | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index e5b16677..01c6a703 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -562,6 +562,7 @@ are up to date (``V'') or not (``I'').
>  \begin{table*}
>  \small
>  \centering
> +\ebresizewidth{
>  \renewcommand*{\arraystretch}{1.2}
>  \rowcolors{6}{}{lightgray}
>  \begin{tabular}{lclcccccc}
> @@ -602,6 +603,7 @@ are up to date (``V'') or not (``I'').
>  				& $-$/I & 0/S   & 0/S   & $-$/I   & I & V \\
>  	\bottomrule
>  \end{tabular}
> +}
>  \caption{Cache Coherence Example}
>  \label{tab:app:whymb:Cache Coherence Example}
>  \end{table*}
> 
> base-commit: 61d5f16b87eeee8897af56f5e083b464919161f8
> -- 
> 2.34.1
> 
