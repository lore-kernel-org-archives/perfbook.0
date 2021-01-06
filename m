Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726826AbhAFSQR (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 6 Jan 2021 13:16:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609956929;
        bh=A1u5fkETUlrtah4WJZXJVof57e2PRbUPI4R3cpyntVk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ho+q7W03i2ZEzcddmT1mylN5qyimkDqtc0NjYzS6qoQDAGE8cZznXUvqNZrVyJFpj
         UQ+yU6Vg5aZWYTC3QUgzHiG3whZiZAF/FV0s/gGRpm9LEKbkB+N5RQqJH0qTBtkVyA
         4PaGHuDwg6WRr/7ZiYJYn4HlMTetHqKtgHu3i7TrUmQS+TC+Wn3BPCBhxDIRqUozet
         GtJCZXkDMj0qjRjseSXa2TURgL14BZlJYJ/Do0qV2grTSRayDkaH7U5IX+saoL+gFm
         5gUY0dpqLJhZ6wZSpE+3vELG2GnYqL1Rb1+mN6HYGHQ7sh1SobmPyzUwH0KX8el4Lr
         PTnGkkRnUuhPg==
Date: Wed, 6 Jan 2021 10:15:29 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer/rcuexercises: Annotate essential QQs
Message-ID: <20210106181529.GA19562@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <6e41a126-f08e-5ad2-3667-416cea540627@gmail.com>
 <20210105145353.GC17086@paulmck-ThinkPad-P72>
 <bef949af-a733-8024-f6e7-279036bf1045@gmail.com>
 <20210105160744.GE17086@paulmck-ThinkPad-P72>
 <ee30206d-0a78-608c-e1e5-1d55e8b6467f@gmail.com>
 <20210105234953.GI17086@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105234953.GI17086@paulmck-ThinkPad-P72>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 05, 2021 at 03:49:53PM -0800, Paul E. McKenney wrote:
> On Wed, Jan 06, 2021 at 07:36:10AM +0900, Akira Yokosawa wrote:
> > On Tue, 5 Jan 2021 08:07:44 -0800, Paul E. McKenney wrote:
> > > On Wed, Jan 06, 2021 at 12:11:25AM +0900, Akira Yokosawa wrote:
> > >> On Tue, 5 Jan 2021 06:53:53 -0800, Paul E. McKenney wrote:
> > >>> On Tue, Jan 05, 2021 at 09:23:11AM +0900, Akira Yokosawa wrote:
> > >>>> >From e98f36b3a91d406c2375863dc003727bc8153f4f Mon Sep 17 00:00:00 2001
> > >>>> From: Akira Yokosawa <akiyks@gmail.com>
> > >>>> Date: Mon, 4 Jan 2021 21:14:10 +0900
> > >>>> Subject: [PATCH -perfbook] defer/rcuexercises: Annotate essential QQs
> > >>>>
> > >>>> Quick Quizzes in this section should be presented in "nq" builds.
> > >>>>
> > >>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > >>>
> > >>> Applied and pushed, thank you!
> > >>>
> > >>> However, "make nq" is giving me framed quick quiz questions rather
> > >>> than the small-font indicators that were there at some time.
> > >>
> > >> Well, what you are seeing is the intention of this patch.
> > >>
> > >> As the opening sentence of this section says:
> > >>
> > >>     This section is organized as a series of Quick Quizzes that
> > >>     invite you to apply RCU to a number of examples ...
> > >>
> > >> , I thought the quiz parts of QQs 9.59 and 9.60 should be presented
> > >> inline in Section 9.5.6 rather than the small markers.
> > >>
> > >> They are similar to the QQs in the beginning of Chapter 5.
> > >>
> > >> Does this make sense?
> > > 
> > > Yes, it does, and I am good with QQs 9.59 and 9.60 being presented inline.
> > > But did you intend that QQ 9.34-9.38 on page 146 (PDF page 158) to also
> > > be displayed inline?
> > 
> > No, I didn't.
> > 
> > On my nq build, QQs 9.34-9.38 are on pages 179-181 (PDF pages 191-193)
> > and they are _not_ displayed inline.
> > 
> > Both TeX Live 2017/Debian and up-to-date TeX Live 2020 give me the same
> > result.
> > 
> > The page count difference suggests something is broken on your side.
> 
> Again, quite possibly.
> 
> I really have seen it without the inline displays sometime in the
> dim distant past.  ;-)
> 
> > Hmm???
> 
> I did "make clean" and saw no change in result.  I cloned a fresh
> copy of the repo, and saw no change in result.  I will be trying
> newer versions of the tools in the near future.
> 
> Is it possible that I have some old workaround no-longer-helpful
> LaTeX file somewhere?

Sigh.  Pilot error.

I happened to have positioned the perfbook-nq.pdf file to a page in
the middle of an end-of-chapter answers section, and was too distracted
to notice.

So "make nq" really does work just fine for me as is.

And please accept my apologies for the noise!

						Thanx, Paul

> >         Thanks, Akira
> > 
> > > 
> > > Again, this might be the fault of my old tools:
> > > 
> > > $ pdflatex --version
> > > pdfTeX 3.14159265-2.6-1.40.18 (TeX Live 2017/Debian)
> > > kpathsea version 6.2.3
> > > Copyright 2017 Han The Thanh (pdfTeX) et al.
> > > There is NO warranty.  Redistribution of this software is
> > > covered by the terms of both the pdfTeX copyright and
> > > the Lesser GNU General Public License.
> > > For more information about these matters, see the file
> > > named COPYING and the pdfTeX source.
> > > Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
> > > Compiled with libpng 1.6.34; using libpng 1.6.34
> > > Compiled with zlib 1.2.11; using zlib 1.2.11
> > > Compiled with poppler version 0.62.0
> > > 
> > > 							Thanx, Paul
> > > 
> > >>         Thanks, Akira
> > >>
> > >>>                                                               This
> > >>> might be the fault of my tools, and I will be upgrading soon anyway.
> > >>> But I figured I should let you know.
> > >>>
> > >>> 							Thanx, Paul
> > >>>
> > >>>> ---
> > >>>>  defer/rcuexercises.tex | 16 +++++++---------
> > >>>>  1 file changed, 7 insertions(+), 9 deletions(-)
> > >>>>
> > >>>> diff --git a/defer/rcuexercises.tex b/defer/rcuexercises.tex
> > >>>> index 9438c9e5..476819a9 100644
> > >>>> --- a/defer/rcuexercises.tex
> > >>>> +++ b/defer/rcuexercises.tex
> > >>>> @@ -13,8 +13,7 @@ The \co{rcu_read_lock()}, \co{rcu_read_unlock()}, \co{rcu_dereference()},
> > >>>>  \co{rcu_assign_pointer()}, and \co{synchronize_rcu()} primitives should
> > >>>>  suffice for most of these exercises.
> > >>>>  
> > >>>> -\QuickQuizSeries{%
> > >>>> -\QuickQuizB{
> > >>>> +\EQuickQuiz{
> > >>>>  	The statistical-counter implementation shown in
> > >>>>  	Listing~\ref{lst:count:Per-Thread Statistical Counters}
> > >>>>  	(\path{count_end.c})
> > >>>> @@ -25,7 +24,7 @@ suffice for most of these exercises.
> > >>>>  	(Keep in mind that \co{read_count()}'s scalability will
> > >>>>  	necessarily be limited by its need to scan all threads'
> > >>>>  	counters.)
> > >>>> -}\QuickQuizAnswerB{
> > >>>> +}\EQuickQuizAnswer{
> > >>>>  	Hint: place the global variable \co{finalcount} and the
> > >>>>  	array \co{counterp[]} into a single RCU-protected struct.
> > >>>>  	At initialization time, this structure would be allocated
> > >>>> @@ -59,9 +58,9 @@ suffice for most of these exercises.
> > >>>>  	on
> > >>>>  	page~\pageref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters}
> > >>>>  	for more details.
> > >>>> -}\QuickQuizEndB
> > >>>> -%
> > >>>> -\QuickQuizE{
> > >>>> +}\EQuickQuizEnd
> > >>>> +
> > >>>> +\EQuickQuiz{
> > >>>>  	Section~\ref{sec:count:Applying Exact Limit Counters}
> > >>>>  	showed a fanciful pair of code fragments that dealt with counting
> > >>>>  	I/O accesses to removable devices.
> > >>>> @@ -73,7 +72,7 @@ suffice for most of these exercises.
> > >>>>  	(Keep in mind that the performance of the common-case first
> > >>>>  	code fragment that does I/O accesses is much more important
> > >>>>  	than that of the device-removal code fragment.)
> > >>>> -}\QuickQuizAnswerE{
> > >>>> +}\EQuickQuizAnswer{
> > >>>>  	Hint: replace the read-acquisitions of the reader-writer lock
> > >>>>  	with RCU read-side critical sections, then adjust the
> > >>>>  	device-removal code fragment to suit.
> > >>>> @@ -83,5 +82,4 @@ suffice for most of these exercises.
> > >>>>  	on
> > >>>>  	Page~\pageref{sec:together:RCU and Counters for Removable I/O Devices}
> > >>>>  	for one solution to this problem.
> > >>>> -}\QuickQuizEndE
> > >>>> -}
> > >>>> +}\EQuickQuizEnd
> > >>>> -- 
> > >>>> 2.17.1
> > >>>>
