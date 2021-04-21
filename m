Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243230AbhDURn6 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 21 Apr 2021 13:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619027005;
        bh=bwmKTfO5h5HW1kHj2IQ701ANdgO0YsqBKypoeB50OxM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=iRJ1Q70nkxtT1hLf9jt7d6Xfl91pXBApMPNJgLr3HHfLHl0GSkgKS9utWaWSjpXEW
         H+F2kjrKHJVLhkIq6crpa+HbzmtHaDcxuSd+0E9IdlwrY36BJ3PZxGuKPhNX7SWrgH
         SduT8y86bkyhXEil6i5Kj/+GExnklIHSVs51D31MDGSI2Git9bnJEUOvu8K6cuory8
         ApXjtMT1S/uSSLlWhHU41MYuDQ8aS6BUfjgybD3A1GpDH6p0NtEKbu5VFPJZFkfzWa
         Cm9yRPOSfjsgF+IuNxkQNjE872f8CV6CCcXnBO/K8ddfVA8ZTuEvkbT+4UbEj3pzZi
         dirdTr9qo7WHQ==
Date: Wed, 21 Apr 2021 10:43:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/4] index: Add index and acronym tags, take one
Message-ID: <20210421174324.GW975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <5a17ce08-9c5d-5e87-6cae-793c6a49c147@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a17ce08-9c5d-5e87-6cae-793c6a49c147@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 22, 2021 at 12:25:35AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I've resumed index and acronym tagging.
> 
> Patches 1/4--3/4 are preparatory patches.
> 
> Patch 1/4 updates synctex-forward.sh to cope with new build targets.
> Patch 2/4 is a minor improvement of the script to suppress unnecessary
> warning messages.
> Patch 3/4 resolves build error in -eb build since commit 2db0c0f61ea1
> ("appendix/questions: Address and remove "@@@" todo flags, take two").
> Table 17.3, the merged sideways table, is not available in -eb bulld,
> so reference Tables 17.1 and 17.2 instead in that case.

Apologies!  I clearly need to get into the habit of "make eb".
Though I am not sure I would have gotten to a correct fix.

> Patch 4/4 adds a lot of index and acronym tags.
> I'm afraid there might be regressions by my fat-finger errors.
> I'll fix them later if I catch something.

I didn't see anything glaring, but my "make it make sense" filter is
not helpful in spotting such things.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (4):
>   synctex-forward: Update target list
>   synctex-forward: Skip database check when reverting
>   questions: Reference Tables 17.1 and 17.2 instead of Table 17.3 in -eb
>     build
>   index: Add index and acronym tags, take one
> 
>  SMPdesign/SMPdesign.tex                   | 19 ++++++-----
>  SMPdesign/beyond.tex                      |  4 +--
>  SMPdesign/criteria.tex                    | 10 +++---
>  SMPdesign/partexercises.tex               | 10 +++---
>  advsync/advsync.tex                       | 32 +++++++++---------
>  advsync/rt.tex                            |  8 ++---
>  appendix/questions/after.tex              |  4 +--
>  appendix/questions/concurrentparallel.tex |  2 +-
>  appendix/questions/removelocking.tex      | 12 +++++--
>  appendix/toyrcu/toyrcu.tex                |  8 ++---
>  appendix/whymb/whymemorybarriers.tex      | 29 +++++++++-------
>  count/count.tex                           | 12 +++----
>  cpu/hwfreelunch.tex                       |  2 +-
>  cpu/overheads.tex                         |  2 +-
>  cpu/overview.tex                          |  6 ++--
>  cpu/swdesign.tex                          |  2 +-
>  datastruct/datastruct.tex                 |  4 +--
>  debugging/debugging.tex                   |  2 +-
>  defer/rcu.tex                             |  2 +-
>  defer/rcufundamental.tex                  |  2 +-
>  defer/rcuintro.tex                        |  4 +--
>  defer/rcurelated.tex                      |  5 +--
>  defer/rcuusage.tex                        |  6 ++--
>  defer/seqlock.tex                         |  4 +--
>  defer/whichtochoose.tex                   |  3 +-
>  easy/easy.tex                             |  2 +-
>  formal/dyntickrcu.tex                     |  6 ++--
>  formal/spinhint.tex                       |  2 +-
>  future/cpu.tex                            |  2 +-
>  future/htm.tex                            | 17 +++++-----
>  future/tm.tex                             | 12 +++----
>  glossary.tex                              |  8 ++---
>  intro/intro.tex                           | 23 ++++++-------
>  locking/locking.tex                       | 40 +++++++++++------------
>  memorder/memorder.tex                     | 27 +++++++--------
>  perfbook-lt.tex                           |  1 +
>  summary.tex                               |  4 +--
>  together/seqlock.tex                      |  4 +--
>  toolsoftrade/toolsoftrade.tex             | 24 +++++++-------
>  utilities/synctex-forward.sh              | 16 +++++++--
>  40 files changed, 207 insertions(+), 175 deletions(-)
> 
> -- 
> 2.17.1
> 
