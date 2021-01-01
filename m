Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726747AbhAAQB0 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 1 Jan 2021 11:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609516845;
        bh=5d7v40vIwnCwS0oywAD9n5yXbDgfBfyLgoF+X7hNSNk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=YtcdklwjUaGPoDYyDB46olpqVf7y61DFgw7hxZZ/61QDS3MpNbJPnViJHgBpW/XRq
         vAiYnWoaTEFTVCCyobTmc508OrNlh2gzByNpLfdrTp/Tak6Obbj21V2CZMMcSmomlK
         koHAMbbrnGaKxv3WA6nduIuu1J7vioh1R1ZMcTctGdko9+oazgkS4YGYEpKNekY2fd
         QRfrdRZPCldCfU4zzSnQEmTnAo22OoWsjMkfe7nptbI7oBFl+k7ZQy1LMLbwrI2Hm8
         tqjQRocSW3VLtiGzcAw25zuz2x+lGG1uuNNk0348gHuk9QMb7u3YJrz373B6/0UOrh
         irqP4OUzE9q0Q==
Date: Fri, 1 Jan 2021 08:00:45 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: FYI, Second Edition Release Candidate 1 now available
Message-ID: <20210101160045.GA12032@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
 <38c34066-da73-eecc-cbd6-4e24db5ab367@gmail.com>
 <20201230161346.GM2657@paulmck-ThinkPad-P72>
 <20201230185933.GP2657@paulmck-ThinkPad-P72>
 <68e8db69-c787-9a41-a311-b084eb6897b1@gmail.com>
 <20201231040409.GQ2657@paulmck-ThinkPad-P72>
 <ce22345f-9dd8-e7ae-ea07-09992615ee84@gmail.com>
 <20201231203601.GR2657@paulmck-ThinkPad-P72>
 <6e46043c-999b-48db-3ec1-44a4dc303686@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e46043c-999b-48db-3ec1-44a4dc303686@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jan 01, 2021 at 10:30:00AM +0900, Akira Yokosawa wrote:
> On Thu, 31 Dec 2020 12:36:01 -0800, Paul E. McKenney wrote:
> > On Thu, Dec 31, 2020 at 01:43:36PM +0900, Akira Yokosawa wrote:
> >> On Wed, 30 Dec 2020 20:04:09 -0800, Paul E. McKenney wrote:
> >>> On Thu, Dec 31, 2020 at 08:21:58AM +0900, Akira Yokosawa wrote:
> >>>> On Wed, 30 Dec 2020 10:59:33 -0800, Paul E. McKenney wrote:
> >>>>> On Wed, Dec 30, 2020 at 08:13:46AM -0800, Paul E. McKenney wrote:
> >>>>>> On Wed, Dec 30, 2020 at 08:44:30PM +0900, Akira Yokosawa wrote:
> >>>>>>> Hi Paul,
> >>>>>>>
> >>>>>>> On Tue, 29 Dec 2020 21:37:28 -0800, Paul E. McKenney wrote:
> >>>>>>>> Hello!
> >>>>>>>>
> >>>>>>>> Release Candidate 1 of the Second Edition is now available, and I have
> >>>>>>>> started a prototype blog entry: https://paulmck.livejournal.com/59935.html
> >>>>>>>> Please let me know of any omissions or errors in this blog entry.
> >>>>>>>
> >>>>>>> Wouldn't it be worth while mentioning the availability of the "nq" build
> >>>>>>> targets?
> >>>>>>
> >>>>>> Good point!  How about like this?
> >>>>>>
> >>>>>> 	Those who find Quick Quizzes distracting will be happy to learn
> >>>>>> 	that "make nq" relegates both the quizzes and their answers to
> >>>>>> 	the end of each chapter, similiar to common practice in textbooks.
> >>>>>>
> >>>>>> Maybe I should also show what "make help" and "make help-full" print out.
> >>>>>
> >>>>> And I went ahead and did both, using the output of "make help-full" to
> >>>>> motivate the mention of "make nq".
> >>>>>
> >>>>> Thoughts?
> >>>>
> >>>> A bit lengthy, but looks good to me!
> >>>
> >>> I could drop the output of "make help-full" and just call out "make nq"
> >>> as one example from that list.  Would that be better?
> >>
> >> Or you could put a relevant part of the output of "make help-full" instead:
> >>
> >>     [...]
> >>     Experimental targets:
> >>       Full,              Abbr.
> >>       perfbook-qq.pdf,   qq:   framed Quick Quizzes
> >>       perfbook-nq.pdf,   nq:   no inline Quick Quizzes (chapterwise Answers)
> >>     [...]
> >>           ("1cqq", "1cnq", and so on disable 2-column mode.)
> > 
> > Good point, updated.  Further thoughts?
> 
> Looks nice!

Thank you!  Posted to social media, and Happy New Year!

							Thanx, Paul

> >>>>>>> PS:
> >>>>>>>
> >>>>>>> My experiment on index annotations is progressing but slowly.
> >>>>>>> Besides the hierarchical indexing, I'm attempting to make use of
> >>>>>>> the "glossaries" or the "glossaries-extra" package to manage indexing
> >>>>>>> of acronyms.
> >>>>>>> Once it becomes stable enough, I'll submit an RFC pull request.
> >>>>>>> That would be after the release of Second Edition.  
> >>>>>
> >>>>> And this sounds very good!
> >>>>>
> >>>>> 							Thanx, Paul
> >>>>>
> >>>>>>>>                                                                    I expect
> >>>>>>>> to post it to my social media accounts in a few days.
> >>>>>>>>
> >>>>>>>> And thank you all for your interest in and contributions to perfbook!
> >>>>>>>>
> >>>>>>>> 							Thanx, Paul
> >>>>>>>>
