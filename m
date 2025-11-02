Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BEA20F08C
	for <perfbook@vger.kernel.org>; Sun,  2 Nov 2025 18:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762108631; cv=none; b=SA9Gaef/3oT3qK9TNd2RpstxuyGMoMWNuq1HKXY4Vq/K9FeXdFuX4v3iVswVDjALrxI5209nCCK/fn7ggxnjfqlWSgVkhDwz+b3jomkHkbYG+7BFUWW/tNaB9A20hWQy5pDEnqqwGlBNWJGvrMpmSyGu8ogUQV2yAr6+3/2NqjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762108631; c=relaxed/simple;
	bh=vzY0/AqlZbC6hDzZNhmvyM8g0QvqIZuNkehq/bIwScc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKxfJ8O6S4wF8rsntNuvQ5V8Ajh6ZpG5P6TDlj+WWqOHmIpg6sSMjE3JFudbxciRcsROwSPnhIBswNZ98g+pQbAscOeF9OjXYw1/A3vl/TIqWEx6BYLp5ROJnGq3OEbsgoY93omf1MtNMfWiaEJ1ofrK6GXD/7wjM2BgbHO2yao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHjAPr53; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHjAPr53"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C38EC4CEF7;
	Sun,  2 Nov 2025 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762108630;
	bh=vzY0/AqlZbC6hDzZNhmvyM8g0QvqIZuNkehq/bIwScc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=sHjAPr539CTmaWdJWdOBpzcOTK7NPkHHA33F0oErMI/1SQZ2Crh/FoqVWqYlxN01I
	 cpZwOKY2iP3nJTDEkogt8V59A7u3wY54SsngwU7qpmrZOzyIf1Ute3bK9fA/Rv+sf5
	 Bo8szSVYM7Z89fo0T2COmQkBqIKPbq//ZA7F7i39oIdsqREHq6s6UBt+vzBels7YMV
	 TDxU1mTc70Qz87N2KmKlAxW1kk+i3xcGk2kTkqVH/b7KVcPesxrXNWUddMz5b+JcAp
	 PT+nXpP3wJjNB6yAsurZNyccJIeLP1Af/OCP+7uksM8v+4tRGopjkuPxZ3rT4gtnXz
	 eVnVbUa56doNQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id EEC1FCE0F4C; Sun,  2 Nov 2025 10:37:09 -0800 (PST)
Date: Sun, 2 Nov 2025 10:37:09 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Philipp Stanner <stanner@posteo.de>
Cc: perfbook@vger.kernel.org
Subject: Re: Invalidate Queues violate cache coherence - what for?
Message-ID: <afd3499b-1d7e-44f3-8c39-db4dbaf7c2ae@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <2d8e81ccabae3a1d63d1c3df9e593c19f2043f50.camel@posteo.de>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d8e81ccabae3a1d63d1c3df9e593c19f2043f50.camel@posteo.de>

On Sun, Nov 02, 2025 at 04:18:48PM +0000, Philipp Stanner wrote:
> Hi Paul and all,
> 
> I've read through Appendix C "Why Memory Barriers". It helps greatly
> with understanding the overall problem. However, one part in particular
> confused me and seemed to contradict the previous subsections:
> 
> "However, the CPU need not actually invalidate the cache line before
> sending the acknowledgement." [1]
> 
> Well yes, I think it absolutely needs to. The previous examples relied
> precisely on this. What a CPU sending an Invalidate Message actually is
> saying is: "I will modify this cache line that you currently have read-
> only in your local cache. Once you sent me the Invalidate-ACK I know
> that you have invalidated it and I can safely modify it."
> 
> A CPU sending an Invalidate-ACK without actually having invalidated its
> cache line is, bluntly, lying and endangering the entire cache
> coherence.
> 
> Now don't get me wrong, I accept that this is obviously what is really
> happening. But the chapter got me to the point of interpreting a
> truthfull Invalidate-ACK as an essential part of cache coherence.

The following sentence was intended to help: "It could instead queue
the invalidate message with the understanding that the message will
be processed before the CPU sends any further messages regarding that
cache line."

But to your point, I can see where this paragraph could use some
improvement.  First, this is a hardware optimization and must be done
carefully.  Second, it is possible that the code (executing on the CPU
receiving the invalidation message) will execute some memory-ordering
instruction that absolutely requires the cache line be invalidated at
that point.  Alternatively, it is possible that early sending of the
invalidation message will require that further execution on that CPU
must be speculative.  Third, building on second, hardware can violate
the rules as long as software running on that hardware cannot tell
the difference.  Fourth, you are right that strict unoptimized MESI
would absolutely require that the cache line be invalidated prior to
acknowledging the invalidation.

> The previous section detailing the store-buffer, on the contrary, makes
> more sense: "Altough not owning this cache line yet, I can store my new
> value in the store buffer already because whatever the current value
> is, I will overwrite it anyways." whereas with the invalidate queue the
> reader just ignores that the variable might have changed.

Well, if the cacheline is in Modified or Exclusive state, then the
CPU must transition it to at least Shared (with extra state saying
"doomed" or some such).  Or not, given yet more protocol complexity.
If the CPU receiving the invalidation request knows that the CPU sending
that request doesn't care what the current value of the cacheline is,
then the receiving CPU can pretend that any stores happened before it
received the invalidation request.  Again, assuming that there are no
ordering instructions that prohibit this.

> I guess this is legal because the only real guarantee of CPUs is that
> one particular CPU sees all its accesses in order? But even then, as
> above, for store buffers it makes sense, because the storing CPU
> doesn't care about other values. The *reading* CPU sending the fake
> Invalidate-ACK, on the contrary, should very well care about reading
> the truthfull value from the cache line.

Also, different types of CPUs have different underlying ordering
guarantees.  And speculative execution can often ignore those guarantees
as long as it can avoid the user-visible state seeing any violations.  And
given multiple CPUs reading and modifying a given variable concurrently,
what exactly is the truthful value at any given point in time?
(Referring to Figure 15.10 ("A Variable With More Simultaneous Values").

> And if it all works like that, then what even is the point of
> Invalidate messages at all, if you can not rely on them being followed
> before you yourself start modifying the cache line?

Because they are needed for things like memory-ordering instructions
to work correctly.  But on a weakly ordered system, if there are no
memory-ordering instructions in the code, then there are precious few
memory-ordering guarantees anyway.  ;-)

> Or is the point that a CPU temporarily ignoring an Invalidate message
> can still validly (without memory barriers) use data in that cache line
> which does *not* get modified by the other CPU? So memory barriers in
> this scenario would allow for more efficiency by "segmenting" cache
> lines?

The point is mostly that on weakly ordered systems in the absence of
memory-ordering instructions, there are very few guarantees.  See again
Figure 15.10.

> Quite confusing. Parallel programming is hard and discussing it is one
> thing we can do about it :]

Agreed!!!

Do the explanations above help?  If so, I will rework that paragraph
with attribution.

							Thanx, Paul

> Thanks,
> Philipp
> 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git/tree/appendix/whymb/whymemorybarriers.tex#n1127
> 
