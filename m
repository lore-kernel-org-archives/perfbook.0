Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B782E62BD
	for <perfbook@vger.kernel.org>; Sun,  6 Apr 2025 02:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743906547; cv=none; b=hkWTLpLL2FxVtZ7HZcwtuP/dQmZY9vYkpkmpz9DRqCtfD5OWeW/iWlX8wzcf1gwNAMO5jy2n3h7cgIqT9M6k/BrVUhpGETCNlCofbF3L3g8hIoOwbK3cEQ4ENAoI2Ilt7Xg2YmXcQvI4fD4AIdp3WC1Isy3/Efdl0nl/T3WPN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743906547; c=relaxed/simple;
	bh=VIDZrYrHvznqU1xYnVN3FYOcIOTExx8CojXU8a69KN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDpmXi9cKv2avgDDRPHdYndSsgPlV/mlDL/PCfOEDmD94i1Fzr8igalAgQYydIysuPukRmvQzvTAQF+R/hixB1IErSztH2vGscIIb1oeq8d3cNuJXkjJivGhVo8hjp0lBwEvnYyJr/iVPO7aAvMgIGx5pix5eqo5CcczC74GyAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ds9wEH9Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ds9wEH9Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF636C4CEE4;
	Sun,  6 Apr 2025 02:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743906547;
	bh=VIDZrYrHvznqU1xYnVN3FYOcIOTExx8CojXU8a69KN0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Ds9wEH9Zl3bvzkOJe1KFwY0pQEGfyF4gUkkHY6+dK1s+9VKyUXegRtzsywxfqPy1q
	 MGPgF+zV0li7hgAL8g4BateJHOum9c1RM6W+3qeVZuNxx14Zn4RutF6jvewrF0fHsv
	 zjstpyv+/HgPG5VBTu7jpulkRHGxi2ZmxCT6pMW6J+B+H+VfWlML8hns5O6JgnRRm6
	 Ofo+bEaD6fPRyq9Xa+qoeBSOjnX8NXBzWvWmXNFReDp8Y6Z4HRBoTctDd5IyRk1dru
	 lGLLlpTVhD4RkNDqEt4gSpyidav3t8rTrm67YGSjiDn/RNn1TqXyB4l7HgLiide2rW
	 qV5hY4WduvNQw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 977E1CE07A2; Sat,  5 Apr 2025 19:29:06 -0700 (PDT)
Date: Sat, 5 Apr 2025 19:29:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Nan Xiao <xiaonan830818@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: A question about "3.2.2 Costs of Operations" in perf book
Message-ID: <48feb842-73da-4177-92c9-399e44df0854@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CA+MhoaP6ttZU8YVbL4_ugqVQe=rj7hn7_fNVcbqBXtZp+jgDHA@mail.gmail.com>
 <f0ec32c4-5369-438a-85e9-413b757a77d3@paulmck-laptop>
 <CA+MhoaODjUSuDbLCf+waoJN-C-amuFisjGc_yiVXpb7jPRO7+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+MhoaODjUSuDbLCf+waoJN-C-amuFisjGc_yiVXpb7jPRO7+g@mail.gmail.com>

On Sun, Apr 06, 2025 at 10:16:49AM +0800, Nan Xiao wrote:
> Hi Paul,
> 
> Thanks very much for your time and detailed explanation!
> 
> > ... So, yes, a CAS operation happens to map to the single x86 cmpxchg instruction, ...
> 
> Maybe a nitpick, but from the book, a CAS operation is not mapped to
> the single x86 cmpxchg instruction, but a single x86 cmpxchg
> instruction with "lock" instruction prefix, right? Though I am not
> sure whether semicolon here matters or not: "lock cmpxchg" or "lock;
> cmpxchg".

Very much a philosophical point.  However, other x86 instruction
prefixes are considered to be part of the following instruction, so I
feel comfortable treating "lock;" as a prefix.  ;-)

							Thanx, Paul

> Thanks!
> 
> Best Regards
> Nan Xiao
> 
> On Sun, Apr 6, 2025 at 1:19 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Sat, Apr 05, 2025 at 07:07:17PM +0800, Nan Xiao wrote:
> > > Hello,
> > >
> > > Greetings from me!
> >
> > And good to e-meet you!
> >
> > > I am reading  "3.2.2 Costs of Operations" in perf book, and come
> > > across following words:
> > >
> > > > The same-CPU compare-and-swap (CAS) operation consumes about seven nanoseconds, a duration more than ten times that of the clock period. ......CAS functionality is provided by the lock; cmpxchg instruction on x86.
> > > > ...... Similarly, the same-CPU lock operation (a “round trip” pair consisting of a lock acquisition and release) consumes more than fifteen nanoseconds,or more than thirty clock cycles. The Lock Operation Is more expensive than CAS because it requires two atomic operations on the lock data structure,
> > >
> > > So my question is for the "lock" operation in the above paragraph,
> > > does it mean "lock" instruction? Because the CAS functionality is
> > > "lock; cmpxchg" on x86, a single "lock" instruction should consume
> > > less time than "lock; cmpxchg". Or I misunderstood something? Thanks
> > > very much in advance!
> >
> > Good question!
> >
> > To see the answer, please keep in mind that although this book's
> > performance results are taken mostly from x86, the overall focus is
> > independent of architecture.  So, yes, a CAS operation happens to map to
> > the single x86 cmpxchg instruction, but on 32-bit ARM it would map to
> > a sequence of instructions featuring load-linked and store-conditional
> > instructions.
> >
> > With this in mind, the "lock" in Table 3.1 is not the x86 "lock"
> > instruction prefix, but rather the acquisition and release of a spinlock.
> > In the Linux kernel, spin_lock() and spin_unlock().  In userspace,
> > pthread_mutex_lock() and pthread_mutex_unlock().
> >
> > For support for this view in the text, please see the sentences reading
> > as follows:
> >
> >         Similarly, the same-CPU lock operation (a "round trip" pair
> >         consisting of a lock acquisition and release) consumes more
> >         than fifteen nanoseconds, or more than thirty clock cycles.
> >         The lock operation is more expensive than CAS because it
> >         requires two atomic operations on the lock data structure,
> >         one for acquisition and the other for release.
> >
> > Does that help?
> >
> >                                                         Thanx, Paul
