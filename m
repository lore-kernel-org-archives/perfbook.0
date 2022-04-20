Return-Path: <SRS0=EWIF=U6=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SOPjFuROxJ/ATAooBwxFc5C4O09fGBY/3o4mV/KvTAg=;
        b=n2gJvncXWRZYadvA0vmMk1gur9RGzWztlndj8WmRG+s+oehciDgEp+C4lkYPRRv6W2
         ZMa4FBGYm1D9R7Xn9+RG1JvP+Dj/qEvRca/6dHXhDEJn4mEHK9KfBcfXIX16oJQ+F0I3
         nhm/otwO2/8Dlog2myeDsepMrEt7l5SITE0im1IwtWTvbWU/EcNCqKXmts8R5mSqF8fw
         dRVs31x9zl/JUCRj24pMBmu5aYdDcWGKfN1u/Vr83/Q2XhbHRLM/z/N49NDaBmUNk7//
         27y1es/SuBHRQgeJFfktiQxqTxqTUv6BQJLQzlVhAzJ8NArHX4HihzblmzVLmdjTvTYb
         0m/Q==
Date: Wed, 20 Apr 2022 11:57:27 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: Re: Does perfbook need some prior knowledge?
Message-ID: <20220420115727.GC25933@haolee.io>
References: <CA+PpKPmTsMMP6n3hYEqNxav_qQcyFPmff0GwYCauyuHY7GDM3w@mail.gmail.com>
 <20220405153120.GH4285@paulmck-ThinkPad-P17-Gen-1>
 <6cf56caf-6355-0624-27d2-5420265d55e8@gmail.com>
 <20220407164127.GT4285@paulmck-ThinkPad-P17-Gen-1>
 <d29c329f-a9f6-cf6e-990a-2baea2b74237@gmail.com>
 <20220408014542.GX4285@paulmck-ThinkPad-P17-Gen-1>
 <CA+PpKPmz5eQn9b6JWSYq=gUdJmBPesC02JHonetN0=aO33o4Ug@mail.gmail.com>
 <20220419174626.GR4285@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419174626.GR4285@paulmck-ThinkPad-P17-Gen-1>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Apr 19, 2022 at 10:46:26AM -0700, Paul E. McKenney wrote:
> On Fri, Apr 08, 2022 at 04:49:05PM +0800, Hao Lee wrote:
> > On Fri, Apr 8, 2022 at 9:45 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > On Fri, Apr 08, 2022 at 08:18:33AM +0900, Akira Yokosawa wrote:
> > > > On Thu, 7 Apr 2022 09:41:27 -0700,
> > > > Paul E. McKenney wrote:
> > > > > On Fri, Apr 08, 2022 at 12:29:36AM +0900, Akira Yokosawa wrote:
> > > > >> Hi Paul,
> > > > >>
> > > > >> Let me make a suggestion regarding Hao's poor experience as a first-time
> > > > >> reader of Section 4.3.
> > > > >>
> > > > >> On Tue, 5 Apr 2022 08:31:20 -0700,
> > > > >> Paul E. McKenney wrote:
> > > > >>> On Tue, Apr 05, 2022 at 09:52:23PM +0800, Hao Lee wrote:
> > > > >>>> Hi, Paul
> > > > >>>>
> > > > >>>> I'm currently reading perfbook, but I often get stuck in some concepts
> > > > >>>> which are not explained. Does this book need some prior knowledge?
> > > > >>>> Or all these concepts are explained later and I just need to keep
> > > > >>>> reading patiently?
> > > > >>>>
> > > > >>>> For example, on page 67 in v2021.12.22a:
> > > > >>>>
> > > > >>>>     For example, a write memory barrier (Linux kernel smp_wmb()) would
> > > > >>>>     order the store, but not the load. This situation might suggest use
> > > > >>>>     of smp_store_release() over smp_wmb().
> > > > >>
> > > > >> So this is in Section 4.3.4.1 "Shared-Variable Shenanigans".
> > > > >>
> > > > >> I think one of the purpose of Chapter 4 is an introduction to various
> > > > >> constructs which are used/discussed in later chapters and CodeSamples.
> > > > >>
> > > > >> If I were a first-time reader, I'd find Section 4.3.4 out-of-place
> > > > >> because other sections in this chapter explain APIs and their usages
> > > > >> in a brief manner.
> > > > >>
> > > > >> My suggestion is to move hard parts of Section 4.3.4 to a later
> > > > >> chapter/appendix and to leave a brief introduction in Chapter 4 around
> > > > >> the discussion of READ_ONCE() and WRITE_ONCE().
> > > > >>
> > > > >> And I believe you have intentionally avoided discussing memory ordering
> > > > >> and memory barriers in Chapter 4, as they are pretty "advanced" topic.
> > > > >>
> > > > >> So a brief introduction to them in Chapter 4 would also be helpful.
> > > > >>
> > > > >> I think "data race" and "battle with compiler optimizations" in
> > > > >> accessing shared memory from C are also "advanced" topics in that
> > > > >> they are not intuitive for those who is willing to learn parallel
> > > > >> programming.
> > > > >>
> > > > >> Thoughts?
> > > > >
> > > > > One approach would be to make 4.3.4 "Accessing Shared Variables" be
> > > > > much smaller and more directive.  ("Don't access concurrently modified
> > > > > shared variables using plain C-language loads and stores.")  Also
> > > > > describe READ_ONCE() and WRITE_ONCE().
> > > > >
> > > > > Then move 4.3.4 to be a section in the "Advanced Synchronization"
> > > > > chapter, and probably the first chapter.
> > > >
> > > > What do you mean by "the first chapter"?
> > >
> > > Gah!  That should have been "the first section".  :-/
> > >
> > > > >                                           Forward-reference this
> > > > > section from the reworked 4.3.4 ("If you don't believe me, go read
> > > > > this new section!").
> > > > >
> > > > > Expand 4.3.5 "Atomic Operations" to give more detail on what these
> > > > > operations do.  Or maybe rely on additions to the Glossary?
> > > >
> > > > Ah, smp_load_acquire() and smp_store_release() are mentioned there
> > > > without explaining what they are!  Yes, some expansion or reference
> > > > should help.
> > >
> > > Sounds like a plan, both expanding that section and populating the
> > > glossary.  Will do!
> > >
> > > > > Add a 4.3.x section on memory barriers, saying that they provide ordering,
> > > > > and also saying that both thread's accesses must be ordered for anything
> > > > > useful to happen.  Forward-reference the memory-ordering chapter.
> > > >
> > > > Section 3.1.4 already mentions memory barriers very briefly.
> > > > Appendix C is also a good starting point.
> > >
> > > Good points, thank you!
> > 
> > I think Appendix C is very fundamental and it's hard to understand barriers
> > or other synchronization primitives without reading Appendix C. How about
> > make it a Chapter instead of an appendix.
> 
> The intent is that Section 3.2.3 ("Hardware Optimizations") summarizes
> the portions of Appendix C needed by the casual reader.  What should be
> added to this section?  For example, maybe Figure C.1 and/or C.2 needs
> to be added, or maybe an updated version of Figure C.1 that includes
> the store buffer.
> 
> I could add the invalidation queue, but my feeling is that this is too
> advanced for Section 3.2.3.

Agree. I think 3.2.3 is good enough and there is no need to add more
contents.

> 
> If your feedback results in sufficient improvements to Appendix C, I
> could imagine it moving as an additional chapter following Chapter 15
> ("Advanced Synchronization: Memory Ordering"), perhaps entitled "Advanced
> Synchronization: Hardware Memory Optimizations" or some such.
> 
> > > > > Would this help, or is there a better way?

I find Appendix C pretty helpful, and this is the second time I have
read it. From my point of view, Appendix C is the prerequisite to
understand Chapter 15. It's hard to have a deep understanding of Chapter
15 without the knowledge in Appendix C. Moving Chapter 15 as an
additional chapter before Chapter 15 could make readers pay more
attention to it.

> > > >
> > > > This sounds like a reasonable plan.
> > > >
> > > > >
> > > > >>>> Unfortunately, although I have some knowledge about Linux kernel, I'm not
> > > > >>>> familiar with the concepts such as store_release, smp_wmb, etc. I don't
> > > > >>>> know if I should keep reading this book until all these concepts are
> > > > >>>> explained or stop reading the book and learn some prior knowledge.>
> > > > >>> Good point.  On the one hand, this book is rather advanced, but on the
> > > > >>> other hand, it needs to be as accessible as is reasonably possible.
> > > > >>
> > > > >> Expanding general Index and API Index might be helpful here.
> > > > >> At the moment, they are "work in progress".  Somehow, there is no entry
> > > > >> related to memory barriers in the general Index, and very limited memory
> > > > >> barrier primitives in API Index.  This may be due to the lack of
> > > > >> "memory barrier" and related terms in Glossary.
> > > > >
> > > > > I need to add at least the following to the glossary:
> > > > >
> > > > > o   Acquire load.
> > > > > o   Release store.
> > > > > o   Memory barrier.
> > > > > o   Read memory barrier.
> > > > > o   Write memory barrier.
> > > > >
> > > > > Any others?
> > > >
> > > > This list looks reasonable to me.
> > >
> > > Sounds good, and will do!
> 
> This part at least is done.  ;-)

Thank you for your hard work!


Thanks,
Hao Lee

> 
> 							Thanx, Paul
