Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265EE3BC673
	for <perfbook@vger.kernel.org>; Thu, 12 Mar 2026 21:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773350146; cv=none; b=qj0f6h6Kk85A7xxeEM/EDwWUb6rovipgB5w6ig0ZmgQjEj3DJgWAFkKyR6DhUhCQve9dOkJ/g4T72sw6IFzLu7EIxZLoxMhAuPpgZ9pbR/h5WuWxRhV+j58X6dFtv/k3oePQUtMt8gnkbBTg9ufvpaJlBI0CxMnkkNizhlAXFcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773350146; c=relaxed/simple;
	bh=Jo+f4bbFp+RHs1u1h0u3lBo9iZ/PuRukM9hkEyMUWwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STSCC3k/CSkCPybPi3O7vUHl3XASPZBQQbwFWb1HwiiCOICRtIY2QzVIX1ZrY/7VbMZ0waGi4NqB1oOXBpxxwNF6rBcF8D/+ejAlYkBcPy5t0moauVXxhKWono7acDqN3t3xixqL0yyYfJf3On03SP3uGQ8QjhzQRFAqccCYhfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sv+OXtqU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sv+OXtqU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFC5C4CEF7;
	Thu, 12 Mar 2026 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773350145;
	bh=Jo+f4bbFp+RHs1u1h0u3lBo9iZ/PuRukM9hkEyMUWwM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Sv+OXtqUXa+P7l/jagsr3WHJGlyvw4a7OumnHd609NTbxY3U7tJgPE06fdp591WqV
	 lVWPbOYTVCoWpqG3CPu3YH9hlqzQqtEuGIhUk2FyrCzSHP5KmlgUb1V69MaQdE6KIf
	 3OqomvCR+JRnlGqc5hRON1imka8lJIGHqxJPs9aiQnEvuP9hqeDm3ipocLEmai3pDU
	 NiEatvPL+Rx6dSWMWt3lAKzMtYeuge9f9tg2ZwkL52mTzESmTIrc+avfIq3m6SBwC1
	 vy8RldYrtGTGrvPePZvP3J7XoTb9WfP6zt1lRaLt41ZaTWoNqxSpEp7OPQIP62/lRz
	 vo9n8Q7lcEbdQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 25BB1CE0A4E; Thu, 12 Mar 2026 14:15:45 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:15:45 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] memorder: Reconcile Figure 15.15 notation with W+RWC
 z-flow semantics
Message-ID: <3b1737db-2ac8-40b2-87a2-ea81f0ba0bc3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260311084813.969200-1-kunwu.chan@linux.dev>
 <15acbc05-3b54-4d9e-8a74-f763a990ba3f@paulmck-laptop>
 <f23e0457d77d509a58fd9ee6e4bef5aa7feed4cb@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f23e0457d77d509a58fd9ee6e4bef5aa7feed4cb@linux.dev>

On Thu, Mar 12, 2026 at 02:00:33AM +0000, Kunwu Chan wrote:
> March 11, 2026 at 10:39 PM, "Paul E. McKenney" <paulmck@kernel.org mailto:paulmck@kernel.org?to=%22Paul%20E.%20McKenney%22%20%3Cpaulmck%40kernel.org%3E > wrote:
> 
> 
> > 
> > On Wed, Mar 11, 2026 at 04:48:13PM +0800, Kunwu Chan wrote:
> > 
> > > 
> > > State explicitly that Figure 15.15 uses x as a schematic variable name, while the surrounding W+RWC analysis in Listing 15.18 follows the concrete z-flow (P2 -> z -> P1). This eliminates notation drift across cross-references and preserves propagation-argument fidelity.
> > >  
> > >  Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
> > > 
> > Again, good eyes, and thank you! I queued and pushed all three, and
> > added a fourth commit that converted this to a footnote and mentioned
> > both variables and the listing, shown below. Please check it to make
> > sure that I have not messed something up.
> > 
> >  Thanx, Paul
> > 
> Hi Paul,
> Checked — LGTM.
> The footnote conversion is the right call. It cleanly resolves 
> the Figure 15.15 x vs. W+RWC z notation mismatch.
> Thanks for landing this promptly.

And thank you for checking!

							Thanx, Paul

> Best, Kunwu
> 
> > > 
> > > ---
> > >  memorder/memorder.tex | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >  
> > >  diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > >  index 2357e7ea..8eb14a29 100644
> > >  --- a/memorder/memorder.tex
> > >  +++ b/memorder/memorder.tex
> > >  @@ -2760,6 +2760,8 @@ that \co{P1()}'s read from \co{z} happens much later in time, but
> > >  nevertheless still sees the old value of zero.
> > >  This situation is depicted in
> > >  \cref{fig:memorder:Load-to-Store is Counter-Temporal}:
> > >  +The figure uses \co{x} as a generic variable name for the same
> > >  +counter-temporal pattern.
> > >  Just because a load sees the old value does \emph{not} mean that
> > >  this load executed at an earlier time than did the store of the
> > >  new value.
> > >  -- 
> > >  2.25.1
> > > 
> > ------------------------------------------------------------------------
> > 
> > commit d2c790e9077625e2e28ee919619b4d18175c3665
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date: Wed Mar 11 07:34:07 2026 -0700
> > 
> >  memorder: Convert Figure 15.15 variable-x commentary to footnote
> >  
> >  Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > index 388903b6..4503c0a6 100644
> > --- a/memorder/memorder.tex
> > +++ b/memorder/memorder.tex
> > @@ -2759,9 +2759,10 @@ It therefore takes time for the effect of the \co{P2()}'s store to
> >  that \co{P1()}'s read from \co{z} happens much later in time, but
> >  nevertheless still sees the old value of zero.
> >  This situation is depicted in
> > -\cref{fig:memorder:Load-to-Store is Counter-Temporal}:
> > -The figure uses \co{x} as a generic variable name for the same
> > -counter-temporal pattern.
> > +\cref{fig:memorder:Load-to-Store is Counter-Temporal}:\footnote{
> > + The figure uses \co{x} as a generic variable name for the same
> > + counter-temporal pattern that uses the variable \co{z} in
> > + \cref{lst:memorder:W+RWC Litmus Test With Release (No Ordering)}.}
> >  Just because a load sees the old value does \emph{not} mean that
> >  this load executed at an earlier time than did the store of the
> >  new value.
> >
