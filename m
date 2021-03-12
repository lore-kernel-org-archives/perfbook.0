Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232537AbhCLQYm (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 12 Mar 2021 11:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615566281;
        bh=2llbrjSjfU+UOaRWIpdiJxeYdVhRJeo4YPp7DNZH430=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=jD7D+j3uGVrfVYQ4qQ2UfDvUjQo6lnRLnybS/3akXKAKnAOgToa1H5QMMvZL4A0CK
         O2DeuOApd9/z09veBLoyOG+nZn22FYOcWhLIbfoaaoyAhnJ2MjLNlkW8osy3qVudej
         pxetLBFnepn+w8nNa2GycGgcJxY/tHIbGQ/RD3isnpTCUrKNUMjKbMfOoDnLgQl7YO
         9lTrTkdnqxGCnAH8sdZQhke/jKx/daYVvjaLOtiZDVtu1YGqljd7w2IT8bR0eFJ50K
         h0Y6faAH8UNNfC86TwSqVxD90CEPUxGF54qFnojOaFuKdPoI0TiDYfaRj02vOcfDOk
         DZSAdcJhEuizA==
Date: Fri, 12 Mar 2021 08:24:41 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Minor tweaks for Edition 2
Message-ID: <20210312162441.GH2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <b4d385ab-fced-17e5-6af0-ecd0e05260fa@gmail.com>
 <20210312022558.GC2696@paulmck-ThinkPad-P72>
 <daae0a43-94b9-5cee-cee9-4e1da580d386@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daae0a43-94b9-5cee-cee9-4e1da580d386@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Mar 13, 2021 at 12:12:36AM +0900, Akira Yokosawa wrote:
> On Thu, 11 Mar 2021 18:25:58 -0800, Paul E. McKenney wrote:
> > On Fri, Mar 12, 2021 at 09:03:23AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> So this is a collection of minor updates/tweaks for Edition 2.
> >>
> >> Patch 1/9 adds an author field in a bibliography entry.
> >> Patch 2/9 fixes font in a epigraph.
> >> Patch 3/9 adjusts position of a sideways table with a typo fix.
> >>
> >> Patches 4/9 -- 7/9 tweak float positions and line breaks mostly for
> >> 1c builds.  They affect 2c build as well.  If you find any undesirable
> >> changes in 2c builds, please let me know.  I'll give a closer look.
> >>
> >> Patch 8/9 removes adhoc tweaks which have become irrelevant.
> >> Patch 9/9 restores a2ping in a recipe for ghostscript 9.53.x.
> >> It turned out that a2ping can cope with the up-to-date ghostscript.
> >>
> >>         Thanks, Akira
> > 
> > I merged these in, thank you!
> > 
> > Is a second-edition release date of this weekend reasonable, or should
> > I hold off for another week to allow more review?
> 
> Another week sounds reasonable.
> I'm not saying I can review all of your recent updates in a week,
> but most rough edges can be fixed.
> I've already spotted a few issues in the brand new summary chapter.

Thank you, and I will use the time to re-review my recent changes.
(I read them out loud to myself.)

> BTW, It was good to know why you started perfbook.
> The year 2021 means quite a lot for you, I suppose.

And I hadn't realized until I wrote it that this was that year.  ;-)

I could argue that there is a lot of concurrent and parallel programming
happening, so it must be getting pretty routine.  Others would likely
complain about one remaining difficulty or another.  Some things never
change!

							Thanx, Paul

>         Thanks, Akira
> 
> >
> > 							Thanx, Paul
> > 
> >> --
> >> The following changes since commit 736cfb826271d7e25b45859cf793d4c7749d024b:
> >>
> >>   appendix/questions: Updates and wordsmithing (2021-03-09 17:24:47 -0800)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.12a
> >>
> >> for you to fetch changes up to c337d0756f8862f981eab9f67262d39371769dbe:
> >>
> >>   Makefile: Restore a2ping for .tex originated .eps files (2021-03-12 08:27:17 +0900)
> >>
> >> ----------------------------------------------------------------
> >> Akira Yokosawa (9):
> >>       bib/syncrefs: Add author info to AndrewDBirrell1989Threads
> >>       defer/updates: Use \emph{} for author part in epigraph
> >>       defer/rcuapi: Fix position of 'RCU Wait-to-Finish APIs' table
> >>       Use nbsp for 1c builds
> >>       Use 'tbp' as option of floats
> >>       Add \FloatBarrier to avoid far-away floats
> >>       easy: Shrink and move 'Mandelbrot Set' figures
> >>       Remove '\noclub[1]' tweaks
> >>       Makefile: Restore a2ping for .tex originated .eps files
> >>
> >>  Makefile                      |  4 +++-
> >>  advsync/rt.tex                |  1 +
> >>  appendix/toyrcu/toyrcu.tex    |  8 ++++----
> >>  bib/syncrefs.bib              |  1 +
> >>  debugging/debugging.tex       |  1 -
> >>  defer/rcuapi.tex              |  4 ++--
> >>  defer/rcufundamental.tex      | 10 +++++-----
> >>  defer/updates.tex             |  2 +-
> >>  easy/easy.tex                 | 18 +++++++++---------
> >>  future/future.tex             |  2 ++
> >>  future/tm.tex                 |  8 ++++----
> >>  intro/intro.tex               |  6 +++---
> >>  locking/locking.tex           |  1 -
> >>  memorder/memorder.tex         | 41 +++++++++++++++++++++--------------------
> >>  perfbook-lt.tex               |  3 ++-
> >>  toolsoftrade/toolsoftrade.tex |  4 ++--
> >>  16 files changed, 60 insertions(+), 54 deletions(-)
