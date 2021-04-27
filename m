Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=R7evQfEPJdAiYViHLCi9ATkfnAYk1UO6NVy3nMKgGTo=;
        b=DF+nMn0b6HjzzmGP4qIGK9uXzrLpHgHsmUFimqUAeshr+i57LEsuV3ty2Jnq8jwOpz
         NiU02ZgxcZss5zzCk848G6DzPmn4BYYBtI96XCqb8J3XTozK0orMlNoOOHSOpXulA8D8
         ZI+GK/EDopCbwELpcCfQzOgq9BX1xkwseuvS0QjFqXBpeemg3pyhMhFtIKOXEvCZ+KZ9
         MxiDPg9F/A7nbSJ9RF3PB0fzHVofxCAXFmLE/7FgYBMuyVzh7uCDuI1vpLxF9Uic0rf5
         C/sj+5dAc628zLh3UgqCpKFqTMw7KG0idJMTQSkMLgLsXDQIeP6c3Emis3AwBqL2Vic5
         gWZg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook v2 0/9] Add script to check period spacing
Message-ID: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
Date: Wed, 28 Apr 2021 00:18:56 +0900
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


