Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229558AbhCLCZ7 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 11 Mar 2021 21:25:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615515959;
        bh=MIolcZxHpBKHcEShuTtyZroEauV5uJxAJEYQNIFI9eM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=vBSNu5h9byq5nUInH8ks8fIRn4OSDzecBOySROml211uIoZLVBfr6rRtiTNoLRpxQ
         lg/F0TJOyBZ+wJMRvnszZfnzTycwMH5N/yFpzRBKl55TN/qoSuJxZZ0ZiCsns5X5bL
         UKbaHTl37xQzVyaE00ridAk2CPowGzSu5MWEEN8Ag4/5LXV/TQkjkrjvuuh6xGdD2L
         N0r7owj39NVMDUe2PnTA9uIcwY3M5MZxwzQJW22jXH0EhhnU/zb8LReCa8UWM+z1as
         bmvV1i2Ge/xRjdqpw5cgfTvryPtjcJUmNtnHok728IBhiYBhIYPEaaFw3TozmG8BQ1
         7Xb0FsLqH6GKA==
Date: Thu, 11 Mar 2021 18:25:58 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Minor tweaks for Edition 2
Message-ID: <20210312022558.GC2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <b4d385ab-fced-17e5-6af0-ecd0e05260fa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d385ab-fced-17e5-6af0-ecd0e05260fa@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Mar 12, 2021 at 09:03:23AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> So this is a collection of minor updates/tweaks for Edition 2.
> 
> Patch 1/9 adds an author field in a bibliography entry.
> Patch 2/9 fixes font in a epigraph.
> Patch 3/9 adjusts position of a sideways table with a typo fix.
> 
> Patches 4/9 -- 7/9 tweak float positions and line breaks mostly for
> 1c builds.  They affect 2c build as well.  If you find any undesirable
> changes in 2c builds, please let me know.  I'll give a closer look.
> 
> Patch 8/9 removes adhoc tweaks which have become irrelevant.
> Patch 9/9 restores a2ping in a recipe for ghostscript 9.53.x.
> It turned out that a2ping can cope with the up-to-date ghostscript.
> 
>         Thanks, Akira

I merged these in, thank you!

Is a second-edition release date of this weekend reasonable, or should
I hold off for another week to allow more review?

							Thanx, Paul

> --
> The following changes since commit 736cfb826271d7e25b45859cf793d4c7749d024b:
> 
>   appendix/questions: Updates and wordsmithing (2021-03-09 17:24:47 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.12a
> 
> for you to fetch changes up to c337d0756f8862f981eab9f67262d39371769dbe:
> 
>   Makefile: Restore a2ping for .tex originated .eps files (2021-03-12 08:27:17 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (9):
>       bib/syncrefs: Add author info to AndrewDBirrell1989Threads
>       defer/updates: Use \emph{} for author part in epigraph
>       defer/rcuapi: Fix position of 'RCU Wait-to-Finish APIs' table
>       Use nbsp for 1c builds
>       Use 'tbp' as option of floats
>       Add \FloatBarrier to avoid far-away floats
>       easy: Shrink and move 'Mandelbrot Set' figures
>       Remove '\noclub[1]' tweaks
>       Makefile: Restore a2ping for .tex originated .eps files
> 
>  Makefile                      |  4 +++-
>  advsync/rt.tex                |  1 +
>  appendix/toyrcu/toyrcu.tex    |  8 ++++----
>  bib/syncrefs.bib              |  1 +
>  debugging/debugging.tex       |  1 -
>  defer/rcuapi.tex              |  4 ++--
>  defer/rcufundamental.tex      | 10 +++++-----
>  defer/updates.tex             |  2 +-
>  easy/easy.tex                 | 18 +++++++++---------
>  future/future.tex             |  2 ++
>  future/tm.tex                 |  8 ++++----
>  intro/intro.tex               |  6 +++---
>  locking/locking.tex           |  1 -
>  memorder/memorder.tex         | 41 +++++++++++++++++++++--------------------
>  perfbook-lt.tex               |  3 ++-
>  toolsoftrade/toolsoftrade.tex |  4 ++--
>  16 files changed, 60 insertions(+), 54 deletions(-)
