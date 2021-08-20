Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhHTXyJ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 20 Aug 2021 19:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629503611;
        bh=eogLIgV/NVKhM+8CwTA7jferiNG1qZ0VNqRE7tZMNAs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PgZLrEaS3jUxLEj1klagpoqbrQsmK6WFW3jzwbNty1lesPqbJdKbLIewufIwMJIsH
         XxUDT2kYlOGh3FJDyXjysbRicjwycEm0GfDnYTNdxl/M+99z/J/Ae7MMaLwIHghYmF
         XoIbfSQevA93T3jkhxxVvR+1mnVyvY701VLABiu0TMlbkUVdUyBds6eE4xPfp3z5qI
         dg6GtuuBhbMaga1uByCfKkNGZjv1ja0PomuOuG2hG10NCZLLrrk2mBCwnvQeEYSeuV
         cbwhK0Tl4qB8lxGm/cGtmSgvJjixZeGun6/ClrkUgTpm2rx2vHhqna4MCOJyJ54Zi5
         HgYL3tzm8YV5Q==
Date: Fri, 20 Aug 2021 16:53:30 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] Fix a little grammar mistake
Message-ID: <20210820235330.GN4126399@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1629359518-3861-1-git-send-email-zhouzhouyi@gmail.com>
 <031ce7cf-750e-7a2d-f2ba-5e7b661df2c2@gmail.com>
 <20210819172940.GD4126399@paulmck-ThinkPad-P17-Gen-1>
 <6751500e-62ed-3bcb-fe9f-290a826ed8da@gmail.com>
 <20210820025428.GG4126399@paulmck-ThinkPad-P17-Gen-1>
 <cfd450e3-4b0e-c97a-6591-a9e6a326ce05@gmail.com>
 <20210820200447.GJ4126399@paulmck-ThinkPad-P17-Gen-1>
 <dd1d6092-88e0-d070-28bd-44d6b8f0ad98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd1d6092-88e0-d070-28bd-44d6b8f0ad98@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, perfbook@vger.kernel.org, luyang.co@gmail.com

On Sat, Aug 21, 2021 at 08:30:09AM +0900, Akira Yokosawa wrote:
> On Fri, 20 Aug 2021 13:04:47 -0700, Paul E. McKenney wrote:
> > On Fri, Aug 20, 2021 at 07:43:03PM +0900, Akira Yokosawa wrote:
> >> On Thu, 19 Aug 2021 19:54:28 -0700, Paul E. McKenney wrote:
> >>> On Fri, Aug 20, 2021 at 08:43:13AM +0900, Akira Yokosawa wrote:
> >>>> On Thu, 19 Aug 2021 10:29:40 -0700, Paul E. McKenney wrote:
> >>>>> On Thu, Aug 19, 2021 at 07:54:30PM +0900, Akira Yokosawa wrote:
> >> [...]
> >>>>>> Three uses of "than" in a sentence might be confusing, though.
> >>>>>>
> >>>>>> Paul might have an idea of a less-confusing sentence.
> >>>>>
> >>>>> Three "than"s in one sentence is a bit excessive, now that you guys
> >>>>> mention it.
> >>>>>
> >>>>> How about this?
> >>>>>
> >>>>> 	In practice, there are a lot more 28-CPU systems than there are
> >>>>> 	448-CPU systems.
> >>>>>
> >>>>> I do not believe that the "more than"s are really adding much here.
> >>>>
> >>>> Well, the question part reads:
> >>>>
> >>>>> The dangers of extrapolating from 28 CPUs to 448 CPUs was made quite
> >>>>> clear in Section 10.2.3. But why should extrapolating up from 448 CPUs be
> >>>>> any safer?
> >>>>
> >>>> So, the point is "extrapolating up from 448 CPUs".
> >>>> Hence you used "more than"s in the answer, didn't you?
> >>>
> >>> Right you are, and thank you for checking this!
> >>>
> >>> There are several possibilities:
> >>>
> >>> 	In practice, there are a lot more systems with in excess of
> >>> 	28~CPUs than there are systems with in excess of 448 CPUs.
> >>>
> >>> Or:
> >>>
> >>> 	In practice, there are only a very few systems with more than
> >>> 	448 CPUs, while there is a huge number having more than 28 CPUs.
> >>>
> >>> Or perhaps rework the full answer:
> >>>
> >>> 	In theory, it isn't any safer, and a useful exercise would be
> >>> 	to run these programs on larger systems.
> >>> 	In practice, there are only a very few systems with more than
> >>> 	448 CPUs, in contrast to the huge number having more than 28 CPUs.
> >>> 	This means that although it is dangerous to extrapolate beyond
> >>> 	448 CPUs, there is very little need to do so.
> >>> 	In addition, other testing has shown that RCU read-side primitives
> >>> 	offer consistent performance and scalability up to at least 1024 CPUs.
> >>>
> >>> Thoughts?
> >>
> >> The fully reworked answer looks much clearer for me.
> > 
> > OK, I started from there.
> > 
> >> Besides, I'd like to suggest some changes around QQ 10.9.
> >>
> >> As there is no mention of extrapolation before this QQ in this section,
> >> the question of "But why should extrapolating up from 448 CPUs be any
> >> safer?" looks kind of abrupt.
> >> A plain yes/no question would be smoother. 
> >>
> >> Also, the transition of discussion on Figure 10.12 (update performance)
> >> to that on Figure 10.11 (lookup performance) in the preceding paragraphs
> >> is not evident and I got lost for a while when I reread this section.
> >>
> >> How about the following change?
> >>
> >> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> >> index adb102d4..9e386e99 100644
> >> --- a/datastruct/datastruct.tex
> >> +++ b/datastruct/datastruct.tex
> >> @@ -941,6 +941,7 @@ pointers.
> >>  Of course, all three of these implementations beat global locking.
> >>  
> >>  It is quite possible that the differences in lookup performance
> >> +(\cref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates})
> >>  are affected by the differences in update rates.
> >>  One way to check this is to artificially throttle the update rates of
> >>  per-bucket locking and hazard pointers to match that of RCU\@.
> >> @@ -958,7 +959,7 @@ not recommended for production use.
> >>  	The dangers of extrapolating from 28 CPUs to 448 CPUs was
> >>  	made quite clear in
> >>  	\cref{sec:datastruct:Hash-Table Performance}.
> >> -	But why should extrapolating up from 448 CPUs be any safer?
> >> +	Would extrapolating up from 448 CPUs be any safer?
> >>  }\QuickQuizAnswer{
> >>  	In theory, it isn't any safer, and a useful exercise would be
> >>  	to run these programs on larger systems.
> > 
> > I took this and also made more changes to the answer.  Does the following
> > seem reasonable?
> 
> Looks good to me!

Very good, I have pushed it out.  Thank you both!!!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit 279d626e3bcdd555031dc757441b06792ea58d38
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Fri Aug 20 13:00:56 2021 -0700
> > 
> >     datastruct: Expand on dangers of extrapolation
> >     
> >     This commit clarifies and expands on QQ10.9, which covers the dangers
> >     of extrapolation.  This commit also includes a change in wording of the
> >     question suggested by Akira Yokosawa.
> >     
> >     Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> > index adb102d4..c3700332 100644
> > --- a/datastruct/datastruct.tex
> > +++ b/datastruct/datastruct.tex
> > @@ -955,17 +955,26 @@ usually be reliable enough for benchmarking purposes, it is absolutely
> >  not recommended for production use.
> >  
> >  \QuickQuiz{
> > -	The dangers of extrapolating from 28 CPUs to 448 CPUs was
> > +	The dangers of extrapolating from 28~CPUs to 448~CPUs was
> >  	made quite clear in
> >  	\cref{sec:datastruct:Hash-Table Performance}.
> > -	But why should extrapolating up from 448 CPUs be any safer?
> > +	Would extrapolating up from 448~CPUs be any safer?
> >  }\QuickQuizAnswer{
> > -	In theory, it isn't any safer, and a useful exercise would be
> > +	In theory, no, it isn't any safer, and a useful exercise would be
> >  	to run these programs on larger systems.
> > -	In practice, there are a lot more systems with more than 28~CPUs
> > -	than there are systems with more than 448 CPUs.
> > +	In practice, there are only a very few systems with more than
> > +	448~CPUs, in contrast to the huge number having more than 28~CPUs.
> > +	This means that although it is dangerous to extrapolate beyond
> > +	448~CPUs, there is very little need to do so.
> > +
> >  	In addition, other testing has shown that RCU read-side primitives
> > -	offer consistent performance and scalability up to at least 1024 CPUs.
> > +	offer consistent performance and scalability up to at least 1024~CPUs.
> > +	However, is useful to review
> > +	\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs; Varying Table Size}
> > +	and its associated commentary.
> > +	You see, unlike the 448-CPU system that provided this data,
> > +	the system enjoying linear scalability up to 1024~CPUs boasted
> > +	excellent memory bandwidth.
> >  }\QuickQuizEnd
> >  
> >  % @@@ Testing strategy.  Summarize hashtorture, add QQ for additional
> > 
