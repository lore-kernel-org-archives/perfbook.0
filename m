Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243FC47ECEF
	for <perfbook@vger.kernel.org>; Thu,  7 May 2026 19:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778183882; cv=none; b=CiofUxZ0+YXBw4GGOfJLg2jcS2yEDK/eV6EebLfnKHL5JdUqedPVLYlWll3yKPWz9Vhr4OlXIMYFLGwgB6sS+1gSn1ePWmuBTbuTMfTWgbXkLJxE4/hVvhVwogFsnRyp+moe6eL5jL5PjyQyMD4pBkPowjFBXi36JPkU0gdV5Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778183882; c=relaxed/simple;
	bh=DJGhjLd2Mb89QXz3tSvXCV7Z0KOgmkVt9kL6h81NnK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhqJ3tem5ohA29fScx5KQ4yeYKRqYSjxY6awqBtHa172sZWuy2wZdzev4ebUkYtotU9XOmG1iHJmF35LBfsDFHLXy6t9Ujffjmvixwr2ZvVZyDSUSz6eB34EZVCQWxxk1WPrAhCoUY+dMPyPXLHQj6P3ek7I/bw/aDjCnwAIVUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6U1hX7d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6U1hX7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42BDC2BCB2;
	Thu,  7 May 2026 19:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778183881;
	bh=DJGhjLd2Mb89QXz3tSvXCV7Z0KOgmkVt9kL6h81NnK4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=t6U1hX7dttWlmvfIsiokQdlng6Jc6QUkOJT14YUMacRRnEIEOvvEyO06s2W1d78t3
	 ASMTtqoklOsBkl1AI9q6ePk+podAIkqSea3vIgUDKbMxodznINz0ohMoMa7xIpUD6S
	 3+giMCP8tMMCQeKIQdp5lLqXQ3lGc3M0JKZY7Xgk8UqDr/8CWJA7R0fU9/Tuz+wG67
	 xO6Ru/WlVgVYL9EDbGpk87gPt/s2RewbOW76q955QAjIMu/ZJyAZ/H+D1bGrQ5T0AY
	 p3fGa86cISYonKdBdYJfIOhP+BY+VSBiRg6CjV5JQ0RbaaYWfpX9U8mq30GHHKY3eP
	 DUBXBvy/949Rw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 54876CE0863; Thu,  7 May 2026 12:58:01 -0700 (PDT)
Date: Thu, 7 May 2026 12:58:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Y L <ly1054657282@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: Thoughts on Section 5.3 about the `count_lim` implementation and
 its use case
Message-ID: <4b901a29-2ddd-4ebf-8312-4c283320cb02@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CAKPpmEA0qZNe27Nk_K-xgJ1+Z5jez2m_1a0pu=u9HdncT8Dccw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKPpmEA0qZNe27Nk_K-xgJ1+Z5jez2m_1a0pu=u9HdncT8Dccw@mail.gmail.com>

On Sat, Mar 21, 2026 at 12:45:31AM +0800, Y L wrote:
> Hi Paul,

Hello, Y L, and please accept my apologies for the delay.

> I've been reading Chapter 5 of perfbook and thoroughly enjoying the
> deep dive into counting algorithms. However, while studying the
> `count_lim` approach in Section 5.3.3 in the context of the
> structure-allocation limit problem from Quick Quiz 5.3, I noticed what
> seems to be a mismatch between the stated requirement and the actual
> problem the code solves best.

I don't know that I would call that a mismatch, but I do agree that the
best code for a given problem might be even better for some other problem.
On the other hand, Chapter 5 focuses on counting, and thus counting is
the problem at hand.  ;-)

> It appears to me that the `count_lim` implementation is perfectly
> tailored for a Producer-Consumer model, rather than an Allocate-Free
> model. To visualize the specific Producer-Consumer requirement it
> solves, I picture each thread as a "direct-sales factory": Once a
> local factory produces enough goods to hit its local capacity, it
> ships the products to a central warehouse, dynamically adjusts its
> local limit based on the central warehouse's remaining capacity, and
> retains half for local sales. If a factory receives an order and local
> inventory is insufficient, it pulls products from the central
> warehouse. If the central warehouse is also empty, the order simply
> fails. Even if other local factories might have surplus goods, the
> model dictates it is better to let the consumer wait for new local
> production rather than undertaking the expensive task of pulling
> inventory from all other local warehouses.

Back in the 1990s, I did use a limited-counter implementation vaguely
similar to this one to limit the number of allocations of various types
of structures in order to avoid runaway memory allocations.  But this
is not quite so much an issue these days given 64-bit address spaces.
And that limited-counter implementation was itself based on a cached
memory allocator:

http://www.rdrop.com/users/paulmck/scalability/paper/mpalloc.pdf

(This is an update of the original 1993 USENIX paper.)

> This model is extremely valuable in real-world scenarios, such as
> generating TLS Session Tickets. In that scenario, tickets must be
> strictly unique (use-and-destroy, never returned back) to prevent
> replay attacks, and generating them is CPU-intensive, requiring
> background production limits to prevent hoarding. `count_lim` fits
> this perfectly.

UNIX PID allocation might be a similar problem, and also the generation
of the various other integer IDs that are passed from the kernel to
userspace.

> However, this requirement differs significantly from the
> "Allocate-Free" model implied in Quick Quiz 5.3. I've summarized their
> differences here:
> 
> | Aspect | Producer-Consumer Model | Allocate-Free Model |
> |  ----  |  ----  | ----  |
> | `add_count` Semantics | Produces a resource out of thin air
> (consuming CPU/time) and adds it to inventory. | Acquires a resource
> from a strictly finite global pool. |

This "out of thin air" does have limits, though admittedly perhaps
extremely large limits, right?

> | `sub_count` Semantics | Consumes the resource completely (it leaves
> the system). | Returns the resource back to the global pool. |

OK, definitely had better be extremely large limits, then.  ;-)

> | Meaning of the Limit | Prevents endless over-production/hoarding
> when there are no consumers. | A hard physical limit; fails when the
> pool is completely empty. |
> | `sub_count` Failure | Necessary: If production lags, inventory is
> empty, and consumers must wait/fail. | Conceptually unnecessary:
> Assuming correct program logic (no double-frees), returning an
> acquired resource back to the pool shouldn't fail. |
> 
> The count_lim approach works brilliantly for Producer-Consumer
> scenarios. However, applying it to an Allocate-Free scenario
> introduces a critical issue: cross-thread freeing (as discussed in
> Quick Quiz 5.35) can easily cause a legitimate `sub_count` to fail. In
> an Allocate-Free model, a resource return failing due to counter
> implementation details (rather than actual logical bugs like
> double-free) is highly counterintuitive. While Section 5.4's exact
> limit counter solves this, it does so at a massive performance cost.
> Sections 5.3.3 and 5.3.4, unfortunately, drop these legitimate
> cross-thread frees.

There are quite a few things that you can do to reduce the performance
cost, especially if there are no constraints on what numbers are produced.
In constrast, in the counter use cases discussed in Chapter 5, you are
required to (implicitly) hand out numbers confined to a tight range.

> Assuming the caller enforces strict lifecycle correctness (no
> double-frees or unallocated-frees), I experimented with two
> alternative implementations for the Allocate-Free model that ensure
> sub_count never fails, while maintaining performance on par with
> Sections 5.3.3 and 5.3.4:
> 
> - Signed Quota Counter: Converting the counters to signed integers,
> allowing sub_count to drive the local counter into negative values
> (representing pending returns), and balancing with the global counter
> only at a negative threshold.
> 
> - Available Capacity Tracking: Inverting the logic to track "free
> space" instead of "used space" (similar to a semaphore). Here,
> add_count (allocation) decrements the available quota, and sub_count
> (freeing) increments it.
> 
> Have you ever considered framing the `count_lim` examples explicitly
> around the Producer-Consumer pattern, or explored using
> signed/capacity-tracking counters to achieve zero-fail fast-path
> freeing for resource management scenarios?

As noted earlier, Chapter 5 is about efficient counting, and takes its
constraints from that set of use cases.  And there is quite a bit of art
out there for your producer-consumer pattern, assuming that I understand
what you are getting at.

> I would love to hear your thoughts on this distinction.

Tell me more.  I would be interested in your performance and scalability
measurements for your workloads, for example.

							Thanx, Paul

>                                                         Best regards,
> npc1054657282
> 
> ---------------------------------------------------------
> Appendix 1: Signed Quota Implementation
> ---------------------------------------------------------
> static __inline__ void globalize_count(void);
> static __inline__ void balance_count(void);
> 
> long __thread counter = 0;
> long __thread countermax = 0;
> // long __thread countermin = 0;
> long globalcountmax = 10000;
> long globalcount = 0;
> long globalreserve = 0;
> long *counterp[NR_THREADS] = { NULL };
> DEFINE_SPINLOCK(gblcnt_mutex);
> 
> static __inline__ int add_count(unsigned short delta)
> {
>     if (countermax - counter >= (long)delta) {
>         WRITE_ONCE(counter, counter + delta);
>         return 1;
>     }
>     spin_lock(&gblcnt_mutex);
>     globalize_count();
>     if (globalcountmax -
>         globalcount - globalreserve < (long)delta) {
>         spin_unlock(&gblcnt_mutex);
>         return 0;
>     }
>     globalcount += delta;
>     balance_count();
>     spin_unlock(&gblcnt_mutex);
>     return 1;
> }
> 
> static __inline__ int sub_count(unsigned short delta)
> {
>     // if (counter - countermin >= (long)delta) {
>     if (counter + countermax >= (long)delta) {
>         WRITE_ONCE(counter, counter - delta);
>         return 1;
>     }
>     spin_lock(&gblcnt_mutex);
>     globalize_count();
>     globalcount -= delta;
>     balance_count();
>     spin_unlock(&gblcnt_mutex);
>     return 1;
> }
> 
> static __inline__ unsigned long read_count(void)
> {
>     int t;
>     long sum;
> 
>     spin_lock(&gblcnt_mutex);
>     sum = globalcount;
>     for_each_thread(t) {
>         if (counterp[t] != NULL)
>             sum += READ_ONCE(*counterp[t]);
>     }
>     spin_unlock(&gblcnt_mutex);
>     return (unsigned long)sum;
> }
> 
> static __inline__ void globalize_count(void)
> {
>     globalcount += counter;
>     counter = 0;
>     globalreserve -= countermax;
>     countermax = 0;
> }
> 
> static __inline__ void balance_count(void)
> {
>     countermax = globalcountmax -
>                  globalcount - globalreserve;
>     countermax /= 2 * num_online_threads();
>     globalreserve += countermax;
>     // countermin = - countermax;
> }
> 
> ---------------------------------------------------------
> Appendix 2: Available Capacity Tracking
> ---------------------------------------------------------
> static __inline__ void globalize_count(void);
> static __inline__ void balance_count(void);
> 
> unsigned long __thread counter = 0;
> unsigned long __thread countermax = 0;
> const unsigned long globalcountmax = 10000;
> unsigned long globalcount = globalcountmax;
> unsigned long *counterp[NR_THREADS] = { NULL };
> DEFINE_SPINLOCK(gblcnt_mutex);
> 
> static __inline__ int add_count(unsigned long delta)
> {
>     if (counter >= delta) {
>         WRITE_ONCE(counter, counter - delta);
>         return 1;
>     }
>     spin_lock(&gblcnt_mutex);
>     globalize_count();
>     if (globalcount < delta) {
>         spin_unlock(&gblcnt_mutex);
>         return 0;
>     }
>     globalcount -= delta;
>     balance_count();
>     spin_unlock(&gblcnt_mutex);
>     return 1;
> }
> 
> static __inline__ int sub_count(unsigned long delta)
> {
>     if (countermax - counter >= delta) {
>         WRITE_ONCE(counter, counter + delta);
>         return 1;
>     }
>     spin_lock(&gblcnt_mutex);
>     globalize_count();
>     globalcount += delta;
>     balance_count();
>     spin_unlock(&gblcnt_mutex);
>     return 1;
> }
> 
> static __inline__ unsigned long read_count(void)
> {
>     int t;
>     unsigned long sum;
> 
>     spin_lock(&gblcnt_mutex);
>     sum = globalcount;
>     for_each_thread(t) {
>         if (counterp[t] != NULL)
>             sum += READ_ONCE(*counterp[t]);
>     }
>     spin_unlock(&gblcnt_mutex);
>     return globalcountmax - sum;
> }
> 
> static __inline__ void globalize_count(void)
> {
>     globalcount += counter;
>     counter = 0;
>     countermax = 0;
> }
> 
> static __inline__ void balance_count(void)
> {
>     countermax = globalcount;
>     countermax /= num_online_threads();
>     counter = countermax / 2;
>     globalcount -= counter;
> }
> 
