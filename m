Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbiDHBrr (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 7 Apr 2022 21:47:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA1CFF
        for <perfbook@vger.kernel.org>; Thu,  7 Apr 2022 18:45:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 05246B82996
        for <perfbook@vger.kernel.org>; Fri,  8 Apr 2022 01:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649382342;
        bh=Gbn29mqIRvj8ETvWfgyta3yGeBYsXJaZF/Om4jQfGk4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=XAQ3cM88ViABUiKjltAJNuEpbrxrHrvLWhN9Bgmj3f0/aADbPPX/gR0MAKe8lTKFu
         K2Vyw6lV/aBRjlziF+zzN7nbennyZrC5lnkktqvMtf4WUymsXUggWIkoxldo5ZeRhD
         tHtOWtQ2DZ1ruHctzenu/sl6j/2IKhKdvCFyd6/4Gc66gbQ51mU2MKlO1eAosfbS5k
         lW7yWAffxvCb4EsRpCGCpm1T9sohTXbWmR+AhArpiPSw5FPrVdmVSN+h5DW13CvjKz
         o6hAA/BR82mtIOU2DcRSS0BADl3yOldvl66BoBc/Yb9PMtcnoq6Q/rs8kLVQ3uDPjF
         crft+bTjtDOUg==
Date: Thu, 7 Apr 2022 18:45:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Does perfbook need some prior knowledge?
Message-ID: <20220408014542.GX4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CA+PpKPmTsMMP6n3hYEqNxav_qQcyFPmff0GwYCauyuHY7GDM3w@mail.gmail.com>
 <20220405153120.GH4285@paulmck-ThinkPad-P17-Gen-1>
 <6cf56caf-6355-0624-27d2-5420265d55e8@gmail.com>
 <20220407164127.GT4285@paulmck-ThinkPad-P17-Gen-1>
 <d29c329f-a9f6-cf6e-990a-2baea2b74237@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d29c329f-a9f6-cf6e-990a-2baea2b74237@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Hao Lee <haolee.swjtu@gmail.com>

On Fri, Apr 08, 2022 at 08:18:33AM +0900, Akira Yokosawa wrote:
> On Thu, 7 Apr 2022 09:41:27 -0700,
> Paul E. McKenney wrote:
> > On Fri, Apr 08, 2022 at 12:29:36AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> Let me make a suggestion regarding Hao's poor experience as a first-time
> >> reader of Section 4.3.
> >>
> >> On Tue, 5 Apr 2022 08:31:20 -0700,
> >> Paul E. McKenney wrote:
> >>> On Tue, Apr 05, 2022 at 09:52:23PM +0800, Hao Lee wrote:
> >>>> Hi, Paul
> >>>>
> >>>> I'm currently reading perfbook, but I often get stuck in some concepts
> >>>> which are not explained. Does this book need some prior knowledge?
> >>>> Or all these concepts are explained later and I just need to keep
> >>>> reading patiently?
> >>>>
> >>>> For example, on page 67 in v2021.12.22a:
> >>>>
> >>>>     For example, a write memory barrier (Linux kernel smp_wmb()) would
> >>>>     order the store, but not the load. This situation might suggest use
> >>>>     of smp_store_release() over smp_wmb().
> >>
> >> So this is in Section 4.3.4.1 "Shared-Variable Shenanigans".
> >>
> >> I think one of the purpose of Chapter 4 is an introduction to various
> >> constructs which are used/discussed in later chapters and CodeSamples.
> >>
> >> If I were a first-time reader, I'd find Section 4.3.4 out-of-place
> >> because other sections in this chapter explain APIs and their usages
> >> in a brief manner.
> >>
> >> My suggestion is to move hard parts of Section 4.3.4 to a later
> >> chapter/appendix and to leave a brief introduction in Chapter 4 around
> >> the discussion of READ_ONCE() and WRITE_ONCE().
> >>
> >> And I believe you have intentionally avoided discussing memory ordering
> >> and memory barriers in Chapter 4, as they are pretty "advanced" topic.
> >>
> >> So a brief introduction to them in Chapter 4 would also be helpful.
> >>
> >> I think "data race" and "battle with compiler optimizations" in
> >> accessing shared memory from C are also "advanced" topics in that
> >> they are not intuitive for those who is willing to learn parallel
> >> programming.
> >>
> >> Thoughts?
> > 
> > One approach would be to make 4.3.4 "Accessing Shared Variables" be
> > much smaller and more directive.  ("Don't access concurrently modified
> > shared variables using plain C-language loads and stores.")  Also
> > describe READ_ONCE() and WRITE_ONCE().
> > 
> > Then move 4.3.4 to be a section in the "Advanced Synchronization"
> > chapter, and probably the first chapter.
> 
> What do you mean by "the first chapter"?

Gah!  That should have been "the first section".  :-/

> >                                           Forward-reference this
> > section from the reworked 4.3.4 ("If you don't believe me, go read
> > this new section!").
> > 
> > Expand 4.3.5 "Atomic Operations" to give more detail on what these
> > operations do.  Or maybe rely on additions to the Glossary?
> 
> Ah, smp_load_acquire() and smp_store_release() are mentioned there
> without explaining what they are!  Yes, some expansion or reference
> should help.

Sounds like a plan, both expanding that section and populating the
glossary.  Will do!

> > Add a 4.3.x section on memory barriers, saying that they provide ordering,
> > and also saying that both thread's accesses must be ordered for anything
> > useful to happen.  Forward-reference the memory-ordering chapter.
> 
> Section 3.1.4 already mentions memory barriers very briefly.
> Appendix C is also a good starting point.

Good points, thank you!

> > Would this help, or is there a better way?
> 
> This sounds like a reasonable plan.
> 
> > 
> >>>> Unfortunately, although I have some knowledge about Linux kernel, I'm not
> >>>> familiar with the concepts such as store_release, smp_wmb, etc. I don't
> >>>> know if I should keep reading this book until all these concepts are
> >>>> explained or stop reading the book and learn some prior knowledge.> 
> >>> Good point.  On the one hand, this book is rather advanced, but on the
> >>> other hand, it needs to be as accessible as is reasonably possible.
> >>
> >> Expanding general Index and API Index might be helpful here.
> >> At the moment, they are "work in progress".  Somehow, there is no entry
> >> related to memory barriers in the general Index, and very limited memory
> >> barrier primitives in API Index.  This may be due to the lack of
> >> "memory barrier" and related terms in Glossary.
> > 
> > I need to add at least the following to the glossary:
> > 
> > o	Acquire load.
> > o	Release store.
> > o	Memory barrier.
> > o	Read memory barrier.
> > o	Write memory barrier.
> > 
> > Any others?
> 
> This list looks reasonable to me.

Sounds good, and will do!

							Thanx, Paul
