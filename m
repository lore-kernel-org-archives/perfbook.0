Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229583AbhKRPOj (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 18 Nov 2021 10:14:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637248298;
        bh=etsBk6TOth5lwzJ9yVd3zDYJZt9TTcDGkDrZ2fiRxd4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rV5zGs2svPnwwsnu/HMXgQf5YWTp0folia8al3m/PzFO5jOSJv1cMAEQZ/DoLaO2j
         ARiNSDjjEpoCfQVZDxuS7Xq1CIUAC0gQsWgMHWezf6O007kWij87FSWQjTpZSIhPgf
         N8trz/W2Hnkld9xXhJ3etOILwhD2FNVVE1JKVpzs+/n/+B6LEI5jQZ0O+VJ3rLbFLx
         qc+Qsps2Xe0Nzww40G5Gx8AulkWKnTgJukSauMA83toCuNeI8hmPVvM91OIhNqXygp
         vsqNIrhoD1NOgHYGpN+CEorTQvsdmHCC7scruGFvjHr7nt2P+DzG99fC2qO3YfVCZ4
         iTOgwooQFbJJQ==
Date: Thu, 18 Nov 2021 07:11:37 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] ordering: fix typo in QQ A.5
Message-ID: <20211118151137.GV641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211118065830.14709-1-zhouzhouyi@gmail.com>
 <20211118133422.GT641268@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2yHwECMdF2cz-i=2sj+VgqZrUYuCkLKe2201esf=FO_Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2yHwECMdF2cz-i=2sj+VgqZrUYuCkLKe2201esf=FO_Qw@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, Yang Lu <luyang.co@gmail.com>

On Thu, Nov 18, 2021 at 09:54:27PM +0800, Zhouyi Zhou wrote:
> Thank Paul for your encouragement, and thanks for adjusting the commit log ;-)

Of course, if you are adding quick quizzes that would be of interest to
the general audience, please feel free to send them along.

Or maybe we removed some quick quizzes recently, who knows?  ;-)

> Thanx, Zhouyi
> 
> On Thu, Nov 18, 2021 at 9:34 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Thu, Nov 18, 2021 at 02:58:30PM +0800, Zhouyi Zhou wrote:
> > > In QQ A.5, the pronoun "that" should be preposition "than". And the
> > > word "imptementations" should be "implementations".
> > >
> > > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >
> > Good eyes, queued and pushed, thank you!  (It is QQ A.3 over here,
> > so I adjusted the commit log.)
> >
> >                                                         Thanx, Paul
> >
> > > ---
> > > Hi Paul,
> > >
> > > I fixes some typo in QQ A.5
> > >
> > > Thanks Zhouyi
> > > --
> > >  appendix/questions/ordering.tex | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/appendix/questions/ordering.tex b/appendix/questions/ordering.tex
> > > index 298600f9..05217bc8 100644
> > > --- a/appendix/questions/ordering.tex
> > > +++ b/appendix/questions/ordering.tex
> > > @@ -97,8 +97,8 @@ than the semantics given by the options above.
> > >
> > >  \QuickQuiz{
> > >       But if fully ordered implementations cannot offer stronger
> > > -     guarantees that the better performing and more scalable weakly
> > > -     ordered imptementations, why bother with full ordering?
> > > +     guarantees than the better performing and more scalable weakly
> > > +     ordered implementations, why bother with full ordering?
> > >  }\QuickQuizAnswer{
> > >       Because strongly ordered implementations are sometimes
> > >       able to provide greater consistency among sets of calls to
> > > --
> > > 2.25.1
> > >
