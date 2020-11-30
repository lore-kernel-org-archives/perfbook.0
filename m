Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726304AbgK3AHH (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 29 Nov 2020 19:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606694787;
        bh=6MtRi0U2CWgVL4rONiaYVHu3ZLAM5w7qdMRejkBcbes=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=dIqBxRV73QVUMAgIMpvaj39FnXaE8esuAq7uAZZlNadYYuCSB3n3jp5L+aEoR4xBl
         r7x2YUjY++8olIe0tmTqZJ+JlFDY50KBZnIQE7Zd55TJG1UUAzTfLB0PhEtmnpdFBk
         40fuZdMPYay58u2UvU4hv1C8r526cwY5g5bVMkXA=
Date: Sun, 29 Nov 2020 16:06:26 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/2] styleguide: Get rid of \VerbatimFootnotes
 macro
Message-ID: <20201130000626.GC1437@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <88c1c684-7821-abac-e61d-8c5a19fc66c8@gmail.com>
 <70ea5180-16c7-d51b-63cc-102b125c133b@gmail.com>
 <20201129165019.GB1437@paulmck-ThinkPad-P72>
 <697376ce-bc5e-0fe7-3540-9fcbb2f5792a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <697376ce-bc5e-0fe7-3540-9fcbb2f5792a@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Nov 30, 2020 at 08:19:49AM +0900, Akira Yokosawa wrote:
> On Sun, 29 Nov 2020 08:50:19 -0800, Paul E. McKenney wrote:
> > On Sun, Nov 29, 2020 at 11:33:20PM +0900, Akira Yokosawa wrote:
> >> >From b04aeebd8cb7d2ec0e5387c98011601cc4e0c270 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sun, 29 Nov 2020 17:01:24 +0900
> >> Subject: [PATCH -perfbook 2/2] styleguide: Get rid of \VerbatimFootnotes macro
> >>
> >> It turns out that this macro is not compatible with the
> >> "footnotebackref" package, which enables hyperlinks from
> >> footnotes to the corresponding footnote symbols in the text.
> >> Furthermore, it is wrong to use the macro in the middle
> >> of a book.
> >> It is supposed to be used next to \begin{document}.
> >>
> >> \VerbatimFootnote overrides the definition of \footnote{} based
> >> on the default code of standard LaTeX classes and breaks customization
> >> done by footnotebackref.
> >>
> >> In perfbook, this affects footnotes in "Answers to Quick Quizzes"
> >> and Glossary as well as those in the latter part of Style Guide.
> >>
> >> As it is not used anywhere else, remove the macro and update the
> >> footnote text accordingly.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > These are future-proofing, given no footnotes currently in the glossary
> > and beyond, correct?
> 
> There is a footnote in the description of "Cache Miss".
> Otherwise, I wouldn't have noticed the wrong count.
> 
> Looks like back matters are not supposed to have sections or footnotes.

Right you are!  Never mind!!!  ;-)

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Either way, queued and pushed!
> > 
> > 							Thanx, Paul
> > 
> >> ---
> >>  appendix/styleguide/styleguide.tex | 13 +++++++------
> >>  1 file changed, 7 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
> >> index b6b343e0..11802a85 100644
> >> --- a/appendix/styleguide/styleguide.tex
> >> +++ b/appendix/styleguide/styleguide.tex
> >> @@ -772,14 +772,15 @@ If they are escaped by a~\qco{\\},
> >>  they appear in the end result with the escape character.
> >>  The \qco{\\verb} command can be used in running text if you
> >>  need to use monospace font for a string which contains
> >> -many characters to escape.\VerbatimFootnotes\footnote{
> >> -  The \verb|\verb| command is not almighty though.
> >> +many characters to escape.\footnote{
> >> +  The \co{\\verb} command is not almighty though.
> >>    For example, you can't use it within a footnote.
> >>    If you do so, you will see a fatal \LaTeX\ error.
> >> -  The \qco{fancyvrb} package provides a workaround by
> >> -  the name of \verb|\VerbatimFootnotes| macro.
> >> -  This footnote is an example which contains a few \verb|\verb|
> >> -  commands.}
> >> +  A workaround would be a macro named \co{\\VerbatimFootnotes}
> >> +  provided by the \co{fancyvrb} package.
> >> +  Unfortunately, perfbook can't employ it due to the interference
> >> +  with the \co{footnotebackref} package.
> >> +  }
> >>  
> >>  \subsection{Cross-reference}
> >>  \label{sec:app:styleguide:Cross-Reference}
> >> -- 
> >> 2.17.1
> >>
> >>
