Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238084AbiHXOsf (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 24 Aug 2022 10:48:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68F37D78E
        for <perfbook@vger.kernel.org>; Wed, 24 Aug 2022 07:48:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 93D09B82543
        for <perfbook@vger.kernel.org>; Wed, 24 Aug 2022 14:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661352510;
        bh=jYObKWziFmj7lceSkfpxp7xEnrYufZaC61n6biXQQyo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=vBJD2Ip9d3aH13/jUGDJlvliBzl/h03cX+r8QrcwrgDb/cCIEKrK4iZheyOYHjEZM
         xSOARFl6ksotgdltjpwOyxMldzSyc49rajzdOFFc24zjMcf9DDROfI3noku1hKFAln
         MT2tzVaTNeXOVqZuy5QA7a9T9XNijQg/JNnKXpEY84lpJLC/xHG3cj4f532OaJ+T0m
         1Au5tIwixp+YF8yOB7HRXyHxVVu7yaJ+blOLvdRZA0y/q/oSt+QvSQ4Pkq4f72BLqv
         hEhiy1y1g9mWra/HaUh4wjW1g7K6xFsDpu2yjUFfOjUdbc+IneGsS7ryKf98xblr6j
         Qb0mH8EIEIAgQ==
Date: Wed, 24 Aug 2022 07:48:29 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] count: Adjust index marker of _Thread_local
Message-ID: <20220824144829.GW6159@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <f96b6945-0727-b9f2-c34b-0c58a508cd92@gmail.com>
 <CAJbg=FV20mZD0RfVFa7DWb4NDQE38B9V5mNU4FTVtFnZOmVF-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FV20mZD0RfVFa7DWb4NDQE38B9V5mNU4FTVtFnZOmVF-A@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Wed, Aug 24, 2022 at 07:22:38AM -0400, Elad Lahav wrote:
> Ah, yes, I was wondering what apig was. Now I get it.
> Thanks, Akira.
> 
> --Elad
> 
> On Tue, 23 Aug 2022 at 22:43, Akira Yokosawa <akiyks@gmail.com> wrote:
> >
> > \apic{} is there for ISO C std APIs.  Use it.
> >
> > While we are here, fix a couple of minor nits:
> >    - align //\lnlbl{var:b} in count_end.c;
> >    - not line-break in front of \footnote{}, indent footnote text.
> >
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > Fixes: 24e8f711d2cf ("count: Switch from GCC to C11 thread-local storage")
> > Cc: Elad Lahav <e2lahav@gmail.com>

Queued and pushed, thank you both!

Just to set expectations, I anticipate taking GCC-to-C11 changes on a
case-by-case basis.  This one was a no-brainer, which is good, but I am
here to tell you that there are times when the old-school GCC extensions
don't always make it through the standardization process in one piece.  ;-)

							Thanx, Paul

> > ---
> >  CodeSamples/count/count_end.c |  2 +-
> >  count/count.tex               | 12 ++++++------
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
> > index 5e7b9ee1025c..b6ed851c35a9 100644
> > --- a/CodeSamples/count/count_end.c
> > +++ b/CodeSamples/count/count_end.c
> > @@ -23,7 +23,7 @@
> >  #include "../api.h"
> >
> >  //\begin{snippet}[labelbase=ln:count:count_end:whole,commandchars=\\\@\$]
> > -unsigned long _Thread_local counter = 0;               //\lnlbl{var:b}
> > +unsigned long _Thread_local counter = 0;       //\lnlbl{var:b}
> >  unsigned long *counterp[NR_THREADS] = { NULL };
> >  unsigned long finalcount = 0;
> >  DEFINE_SPINLOCK(final_mutex);                  //\lnlbl{var:e}
> > diff --git a/count/count.tex b/count/count.tex
> > index 775cf77e90a8..b2de4646b18f 100644
> > --- a/count/count.tex
> > +++ b/count/count.tex
> > @@ -721,12 +721,12 @@ This is the topic of the next section.
> >  \subsection{Per-Thread-Variable-Based Implementation}
> >  \label{sec:count:Per-Thread-Variable-Based Implementation}
> >
> > -The C language, since C11, features a \apig{_Thread_local} storage class that
> > -provides per-thread storage.
> > -\footnote{\GCC\ provides its own \apig{__thread} storage class, which was used
> > -in previous versions of this book.
> > -The two methods for specifying a thread-local variable are interchangeable
> > -when using \GCC\@.}
> > +The C language, since C11, features a \apic{_Thread_local} storage class that
> > +provides per-thread storage.\footnote{
> > +       \GCC\ provides its own \apig{__thread} storage class, which was used
> > +       in previous versions of this book.
> > +       The two methods for specifying a thread-local variable are
> > +       interchangeable when using \GCC\@.}
> >  This can be used as shown in
> >  \cref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
> >  to implement
> >
> > base-commit: ba01403b34de88d3060e119f899f5eb053c5f162
> > --
> > 2.25.1
> >
