Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1820157E82
	for <perfbook@vger.kernel.org>; Wed, 18 Dec 2024 19:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734551883; cv=none; b=FnNXaDQyGv2SsFce22Sly8WxHt0mDpZPgvO9vNlAVY8D+8x/H1flvLfFzPB+Ed969KFLYHoiwshrqz/+7GJKqug8IgZklhAfDHu4miZYtdJrp3N6Ms/iMj7NLPdTp4JvqTfX1sh+oxQ9aYrF97ZC1oI31r7i+ueD/s434PIuvTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734551883; c=relaxed/simple;
	bh=XdZHm4jTO/EInpDJ3QhkQn2oGa7S8iw4drtBlV/V2+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mX/Y86Hsly1woRsa8qF6kNSO6mOon8rlgM3oOPQ2TQ5XE+LE3W20RcTVsZVd+QNvvJj1XFCocv75A1BrLT/Tiwdfy0YZKSVuJMTbADaZ45yIjXTGNASY682mfpL0RLG64Sl966unhtFeHa+IDOHW0QjU3u7vBldTrRvFWCpIV/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYkBN+5E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYkBN+5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96E8C4CECD;
	Wed, 18 Dec 2024 19:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734551882;
	bh=XdZHm4jTO/EInpDJ3QhkQn2oGa7S8iw4drtBlV/V2+c=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=NYkBN+5EE4QUe1PWRGd/w2vsUNxocDx5Etp/7e1ZOpQLlrpZq84ZIDjJVEr4elNxo
	 Q/Er3Tor/I398TUJ1hsxJLrz3MMIRUCq4web53kLyL7XiKqvc6iQ8ffVhQwXn31Ez7
	 JvvxuBpqxT+1XkPENqetkR39utLupBwi82zWzUL1TZoq18gFL5iu7iQEThesZqapbJ
	 X6xUcYb9iEA7Y4RrvvMrLRBPVV8T/HORTnu/2blt2M8w2FBbWdW0fyXY1XfWkl96sc
	 NdCx0C1sMetRbUdw5VVtQaLoGjsHcyLM8G1dnnvariJHIhy4ffhepKg2oOKgQ43hEB
	 zrSS+FYGPr5Cw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5B00ECE09CE; Wed, 18 Dec 2024 11:58:02 -0800 (PST)
Date: Wed, 18 Dec 2024 11:58:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Daniel Xu <dxu@dxuuu.xyz>, Akira Yokosawa <akiyks@gmail.com>,
	perfbook@vger.kernel.org
Subject: Re: [PATCH] seqlock: Use WRITE_ONCE() on sequence update
Message-ID: <1b408a75-13a5-4662-8f73-105e7f0ae8dd@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>
 <114890d2-e51c-4bb7-943d-9276c6e3de93@gmail.com>
 <bb8ad6dd-7a9e-4288-9b11-c173d318a87a@app.fastmail.com>
 <CAJbg=FVZoWTk5VanWn6YG5-8y69ktDnzq91APMmnVEuHJi5v6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJbg=FVZoWTk5VanWn6YG5-8y69ktDnzq91APMmnVEuHJi5v6w@mail.gmail.com>

On Wed, Dec 18, 2024 at 08:21:14AM -0500, Elad Lahav wrote:
> On Tue, Dec 17, 2024 at 9:05 PM Daniel Xu <dxu@dxuuu.xyz> wrote:
> > My understanding is that read_seqbegin() and read_seqretry()
> > can execute at any time. That means the read side access of
> > the sequence number can occur doing an increment.
> >
> > To prevent the reader from reading a partially written value,
> > we need the WRITE_ONCE() to ensure the relaxed atomic
> > write.
> 
> Hi Daniel,
> 
> This seems very odd to me. Assuming that the lock field is of an
> atomic type, no reader will ever see a partial write.
> By "atomic" I don't mean subject to atomic read-modify-write
> operations, but simply that the hardware always completes a write to
> the value before it is made visible to any observers. This should be
> true for all aligned integral types in all modern architectures.

Real compilers really do tear non-volatile stores.  For example, when
storing certain constants (0x10002 comes to mind) into 32-bit variables on
systems with store-immediate instructions having short immediate fields,
some compilers generate a pair of 16-bit store-immediate instructions
instead of forming the 32-bit constant in a register and then storing the
register.  And for a single-threaded program without interrupt handlers,
this is an eminently reasonable optimization.

> Also, I don't believe WRITE_ONCE() imposes any atomicity where none
> exists. I'm not a Linux kernel developer, but from what I can tell all
> it does is wrap a pointer with volatile, to ensure that the compiler
> does not optimize-away the write. In this case I don't see how the
> compiler can ignore seq->lock++ between a spin lock and a barrier.

Agreed, if you do a volatile store of a 64Kbyte structure, the compiler
does not have much alternative to tearing that store.  But in modern
compilers, if the corresponding atomic type is always lock-free, then a
volatile operation on the underlying (non-atomic) type should never tear.

							Thanx, Paul
