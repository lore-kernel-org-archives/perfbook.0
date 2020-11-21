Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726556AbgKUDrP (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 20 Nov 2020 22:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605930435;
        bh=+p+qqM+z0Wui/kq42+sukd7ZN7WNIZhbLeM6R3RWlu8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Cu+M7hXmDU8AQUM48SUlMnuXdsShK5+IjKCBFfld7CWMmAMX1aj7g1F+zvOTz4Tum
         kW64cDkKhu1yK5+uEe5wM5S5oNTvcR/Ua/NNjKZ6FYffRpnvwz2xDjBbzQyVFPqv2+
         2vLet+vBiX6HTHlaLjsZ3l9KkWCwX89KHUDzW1DU=
Date: Fri, 20 Nov 2020 19:47:14 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH perfbook 0/2] CodeSamples/formal: Cleanup of init blocks
 in litmus tests
Message-ID: <20201121034714.GV1437@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <7e9cc3fb-12af-eb3c-2d81-74486dd9e061@gmail.com>
 <20201115204244.GM3249@paulmck-ThinkPad-P72>
 <55d8594a-048d-15f3-b3fc-36ca6594545e@gmail.com>
 <20201121011410.GT1437@paulmck-ThinkPad-P72>
 <e02925ab-7a11-ad79-b87f-ef3ed969a369@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e02925ab-7a11-ad79-b87f-ef3ed969a369@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Nov 21, 2020 at 11:51:11AM +0900, Akira Yokosawa wrote:
> On Fri, 20 Nov 2020 17:14:10 -0800, Paul E. McKenney wrote:
> > On Mon, Nov 16, 2020 at 07:25:09AM +0900, Akira Yokosawa wrote:
> >> On Sun, 15 Nov 2020 12:42:44 -0800, Paul E. McKenney wrote:
> >>> On Sat, Nov 14, 2020 at 01:51:01PM +0900, Akira Yokosawa wrote:
> >>>> Hi Paul,
> >>>>
> >>>> This patch set is what I mentioned the other day in response to
> >>>> your LKMM patch for 5.11.
> >>>> klitmus7 doesn't need most of type info in litmus-test init blocks.
> >>>>
> >>>> While there are some cases where klitmus7 requires type info of variables
> >>>> to be watched (via the "exists", "locations", or "filter" directive),
> >>>> as long as the watched variables are of type "int", extra type info
> >>>> in the init block is not required.
> >>>>
> >>>> Litmus tests under CodeSamples/formal/ should keep compatible with
> >>>> klitmus7 after this patch set is applied.
> >>>>
> >>>> Patch 1/2 removes initialization to 0 and type info of "int" or "int *"
> >>>> under CodeSamples/formal/litmus/.
> >>>>
> >>>> Patch 2/2 further reduce line counts of litmus tests by using "{}"
> >>>> as empty init blocks.
> >>>> It also adds/removes empty lines for those code snippets to have
> >>>> consistent looks.
> >>>>
> >>>> Similar changes to patch 1/2 can be made in the RCU litmus tests
> >>>> presented in Section 12.3.2. They are not touched in this patch set.
> >>>>
> >>>> May be in a follow-up patch.
> >>>
> >>> Queued and pushed, thank you very much!
> >>>
> >>>>         Thanks, Akira
> >>>>
> >>>> *NOTE*:
> >>>>
> >>>> There are cases where litmus tests for herd7 can not be
> >>>> made compatible with (current) klitmus7, though.
> >>>>
> >>>> One such example is when a variable of a type other than the "int"
> >>>> or "int *" (such as "spinlock_t") is specified in the "locations" or "filter"
> >>>> directive.
> >>>> Current klitmus7 has no idea of the way to obtain the value of such a
> >>>> variable.
> >>>
> >>> Good to know!  Do we have litmus tests that have problems with this?
> >>
> >> One such litmus test can be made up based on CodeSamples/formal/herd/C-Lock1.litmus
> > 
> > So there is not currently such a litmus test in perfbook, but one could
> > easily be created, correct?
> 
> You are right!
> 
>         Thanks, Akira
> 
> PS.
> 
> I'm preparing a patch series to add an index framework in perfbook.
> My plan is to add a specific make target for the time being to have such
> index pages printed.
> As you should know, the hard part is to embed a *lot* of index annotations
> in .tex source files.

Quite right, it is a big job!

> I'm thinking of splitting indexes into a general one and API index.
> By API, I mean functions such as smp_mb(), READ_ONCE(), etc.
> 
> API index can have kernel API, perfbook specific API, C11 API, and GCC API.

The upside is that the individual indexes are smaller and perhaps
more manageable.  The downside is that a reader who has no idea
what the function call is might have to look it up in four (or maybe
even five) indexes.  Especially if the API is a historic API that
is no longer used.

I have no idea what the right answer is.  One approach would be to
have all of the APIs appear both in their respective categories and
in the general index.  Not sure that this would be any better, though.

> As for words/terms, if you can provide me a wish list you'd like to see in
> the general index, I'm willing to add such annotations.
> My starting point of the general index is the Glossary.

The glossary is a good starting point.  People mentioned in the text is
another.  Not sure whether or not those quoted in the epigraphs should
be included or not.  Names of algorithms should be included, also names
of data structures and of famous problems (for example, the Dining
Philosopher's problem, mazes, and so on).

I am sure that I am missing quite a few categories, but at least a
start!  ;-)

							Thanx, Paul

> Thoughts? 
> 
> > 
> > Or am I still confused?  ;-)
> > 
> > 							Thanx, Paul
> > 
> >> ---
> >> C Lock1-for-herd7
> >>
> >> (*
> >>  * Example test incompatible with klitmus7
> >>  *
> >>  * klitmus7 cannot access spinlock_t variable.
> >>  *)
> >>
> >> {}
> >>
> >> P0(int *x, spinlock_t *sp)
> >> {
> >> 	spin_lock(sp);
> >> 	WRITE_ONCE(*x, 1);
> >> 	WRITE_ONCE(*x, 0);
> >> 	spin_unlock(sp);
> >> }
> >>
> >> P1(int *x, spinlock_t *sp)
> >> {
> >> 	int r1;
> >>
> >> 	spin_lock(sp);
> >> 	r1 = READ_ONCE(*x);
> >> 	spin_unlock(sp);
> >> }
> >>
> >> locations [sp]    (* incompatible with klitmus7 *)
> >> exists (1:r1=1)
> >> ---
> >>
> >> klitmus7 can't convert this to a kernel module:
> >>
> >> ---
> >> $ klitmus7 -o temp C-Lock1-for-herd7.litmus
> >> File "C-Lock1-for-herd7.litmus" Parameter sp, type mismatch int vs. spinlock_t
> >> ---
> >>
> >> Actually, herd7/LKMM does complain of this one:
> >>
> >> ---
> >> Test Lock1-for-herd7 Allowed
> >> States 1
> >> 1:r1=0; sp=0;
> >> No
> >> Witnesses
> >> Positive: 0 Negative: 2
> >> Flag lock-final                          <---
> >> Condition exists (1:r1=1)
> >> Observation Lock1-for-herd7 Never 0 2
> >> Time Lock1-for-herd7 0.01
> >> Hash=5d10e6c355cec0c36f354abf175adc54
> >> ---
> >>
> >> Comment at line 57 of lock.cat says:
> >>
> >> ---
> >> (* The final value of a spinlock should not be tested *)
> >> flag ~empty [FW] ; loc ; [ALL-LOCKS] as lock-final
> >> ---
> >>
> >>         Thanks, Akira
> >>
> 
> [...]
