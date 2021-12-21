Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:39470 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbhLUEOT (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 20 Dec 2021 23:14:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4424613EA
        for <perfbook@vger.kernel.org>; Tue, 21 Dec 2021 04:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640060058;
        bh=TW5w1PiuSmMx9bh8Cu3LkPILWXmAs8JTqcW40RfoWuY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=CakATk6NrVxZyuRXvmEUc4cSZhdSJbzNvGq3WrNIBmQvpTSNc1X4qe54B4Qwf9i7a
         xVjC2BWNG7O4wdRiMp8tm+2HdL4iYMKv3hEDAFi147q8Hn1o+7cxlSQvbXurDHeLnA
         SxA4bk01gCG5WbsmQRSo+FddNFeKTPBRnM1l/0Nc3yJoBL3Ea+diXBixAITXgLMTb+
         hy3wc2HxVYIAhF2w097kJ51cmFtqr78Rvr976Q7SQsHHDHtEg9HHT14LD11Q0CBn66
         0BGUPKrgWeXHXDBD/CwRwSf5752qbfyuLotP0tEBM4ywldz4OCfR6V0Hkx9C0gN35D
         z5/nb7xsriJZw==
Date: Mon, 20 Dec 2021 20:14:17 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: A few terms I'd like to see in perfbook's Glossary
Message-ID: <20211221041417.GA4109570@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <e2fcb255-aeba-7d72-a160-5573c5e2455e@gmail.com>
 <20211220174304.GY641268@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2ywHmXGTmbh0ytBwvv0Cz76O0Xdm3w8rh9=7KCv_PgURw@mail.gmail.com>
 <20211220233939.GG641268@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2wzLQY7mu2LTA6oTcOMHvT-+cVdEZkm61U+Pc2Qz81PVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2wzLQY7mu2LTA6oTcOMHvT-+cVdEZkm61U+Pc2Qz81PVw@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Tue, Dec 21, 2021 at 08:41:47AM +0800, Zhouyi Zhou wrote:
> Thanks Paul and Akira for correcting me and helping me (who needs to
> be improved ;-)) make progress
> 
> On Tue, Dec 21, 2021 at 7:39 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Tue, Dec 21, 2021 at 06:42:04AM +0800, Zhouyi Zhou wrote:
> > > Thanks Paul and Akira
> > >
> > > great improvement to perfbook's glossary!
> > >
> > > A question below ;-)
> > >
> > > On Tue, Dec 21, 2021 at 4:15 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> > > >
> > > > On Mon, Dec 20, 2021 at 06:55:36PM +0900, Akira Yokosawa wrote:
> > > > > Hi Paul,
> > > > >
> > > > > While reading through Section 9.5.4, I noticed a few terms
> > > > > I'd like to see in perfbook's Glossary.
> > > > >
> > > > >  - Reference Counter/Counting
> > > > >  - Existence Guarantee
> > > > >  - Type-safe Memory
> > > > >
> > > > > "Reference counter" is already mentioned in a couple of existing
> > > > > items in the glossary.
> > > > >
> > > > > "Existing guarantee" might be obvious enough and not worthy
> > > > > to be in the glossary.
> > > > >
> > > > > Thoughts?
> > > > >
> > > > > There were only a few minor nits in the section.
> > > > > Will post a patch taking care of them.
> > > >
> > > > Thank you for looking it over!  Please see below for a proposed patch
> > > > to the glossary.  Oh, and thank you for the checking utilities, very
> > > > nice to get explicit messages rather than subtlely broken formatting!!!
> > > >
> > > > utilities/punctcheck.sh
> > > > ./glossary.tex:547:     Type-safe memory\cite{Cheriton96a} is provided by a
> > > > utilities/cleverefcheck.sh
> > > >
> > > >                                                         Thanx, Paul
> > > >
> > > > ------------------------------------------------------------------------
> > > >
> > > > commit a8f5948a1b8921941bf4039e278aa7929f64c322
> > > > Author: Paul E. McKenney <paulmck@kernel.org>
> > > > Date:   Mon Dec 20 09:41:55 2021 -0800
> > > >
> > > >     glossary: Add reference count, existence guarantee, and TSM
> > > >
> > > >     Where "TSM" is type-safe memory.
> > > >
> > > >     Reported-by: Akira Yokosawa <akiyks@gmail.com>
> > > >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > >
> > > > diff --git a/glossary.tex b/glossary.tex
> > > > index be10f703..31c09232 100644
> > > > --- a/glossary.tex
> > > > +++ b/glossary.tex
> > > > @@ -199,6 +199,14 @@
> > > >         increase the overall cost of the computation, resulting in
> > > >         linear speedups as threads are added (assuming sufficient
> > > >         CPUs are available).
> > > > +\item[\IX{Existence Guarantee}:]
> > > > +       An existence guarantee is provided by a synchronization mechanism
> > > > +       that prevents a given dynamically allocated object from being
> > > > +       freed for the duration of that guarantee.
> > > > +       For example, RCU provides existence guarantees for the duration
> > > > +       of RCU read-side critical sections.
> > > > +       A similar but strictly weaker guarantee is provided by
> > > > +       type-safe memory.
> > > here type-safe memory is called 'weaker'
> >
> > Type-safe memory is weaker than existence guarantees ...
> >
> > > >  \item[\IXh{Exclusive}{Lock}:]
> > > >         An exclusive lock is a mutual-exclusion mechanism that
> > > >         permits only one thread at a time into the
> > > > @@ -469,6 +477,11 @@
> > > >         A situation in which getting the correct result is not sufficient,
> > > >         but where this result must also be obtained within a given amount
> > > >         of time.
> > > > +\item[\IX{Reference Count}:]
> > > > +       A counter that tracks the number of users of a given object or
> > > > +       entity.
> > > > +       Reference counters provide existence guarantees and are sometimes
> > > > +       used to implement garbage collectors.
> > > >  \item[\IX{Scalability}:]
> > > >         A measure of how effectively a given system is able to utilize
> > > >         additional resources.
> > > > @@ -531,6 +544,17 @@
> > > >         A synchronization mechanism that gathers groups of memory
> > > >         accesses so as to execute them atomically from the viewpoint
> > > >         of transactions on other CPUs or threads.
> > > > +\item[\IX{Type-Safe Memory}:]
> > > > +       Type-safe memory~\cite{Cheriton96a} is provided by a
> > > > +       synchronization mechanism that prevents a given dynamically
> > > > +       allocated object from changing to an incompatible type.
> > > > +       Note that the object might well be freed and then reallocated, but
> > > > +       the reallocated object is guaranteed to be of a compatible type.
> > > > +       Within the Linux kernel, type-safe memory is provided within
> > > > +       RCU read-side critical sections for memory allocated from slabs
> > > > +       marked with the \co{SLAB_TYPESAFE_BY_RCU} flag.
> > > > +       The strictly stronger existence guarantee also prevents freeing
> > > > +       of the protected object.
> > >
> > > but why do we use "stronger" here (should not it be "weaker"?)
> >
> > ... Or, alternatively but equivalently, existence guarantees are stronger
> > than type-safe memory.
> >
> > Is there a better way to word this?
> How about this:
> 
> It is to note that existence guarantees are stronger than type-safe
> memory and.a strictly stronger existence guarantee also prevents
> freeing of the protected object.

I need to think more about this, so let's defer it until after the
release, which I am planning for tomorrow (Tuesday) morning, Pacific Time.
If I don't get back to this in a week or so, please do remind me.

                                                        Thanx, Paul

> > > >  \item[\IX{Unteachable}:]
> > > >         A topic, concept, method, or mechanism that the teacher does
> > > >         not understand well is therefore uncomfortable teaching.
> > > Many thanks
> > > Zhouyi
> Thanks
> Zhouyi
