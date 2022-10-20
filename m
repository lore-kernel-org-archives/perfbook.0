Return-Path: <SRS0=gtIP=2V=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BD7GeXHnfy4RUNXjAC9JZxfeQDemLl/rSiIWwd7niQk=;
        b=g3HNlUgCg1M210FmJ22POF6inelnOi0BhdC1NAPA7l/DZkwfweqhiPnhziPor27QWT
         2il+4G9R9hDkmSDCfLnzHJW32P1ljpCuCpqGVunYrRm+nOzXUiLY9O3LtCtEejdXdMs2
         JRxgU7r5WV4BBVLsLIlJf6QLCP0XTuB/NBxCroV5CxRVGzT9BvnB3g/RcYCoAG2tRi5M
         L+UYgkjAmY6jasEpfv4pu5HuyFb/tbJYEpNrjU2HdcQ+M6QWaWWMxKmanOWrR1eUqMz8
         HMku9giXQdJxq5x8Yk45iLc/QcshCPqFLhMVFvbtRkYeoh5W7vkBqCfdhCt1W2JtjfgK
         Ae1w==
MIME-Version: 1.0
References: <CAJbg=FXoEOio8u72S20cWxJYcu1Z5No7n9bpNOQB8THnVzraqA@mail.gmail.com>
 <20221019221556.GG5600@paulmck-ThinkPad-P17-Gen-1> <CAJbg=FXLkn=+dmf+umO1s_OJDjHDFZuBnxYK318eU4Ps9oNXTQ@mail.gmail.com>
In-Reply-To: <CAJbg=FXLkn=+dmf+umO1s_OJDjHDFZuBnxYK318eU4Ps9oNXTQ@mail.gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Thu, 20 Oct 2022 06:21:13 -0400
Message-ID: <CAJbg=FW2ggFf4RedzPCKnUHwc=WbbU0XNmz-BYi7Ms6fWc1C2w@mail.gmail.com>
Subject: Re: Section 7.3.2: Mention of futexes
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Sorry, I think I went on a tangent and lost the gist of my original
point. Let me clarify.

The paragraph in the book discusses a real problem with spin locks. A
low priority thread acquires a spin lock. A high priority thread
preempts it and attempts to acquire the same lock. Under certain
circumstances (single processor machines, core affinity) this can lead
to a deadlock. Such a deadlock is solved by using blocking locks
instead of spin locks. Linux futexes implement one kind of a blocking
lock, but I don't think are special in this sense. Moreover, blocking
locks are susceptible to a different problem in this scenario, as the
high priority thread is effectively waiting for the lock at the
priority of the low-priority thread (priority inversion). The
situation is remedied (I wouldn't necessarily say solved) by protocols
such as priority inheritance and priority protection.

--Elad

On Wed, 19 Oct 2022 at 20:18, Elad Lahav <e2lahav@gmail.com> wrote:
>
> Hmm... I may be wrong but I thought Linux futexes worked the same way
> as QNX mutexes:
>
> 1. The kernel provides a blocking call, implementing a classic mutex
> (SyncMutexLock() in the QNX case)
> 2. The C library wraps this call (pthread_mutex_lock()) with an
> attempt to acquire a user-mode lock without entering the kernel, using
> an atomic compare-exchange. The kernel call is invoked only if the
> atomic operation fails.
>
> If that is true for Linux then I still don't see how it is related to
> spin locks, which don't block, and the legitimate requirement to
> prevent preemption while holding a spin lock. It is definitely
> legitimate to say "don't use spin locks in user code, use blocking
> locks instead". In a micro-kernel based OS you may have to use spin
> locks in user-mode drivers that need to interact with ISRs, but those
> need to go beyond disabling preemption and disable interrupts
> completely.
>
> --Elad
>
> On Wed, 19 Oct 2022 at 18:15, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Fri, Oct 14, 2022 at 08:01:29AM -0400, Elad Lahav wrote:
> > > Hello,
> > >
> > > I'm not sure about the statement made in this section: "In contrast,
> > > Linux avoids these hints, in-
> > > stead getting similar results from a mechanism called futexes".
> > > Futexes are just wrappers around kernel mutexes, to speed up the case
> > > of acquiring a free lock. As such they do not solve the priority
> > > inversion problem, and are certainly not a replacement for disabling
> > > pre-emption when using spin locks.
> > > Kernel-level mutexes may address priority inversion by employing one
> > > of the established protocols (priority inheritance or priority
> > > protection).
> > >
> > > Am I missing something?
> >
> > Futexes were the response of the Linux kernel community to the request
> > from certain large database vendors for the ability to disable preemption
> > in userspace applications.  I was there and I heard it with my own ears,
> > but to your point I find little on the web to back this up.  In fact,
> > I am not easily finding the fact that most proprietary UNIX kernels did
> > in fact have userspace disable-preemption hints.
> >
> > Futexes are more a sleep/wakeup mechanism than a wrapper around mutexes,
> > though there was a hilarious bug early on that allowed a usermode
> > application to force a kernel-mode deadlock.  The semantics are involved,
> > a fact being driven home to those attempting to standardize it.
> >
> > How about the following change?  This documents futexes as the response
> > to the request for scheduler-conscious synchronization, but does not
> > claim anything beyond that.
> >
> >                                                         Thanx, Paul
> >
> > ------------------------------------------------------------------------
> >
> > commit 63c4deb868d5eec9df96fd8810e58e1519abb392
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Wed Oct 19 15:14:03 2022 -0700
> >
> >     locking: Avoid over-claiming for futexes
> >
> >     It is true that futexes were the response of the Linux-kernel community
> >     to requests for user-mode disabling of preemption, but it is not clear
> >     how futexes were evaluated by those making the requests.
> >
> >     Reported-by: Elad Lahav <e2lahav@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> >
> > diff --git a/locking/locking.tex b/locking/locking.tex
> > index b138cd59..6d3bb1c8 100644
> > --- a/locking/locking.tex
> > +++ b/locking/locking.tex
> > @@ -2057,8 +2057,9 @@ being placed in a machine register.
> >  These hints frequently take the form of a bit set in a particular
> >  machine register, which enables extremely low per-lock-acquisition overhead
> >  for these mechanisms.
> > -In contrast, Linux avoids these hints, instead getting
> > -similar results from a mechanism called
> > +In contrast, Linux avoids these hints.
> > +Instead, the Linux kernel community's response to requests for
> > +scheduler-conscious synchronization was a mechanism called
> >  \emph{futexes}~\cite{HubertusFrancke2002Futex,IngoMolnar2006RobustFutexes,StevenRostedt2006piFutexes,UlrichDrepper2011Futexes}.
> >
> >  Interestingly enough, atomic instructions are not strictly needed to
