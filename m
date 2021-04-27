Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230091AbhD0PwK (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 27 Apr 2021 11:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619538686;
        bh=Hb4hed8EpQSy9M5nJaEjIR3LE1xT27sUFJ9lLQW5LHw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=WGvNwRBbqQ8M7dVjjTW7a573I0+yK9p3Mq4SgczRqWUxLoGLSJdYgCbb1ounY9SBb
         sOeG3ctCl6UxFSezGwAtNvpDmYes90r0WLcY1j2B9IaMb5yhzqx3+9nmDT4qRWcoE1
         RNnAlrG7CccVyjXtGr8atB84sEDXqgZ3Ezn+qbiULqiEosFhCx7bHrb4HA7zybw8ww
         m+OIPlvQ6ci/3BrvnqgsNFB1Pvr3ephJgGbBcIwhnXZDALbT0mPwgcUANcjN8dgPWO
         al5wNiOvsiNPM6T3LIet+uWwu6bZfRPuRTtG176bWlwcZfq0oUK3SBro+oq8wxZ2rL
         EyBL8dtl+90RQ==
Date: Tue, 27 Apr 2021 08:51:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook v2 0/9] Add script to check period spacing
Message-ID: <20210427155126.GI975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Apr 28, 2021 at 12:18:56AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set adds a set of scripts to check proper annotation
> of periods to distinguish single and double spacing.
> 
> Patch 1/9 adds a couple of annotations in-development version of
> the script had caught.
> Patches 2/9--5/9 add and improve the set of scripts.
> They are kept separate patches to show the history.
> Patches 6/9--9/9 are fixes in LaTeX sources to satisfy the script.
> There are quite a few sentences which end in the middle of
> input lines.
> 
> After Patch 9/9 is applied, "make periodcheck" will be clean.
> 
> I'm not saying the perl script is complete.
> There can still be false negatives I'm not aware of.
> False positives can happen when you add new contents.

Queued and pushed, thank you!

Would it make sense at some point to have "make periodcheck" happen
automatically during a normal build to catch addition of issues with
new content?

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (9):
>   Annotate mid-sentence and end-of-sentence periods
>   periodcheck: Add script to check missing annotation of period
>   periodcheck: Add check of nbsp in front of \cite{}
>   periodcheck: Improve label string matching
>   periodcheck: Replace escaped percent symbol first
>   treewide: Make end-of-sentence periods be at end of lines
>   styleguide: Make end-of-sentence periods be at the end of lines
>   treewide: Fix space in front of \cite{}
>   treewide: Substitute ';' for ',' in label strings
> 
>  Makefile                             |   5 +-
>  SMPdesign/SMPdesign.tex              |  36 ++--
>  SMPdesign/beyond.tex                 |  15 +-
>  SMPdesign/criteria.tex               |   4 +-
>  SMPdesign/partexercises.tex          |  12 +-
>  ack.tex                              |   2 +-
>  advsync/rt.tex                       |   7 +-
>  appendix/styleguide/styleguide.tex   | 237 +++++++++++++++------------
>  appendix/whymb/whymemorybarriers.tex |  71 ++++----
>  count/count.tex                      |  11 +-
>  cpu/hwfreelunch.tex                  |   2 +-
>  datastruct/datastruct.tex            |  55 ++++---
>  debugging/debugging.tex              |  16 +-
>  defer/defer.tex                      |   4 +-
>  defer/hazptr.tex                     |   7 +-
>  defer/rcuapi.tex                     |   4 +-
>  defer/rcufundamental.tex             |   5 +-
>  defer/refcnt.tex                     |   4 +-
>  easy/easy.tex                        |   3 +-
>  formal/dyntickrcu.tex                |  15 +-
>  formal/ppcmem.tex                    | 184 +++++++++++----------
>  formal/spinhint.tex                  | 148 +++++++++--------
>  glossary.tex                         |   9 +-
>  howto/howto.tex                      |   2 +-
>  intro/intro.tex                      |  33 ++--
>  legal.tex                            |   9 +-
>  locking/locking.tex                  |   5 +-
>  memorder/memorder.tex                |  12 +-
>  owned/owned.tex                      |   5 +-
>  together/refcnt.tex                  |   4 +-
>  toolsoftrade/toolsoftrade.tex        |   9 +-
>  utilities/periodcheck.pl             |  87 ++++++++++
>  utilities/periodcheck.sh             |  23 +++
>  33 files changed, 627 insertions(+), 418 deletions(-)
>  create mode 100755 utilities/periodcheck.pl
>  create mode 100755 utilities/periodcheck.sh
> 
> -- 
> 2.17.1
> 
> 
