Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FF955C36
	for <perfbook@vger.kernel.org>; Mon, 19 Feb 2024 22:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708383558; cv=none; b=riRb+hEl1yQcOL2KSklvBeltMmrvrxdIzfgDmAmiKsLdtiSZJz+ZyBthdNg6FCNdHnwurFnC4L02b/ArAumhUH/1u6NgVDI20J+9xz3oeASocJyK8qbxbvdBKdMIUL9qqEoEohddfdHp3o7udwzNJOWUb2+nkCm3+UVYXfUPoHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708383558; c=relaxed/simple;
	bh=mMkzl6+afwny4XVmhxejXsC3pODWZNDQRu7KyspHZPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prY0jSko9GMBDxER3xjK4RMQNQGHP4IA4t0SytaW6lIYmsta4nfvnDty0h16MxHff1O7ePKPVTTX/ecSGQp86qzzlWBlz7KDH1wzFvkUiQEEPqmIdWVR2vjAKCj2aVg+NlFLBqaIjr2CxTOxYq3M1zExhcsPSvhfA3RfrfDb2qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3PFnL4+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3PFnL4+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0621FC433F1;
	Mon, 19 Feb 2024 22:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708383558;
	bh=mMkzl6+afwny4XVmhxejXsC3pODWZNDQRu7KyspHZPs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=X3PFnL4+0TCbRDoUkIfMaiNla3RyIi15BGYWxZlc5TK8LoPc0UwauQlkK7senwMe+
	 G2/Pnhb09/RK+E9uiIn/dUBw1/PxGz2i4j/XlDQ5QhM4BPzz3ADqd6v5Z2czJ6dSS4
	 rytSXwEyejcGbkO8uaDj+ibBkhYq5zPkFDFOEwXHakMO0pPpYdg+3gDal07TcVvcwF
	 78x8AfKzdnhGoCrQZM0l3VzKCcLRwriwPAHdfFFyZYJieS+1DVHkasCySdpCLKTmmr
	 YLdlNojihFEPWJJSN6VvQxLWeuOWtbQkm/Oowz8tONMJwlSqFBnFqU3IGD3m239xYI
	 2WK02yf75uMSQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 98585CE0D32; Mon, 19 Feb 2024 14:59:17 -0800 (PST)
Date: Mon, 19 Feb 2024 14:59:17 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] Cope with behavior change in newtxtext v1.738
Message-ID: <4f86cce8-ffa7-4016-98bb-dbd63379661e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <dc597d49-37f0-44de-ba7e-45abc3aa6e3f@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc597d49-37f0-44de-ba7e-45abc3aa6e3f@gmail.com>

On Mon, Feb 19, 2024 at 08:56:40PM +0900, Akira Yokosawa wrote:
> Recently, newtxtext's behavior of sans-serif font setting has become
> unstable and the option helvratio stopped working as of newtxtext
> v1.738.
> 
> As a workaround, load tgheros.sty provided by the tex-gyre package
> before loading newtxtext with the same scaling facter which works
> with previous versions of newtxtext.
> 
> Do similar changes in pstricks figures under SMPdesign/ which use
> sans-serif font only.
> 
> Note:
> newtxtext's main feature is to provide improved Times Roman clone based
> on TeX Gyre Termes.  The author of newtxtext doesn't pay much attention
> on sans-serif font behavior, it seems, and has made v1.738 and later
> respect default sans-serif font at the time of loading newtxtext.sty.
> 
> Changelog in newtx's README [1] reads:
> 
> Changes in version 1.738
> 1. Documentation updated for newtx.sty usage.
> 2. Modified newtx.sty and newtxtext.sty to ensure that default effects
>    of \mathsf and \mathtt are the same in both cases, and to ensure that
>    in both, the prior loading of a sf or tt text font would result in
>    those being used for \mathsf, \mathtt without any further interventions.
> 
> Link: [1] https://mirrors.ctan.org/fonts/newtx/README
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued, thank you very much!

Some of these packages do seem to take some keeping up with, and thank
you for doing that.

							Thanx, Paul

> ---
>  SMPdesign/DiningPhilosopher4part-b.tex | 2 +-
>  SMPdesign/DiningPhilosopher5.tex       | 2 +-
>  SMPdesign/DiningPhilosopher5PEM.tex    | 2 +-
>  SMPdesign/DiningPhilosopher5TB.tex     | 2 +-
>  perfbook-lt.tex                        | 1 +
>  5 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/SMPdesign/DiningPhilosopher4part-b.tex b/SMPdesign/DiningPhilosopher4part-b.tex
> index 2d1c307e..c004aa14 100644
> --- a/SMPdesign/DiningPhilosopher4part-b.tex
> +++ b/SMPdesign/DiningPhilosopher4part-b.tex
> @@ -5,7 +5,7 @@
>  \usepackage{pst-eps}
>  \usepackage{multido}
>  \usepackage{calc}
> -\usepackage[helvratio=0.9]{newtxtext}
> +\usepackage[scale=0.9]{tgheros}
>  \renewcommand{\familydefault}{\sfdefault}
>  
>  \begin{document}
> diff --git a/SMPdesign/DiningPhilosopher5.tex b/SMPdesign/DiningPhilosopher5.tex
> index a892f11b..9b471f70 100644
> --- a/SMPdesign/DiningPhilosopher5.tex
> +++ b/SMPdesign/DiningPhilosopher5.tex
> @@ -5,7 +5,7 @@
>  \usepackage{pst-eps}
>  \usepackage{multido}
>  \usepackage{calc}
> -\usepackage[helvratio=0.9]{newtxtext}
> +\usepackage[scale=0.9]{tgheros}
>  \renewcommand{\familydefault}{\sfdefault}
>  
>  \begin{document}
> diff --git a/SMPdesign/DiningPhilosopher5PEM.tex b/SMPdesign/DiningPhilosopher5PEM.tex
> index 55db3773..4c77f482 100644
> --- a/SMPdesign/DiningPhilosopher5PEM.tex
> +++ b/SMPdesign/DiningPhilosopher5PEM.tex
> @@ -5,7 +5,7 @@
>  \usepackage{pst-eps}
>  \usepackage{multido}
>  \usepackage{calc}
> -\usepackage[helvratio=0.9]{newtxtext}
> +\usepackage[scale=0.9]{tgheros}
>  \renewcommand{\familydefault}{\sfdefault}
>  
>  \begin{document}
> diff --git a/SMPdesign/DiningPhilosopher5TB.tex b/SMPdesign/DiningPhilosopher5TB.tex
> index c2015991..259d0f0f 100644
> --- a/SMPdesign/DiningPhilosopher5TB.tex
> +++ b/SMPdesign/DiningPhilosopher5TB.tex
> @@ -5,7 +5,7 @@
>  \usepackage{pst-eps}
>  \usepackage{multido}
>  \usepackage{calc}
> -\usepackage[helvratio=0.9]{newtxtext}
> +\usepackage[scale=0.9]{tgheros}
>  \renewcommand{\familydefault}{\sfdefault}
>  
>  \begin{document}
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index 7c4ad53a..fd598a56 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -14,6 +14,7 @@
>  % A more pleasant font
>  \usepackage[full]{textcomp} % use symbols in TS1 encoding
>  \usepackage{lmodern}
> +\usepackage[scale=0.9]{tgheros}
>  \usepackage[T1]{fontenc} % use postscript type 1 fonts
>  \usepackage[table,svgnames]{xcolor} % newtxtext v1.73 loads xcolor without options
>  \usepackage[defaultsups,helvratio=0.9]{newtxtext} % use nice, standard fonts for roman
> 
> base-commit: b0f4bfe76079bd952351ccd925832b161889e0ae
> -- 
> 2.34.1
> 
