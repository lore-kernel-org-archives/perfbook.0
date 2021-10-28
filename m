Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229887AbhJ1Ns4 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 28 Oct 2021 09:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635428789;
        bh=Rfd9FRFvFt6FkjhI4ZzKO3C7gwx5r26m84+ko7+r6xM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=mDvFbfia0K9/Usl0quIpUkLjYDpiOy7l+GcspnQXRLrYBJDwVtsKanuivCFdIQPl/
         n5VNtQNqZvSqzVm5QHBT4HQWEXBVfnFIZc8Tdb0vpehWyR5EviwtIiHrkbwC4TqC6m
         XfuRuhyhgz0k5w3jKySUL5p8tTFBJLEBLKCb3HaUY+PGui+qBEpRbNyJX4mNoM0fME
         cyPG+aARsMxcjlbuYP83l+wO3/uo/RP9W0NZI/NcmBBDbgBpXzO1Vjo65INdY4tois
         RD+ZNWkQ1MO2GKtN13JmAvKMv5SfzNHA4C9zN9Vw+y1G/AniGy7KTz/QTzIrBWkENG
         7fS9D5V+ckjrw==
Date: Thu, 28 Oct 2021 06:46:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/5] Misc tweaks of figures
Message-ID: <20211028134628.GD880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Oct 28, 2021 at 09:12:32AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set consists of minor tweaks of figures.
> 
> Patch 1/5 shrinks a couple of unnecessarily large figures.
> 
> Patches 2/5--4/5 take care of Figure 10.19 and its derivative,
> Figure E.7.
> Consistently using solid traces for resizable hash tables
> helps readers to follow the discussion.
> Patch 4/5 also adds a footnote on the upper three traces which
> look like two traces.
> 
> Patch 5/5 changes marks of "x)" to "(x)" so that they match
> how they are called out in the text.

Looks good, thank you!  Queued and pushed.

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (5):
>   Shrink Figures 9.27 and 14.3 in 2c builds
>   datastruct: Break gnuplot command line per each plot trace
>   datastruct: Use consistent dash type in Figures 10.19 and E.7
>   datastruct: Expand on the dash type of traces in Figure 10.19
>   datastruct: Change marks in Figures 10.20 and 10.21 to "(x)"
> 
>  .../data/hps.resize.2020.09.05a/perftestresize.eps | 10 +++++-----
>  .../data/hps.resize.2020.09.05a/plots-resize.sh    |  7 ++++++-
>  .../hps.resize.2020.09.27a/perftestresizebig.eps   | 10 +++++-----
>  .../data/hps.resize.2020.09.27a/plots-resize.sh    |  8 +++++++-
>  advsync/rt.tex                                     |  2 +-
>  datastruct/datastruct.tex                          | 13 ++++++++-----
>  datastruct/zipperhashgrow.svg                      | 14 +++++++-------
>  datastruct/zipperhashshrink.svg                    | 12 ++++++------
>  defer/rcuusage.tex                                 |  2 +-
>  9 files changed, 46 insertions(+), 32 deletions(-)
> 
> 
> base-commit: 333422f99c550d4ba5809525e7eeebf1a5ab16e8
> -- 
> 2.17.1
> 
