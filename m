Return-Path: <SRS0=142T=US=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r8DhoF5wykkkU997vDBqkyXCo9TfCgHKLFXWnS+GU+w=;
        b=nRjYWJRgKOLE5xQ8VP9D84+89ulGXTO3cbVy7L0ar3SeGU0Nj58lwdtxwONgacXhKF
         wtMSLrbmb/PhzUE8uvVDU4mX0gLAXmtzXLp61CqCdfxX0HOesuVIzSixFIZYwKeHBzRb
         7EMHI0RyceoFYthVz7dILaXf3UaR7XfaH/Yejq4PjpQDIQGGq/GDOgF5yqnu/yjQSTU9
         W5I2oe5DmuyACqOgfWEwEv7btDOHRVCEuKYhEa8udcM0I6PfLGM7UfJ+iSGMc+sXHuxN
         aVdBRqzv0/lb3UaWZMK1FE6GVBiTlU1aEqyA+ec/e/HDw4vg2DtoganA9Td/itUbfjAV
         uZHQ==
MIME-Version: 1.0
References: <CA+PpKPmTsMMP6n3hYEqNxav_qQcyFPmff0GwYCauyuHY7GDM3w@mail.gmail.com>
 <20220405153120.GH4285@paulmck-ThinkPad-P17-Gen-1> <6cf56caf-6355-0624-27d2-5420265d55e8@gmail.com>
 <20220407164127.GT4285@paulmck-ThinkPad-P17-Gen-1> <d29c329f-a9f6-cf6e-990a-2baea2b74237@gmail.com>
 <20220408014542.GX4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220408014542.GX4285@paulmck-ThinkPad-P17-Gen-1>
From: Hao Lee <haolee.swjtu@gmail.com>
Date: Fri, 8 Apr 2022 16:49:05 +0800
Message-ID: <CA+PpKPmz5eQn9b6JWSYq=gUdJmBPesC02JHonetN0=aO33o4Ug@mail.gmail.com>
Subject: Re: Does perfbook need some prior knowledge?
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, Apr 8, 2022 at 9:45 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Fri, Apr 08, 2022 at 08:18:33AM +0900, Akira Yokosawa wrote:
> > On Thu, 7 Apr 2022 09:41:27 -0700,
> > Paul E. McKenney wrote:
> > > On Fri, Apr 08, 2022 at 12:29:36AM +0900, Akira Yokosawa wrote:
> > >> Hi Paul,
> > >>
> > >> Let me make a suggestion regarding Hao's poor experience as a first-time
> > >> reader of Section 4.3.
> > >>
> > >> On Tue, 5 Apr 2022 08:31:20 -0700,
> > >> Paul E. McKenney wrote:
> > >>> On Tue, Apr 05, 2022 at 09:52:23PM +0800, Hao Lee wrote:
> > >>>> Hi, Paul
> > >>>>
> > >>>> I'm currently reading perfbook, but I often get stuck in some concepts
> > >>>> which are not explained. Does this book need some prior knowledge?
> > >>>> Or all these concepts are explained later and I just need to keep
> > >>>> reading patiently?
> > >>>>
> > >>>> For example, on page 67 in v2021.12.22a:
> > >>>>
> > >>>>     For example, a write memory barrier (Linux kernel smp_wmb()) would
> > >>>>     order the store, but not the load. This situation might suggest use
> > >>>>     of smp_store_release() over smp_wmb().
> > >>
> > >> So this is in Section 4.3.4.1 "Shared-Variable Shenanigans".
> > >>
> > >> I think one of the purpose of Chapter 4 is an introduction to various
> > >> constructs which are used/discussed in later chapters and CodeSamples.
> > >>
> > >> If I were a first-time reader, I'd find Section 4.3.4 out-of-place
> > >> because other sections in this chapter explain APIs and their usages
> > >> in a brief manner.
> > >>
> > >> My suggestion is to move hard parts of Section 4.3.4 to a later
> > >> chapter/appendix and to leave a brief introduction in Chapter 4 around
> > >> the discussion of READ_ONCE() and WRITE_ONCE().
> > >>
> > >> And I believe you have intentionally avoided discussing memory ordering
> > >> and memory barriers in Chapter 4, as they are pretty "advanced" topic.
> > >>
> > >> So a brief introduction to them in Chapter 4 would also be helpful.
> > >>
> > >> I think "data race" and "battle with compiler optimizations" in
> > >> accessing shared memory from C are also "advanced" topics in that
> > >> they are not intuitive for those who is willing to learn parallel
> > >> programming.
> > >>
> > >> Thoughts?
> > >
> > > One approach would be to make 4.3.4 "Accessing Shared Variables" be
> > > much smaller and more directive.  ("Don't access concurrently modified
> > > shared variables using plain C-language loads and stores.")  Also
> > > describe READ_ONCE() and WRITE_ONCE().
> > >
> > > Then move 4.3.4 to be a section in the "Advanced Synchronization"
> > > chapter, and probably the first chapter.
> >
> > What do you mean by "the first chapter"?
>
> Gah!  That should have been "the first section".  :-/
>
> > >                                           Forward-reference this
> > > section from the reworked 4.3.4 ("If you don't believe me, go read
> > > this new section!").
> > >
> > > Expand 4.3.5 "Atomic Operations" to give more detail on what these
> > > operations do.  Or maybe rely on additions to the Glossary?
> >
> > Ah, smp_load_acquire() and smp_store_release() are mentioned there
> > without explaining what they are!  Yes, some expansion or reference
> > should help.
>
> Sounds like a plan, both expanding that section and populating the
> glossary.  Will do!
>
> > > Add a 4.3.x section on memory barriers, saying that they provide ordering,
> > > and also saying that both thread's accesses must be ordered for anything
> > > useful to happen.  Forward-reference the memory-ordering chapter.
> >
> > Section 3.1.4 already mentions memory barriers very briefly.
> > Appendix C is also a good starting point.
>
> Good points, thank you!

I think Appendix C is very fundamental and it's hard to understand barriers
or other synchronization primitives without reading Appendix C. How about
make it a Chapter instead of an appendix.

>
> > > Would this help, or is there a better way?
> >
> > This sounds like a reasonable plan.
> >
> > >
> > >>>> Unfortunately, although I have some knowledge about Linux kernel, I'm not
> > >>>> familiar with the concepts such as store_release, smp_wmb, etc. I don't
> > >>>> know if I should keep reading this book until all these concepts are
> > >>>> explained or stop reading the book and learn some prior knowledge.>
> > >>> Good point.  On the one hand, this book is rather advanced, but on the
> > >>> other hand, it needs to be as accessible as is reasonably possible.
> > >>
> > >> Expanding general Index and API Index might be helpful here.
> > >> At the moment, they are "work in progress".  Somehow, there is no entry
> > >> related to memory barriers in the general Index, and very limited memory
> > >> barrier primitives in API Index.  This may be due to the lack of
> > >> "memory barrier" and related terms in Glossary.
> > >
> > > I need to add at least the following to the glossary:
> > >
> > > o   Acquire load.
> > > o   Release store.
> > > o   Memory barrier.
> > > o   Read memory barrier.
> > > o   Write memory barrier.
> > >
> > > Any others?
> >
> > This list looks reasonable to me.
>
> Sounds good, and will do!
>
>                                                         Thanx, Paul
