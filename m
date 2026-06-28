Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF888368D6E
	for <perfbook@vger.kernel.org>; Sun, 28 Jun 2026 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782661633; cv=none; b=C4gYuL6MGCmMZBYrqJQ+Be5srISQzHQ5DJnbfhMDszgjHhqgXoR6UyhFb5l2wsufymrwAVlEd7xnpbYzDnXhcq7XhkMU7w3QTr/d7QR3l0PswfS8kS2mbQCSn2HMW3+NcILJNsg+YMTlmc9cXqyt4aT0rTU9UT5QGdKgUNCar0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782661633; c=relaxed/simple;
	bh=w3CiLEfp0GWKdHIfeT6Ba7muVvY4b3ebUmujd0hJ81g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5ibesPAqLlVehxxmfLihHJPp8RBRD8o1nCglWiMk7BtKVECRG68HpDqin0VeuhBzUTDVDPnyAqXNSNTSWY8AkhzWrJhZ5/uk8okytU8xEE86zGTzAln9phYUOadqb5fxzwM++UIQdSQitPphZCu4FliTLJpltnvHnS9uE4RTGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+Qlrpjg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+Qlrpjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E9A1F000E9;
	Sun, 28 Jun 2026 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782661629;
	bh=9ZWZAsMX4foxSV6eL2n3v895SlPnYObwBtJlfBKNIdQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=P+QlrpjgW5fDkCosrYm2eAtwg8WtwBo3HM4DqViU2byt4YXKpFdww+SKCRHZdWAbR
	 w1mOWBNSOjJ7wPHO76gkJKAqV0K3TX7VLqs/EImO1Givvs7DYJolKYByafCURqIodg
	 Lpc7qK4Unam6NPKw4uC5nBPha+HSMhIpnNKNuaN/PcKoB3YfgI/HuZC4kFc9cGyt7N
	 pqB3m17tJ4l1vkmsNO50Oi5blBozCmp6Yl+aTBnP0pZsMc0ib8gbVzTqhlP4nOhyAZ
	 0tqH9xt/IEpVc5srDwFXhzMrcsVlGntxaCocIO/kjE61M0RkKTENj2MFItR4k3TVP8
	 wbvQFq+WZ2mZw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E2115CE08B8; Sun, 28 Jun 2026 08:47:08 -0700 (PDT)
Date: Sun, 28 Jun 2026 08:47:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] toolsoftrade: Fix up conventions around
 VerbatimT
Message-ID: <8815f8c1-88b5-4f7c-9b74-eb85e0784ddf@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1c9d883c-fa79-44dd-ac4e-0278af17d0c9@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c9d883c-fa79-44dd-ac4e-0278af17d0c9@gmail.com>

On Sun, Jun 28, 2026 at 07:10:31PM +0900, Akira Yokosawa wrote:
> After the convention introduced in commit b29ee7777f33 ("Redefine
> line count format at the beginning of VerbatimT env"), redefine
> \myfvline in front of \begin{VerbatimT}.
> 
> This restores custom form of line counts in Listing 4.14 such
> as "A1", "B2", "C3", etc.
> 
> Remove \fvset{} which is now redundant as well.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Much better, queued and pushed, and thank you for bearing with me on
this one!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index d83e55f2..08efff11 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1487,24 +1487,19 @@ A short answer to this question is ``they lived dangerously''.
>  \begin{listing}[tb]
>  \begin{adjustwidth}{10pt}{5pt}
>  \footnotesize
> -\fvset{numbers=left,numbersep=5pt,fontsize=\scriptsize,frame=single,xrightmargin=5pt}
> -{\renewcommand{\theFancyVerbLine}{%
> -  {\rmfamily\tiny A\arabic{FancyVerbLine}}}
> +\renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
>  \begin{VerbatimT}
>  ptr = global_ptr;
>  if (ptr != NULL && ptr < high_address)
>  	do_low(ptr);
>  \end{VerbatimT}
> -}
>  Might be transformed to:
> -{\renewcommand{\theFancyVerbLine}{%
> -  {\rmfamily\tiny B\arabic{FancyVerbLine}}}
> +\renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
>  \begin{VerbatimT}
>  if (global_ptr != NULL &&
>      global_ptr < high_address)
>  	do_low(global_ptr);
>  \end{VerbatimT}
> -}
>  The compiler assumes normal variables do not spontaneously change,
>  the surrounding code  might use many machine registers, and this
>  transformation reduces register pressure.
> @@ -1513,14 +1508,12 @@ to \co{NULL} between lines~B1 and~B2 of the transformed code, the
>  two comparisons will be against different variables, possibly passing
>  \co{do_low} a \co{NULL} pointer.
>  Prevent this by using \co{READ_ONCE()} as follows:
> -{\renewcommand{\theFancyVerbLine}{%
> -  {\rmfamily\tiny C\arabic{FancyVerbLine}}}
> +\renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
>  \begin{VerbatimT}
>  ptr = READ_ONCE(global_ptr);
>  if (ptr != NULL && ptr < high_address)
>  	do_low(ptr);
>  \end{VerbatimT}
> -}
>  \end{adjustwidth}
>  \caption{Living Dangerously Early 1990s Style}
>  \label{lst:toolsoftrade:Living Dangerously Early 1990s Style}
> 
> base-commit: f7fdd691fd80b87b08719f1faad5059105712f37
> -- 
> 2.43.0
> 
