Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=R7evQfEPJdAiYViHLCi9ATkfnAYk1UO6NVy3nMKgGTo=;
        b=nRF9R7M1sH89th5mELRXIuKpWaSd5F/RIKy43q/VvSdVbWZdsRD+qISTYVVlMUTjwL
         vYoLYZobOwG4jNEKj3vfCf6pjCZQzM04TLBdHcqZ4Zym9Zby74dWy0+ZZ+wDeLyCaMCY
         9sevSd9AcOg35C/5qw6jfYbol+ny0dWcd/GEL0ClhoeLd47ZpZFIWrmSQF2udxXJyjoK
         QG2lUDogjS2rNY6KkOWJDzH2soOinvwzcRrCKsH1MWviIswoV0/eQQHPVFwCU64AxrnQ
         MkGeNTb9BbS04xwKvCX2izdgBPCglVVDKPgoRF2qxpZlphU2lzYs0GYESodVorM8WBmQ
         L+/w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/9] Add script to check period spacing
Message-ID: <c298d82f-dc09-6b59-2b4b-3bedd5c48cec@gmail.com>
Date: Wed, 28 Apr 2021 00:03:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set adds a set of scripts to check proper annotation
of periods to distinguish single and double spacing.

Patch 1/9 adds a couple of annotations in-development version of
the script had caught.
Patches 2/9--5/9 add and improve the set of scripts.
They are kept separate patches to show the history.
Patches 6/9--9/9 are fixes in LaTeX sources to satisfy the script.
There are quite a few sentences which end in the middle of
input lines.

After Patch 9/9 is applied, "make periodcheck" will be clean.

I'm not saying the perl script is complete.
There can still be false negatives I'm not aware of.
False positives can happen when you add new contents.

        Thanks, Akira
--
Akira Yokosawa (9):
  Annotate mid-sentence and end-of-sentence periods
  periodcheck: Add script to check missing annotation of period
  periodcheck: Add check of nbsp in front of \cite{}
  periodcheck: Improve label string matching
  periodcheck: Replace escaped percent symbol first
  treewide: Make end-of-sentence periods be at end of lines
  styleguide: Make end-of-sentence periods be at the end of lines
  treewide: Fix space in front of \cite{}
  treewide: Substitute ';' for ',' in label strings

 Makefile                             |   5 +-
 SMPdesign/SMPdesign.tex              |  36 ++--
 SMPdesign/beyond.tex                 |  15 +-
 SMPdesign/criteria.tex               |   4 +-
 SMPdesign/partexercises.tex          |  12 +-
 ack.tex                              |   2 +-
 advsync/rt.tex                       |   7 +-
 appendix/styleguide/styleguide.tex   | 237 +++++++++++++++------------
 appendix/whymb/whymemorybarriers.tex |  71 ++++----
 count/count.tex                      |  11 +-
 cpu/hwfreelunch.tex                  |   2 +-
 datastruct/datastruct.tex            |  55 ++++---
 debugging/debugging.tex              |  16 +-
 defer/defer.tex                      |   4 +-
 defer/hazptr.tex                     |   7 +-
 defer/rcuapi.tex                     |   4 +-
 defer/rcufundamental.tex             |   5 +-
 defer/refcnt.tex                     |   4 +-
 easy/easy.tex                        |   3 +-
 formal/dyntickrcu.tex                |  15 +-
 formal/ppcmem.tex                    | 184 +++++++++++----------
 formal/spinhint.tex                  | 148 +++++++++--------
 glossary.tex                         |   9 +-
 howto/howto.tex                      |   2 +-
 intro/intro.tex                      |  33 ++--
 legal.tex                            |   9 +-
 locking/locking.tex                  |   5 +-
 memorder/memorder.tex                |  12 +-
 owned/owned.tex                      |   5 +-
 together/refcnt.tex                  |   4 +-
 toolsoftrade/toolsoftrade.tex        |   9 +-
 utilities/periodcheck.pl             |  87 ++++++++++
 utilities/periodcheck.sh             |  23 +++
 33 files changed, 627 insertions(+), 418 deletions(-)
 create mode 100755 utilities/periodcheck.pl
 create mode 100755 utilities/periodcheck.sh

-- 
2.17.1


