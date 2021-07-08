Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229489AbhGHQV4 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 8 Jul 2021 12:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625761154;
        bh=2gBZ3+m3rVXIfoLqwVCDuLn8ji3vKA89i8mN6hYz8Hg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=o9QYmGiePhmWZrVolR98VOI2KCGQKRfYifJaPsm0a3t5w5t9k4Dy6rmr/xkfl6XGB
         XKvOIT2lbabYnxqgsA0E8c0sd/YVE1IQeZ95AJ7EXnQIBoxhJA6VKWEBFT0SaHHBkH
         0cGnf1B6t1+ljr9SJpQ+FD37h3OovpvvvG3ESlm7xI5gLkYcAT1FWR7On9QiKt7fKk
         u2YWpWnSZ/G+NN20FAgGjZ04s4GP8DJIfy12AMhukP8ZarLc/Q6+DzfEnSBu9oE5lS
         ZZFrQhjJ+93X850G1XbdHIlwkbTbPkzEwg5W7oRrLkWkVA3x0R2c5pEwCjcewDQFrN
         21bqRTuvkySMw==
Date: Thu, 8 Jul 2021 09:19:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/6] Break and capitalize after colon, take two
Message-ID: <20210708161914.GK4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jul 08, 2021 at 07:40:16PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Here are colon related tweaks though Chapter 9.
> 
> Patches 1/6 -- 3/6 don't change sentences/clauses/phrases except
> for capitalization.
> Patches 4/6 -- 6/6 remove redundant looking Oxford commas in
> two-item enumeration lists.
> However, I'm not sure Patches 4/6 -- 6/6 are the right fixes or not.
> 
> Please pick whichever ones you'd like.

After some thought and web searching, I took them all.  The missing
comma in the numbered list looks a bit strange to me, but the style
manuals don't differentiate between numbered and non-numbered lists,
so I am willing to have things look strange to avoid yet another
perfbook-specific composition rule.  ;-)

> NOTE: There is a hunk in Patch 3/6:
> 
> > @@ -535,9 +537,10 @@ and with increasing use of hazard pointers in other projects, demonstrates
> >  that tolerance for such inconsistencies is more common than one might
> >  imagine.
> >  This is especially the case given that single-item lookups are much more
> > -common than traversals:  After all, (1)~concurrent updates are less likely
> > -to affect a single-item lookup than they are a full traversal, and
> > -(2)~an isolated single-item lookup cannot detect such inconsistencies.
> > +common than traversals:
> > +After all, (1)~concurrent updates are less likely to affect a single-item
> > +lookup than they are a full traversal, and (2)~an isolated single-item
> > +lookup cannot detect such inconsistencies.
> >  
> >  From a more theoretical viewpoint, there are even some special cases where
> >  RCU readers can be considered to be fully ordered with updaters, despite
> 
> , where the inline enumerated list is not converted to the "enumerate*" list.
> This one is lead by "After all," not by a colon, and I kept the lowercase
> words following (1) and (2).
> 
> This level of fluctuation is unavoidable in natural language text,
> I suppose.

I wordsmithed this passage to get rid of the list entirely.
I believe that it now reads better, in addition to avoiding another
perfbook-specific special case.

							Thanx, Paul

>         Thanks, Akira
> 
> --
> Akira Yokosawa (6):
>   toolsoftrade, count, SMPdesign: Break and capitalize after colon
>   locking: Break and capitalize after colon
>   defer: Break and capitalize after colon
>   count: Remove Oxford comma in two-item enumeration list
>   locking: Remove Oxford comma in two-item list
>   defer: Remove Oxford comma in two-item list
> 
>  SMPdesign/SMPdesign.tex       | 23 ++++----
>  SMPdesign/beyond.tex          | 19 +++----
>  count/count.tex               | 66 ++++++++++++-----------
>  defer/hazptr.tex              |  9 ++--
>  defer/rcufundamental.tex      | 29 ++++++-----
>  defer/rcuintro.tex            |  6 ++-
>  defer/rcuusage.tex            | 34 +++++++-----
>  defer/seqlock.tex             | 12 +++--
>  defer/whichtochoose.tex       | 19 ++++---
>  locking/locking-existence.tex |  4 +-
>  locking/locking.tex           | 98 ++++++++++++++++++++---------------
>  toolsoftrade/toolsoftrade.tex | 31 ++++++-----
>  12 files changed, 201 insertions(+), 149 deletions(-)
> 
> -- 
> 2.17.1
> 
