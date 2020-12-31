Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbgLaUgn (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 31 Dec 2020 15:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609446962;
        bh=Asxo16FLIsGVdCcPP5aZKzUU4lSzP6+wMw8700OzuqA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rwrg8+xSUMrLbCOdp/XrM03GarhG1xqyIbsNdZvWJ3YU4gy/VmD6P1lJEi49OMHMi
         RddjNV8DGI9YtFzlvr6MyKV76rZ8oD5mTgi6ApXwst4zfjYyUlCQwBLD8J+XpfSZWe
         Jcer4+0HbejQcUU9YT8N68lIZ1SbOVtBpquo9lo5mEBpDbSCfjUc7cZB6oLK+xmSzA
         erwXb4CfCJ80jSlIrZiftaByxJOTTmDSNX2t2FkyJkM6i/2xncRdWNQ4FVb2GQPpx2
         /0BQWlt/gC/kpV9dTKqtfVqkOik/nFLHTsmdAwokIq/X2NDElyS1CJiON+oQCpBZ7p
         Upmjy7csdV4ug==
Date: Thu, 31 Dec 2020 12:36:01 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: FYI, Second Edition Release Candidate 1 now available
Message-ID: <20201231203601.GR2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
 <38c34066-da73-eecc-cbd6-4e24db5ab367@gmail.com>
 <20201230161346.GM2657@paulmck-ThinkPad-P72>
 <20201230185933.GP2657@paulmck-ThinkPad-P72>
 <68e8db69-c787-9a41-a311-b084eb6897b1@gmail.com>
 <20201231040409.GQ2657@paulmck-ThinkPad-P72>
 <ce22345f-9dd8-e7ae-ea07-09992615ee84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce22345f-9dd8-e7ae-ea07-09992615ee84@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Dec 31, 2020 at 01:43:36PM +0900, Akira Yokosawa wrote:
> On Wed, 30 Dec 2020 20:04:09 -0800, Paul E. McKenney wrote:
> > On Thu, Dec 31, 2020 at 08:21:58AM +0900, Akira Yokosawa wrote:
> >> On Wed, 30 Dec 2020 10:59:33 -0800, Paul E. McKenney wrote:
> >>> On Wed, Dec 30, 2020 at 08:13:46AM -0800, Paul E. McKenney wrote:
> >>>> On Wed, Dec 30, 2020 at 08:44:30PM +0900, Akira Yokosawa wrote:
> >>>>> Hi Paul,
> >>>>>
> >>>>> On Tue, 29 Dec 2020 21:37:28 -0800, Paul E. McKenney wrote:
> >>>>>> Hello!
> >>>>>>
> >>>>>> Release Candidate 1 of the Second Edition is now available, and I have
> >>>>>> started a prototype blog entry: https://paulmck.livejournal.com/59935.html
> >>>>>> Please let me know of any omissions or errors in this blog entry.
> >>>>>
> >>>>> Wouldn't it be worth while mentioning the availability of the "nq" build
> >>>>> targets?
> >>>>
> >>>> Good point!  How about like this?
> >>>>
> >>>> 	Those who find Quick Quizzes distracting will be happy to learn
> >>>> 	that "make nq" relegates both the quizzes and their answers to
> >>>> 	the end of each chapter, similiar to common practice in textbooks.
> >>>>
> >>>> Maybe I should also show what "make help" and "make help-full" print out.
> >>>
> >>> And I went ahead and did both, using the output of "make help-full" to
> >>> motivate the mention of "make nq".
> >>>
> >>> Thoughts?
> >>
> >> A bit lengthy, but looks good to me!
> > 
> > I could drop the output of "make help-full" and just call out "make nq"
> > as one example from that list.  Would that be better?
> 
> Or you could put a relevant part of the output of "make help-full" instead:
> 
>     [...]
>     Experimental targets:
>       Full,              Abbr.
>       perfbook-qq.pdf,   qq:   framed Quick Quizzes
>       perfbook-nq.pdf,   nq:   no inline Quick Quizzes (chapterwise Answers)
>     [...]
>           ("1cqq", "1cnq", and so on disable 2-column mode.)

Good point, updated.  Further thoughts?

							Thanx, Paul

> >>>>> PS:
> >>>>>
> >>>>> My experiment on index annotations is progressing but slowly.
> >>>>> Besides the hierarchical indexing, I'm attempting to make use of
> >>>>> the "glossaries" or the "glossaries-extra" package to manage indexing
> >>>>> of acronyms.
> >>>>> Once it becomes stable enough, I'll submit an RFC pull request.
> >>>>> That would be after the release of Second Edition.  
> >>>
> >>> And this sounds very good!
> >>>
> >>> 							Thanx, Paul
> >>>
> >>>>>>                                                                    I expect
> >>>>>> to post it to my social media accounts in a few days.
> >>>>>>
> >>>>>> And thank you all for your interest in and contributions to perfbook!
> >>>>>>
> >>>>>> 							Thanx, Paul
> >>>>>>
