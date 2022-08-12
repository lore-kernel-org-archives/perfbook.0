Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbiHLBI3 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 11 Aug 2022 21:08:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41B99E13A
        for <perfbook@vger.kernel.org>; Thu, 11 Aug 2022 18:08:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E4F2615D5
        for <perfbook@vger.kernel.org>; Fri, 12 Aug 2022 01:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660266507;
        bh=Qqj2A08buNX6f+fPh3oazlvFX5qMTS4+IHpNdg1mFXg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=n57I4jxKeSEaPkhR29tyktk8sJA0UEqnyDiaUyCZdwTvj95eYnfS/+owT1v74duqp
         AIypJe2QXCmzbLkR7HgHFf3UzSJgwfJK9cypzbTK4kModxm3ilBqPanV/oeEil7Waz
         2BUT1iKHenZNRPceUDCWqahy4KHN7Q2MjG5X408X4LC/BJPZmh1Be4spQvB1HXqm7S
         9aIb0PhgYhCnPNjCfn3ujR9NesjlDYKE/SaKEhFuP1paTdBgk9q14QAU8jg0N/HSMU
         XJAtm1uWlbpJmVu6ihaNJ9h6veNDzuqRXoO8vqV5cvFPDXVPe+w3N/xgGBzZGGTp3E
         Akb1O3FKPh+BQ==
Date: Thu, 11 Aug 2022 18:08:27 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Comments on chapter 5
Message-ID: <20220812010827.GZ2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FUxuy++utmmuGpetP2wMk_Hc8UVYu74JWucmw9kxdM57A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FUxuy++utmmuGpetP2wMk_Hc8UVYu74JWucmw9kxdM57A@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>

On Wed, Aug 10, 2022 at 09:22:53PM -0400, Elad Lahav wrote:
> Hi Paul,
> 
> I have a few comments on chapter 5. If you agree with any of them I
> can try to provide a patch.

Thank you for looking this over!

> 5.2.2: Not really related to counters. Is it really possible for the
> compiler to use any location for temporary storage, even global
> variables? That seems a bit excessive on the compiler's part. I have
> definitely seen GCC reuse stack storage, but even then only when it
> thought that the previous value there was out of scope (erroneously in
> my case, as the function behaved like setjmp()).

According to the standard, a compiler could re-use any location for
temporary storage.  I have not seen compilers do this aside from (as
you say) stack storage, but it is quite possible that a new generation
of one-penny CPUs could force further aggression in this direction.

Better safe than sorry!

> 5.2.3: Perhaps the code should be updated to use ISO C instead of GCC?
> _Thread_local and inline are part of the language.

There will probably continue to be a need to use non-standard extensions,
but it seems sensible to at least try the standard facilities as
they appear.  Use of ISO standard inlining directives should be fine,
as should things like _Thread_local, at least as long as they are as
fast as are their gcc equivalents.

So please do give it a try!  Let's see what can be done to drag the
code into the 2020s.  ;-)

> Listing 5.5: There is a mix of thread_id_t from CodeSamples and
> pthread_create() from POSIX. One of those should be changed.

Good catch!  That thread_id_t should not be what is passed to
pthread_create().  My guess is that changing the type of the "tid"
local variable is the right way to go, but what are your thoughts?

> 5.2.4: The wording suggests that the counting threads are not impacted
> by the reader. But doesn't a cache line changing from Modified to
> Shared incur a cost on the counter when it next comes to update the
> value?

We are comparing the "eventually consistent" approach with the traditional
approach where each read scans all the counters, correct?  If so, then
the relative performance will depend on the frequency of readers in
the traditional approach compared to the sleep time for the eventual()
function, which in Listing 5.5 is a single millisecond.  It will also
depend on the rate at which each CPU does an update.  So it is possible
to compute breakevens.

Would you like to write up something to this effect, possibly expanding
on the last paragraph (starting with "This approach gives...")?

> 5.3.2: "references only per-thread variables, and should not incur any
> cache misses" - except that the thread can migrate to other cores and
> can thus incur cache misses.

Perhaps adding "in the common case" to that sentence?  Or did you have
something else in mind?

> 5.3.3: I think that some clarification, or a simple example, is due
> for explaining how a failure can occur when the count is nowhere near
> the global max.

That does indeed sound like a good addition.  What did you have in mind?

> 5.4.2: "it is worthwhile looking for algorithms with better read-side
> performance" - should it not be "write-side performance"?

Good catch!  You are absolutely right.

I look forward to seeing your patches.

							Thanx, Paul
