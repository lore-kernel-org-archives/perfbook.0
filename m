Return-Path: <SRS0=nUow=JS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=IqTGw2FGDw3TdyVcq6Tp9VRsQXCgVr0JaMLI7Iobvos=;
        b=uvTESMDeaV4vVp8ZFxtO3uTR1y4sSM+++4dazUJEFCOM3V8vCmUwaiBlF/mJjfxK0z
         82E6X/mGDB7JBZM9YrS8uSQM/2NcRW65rsYOYx9cxpg+Pb6/aemLXvP6AbcZerCacZ0j
         ueWopNDDBQJ5A1Dt3GwjiZzruAWj/NbBXCxfPZAW+TnqqWXqDrF/X2ZK36FgPvrg/gFU
         2ppBi9GQoFPOYRS7B4vxJ7we6rFN3OT8CqjIJ8go0t8kd2JrJojPVKHabVy7zAg1NiNC
         3qMf+M+rky/bDTHESjnqRo0Y5ABoM2mhnEC8yX8rus35zvEj/szLbCzsbbI0sau3BPu+
         mdfg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/4] index: Add index and acronym tags, take one
Message-ID: <5a17ce08-9c5d-5e87-6cae-793c6a49c147@gmail.com>
Date: Thu, 22 Apr 2021 00:25:35 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I've resumed index and acronym tagging.

Patches 1/4--3/4 are preparatory patches.

Patch 1/4 updates synctex-forward.sh to cope with new build targets.
Patch 2/4 is a minor improvement of the script to suppress unnecessary
warning messages.
Patch 3/4 resolves build error in -eb build since commit 2db0c0f61ea1
("appendix/questions: Address and remove "@@@" todo flags, take two").
Table 17.3, the merged sideways table, is not available in -eb bulld,
so reference Tables 17.1 and 17.2 instead in that case.

Patch 4/4 adds a lot of index and acronym tags.
I'm afraid there might be regressions by my fat-finger errors.
I'll fix them later if I catch something.

        Thanks, Akira
--
Akira Yokosawa (4):
  synctex-forward: Update target list
  synctex-forward: Skip database check when reverting
  questions: Reference Tables 17.1 and 17.2 instead of Table 17.3 in -eb
    build
  index: Add index and acronym tags, take one

 SMPdesign/SMPdesign.tex                   | 19 ++++++-----
 SMPdesign/beyond.tex                      |  4 +--
 SMPdesign/criteria.tex                    | 10 +++---
 SMPdesign/partexercises.tex               | 10 +++---
 advsync/advsync.tex                       | 32 +++++++++---------
 advsync/rt.tex                            |  8 ++---
 appendix/questions/after.tex              |  4 +--
 appendix/questions/concurrentparallel.tex |  2 +-
 appendix/questions/removelocking.tex      | 12 +++++--
 appendix/toyrcu/toyrcu.tex                |  8 ++---
 appendix/whymb/whymemorybarriers.tex      | 29 +++++++++-------
 count/count.tex                           | 12 +++----
 cpu/hwfreelunch.tex                       |  2 +-
 cpu/overheads.tex                         |  2 +-
 cpu/overview.tex                          |  6 ++--
 cpu/swdesign.tex                          |  2 +-
 datastruct/datastruct.tex                 |  4 +--
 debugging/debugging.tex                   |  2 +-
 defer/rcu.tex                             |  2 +-
 defer/rcufundamental.tex                  |  2 +-
 defer/rcuintro.tex                        |  4 +--
 defer/rcurelated.tex                      |  5 +--
 defer/rcuusage.tex                        |  6 ++--
 defer/seqlock.tex                         |  4 +--
 defer/whichtochoose.tex                   |  3 +-
 easy/easy.tex                             |  2 +-
 formal/dyntickrcu.tex                     |  6 ++--
 formal/spinhint.tex                       |  2 +-
 future/cpu.tex                            |  2 +-
 future/htm.tex                            | 17 +++++-----
 future/tm.tex                             | 12 +++----
 glossary.tex                              |  8 ++---
 intro/intro.tex                           | 23 ++++++-------
 locking/locking.tex                       | 40 +++++++++++------------
 memorder/memorder.tex                     | 27 +++++++--------
 perfbook-lt.tex                           |  1 +
 summary.tex                               |  4 +--
 together/seqlock.tex                      |  4 +--
 toolsoftrade/toolsoftrade.tex             | 24 +++++++-------
 utilities/synctex-forward.sh              | 16 +++++++--
 40 files changed, 207 insertions(+), 175 deletions(-)

-- 
2.17.1

