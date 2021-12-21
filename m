Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:48864 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbhLUAAb (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 20 Dec 2021 19:00:31 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 628AB61312
        for <perfbook@vger.kernel.org>; Tue, 21 Dec 2021 00:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640044830;
        bh=N1Z2tJ1r2WVRpPFlQuP7NLDkLrHaW9W6r3iXeO8qAE4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=h2votEYxSurrqCETkcf+RZyVjMi+g+uzhfT7MpXTUrQ8yAcXcXYcU6HxTjhfSad6K
         fby7mWRudEOM5tKBQzlFmEJAOOr+xCUNrjCBdS0FCqIaSFMP+7GIt4y7wDfz6Ghwuw
         CsV4raZvMLr44B3tq0sko/nQDpUOQHZ8KzTUC878zC9vYEPH0m9z6aU8Kz4ijx8tZz
         +yXLMcQTrFqdmBc4xCzqzhlaFalBkHWSgA3EIbnw0r2UkIhjmQ+1QdMDOBkH14f4hh
         GbuokPLwOv0OHSywikyU1RXMJ01N1AdAYN4+/oDIULA9+pxq4XfTAZiMAzlY7qv+W8
         WrwPrBf1gAaug==
Date: Mon, 20 Dec 2021 16:00:30 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: A few terms I'd like to see in perfbook's Glossary
Message-ID: <20211221000030.GI641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <e2fcb255-aeba-7d72-a160-5573c5e2455e@gmail.com>
 <20211220174304.GY641268@paulmck-ThinkPad-P17-Gen-1>
 <5773739c-a6bd-b99c-14ae-a1d73edd8321@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5773739c-a6bd-b99c-14ae-a1d73edd8321@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Dec 21, 2021 at 08:46:03AM +0900, Akira Yokosawa wrote:
> On Mon, 20 Dec 2021 09:43:04 -0800, Paul E. McKenney wrote:
> > On Mon, Dec 20, 2021 at 06:55:36PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> While reading through Section 9.5.4, I noticed a few terms
> >> I'd like to see in perfbook's Glossary.
> >>
> >>  - Reference Counter/Counting
> >>  - Existence Guarantee
> >>  - Type-safe Memory
> >>
> >> "Reference counter" is already mentioned in a couple of existing
> >> items in the glossary.
> >>
> >> "Existing guarantee" might be obvious enough and not worthy
> >> to be in the glossary.
> >>
> >> Thoughts?
> >>
> >> There were only a few minor nits in the section.
> >> Will post a patch taking care of them.
> > 
> > Thank you for looking it over!  Please see below for a proposed patch
> > to the glossary.  Oh, and thank you for the checking utilities, very
> > nice to get explicit messages rather than subtlely broken formatting!!!
> > 
> > utilities/punctcheck.sh
> > ./glossary.tex:547:     Type-safe memory\cite{Cheriton96a} is provided by a
> > utilities/cleverefcheck.sh
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit a8f5948a1b8921941bf4039e278aa7929f64c322
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Mon Dec 20 09:41:55 2021 -0800
> > 
> >     glossary: Add reference count, existence guarantee, and TSM
> >     
> >     Where "TSM" is type-safe memory.
> >     
> >     Reported-by: Akira Yokosawa <akiyks@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/glossary.tex b/glossary.tex
> > index be10f703..31c09232 100644
> > --- a/glossary.tex
> > +++ b/glossary.tex
> > @@ -199,6 +199,14 @@
> >  	increase the overall cost of the computation, resulting in
> >  	linear speedups as threads are added (assuming sufficient
> >  	CPUs are available).
> > +\item[\IX{Existence Guarantee}:]
> > +	An existence guarantee is provided by a synchronization mechanism
> > +	that prevents a given dynamically allocated object from being
> > +	freed for the duration of that guarantee.
> > +	For example, RCU provides existence guarantees for the duration
> > +	of RCU read-side critical sections.
> > +	A similar but strictly weaker guarantee is provided by
> > +	type-safe memory.
> >  \item[\IXh{Exclusive}{Lock}:]
> >  	An exclusive lock is a mutual-exclusion mechanism that
> >  	permits only one thread at a time into the
> > @@ -469,6 +477,11 @@
> >  	A situation in which getting the correct result is not sufficient,
> >  	but where this result must also be obtained within a given amount
> >  	of time.
> > +\item[\IX{Reference Count}:]
> > +	A counter that tracks the number of users of a given object or
> > +	entity.
> > +	Reference counters provide existence guarantees and are sometimes
> > +	used to implement garbage collectors.
> >  \item[\IX{Scalability}:]
> >  	A measure of how effectively a given system is able to utilize
> >  	additional resources.
> > @@ -531,6 +544,17 @@
> >  	A synchronization mechanism that gathers groups of memory
> >  	accesses so as to execute them atomically from the viewpoint
> >  	of transactions on other CPUs or threads.
> > +\item[\IX{Type-Safe Memory}:]
> > +	Type-safe memory~\cite{Cheriton96a} is provided by a
> > +	synchronization mechanism that prevents a given dynamically
> > +	allocated object from changing to an incompatible type.
> > +	Note that the object might well be freed and then reallocated, but
> > +	the reallocated object is guaranteed to be of a compatible type.
> > +	Within the Linux kernel, type-safe memory is provided within
> > +	RCU read-side critical sections for memory allocated from slabs
> > +	marked with the \co{SLAB_TYPESAFE_BY_RCU} flag.
> > +	The strictly stronger existence guarantee also prevents freeing
> > +	of the protected object.
> >  \item[\IX{Unteachable}:]
> >  	A topic, concept, method, or mechanism that the teacher does
> >  	not understand well is therefore uncomfortable teaching.
> > 
> 
> Looks good to me!

Very good!  I pushed it out.  We can always wordsmith further later.

							Thanx, Paul
