Return-Path: <SRS0=6f8h=AU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682809315; x=1685401315;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioDoNK49hYEAZDBR1ORfKqwTgPGUMVgsC8drbIVej/s=;
        b=sntRzqSFNPaEuy+k9tjNUHWraoMsRelAkmYKysH337YVKBFzdnNrVvxdYkNN3xQg0M
         7wAS98OZyskzCwdwq2cA99g/oSf2AJ4/C0p3/CKiODV+vOUrPKQXz16VYU9nzeHUR24s
         +wAUwy8Ui6khTsEFbPcASsIMGEOoIgatb59A1crq/ku9qfACWB548KwrOxpGbkKSjwp4
         AKRDf+HOyrXEPbz9JK6n/cJZbYGGTbEu4tMs4HBP/hl4LBFvxl8HzGHpxfCL61GxM9ri
         gkNTppe1izKSIRAuPKlwCQm2f9KNUVRNYCEC3WD6hd6gOkgSV7za8g//f7Bd2Z9Wkwmo
         DfXQ==
Message-ID: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
Date: Sun, 30 Apr 2023 08:01:51 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/7] Collection of minor fixes and updates
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: SeongJae Park <sj38.park@gmail.com>, Alan Huang <mmpgouride@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set is a collection of minor fixups I have made
during your traveling.

Patches #1 and #2 are fixups to the \qco{} changes by SJ.

Patch #3 adds a couple of acronym entries.

Patches #4 and #5 follow up code changes made by Alan.

Patch #6 tweaks width params for TOC pages.

Patch #7 fixes a false positive check in precheck.sh WRT the
date command.

        Thanks, Akira

--
Akira Yokosawa (7):
  formal/spinhint: Don't use \qco{} for long message
  formal/ppcmem: Use \qco{} as intended
  Add acronyms of LKMM and KCSAN
  CodeSamples/count: Adjust coding style
  count: Adjust scaling factor of Listing 5.18
  Tweak TOC width params
  precheck.sh: Export LC_TIME

 CodeSamples/count/count_lim.c           |  5 +++--
 CodeSamples/count/count_lim_atomic.c    |  5 +++--
 CodeSamples/count/count_lim_sig.c       | 23 +++++++++++------------
 CodeSamples/count/count_stat_eventual.c |  3 +--
 CodeSamples/count/count_tstat.c         |  3 ++-
 count/count.tex                         |  7 +++----
 debugging/debugging.tex                 |  2 +-
 formal/axiomatic.tex                    |  4 ++--
 formal/ppcmem.tex                       |  2 +-
 formal/spinhint.tex                     |  2 +-
 glsdict.tex                             |  2 ++
 memorder/memorder.tex                   |  9 ++++-----
 perfbook-lt.tex                         | 21 +++++++++++++++++++--
 utilities/precheck.sh                   |  2 +-
 14 files changed, 54 insertions(+), 36 deletions(-)


base-commit: 90a7f29b4961b8d58e2bf1ee6a64c97bb74ee926
-- 
2.25.1

