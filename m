Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229499AbhDOFL4 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 15 Apr 2021 01:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618463494;
        bh=vOzT7Dt15XZkGu2NgiIxwsblxalA9uOh8gfKdQw06Tw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=envl/oqNpC/psHf2+qgxpLnFTp3T/rQVlgeM14a59AGdaDJlvHPVkadPTLieKTBsI
         niH/trYAYfRMdlQF+4eTD7vM1wO5JAMCxDJwx9VoANssAAS+J0dB3DoO3tzQhyan6k
         u6mylOTgq9lHS8tkxSOOnp5wo//wgL0ymN+87FURY2NGXthzizkD1qizjMURecZrXE
         WiTMcuaA/Ku7GLKc8qsMMTaL9bsgw/BMR8umixaZQZBa0x3Z+OhVBu/gH5ZZeMjGyz
         EFFANKovGvRUGPEnlJ9BdMOkdVUfrZsxSNqOBHRLvWgWE1z3eeB8ltnf6Ci1N8HM9z
         EbSIZWecPibgQ==
Date: Wed, 14 Apr 2021 22:11:33 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/5] Updates of qqz.sty
Message-ID: <20210415051133.GD4510@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
 <20210414173123.GR4510@paulmck-ThinkPad-P17-Gen-1>
 <2089a81a-4f58-398d-1bce-c3ecc307c12c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2089a81a-4f58-398d-1bce-c3ecc307c12c@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 15, 2021 at 12:49:18PM +0900, Akira Yokosawa wrote:
> On Wed, 14 Apr 2021 10:31:23 -0700, Paul E. McKenney wrote:
> > On Wed, Apr 14, 2021 at 07:47:51PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> A change in upstream hyperref package (v7.00j) breaks code in
> >> qqz.sty.
> >> Now, \refstepcounter in vertical mode can cause a page break.
> >> Our use of \refstepcounter in framed Quick Quiz is in vertical
> >> mode and if a page break happens at that point, destination point
> >> set by \refstepcounter is discarded by tcolorbox, which results in
> >> a missing destination.
> >>
> >> This can be fixed by leaving vertical mode in front of \refstepcounter,
> >> which is what Patch 1/5 does.
> >>
> >> The updated code is compatible with older versions of hyperref as
> >> long as our usage patterns are concerned.
> >> Aa a bonus, new link-target positions look nicer (not too close to the
> >> "Quick Quiz" labels).
> >>
> >> Patches 2/5--4/5 are (in my opinion) improvements to the -nq build.
> >> Seeing both Quizzes and Answers in the final section, one would
> >> just see the answer without taking time to think about a quiz.
> >> So these patches modify the -nq build so that chapter-wise sections
> >> have only the quiz parts.
> >> Answers are presented in Appendix E in the same way as the other
> >> builds.
> >>
> >> Patch 5/5 adds page references in the answers of non-nq builds.
> > 
> > Good points, queued and pushed, thank you!
> > 
> > On interesting thing is that if you click on the small bubble in the
> > text, you are taken to the corresponding QQ at the end of that chapter.
> > If you click on the square, you are taken to the answer.  If you click
> > on the page number in the square in the upper right-hand corner of the
> > QQ question, you get taken back to the original small bubble, all of
> > which is goodness.
> > 
> > However, if you click on the either black square at the end of the
> > question or the white shadowed square at the end of the answer, you get
> > taken back to the small bubble in the text.
> 
> Ya, that's as described in the commit log of Patch 2/5:
> 
>     o Hyperlinks are made in the following way:
> 
>       - Inline QQ marker -> Chapter-wise Quiz -> Answer in Appendix
>       - Page number marker in Quiz part -> Inline QQ marker
>       - Answer in Appendix -> Inline QQ marker

OK, my reading comprehension was clearly substandard.  :-/

> > Is it possible that some of our readers will expect that these two squares
> > will instead take them back to the question at the end of the chapter?
> 
> It is possible, but the white box at the end of the answer is supposed
> to be a short-cut for those wanting to resume reading text.

True enough.

> So, appended is a compromise modifying the links of "Quick Quiz"
> and black box in the answer to go back to chapter-wise quiz section.
> 
> Thoughts?

It does work well, and removes one layer of clicking that otherwise
needs to happen.  Let's see what people think about it.

We also have the page-number marker that goes back to the text, so we do
have the option of making the black and white boxes go to the beginning
and end of the quick-quiz box at the end of the chapter.  But again,
let's see how this patch works for people.

Any objection to my pushing it as is, or should I wait for a second
version.  (I have queued it, but not yet pushed it out.)

							Thanx, Paul

>        Thanks, Akira 
> 
> > This is probably not a big deal, given that clicking on the small bubble
> > will take them to that list, but I figured that it was worth asking
> > the question.
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira
> [...]
> 
> ----8<--------
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 15 Apr 2021 12:31:26 +0900
> Subject: [PATCH] qqz.sty: Link chapter-wise quizzes from answers in -nq build
> 
> Paul's suggestion:
> 
>     However, if you click on the either black square at the end of
>     the question or the white shadowed square at the end of the answer,
>     you get taken back to the small bubble in the text.
> 
>     Is it possible that some of our readers will expect that these
>     two squares will instead take them back to the question at the
>     end of the chapter?
> 
> Akira's take on reader's expectation:
> 
>     The white boxes at the end of answers are meant as short-cuts to
>     go back to the text by a single click for those want to resume
>     reading.
> 
> So, this commit is a compromise and changes the link of "Quick Quiz"
> and black square so that they go back to the chapter-end quiz.
> The white box at the end of the answer is kept linking back to the
> small bubble in the text.
> 
> Also add a tail comment in \QuickQE to avoid an extra skip in front
> of the black square.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  qqz.sty | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/qqz.sty b/qqz.sty
> index 4e1a138a..86b50c79 100644
> --- a/qqz.sty
> +++ b/qqz.sty
> @@ -235,7 +235,7 @@
>  	\QuickQHeadingPage{QQ}{QQA}{\thechapter.\thequickquizctr}\\
>  }
>  
> -\newcommand{\QuickQE}[1]{
> +\newcommand{\QuickQE}[1]{%
>  	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
>  	\end{tcolorbox}
>  }
> @@ -243,11 +243,11 @@
>  \newcommand{\QuickQ}[1]{
>  	\begin{tcolorbox}[breakable]
>  	\leavevmode\refstepcounter{quickquizctrC}%
> -	\QuickQHeadingPage{QQA}{QQP}{\QuickQuizAnswerChapter.\thequickquizctrC}\\
> +	\QuickQHeadingPage{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC}\\
>  }
>  
>  \newcommand{\QuickA}[1]{%
> -	\hyperref[QQP.\QuickQuizAnswerChapter.\thequickquizctrC]{\rule{7pt}{7pt}}
> +	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\rule{7pt}{7pt}}
>  	\end{tcolorbox}
>  	\noindent\textbf{Answer:} \\ }
>  }{
> -- 
> 2.17.1
> 
> 
