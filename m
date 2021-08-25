Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231602AbhHYRnk (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 25 Aug 2021 13:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629913374;
        bh=ZiN7WNH7MSaNRD0g0ab+zhygkz7643bLugRF83634f4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=oS6Y7P0mLOt0n29wrS+0qrF3ccVx0QSo0hxELfQnTCMvHyiuA2D8C1qXrNqgR6jvT
         ZZvXODtcN+IOK5dvO6kEj1soMTk9SoLcPRsZ2pb14EpF95eOYsuv+QJzyUCl7SMi4t
         LFoMuK0sybZqjHWYLlcyd8i6ns7SDac1r7eOLcdZ7szGpMNPrPIxyn4wWEW9Y+vbtg
         tdSVi7HNgdE6tRROgRoBJL26c+04sluFv0bPGs3zUC6DZO6Gk7cbWq131Scb1mgwwT
         /e3lfe0Rokpkzb8Ewh+dSNchfukK2m7UFhgGokeqSPzDCk1xGVTdMG/kT4HW6vDh/4
         kJCCd2IjQKj4Q==
Date: Wed, 25 Aug 2021 10:42:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/5] End-of-sentence punctuation after
 "Appendix X"
Message-ID: <20210825174254.GL4156@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Aug 25, 2021 at 06:34:50PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> There remain a few places where end-of-sentence periods are followed
> by single spaces.
> 
> Patch 1/5 is a follow-up of QQA expansion in datastruct, unrelated
> to end-of-sentence punctuation marks.
> Patch 2/5 fixes wrong spaces after "Appendix X.".
> Patch 3/5 updates periodcheck.pl so that punctuation marks after
> end-of-sentence "Appendix X" can be caught.
> Patch 4/5 modifies the label string of Appendix E so that the
> script updated in Patch 3/5 can recognize it.
> Patch 5/5 fixes a typo I came across while preparing this patch
> set.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (5):
>   datastruct: Reference Figure 10.11 to clarify discussion flow
>   treewide: Annotate end-of-sentence periods after 'Appendix X'
>   punctcheck.pl: Add regex to catch punctuation marks after 'Appendix X'
>   Adjust label of Appendix E 'Answers to Quick Quizzes'
>   appendix/questions: Fix typo of missing ')'
> 
>  ack.tex                          |  2 +-
>  appendix/questions/questions.tex |  2 +-
>  cpu/overheads.tex                |  2 +-
>  cpu/overview.tex                 |  2 +-
>  datastruct/datastruct.tex        |  5 +++--
>  defer/rcuintro.tex               |  2 +-
>  howto/howto.tex                  | 12 ++++++------
>  qqz.sty                          |  2 +-
>  utilities/punctcheck.pl          |  3 ++-
>  9 files changed, 17 insertions(+), 15 deletions(-)
> 
> -- 
> 2.17.1
> 
