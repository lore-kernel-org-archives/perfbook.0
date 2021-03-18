Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230365AbhCRR6g (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 18 Mar 2021 13:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616090315;
        bh=cMOHRnSOMcDEnAAXxBTDhR6SGnMQY82TLqkYaFLJ7T4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=mAc7Yu2wahK3X4NxxaSLKcraB6J6Mrs7Qy2TzU4FGaqoG6Ga4D69ZOhlJ+BENRkeH
         kZH3xhgvW9jQ7bIYRF/BwSz0qLwJP9oTwmge6MjfeRLRPf4amv6eKUD6TXQvV/yzy7
         lIVF+4ao+rksEfFRSrMyoh0URKHkI1bftChI5PXrA5YCm/bAuCAmR5OXR0dSYmztda
         7qIALJFTWIBPnp3PGCXMhB9GYC2+vzGvYIB3Jlq8WaX2d2iIjTEfI0pOPMCN2Oh4cT
         gKZkoaGcEZ2pPXj3pjD9whXmmMwaGoDr+3BOCi9hVhQcvLOni8ZuEbdWd3tDzC/c0+
         LTJ76ep4VCDaw==
Date: Thu, 18 Mar 2021 10:58:35 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Minor tweaks and styleguide update for
 Edition 2, take 4
Message-ID: <20210318175835.GG2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <1bab2519-02be-a38c-0d20-ac40567c084e@gmail.com>
 <095ffc25-da49-7742-b7b9-8772ff1899e9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <095ffc25-da49-7742-b7b9-8772ff1899e9@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Mar 18, 2021 at 10:46:18PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I added a section on full stop spacing example in styleguide.
> There were a couple of typo fixes in memorder.
> 
> This is relative to the earlier pull request of take 3.
> 
> Typo fixes are intentionally divided as individual commits.

I pulled in the whole stack, thank you!  We overlapped on only one typo.  ;-)

I updated the style guide to explicitly call out which full-stop
hints work.  You may wish to update to pick a preferred method for the
"Mr. Smith" example.  I expect that it will take quite some time for me
to form the habit of typing either of the three, but maybe checking for
this can be scripted?

							Thanx, Paul

>         Thanks, Akra
> 
> --------
> The following changes since commit 194bd0a454fc3ca2e6d50c39c248e35fd24ff61a:
> 
>   datastruct: Remove redundant line (2021-03-18 10:01:20 +0900)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.18d
> 
> for you to fetch changes up to a70d76c76d8e3b4338f813da9ddfb8fa880a653c:
> 
>   memorder: Fix usage of \pageref{} (2021-03-18 22:14:28 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (6):
>       styleguide: Use \Cref{} at start of sentence
>       sytleguide: Add a section on full stop
>       memorder: Fix typo
>       memorder: Fix typo
>       memorder: Fix typo
>       memorder: Fix usage of \pageref{}
> 
>  appendix/styleguide/styleguide.tex | 83 ++++++++++++++++++++++++++++++++------
>  memorder/memorder.tex              |  8 ++--
>  2 files changed, 75 insertions(+), 16 deletions(-)
> 
