Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D39F9EC
	for <perfbook@vger.kernel.org>; Sun,  2 Nov 2025 21:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762118413; cv=none; b=t0WlhfaooB6omrVBRWUAropq2j2s3xkoUbTocM+f6lQMBvh3TI7qQn250YcCxGvIW42LokxdKuvXBpVwbz2fP2hUbydJelCAW15As4NghTyIsOR1qSrs8ft85vcKC3DU+Q03IYPCSCl7Mupzgcxu0kbCTnofDPg9/nXVckt9Ys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762118413; c=relaxed/simple;
	bh=hTlUHrWIYRDfz6DPfqH4g2EnAq1yLjpW139FV7y0WIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMrdQEcxbeFyFDSqoVkQn8usL1HmsZop71JL24QPHysZmX4wUF9PSk3bDDefj3nWhdSCTTYjLnNlQ28cM2I2uQIEWTRhhJxFazcYXrCfUgw1mfL0nEMMA6KnPrpjE551drzBGoUwVu23JvqNKbqwOuRXRcJcqgHFllzs+a0Xd3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sywHz4DY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sywHz4DY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FD9C4CEF7;
	Sun,  2 Nov 2025 21:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762118412;
	bh=hTlUHrWIYRDfz6DPfqH4g2EnAq1yLjpW139FV7y0WIc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=sywHz4DYoVpQ6ZsJafRthZiDs1E1DBlsxQ2kjmeYsu21jJFNr5zdmy3CrKoxpsJD9
	 R1Oi1OloQeHnjFMCuRhxK2fISHf3U9A4FjQf3YynPDzMTHpi06RBj2+v7w8VIN/Wh7
	 89aam3WR6+HJsFCBm9DsKkhsrmjhi5jGRF1r6SLnA6CMOy1S61bO9GvnHWsvnGLffZ
	 5kcQ11NeP9KssM1xlb+HZiCINRaTK9LSTHT0gz4xNwYHDk0zVUPiPT7tzfaD9s6NTn
	 KFsADege4+zC8JFWPCJSuuafIopbKfz0nJDfBNbJxDpTt0ouUc7FoV2cS1ARkSPDzc
	 3voDywfGQY4kg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8FD17CE0F4C; Sun,  2 Nov 2025 13:20:11 -0800 (PST)
Date: Sun, 2 Nov 2025 13:20:11 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Philipp Stanner <stanner@posteo.de>
Cc: perfbook@vger.kernel.org
Subject: Re: Invalidate Queues violate cache coherence - what for?
Message-ID: <a60e5a31-a39e-4b7b-84e0-e13ded0696be@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <2d8e81ccabae3a1d63d1c3df9e593c19f2043f50.camel@posteo.de>
 <afd3499b-1d7e-44f3-8c39-db4dbaf7c2ae@paulmck-laptop>
 <8097900a96063034e0ca89b6174be03bec8a0cd3.camel@posteo.de>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8097900a96063034e0ca89b6174be03bec8a0cd3.camel@posteo.de>

On Sun, Nov 02, 2025 at 08:05:24PM +0000, Philipp Stanner wrote:
> On Sun, 2025-11-02 at 10:37 -0800, Paul E. McKenney wrote:
> > On Sun, Nov 02, 2025 at 04:18:48PM +0000, Philipp Stanner wrote:
> > > 
> 
> […]
> 
> > > 
> > > "However, the CPU need not actually invalidate the cache line before
> > > sending the acknowledgement." [1]
> > > 
> > > Well yes, I think it absolutely needs to. The previous examples relied
> > > precisely on this. What a CPU sending an Invalidate Message actually is
> > > saying is: "I will modify this cache line that you currently have read-
> > > only in your local cache. Once you sent me the Invalidate-ACK I know
> > > that you have invalidated it and I can safely modify it."
> > > 
> > > A CPU sending an Invalidate-ACK without actually having invalidated its
> > > cache line is, bluntly, lying and endangering the entire cache
> > > coherence.
> > > 
> > > Now don't get me wrong, I accept that this is obviously what is really
> > > happening. But the chapter got me to the point of interpreting a
> > > truthfull Invalidate-ACK as an essential part of cache coherence.
> > 
> > The following sentence was intended to help: "It could instead queue
> > the invalidate message with the understanding that the message will
> > be processed before the CPU sends any further messages regarding that
> > cache line."
> 
> So it can refuse to invalidate the cache line as long as it only keeps
> it in its current state, the "worst damage" being that the CPU reads
> potentially outdated data?
> 
> > 
> 
> […]
> 
> > Fourth, you are right that strict unoptimized MESI
> > would absolutely require that the cache line be invalidated prior to
> > acknowledging the invalidation.
> 
> My understanding of that chapter is that classic MESI needs little
> memory barriers, but store buffers and invalidate queues inform the
> necessity for wmb() and rmb(), respectively.

You still need full barriers for things like the LB pattern, but
yes, classic MESI has less room for mischief than more elaborate
cache-coherence protocols.

> > > The previous section detailing the store-buffer, on the contrary, makes
> > > more sense: "Altough not owning this cache line yet, I can store my new
> > > value in the store buffer already because whatever the current value
> > > is, I will overwrite it anyways." whereas with the invalidate queue the
> > > reader just ignores that the variable might have changed.
> > 
> > Well, if the cacheline is in Modified or Exclusive state, then the
> > CPU must transition it to at least Shared (with extra state saying
> > "doomed" or some such).  Or not, given yet more protocol complexity.
> > If the CPU receiving the invalidation request knows that the CPU sending
> > that request doesn't care what the current value of the cacheline is,
> > then the receiving CPU can pretend that any stores happened before it
> > received the invalidation request.  Again, assuming that there are no
> > ordering instructions that prohibit this.
> 
> I'm losing track why MESI even exists in the first place, to be honest.
> I had thought it's about guaranteeing that a given cache line can only
> have one value at a given time; but it seems protocols like that are
> more about getting a cache line at all, sooner or later, and every
> ordering must be ensured by the instructions.
> 
> This might seem strange or trivial to you.. I guess the crucial point
> is my (false?) understanding of the Invalidate message serving to
> guarantee that the receiver will see the sender's update of the cache
> line. And it will see that update, just too late…
> 
> So the invalidate ack message is interpreted as a hard, reliable
> synchronization point.

If you were to go back to 1983 when MESI was first described, then
microprocessor CPUs simply did not have enough electronics to get into
too much trouble, so at that time, you would be right that you didn't
need much more on top of MESI.  Here in 2025, CPUs are very strange and
complex beasts.  But to be fair, they don't cause anywhere near as much
confusion as optimizing compilers.

> > > I guess this is legal because the only real guarantee of CPUs is that
> > > one particular CPU sees all its accesses in order? But even then, as
> > > above, for store buffers it makes sense, because the storing CPU
> > > doesn't care about other values. The *reading* CPU sending the fake
> > > Invalidate-ACK, on the contrary, should very well care about reading
> > > the truthfull value from the cache line.
> > 
> > Also, different types of CPUs have different underlying ordering
> > guarantees.  And speculative execution can often ignore those guarantees
> > as long as it can avoid the user-visible state seeing any violations.  And
> > given multiple CPUs reading and modifying a given variable concurrently,
> > what exactly is the truthful value at any given point in time?
> > (Referring to Figure 15.10 ("A Variable With More Simultaneous Values").
> 
> Argh.

Quite!

> There is this famous quote from a famous book, where the roman governor
> asks:
> 
> "What is truth?"

It also figured in a Johnny Cash (not cache!) song from 1970.  ;-)

> > > And if it all works like that, then what even is the point of
> > > Invalidate messages at all, if you can not rely on them being followed
> > > before you yourself start modifying the cache line?
> > 
> > Because they are needed for things like memory-ordering instructions
> > to work correctly.  But on a weakly ordered system, if there are no
> > memory-ordering instructions in the code, then there are precious few
> > memory-ordering guarantees anyway.  ;-)
> > 
> > > Or is the point that a CPU temporarily ignoring an Invalidate message
> > > can still validly (without memory barriers) use data in that cache line
> > > which does *not* get modified by the other CPU? So memory barriers in
> > > this scenario would allow for more efficiency by "segmenting" cache
> > > lines?
> > 
> > The point is mostly that on weakly ordered systems in the absence of
> > memory-ordering instructions, there are very few guarantees.  See again
> > Figure 15.10.
> 
> Is the store buffer the exact equivalent of the invalidate queue, or is
> the latter "more evil" as to my explanations above?
> 
> I'd say:
>  * The store buffer allows the CPU to ignore that it should (in an
>    ideal, performant world) store this  _right_now_, only caring about
>    _itself_ seeing the stores in order, ignoring that the other CPU
>    should see it _now_ (or before that other, subsequent store in the
>    example).
>  * The invalidate queue allows a CPU to keep its read-only cacheline,
>    ignoring that it might get updated _right now_, ignoring the other
>    CPU's store, only caring about its own previous stores / reads (or,
>    more simple: relying on the fact that the cache line had been r-o so
>    far)
> 
> Still, the latter seems less wise to me.

As to which is "more evil", I suspect that this depends on the fertile
imaginations of hardware architects and designers.  Much also depends
on one's expectations of orderliness.  And in CPUs, as in real life,
additional orderliness comes at a price.  At any given point, is the
price worth it?  Choose wisely!  ;-)

> > > Quite confusing. Parallel programming is hard and discussing it is one
> > > thing we can do about it :]
> > 
> > Agreed!!!
> > 
> > Do the explanations above help?  If so, I will rework that paragraph
> > with attribution.
> 
> Well, yes, the reminder of there being no "true value" anyways helps
> and reminds about why barriers exist.
> 
> But in fact, the question about the Invalidate message just being
> temporarily *ignored and falsly answered* seemed so obvious to me that
> I was searching for the Quick Quiz that would answer it, but there was
> none :(
> 
> Something like that would sound very paul-ish to me:
> 
> " Quick Quiz:
> But wait! Wasn't the entire point of the invalidate-ack message to
> assure the receiver that it's now safe to modify the cache line without
> there being readers of the old data left? How can the CPU possibly get
> away with falsly claiming it has invalidated the cache line?
> "
> 
> I think that would help. Or rather: the answer would help.

Thank you very much!  I was going to just expand that paragraph, but
you are right, a Quick Quiz would work much better.

							Thanx, Paul

> Regards
> P.
> 
> 
> > 
> >  Thanx, Paul
> > 
> > > Thanks,
> > > Philipp
> > > 
> > > 
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git/tree/appendix/whymb/whymemorybarriers.tex#n1127
> > > 
> 
