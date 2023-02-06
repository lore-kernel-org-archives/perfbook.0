Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjBFRkH (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 6 Feb 2023 12:40:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4A71D902
        for <perfbook@vger.kernel.org>; Mon,  6 Feb 2023 09:40:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD55DB8159B
        for <perfbook@vger.kernel.org>; Mon,  6 Feb 2023 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675705203;
        bh=hMM+ysWnq90Vr/5tSy1yNzT2ZjX5dcvO61FWiJXFdfE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=pPk+w5SdNz0gmKEeMxWh2tZ6utZ08n/GB+1FHUdh6TvHhAnAiZ4JKz1KVa8JSREhA
         JrPht6VofvIt5jj+eqLGDL9yizarlN1CVCDYI7E9bgMdN96ZrBXKppBzYDntiPoKBB
         m/Z7jZW6sW7YqEkrCWMa21JaPf47zk+iDzFw00vMUOHRJnn6Mlu64LV2Ec6yt+Iq37
         yUG02RaULZE3I9HMU2QQxJYm46Y19M6R4wFfktFvy62Lrz2KePIX45agh/67hBIntA
         YFs7VFJd2M9PDWnqqwKF5fPp1QP/A3spiO+KKkeefyx54OrGSi83Q2HN845ybxrpVl
         PcIyCGDnkeo5Q==
Date: Mon, 6 Feb 2023 09:40:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 3/5] debugging: Use \co{} for rcutorture
Message-ID: <20230206174002.GR2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230205182128.19044-1-sj@kernel.org>
 <20230205182128.19044-4-sj@kernel.org>
 <10bf2033-3b80-24a0-ffd5-0fe51306250b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10bf2033-3b80-24a0-ffd5-0fe51306250b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

On Mon, Feb 06, 2023 at 11:48:50AM +0900, Akira Yokosawa wrote:
> On Sun,  5 Feb 2023 10:21:26 -0800, SeongJae Park wrote:
> > From: SeongJae Park <sj38.park@gmail.com>
> > 
> > Some sentences in debugging.tex encloses 'rcutorture' with while some
> > others don't.  Use \co{} consistently.
> 
> Ya, that's also the convention in defer/rcurelated.tex.
> 
> > 
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes!  Queued and pushed, thank you both!

							Thanx, Paul

> > ---
> >  debugging/debugging.tex | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> > index 3ce74469..1903c5db 100644
> > --- a/debugging/debugging.tex
> > +++ b/debugging/debugging.tex
> > @@ -697,7 +697,7 @@ what it knows is almost always way more than your head can hold.
> >  For this reason, high-quality test suites normally come with sophisticated
> >  scripts to analyze the voluminous output.
> >  But beware---scripts will only notice what you tell them to.
> > -My rcutorture scripts are a case in point:
> > +My \co{rcutorture} scripts are a case in point:
> >  Early versions of those scripts were quite satisfied with a test run
> >  in which RCU \IXpl{grace period} stalled indefinitely.
> >  This of course resulted in the scripts being modified to detect RCU
> > @@ -1252,14 +1252,14 @@ of time you spent testing.
> >  Functional tests tend to be discrete.
> >  
> >  On the other hand, if my patch involved RCU, I would probably run
> > -rcutorture, which is a kernel module that, strangely enough, tests RCU\@.
> > +\co{rcutorture}, which is a kernel module that, strangely enough, tests RCU\@.
> >  Unlike booting the kernel, where the appearance of a login prompt
> > -signals the successful end of a discrete test, rcutorture will happily
> > +signals the successful end of a discrete test, \co{rcutorture} will happily
> >  continue torturing RCU until either the kernel crashes or until you
> >  tell it to stop.
> > -The duration of the rcutorture test is usually of more
> > +The duration of the \co{rcutorture} test is usually of more
> >  interest than the number of times you started and stopped it.
> > -Therefore, rcutorture is an example of a continuous test, a category
> > +Therefore, \co{rcutorture} is an example of a continuous test, a category
> >  that includes many stress tests.
> >  
> >  Statistics for discrete tests are simpler and more familiar than those
> > @@ -1845,7 +1845,7 @@ If the program is structured such that it is difficult or impossible
> >  to apply much stress to a subsystem that is under suspicion,
> >  a useful anti-heisenbug is a stress test that tests that subsystem in
> >  isolation.
> > -The Linux kernel's rcutorture module takes exactly this approach with RCU\@:
> > +The Linux kernel's \co{rcutorture} module takes exactly this approach with RCU\@:
> >  Applying more stress to RCU than is feasible in a production environment
> >  increases the probability that RCU bugs will be found during testing
> >  rather than in production.\footnote{
> > @@ -1918,7 +1918,7 @@ delay might be counted as a near miss.\footnote{
> >  \end{figure}
> >  
> >  For example, a low-probability bug in RCU priority boosting occurred
> > -roughly once every hundred hours of focused rcutorture testing.
> > +roughly once every hundred hours of focused \co{rcutorture} testing.
> >  Because it would take almost 500 hours of failure-free testing to be
> >  99\,\% certain that the bug's probability had been significantly reduced,
> >  the \co{git bisect} process
