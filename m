Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350752AbhDNRbr (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 14 Apr 2021 13:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618421483;
        bh=zzPICaTpQ1Sk2h3Wvok2aAlAC/U2322pOdd0EcIKkdc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=NjiSZwe7ju8JrRKFyXNBL22+0r86CNqeq8bXjX/0TRlsnAV4UJt6rdOefh8lLTPQl
         suO+esX5sOQOCVGbXOQFBEVXS3mXIgskcqf47jRzeAMShQa0OdUB/+7nk830J4g2ak
         z2/zyPAozrQrEpDNGjZlLeUdGUyQ1/8+TfezNQJD7ymRYn1ozn8wbmr77K4epHwesE
         xeJK5EFLgtvxJYJQZlrBZVtjkjGt8eAUO8iQkmF5PC1NlrgmmPeKeQ2c2L3HJ+A9cK
         AWjJCBBq+zuETJXyDEKGJGWDAQT6uex7OsJiorlQhc/iMhtw+bQNPRf9ZH2PMuytsd
         8n4FHfpU4RPfQ==
Date: Wed, 14 Apr 2021 10:31:23 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/5] Updates of qqz.sty
Message-ID: <20210414173123.GR4510@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Apr 14, 2021 at 07:47:51PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> A change in upstream hyperref package (v7.00j) breaks code in
> qqz.sty.
> Now, \refstepcounter in vertical mode can cause a page break.
> Our use of \refstepcounter in framed Quick Quiz is in vertical
> mode and if a page break happens at that point, destination point
> set by \refstepcounter is discarded by tcolorbox, which results in
> a missing destination.
> 
> This can be fixed by leaving vertical mode in front of \refstepcounter,
> which is what Patch 1/5 does.
> 
> The updated code is compatible with older versions of hyperref as
> long as our usage patterns are concerned.
> Aa a bonus, new link-target positions look nicer (not too close to the
> "Quick Quiz" labels).
> 
> Patches 2/5--4/5 are (in my opinion) improvements to the -nq build.
> Seeing both Quizzes and Answers in the final section, one would
> just see the answer without taking time to think about a quiz.
> So these patches modify the -nq build so that chapter-wise sections
> have only the quiz parts.
> Answers are presented in Appendix E in the same way as the other
> builds.
> 
> Patch 5/5 adds page references in the answers of non-nq builds.

Good points, queued and pushed, thank you!

On interesting thing is that if you click on the small bubble in the
text, you are taken to the corresponding QQ at the end of that chapter.
If you click on the square, you are taken to the answer.  If you click
on the page number in the square in the upper right-hand corner of the
QQ question, you get taken back to the original small bubble, all of
which is goodness.

However, if you click on the either black square at the end of the
question or the white shadowed square at the end of the answer, you get
taken back to the small bubble in the text.

Is it possible that some of our readers will expect that these two squares
will instead take them back to the question at the end of the chapter?

This is probably not a big deal, given that clicking on the small bubble
will take them to that list, but I figured that it was worth asking
the question.

							Thanx, Paul

>         Thanks, Akira
> 
> --
> Akira Yokosawa (5):
>   qqz.sty: Use \refstepcounter after leaving vmode in tcolorbox
>   qqz.sty: Modify -nq build to have chapterwise quiz-only section
>   perfbook-lt.tex: Remove boolean qqzchpend
>   howto, Makefile: Update answer to Quick Quiz 1.3 and 'make help-full'
>   qqz.sty: Add page reference to QQA Appendix as the same as -nq build
> 
>  Makefile               |   5 +-
>  advsync/rt.tex         |  18 -------
>  howto/howto.tex        |  17 +-----
>  perfbook-lt.tex        |   3 --
>  qqz.sty                | 118 ++++++++++++++++++++++++-----------------
>  utilities/divideqqz.pl |  25 ++++++++-
>  6 files changed, 97 insertions(+), 89 deletions(-)
> 
> -- 
> 2.17.1
> 
