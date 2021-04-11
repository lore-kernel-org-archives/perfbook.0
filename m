Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233822AbhDKRng (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 11 Apr 2021 13:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618163000;
        bh=JVYcOBqsep5PCuEDECdeS3RrbZ2oUFFpSm2TA58dejE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=AND/GOFEwggc09dZa0BkDQgyEuibFQDfiZgPDIi3pYqGmkKqXQqhrB/f5aLqphdD4
         XRMRnxWfxfV8NzVR6TRp+88chZUI00P+QJTlP7sB5JKpJ7ciF8xzm3+M+X4B4flYwD
         xwiqCW4dlZMBRk+k5vV5jPGYUQK7VAHcKLmvLKJaUw5l143Ox73WKdhxmJdNbJUm5R
         7W+Zugm/jvaQp0Js1FQzOWpzfn7bNlYg1K41nSZNIw1vIZ8Yo2io4wQxEGAFC0m6Dc
         O0IusK1+UUQGwffFPBVOfllYwJ2n7nCb1qA1C0TVxHIWfHWlgN+2BlVc95PpOxRDrY
         2vD1zR8ZJEXQA==
Date: Sun, 11 Apr 2021 10:43:20 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Shrink large floats for ebook-size build
Message-ID: <20210411174320.GC4510@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <670bbced-9396-34c3-2a6d-cbb93c5d25f0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670bbced-9396-34c3-2a6d-cbb93c5d25f0@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org

On Sun, Apr 11, 2021 at 07:50:45PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> So, this pull request consists of changes for ebook-size build.
> This is sent as a pull request as the diff size becomes large.
> 
> Note that as I don't see the latest patch pushed to master,
> this is relative to an older commit.
> I don't think any merge conflict is likely.
> 
> Patch 1/3 does the shrinking.
> As Table 17.3 would be hard to read when shrunk, it is simply
> omitted in the -eb build. Having Tables 17.1 and 17.2 should
> suffice.
> 
> Patch 2/3 removes [tb], [tbp], and [tbhp] options from almost all
> of float environments.
> "listing" environment's default is also changed to [tbp] to match
> those of the other float environments.
> Consistently employing the same option with "p" allows the TeX
> engine more freedom to emit float-only pages and should decrease
> the chance of over-loaded floats flushed at the end of a chapter.
> 
> This affects all the build targets and slightly increases the total
> page counts, but I think float positions can be tweaked later.
> 
> Patch 2/3 also has some float definitions move away from top
> of sections
> 
> Patch 3/3 moves another couple of float definitions.
> 
> Now "make eb" can complete without any error.

Greatly improved, thank you!!!

Queued and pushed, which also pushed the one I pulled a couple of days
back and forgot to push.  (And please accept my apologies!)

							Thanx, Paul

>         Thanks, Akira
> 
> -----------
> The following changes since commit 85109c2ea025e35fbe76e308e7540ccc211633d4:
> 
>   defer: Use standard font in RCUListInsertClassic.svg (2021-04-08 17:58:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-ebook-2021.04.11a
> 
> for you to fetch changes up to 11e82be105247bf9006f46241b15428c7253c32d:
> 
>   debugging, memorder: Move float away from section heading (2021-04-11 18:36:17 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (3):
>       treewide: Shrink floats for ebook-size build
>       treewide: Remove explicit float positioning options
>       debugging, memorder: Move float away from section heading
> 
>  SMPdesign/SMPdesign.tex                         |  56 ++++----
>  SMPdesign/beyond.tex                            |  32 ++---
>  SMPdesign/partexercises.tex                     |  32 +++--
>  advsync/advsync.tex                             |   4 +-
>  advsync/rcu.tex                                 |  12 +-
>  advsync/rt.tex                                  |  56 +++++---
>  appendix/questions/after.tex                    |  12 +-
>  appendix/questions/time.tex                     |   2 +-
>  appendix/styleguide/samplecodesnippetfcv.tex    |   2 +-
>  appendix/styleguide/samplecodesnippetfig.tex    |   2 +-
>  appendix/styleguide/samplecodesnippetlst.tex    |   2 +-
>  appendix/styleguide/samplecodesnippetlstlbl.tex |   2 +-
>  appendix/styleguide/styleguide.tex              |  36 ++---
>  appendix/toyrcu/toyrcu.tex                      |  40 +++---
>  appendix/whymb/whymemorybarriers.tex            |  16 +--
>  count/count.tex                                 |  64 ++++-----
>  cpu/hwfreelunch.tex                             |   2 +-
>  cpu/overheads.tex                               |   4 +-
>  cpu/overview.tex                                |  18 +--
>  datastruct/datastruct.tex                       |  76 +++++-----
>  debugging/debugging.tex                         |  30 ++--
>  defer/defer.tex                                 |   4 +-
>  defer/hazptr.tex                                |  12 +-
>  defer/rcuapi.tex                                |  18 +--
>  defer/rcufundamental.tex                        |  18 ++-
>  defer/rcuintro.tex                              |  10 +-
>  defer/rcuusage.tex                              |  46 +++---
>  defer/refcnt.tex                                |   8 +-
>  defer/seqlock.tex                               |  14 +-
>  defer/whichtochoose.tex                         |   4 +
>  easy/easy.tex                                   |   4 +-
>  formal/axiomatic.tex                            |  16 +--
>  formal/dyntickrcu.tex                           |  14 +-
>  formal/formal.tex                               |   8 +-
>  formal/ppcmem.tex                               |   8 +-
>  formal/sat.tex                                  |   2 +-
>  formal/spinhint.tex                             |  43 +++---
>  formal/stateless.tex                            |   2 +-
>  future/HTMtable.tex                             |   4 +-
>  future/HTMtableRCU.tex                          |   5 +-
>  future/cpu.tex                                  |  16 +--
>  future/formalregress.tex                        |   8 +-
>  future/htm.tex                                  |   4 +-
>  future/tm.tex                                   |   8 +-
>  howto/howto.tex                                 |   4 +-
>  intro/intro.tex                                 |  12 +-
>  locking/locking-existence.tex                   |   4 +-
>  locking/locking.tex                             |  34 ++---
>  memorder/memorder.tex                           | 177 +++++++++++++-----------
>  perfbook-lt.tex                                 |   2 +-
>  together/applyrcu.tex                           |  14 +-
>  together/refcnt.tex                             |  10 +-
>  toolsoftrade/toolsoftrade.tex                   |  64 ++++-----
>  53 files changed, 576 insertions(+), 521 deletions(-)
