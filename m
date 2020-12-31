Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbgLaEEu (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 30 Dec 2020 23:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609387450;
        bh=ndzdhenQ9ETGM5rUgFdiaCAGGM5sS+wk2C36Wc18FsQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=AIfhkqLDcYUNCoIbTNxJIFjQeay2gamJlGevZ7fTWlGQj0arVC18nw+S05j7qG4NS
         BHpdfNYHwmCUeG9COiWAGix30xYGnWCNIfBp6tpg4/yN+z5ZKIQELLwA7p+hjwin4H
         02rvZ8RtM0MsRO5ggvdFESkT1wUr50qMQMDhVhiHXCLMQQqgQoKwHYoprVUzB9Qacn
         JsAIaFrk6zo0hc/Wr6kl0ihT+e4P7J4Jz5LAvNRwLwmasRVmUmv0eo+Sjxnh9QtqtN
         wqPTH+tVrClMIukj+V1OBO6Sviu6U7fmrrV1Ko9ntXNt2N+B6mgC6EuiQdxpFqWInw
         kuafd6QKpQx0A==
Date: Wed, 30 Dec 2020 20:04:09 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: FYI, Second Edition Release Candidate 1 now available
Message-ID: <20201231040409.GQ2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
 <38c34066-da73-eecc-cbd6-4e24db5ab367@gmail.com>
 <20201230161346.GM2657@paulmck-ThinkPad-P72>
 <20201230185933.GP2657@paulmck-ThinkPad-P72>
 <68e8db69-c787-9a41-a311-b084eb6897b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68e8db69-c787-9a41-a311-b084eb6897b1@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Dec 31, 2020 at 08:21:58AM +0900, Akira Yokosawa wrote:
> On Wed, 30 Dec 2020 10:59:33 -0800, Paul E. McKenney wrote:
> > On Wed, Dec 30, 2020 at 08:13:46AM -0800, Paul E. McKenney wrote:
> >> On Wed, Dec 30, 2020 at 08:44:30PM +0900, Akira Yokosawa wrote:
> >>> Hi Paul,
> >>>
> >>> On Tue, 29 Dec 2020 21:37:28 -0800, Paul E. McKenney wrote:
> >>>> Hello!
> >>>>
> >>>> Release Candidate 1 of the Second Edition is now available, and I have
> >>>> started a prototype blog entry: https://paulmck.livejournal.com/59935.html
> >>>> Please let me know of any omissions or errors in this blog entry.
> >>>
> >>> Wouldn't it be worth while mentioning the availability of the "nq" build
> >>> targets?
> >>
> >> Good point!  How about like this?
> >>
> >> 	Those who find Quick Quizzes distracting will be happy to learn
> >> 	that "make nq" relegates both the quizzes and their answers to
> >> 	the end of each chapter, similiar to common practice in textbooks.
> >>
> >> Maybe I should also show what "make help" and "make help-full" print out.
> > 
> > And I went ahead and did both, using the output of "make help-full" to
> > motivate the mention of "make nq".
> > 
> > Thoughts?
> 
> A bit lengthy, but looks good to me!

I could drop the output of "make help-full" and just call out "make nq"
as one example from that list.  Would that be better?

							Thanx, Paul

> >>> PS:
> >>>
> >>> My experiment on index annotations is progressing but slowly.
> >>> Besides the hierarchical indexing, I'm attempting to make use of
> >>> the "glossaries" or the "glossaries-extra" package to manage indexing
> >>> of acronyms.
> >>> Once it becomes stable enough, I'll submit an RFC pull request.
> >>> That would be after the release of Second Edition.  
> > 
> > And this sounds very good!
> > 
> > 							Thanx, Paul
> > 
> >>>>                                                                    I expect
> >>>> to post it to my social media accounts in a few days.
> >>>>
> >>>> And thank you all for your interest in and contributions to perfbook!
> >>>>
> >>>> 							Thanx, Paul
> >>>>
