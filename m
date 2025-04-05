Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B068C15B546
	for <perfbook@vger.kernel.org>; Sat,  5 Apr 2025 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743873565; cv=none; b=L37dMa3aDsEszxjwCQzcGEBPBhSWT/nPFZRsdUd5yg0ZHXqz/a+QxIwHxlTMBrJ2pihgag1TnyR9bewfIcR2vpppGmccxnskytgDLzaQM8xLbGzQ0jJMld5obFqGinL8xr77Ht/VqIUmhH47ygkOQZfeAnUujpHgSVq5Qwt2ISQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743873565; c=relaxed/simple;
	bh=1lSdSOabTOBb+kDX7VQHx/vHe6iSo2Mzs2nZO4nT1dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZybI0EQ+pyaeEf2LQqBYjZmPbo3IWcGcJ9J4eQT/xnEnVur54kgFvSyUKBqNjQ/JTmPLH7hPuBd6Btg8ua7zxBM0JRGViS//WcN0Z5mROO//IyNgKzclL3Yko5V6sCEgIY9eCRMBXS5TZbUoBq8WyhJpg/UDp4DTYJfE+lzWuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+6ti1hx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+6ti1hx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE375C4CEE4;
	Sat,  5 Apr 2025 17:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743873564;
	bh=1lSdSOabTOBb+kDX7VQHx/vHe6iSo2Mzs2nZO4nT1dM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=f+6ti1hxDb1errykAeiOwXXq1p+CUUwlUMvi5v6voYsZ2Tdq7Gaab2m7ZhsiIoArC
	 zaU4KMSpdIQdJrTo3yc6AalrwOT7iuPvhjrSXaFooxPZFb6cKZuTB8myA2iUVjzc4C
	 zxhYZGUPxVOUknj53gLyRV5/A8JHKOK9cA9qwEpWRMZz0AVBb/9uAHlhjqdcQfk0JI
	 uMRRv1na7y7/OixMSAHV1LQS2dbr+nl3rDBqMeAunHEdy3o87k1EgdgYKfghg0j8WJ
	 G9BBu7A+GgPT4gLAzWH5No7AyM6Xou0xANeDtT1AKnODGaYBbhk0gG2cfLbE6s+K6a
	 xHy15hAiXjGOw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7ACEACE0565; Sat,  5 Apr 2025 10:19:24 -0700 (PDT)
Date: Sat, 5 Apr 2025 10:19:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Nan Xiao <xiaonan830818@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: A question about "3.2.2 Costs of Operations" in perf book
Message-ID: <f0ec32c4-5369-438a-85e9-413b757a77d3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CA+MhoaP6ttZU8YVbL4_ugqVQe=rj7hn7_fNVcbqBXtZp+jgDHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+MhoaP6ttZU8YVbL4_ugqVQe=rj7hn7_fNVcbqBXtZp+jgDHA@mail.gmail.com>

On Sat, Apr 05, 2025 at 07:07:17PM +0800, Nan Xiao wrote:
> Hello,
> 
> Greetings from me!

And good to e-meet you!

> I am reading  "3.2.2 Costs of Operations" in perf book, and come
> across following words:
> 
> > The same-CPU compare-and-swap (CAS) operation consumes about seven nanoseconds, a duration more than ten times that of the clock period. ......CAS functionality is provided by the lock; cmpxchg instruction on x86.
> > ...... Similarly, the same-CPU lock operation (a “round trip” pair consisting of a lock acquisition and release) consumes more than fifteen nanoseconds,or more than thirty clock cycles. The Lock Operation Is more expensive than CAS because it requires two atomic operations on the lock data structure,
> 
> So my question is for the "lock" operation in the above paragraph,
> does it mean "lock" instruction? Because the CAS functionality is
> "lock; cmpxchg" on x86, a single "lock" instruction should consume
> less time than "lock; cmpxchg". Or I misunderstood something? Thanks
> very much in advance!

Good question!

To see the answer, please keep in mind that although this book's
performance results are taken mostly from x86, the overall focus is
independent of architecture.  So, yes, a CAS operation happens to map to
the single x86 cmpxchg instruction, but on 32-bit ARM it would map to
a sequence of instructions featuring load-linked and store-conditional
instructions.

With this in mind, the "lock" in Table 3.1 is not the x86 "lock"
instruction prefix, but rather the acquisition and release of a spinlock.
In the Linux kernel, spin_lock() and spin_unlock().  In userspace,
pthread_mutex_lock() and pthread_mutex_unlock().

For support for this view in the text, please see the sentences reading
as follows:

	Similarly, the same-CPU lock operation (a "round trip" pair
	consisting of a lock acquisition and release) consumes more
	than fifteen nanoseconds, or more than thirty clock cycles.
	The lock operation is more expensive than CAS because it
	requires two atomic operations on the lock data structure,
	one for acquisition and the other for release.

Does that help?

							Thanx, Paul
