Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A921A199931
	for <perfbook@vger.kernel.org>; Sat,  5 Apr 2025 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743874267; cv=none; b=XU6GMDXzj1wLJU2gsq5beaQMiIAu1hRWZXNLBfg/HOL1YI6X8P3f62j2cxKawCjNhKQUQiE40aRc5TTdVdnwPMR8XR3f44hB2uRB5a6QXIL6oJsIPZjSuw0x8naEXBEwTBtpDx/12NC9aUmhl0VtCZXABzmZ/nCnMwVuFuQ/PFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743874267; c=relaxed/simple;
	bh=GUSIQC6uCgxVN5Qf/jAxvq3dEnUvktNDXSivEw0L1X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUYF0mtibZzxiZpGXKOyTa6lu05Ey3kP4CS/oDVrkMWAHdylr94etLUKFgv8qZOkTIXicJYT2QFaHiVcYu4SQ+5pK5TMZoZWA+l1i4hZbPah6ya1QBrnjgYsEhIEnDZUt3PcrSijEo04u9BAHq0iC1MvoiTSVsyDnNuIbExyu2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nchatAUH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nchatAUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B163C4CEE7;
	Sat,  5 Apr 2025 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743874267;
	bh=GUSIQC6uCgxVN5Qf/jAxvq3dEnUvktNDXSivEw0L1X0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=nchatAUHgkjMKpsDAGVB4PZwgywnF0u/7op6BpDRNfYOxtngMyCjNyPFxaWFw4opz
	 mCgfLRDMapOLWakZf/75sqnVw7GBksnUkDiymhAEqDoiRVtj3oe9it/KR3kryAc4YY
	 ++CS2JBP/HDSkrJoOD/FAI5gjAltoYwAoE6DyzOqgNzZWX0T011ZvVvpazny/F6ClJ
	 S4QygzjDB2i+HxUuPXMdT5G9vtu4sVrnGuHMvzaxZNnbDS4Tk/jcaf4LND4nE4ONPt
	 yqcQg1iG9fxMwXYUrr48/Up3WB6tCs14WNsHMZdOlpIjvVxqPnyabJBWX6PVJi2S8F
	 /xqA89JVm54EA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AB74DCE0565; Sat,  5 Apr 2025 10:31:06 -0700 (PDT)
Date: Sat, 5 Apr 2025 10:31:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] CodeSamples/formal: Update rcu-test.dat
 for v6.14
Message-ID: <144a51ee-1bf5-47f8-8a5c-cd8805fa8278@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <775f9284-0768-4510-a5a5-1b46f4369e93@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <775f9284-0768-4510-a5a5-1b46f4369e93@gmail.com>

On Sat, Apr 05, 2025 at 05:58:17PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed both, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/data/rcu-test.dat | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index acb29ae2..33a66ac8 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -101,3 +101,4 @@ v6.8  22018 12071 34089 35.4
>  ""    22676 12095 34771 34.8
>  v6.12 22834 12313 35147 35.0
>  ""    22961 12414 35375 35.1
> +v6.14 22107 12620 34727 36.3
> 
> base-commit: 0b760b3c35bfc8fb544c9bfa9e14b3bfc6a52998
> -- 
> 2.34.1
> 
