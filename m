Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbgL3TAO (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 30 Dec 2020 14:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609354774;
        bh=nKAMuSyF1aFAN/HCpG9f9ChujCLpUrYW5uZpYTEEDBc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Kth+px4iSVDW8ADI4islwKMpb/b7wn9rljlXutvkpZrgCgCdcbqH/DiL8Zeuk+lbr
         VuO9kOm1udDmOhAC+vd3iO2tNeTuV84/0PcAO1E2itggbg8nsfu84jCzg8VwNm0TTw
         QSJ6UC183BOyxBGkD/p9qbVBxEAAWWaLcFkCLdMnxnrSyO2Nsi6L1achyDBA33bHly
         OQpmrvJgObTyeikxR2j8X4QLWKin7mCe2Z5oclwPC34xLaW0E6+LUHqjlPNZS3yr89
         qImNSr2CBLEmU2hBQ16HyZ7t1+BJAxGCbeGGRLV2Sv8Kd33qx1jUMQTkxftV0JISCR
         HYLiKJVaT76zQ==
Date: Wed, 30 Dec 2020 10:59:33 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: FYI, Second Edition Release Candidate 1 now available
Message-ID: <20201230185933.GP2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
 <38c34066-da73-eecc-cbd6-4e24db5ab367@gmail.com>
 <20201230161346.GM2657@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230161346.GM2657@paulmck-ThinkPad-P72>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 30, 2020 at 08:13:46AM -0800, Paul E. McKenney wrote:
> On Wed, Dec 30, 2020 at 08:44:30PM +0900, Akira Yokosawa wrote:
> > Hi Paul,
> > 
> > On Tue, 29 Dec 2020 21:37:28 -0800, Paul E. McKenney wrote:
> > > Hello!
> > > 
> > > Release Candidate 1 of the Second Edition is now available, and I have
> > > started a prototype blog entry: https://paulmck.livejournal.com/59935.html
> > > Please let me know of any omissions or errors in this blog entry.
> > 
> > Wouldn't it be worth while mentioning the availability of the "nq" build
> > targets?
> 
> Good point!  How about like this?
> 
> 	Those who find Quick Quizzes distracting will be happy to learn
> 	that "make nq" relegates both the quizzes and their answers to
> 	the end of each chapter, similiar to common practice in textbooks.
> 
> Maybe I should also show what "make help" and "make help-full" print out.

And I went ahead and did both, using the output of "make help-full" to
motivate the mention of "make nq".

Thoughts?

> > PS:
> > 
> > My experiment on index annotations is progressing but slowly.
> > Besides the hierarchical indexing, I'm attempting to make use of
> > the "glossaries" or the "glossaries-extra" package to manage indexing
> > of acronyms.
> > Once it becomes stable enough, I'll submit an RFC pull request.
> > That would be after the release of Second Edition.  

And this sounds very good!

							Thanx, Paul

> > >                                                                    I expect
> > > to post it to my social media accounts in a few days.
> > > 
> > > And thank you all for your interest in and contributions to perfbook!
> > > 
> > > 							Thanx, Paul
> > > 
