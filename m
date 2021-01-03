Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726166AbhACSZK (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 3 Jan 2021 13:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609698269;
        bh=C0jjaA2nbuid7YFu9dK6u/MJZ7mRQarYy0w72fmNHyc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=UilVPa46u5PsilPCqetsitNnK9eEsbXeCfK2lMkRXDi96/JZ82fa3pL0EksdDKDSZ
         ZTkn7g9hcnDWUwbGWXEO9mJHE9npqY/wegZ7Sdi/xZrja4TytjLYORAcyS1OWflFa/
         Rt491ktYLNzhAcfbVxYmUqxeDGeo6LhTMl0fMcUtfLsZ8ZlH9TBUushozg91PZbo/B
         kOD8aeF7YrcczhSkB67Wj9AUYsYVluM730ieYuMlVQ2+ceM7/D65Tt2/KsG+X4i4PG
         n8riWt6pgwNvzqq1WgU/aLzpVemJYUXR+c7RHsLHgpj61fuBi8ndDcHN9//jwJW3w8
         7WPhkG9Vcdwrg==
Date: Sun, 3 Jan 2021 10:24:29 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Request for clarification on Alpha reordering
Message-ID: <20210103182429.GG12032@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CAApSCJY_u9gsLHUY+=mBVBXzxU_oS8mF5CM5d_RkDFw7asPmyg@mail.gmail.com>
 <20210103035250.GE12032@paulmck-ThinkPad-P72>
 <7a4a8cbf-8828-6a2b-b45b-372eb84534ba@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a4a8cbf-8828-6a2b-b45b-372eb84534ba@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Daniel Nitzan <danny.nitzan@gmail.com>, perfbook@vger.kernel.org

On Sun, Jan 03, 2021 at 01:12:40PM +0900, Akira Yokosawa wrote:
> On Sat, 2 Jan 2021 19:52:50 -0800, Paul E. McKenney wrote:
> > On Sun, Jan 03, 2021 at 12:04:24AM +0200, Daniel Nitzan wrote:
> >> In 15.5.1 (Alpha) - In regard to the following statement: "Yes, this
> >> does mean that Alpha can in effect fetch the data pointed to before it
> >> fetches the pointer itself, strange but true."
> >> I'd appreciate it if someone could clarify what this means. I don't
> >> understand this statement in light of the actual data-dependent
> >> reordering presented in this section, i.e. the pointer itself is
> >> fetched, points to the correct location in memory, but the data is
> >> stale.
> > 
> > Yes, your last statement is equivalent.  Either way, the reading CPU sees
> > the new value of the pointer and the old value of the pointed-to data.
> > You can look at it either as counter-intuitive reordering (as I did)
> > or as counter-intuitive stale data (as you did).
> > 
> > The key point is that these values are not in a single location, but
> > are instead replicated across the CPUs' caches.  Stores are therefore
> > not atomic unless the hardware goes to a lot of trouble to make them
> > appear to be atomic.
> 
> Hi Paul,
> 
> Off topic, but smp_read_barrier_depends() as a kernel API
> has been removed since Linux v5.9 [1].
> Now READ_ONCE() for Alpha uses mb() [2].
> 
> You might want to reflect these changes in perfbook before the
> release of the Second Edition.
> 
> [1]: merge commit https://git.kernel.org/linus/145ff1ec090d
>     ("Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux")
> [2]: commit https://git.kernel.org/linus/d64628588515
>     ("alpha: Override READ_ONCE() with barriered implementation")

Good catch, thank you!  We will of course need to retain mention of
smp_read_barrier_depends() given that people will be using pre-v4.15
(to say nothing of pre-v5.9) kernels for some time, but the main code
does need to reflect the current state of the Linux kernel.

Perhaps in the third edition we should drop any and all references
to DEC Alpha.  It is no longer in any way special, at least from the
perspective of core kernel code.  ;-)

I suppose that the counter-argument is that non-Linux-kernel code might
still need to pay attention, so maybe DEC Alpha needs to stay until such
time as C/C++ handle address and data dependencies.  Worth some thought.

							Thanx, Paul
