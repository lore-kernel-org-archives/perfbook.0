Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230218AbhCSTVg (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 19 Mar 2021 15:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616181696;
        bh=gjN14P3el0e+OJ1yZd0Ls9VO9Er1iG9joLGW7Pqx00o=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=aeH6XuujjZEZ3ioWhx7PRsgDg5w4F58l+kzAG7Tnl11I82EL+qjtV8RfXwIh5j4FW
         aLnQJl57h7+wI+MnWo8wYrvfsv8glEZJYjtDfSvSU5pIG/jzS70ge+n8jIcV2xZPSm
         dRnZQdwyLp6modqLwELjiW/hxww2WlDZtqeUrL2XnNcgmeHrr6d+BRXHci/3tTHkM3
         dRhwYoAZncad05ejT0d72/wCoM2zQ40qSUjrkT5onRosQLHXUZ+uVKmLYAT9LEovCQ
         IIyLhBz2LjecliqT1+8xeDRPuXztPUlxPN8UTgqPRVRR6w52hBDg9SC5FuR7H3L18S
         zA4nWQhpZn85A==
Date: Fri, 19 Mar 2021 12:21:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Minor fixes and update for Edition 2, take 5
Message-ID: <20210319192136.GP2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <6e94b800-3cc0-3837-6fc7-4d330dad45d2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e94b800-3cc0-3837-6fc7-4d330dad45d2@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Mar 20, 2021 at 12:01:45AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Today's pull request consists of minor typo fixes and an update only.
> 
> However, I'm not sure if Patches 6/7 and 7/7 are really the right fixes
> or not.
> So please have a closer look at them.

They look good, thank you!  I have pulled this series and pushed it out.

>         Thanks, Akira
> 
> (Please find a PS. part at the bottom.)
> 
> ---------------
> The following changes since commit 82599ee517da15ce3957bc94b82f8702a2357d14:
> 
>   memorder: Fix typos and grammar, take two (2021-03-18 17:29:17 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.19a
> 
> for you to fetch changes up to 0b1692098fb87a4c1d5f2fec9c078ee4462aac85:
> 
>   advsync: Use Oxford comma (2021-03-19 22:19:10 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (7):
>       memorder: Fix staccato of 'another'
>       count: Fix typo
>       count: Move ',' to proper position
>       toolsoftrade: Fix typo
>       toolstotrade: Use path of atomic_t.txt under Linux-kernel source tree
>       advsync: Fix typo
>       advsync: Use Oxford comma
> 
>  advsync/advsync.tex           | 4 ++--
>  count/count.tex               | 6 +++---
>  memorder/memorder.tex         | 2 +-
>  toolsoftrade/toolsoftrade.tex | 8 +++++---
>  4 files changed, 11 insertions(+), 9 deletions(-)
> 
> ---------------------
> PS.
> 
> Looking at the Glossaries, I thought entries of "Concurrent"
> and "Parallel" were missing.
> 
> And you use these words almost interchangeably.
> 
> (In-)distinction of them is the topic of Appendix A.2.
> 
> So maybe it might help readers to put a footnote near the first use
> of "parallel" telling that in this book, parallel and concurrent are
> used as synonyms, and cite Appendix A.2.
> 
> To make this point even clearer, adding entries like
> 
>   Concurrent: In this book, synonym of parallel.
> 
>   Parallel: In this book, synonym of concurrent.
> 
> in the Glossaries might help readers.
> 
> Thoughts?

Like this?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/glossary.tex b/glossary.tex
index da54482..c6c9c62 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -145,6 +145,12 @@
 \item[Communication Miss:]\index{Communication miss}
 	A cache miss incurred because some other CPU has written to
 	the cache line since the last time this CPU accessed it.
+\item[Concurrent:]\index{Concurrent}
+	In this book, a synonym of parallel.
+	Please see \cref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
+	on \cpageref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
+	for a discussion of the recent distinction between these two
+	terms.
 \item[Critical Section:]\index{Critical section}
 	A section of code guarded by some synchronization mechanism,
 	so that its execution constrained by that primitive.
@@ -348,6 +354,12 @@
 	directly to the work that must be accomplished.
 	For example, lock acquisition and release is normally considered
 	to be overhead, and specifically to be synchronization overhead.
+\item[Parallel:]\index{Parallel}
+	In this book, a synonym of concurrent.
+	Please see \cref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
+	on \cpageref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
+	for a discussion of the recent distinction between these two
+	terms.
 \item[Performance:]\index{Performance}
 	Rate at which work is done, expressed as work per unit time.
 	If this work is fully serialized, then the performance will
