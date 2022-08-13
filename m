Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiHMXRO (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 13 Aug 2022 19:17:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3898A6E2
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 16:17:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 586E5B80AD3
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 23:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660432631;
        bh=QMxh5dEMIN8/7ZUFiejNK0Zl4nydXJUR47Pq4Pg6I2Q=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rmWuNWroJlzkzuXhBFnRzc4OB73PJWedZDIJfaZ+aHSvffnBMBqLZypPJVxgOzvyL
         WJc+4JKZ3FK5Excr7ZV3SOm5ImacAxp7G14OLjRZRy+bbIxxczJoIfAIBBC58gArzA
         8HW+C986lUugHvyb3hCAsW6Z/qusO5gdOESUsrjpcfrpbK1UrYRIYri4rkgJ81vJjw
         ml0Qp5ZNJbsoRhviBvMSKwqB5p6PMOliYFtK0Wn0p32Zl+OMgDjaSjrXCF0DpHmPot
         0j6G1sLU8LdmTZi/hm2x3Ljbfa55t/S5VXtz1eBSXjj2PqCJ/3X5mgATYLzgtQ5jeI
         A7dYKmOyc2KIA==
Date: Sat, 13 Aug 2022 16:17:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] count: Switch from GCC to C11 thread-local storage
Message-ID: <20220813231710.GO2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220813114559.2082323-1-e2lahav@gmail.com>
 <20220813230800.GL2125313@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FX+X_oC36Zt_FYoC1VTjn_Yy3qbkkoij4+0ZtxbR0u48A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FX+X_oC36Zt_FYoC1VTjn_Yy3qbkkoij4+0ZtxbR0u48A@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

That sounds good, thank you!

There are quite a few people on projects for which C11 is not yet a
thing.  Or that need to look at old code.

But yes, some years hence, perhaps all mention of __thread is dropped
from this book.  Not today, though.  ;-)

						Thanx, Paul

On Sat, Aug 13, 2022 at 07:12:48PM -0400, Elad Lahav wrote:
> Yes, I thought about a footnote along the lines of "previous versions
> of this book used GCC extensions..." but wasn't sure if you'd approve.
> I can certainly add that.
> 
> --Elad
> 
> On Sat, 13 Aug 2022 at 19:08, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Sat, Aug 13, 2022 at 07:45:59AM -0400, Elad Lahav wrote:
> > > Signed-off-by: Elad Lahav <e2lahav@gmail.com>
> >
> > Nice, thank you!
> >
> > But did you verify that none of the text describing count_end.c needed
> > changing?  (It seems unlikely that any would, but could you please check?)
> >
> > > ---
> > >  CodeSamples/count/count_end.c | 12 ++++++------
> > >  count/count.tex               |  4 ++--
> > >  2 files changed, 8 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
> > > index 722ad2f7..5e7b9ee1 100644
> > > --- a/CodeSamples/count/count_end.c
> > > +++ b/CodeSamples/count/count_end.c
> > > @@ -1,6 +1,6 @@
> > >  /*
> > >   * count_end.c: Per-thread statistical counters that provide sum at end.
> > > - *   Uses __thread for each thread's counter.
> > > + *   Uses _Thread_local for each thread's counter.
> > >   *
> > >   * This program is free software; you can redistribute it and/or modify
> > >   * it under the terms of the GNU General Public License as published by
> > > @@ -23,17 +23,17 @@
> > >  #include "../api.h"
> > >
> > >  //\begin{snippet}[labelbase=ln:count:count_end:whole,commandchars=\\\@\$]
> > > -unsigned long __thread counter = 0;          //\lnlbl{var:b}
> > > +unsigned long _Thread_local counter = 0;             //\lnlbl{var:b}
> > >  unsigned long *counterp[NR_THREADS] = { NULL };
> > >  unsigned long finalcount = 0;
> > >  DEFINE_SPINLOCK(final_mutex);                        //\lnlbl{var:e}
> > >
> > > -static __inline__ void inc_count(void)               //\lnlbl{inc:b}
> > > +static inline void inc_count(void)           //\lnlbl{inc:b}
> > >  {
> > >       WRITE_ONCE(counter, counter + 1);
> > >  }                                            //\lnlbl{inc:e}
> > >
> > > -static __inline__ unsigned long read_count(void)
> > > +static inline unsigned long read_count(void)
> > >  {
> > >       int t;
> > >       unsigned long sum;
> > > @@ -48,7 +48,7 @@ static __inline__ unsigned long read_count(void)
> > >  }
> > >
> > >  #ifndef FCV_SNIPPET
> > > -__inline__ void count_init(void)
> > > +inline void count_init(void)
> > >  {
> > >  }
> > >  #endif /* FCV_SNIPPET */
> > > @@ -73,7 +73,7 @@ void count_unregister_thread(int nthreadsexpected)  //\lnlbl{unreg:b}
> > >  }                                                    //\lnlbl{unreg:e}
> > >  //\end{snippet}
> > >
> > > -__inline__ void count_cleanup(void)
> > > +inline void count_cleanup(void)
> > >  {
> > >  }
> > >
> > > diff --git a/count/count.tex b/count/count.tex
> > > index 523789e2..173b964c 100644
> > > --- a/count/count.tex
> > > +++ b/count/count.tex
> > > @@ -721,8 +721,8 @@ This is the topic of the next section.
> > >  \subsection{Per-Thread-Variable-Based Implementation}
> > >  \label{sec:count:Per-Thread-Variable-Based Implementation}
> > >
> > > -\GCC\ provides an \apig{__thread} storage class that provides
> > > -per-thread storage.
> > > +The C language, since C11, features a \apig{_Thread_local} storage class that
> > > +provides per-thread storage.
> >
> > Could you please mention __thread as the old way?  Either in the text
> > directly, in parentheses, as a footnote, or as a quick quiz, your choice.
> >
> >                                                         Thanx, Paul
> >
> > >  This can be used as shown in
> > >  \cref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
> > >  to implement
> > > --
> > > 2.25.1
> > >
