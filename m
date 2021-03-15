Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229696AbhCOPuD (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 15 Mar 2021 11:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615823403;
        bh=Pp/7KJdSU3Pa1SqzqNZCwdcl9/0/mdhrLV+xkmS4lNY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=SN9rTQRhFa2b8TpUaa3MlXgY3Uh4xvk/E38UV6dvDfE1KJ6eo8Ikg8w0KFQi8nGLE
         LVEtyWcGpodt1JFw00biaFJT4ylSAQvqS1n6nj2VNMYHQP/v8ZqOEbbGlMconzv04/
         IWh/n4MfI/bhyC/hba3CX/nONYK1hLndto7sIH4Kev8WG3aU6x6j0leMFXiMlDX3CF
         ubW3xw/oI3MnaAFlFF9ZOOy9yM0nggghzWImVRH2LhNb4QGIUOkp8MVioR0Wkuqq+2
         KgutRkdqKVN9ha0ZsFxz85gACQ7JOk6DwGq+4uzpMBNtHozvmkQGtPYcFeh/MXSUbn
         BqgqIlGhZjYUA==
Date: Mon, 15 Mar 2021 08:50:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Minor tweaks for Edition 2, take 2
Message-ID: <20210315155002.GL2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <856323b6-91d5-62e4-d9f7-3938992ffd2f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <856323b6-91d5-62e4-d9f7-3938992ffd2f@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Mar 15, 2021 at 11:52:42PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This pull request consists of minor updates mainly adjusting placement
> of float objects.
> 
> This is becoming kind of whack-a-mole, especially we have quite a few
> build targets.  I'm not fully satisfied with the result, but it looks
> acceptable (subjective opinion!).
> 
> Notes on possibly arguable changes:
> 
> Patch 1/10 "memorder: Shrink large figures in 2c builds" shrinks
> Figures 15.14 -- 15.16 in 2c builds.
> If you find them too small, I'll adjust the resizebox parameter.
> 
> Patch 5/10 "defer: Place sub captions below sub figures in Figure 9.14"
> should improve the consistency with the figure captions the at bottom.
> 
> Patch 6/10 "advsync/rt: Adjust placement of Figures 14.12, 14.13, 14.15,
> and 14.16" is another attempt to tame floats close to end of a chapter.
> In this case, both 1c and 2c builds are affected,
> 
> The other patches should be trivial, but if you have any question,
> feel free to ask/confirm.
> 
> I have another patch which should have your SOB.
> Will submit it very soon.

Pulled and pushed, thank you!  Looking forward to your additional patch!

							Thanx, Paul

>         Thanks, Akira
> ----
> The following changes since commit 7c93464b2b0c818bc4248494644f40cff4ea444c:
> 
>   debugging: Fix typos and grammar (2021-03-14 20:02:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.15a
> 
> for you to fetch changes up to c8c8afa591ec830eb784392ceb0aedeb9ebd4d4f:
> 
>   locking: Add citation to 2nd edition of Herlihy's and Shavit's textbook (2021-03-15 23:23:02 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (10):
>       memorder: Shrink large figures in 2c builds
>       formal: Add v5.11 rcu-test data in Figure 12.4
>       formal, together: Prevent intrusion of floats into non float snippets
>       defer: Fix staccato of 'and and'
>       defer: Place sub captions below sub figures in Figure 9.14
>       advsync/rt: Adjust placement of Figures 14.12, 14.13, 14.15, and 14.16
>       advsync/rt: Move float away from section heading
>       defer: Add a couple of \FloatBarrier macros for 1c builds
>       SMPdesign: Align 'Index L' in Figure 6.7
>       locking: Add citation to 2nd edition of Herlihy's and Shavit's textbook
> 
>  SMPdesign/lockdeqhash.fig      |    2 +-
>  advsync/rt.tex                 |   79 ++-
>  defer/RCUGPorderingSummary.svg |  133 ++---
>  defer/defer.tex                |    2 +
>  defer/rcufundamental.tex       |    2 +-
>  formal/RCU-test-ratio.eps      | 1275 ++++++++++++++++++++--------------------
>  formal/data/plot.sh            |    4 +-
>  formal/data/rcu-test.dat       |    3 +-
>  formal/dyntickrcu.tex          |    4 +-
>  locking/locking.tex            |    2 +-
>  memorder/memorder.tex          |    8 +-
>  perfbook-lt.tex                |    2 +
>  together/applyrcu.tex          |    1 +
>  13 files changed, 795 insertions(+), 722 deletions(-)
