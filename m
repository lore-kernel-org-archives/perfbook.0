Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbfLHBPv (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 7 Dec 2019 20:15:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575767751;
        bh=L/XlvG9EdHEmC9Oa07zi3lpissnprXAhQp7iNhQXeeg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=sruvsA9egM7b2+hczUQB1zdZRbhLuElgQ9AAK1TY4ILL0bjxcpZ6Xlavj10gBc1Au
         17oMX4SDA5dPDmbl/XG6iNEBZu6CYHPfLmveYYuvYohMkNxDBldYQE+PnNPhArwiL1
         WEO4dthtZXSYrYEcnct1AyGRF5EJTMsL+TefHde8=
Date: Sat, 7 Dec 2019 17:15:50 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/2] Minor updates
Message-ID: <20191208011550.GT2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <eb5c3f76-c84f-c801-ceb4-27efd64e2d0f@gmail.com>
 <20191207164308.GP2889@paulmck-ThinkPad-P72>
 <881ccdd8-1d59-649e-38d1-b65601262f0d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <881ccdd8-1d59-649e-38d1-b65601262f0d@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Dec 08, 2019 at 08:41:45AM +0900, Akira Yokosawa wrote:
> On Sat, 7 Dec 2019 08:43:08 -0800, Paul E. McKenney wrote:
> > On Sat, Dec 07, 2019 at 01:05:17PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> This patch set fixes minor issues I noticed while reading your
> >> recent updates.
> > 
> > Queued and pushed, along with a fix to another of my typos, thank
> > you very much!
> > 
> >> Apart from the changes, I'd like you to mention in the answer to
> >> Quick Quiz 9.43 that modern Intel CPUs don't execute x86_64
> >> instructions directly, but decode them into uOPs (via MOP) and
> >> keep them in a uOP cache [1].
> >> So the execution cycle is not necessarily corresponds to instruction
> >> count, but heavily depends on the behavior of the microarch, which
> >> is not predictable without actually running the code. 
> >>
> >> [1]: https://en.wikichip.org/wiki/intel/microarchitectures/skylake_(server)
> > 
> > My thought is that I should review the "Hardware and it Habits" chapter,
> > add this information if it is not already present, and then make the
> > answer to this Quick Quiz refer back to that.  Does that seem reasonable?
> 
> Yes, it sounds quite reasonable!
> 
> (Skimming through the chapter...)
> 
> So Section 3.1.1 lightly touches pipelining. Section 3.2 mostly discusses
> memory sub-systems.
> 
> Modern Intel architectures can be thought of as superscalar RISC
> processors which emulate x86 ISA. The transformation of x86 instructions
> into uOPs can be thought of as another layer of optimization
> (sometimes "de-optimization" from compiler writer's POV) ;-).
> 
> But deep-diving this topic would cost you another chapter/appendix.
> I'm not sure if it's worthwhile for perfbook.
> Maybe it would suffice to lightly touch the difficulty of
> predicting execution cycles of particular instruction streams
> on modern microprocessors (not limited to Intel's), and put
> a few citations of textbooks/reference manuals.

What I did was to add a rough diagram and a paragraph or two of
explanation to Section 3.1.1, then add a reference to that section
in the Quick Quiz.

> > Also, I am thinking in terms of a release (not yet an edition) in
> > the near term.  Anything else that absolutely must be fixed first?
> 
> There remains a couple of ACCESS_ONCE()s. I'm submitting a patch
> to get rid of them.  I don't have any other pending urgent fixes
> at the moment.

Got it, thank you!

							Thanx, Paul

>        Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira
> >> --
> >> Akira Yokosawa (2):
> >>   toyrcu: Use mathcal O for 'orders of'
> >>   defer/rcuusage: Fix typo (that -> than)
> >>
> >>  appendix/toyrcu/toyrcu.tex | 2 +-
> >>  defer/rcuusage.tex         | 2 +-
> >>  perfbook.tex               | 2 +-
> >>  3 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >> -- 
> >> 2.17.1
> >>
> 
