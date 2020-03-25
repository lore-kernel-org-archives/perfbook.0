Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:32790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727773AbgCYQRS (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 25 Mar 2020 12:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585153037;
        bh=ULOcr5SJGsGiWYjyabt31CEfVYRq4y0tcxlI6BQpORQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=R26RqRWo0SDfSkcZ3grt8Bm6tPspmFyRKr1+U/QZhFewFXe1uPWka0Vv3DbZyl0og
         XbURdF/eN7iyprL2loIOJXqHcwMsz1jRJS5+JkiYqukxlCQeT+rM78boWaBMv9OjmP
         qPE02tQJrjdRXo7ygmf/SVoHeTjbDsa6XM4O4R60=
Date: Wed, 25 Mar 2020 09:17:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFC NOT PULL] Add experimental target 'noqq' (sans inline Quick
 Quizzes)
Message-ID: <20200325161716.GR19865@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <26b6add2-3819-dffe-38b1-d62a566e9a7b@gmail.com>
 <20200322182415.GD3199@paulmck-ThinkPad-P72>
 <1524bbf2-460c-7020-79b1-8ddfcfd830cf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524bbf2-460c-7020-79b1-8ddfcfd830cf@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Mar 26, 2020 at 12:19:56AM +0900, Akira Yokosawa wrote:
> On Sun, 22 Mar 2020 11:24:15 -0700, Paul E. McKenney wrote:
> > On Sat, Mar 21, 2020 at 11:24:14AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> So this in an improved "noqq" relative to qqz.2020.03.17a.
> >> It presents anchors to Appendix E in framed boxes.
> >>
> >> To display essential quizzes inline, I added additional macros to be
> >> used in the form of:
> >>
> >>     \EQuickQuiz{
> >>         quiz part
> >>     }\EQuickQuizAnswer{
> >>         answer part
> >>     }\EQuickQuizEnd
> >>
> >>
> >> To improve the looks of consecutive quizzes, I further added macros
> >> to be used for sequence of Quick Quizzes in the form of:
> >>
> >>     \QuickQuizSeries{%
> >>     \QuickQuizB{
> >>         quiz part 1
> >>     }\QuickQuizAnswerB{
> >>         answer part 1
> >>     }\QuickQuizEndB
> >>     %
> >>     \QuickQuizM{
> >>         quiz part 2
> >>     }\QuickQuizAnswerM{
> >>         answer part 2
> >>     }\QuickQuizEndM
> >>     %
> >>     \QuickQuizE{
> >>         quiz part 3
> >>     }\QuickQuizAnswerE{
> >>         answer part 3
> >>     }\QuickQuizEndE
> >>     }                 % end of \QuickQuizSeries
> >>
> >> As a PoC, I applied schemes above to count/count.tex.
> >> Does this amount of changes in .tex files look acceptable to you?
> >>
> >> If you think they are acceptable, I'll do the changes in other consecutive
> >> quick quizzes.
> >>
> >> Futher tuning of noqq's look can be done by tweaking qqz.sty. I think 
> >> "noqq" looks OK, though.
> >>
> >> Any feedback is welcome!
> > 
> > These are now on branch qqz.2020.03.22a, which is on top of the earlier
> > qqz.2020.03.17a.
> > 
> > I do like the comma-separated list of quick-quiz IDs for the -noqq
> > variant, and marking a few of the quizzes as "essential" makes sense.
> > 
> > I believe that the churn should be fine in this case.  This does after
> > all at least partially address a long-standing complaint from a small
> > but noisy group of people.  ;-)
> > 
> > Should the "hb" target also put boxes around the quick quizzes?
> > (I freely confess to having lost track of what most of the targets do!)
> 
> Prompted by this question, I was looking into the -hb build.
> It turned out that the change made in commit 648af1774e3a ("Stop using
> modified book.cls") I submitted back in April 2018 broke the -hb build
> in that pdflatex generates PDF having page size of normal letterpaper.
> 
> It looks like the letterpaperhb option needs to be in the modified
> book.cls file.
> As there was no complaint regarding this regression, I guess nobody
> cares -hb build.

The only time I might have used it was when creating the hardbound
version of the first edition.

> And I'm wondering how the -hb build is supposed to work.
> 
> Do you choose paper of 10.75in x 8.25in in printing -hb PDF?
> Or do you use normal letterpaper and cut edges by 0.25in afterwords?

I will know (hopefully) in a few months, once I have the remaining
scalability results regenerated.  It might well be different this time,
depending on what formatting options are available from whichever online
printing service.

So I might be asking for your assistance at that point, in the all too
likely event that I cannot figure it out on my own.  ;-)

 
							Thanx, Paul

> >>         Thanks, Akira
> >> --
> >> The following changes since commit 01dcc70d3f66a1224ba63dc50bbe8370d3711c1b:
> >>
> >>   qqz.sty: Add background color to Quiz part of Quick Quizzes (2020-03-17 20:24:09 +0900)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.21a
> >>
> >> for you to fetch changes up to 77e161e26d37453b751429799fd3c8b49cf7e0c9:
> >>
> >>   qqz.sty: Make noqq's Appendix E look same as that of 2cqq's (2020-03-21 10:53:16 +0900)
> >>
> >> ----------------------------------------------------------------
> >> Akira Yokosawa (3):
> >>       Add experimental target 'noqq' (sans inline Quick Quizzes)
> >>       Permit consecutive QQs to appear in a framed box
> >>       qqz.sty: Make noqq's Appendix E look same as that of 2cqq's
> >>
> >>  Makefile                |   5 +-
> >>  count/count.tex         | 270 ++++++++++++++++++++++++++----------------------
> >>  perfbook.tex            |   3 +
> >>  qqz.sty                 |  73 ++++++++++++-
> >>  utilities/extractqqz.sh |   8 +-
> >>  5 files changed, 231 insertions(+), 128 deletions(-)
