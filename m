Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232106AbhHQXuv (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 17 Aug 2021 19:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629244217;
        bh=PkVd7X1JCvyR3HQ2Fp/Jc7tUdzjEG/yMxF/FiBZtAWk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=GjkkmbWzfTheHK3czDxJbgeaxkX/wrrQC6Wa6gnKRpHIg9z3H5SSNidE6cOQ9jYvU
         wiFtOAR+tUcnEtwcQ/AyXPtPO3XyeuEnb2NExjGCNonREm03HNtNPvd9src4UeT1NC
         dZRu0PCOZzVkDGNl6Bflmvu9bf3rO/SByb0+D2SLZinATXbUNQds/EY1EQfc+NhNaK
         Mn6OcD+DiklQ2QuhRf93dgFjsE5RNLMo6ysjUjS+ntYwOMdFK4WvOos8iI3KaDBWrc
         hkpRrFyDt3eVWZY6kl3FMapHFqdmoWE0cHOhQvcB6rapDPoYbm785N63dbEg49YUKT
         JbDGi6lTbD8xQ==
Date: Tue, 17 Aug 2021 16:50:17 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 04/11] Add \ignorespaces command to
 \IfEbookSize and \IfSansSerif
Message-ID: <20210817235017.GQ4126399@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
 <82871fad-83e9-6d46-7e6c-d01a558d8dd5@gmail.com>
 <20210817182951.GP4126399@paulmck-ThinkPad-P17-Gen-1>
 <19174709-20c4-1de5-5977-7ab0e7dd5622@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19174709-20c4-1de5-5977-7ab0e7dd5622@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Aug 18, 2021 at 08:31:05AM +0900, Akira Yokosawa wrote:
> On Tue, 17 Aug 2021 11:29:51 -0700, Paul E. McKenney wrote:
> > On Tue, Aug 17, 2021 at 07:21:27PM +0900, Akira Yokosawa wrote:
> >> Using \IfEbookSize or \IfSansSerif macro in the middle of a paragraph
> >> can cause extra white spaces around it.
> >> Fix this by adding the \ignorespaces command in their definitions.
> >>
> >> Also update the conditional text in styleguide.
> >>
> >> As the other conditional macros aren't used in this manner, they are
> >> not modified for the moment.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >>  appendix/styleguide/styleguide.tex | 5 +++--
> >>  perfbook-lt.tex                    | 6 ++++--
> >>  2 files changed, 7 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
> >> index 9bb9683f..24e891a3 100644
> >> --- a/appendix/styleguide/styleguide.tex
> >> +++ b/appendix/styleguide/styleguide.tex
> >> @@ -1013,8 +1013,9 @@ namely \qco{$-$}.\footnote{This rule assumes that math mode uses the
> >>    same upright glyph as text mode.
> >>    Our default font choice meets the assumption.
> >>  \IfSansSerif{
> >> -  One of the experimental targets ``1csf'' \emph{does} use a differnt font
> >> -  for math mode figures as of October 2017.}{}
> >> +  Experimental targets with sans-serif fonts such as
> >> +  ``1csf'' and ``ebsf'' \emph{do} use a differnt font
> > 
> > I did s/differnt/different/ here.  This looks like the sort of typo
> > that I would make!  ;-)
> 
> So, I made the typo way back in 2017.
> A typo in a footnote in Style Guide is unlikely to be caught. ;-)

To your point, I most certainly did not catch it!  ;-)

But yes, I should have checked for the typo in the old line as well
as the new line.

							Thanx, Paul

> >> +  for math mode figures as of August 2021.}{}
> >>  }
> >>  For example,
> >>  
> >> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> >> index 62959e04..b1c4f780 100644
> >> --- a/perfbook-lt.tex
> >> +++ b/perfbook-lt.tex
> >> @@ -117,13 +117,15 @@
> >>  \newcommand{\IfHardCover}[2]{\ifthenelse{\boolean{hardcover}}{#1}{#2}}
> >>  \newboolean{ebooksize}
> >>  \setboolean{ebooksize}{false}
> >> -\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}{#1}{#2}}
> >> +\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}%
> >> +  {\ignorespaces#1\ignorespaces}{\ignorespaces#2\ignorespaces}}
> >>  \newboolean{afourpaper}
> >>  \setboolean{afourpaper}{false}
> >>  \newcommand{\IfAfourPaper}[2]{\ifthenelse{\boolean{afourpaper}}{#1}{#2}}
> >>  \newboolean{sansserif}
> >>  \setboolean{sansserif}{false}
> >> -\newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}{#1}{#2}}
> >> +\newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}%
> >> +  {\ignorespaces#1\ignorespaces}{\ignorespaces#2\ignorespaces}}
> >>  \newboolean{lmttforcode}
> >>  \setboolean{lmttforcode}{true}
> >>  \newcommand{\IfLmttForCode}[2]{\ifthenelse{\boolean{lmttforcode}}{#1}{#2}}
> >> -- 
> >> 2.17.1
> >>
> >>
