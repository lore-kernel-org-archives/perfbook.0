Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C02AB674
	for <perfbook@vger.kernel.org>; Tue, 27 Aug 2024 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724756553; cv=none; b=N4ALGtXS6EvlesynAMWHKt/gylMrQBX5Wygvjyy1TP7YwL3/yaEsMzkeSXAwSQg/QRXcraqZqlePBVWi8FW3XZFHj5QoyYhZg9+Zkca8TMI/Z+FMa3jcSV4lgH4DUqsqNNLg8eT5MMT8WoasuZ347lMELQ64gEjTxLhJV/m3eFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724756553; c=relaxed/simple;
	bh=rsF01ayoEiW818xcZ77FmDIfTt93bvvyiV9uYAmXliQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IF7cr20O8Eb5fUuM/YZgzyo54EwAIVLAPZX3Zy4IOnLaMl9Fbktt66E/OclJmtp/kR2pS8rkZs99vl/sA6f8aVih4CIfioG9y9YByjC9QFGFizW+dH8WoMFlBAqNLkZlWp7O+v03ZXDkXjGJzuDngR6aNq7DVzwBFWsU/yTD/II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsyKH2dn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsyKH2dn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860E9C8B7A4;
	Tue, 27 Aug 2024 11:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724756552;
	bh=rsF01ayoEiW818xcZ77FmDIfTt93bvvyiV9uYAmXliQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=HsyKH2dnOrHdt9iPw9Gjem9jQzQr9hDqPVifzxmnFe7V4GHawzr//qJEI1wdFShPA
	 G1jl1Rzj2/IR3MH/TXc+gYnLVyvC5/5NG3TMASjXjA922zdF7uvFlfHy1qAR9NvoXc
	 q/EGHxrc/VnV5NEIjkmbfe2z1FqsBTeqSej7QIv1NimwDSo4DzCVjU+3h1rn4gaekq
	 hokOLgkv7LLIJdCeQHg4S2Mwn544Y5DHOIS4fhRF6XPS+TLCNk6zlxlNnP5cQneemu
	 u8/YehzN4iU145caKI/aMaDTdZa+Dajzjb54ZrGoAgcJtgekI61BVpDiCQGdh6CV11
	 92Q9/b8hMIFww==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 283DDCE1257; Tue, 27 Aug 2024 04:02:32 -0700 (PDT)
Date: Tue, 27 Aug 2024 04:02:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Leonardo Bras <leobras.c@gmail.com>
Subject: Re: New Figure 3.13 is too tall in -eb size builds
Message-ID: <c973c3a1-f321-417b-83e0-b5a4dc521857@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <5974cbc2-3436-41bc-84a5-b7f1b22ab4a5@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5974cbc2-3436-41bc-84a5-b7f1b22ab4a5@gmail.com>

On Tue, Aug 27, 2024 at 01:50:56PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Leo's latest CI build of perfbook-eb.pdf failed as you can see at:
> 
>     https://gitlab.com/linux-kernel/perfbook/-/jobs/7668105673
> 
> This is because the new Figure 3.13, or cpu/SimpleWrite.svg, is
> optimized for -2c builds and too tall for -eb size.

Guilty to charges as read!  ;-)

And thank you for checking!!!

> A quick fix would be to shrink the figure for -eb builds,
> but that would result in a small diagram hard to read.

Agreed.

> Also, the new figure is not yet mentioned in the text.
> 
> Furthermore, the corresponding enum list talks about
> CPU 0 doing a store, whose cache line is transferred from
> CPU 7's cache, while the figure presents a cache line transfer
> between CPU 1 and CPU 6.
> 
> My guess is you are planning to adjust either of the list or the
> figure.

You got it!  I have pen-on-paper adjustments to the list, and to the
rest of the chapter.  I will get that done by the end of this weekend
at the latest.  And in a few minutes, I will be going to the gym with a
printout of Chapter 5 ("Counting") to review it, for updates, but mostly
to prepare for an upcoming talk at Kernel Recipes on counting.

> Tweaking the width of the figure can wait a while. I suppose.

How much shorter do I need to make it?  If a 20% reduction suffices
(which looks to be the case over here), I can simply reduce the amount
of space between rows.  If 30% is needed, I could reduce that space
further and shade alternating rows, like we currently do for some tables.
If more than that is needed, I could do a full-page-width figure with the
first half of the rows on the left and the remaining rows on the right.
Or split it into two figures, perhaps doing so only for -eb builds.

For -2c builds, I am considering doing a 10-20% reduction in the space
between the blocks for the two CPUs, which would make the text easier
to read.  Maybe also embolden the fonts.

Or is there a better way to adjust this figure, for -eb as well as for
other builds?

							Thanx, Paul
