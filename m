Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234434AbiAECEQ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 4 Jan 2022 21:04:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0706EC061761
        for <perfbook@vger.kernel.org>; Tue,  4 Jan 2022 18:04:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9480D61633
        for <perfbook@vger.kernel.org>; Wed,  5 Jan 2022 02:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641348255;
        bh=wp6n90Z92oRrEeDT78EIOIc9zXQCGZ5H63vzyd2t3S4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PvkdQfWt2JHru9tiXpe4N15YcjLWpKbDLUvqa21biB4n/Dl3dRxconKffT164HWY2
         JpdNNMfGGAFv9e6Ff11yk37jd7IftwqeRvTNZ5vDL5jbLABB05QFj4r1O/IV7VfQvg
         Pvhib4ExRCA125/diV1vRr6SgVAvHNryh0hZr0E3IwOtge6iSpD5HWPIuX2j8NOlhS
         VFNxOoxnDVItEENz+lIPc+Ie5GFzPmV69hOyRfxGcVscUtcpw/wKNOhwmy7OSiQrJD
         2sTBLzQqTjagFSMYQ9rOkkx5opNwZNmRqGDY54uhJFyJLX3JjdAJByjFab06xBJo8b
         e9QpE81kEOahw==
Date: Tue, 4 Jan 2022 18:04:14 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Section 9.5: Nobody expects the Spanish Acquisition!
Message-ID: <20220105020414.GI4202@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211222181927.GK4109570@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FUHcqEXE+MgXif0n=e09xYFoGFfmhjvY1=pnC6QCCRh2w@mail.gmail.com>
 <20211223022957.GM4109570@paulmck-ThinkPad-P17-Gen-1>
 <b2c80a98-ed14-7e0d-c309-3f3ea029018a@gmail.com>
 <CAJbg=FXxhA1d23EzAG2TfnyxVVd58khApBerH4vdU99FYwepuQ@mail.gmail.com>
 <50fb6c6c-cc9b-691e-b08b-233fd1a02001@gmail.com>
 <CAJbg=FUXcd4MLS0QxHV9rG=WwjEzsCo0Q2WuLUJC1-meygCu=g@mail.gmail.com>
 <20220104000506.GD4202@paulmck-ThinkPad-P17-Gen-1>
 <ae38a23a-a5ac-055f-3039-c10e46160e13@gmail.com>
 <CAJbg=FULL3obUqKPKK=BD4o9Wr-WbcFH9GoAAFQ7Vh7EfqphtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FULL3obUqKPKK=BD4o9Wr-WbcFH9GoAAFQ7Vh7EfqphtQ@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Tue, Jan 04, 2022 at 06:47:42AM -0500, Elad Lahav wrote:
> > The tag is the address, the pointer is just a variable that holds that tag.
> Sorry, I re-read what I wrote and it's not accurate. The tag *is* the
> pointer variable, the address it holds is the version.

Huh.

Oh, are you looking to cover the Linux-kernel SRCU API as well as the
various non-SRCU RCU APIs?  Where srcu_read_lock() returns a value that
must be passed to the corresponding srcu_read_unlock()?

> --Elad
> 
> On Mon, 3 Jan 2022 at 19:49, Elad Lahav <e2lahav@gmail.com> wrote:
> >
> > Hi Paul,
> >
> > On 2022-01-03 7:05 p.m., Paul E. McKenney wrote:
> > > First, apologies for the delay.  And happy new year!
> > No problem! I did not expect you to spend time on this during the
> > holidays. Hope you had a good hike on Christmas eve. I would have liked
> > to go hiking as well, but the combination of -20C and a raging pandemic
> > restrict me to the treadmill.

The hike was good!  We did the medium loop through Silver Falls State
Park near Salem, Oregon.  This got us to seven of the ten easily reached
waterfalls, and to three of the ones that you can walk behind, so that
you are looking through the waterfall down the canyon.  The vertical
drop of the waterfalls we visted ranges up to about 170 feet.

Yeah, I grew up near there, so I am no doubt prejudiced.  ;-)

> > Your response makes me think that I need to explain better what I am
> > trying to do here. Reading section 9.5 it is not always clear to me what
> > constitutes a description of RCU and what a description of "RCU in the
> > Linux kernel". I decided to try and come up with a more abstract
> > description using the code I attached. It may be just a straw man, but
> > at least it gives us something to point at while discussing (which I
> > guess is a redundant definition of a "straw man"...).

Hmmm...  Maybe I should add a section following 9.5.1.1 ("Minimal
Insertion and Deletion") describing the core API:

	rcu_read_lock(): Start an RCU read-side critical section.
	rcu_read_unlock(): End an RCU read-side critical section.
	rcu_dereference(): Safely load an RCU-protected pointer.
	synchronize_rcu(): Wait for all pre-existing RCU read-side
		critical sections to complete.
	call_rcu(): Invoke the specified function with the specified
		rcu_head pointer argument after all pre-existing
		RCU read-side critical sections complete.
	rcu_assign_pointer(): Safely update an RCU-protected pointer.
	rcu_dereference_protected(): Safely load an RCU-protected
		pointer within an update.  (Just debugging, as you
		can safely do a C-language load.  So I will probably
		omit this one.)

Does that help?

> > > You lost me here.  How is the address of a data structure different
> > > than a pointer?  Conceptually, from a high-level-language viewpoint,
> > > sure, I can see it (not that I always like it, pointer zap being a prime
> > > offender), but at the machine level I do not.
> > I'm just trying to correlate the "tag" nomenclature with the way the
> > Linux kernel RCU implementation works. I believe that this
> > implementation fits within the abstract code I wrote, relying on the
> > heap to provide versioned data by doing its job, i.e., never return a
> > version (address) that has not been released (freed). The tag is the
> > address, the pointer is just a variable that holds that tag.

I was thinking in terms of SRCU above, but SRCU's tag does not involve
any pointers.

So why is rcu_get_latest_version() returning anything, and what is
rcu_release_version() is doing?

> > > I agree that there is no need for acquire semantics in the common
> > > case.  But care really is required.
> > >
> > > First, compiler optimizations can sometimes break the dependency,
> > > first by value-substitution optimizations:
> > >
> > >       struct foo *gfp; // Assume non-NULL after initialization
> > >       struct foo default_foo;
> > >
> > >       int do_a_foo(struct foo *fp)
> > >       {
> > >               return munge_it(fp->a);
> > >       }
> > >
> > > The compiler (presumably in conjunction with feedback from a profiled
> > > run) might convert this to:
> > >
> > >       int do_a_foo(struct foo *fp)
> > >       {
> > >               if (fp == &default_foo)
> > >                       return munge_it(default_foo.a);
> > >               else
> > >                       return munge_it(fp->a);
> > >       }
> > >
> > > This would break the dependency because control dependencies do not
> > > order loads.  However, I would not expect compilers to do this in the
> > > absence of feedback-directed optimization.
> > >
> > > Second, and more concerning, things can get even more dicey when one
> > > is trying to carry dependencies through integers:
> > >
> > >       struct foo foo_array[N_FOOS];
> > >
> > >       int do_a_foo(int i)
> > >       {
> > >               return munge_it(fp[i].a);
> > >       }
> > >
> > > This actually works well, at least until someone builds with N_FOOS=1,
> > > which causes foo_array[] to reference a single element.  At that point,
> > > the compiler is within its rights to transform to this:
> > >
> > >       int do_a_foo(int i)
> > >       {
> > >               return munge_it(fp[0].a);
> > >       }
> > >
> > > This again breaks the dependency by substituting a constant.  (Note that
> > > any non-zero index invokes undefined behavior, legalizing the otherwise
> > > inexplicable substitution of the constant zero.)
> >
> > Excellent, that's what I was looking for! If I understand you correctly,
> > in principle acquire semantics *are* required for the reader. It just so
> > happens that most implementations can get away without explicit acquire
> > semantics due to data or address dependencies, but these need to be
> > justified.

There are more examples in Section 4 of https://wg21.link/p0098r1.
And the aforementioned rcu_dereference.rst contains more recent cautionary
tales.

> > > Why is this needed?  What is provided by this that is not covered by
> > > rcu_reader_exit(), AKA rcu_read_unlock()?
> >
> > Just for verbosity's sake. I first wrote it as
> > "rcu_reader_exit(latest)", but I felt it wasn't clear what are the
> > semantics of such a call. I guess something like
> > "rcu_reader_release_and_exit(latest)" could work.

OK, so rcu_reader_release_and_exit(latest) would replace both
rcu_release_version(latest) and rcu_reader_exit()?

If "latest" is a scalar quantity, that looks like SRCU.  If it is a
pointer, then what is its purpose?

							Thanx, Paul
