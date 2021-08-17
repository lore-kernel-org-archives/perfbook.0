Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234439AbhHQUWh (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 17 Aug 2021 16:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629231723;
        bh=EST4o7Py5ZoSL/ogSPCbcSAA8rAMWeoN/w2h4/db1Ec=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Z9Ckka5yLlLwOQS2VbRcVXtf2BVZNLPsljnsNA6ysu7hRkc6rcoBWdUbD0MbtF7C5
         P9waIYsvNrFlp5c4o8DYhUfiyqV/VyBvd6RNWJ2edERkqvnkVEc/gUMa7roooenmKB
         Yo1uLBRsg3q4yP8ndQVvT2uQLgMEwJZWWyHV/NGhypnEicXJzfSIFsfm8DOhXkgg90
         ICPb2bndarYcU2X9oG3YTL5fAMWe6SI7w6pGsRwmtY1JoIyUN3NNfkeR7RvttK1hFw
         GWWfLJJhtMzzCLQOe9VyhFUfliRzWnOdmv5yfTajJ6rIwZdQ1+FFq3UqQjRHI1ZPoY
         WceUwFPIlZ8zw==
Date: Tue, 17 Aug 2021 13:22:03 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 04/11] Add \ignorespaces command to
 \IfEbookSize and \IfSansSerif
Message-ID: <20210817202203.GA3651112@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
 <82871fad-83e9-6d46-7e6c-d01a558d8dd5@gmail.com>
 <20210817182951.GP4126399@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817182951.GP4126399@paulmck-ThinkPad-P17-Gen-1>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 17, 2021 at 11:29:51AM -0700, Paul E. McKenney wrote:
> On Tue, Aug 17, 2021 at 07:21:27PM +0900, Akira Yokosawa wrote:
> > Using \IfEbookSize or \IfSansSerif macro in the middle of a paragraph
> > can cause extra white spaces around it.
> > Fix this by adding the \ignorespaces command in their definitions.
> > 
> > Also update the conditional text in styleguide.
> > 
> > As the other conditional macros aren't used in this manner, they are
> > not modified for the moment.
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> >  appendix/styleguide/styleguide.tex | 5 +++--
> >  perfbook-lt.tex                    | 6 ++++--
> >  2 files changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
> > index 9bb9683f..24e891a3 100644
> > --- a/appendix/styleguide/styleguide.tex
> > +++ b/appendix/styleguide/styleguide.tex
> > @@ -1013,8 +1013,9 @@ namely \qco{$-$}.\footnote{This rule assumes that math mode uses the
> >    same upright glyph as text mode.
> >    Our default font choice meets the assumption.
> >  \IfSansSerif{
> > -  One of the experimental targets ``1csf'' \emph{does} use a differnt font
> > -  for math mode figures as of October 2017.}{}
> > +  Experimental targets with sans-serif fonts such as
> > +  ``1csf'' and ``ebsf'' \emph{do} use a differnt font
> 
> I did s/differnt/different/ here.  This looks like the sort of typo
> that I would make!  ;-)

Other than that, all queued and pushed, thank you!

							Thanx, Paul

> > +  for math mode figures as of August 2021.}{}
> >  }
> >  For example,
> >  
> > diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> > index 62959e04..b1c4f780 100644
> > --- a/perfbook-lt.tex
> > +++ b/perfbook-lt.tex
> > @@ -117,13 +117,15 @@
> >  \newcommand{\IfHardCover}[2]{\ifthenelse{\boolean{hardcover}}{#1}{#2}}
> >  \newboolean{ebooksize}
> >  \setboolean{ebooksize}{false}
> > -\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}{#1}{#2}}
> > +\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}%
> > +  {\ignorespaces#1\ignorespaces}{\ignorespaces#2\ignorespaces}}
> >  \newboolean{afourpaper}
> >  \setboolean{afourpaper}{false}
> >  \newcommand{\IfAfourPaper}[2]{\ifthenelse{\boolean{afourpaper}}{#1}{#2}}
> >  \newboolean{sansserif}
> >  \setboolean{sansserif}{false}
> > -\newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}{#1}{#2}}
> > +\newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}%
> > +  {\ignorespaces#1\ignorespaces}{\ignorespaces#2\ignorespaces}}
> >  \newboolean{lmttforcode}
> >  \setboolean{lmttforcode}{true}
> >  \newcommand{\IfLmttForCode}[2]{\ifthenelse{\boolean{lmttforcode}}{#1}{#2}}
> > -- 
> > 2.17.1
> > 
> > 
