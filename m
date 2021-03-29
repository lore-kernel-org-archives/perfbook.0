Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229656AbhC2AG5 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 28 Mar 2021 20:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616976416;
        bh=fyXMOjMQIifVoJz9GlSMnKp0dK+8HUjyu2OCUTOP1y0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ogdrvaQHVFl2boVqpXEIqDQVWql0dG+Ns+eIxzpIfVcLk1pUYWwMLoEETjGy3w2H5
         ZWyS6NzM1aqAl1EEFs/5q34B0wQ9qQ5rl78/OSPI+he1iwLl74C/oeVTl8EPofeBwe
         aXwyTBAAc1b+Od748DPw9JVGeyQ0Oa1OyUWpTK6aVtQxK13qdb/NL/QOVVTmoXpSe/
         qms3IEl2mIUeDOc+0Jk6RR4Vq3Kt1kPbXgZ8YG37tI3H4CUEEQZ7Zm4Rrtu/u2Spid
         WV6fHCE90s4q/Luxgnex/UYuamxHb295dHgkjJzpueXXdtSMxRljnuXzDwikkR81bR
         fAODNX4kXDBZw==
Date: Sun, 28 Mar 2021 17:06:56 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/5] Misc fixes and updates
Message-ID: <20210329000656.GU2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
 <20210328160836.GT2696@paulmck-ThinkPad-P72>
 <418b8e1f-0030-c577-afe8-b868e7e0984f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <418b8e1f-0030-c577-afe8-b868e7e0984f@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Mar 29, 2021 at 07:15:17AM +0900, Akira Yokosawa wrote:
> On , Paul E. McKenney wrote:
> > On Sun, Mar 28, 2021 at 05:48:14PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> This patch set consists of fixes/updates, some of which take care
> >> of ebook-size build.
> >>
> >> Patch 1/5 fixes truncated index pages in ebook-size build.
> >> Patch 2/5 adds check of warning messages from makeindex, which are
> >> sometimes hard to track down after the fact.
> >> Patch 3/5 improves look of final pages of index.
> >> I'd like final pages of chapters in two-column layout to be
> >> balanced similarly, but have not succeeded.
> >> Patch 4/5 fixes the wrong use of \Clnref{} macro, which I failed to
> >> catch before the release of Second Edition.
> >> Patch 5/5 fixes an orphaned heading of Section B.2 in ebook-size
> >> build.
> >>
> >> To build ebook-size PDF with index pages enabled, use the sequence
> >> of command below:
> >>
> >>     rm perfbook-ix.tex; env PERFBOOK_PAPER=EB make ix
> >>
> >> Resulting perfbook-ix.pdf will be of ebook size.
> >> As was mentioned earlier, make error due to messages of
> >> "LaTeX Warning: Float too large for page by ..." is expected
> >> and can be ignored.
> > 
> > Applied, thank you!
> > 
> > Just out of curiosity, what must be typed to get an ebook layout with
> > index?  My guess of "PERFBOOK_PAPER=EB make ix" did not do the trick.
> > Of course, "make ix" continues to create a two-column full-size PDF
> > with index.
> 
> At the moment, you need to manually remove perfbook-ix.tex
> before the rebuild, which is why I wrote:
> 
> >>     rm perfbook-ix.tex; env PERFBOOK_PAPER=EB make ix
> 
> above.
> 
> I think this can be automated by adding some dependency in the Makefile.
> Will look into it later.

That works, thank you, and apologies for my blindness!

If we aren't careful, we will end up with a combinatorial explosion
of Makefile targets.  Worse things could happen, I guess.  ;-)

Would it help reduce Makefile complexity by having the default target
do fancy Quick Quizzes like it does for releases and editions?

							Thanx, Paul

> >>         Thanks, Akira
> >>
> >> --
> >> Akira Yokosawa (5):
> >>   index: Adjust settings respecting ebook-size build
> >>   runlatex.sh: Catch warning from makeindex early
> >>   index: Enable balanced layout of last page of multi-column index
> >>   together: Fix usage of \clnref{} for 'lines M and N'
> >>   toyrcu: Move float away from section heading
> >>
> >>  appendix/toyrcu/toyrcu.tex | 10 +++++-----
> >>  perfbook-lt.tex            |  8 +++++---
> >>  together/applyrcu.tex      |  2 +-
> >>  utilities/runlatex.sh      |  5 +++++
> >>  4 files changed, 16 insertions(+), 9 deletions(-)
> >>
> >> -- 
> >> 2.17.1
> >>
