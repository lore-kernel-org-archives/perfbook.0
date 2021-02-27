Return-Path: <SRS0=KeOd=H5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=xCciV/+qm6RYBv2vu9UihC31LBUwJsBcvVzSfSLAkD8=;
        b=pGhJRT4ECs15KyjHSc2HbXL13lm8TH22puS9AL4q4IEbIQDlDlxJ4ZL0WO7U9m8cLH
         gHHadbY/D/yqoYhMRQYdaGQamWEuDPBtlk9tDzENMTmKQaBZma8Fb2s1k7JkpdVB17ml
         6MvGl8UyJ9JOoptIHmU7kaUSqSCSfy2Tc1gBzZNf4ukwLuhVDn3TZcel8tsKHMyrpYe+
         hMMk2BAclCEgg+e6iwf5Y13/OWMxncs2YsnjnNpKbGQl38MLNBmKrrxOdinKBgF8/mt5
         nMgLuf5YOq9wgES70Z+pMaYS+3Wb10qPLPTyGujZZliakvakY4YgggfmabBkH05dytOd
         IL/Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL -perfbook] Bibliography and misc updates
Message-ID: <bfd15fb4-7f4f-13d9-ac84-47b8a907c8c5@gmail.com>
Date: Sat, 27 Feb 2021 10:26:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This pull request consists of updates in bibliography and other minor
tweaks.

Patch 1/10 is a trivial typo fix.
Patch 2/10 is another attempt to improve looks of performance plots
in datastruct.
Patch 3/10 moves floating snippets to prevent section headings from
being orphaned.
Patch 4/10 fixes spacing after full stops (.).
Patch 5/10 contains quite a few URL and other updates. Some of the
broken links are salvaged, other links are marked as broken.
One of the notable broken links is the Dr. Dobbs journal.
I tried to salvage it and found an archive site at
https://www.drdobbs.com/, but have not figured out the way to reach
the "Effective concurrency" series.
Patches 6/10 to 10/10 are updates and fixes in citation side.

I'm afraid most commits lack explanations in their change logs.
If you'd prefer more verbose change logs, I'm willing to respin. 

        Thanks, Akira

--
The following changes since commit 2060b54a52ffaaea818807f7e602a168d46c4d50:

  advsync: Add LIFO Push and pointer zap (2021-02-23 21:11:55 -0800)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2021.02.27b

for you to fetch changes up to e51fe38dbbb582f001f8a9b8566e2f388a874898:

  Update citations to 'Hennessy & Patterson (2021-02-27 09:59:39 +0900)

----------------------------------------------------------------
Akira Yokosawa (10):
      defer/rcuusage: Add missing preposition
      datastruct: Use consistent dashtype for performance plot
      advsync: Move floating code snippet away from section heading
      treewide: Adjust spacing after full stops
      bib: url/doi updates
      Use newer/updated bibliography entries
      bib/os: Substitute marc.info for marc.theaimsgroup.com
      bib/RCU: Add url to US patents of www.google.com/patents
      locking: Replace bibliography entry to avoid duplicates
      Update citations to 'Hennessy & Patterson

 .../hash/data/hps.perf.2020.11.26a/README          | 10 ++++
 .../hash/data/hps.perf.2020.11.26a/perftest.eps    | 12 ++--
 .../hash/data/hps.perf.2020.11.26a/perftestlin.eps | 11 ++--
 .../hash/data/hps.perf.2020.11.26a/plots.sh        | 36 ++++++------
 .../data/hps.perf.2020.11.26a/zoocatall-unsync.eps | 12 ++--
 .../hash/data/hps.perf.2020.11.26a/zoocatall.eps   | 11 ++--
 .../data/hps.perf.2020.11.26a/zoocatalllin.eps     |  9 +--
 .../hash/data/hps.perf.2020.11.26a/zoocatonly.eps  | 11 ++--
 .../data/hps.perf.2020.11.26a/zoocatonlylin.eps    |  7 ++-
 .../data/hps.perf.2020.11.26a/zoocpu-unsync.eps    | 13 +++--
 .../data/hps.perf.2020.11.26a/zoocpu-unsynclin.eps | 10 ++--
 .../hash/data/hps.perf.2020.11.26a/zoocpu.eps      | 11 ++--
 .../data/hps.perf.2020.11.26a/zoocpubktlin.eps     |  5 +-
 .../data/hps.perf.2020.11.26a/zoocpubktlin8.eps    |  6 +-
 .../data/hps.perf.2020.11.26a/zoocpubktsizelin.eps |  4 +-
 .../hash/data/hps.perf.2020.11.26a/zoocpulin.eps   |  8 +--
 .../data/hps.perf.2020.11.26a/zoocpulinqsbr.eps    | 10 ++--
 .../hps.perf.2020.11.26a/zoocpulinqsbrunsync.eps   | 11 ++--
 .../hash/data/hps.perf.2020.11.26a/zooupdate.eps   |  5 +-
 .../hash/data/hps.perf.2020.11.26a/zooupdatelu.eps |  5 +-
 .../data/hps.perf.2020.11.26a/zooupdatelulin.eps   |  5 +-
 SMPdesign/partexercises.tex                        |  2 +-
 advsync/advsync.tex                                | 44 +++++++-------
 appendix/styleguide/styleguide.tex                 |  8 +--
 appendix/whymb/whymemorybarriers.tex               |  2 +-
 bib/RCU.bib                                        | 49 +++++++++-------
 bib/TM.bib                                         | 18 +++---
 bib/WFS.bib                                        | 13 ++++-
 bib/hw.bib                                         | 67 +++++++++++++---------
 bib/maze.bib                                       |  6 +-
 bib/os.bib                                         | 64 +++++++++++----------
 bib/perfmeas.bib                                   |  1 +
 bib/realtime.bib                                   |  8 +--
 bib/refs.bib                                       |  3 +
 bib/search.bib                                     |  1 +
 bib/swtools.bib                                    |  7 ++-
 bib/syncrefs.bib                                   | 45 ++++++++++-----
 cpu/cpu.tex                                        |  2 +-
 cpu/overview.tex                                   |  2 +-
 defer/rcurelated.tex                               |  4 +-
 defer/rcuusage.tex                                 |  2 +-
 defer/whichtochoose.tex                            |  2 +-
 future/tm.tex                                      |  2 +-
 howto/howto.tex                                    |  4 +-
 locking/locking.tex                                |  4 +-
 memorder/memorder.tex                              |  2 +-
 owned/owned.tex                                    |  2 +-
 47 files changed, 329 insertions(+), 247 deletions(-)
