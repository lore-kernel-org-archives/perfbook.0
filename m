Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236015AbiHSCDB (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 18 Aug 2022 22:03:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763F3DCFE1
        for <perfbook@vger.kernel.org>; Thu, 18 Aug 2022 19:03:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 11ABC6143D
        for <perfbook@vger.kernel.org>; Fri, 19 Aug 2022 02:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660874579;
        bh=EfsWB7ptKBOjqgtr9avhBhPZVom/9GSNMq//8JfYzR0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=QbkbitARBu9gmy/zgOiWRNU6JhsODywlAYUzBU00nZu3GBRzKzCvdoZKPtNUy6PF/
         AkI1V4C/kpj+wnO4o2Abn7XVJvtdzKdKdjBV5nwYRyGFJQhmjB/SyhH8qCkKmE+T1E
         xuevtqysJfFk8TSZ2mFVmCYvxS7uYSR6i8gmwDPPM/zJt9djP4/D6qqTeQBINge6LX
         DWCpriNJsXMNDoXqj6osatPXcfplgIUGpHhb7AroZaZuSMUML8GO5h8/8Wvs5HFh7x
         eibzXFftvw5oRfu2TDC87YUusCNxS7tBQgA5qUwfAWQtUfTlxdDkPPOLSFOR6xuyT0
         VUhRWcoAnmo/A==
Date: Thu, 18 Aug 2022 19:02:58 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] count: Switch from GCC to C11 thread-local storage
Message-ID: <20220819020258.GJ2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220817110049.182128-1-e2lahav@gmail.com>
 <0dfcdb91-12d7-86f7-4c8d-26a101bec7b5@gmail.com>
 <CAJbg=FW02u8dCHnTE9nEUtvGvVQKpEzUZByXs0O0qc9hQK6XyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FW02u8dCHnTE9nEUtvGvVQKpEzUZByXs0O0qc9hQK6XyA@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

Incrementalist that I am, my thought is to take this one thing at a
time, if and when.  ;-0

							Thanx, Paul

On Wed, Aug 17, 2022 at 01:36:43PM -0400, Elad Lahav wrote:
> Hi Akira,
> 
> The reason for the change is that using C11 is more portable. I have no
> problem dropping it if it causes any problems.
> 
> That said, there is a simple solution to the issue you are facing. The
> -std=c11 option specifies strict adherence to ISO C, without extensions.
> You rarely want that. Instead, specify -std=gnu11, which will give you C11
> plus POSIX plus GNU extensions.
> 
> --Elad
> 
> On Wed., Aug. 17, 2022, 11:18 a.m. Akira Yokosawa, <akiyks@gmail.com> wrote:
> 
> > Hi Elad,
> >
> > On Wed, 17 Aug 2022 07:00:50 -0400, Elad Lahav wrote:
> > > Signed-off-by: Elad Lahav <e2lahav@gmail.com>
> > > ---
> >
> > As there is no changelog here, let me ask a (maybe stupid) question.
> >
> > What is your goal of diverting from GCC extensions and switching
> > to the C11 standard?
> >
> > Do you want the codebase under CodeSamples/ to be strictly
> > conformant to C11 or later?
> >
> > Runnig "make" under CodeSamples/count, with "-std=c11" appended
> > to GCC_ARGS, I get a lot of compile errors/warnings (with GCC 9.4.0
> > under Ubuntu 20.04), beginning with:
> >
> >     cc -g -O2 -Wall -std=c11  -o count_atomic count_atomic.c -lpthread
> >
> >     In file included from /usr/include/sched.h:34,
> >
> >                      from /usr/include/pthread.h:22,
> >
> >                      from ../api.h:159,
> >
> >                      from count_atomic.c:22:
> >
> >     /usr/include/time.h:113:5: error: unknown type name 'locale_t'
> >
> >       113 |     locale_t __loc) __THROW;
> >
> >           |     ^~~~~~~~
> >
> >
> > A workaround is to append "-D_GNU_SOURCE" to GCC_ARGS.  With that,
> > I get the next warning of:
> >
> >     ../api.h:766:2: warning: implicit declaration of function 'typeof'
> > [-Wimplicit-function-declaration]
> >
> >   766 |  typeof(*ptr) _____actual = (o); \
> >
> >
> > Apparently, typeof() is another GCC extension.  __typeof__() might
> > be used instead, but it is not ISO C.
> >
> > So what is you goal of these switches?
> >
> >         Thanks, Akira
> >
> > >  CodeSamples/count/count_end.c | 12 ++++++------
> > >  count/count.tex               | 20 ++++++++++++--------
> > >  2 files changed, 18 insertions(+), 14 deletions(-)
> > >
> > [...]
> >
