Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=Pv4vEbyRzT8db4N/Bwu3lPpFyCZU2KmCYnkKQOFsEPg=;
 b=ewOA1HBvnOkZDz592RPv9sLC387cYRBbT2DalYFJcoF9UhyNl36cIK+rBz0+dhZB3W
 ZYh0K7qUMmj/5I1OX2mbArbe8ykbhNHJoB6gQdR5aSl4ITOw10NlzMXCqRrSReSe85Xm
 i15ub0YhEQeQ75vLmj52M8kCoMMnJFUoXqKDX9UF6qOp5tDCm/a/BMmwV2eiTXC/z0EV
 yt5Mp+CdpbbQeUKdtM+kdHrDxRA3BOTKX3+leMYrhIaR3xGRXtc7B4BBiOZO8WlRUarJ
 jQe8r4xbghB9cDDumasqry5yilnmJ/CmpGem9m7vHTk2gLdyt+5phJ2SEq4F1rM/NQ6a
 6Zrg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/6] fix trivial problems in advanced synchronization chapter
Date: Sat,  2 Apr 2016 09:28:25 +0900
Message-Id: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: dhowells@redhat.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset fixes trivial problems in `Advanced Synchronization` chapter that
found while translation.

SeongJae Park (6):
  advsync: fix trivial typos
  advsync: fix latex syntax related typos
  advsync: use latex reference feature consistently
  advsync: fix wrong code example
  advsync: fix critical section bleed-in description
  advsync: fix wrong reference to section ``MMIO write barrier''

 advsync/advsync.tex        |  8 ++++----
 advsync/memorybarriers.tex | 51 ++++++++++++++++++++++++----------------------
 2 files changed, 31 insertions(+), 28 deletions(-)

-- 
1.9.1

