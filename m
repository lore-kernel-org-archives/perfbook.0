Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbiJTQFS (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 20 Oct 2022 12:05:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4D5ACA3E
        for <perfbook@vger.kernel.org>; Thu, 20 Oct 2022 09:04:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E410E61BB5
        for <perfbook@vger.kernel.org>; Thu, 20 Oct 2022 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666281890;
        bh=J9yL7Fp7eSL8B7GRHUI4v1oaBikd1ifPU5e+l50q7e4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=H7eCXxeonSftD3gGE45KYguwosE/WqItwH98KYcpH6SVcBopQBofzB9BlkfueQ5CK
         DsL139BDFKuFSgQ4JMI6EnwfxuUhGK1xZs9/p2DwlK2FBO7IukiFRxH2DcqMNIaaGi
         zIpGBZJr6z2lBgC2B7/1LZ+9qwgFtwAVG+lVZMwffREYGU0vT3k7CM86bmdHfo5ZwB
         YO8bTcqvr6Dq1pNBXwAxKlp+CggvcpnI3B9kUUazjHPQXfypk2qfHwqO6OOVUg7IE9
         kqAjE79hkrBdpDiPYiQZEqo4iRcPgqkowNYiNJjUiYKBuWE4FarHaCB47AQOKTHW+A
         ZhgFpQMFH8zJg==
Date: Thu, 20 Oct 2022 09:04:49 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Section 7.3.2: Mention of futexes
Message-ID: <20221020160449.GN5600@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FXoEOio8u72S20cWxJYcu1Z5No7n9bpNOQB8THnVzraqA@mail.gmail.com>
 <20221019221556.GG5600@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FXLkn=+dmf+umO1s_OJDjHDFZuBnxYK318eU4Ps9oNXTQ@mail.gmail.com>
 <CAJbg=FW2ggFf4RedzPCKnUHwc=WbbU0XNmz-BYi7Ms6fWc1C2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FW2ggFf4RedzPCKnUHwc=WbbU0XNmz-BYi7Ms6fWc1C2w@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Oct 20, 2022 at 06:21:13AM -0400, Elad Lahav wrote:
> Sorry, I think I went on a tangent and lost the gist of my original
> point. Let me clarify.

I must confess that I was wondering how much I could say about
Linux-kernel futexes without causing you trouble.  ;-)

But it should be safe to reiterate that Linux-kernel futexes involve
a priority-sensitive wait queue hooked into a word of memory in the
user's memory.  Yes, the implementation also uses mutexes.

> The paragraph in the book discusses a real problem with spin locks. A
> low priority thread acquires a spin lock. A high priority thread
> preempts it and attempts to acquire the same lock. Under certain
> circumstances (single processor machines, core affinity) this can lead
> to a deadlock. Such a deadlock is solved by using blocking locks
> instead of spin locks. Linux futexes implement one kind of a blocking
> lock, but I don't think are special in this sense. Moreover, blocking
> locks are susceptible to a different problem in this scenario, as the
> high priority thread is effectively waiting for the lock at the
> priority of the low-priority thread (priority inversion). The
> situation is remedied (I wouldn't necessarily say solved) by protocols
> such as priority inheritance and priority protection.

And futexes do provide for priority inheritance when the user asks for it.
At some cost, which is of course why not all users ask.

							Thanx, Paul

> --Elad
> 
> On Wed, 19 Oct 2022 at 20:18, Elad Lahav <e2lahav@gmail.com> wrote:
> >
> > Hmm... I may be wrong but I thought Linux futexes worked the same way
> > as QNX mutexes:
> >
> > 1. The kernel provides a blocking call, implementing a classic mutex
> > (SyncMutexLock() in the QNX case)
> > 2. The C library wraps this call (pthread_mutex_lock()) with an
> > attempt to acquire a user-mode lock without entering the kernel, using
> > an atomic compare-exchange. The kernel call is invoked only if the
> > atomic operation fails.
> >
> > If that is true for Linux then I still don't see how it is related to
> > spin locks, which don't block, and the legitimate requirement to
> > prevent preemption while holding a spin lock. It is definitely
> > legitimate to say "don't use spin locks in user code, use blocking
> > locks instead". In a micro-kernel based OS you may have to use spin
> > locks in user-mode drivers that need to interact with ISRs, but those
> > need to go beyond disabling preemption and disable interrupts
> > completely.
> >
> > --Elad
> >
> > On Wed, 19 Oct 2022 at 18:15, Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > On Fri, Oct 14, 2022 at 08:01:29AM -0400, Elad Lahav wrote:
> > > > Hello,
> > > >
> > > > I'm not sure about the statement made in this section: "In contrast,
> > > > Linux avoids these hints, in-
> > > > stead getting similar results from a mechanism called futexes".
> > > > Futexes are just wrappers around kernel mutexes, to speed up the case
> > > > of acquiring a free lock. As such they do not solve the priority
> > > > inversion problem, and are certainly not a replacement for disabling
> > > > pre-emption when using spin locks.
> > > > Kernel-level mutexes may address priority inversion by employing one
> > > > of the established protocols (priority inheritance or priority
> > > > protection).
> > > >
> > > > Am I missing something?
> > >
> > > Futexes were the response of the Linux kernel community to the request
> > > from certain large database vendors for the ability to disable preemption
> > > in userspace applications.  I was there and I heard it with my own ears,
> > > but to your point I find little on the web to back this up.  In fact,
> > > I am not easily finding the fact that most proprietary UNIX kernels did
> > > in fact have userspace disable-preemption hints.
> > >
> > > Futexes are more a sleep/wakeup mechanism than a wrapper around mutexes,
> > > though there was a hilarious bug early on that allowed a usermode
> > > application to force a kernel-mode deadlock.  The semantics are involved,
> > > a fact being driven home to those attempting to standardize it.
> > >
> > > How about the following change?  This documents futexes as the response
> > > to the request for scheduler-conscious synchronization, but does not
> > > claim anything beyond that.
> > >
> > >                                                         Thanx, Paul
> > >
> > > ------------------------------------------------------------------------
> > >
> > > commit 63c4deb868d5eec9df96fd8810e58e1519abb392
> > > Author: Paul E. McKenney <paulmck@kernel.org>
> > > Date:   Wed Oct 19 15:14:03 2022 -0700
> > >
> > >     locking: Avoid over-claiming for futexes
> > >
> > >     It is true that futexes were the response of the Linux-kernel community
> > >     to requests for user-mode disabling of preemption, but it is not clear
> > >     how futexes were evaluated by those making the requests.
> > >
> > >     Reported-by: Elad Lahav <e2lahav@gmail.com>
> > >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > >
> > > diff --git a/locking/locking.tex b/locking/locking.tex
> > > index b138cd59..6d3bb1c8 100644
> > > --- a/locking/locking.tex
> > > +++ b/locking/locking.tex
> > > @@ -2057,8 +2057,9 @@ being placed in a machine register.
> > >  These hints frequently take the form of a bit set in a particular
> > >  machine register, which enables extremely low per-lock-acquisition overhead
> > >  for these mechanisms.
> > > -In contrast, Linux avoids these hints, instead getting
> > > -similar results from a mechanism called
> > > +In contrast, Linux avoids these hints.
> > > +Instead, the Linux kernel community's response to requests for
> > > +scheduler-conscious synchronization was a mechanism called
> > >  \emph{futexes}~\cite{HubertusFrancke2002Futex,IngoMolnar2006RobustFutexes,StevenRostedt2006piFutexes,UlrichDrepper2011Futexes}.
> > >
> > >  Interestingly enough, atomic instructions are not strictly needed to
