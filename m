Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhCMFi1 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 13 Mar 2021 00:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615613906;
        bh=zEDfDIBlKU13C2LTu2JrDIJ4qwIyMo9NxHakvoqGvzM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=gli/aai9NcKeE7cPJsjEpD63rI8U0l4Gtxh/F2Nzu71Qg9MWIC0Tna5fADF3tRw6R
         AwSFJe7CcT4UcPSm9PNtPOWJKPS9OVWv710xHBxPGh0mYZEYcCbwkqTf8y9frnJHQk
         midW9Hj+dl8LwMYy7N9ZjKrUoANz4Kn2wBnBXzr0fXbMmXP+JdrwzYciYJft9vDJAC
         meOMXcQTR5Yvn9jaGrre0tZwewj5//ED4px7tLuE+qNpiwN8o82R55cuKX0/9LkY3U
         LMvS2nZElqaUbQP+s7pdVwFFdWG2Iw3Hgq0XhdMg9pBJkp0a27VTVx/GiaDU2aw3Ja
         JWkbwlHutgfSg==
Date: Fri, 12 Mar 2021 21:38:26 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] summary: Misc. fixes/tweaks
Message-ID: <20210313053826.GJ2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <3433dd91-c602-528f-7297-ed04609df447@gmail.com>
 <0ecabafc-a09d-48fb-fc75-c71f64725727@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ecabafc-a09d-48fb-fc75-c71f64725727@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Mar 13, 2021 at 12:35:50PM +0900, Akira Yokosawa wrote:
> On Sat, 13 Mar 2021 00:44:58 +0900, Akira Yokosawa wrote:
> > o Consistently use past tense in the recap of chapters.
> > o Use 'nbsp' to avoid line break after "I" in 2c builds.
> > o Fix staccato of "next next".
> > o In 1c builds, use float option of "H" to avoid a final page
> > with a lonely cartoon of frightened Tux.
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> >  summary.tex | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> > 
> > diff --git a/summary.tex b/summary.tex
> > index 16320e34..8ca5a635 100644
> > --- a/summary.tex
> > +++ b/summary.tex
> > @@ -9,7 +9,7 @@
> >  	  {\emph{Konrad Adenauer}}
> >  
> >  You have arrived at the end of this book, well done!
> > -I hope that your journey was a pleasant but challenging and worthwhile
> > +I~hope that your journey was a pleasant but challenging and worthwhile
> >  one.
> >  
> >  For your editor and contributors, this is the end of the journey to the
> > @@ -81,13 +81,13 @@ Whichever side of the formal-verification/\-testing divide you might
> >  be on, if code has not been thoroughly validated, it does not work.
> >  And that goes at least double for concurrent code.
> >  
> > -\Cref{chp:Putting It All Together} presents a number of situations
> > +\Cref{chp:Putting It All Together} presented a number of situations
> >  where combining concurrency mechanisms with each other or with other
> >  design tricks can greatly ease parallel programmers' lives.
> > -\Cref{sec:advsync:Advanced Synchronization} looks at advanced
> > +\Cref{sec:advsync:Advanced Synchronization} looked at advanced
> >  synchronization methods, including lockless programming, non-blocking
> >  synchronization, and parallel real-time computing.
> > -\Cref{chp:Advanced Synchronization: Memory Ordering} digs into the
> > +\Cref{chp:Advanced Synchronization: Memory Ordering} dug into the
> >  critically important topic of memory ordering, presenting techniques
> >  and tools to help you not only solve memory-ordering problems, but
> >  also to avoid them completely.
> > @@ -146,7 +146,7 @@ parallel-programming experts.
> >  Paul began his question by noting that in the 15~years from 1991 to 2006,
> >  the price of a parallel system had dropped from that of a house to that
> >  of a mid-range bicycle, and it was clear that there was much more room
> > -for additional dramatic price decreases over the next next 15~years
> > +for additional dramatic price decreases over the next 15~years
> >  extending to the year 2021.
> >  He also noted that decreasing price should result in greater familiarity
> >  and faster progress in solving parallel-programming problems.
> > @@ -210,12 +210,21 @@ if in fact he ever knew it.
> >  
> >  This book is nevertheless for that man.
> >  
> > -\begin{figure}[tb]
> > +\IfTwoColumn{
> > +\begin{figure}
> >  \centering
> >  \resizebox{3in}{!}{\includegraphics{cartoons/UseTheRightToolsBubble}}
> >  \caption{The Most Important Lesson}
> >  \ContributedBy{Figure}{fig:summary:The Most Important Lesson}{Melissa Broussard}
> >  \end{figure}
> > +}{
> > +\begin{figure}[H]
> > +\centering
> > +\resizebox{3in}{!}{\includegraphics{cartoons/UseTheRightToolsBubble}}
> > +\caption{The Most Important Lesson}
> > +\ContributedBy{Figure}{fig:summary:The Most Important Lesson}{Melissa Broussard}
> > +\end{figure}
> > +}

I queued and pushed your fixes above, thank you!

And I will be doing another rc this weekend in order to give us both
some time for proofreading.  I intend to revisit the changes that I
made, and I of course welcome any and all additional bug reports and
fixes.

> A much natural option would be to add a couple of paragraphs in front
> of the figure so that at least a few sentences make the following
> page in 1c builds.

Your concern is the large quantities of vertical whitespace on page
569 of perfbook-1c.pdf?  I could imagine expanding on the changes
in tooling from 2003 to 2006 that Linus alluded to.  I could also
imagine filling in on my attempts to get the book going from late
2004 to 2006.

Or am I missing your point?

							Thanx, Paul

>         Thanks, Akira
> 
> >  
> >  And this book is also for everyone else who would like to add low-level
> >  concurrency to their skillset.
> > 
