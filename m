Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229865AbhCZAvi (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 25 Mar 2021 20:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616719898;
        bh=dyUpJLmPDKqNEJpm4lWn1+HgNWns/YWjs+HqaF2MNXw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=mEUgSXd2nu0Wm6yWuu0U7riKxB7vVmr4F8hHegLpi8ZuS8dfnH3qiRpXIgOP/ELug
         1RnP8/1am4goTaZLVn5VpSZTsj/Uz3UfqgpVvaZHvtc2MZpvXnpWKe5VJ/jQyIcle6
         Q0E9Obf6ph6EReZmHS4PzRU3tYGQSw2YPGsgnA940XUi5f6BIMNAT8OrOBYjQfKiqk
         CEunGIigOpXSEBtZyeAKlmRLSUoU5Y3XZyOAn/zD8T3TnmWtATBNnY+pxgEJRW1Z5z
         uVSRastGhTuVUrRCaKHeGMLKwW/9g1qWJh+/uuVhKIzqSEh63JkYk0RwV0ywEOqFDY
         Z5IbTH70/Kivw==
Date: Thu, 25 Mar 2021 17:51:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/5] ebook reader size support
Message-ID: <20210326005137.GP2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
 <20210325161652.GL2696@paulmck-ThinkPad-P72>
 <eb5b9862-1fa3-93b4-1a2c-b287a16bdfbb@gmail.com>
 <20210326001216.GO2696@paulmck-ThinkPad-P72>
 <765e63d4-b555-3a03-5a08-b2d061f5fed7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <765e63d4-b555-3a03-5a08-b2d061f5fed7@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org

On Fri, Mar 26, 2021 at 09:26:23AM +0900, Akira Yokosawa wrote:
> On Thu, 25 Mar 2021 17:12:16 -0700, Paul E. McKenney wrote:
> > On Fri, Mar 26, 2021 at 04:24:03AM +0900, Akira Yokosawa wrote:
> >> On Thu, 25 Mar 2021 09:16:52 -0700, Paul E. McKenney wrote:
> >>> On Thu, Mar 25, 2021 at 07:49:44PM +0900, Akira Yokosawa wrote:
> >>>> Hi Balbir and Paul,
> >>>>
> >>>> So, this is a revised patch set based on the RFC PATCH from
> >>>> Balbir.
> >>>>
> >>>> Hearing no objection to the rename of "-er" to "-eb",
> >>>> I did the rename in Patch 1/5 of Balbir's.
> >>>> Patch 2/5 is an updated one I sent earlier, with additional 
> >>>> float-barrier macro for ebooksize build and minor tweaks.
> >>>> Note that the extra blank line at the bottom of \ebresizeverb
> >>>> is now fixed.
> >>>> Patch 3/5 is also an updated one I sent earlier.
> >>>> Patch 4/5 shrinks floats in styleguide.
> >>>> Patch 5/5 updates help text in Makefile to mention build targets
> >>>> for ebooksize.  They are marked as (WIP) for the moment.
> >>>>
> >>>> This set can be applied to current master.
> >>>
> >>> When I try "git am -s -3", I get this:
> >>>
> >>> ------------------------------------------------------------------------
> >>>
> >>> Applying: perfbook-lt: Add macro to shrink floats for ebook
> >>> fatal: sha1 information is lacking or useless (perfbook-lt.tex).
> >>> error: could not build fake ancestor
> >>> Patch failed at 0001 perfbook-lt: Add macro to shrink floats for ebook
> >>> The copy of the patch that failed is found in: .git/rebase-apply/patch
> >>> When you have resolved this problem, run "git am --continue".
> >>> If you prefer to skip this patch, run "git am --skip" instead.
> >>> To restore the original branch and stop patching, run "git am --abort".
> >>>
> >>> ------------------------------------------------------------------------
> >>>
> >>> The usual cause of this is when the series is on top of a few additional
> >>> patches in your git archive.  If this is the case, then it is possible
> >>> that you can rebase them without git complaining because git analyzes the
> >>> intervening patches.  Lacking those intervening patches in my archive,
> >>> git just complains at me.
> >>>
> >>> If this is the case, could you please rebase this series onto master,
> >>> then resend?  Alternatively, resend including the intervening patches,
> >>> allowing me to do the rebase.
> >>>
> >>> If there are no intervening patches in your archive, I have no idea what
> >>> is happening.  ;-)
> >>
> >> Strange...
> >>
> >> I see the HEAD of master at the tag "Edition.2", whose commit id is
> >> 6932521bb9df ("future/htm: Remove redundant 'to' from 'WRT to' in section
> >> headings").
> >>
> >> My attempt to apply this series by "git am" is OK.
> >>
> >> Do you have any commits not pushed yet?
> >>
> >> If so, please try to apply this patch set on Edition.2?
> > 
> > Yes, and already done, several attempts.  Very strange.
> > 
> > I recloned and tried again, with the same result, or lack thereof.
> > 
> > I did "git status", "git am", a "sum" comand, and "git show HEAD",
> > resulting in the output below.  What do you see on your side?  I am
> > especially interested in the output from that "sum" command at your end.
> > 
> > Hmmm...  It is also possible that the patch was damaged in transit.
> > I attached my copy.  Could you please check?
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > $ git status
> > HEAD detached at Edition.2
> > nothing to commit, working tree clean
> > $ git am -s -3 /tmp/akiyks.patch
> > Applying: perfbook-lt: Add macro to shrink floats for ebook
> > fatal: sha1 information is lacking or useless (perfbook-lt.tex).
> > error: could not build fake ancestor
> > Patch failed at 0001 perfbook-lt: Add macro to shrink floats for ebook
> > The copy of the patch that failed is found in: .git/rebase-apply/patch
> > When you have resolved this problem, run "git am --continue".
> > If you prefer to skip this patch, run "git am --skip" instead.
> > To restore the original branch and stop patching, run "git am --abort".
> > $ sum Makefile perfbook-lt.tex
> > 37096    19 Makefile
> > 02089    18 perfbook-lt.tex
> > $ git show HEAD
> > commit 6932521bb9df8c95aa6e09ceb7fd3ced88fe412c
> > Author: Akira Yokosawa <akiyks@gmail.com>
> > Date:   Sun Mar 21 19:17:32 2021 +0900
> > 
> >     future/htm: Remove redundant 'to' from 'WRT to' in section headings
> >     
> >     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/future/htm.tex b/future/htm.tex
> > index cf222e5..242b85f 100644
> > --- a/future/htm.tex
> > +++ b/future/htm.tex
> > @@ -41,7 +41,7 @@ cache misses, and supporting a fair number of practical applications.
> >  However, it always pays to read the fine print, and HTM is no exception.
> >  A major point of this section is determining under what conditions HTM's
> >  benefits outweigh the complications hidden in its fine print.
> > -To this end, \cref{sec:future:HTM Benefits WRT to Locking}
> > +To this end, \cref{sec:future:HTM Benefits WRT Locking}
> >  describes HTM's benefits and
> >  \cref{sec:future:HTM Weaknesses WRT Locking} describes its weaknesses.
> >  This is the same approach used in earlier
> > @@ -51,7 +51,7 @@ and also in the previous section.\footnote{
> >  	discussions with the other authors, Maged Michael, Josh Triplett,
> >  	and Jonathan Walpole, as well as with Andi Kleen.}
> >  
> > -\Cref{sec:future:HTM Weaknesses WRT to Locking When Augmented} then describes
> > +\Cref{sec:future:HTM Weaknesses WRT Locking When Augmented} then describes
> >  HTM's weaknesses with respect to the combination of synchronization
> >  primitives used in the Linux kernel (and in many user-space applications).
> >  \Cref{sec:future:Where Does HTM Best Fit In?} looks at where HTM
> > @@ -61,8 +61,8 @@ greatly increase HTM's scope and appeal.
> >  Finally, \cref{sec:future:Conclusions}
> >  presents concluding remarks.
> >  
> > -\subsection{HTM Benefits WRT to Locking}
> > -\label{sec:future:HTM Benefits WRT to Locking}
> > +\subsection{HTM Benefits WRT Locking}
> > +\label{sec:future:HTM Benefits WRT Locking}
> >  
> >  The primary benefits of HTM are
> >  (1)~its avoidance of the cache misses that are often incurred by
> > @@ -144,7 +144,7 @@ Although it is possible to use two-phased locking and hashed arrays
> >  of locks to partition general data structures, other techniques
> >  have proven preferable~\cite{DavidSMiller2006HashedLocking},
> >  as will be discussed in
> > -\cref{sec:future:HTM Weaknesses WRT to Locking When Augmented}.
> > +\cref{sec:future:HTM Weaknesses WRT Locking When Augmented}.
> >  Given its avoidance of synchronization cache misses,
> >  HTM is therefore a very real possibility for large non-partitionable
> >  data structures, at least assuming relatively small updates.
> > @@ -843,7 +843,7 @@ serious shortcomings of locking,\footnote{
> >  	deadlock detectors~\cite{JonathanCorbet2006lockdep}, a wealth
> >  	of data structures that have been adapted to locking, and
> >  	a long history of augmentation, as discussed in
> > -	\cref{sec:future:HTM Weaknesses WRT to Locking When Augmented}.
> > +	\cref{sec:future:HTM Weaknesses WRT Locking When Augmented}.
> >  	In addition, if locking really were as horrible as a quick skim
> >  	of many academic papers might reasonably lead one to believe,
> >  	where did all the large lock-based parallel programs (both
> > @@ -867,8 +867,8 @@ hazard pointers~\cite{MagedMichael04a,HerlihyLM02},
> >  and RCU~\cite{McKenney98,McKenney01a,ThomasEHart2007a,PaulEMcKenney2012ELCbattery}.
> >  The next section looks at how such augmentation changes the equation.
> >  
> > -\subsection{HTM Weaknesses WRT to Locking When Augmented}
> > -\label{sec:future:HTM Weaknesses WRT to Locking When Augmented}
> > +\subsection{HTM Weaknesses WRT Locking When Augmented}
> > +\label{sec:future:HTM Weaknesses WRT Locking When Augmented}
> >  
> >  \input{future/HTMtableRCU}
> >  
> > 
> 
> Hmm...
> 
> In the attached akiyks.patch, there are [PATCH RFC 1/2] and [PATCH RFC 2/2].
> and the [PATCH RFC 1/2] wouldn't apply due to missing Balbir's RFC PATCH.
> 
> Or do you want me to check if there is any damage in some of the 7 patches
> I sent out?
> 
> I think starting from [PATCH -perfbook 1/5], the patch set should work.
> 
> Or what am I missing???

You are quite right, my fault entirely.

Some days it just doesn't pay to take hold of the keyboard.  :-/

Anyway, back to the original question, it looks pretty good, though
some of the larger tables (17.1, for example) are truncated.  Which
I suspect you were saying earlier when talking about shrinking things.

							Thanx, Paul
