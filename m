Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230DF1C7B71
	for <perfbook@vger.kernel.org>; Tue, 27 Aug 2024 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724773765; cv=none; b=tTVK0J0wwlGIO1zVNHyRLOqVHNj2Cy0l8CZ57YWNQKm6mGieKi2lNzRhB/dlSWgsCAsZAx91lYKONogIzfarZeI5eWmLIaYn7gdF73PxBeebPdSx/sN7wJVapNmarodAkMPT62+bjgjVioNFt9Wxw+7lMSte48Ak40U2RpyCOBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724773765; c=relaxed/simple;
	bh=WABhRUh8Fg9J6vApyU2OB78WUHN8ZVW2QbBM6uusCGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4sU0VZifDfaQysmLQMDarjm+K8sOiGT1EWs57+hU1Gt13IyvBrLsGyxgUHNcvX1a88eC8hmxDRPC+LZrLpnUaWG2a/2QHwbKxqr19T6sVTTmXvIwdloZ7C6XLeufdgdwJGoZ8+xCdNP+4HlgX6/Yo0uMF2BUV7jGgwkcwkxvgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXwvoSEM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXwvoSEM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936C3C5688A;
	Tue, 27 Aug 2024 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724773763;
	bh=WABhRUh8Fg9J6vApyU2OB78WUHN8ZVW2QbBM6uusCGk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=WXwvoSEMpgwUp2VOEr3/m0ZozBoNSrdOz0TJH7XcY/rtsJs7t5k3KwnqIE1R1hIt9
	 VbZdFMQ5mb+Lx78smTPquTkN+jDfYgGsLv9RcEfI0KRS0AZZKCTHsyms0mP+5gBMvE
	 nfx4te+7dvRtq8KI42gAtZbG7L6ctxEFOZQ1/gVYOHUAyLBz8d4/uPt2rzv+KuOscP
	 Vm3uv1fqzK1npU4jkSVsLGlJ2iFMaPqRuYPcMhIsjo+KFpWXXdHnkdyrd1zGp5ISdk
	 aAjzz3if0FMj8w43qkxNVxESKZkHDNBXpNh7REPP0JBfnmacw7h2WuMovoSNAWNW6T
	 C4SpXsZjKgBUA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 332FFCE0FED; Tue, 27 Aug 2024 08:49:23 -0700 (PDT)
Date: Tue, 27 Aug 2024 08:49:23 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Leonardo Bras <leobras.c@gmail.com>
Subject: Re: New Figure 3.13 is too tall in -eb size builds
Message-ID: <f566b5cf-c7f4-41a5-9cab-e44b8d3eaacf@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <5974cbc2-3436-41bc-84a5-b7f1b22ab4a5@gmail.com>
 <c973c3a1-f321-417b-83e0-b5a4dc521857@paulmck-laptop>
 <59df9d95-9f8d-4eab-afd9-0552ed6f054b@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59df9d95-9f8d-4eab-afd9-0552ed6f054b@gmail.com>

On Wed, Aug 28, 2024 at 12:37:18AM +0900, Akira Yokosawa wrote:
> On Tue, 27 Aug 2024 04:02:32 -0700, Paul E. McKenney wrote:
> > On Tue, Aug 27, 2024 at 01:50:56PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> Leo's latest CI build of perfbook-eb.pdf failed as you can see at:
> >>
> >>     https://gitlab.com/linux-kernel/perfbook/-/jobs/7668105673
> >>
> >> This is because the new Figure 3.13, or cpu/SimpleWrite.svg, is
> >> optimized for -2c builds and too tall for -eb size.
> > 
> > Guilty to charges as read!  ;-)
> > 
> > And thank you for checking!!!
> > 
> >> A quick fix would be to shrink the figure for -eb builds,
> >> but that would result in a small diagram hard to read.
> > 
> > Agreed.
> > 
> >> Also, the new figure is not yet mentioned in the text.
> >>
> >> Furthermore, the corresponding enum list talks about
> >> CPU 0 doing a store, whose cache line is transferred from
> >> CPU 7's cache, while the figure presents a cache line transfer
> >> between CPU 1 and CPU 6.
> >>
> >> My guess is you are planning to adjust either of the list or the
> >> figure.
> > 
> > You got it!  I have pen-on-paper adjustments to the list, and to the
> > rest of the chapter.  I will get that done by the end of this weekend
> > at the latest.  And in a few minutes, I will be going to the gym with a
> > printout of Chapter 5 ("Counting") to review it, for updates, but mostly
> > to prepare for an upcoming talk at Kernel Recipes on counting.
> > 
> >> Tweaking the width of the figure can wait a while. I suppose.
> > 
> > How much shorter do I need to make it?  If a 20% reduction suffices
> > (which looks to be the case over here), I can simply reduce the amount
> > of space between rows.  If 30% is needed, I could reduce that space
> > further and shade alternating rows, like we currently do for some tables.
> > If more than that is needed, I could do a full-page-width figure with the
> > first half of the rows on the left and the remaining rows on the right.
> > Or split it into two figures, perhaps doing so only for -eb builds.
> > 
> 
> So, current version of the SVG has this dimension:
> 
> >    width="382.58057mm"
> >    height="819.60443mm"
> >    viewBox="0 0 382.58057 819.60443"
> 
> If you stick with the width of "3in" in the \resizebox,  reducing the
> height to less than "706.00mm" should make it fit in -eb builds.

Thank you!  So if I stick with the current width, I need a 16%
reduction in height.  Eminently doable.

> If you are thinking of changing the width as well, you need some
> math to keep the aspect ratio.  :-)

Indeed, if I reduce the width, then I must further reduce the height by
the same fraction.

> > For -2c builds, I am considering doing a 10-20% reduction in the space
> > between the blocks for the two CPUs, which would make the text easier
> > to read.  Maybe also embolden the fonts.
> > 
> > Or is there a better way to adjust this figure, for -eb as well as for
> > other builds?
> 
> I don't see the need of having multiple versions of the figure.
> There has been no figure which needs such special tweaks so far.
> An example of tall one is Figure 9.14, which looks reasonable in
> -eb builds.

Very good!

> Hope this helps, Akira

It does, and again, thank you!

							Thanx, Paul
