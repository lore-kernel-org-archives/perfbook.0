Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30C1F16B
	for <perfbook@vger.kernel.org>; Mon,  2 Mar 2026 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772475565; cv=none; b=VARtXvtDOC6Z/N7unCchMSHbAAkOy6P1XgO5wgHq/ZxMZRITxi+KYMvq9UgT70mgWQeptnZeBtOQI+x0Tqthm1m5Vj6qm/+QvwGFVNC36kArm0EajT2WND/7xp3glLuqSVbfEDGIiYDpBalWimUwH8v/KmV17/Pc8FB21j5wzcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772475565; c=relaxed/simple;
	bh=TC2wFubqtjGbt27SiM28S6HAQADIAQNSv8C2npnWJMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtlOfXnlzCEnfagiAAuE8d+MvMW3ArIfJ19E7gSRtQvlkZUO2iGbGCDmZg9+yZHsEluTCuZkBqpMFlTRI8IrOhOfcXALHUlXpb1MbB9PXcK7qsSmobvkVmsC688PyaYdrlfzx2FKeAIqdMHGBCYBFxpps6o0oFmHX6aNy+RD2+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bd4zZhnu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bd4zZhnu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B433DC19423;
	Mon,  2 Mar 2026 18:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772475564;
	bh=TC2wFubqtjGbt27SiM28S6HAQADIAQNSv8C2npnWJMo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=bd4zZhnuSaza6apqJtnRtc37zgaL8taXstkAiI3pCgwvM9RvW5twNCQkAkl0g/yFD
	 JABMR4ZQmGbfwn0BzY70wy1YfD6BnZbp8f8Gs+Ak7KxoAi4QKv81uSi3/Q1oMWPMOk
	 /NegNw8bPjkh3fY5fGzXS6CmivKqWnkiW3uP8i6dIwM8gUC/8UpZtjRu/D1o0u30gE
	 f1GUz8y9Mv2rctLTyk7ACM5HqJkC4msFbk6EmC7owaj610F3ArF5/W/YKpjQQI5F9d
	 Y/no/MCol3q1MJ9msZPCoVhkYOKahDaDPZnGa3GRjpk3uSHjl342vtAARzR/F+weNP
	 HVtRwqkMCzx7g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 22E3CCE0D19; Mon,  2 Mar 2026 10:19:24 -0800 (PST)
Date: Mon, 2 Mar 2026 10:19:24 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/7] 2026 March updates
Message-ID: <38c79ecc-1ba5-4ebc-8c77-1aea8496eab4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>

On Mon, Mar 02, 2026 at 06:16:40PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Here are updates for March from me.
> 
> Patch 1/7 is the regular one.
> Patch 2/7 takes care of legends' position in the plot.
> Patches 3/7 -- 6/7 are aesthetic improvements here and there.
> 
> Patch 7/7 retouches recently added Figure 2.6.
> I'm not sure on this one, but I thought this might be closer to what
> you had in mind.

All very good, thank you very much!!!

The new Figure 2.6 does an excellent job of showing less overall
work needed for a given amount of forward progress with coarser
synchronization.

Queued and pushed.

							Thanx, Paul

> Thanks, Akira
> --
> Akira Yokosawa (7):
>   CodeSamples/formal: Update rcu-test.dat for v6.19
>   formal: rcu-test-ratio: Adjust legends' position
>   Give page number counts room on TOC pages in -1c builds
>   defer/rcuapi: Tweak column widths for long APIs
>   Adjust page header/footer widths for tweaked textwidths
>   Define pagestyle (of titlesec) for section-less appendix
>   intro/coarsen.svg: Tweak size of squares and use nuanced colors
> 
>  CodeSamples/formal/data/plot.sh      |    3 +-
>  CodeSamples/formal/data/rcu-test.dat |    3 +-
>  defer/rcuapi.tex                     |   16 +-
>  intro/coarsen.svg                    | 1403 +++++++++++---------------
>  intro/intro.tex                      |    2 +-
>  perfbook-lt.tex                      |   45 +-
>  6 files changed, 627 insertions(+), 845 deletions(-)
> 
> 
> base-commit: ed21d3a85560e4e4088f55c19f860b040a805bd2
> -- 
> 2.43.0
> 
