Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbgCBPUb (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 2 Mar 2020 10:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583162430;
        bh=flS5F1DXKIPYJyMIix8mFPK72AzupChO/PoTd2FBRGo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=whaiDZLzmaXJNWGKptIe2CUBHpiWh5ExNVsNj98RcaonA+63gg0e7VWfkvcdRG7ws
         RgTFWvn5Ji0X58Me83ajiXENqgGLTKHurdsSL2hsQni3noT5WGFrYwcEHShRHFXhVt
         jRiwglstm3mOctAhpgoM5AFp8tR2LXmIsiyFEMDA=
Date: Mon, 2 Mar 2020 07:20:30 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] qqz.sty: Permit column/page break in front of Quick Quiz
 heading
Message-ID: <20200302152030.GH2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <90c17ed1-2a89-d270-c7ca-3668ef52d3dd@gmail.com>
 <20200301175132.GS2935@paulmck-ThinkPad-P72>
 <386c8d0e-7b5e-ffa1-398e-4a81a6e769ac@gmail.com>
 <20200301230924.GB2935@paulmck-ThinkPad-P72>
 <c7b7b8d5-8bbd-08ba-6358-9bfd63879097@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7b7b8d5-8bbd-08ba-6358-9bfd63879097@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Mar 03, 2020 at 12:10:41AM +0900, Akira Yokosawa wrote:
> On Sun, 1 Mar 2020 15:09:24 -0800, Paul E. McKenney wrote:
> > On Mon, Mar 02, 2020 at 07:43:40AM +0900, Akira Yokosawa wrote:
> >> On Sun, 1 Mar 2020 09:51:32 -0800, Paul E. McKenney wrote:
> >>> On Mon, Mar 02, 2020 at 12:02:01AM +0900, Akira Yokosawa wrote:
> >>>> >From 2c4fd06827d075a04c157d150cf036db1615f268 Mon Sep 17 00:00:00 2001
> >>>> From: Akira Yokosawa <akiyks@gmail.com>
> >>>> Date: Sun, 1 Mar 2020 21:47:45 +0900
> >>>> Subject: [PATCH] qqz.sty: Permit column/page break in front of Quick Quiz heading
> >>>>
> >>>> It turned out that the definition of \QuickQuiz needs an explicit
> >>>> hint (\goodbreak) for LaTeX to be able to break column/page in front
> >>>> of it.
> >>>>
> >>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>>
> >>> Nice!
> >>>
> >>> Does it make sense to also add \goodbreak at the end of a Quick Quiz,
> >>> perhaps as follows?  Doing so gets QQ2.11 all on one page in the
> >>> two-column version.
> >>>
> >>> Does it also make sense to encourage page breaks at the beginnings of
> >>> Quick Quizzes in the answer chapter?
> >>>
> >>> In other words, should I fold the diff below into your diff, or would
> >>> doing so break something?
> >>
> >> 2nd hunk causes the headings of Sections E.3, E.5, E.10, E.13, E.17,
> >> and E.20 to be at the bottom.  So please just apply the first hunk.
> >> Also, the title and the change log need some adjustment.
> > 
> > Good point, and done!  Queued and pushed.
> > 
> > I suspect that an appropriate "\if" statement would repair the second
> > hunk, but on the other hand, having quick quizzes broken across lines
> > in the answer section isn't as jarring as in the main body of the text.
> 
> My guess is that the \par command in the beginning of \QuickQ implies
> breakable point and the extra \goodbreak confused the TeX engine.

Good point, that would do it!

> What you want is to keep an Answer to a Quick Quiz to be in the same
> column/page as much as possible?

I was mostly just experimenting.  Yes, readers would want the quick quiz
and its answer in the same column, or, failing that, on the same page.
But the quizzes+answers are too long to do that without leaving lots of
ugly whitespace.  So there will be breaks somewhere.

I was thinking in terms of encouraging LaTeX to keep the question part
in a single column, given that the questions are normally rather short.
But it certainly isn't worth having section headings at the bottom of
a column!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>> ------------------------------------------------------------------------
> >>>
> >>> diff --git a/qqz.sty b/qqz.sty
> >>> index 4dd411f..8bd80d9 100644
> >>> --- a/qqz.sty
> >>> +++ b/qqz.sty
> >>> @@ -39,7 +39,7 @@
> >>>  	\refstepcounter{quickquizctrE}%
> >>>  	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
> >>>  	\label{QQE.\thechapter.\thequickquizctrE}}
> >>> -\newcommand{\QuickQuizEnd}{}
> >>> +\newcommand{\QuickQuizEnd}{\goodbreak}
> >>>  
> >>>  % To create a macro referencing the previously defined quick quiz:
> >>>  %	\QuickQuizLabel{\QQname}
> >>> @@ -80,7 +80,7 @@
> >>>  \newcommand{\QuickQ}[1]{
> >>>  	\par
> >>>  	\refstepcounter{quickquizctrC}%
> >>> -	\noindent
> >>> +	\goodbreak\noindent
> >>>  	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} #1 ~ \\ }
> >>>  
> >>>  \newcommand{\QuickA}[1]{%
> >>>
