Return-Path: <SRS0=NRmw=IN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=YitVxr+wzO9cgcwShH4Ek8NbVgbpgr0s5TSepUSZJXk=;
        b=jvvX+URQYjLEVEvZ50QMbwAd2VBJ2MLRNKepLlqsgEu32984MIlVzRMoR4tcTNYFor
         yPCDxLgPjAig+EQ0V6VkT4m0mRxB0fh6m4/yw2RrVDjmMQMcJs+l6RR17RJv9NA3CNg3
         MFHig9/5AogefNyDq1tiogq3DPmK8K9eGR/TRk9nG5S3QLy/+tu/iwJUrQs18EZANhWq
         +jyL53l4GCkpy+5LhO7D025QcZLgLB9on5i5p0Ln+1oSCFXsj2F733GTs+8bbRMEIubg
         vrxPlQUpYNE+goYcQ6XhVkGkkAmLpiKedSpoGOvYAei/AbLsiiJAIiZs7OfGti6ezjWW
         HXng==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL -perfbook] Minor tweaks for Edition 2, take 2
Message-ID: <856323b6-91d5-62e4-d9f7-3938992ffd2f@gmail.com>
Date: Mon, 15 Mar 2021 23:52:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This pull request consists of minor updates mainly adjusting placement
of float objects.

This is becoming kind of whack-a-mole, especially we have quite a few
build targets.  I'm not fully satisfied with the result, but it looks
acceptable (subjective opinion!).

Notes on possibly arguable changes:

Patch 1/10 "memorder: Shrink large figures in 2c builds" shrinks
Figures 15.14 -- 15.16 in 2c builds.
If you find them too small, I'll adjust the resizebox parameter.

Patch 5/10 "defer: Place sub captions below sub figures in Figure 9.14"
should improve the consistency with the figure captions the at bottom.

Patch 6/10 "advsync/rt: Adjust placement of Figures 14.12, 14.13, 14.15,
and 14.16" is another attempt to tame floats close to end of a chapter.
In this case, both 1c and 2c builds are affected,

The other patches should be trivial, but if you have any question,
feel free to ask/confirm.

I have another patch which should have your SOB.
Will submit it very soon.

        Thanks, Akira
----
The following changes since commit 7c93464b2b0c818bc4248494644f40cff4ea444c:

  debugging: Fix typos and grammar (2021-03-14 20:02:41 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.15a

for you to fetch changes up to c8c8afa591ec830eb784392ceb0aedeb9ebd4d4f:

  locking: Add citation to 2nd edition of Herlihy's and Shavit's textbook (2021-03-15 23:23:02 +0900)

----------------------------------------------------------------
Akira Yokosawa (10):
      memorder: Shrink large figures in 2c builds
      formal: Add v5.11 rcu-test data in Figure 12.4
      formal, together: Prevent intrusion of floats into non float snippets
      defer: Fix staccato of 'and and'
      defer: Place sub captions below sub figures in Figure 9.14
      advsync/rt: Adjust placement of Figures 14.12, 14.13, 14.15, and 14.16
      advsync/rt: Move float away from section heading
      defer: Add a couple of \FloatBarrier macros for 1c builds
      SMPdesign: Align 'Index L' in Figure 6.7
      locking: Add citation to 2nd edition of Herlihy's and Shavit's textbook

 SMPdesign/lockdeqhash.fig      |    2 +-
 advsync/rt.tex                 |   79 ++-
 defer/RCUGPorderingSummary.svg |  133 ++---
 defer/defer.tex                |    2 +
 defer/rcufundamental.tex       |    2 +-
 formal/RCU-test-ratio.eps      | 1275 ++++++++++++++++++++--------------------
 formal/data/plot.sh            |    4 +-
 formal/data/rcu-test.dat       |    3 +-
 formal/dyntickrcu.tex          |    4 +-
 locking/locking.tex            |    2 +-
 memorder/memorder.tex          |    8 +-
 perfbook-lt.tex                |    2 +
 together/applyrcu.tex          |    1 +
 13 files changed, 795 insertions(+), 722 deletions(-)
