Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233445AbhLWR0P (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 23 Dec 2021 12:26:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472A7C061401
        for <perfbook@vger.kernel.org>; Thu, 23 Dec 2021 09:26:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E1F40B8212A
        for <perfbook@vger.kernel.org>; Thu, 23 Dec 2021 17:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640280372;
        bh=yA/u5iz17A5Kh84O39qFTUjzrGOl9/c6XlmmJcQL9Eo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=BS62UxxDDCGRaliVseH8TS/QqETo3T22dStAV7eI+yW9YVJPos2T+KlcLfztBbjDA
         0IGbIacRD0GKnIlqvYPNUhQPwphD+TTuqFcTcoxD7zg9GmD1JtvLQ2jNsrKUs8ScKR
         Xp34v2rmummLUlqd3pjUUbW5DKSHsklOeXZMJb41JYrQWOrXq1aB0wXm64gOnL0flH
         4hxEcAK9FGyjxH5n4g/bVqAbHUPk3OXKc808bEOZzqliz+yhg9dGvPJPch/i+Zaj/f
         WOY3KiaM5KeBC/v0Ad5EniXK1u996khF5461evVYMGY4pDLe0+ZaT/18uhrNzE/axR
         gbO6k0LCJcv7Q==
Date: Thu, 23 Dec 2021 09:26:12 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Section 9.5: Nobody expects the Spanish Acquisition!
Message-ID: <20211223172612.GQ4109570@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FWZG2EicBGKBbVzYnhH7oT3FqkwY738pmra9G9riGssVQ@mail.gmail.com>
 <b2851e07-d804-eff9-cb48-c636a159f868@gmail.com>
 <4f0ee3e7-73dc-9a76-0272-c49c2f09ccbc@gmail.com>
 <5be72d6b-54e8-4ac2-dd8d-cb9a8fd2d436@gmail.com>
 <20211222181927.GK4109570@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FUHcqEXE+MgXif0n=e09xYFoGFfmhjvY1=pnC6QCCRh2w@mail.gmail.com>
 <20211223022957.GM4109570@paulmck-ThinkPad-P17-Gen-1>
 <b2c80a98-ed14-7e0d-c309-3f3ea029018a@gmail.com>
 <CAJbg=FXxhA1d23EzAG2TfnyxVVd58khApBerH4vdU99FYwepuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FXxhA1d23EzAG2TfnyxVVd58khApBerH4vdU99FYwepuQ@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Thu, Dec 23, 2021 at 07:46:02AM -0500, Elad Lahav wrote:
> Yes, Akira, that's where I was going. Nevertheless, my question is a
> bit more profound than that: is the asymmetry a result of the
> implementation of RCU, as presented here (and the way it is used in
> the Linux kernel), or is it inherent to RCU as a data access pattern?
> I believe it is the former, and have an idea on how to phrase this
> notion more formally. I will write something up and you can then
> decide whether:
> 
> 1. I'm wrong
> 2. I'm right, but it's not worth mentioning
> 3. I'm right, and the point should be added to the book
> 4. None of the above ;-)

5?  ;-)

The quick answer is that the asymmetry is due to properties of
weakly ordered hardware, for example, ARM, PowerPC, and Itanium.
This hardware provides limited but quite useful ordering for address
and data dependencies, as in if you load a pointer and then dereference
that pointer, the hardware will maintain limited ordering between the
load and the dereference.

Sadly, the C/C++ standards make no such guarantees.  But careful coding
restrictions make things work with all actual compilers, as can be seen
from Documentation/RCU/rcu_dereference.txt.

If you hate asymmetry and don't mind a bit of performance loss on
weakly ordered hardware, you could use an acquire load instead of
rcu_dereference().  You will get yelled at within the context of the
Linux kernel (ARM folks don't like things that slow them down), but from
a functional viewpoint, it would work.

I will take a look at your proposed text later today, Pacific Time.
Now to go on a hike to Silver Falls State Park with my son.  ;-)

							Thanx, Paul

> --Elad
> 
> On Thu, 23 Dec 2021 at 07:22, Akira Yokosawa <akiyks@gmail.com> wrote:
> >
> > Hi,
> >
> > It sounds to me like Paul is missing the main point of Elad's question.
> > So I'm chiming in again.  See inline comment below Elad's question.
> >
> > On Wed, 22 Dec 2021 18:29:57 -0800, Paul E. McKenney wrote:
> > > Strictly speaking, all that the rcu_read_lock()/rcu_read_unlock() does
> > > is to ensure that any RCU-protected linked data objects referenced by
> > > the corresponding critical section remain in existence for the full
> > > duration of that critical section.
> > >
> > > And even that overstates things a bit, as this describes not the
> > > underlying RCU API itself, but rather some of that API's use cases.
> > > (Though to be fair, these are the most popular of RCU's use cases.)
> > > So even more strictly speaking, all the rcu_read_lock()/rcu_read_unlock()
> > > does is to make any synchronize_rcu() or call_rcu() invocations starting
> > > after a given rcu_read_lock() wait (synchronously or asynchronously,
> > > respectively) until the corresponding rcu_read_unlock() is reached.
> > >
> > > Returning back to the first paragraph, additional protections can be
> > > arranged, depending on the RCU use case.  For example, if the non-pointer
> > > fields of objects added to an RCU-protected linked data structure remain
> > > unchanged while that object is accessible to readers, then the protection
> > > includes not just existence, but also value.  And there are other use
> > > cases where those values might change while accessible to readers.
> > >
> > > So the most accurate answer to your question is "That is a design
> > > choice, based on the RCU use case in question."
> > >
> > > My guess is that you are thinking in terms of designs where the
> > > non-pointer fields of an object are constant while that object is
> > > accessible to readers.  Is my guess correct?
> > >
> > >                                                       Thanx, Paul
> > >
> > > On Wed, Dec 22, 2021 at 04:35:24PM -0500, Elad Lahav wrote:
> > >> I will try to come up with something, but first I wanted to get your
> > >> opinion as to whether this design pattern, where you need to
> > >> dereference a pointer to a data structure containing all of the data
> > >> considered to be protected by the critical section, is inherent to
> > >> RCU, or is it just an idiosyncrasy of the implementation used in the
> > >> Linux kernel?
> > >>
> > >> --Elad
> >
> > I guess Elad is asking more of the design choice of rcu_assign_pointer()
> > and rcu_dereference().
> >
> > A naive reader might easily miss the asymmetry of rcu_assign_pointer()
> > with store-release and rcu_defeference() *without* load-acquire.
> >
> > IIUC, this asymmetry comes from the use cases where RCU performs best,
> > that is read-mostly.  Therefore, rcu_dereference() need to be
> > light-weight as possible and doesn't imply load-acquire.
> > Thankfully quite a lot of use cases can be covered by the pattern
> > where address-dependency is sufficient for read-side.
> >
> > So one approach for Elad's concern would be to add a Quick Quiz on
> > this asymmetry, I suppose.
> >
> > Elad, am I guessing right?
> >
> > Sidenote: RCU and memory accesses are orthogonal.  You can use whatever
> > memory access primitives for your needed memory ordering. (Which would
> > be quite likely a tricky thing to do for a naive reader, though.)
> >
> >         Thanks, Akira
> >
> > >>
> > >> On Wed, 22 Dec 2021 at 13:19, Paul E. McKenney <paulmck@kernel.org> wrote:
> > >>>
> > >>> On Wed, Dec 22, 2021 at 11:35:02PM +0900, Akira Yokosawa wrote:
> > >>>> Hi,
> > >>>>
> > >>>> On Wed, 22 Dec 2021 07:15:54 -0500, Elad Lahav wrote:
> > >>>>> Hi Akira,
> > >>>>>
> > >>>>>> I think this is mostly covered in Section 9.5.2.1 "Publish-Subscribe
> > >>>>>> Mechanism" and Figure 9.10 "Publication/Subscription Constraints".
> > >>>>>
> > >>>>> I don't believe it is. I think you can infer that from reading sections 9.5
> > >>>>> and chapter 15, but it is never made explicit.
> > >>>>
> > >>>> I agree it is not explicit.
> > >>>>
> > >>>>>
> > >>>>> Sub-section 9.5.2.1 talks about the use of rcu_dereference() to obtain a
> > >>>>> pointer, but it doesn't go very deep into how that's implemented. You would
> > >>>>> think that the writer's use of store-release semantics would necessitate
> > >>>>> the reader's use of load-acquire semantics, but the discussion here, the
> > >>>>> previous examples, and a quick inspection of how rcu_dereference() is
> > >>>>> implemented, suggest that a READ_ONCE() is sufficient (or some less
> > >>>>> Linux-kernel-specific equivalent).
> > >>>>>
> > >>>>> If I am a naive reader (and a lazy one, who haven't read chapter 15 and made
> > >>>>> the necessary connection), I could write something like:
> > >>>>>
> > >>>>>     struct foo_s {
> > >>>>>         int a;
> > >>>>>     } foo;
> > >>>>>     int b;
> > >>>>>     struct foo_s *g_foop = &foo;
> > >>>>>
> > >>>>>     // Reader
> > >>>>>     rcu_read_lock();
> > >>>>>     struct foo *l_foop = rcu_dereference(g_foop);
> > >>>>>     use(l_foop->a);
> > >>>>>     use(b);
> > >>>>>     rcu_read_unlock();
> > >>>>>
> > >>>>>     // Writer
> > >>>>>     struct foo *l_foop = malloc(sizeof(struct foo));
> > >>>>>     l_foop->a = 1;
> > >>>>>     b = 2;
> > >>>>>     // Release semantics ensure previous stores are observed
> > >>>>>     rcu_assign_pointer(g_foop, l_foop);
> > >>>>>
> > >>>>> But since b has no address dependency to g_foop and since neither
> > >>>>> rcu_read_lock() nor rcu_dereference() impose acquire semantics, then
> > >>>>> the reader may not observe the new value of b.
> > >>>>
> > >>>> No, it may not.
> > >>>> So what you want is the mention of "address dependency" somewhere in
> > >>>> Section 9.5.2.1?
> > >>>>
> > >>>>>
> > >>>>> Again, I may be missing something, but this seems to be a major point
> > >>>>> that needs to be explained and emphasized.
> > >>>>
> > >>>> I guess Paul is intentionally avoiding discussions on memory ordering
> > >>>> here in Section 9.5.
> > >>>>
> > >>>> Such a discussion would easily frighten naive readers...
> > >>>>
> > >>>> Anyway, I guess Paul would have some good compromise to satisfy you.
> > >>>
> > >>> Actually, I am going to ask Elad to propose the location and wording of an
> > >>> addition to Section 9.5 covering this, so that we can discuss and refine
> > >>> it.  This addition might be a new paragraph, a footnote, a quick quiz,
> > >>> a citation, or what have you.  And the refining might switch back and
> > >>> forth among these options a few times.  But we do have to start somewhere.
> > >>>
> > >>> I am thinking in terms of this going in after the release that I was
> > >>> naively planning to do yesterday.  (The objective universe had other
> > >>> ideas.)
> > >>>
> > >>>>>> BTW, I couldn't figure out what you meant by "the Spanish
> > >>>>>> Acquisition"...
> > >>>>> It's a reference to an old Monty Python skit. Apologies for the silly pun...
> > >>>>
> > >>>> Ah, now I guess I see the pun of "acquire" and "acquisition".  ;-)
> > >>>
> > >>> And here I was hoping that Elad was purchasing a house in Barcelona
> > >>> or some such.  ;-)
> > >>>
> > >>> (Sorry, couldn't resist!)
> > >>>
> > >>>                                                         Thanx, Paul
