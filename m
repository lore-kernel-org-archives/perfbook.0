Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230340AbhB0TWh (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 27 Feb 2021 14:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614453715;
        bh=4XIFGIPYcV2ZbSroEkZ1Qn64wObSdkGwLP0RfVygYRg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=EcvpsXlyq7YohQV4BTKyVdCWgD+VRuDGYS4BAZNUm7oWiAi/dY8UQT/lTxcAs9S4m
         cDPHLcDwJGw3zLD4FmBVF8hVwgfuVAOfGsZ9ePnkv59i7/Q3V8wCS4wJkBGOPr4BJF
         YQpzmipdl4PEZMsRhDjFOjnFdhGAdwd8xCmtRIBKXOwyWjRSxDS2Hrj8L7av9mL3Yq
         hD0vPDeLTvPBfnJyA2lvTY327fV7b7I+CoCHG8dttxfpeh2mCq0GZnLS7bjmJ9Fqqx
         TYwqBL9Ur01p3f8R0H20Ni0BkzZ/VP6qrS0a1ejc5OlQg8mdLJLM2xMqC6DBlKgglE
         cB1VKQRfswvEA==
Date: Sat, 27 Feb 2021 11:21:55 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Bibliography and misc updates
Message-ID: <20210227192155.GB2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <bfd15fb4-7f4f-13d9-ac84-47b8a907c8c5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfd15fb4-7f4f-13d9-ac84-47b8a907c8c5@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Feb 27, 2021 at 10:26:07AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This pull request consists of updates in bibliography and other minor
> tweaks.
> 
> Patch 1/10 is a trivial typo fix.
> Patch 2/10 is another attempt to improve looks of performance plots
> in datastruct.
> Patch 3/10 moves floating snippets to prevent section headings from
> being orphaned.
> Patch 4/10 fixes spacing after full stops (.).
> Patch 5/10 contains quite a few URL and other updates. Some of the
> broken links are salvaged, other links are marked as broken.
> One of the notable broken links is the Dr. Dobbs journal.
> I tried to salvage it and found an archive site at
> https://www.drdobbs.com/, but have not figured out the way to reach
> the "Effective concurrency" series.
> Patches 6/10 to 10/10 are updates and fixes in citation side.
> 
> I'm afraid most commits lack explanations in their change logs.
> If you'd prefer more verbose change logs, I'm willing to respin. 

Given the amount of work you did rechecking all of those bibliography
entries, I cannot bring myself to ask for commit-log changes.
Queued and pushed, thank you very much!

							Thanx, Paul

>         Thanks, Akira
> 
> --
> The following changes since commit 2060b54a52ffaaea818807f7e602a168d46c4d50:
> 
>   advsync: Add LIFO Push and pointer zap (2021-02-23 21:11:55 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.02.27b
> 
> for you to fetch changes up to e51fe38dbbb582f001f8a9b8566e2f388a874898:
> 
>   Update citations to 'Hennessy & Patterson (2021-02-27 09:59:39 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (10):
>       defer/rcuusage: Add missing preposition
>       datastruct: Use consistent dashtype for performance plot
>       advsync: Move floating code snippet away from section heading
>       treewide: Adjust spacing after full stops
>       bib: url/doi updates
>       Use newer/updated bibliography entries
>       bib/os: Substitute marc.info for marc.theaimsgroup.com
>       bib/RCU: Add url to US patents of www.google.com/patents
>       locking: Replace bibliography entry to avoid duplicates
>       Update citations to 'Hennessy & Patterson
> 
>  .../hash/data/hps.perf.2020.11.26a/README          | 10 ++++
>  .../hash/data/hps.perf.2020.11.26a/perftest.eps    | 12 ++--
>  .../hash/data/hps.perf.2020.11.26a/perftestlin.eps | 11 ++--
>  .../hash/data/hps.perf.2020.11.26a/plots.sh        | 36 ++++++------
>  .../data/hps.perf.2020.11.26a/zoocatall-unsync.eps | 12 ++--
>  .../hash/data/hps.perf.2020.11.26a/zoocatall.eps   | 11 ++--
>  .../data/hps.perf.2020.11.26a/zoocatalllin.eps     |  9 +--
>  .../hash/data/hps.perf.2020.11.26a/zoocatonly.eps  | 11 ++--
>  .../data/hps.perf.2020.11.26a/zoocatonlylin.eps    |  7 ++-
>  .../data/hps.perf.2020.11.26a/zoocpu-unsync.eps    | 13 +++--
>  .../data/hps.perf.2020.11.26a/zoocpu-unsynclin.eps | 10 ++--
>  .../hash/data/hps.perf.2020.11.26a/zoocpu.eps      | 11 ++--
>  .../data/hps.perf.2020.11.26a/zoocpubktlin.eps     |  5 +-
>  .../data/hps.perf.2020.11.26a/zoocpubktlin8.eps    |  6 +-
>  .../data/hps.perf.2020.11.26a/zoocpubktsizelin.eps |  4 +-
>  .../hash/data/hps.perf.2020.11.26a/zoocpulin.eps   |  8 +--
>  .../data/hps.perf.2020.11.26a/zoocpulinqsbr.eps    | 10 ++--
>  .../hps.perf.2020.11.26a/zoocpulinqsbrunsync.eps   | 11 ++--
>  .../hash/data/hps.perf.2020.11.26a/zooupdate.eps   |  5 +-
>  .../hash/data/hps.perf.2020.11.26a/zooupdatelu.eps |  5 +-
>  .../data/hps.perf.2020.11.26a/zooupdatelulin.eps   |  5 +-
>  SMPdesign/partexercises.tex                        |  2 +-
>  advsync/advsync.tex                                | 44 +++++++-------
>  appendix/styleguide/styleguide.tex                 |  8 +--
>  appendix/whymb/whymemorybarriers.tex               |  2 +-
>  bib/RCU.bib                                        | 49 +++++++++-------
>  bib/TM.bib                                         | 18 +++---
>  bib/WFS.bib                                        | 13 ++++-
>  bib/hw.bib                                         | 67 +++++++++++++---------
>  bib/maze.bib                                       |  6 +-
>  bib/os.bib                                         | 64 +++++++++++----------
>  bib/perfmeas.bib                                   |  1 +
>  bib/realtime.bib                                   |  8 +--
>  bib/refs.bib                                       |  3 +
>  bib/search.bib                                     |  1 +
>  bib/swtools.bib                                    |  7 ++-
>  bib/syncrefs.bib                                   | 45 ++++++++++-----
>  cpu/cpu.tex                                        |  2 +-
>  cpu/overview.tex                                   |  2 +-
>  defer/rcurelated.tex                               |  4 +-
>  defer/rcuusage.tex                                 |  2 +-
>  defer/whichtochoose.tex                            |  2 +-
>  future/tm.tex                                      |  2 +-
>  howto/howto.tex                                    |  4 +-
>  locking/locking.tex                                |  4 +-
>  memorder/memorder.tex                              |  2 +-
>  owned/owned.tex                                    |  2 +-
>  47 files changed, 329 insertions(+), 247 deletions(-)
