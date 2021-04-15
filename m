Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233079AbhDOPbT (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 15 Apr 2021 11:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618500655;
        bh=7sRH+KFIbPLNMWEa8X6PqrLvgf3LfgdBI1LnMiztyHo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZDtC3jzhJ3lOahfrbv5rXmVAIreKfvvXbiLumbGZ9UZlNpaKNI7q3E9LVESwh3yab
         rvq4apGu5jPz9+MxG5OEh+j+B59AdbaqBSEZ7uv8nqFm6LUVp6leYVf9hEjoBb1W+W
         dIayKikTuqPJMAigJL2QWLxRl4V3THpco4hrruknmDurPFAoPcPEynWYUJJ4EIljQa
         j70I+Cn/6qlIQKm7GOB245kzbXy0EWge8ZPj0PRQ/WfFCImKocEshdFc5OE+yUgeHS
         hEgMj+xB/x66B551JtZjztGlhwagtc0pRrNzaEL5PrZ3zKwEduY8Jve67VPwCsK6ts
         U2rlHDEKtHfng==
Date: Thu, 15 Apr 2021 08:30:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/5] Updates of qqz.sty
Message-ID: <20210415153055.GE4510@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
 <20210414173123.GR4510@paulmck-ThinkPad-P17-Gen-1>
 <2089a81a-4f58-398d-1bce-c3ecc307c12c@gmail.com>
 <20210415051133.GD4510@paulmck-ThinkPad-P17-Gen-1>
 <e5300316-5ad1-3787-a157-2ad5c37cc079@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5300316-5ad1-3787-a157-2ad5c37cc079@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 15, 2021 at 02:47:45PM +0900, Akira Yokosawa wrote:
> On Wed, 14 Apr 2021 22:11:33 -0700, Paul E. McKenney wrote:
> > On Thu, Apr 15, 2021 at 12:49:18PM +0900, Akira Yokosawa wrote:
> >> On Wed, 14 Apr 2021 10:31:23 -0700, Paul E. McKenney wrote:
> >>> On Wed, Apr 14, 2021 at 07:47:51PM +0900, Akira Yokosawa wrote:
> >>>> Hi Paul,
> >>>>
> >>>> A change in upstream hyperref package (v7.00j) breaks code in
> >>>> qqz.sty.
> >>>> Now, \refstepcounter in vertical mode can cause a page break.
> >>>> Our use of \refstepcounter in framed Quick Quiz is in vertical
> >>>> mode and if a page break happens at that point, destination point
> >>>> set by \refstepcounter is discarded by tcolorbox, which results in
> >>>> a missing destination.
> >>>>
> >>>> This can be fixed by leaving vertical mode in front of \refstepcounter,
> >>>> which is what Patch 1/5 does.
> >>>>
> >>>> The updated code is compatible with older versions of hyperref as
> >>>> long as our usage patterns are concerned.
> >>>> Aa a bonus, new link-target positions look nicer (not too close to the
> >>>> "Quick Quiz" labels).
> >>>>
> >>>> Patches 2/5--4/5 are (in my opinion) improvements to the -nq build.
> >>>> Seeing both Quizzes and Answers in the final section, one would
> >>>> just see the answer without taking time to think about a quiz.
> >>>> So these patches modify the -nq build so that chapter-wise sections
> >>>> have only the quiz parts.
> >>>> Answers are presented in Appendix E in the same way as the other
> >>>> builds.
> >>>>
> >>>> Patch 5/5 adds page references in the answers of non-nq builds.
> >>>
> >>> Good points, queued and pushed, thank you!
> >>>
> >>> On interesting thing is that if you click on the small bubble in the
> >>> text, you are taken to the corresponding QQ at the end of that chapter.
> >>> If you click on the square, you are taken to the answer.  If you click
> >>> on the page number in the square in the upper right-hand corner of the
> >>> QQ question, you get taken back to the original small bubble, all of
> >>> which is goodness.
> >>>
> >>> However, if you click on the either black square at the end of the
> >>> question or the white shadowed square at the end of the answer, you get
> >>> taken back to the small bubble in the text.
> >>
> >> Ya, that's as described in the commit log of Patch 2/5:
> >>
> >>     o Hyperlinks are made in the following way:
> >>
> >>       - Inline QQ marker -> Chapter-wise Quiz -> Answer in Appendix
> >>       - Page number marker in Quiz part -> Inline QQ marker
> >>       - Answer in Appendix -> Inline QQ marker
> > 
> > OK, my reading comprehension was clearly substandard.  :-/
> > 
> >>> Is it possible that some of our readers will expect that these two squares
> >>> will instead take them back to the question at the end of the chapter?
> >>
> >> It is possible, but the white box at the end of the answer is supposed
> >> to be a short-cut for those wanting to resume reading text.
> > 
> > True enough.
> > 
> >> So, appended is a compromise modifying the links of "Quick Quiz"
> >> and black box in the answer to go back to chapter-wise quiz section.
> >>
> >> Thoughts?
> > 
> > It does work well, and removes one layer of clicking that otherwise
> > needs to happen.  Let's see what people think about it.
> > 
> > We also have the page-number marker that goes back to the text, so we do
> > have the option of making the black and white boxes go to the beginning
> > and end of the quick-quiz box at the end of the chapter.
> 
> No, my point in making white box to go back to the end of the quiz
> in normal builds was to help people reach the text following the
> quiz.
> So linking white box to a quiz at the end of the chapter spoils
> this purpose.  A page-number marker can be far away from the white
> box when the answer is long.
> 
> >                                                          But again,
> > let's see how this patch works for people.
> > 
> > Any objection to my pushing it as is, or should I wait for a second
> > version.  (I have queued it, but not yet pushed it out.)
> 
> I'm OK with your pushing it as is.

Done!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>        Thanks, Akira 
> >>
> >>> This is probably not a big deal, given that clicking on the small bubble
> >>> will take them to that list, but I figured that it was worth asking
> >>> the question.
> >>>
> >>> 							Thanx, Paul
> >>>
> >>>>         Thanks, Akira
> [...]
