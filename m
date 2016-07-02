Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=uTN55Bc/ZFJvpv+RrISH0Qgtw+wki0EtdBPmFTzV7fw=;
 b=cmJ2a9LvbZNWfVBkNo40ASeIFTiCQAMAROaaqJllYJAzH8NcHYWriRRhrAgCNgcyRf
 cSqx2RyEz5hRu07I7ys08goGHGsv/pk13H7uYXNHHWt6CYdrjUoOmAAxTqEsteve2+LE
 cfJL4cy9OUWEDkYxas4557cpGpGQ34X8b8y/s2FrX1tTiMiV8ni3blvfo9PZxBwoIQv2
 UpM65VDCnoJxTgSxnd72n9esWwPN0aa01BLpbwyxQoyikpP9aXkwqUbAtkbW86aE5v5x
 SOw5HvbJKcaQ7a42WHpZaGbrp0cM5jgfA5zv01VNj+nY1R9FlETLPUzqV7/OoBljZ2h9
 V4fA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL] Cosmetic fixes part 2 and typo fixes
Message-ID: <014c725d-2252-5892-ab4c-1621d89e2768@gmail.com>
Date: Sat, 2 Jul 2016 20:26:31 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Here is part 2 of cosmetic fixes.
Most commits do the same changes I did in the previous patch series.
I also did some typo fixes in the last 3 commits.
Most of them are trivial fixes, but there may be some wrong ones.
Please review them with skeptical eyes.

                                             Thanks, Akira

---
The following changes since commit 91ac20e1ab95767f1e33b84aee474d0cd38cc748:

   hlist_for_each_entry_rcu() now has only three arguments (2016-07-01 13:31:02 -0700)

are available in the git repository at:

   https://github.com/akiyks/perfbook.git cosmetic-fixes-and-typo-fixes

for you to fetch changes up to 644ca3567d857cf2059f5820d30d4fd472f142c8:

   howto: Miscellaneous fixes (2016-07-02 20:08:43 +0900)

----------------------------------------------------------------
Akira Yokosawa (24):
       locking: Centering figures of verbatim code examples
       locking: Use \path command for path names
       defer: Centering figures of verbatim code examples
       defer: Tweak font size of Figure 9.5
       defer: Align left margins of Figurs 9.28, 9.29 and 9.30
       defer: Use \path command for path names
       Use \co{} properly to give room for line-breaks
       datastruct: Centering figures of verbatim code examples
       datastruct: Fix indent of Figure 'Alignment for 64-Byte Cache Lines'
       datastruct: Use \path command for path names
       debugging: Centering figures of verbatim code examples
       debugging: Use \path command for path names
       debugging: Enclose shell command example in \co{} macro
       formal: Centering figures of verbatim code examples
       formal: Use \path command for path names
       together: Centering figures of verbatim code examples
       advsync: Centering figures of verbatim code examples
       advsync: Add \centering in some tables
       advsync: Use \path command for path names
       rt: Centering figures of verbatim code examples
       rt: Use \path{} for path names
       rt: Consistently use 'real-time' as adjective
       rt & advsync: Typo fixes
       howto: Miscellaneous fixes

  SMPdesign/SMPdesign.tex              |   4 +-
  advsync/advsync.tex                  |  10 +-
  advsync/memorybarriers.tex           |  34 ++++---
  advsync/rcu.tex                      |  38 +++----
  appendix/primitives/primitives.tex   |   8 +-
  appendix/rcuimpl/srcu.tex            |  38 +++----
  appendix/whymb/whymemorybarriers.tex | 102 +++++++++----------
  datastruct/datastruct.tex            | 132 +++++++++++++++----------
  debugging/debugging.tex              |  24 +++--
  defer/hazptr.tex                     |   8 +-
  defer/rcuapi.tex                     |  20 ++--
  defer/rcuexercises.tex               |   2 +-
  defer/rcufundamental.tex             |  60 ++++++-----
  defer/rcuusage.tex                   |  56 ++++++-----
  defer/refcnt.tex                     |  34 ++++---
  defer/seqlock.tex                    |  26 +++--
  defer/toyrcu.tex                     | 186 +++++++++++++++++++++--------------
  formal/axiomatic.tex                 |  18 ++--
  formal/dyntickrcu.tex                |  88 ++++++++++-------
  formal/ppcmem.tex                    |  32 +++---
  formal/sat.tex                       |   2 +-
  formal/spinhint.tex                  | 142 +++++++++++++++-----------
  howto/howto.tex                      |  16 +--
  locking/locking-existence.tex        |  16 +--
  locking/locking.tex                  |  66 ++++++++-----
  rt/rt.tex                            |  76 +++++++-------
  together/applyrcu.tex                |  48 +++++----
  27 files changed, 750 insertions(+), 536 deletions(-)

