Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgCVSYQ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 22 Mar 2020 14:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584901455;
        bh=BizNgSNMlc6w6It+bMI8eEZynR8NdbZZ3ZcIRDQAAIk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=gnWcSowKv16viKWQH+sh/5MB5ofjE7TahXYbumTZjm+3MLzV0Ns/DZTByp+lr7Owz
         AaJ0cYOv5aT2+ntYzo0P8NGnHHJJof00WpMBAa2kdGVC8RbHJoW4wTuhreXQTs3gQk
         mkWBKyml1RfoXj2u3eu5etRuOvqObWIe9s2jZ8uM=
Date: Sun, 22 Mar 2020 11:24:15 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFC NOT PULL] Add experimental target 'noqq' (sans inline Quick
 Quizzes)
Message-ID: <20200322182415.GD3199@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <26b6add2-3819-dffe-38b1-d62a566e9a7b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26b6add2-3819-dffe-38b1-d62a566e9a7b@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Mar 21, 2020 at 11:24:14AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> So this in an improved "noqq" relative to qqz.2020.03.17a.
> It presents anchors to Appendix E in framed boxes.
> 
> To display essential quizzes inline, I added additional macros to be
> used in the form of:
> 
>     \EQuickQuiz{
>         quiz part
>     }\EQuickQuizAnswer{
>         answer part
>     }\EQuickQuizEnd
> 
> 
> To improve the looks of consecutive quizzes, I further added macros
> to be used for sequence of Quick Quizzes in the form of:
> 
>     \QuickQuizSeries{%
>     \QuickQuizB{
>         quiz part 1
>     }\QuickQuizAnswerB{
>         answer part 1
>     }\QuickQuizEndB
>     %
>     \QuickQuizM{
>         quiz part 2
>     }\QuickQuizAnswerM{
>         answer part 2
>     }\QuickQuizEndM
>     %
>     \QuickQuizE{
>         quiz part 3
>     }\QuickQuizAnswerE{
>         answer part 3
>     }\QuickQuizEndE
>     }                 % end of \QuickQuizSeries
> 
> As a PoC, I applied schemes above to count/count.tex.
> Does this amount of changes in .tex files look acceptable to you?
> 
> If you think they are acceptable, I'll do the changes in other consecutive
> quick quizzes.
> 
> Futher tuning of noqq's look can be done by tweaking qqz.sty. I think 
> "noqq" looks OK, though.
> 
> Any feedback is welcome!

These are now on branch qqz.2020.03.22a, which is on top of the earlier
qqz.2020.03.17a.

I do like the comma-separated list of quick-quiz IDs for the -noqq
variant, and marking a few of the quizzes as "essential" makes sense.

I believe that the churn should be fine in this case.  This does after
all at least partially address a long-standing complaint from a small
but noisy group of people.  ;-)

Should the "hb" target also put boxes around the quick quizzes?
(I freely confess to having lost track of what most of the targets do!)

							Thanx, Paul

>         Thanks, Akira
> --
> The following changes since commit 01dcc70d3f66a1224ba63dc50bbe8370d3711c1b:
> 
>   qqz.sty: Add background color to Quiz part of Quick Quizzes (2020-03-17 20:24:09 +0900)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.21a
> 
> for you to fetch changes up to 77e161e26d37453b751429799fd3c8b49cf7e0c9:
> 
>   qqz.sty: Make noqq's Appendix E look same as that of 2cqq's (2020-03-21 10:53:16 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (3):
>       Add experimental target 'noqq' (sans inline Quick Quizzes)
>       Permit consecutive QQs to appear in a framed box
>       qqz.sty: Make noqq's Appendix E look same as that of 2cqq's
> 
>  Makefile                |   5 +-
>  count/count.tex         | 270 ++++++++++++++++++++++++++----------------------
>  perfbook.tex            |   3 +
>  qqz.sty                 |  73 ++++++++++++-
>  utilities/extractqqz.sh |   8 +-
>  5 files changed, 231 insertions(+), 128 deletions(-)
