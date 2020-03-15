Return-Path: <SRS0=VxP2=5A=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=WE+bqzGwHI4qNR6eGkF3lFPhvJWTiJfrw2GwhUrEzGo=;
        b=gvvvRpiYg4PnJub6FsAIyA2H1E+XTCQdNLe+xCLx9gQKTunCSK9J/7CQeNAvxLpWc3
         xLLE1FssWsQuVhvtG5H8/Ba0NClYqHY6K7iJ/WeaMPSa+nXHs+5hC1Bx0PERw21JBRaR
         FxTD81z6s8/KJY7/4ONnG3tt9TvF2of7ePSI2DjEH81wTGYeivNek9AfegXXwamOY2Tk
         icFqw3QcrPQ7ZZU41WilwXESmXBqPqyNCKfZ/arb4fgfhlpE1NVoWNR2rUGMs0uk8225
         uRNL8oT+gFDdeGoa+RehAUXn+BGB8ReA4/466B5kLdXaH8fYNvp5YtyQVRP1gdOiBGY3
         nPUA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC NOT PULL] Experiment to add background to question part of QQZ
Message-ID: <1bca91e5-b192-85db-2035-6e524ee1cb57@gmail.com>
Date: Sun, 15 Mar 2020 09:40:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I have been experimenting to make question part of QQZ stand out.
At the moment, official targets are not affected by the change.
You can see the new look by building targets "msnt" and "1csf".

Another added target "noqq" is an experiment to remove inline questions.
Anchors to the QQAs in Appendix E are presented at the right side of
the column.

To make noqq to work, I need to change the \QuickQuiz{} macro format
so that the question part is enclosed in "{ ... }".

Please give them a try and share your thoughts.

        Thanks, Akira
--
The following changes since commit c811727b76356d53dff7614d3361353527953dd1:

  legal: Add a statement of the obvious (2020-03-14 14:20:11 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.15a

for you to fetch changes up to c5b74e161c4e1e6e5009f95c8e96cc34d906fe14:

  defer/seqlock: Move figure env next to 1st paragraph (2020-03-15 08:51:18 +0900)

----------------------------------------------------------------
Akira Yokosawa (6):
      treewide: Renew format of Quick Quiz macro
      howto: Update Answer to QQZ 1.3 to mention inline QQA is not possible
      Add experimental target 'noqq' (sans inline Quick Quizzes)
      EXP qqz.sty: Add background color to Quiz part of Quick Quizzes
      intro: Use 'VerbatimU' env for command output
      defer/seqlock: Move figure env next to 1st paragraph

 Makefile                                  |   8 +-
 SMPdesign/SMPdesign.tex                   |  42 ++--
 SMPdesign/criteria.tex                    |   6 +-
 SMPdesign/partexercises.tex               |  72 +++---
 advsync/rcu.tex                           |  24 +-
 advsync/rt.tex                            |  60 ++---
 appendix/questions/after.tex              |  12 +-
 appendix/questions/concurrentparallel.tex |  12 +-
 appendix/questions/ordering.tex           |   6 +-
 appendix/toyrcu/toyrcu.tex                | 162 ++++++-------
 appendix/whymb/whymemorybarriers.tex      |  84 +++----
 count/count.tex                           | 384 +++++++++++++++---------------
 cpu/cpu.tex                               |   6 +-
 cpu/hwfreelunch.tex                       |   6 +-
 cpu/overheads.tex                         |  31 +--
 cpu/overview.tex                          |  12 +-
 cpu/swdesign.tex                          |  12 +-
 datastruct/datastruct.tex                 |  84 +++----
 debugging/debugging.tex                   | 152 ++++++------
 defer/hazptr.tex                          |  42 ++--
 defer/rcuapi.tex                          |  54 ++---
 defer/rcuexercises.tex                    |  12 +-
 defer/rcufundamental.tex                  |  36 +--
 defer/rcuintro.tex                        |  42 ++--
 defer/rcurelated.tex                      |   6 +-
 defer/rcuusage.tex                        |  78 +++---
 defer/refcnt.tex                          |  30 +--
 defer/seqlock.tex                         |  62 ++---
 defer/whichtochoose.tex                   |  18 +-
 easy/easy.tex                             |  18 +-
 formal/axiomatic.tex                      |  36 +--
 formal/dyntickrcu.tex                     |  90 +++----
 formal/formal.tex                         |  12 +-
 formal/ppcmem.tex                         |  30 +--
 formal/spinhint.tex                       |  48 ++--
 future/formalregress.tex                  |  42 ++--
 future/htm.tex                            |  54 ++---
 future/tm.tex                             |   6 +-
 howto/howto.tex                           |  30 ++-
 intro/intro.tex                           |  94 ++++----
 locking/locking-existence.tex             |  18 +-
 locking/locking.tex                       | 156 ++++++------
 memorder/memorder.tex                     | 246 +++++++++----------
 owned/owned.tex                           |  42 ++--
 perfbook.tex                              |   8 +
 qqz.sty                                   |  53 ++++-
 together/applyrcu.tex                     |  30 +--
 together/hash.tex                         |   6 +-
 together/refcnt.tex                       |  42 ++--
 toolsoftrade/toolsoftrade.tex             | 210 ++++++++--------
 utilities/extractqqz.sh                   |   8 +-
 51 files changed, 1449 insertions(+), 1385 deletions(-)
