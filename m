Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FACDAD4B
	for <perfbook@vger.kernel.org>; Sun,  2 Nov 2025 20:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762113930; cv=none; b=YxIgD2uJOKfVjs+tGeQBaykbZKdEFHUJFqJJ/Gotmrp9a9jO5izqK9XXVANflBLin59DfTzKbKXBEhVPacsPJB5KZyBLf1AaDg1CwWF2XWZyKZsBTto/xlwBihf0V519DnUpoe74gKiGW80fqI9vvE+mpIRsg7rbAqGbyZBzIFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762113930; c=relaxed/simple;
	bh=KvMMSvI6BItBdwaqbFrUvjtJBCDQgGX5kjV2k7ZclXY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rfFUTv87PFcaRx+lr/kqIZ5F+1tvsTQW4Br6od4Uy2aYSwETTXDYI/QOekJuY+65coLGH9YrYIIa1lYFXe7c+2LaW/zxdNFsnnRmlj+TvnfRrPLOqUE299c3r+kry8sfQh3EdgyNkE2KApF0OSbW7K8DC5b0ME6nPrsiMjLmUZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=YxhZONU9; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="YxhZONU9"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id D0895240027
	for <perfbook@vger.kernel.org>; Sun,  2 Nov 2025 21:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1762113924; bh=y/+L4m+kFgNtQAkXEdBuRO1dfqM30NRBns1G00KEOLA=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=YxhZONU96DU+R4O7PQCUgvWK/SNnvn46ZPl5UdGDKqDWXTsEH75lckRbYAKn16m9x
	 u/nvKK5Vlw3jmX0D4L8SyIpx/6FKKUC/4tw1KXjf7Vc4NC2IUJhkn5LoJ20S291nIf
	 NsVXFQxzd5cXQCYxG8/luizYn59VGr/dSgpwDA/ScFemteI2Ft2/swhfSP0WxYdb9b
	 xj/ZaMseJRSIVww0Ar2doYz41ZmdtST498U2j7kYVc+BpSqEt1qqL+JUB9/VxxKhZ/
	 95EITsMKYhcfm4SSRxyj8Rxu1RidQqNFq3dvdQsQQSohh1ZnR9kMnOsLzyHeOsin8c
	 WoXhEowaEZkUg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4d05LD31Wsz6v19;
	Sun,  2 Nov 2025 21:05:24 +0100 (CET)
Message-ID: <8097900a96063034e0ca89b6174be03bec8a0cd3.camel@posteo.de>
Subject: Re: Invalidate Queues violate cache coherence - what for?
From: Philipp Stanner <stanner@posteo.de>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
Date: Sun, 02 Nov 2025 20:05:24 +0000
In-Reply-To: <afd3499b-1d7e-44f3-8c39-db4dbaf7c2ae@paulmck-laptop>
References: <2d8e81ccabae3a1d63d1c3df9e593c19f2043f50.camel@posteo.de>
	 <afd3499b-1d7e-44f3-8c39-db4dbaf7c2ae@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-11-02 at 10:37 -0800, Paul E. McKenney wrote:
> On Sun, Nov 02, 2025 at 04:18:48PM +0000, Philipp Stanner wrote:
> >=20

[=E2=80=A6]

> >=20
> > "However, the CPU need not actually invalidate the cache line before
> > sending the acknowledgement." [1]
> >=20
> > Well yes, I think it absolutely needs to. The previous examples relied
> > precisely on this. What a CPU sending an Invalidate Message actually is
> > saying is: "I will modify this cache line that you currently have read-
> > only in your local cache. Once you sent me the Invalidate-ACK I know
> > that you have invalidated it and I can safely modify it."
> >=20
> > A CPU sending an Invalidate-ACK without actually having invalidated its
> > cache line is, bluntly, lying and endangering the entire cache
> > coherence.
> >=20
> > Now don't get me wrong, I accept that this is obviously what is really
> > happening. But the chapter got me to the point of interpreting a
> > truthfull Invalidate-ACK as an essential part of cache coherence.
>=20
> The following sentence was intended to help: "It could instead queue
> the invalidate message with the understanding that the message will
> be processed before the CPU sends any further messages regarding that
> cache line."

So it can refuse to invalidate the cache line as long as it only keeps
it in its current state, the "worst damage" being that the CPU reads
potentially outdated data?

>=20

[=E2=80=A6]

> Fourth, you are right that strict unoptimized MESI
> would absolutely require that the cache line be invalidated prior to
> acknowledging the invalidation.

My understanding of that chapter is that classic MESI needs little
memory barriers, but store buffers and invalidate queues inform the
necessity for wmb() and rmb(), respectively.

>=20
> > The previous section detailing the store-buffer, on the contrary, makes
> > more sense: "Altough not owning this cache line yet, I can store my new
> > value in the store buffer already because whatever the current value
> > is, I will overwrite it anyways." whereas with the invalidate queue the
> > reader just ignores that the variable might have changed.
>=20
> Well, if the cacheline is in Modified or Exclusive state, then the
> CPU must transition it to at least Shared (with extra state saying
> "doomed" or some such).=C2=A0 Or not, given yet more protocol complexity.
> If the CPU receiving the invalidation request knows that the CPU sending
> that request doesn't care what the current value of the cacheline is,
> then the receiving CPU can pretend that any stores happened before it
> received the invalidation request.=C2=A0 Again, assuming that there are n=
o
> ordering instructions that prohibit this.

I'm losing track why MESI even exists in the first place, to be honest.
I had thought it's about guaranteeing that a given cache line can only
have one value at a given time; but it seems protocols like that are
more about getting a cache line at all, sooner or later, and every
ordering must be ensured by the instructions.

This might seem strange or trivial to you.. I guess the crucial point
is my (false?) understanding of the Invalidate message serving to
guarantee that the receiver will see the sender's update of the cache
line. And it will see that update, just too late=E2=80=A6

So the invalidate ack message is interpreted as a hard, reliable
synchronization point.

>=20
> > I guess this is legal because the only real guarantee of CPUs is that
> > one particular CPU sees all its accesses in order? But even then, as
> > above, for store buffers it makes sense, because the storing CPU
> > doesn't care about other values. The *reading* CPU sending the fake
> > Invalidate-ACK, on the contrary, should very well care about reading
> > the truthfull value from the cache line.
>=20
> Also, different types of CPUs have different underlying ordering
> guarantees.=C2=A0 And speculative execution can often ignore those guaran=
tees
> as long as it can avoid the user-visible state seeing any violations.=C2=
=A0 And
> given multiple CPUs reading and modifying a given variable concurrently,
> what exactly is the truthful value at any given point in time?
> (Referring to Figure 15.10 ("A Variable With More Simultaneous Values").

Argh.

There is this famous quote from a famous book, where the roman governor
asks:

"What is truth?"

>=20
> > And if it all works like that, then what even is the point of
> > Invalidate messages at all, if you can not rely on them being followed
> > before you yourself start modifying the cache line?
>=20
> Because they are needed for things like memory-ordering instructions
> to work correctly.=C2=A0 But on a weakly ordered system, if there are no
> memory-ordering instructions in the code, then there are precious few
> memory-ordering guarantees anyway.=C2=A0 ;-)
>=20
> > Or is the point that a CPU temporarily ignoring an Invalidate message
> > can still validly (without memory barriers) use data in that cache line
> > which does *not* get modified by the other CPU? So memory barriers in
> > this scenario would allow for more efficiency by "segmenting" cache
> > lines?
>=20
> The point is mostly that on weakly ordered systems in the absence of
> memory-ordering instructions, there are very few guarantees.=C2=A0 See ag=
ain
> Figure 15.10.

Is the store buffer the exact equivalent of the invalidate queue, or is
the latter "more evil" as to my explanations above?

I'd say:
 * The store buffer allows the CPU to ignore that it should (in an
   ideal, performant world) store this =C2=A0_right_now_, only caring about
   _itself_ seeing the stores in order, ignoring that the other CPU
   should see it _now_ (or before that other, subsequent store in the
   example).
 * The invalidate queue allows a CPU to keep its read-only cacheline,
   ignoring that it might get updated _right now_, ignoring the other
   CPU's store, only caring about its own previous stores / reads (or,
   more simple: relying on the fact that the cache line had been r-o so
   far)

Still, the latter seems less wise to me.

>=20
> > Quite confusing. Parallel programming is hard and discussing it is one
> > thing we can do about it :]
>=20
> Agreed!!!
>=20
> Do the explanations above help?=C2=A0 If so, I will rework that paragraph
> with attribution.

Well, yes, the reminder of there being no "true value" anyways helps
and reminds about why barriers exist.

But in fact, the question about the Invalidate message just being
temporarily *ignored and falsly answered* seemed so obvious to me that
I was searching for the Quick Quiz that would answer it, but there was
none :(

Something like that would sound very paul-ish to me:

" Quick Quiz:
But wait! Wasn't the entire point of the invalidate-ack message to
assure the receiver that it's now safe to modify the cache line without
there being readers of the old data left? How can the CPU possibly get
away with falsly claiming it has invalidated the cache line?
"


I think that would help. Or rather: the answer would help.


Regards
P.


>=20
>  Thanx, Paul
>=20
> > Thanks,
> > Philipp
> >=20
> >=20
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.gi=
t/tree/appendix/whymb/whymemorybarriers.tex#n1127
> >=20
