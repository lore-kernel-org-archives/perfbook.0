Return-Path: <SRS0=+sYI=LD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=NODVNVfXJSRbEPXc0cWVBrfquSK02kpU3INIzr7nrt8=;
        b=ks+CM6VxbKLgmv8b7+GgD6wt527x2FBGZD1VjICTBkzPL9J5IcU9yrG8EWD4SbsSNZ
         bsoChyUMWpgufrQ6wUcY1vmduJHoAMVo9FxbucGemMA+TlkDopP+YNXVUcZFbr2mAwOg
         lqLaCP3gKpMXaY9TMIkd3Wmgrp3kYYkxHXfoWV7+0ihoga9TEHOROkRxj3n2RP4+zLDG
         alSBVRxrwp9NnLTGMXtmosuo0GB/XCzRvnrB/XSLpvlWVapKbWJEHYRbiX7rhdDxxQUX
         mFYwdGr0DydD6IbGq70HGgANv4zWbGLjT8QxoMp4Y1z/I9iABV7nyUNukgYEHODTVK4D
         BOYw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL -perfbook] Add checks with regard to punctuation marks
Message-ID: <70a41d88-1892-3937-3af5-d3db3657d74c@gmail.com>
Date: Wed, 9 Jun 2021 11:59:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

It took a while for me to sort out the spacing width after punctuation
marks.

Previous updates took care of mid-sentence and end-of-sentence
periods.
It turns out that we need to care other punctuation marks in the
same way.  My experiment shows that "!", "?", and ":" behaves in the
same way as ".".

For cleverefcheck to work, we need to make sure end-of-sentence
punctuation marks be at the end of input lines, so periodcheck.pl
now treats "!" and "?" in the same way as ".".

cleverefcheck now checks sentences starting with lower-case words
as well as \cref{} and its variants.

It also checks indents by white spaces now.

All the offending patterns in LaTeX sources have fixed.

Finally "make" will run both periodcheck and cleverefcheck.

As for colons, I'm not sure what is your preference with regard
to capitalization of the next words and the spacing width after
them, so no check is done at the moment.
 
If you have some preference, I can update the scripts to enforce
it.

        Thanks, Akira
--
The following changes since commit a20cf5ebd8605d93bb35876a26907fe294278eb8:

  defer: Fix lack of rcu_register_thread() in singleton_reader() (2021-06-08 14:58:10 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2021.06.09a

for you to fetch changes up to f70493ae24172bb73ce4a0560d4c1f958baedd51:

  styleguide: Adjust cleveref macro usage where possible (2021-06-09 11:28:50 +0900)

----------------------------------------------------------------
Akira Yokosawa (11):
      cleverefcheck: Add check of sentences starting with lower-case words
      periodcheck: Check question and exclamation marks as well
      formal/dyntickrcu: Fix unintended paragraph break
      memorder: Move float snippet away of QQA heading
      treewide: Annotate punctuation marks
      treewide: Make end-of-sentence punctuation marks be at end-of-line
      debugging: Move period out of double quotes
      cleverefcheck: Add check of indent by white spaces
      treewide: Fix indents by white spaces
      Makefile: Auto run cleverefcheck on 'make'
      styleguide: Adjust cleveref macro usage where possible

 Makefile                             |  2 ++
 SMPdesign/partexercises.tex          |  3 +-
 advsync/rt.tex                       |  6 ++--
 appendix/styleguide/styleguide.tex   | 23 +++++++-------
 appendix/toyrcu/toyrcu.tex           |  4 +--
 appendix/whymb/whymemorybarriers.tex |  2 +-
 count/count.tex                      |  6 ++--
 cpu/overheads.tex                    |  2 +-
 datastruct/datastruct.tex            |  2 +-
 debugging/debugging.tex              | 44 ++++++++++++++------------
 defer/defer.tex                      |  2 +-
 defer/rcuapi.tex                     |  4 +--
 defer/rcurelated.tex                 |  2 +-
 defer/rcuusage.tex                   |  2 +-
 defer/whichtochoose.tex              |  2 +-
 easy/easy.tex                        |  3 +-
 formal/dyntickrcu.tex                |  2 +-
 formal/ppcmem.tex                    |  2 +-
 formal/spinhint.tex                  | 12 +++----
 locking/locking.tex                  |  4 +--
 memorder/memorder.tex                | 20 ++++++------
 together/refcnt.tex                  |  2 +-
 toolsoftrade/toolsoftrade.tex        |  9 +++---
 utilities/cleverefcheck.pl           | 61 ++++++++++++++++++++++++++----------
 utilities/cleverefcheck.sh           |  1 +
 utilities/periodcheck.pl             | 28 ++++++++++++-----
 26 files changed, 150 insertions(+), 100 deletions(-)
