Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=+SUcND3lhZ0M+2Qnwf+Z1r14KYP3Bv5FfOUB3bOWHYg=;
 b=nOgsoSsPJujbaMecJddFnCBN5vPOwA8QjAWpLcguDkFeFqA+LZLFpr8h4k6BIeFryc
 /If7HXWwniZSSOF+eHmVAwPE8ivcDLfNhlxbgw2LGaYZ4HUit2eCMpqK4LVoj++nR3aK
 B1CVn+eX7tFwCbUPC3/cI3qijs18db3D38nh09/nWIhvO0fc1HvIc+Tv0Q2Rbr7dxfLt
 uN49tBW0mYcvhoraIDFopry3Q4ql7V22ZBghRaTJJ/P5zgvShGFtNikVmPVfz04Iub4u
 RjSS7q0xp83ZXEBn+j1AWL9dCQqZ9dbm/vFfglbspt9oY8iUhKfIcPacCojZN/6yfq00
 QxyA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC PATH 0/6] Indent tweaks after chapter title and epigraph
Message-ID: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
Date: Mon, 19 Sep 2016 12:00:09 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 85e0ec292cb75cad1ef71812fee11ed44ecc4ce8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 19 Sep 2016 11:07:31 +0900
Subject: [RFC PATH 0/6] Indent tweaks after chapter title and epigraph

Hi Paul,

After commit a9fe7df2efbc ("treewide: Enclose 'verbbox' within
'figure'"), inconsistency of indent of first paragraph of a chapter
became more disturbing (maybe just for me).

I noticed "book.cls" is already localized in the repository, and
found a possible fix of the behavior of chapter heading in twocolumn
layout there.

As for epigraph, there are two ways to make the following paragraph
not to indent.
One is to patch the "\epigraph" command to put "afterheading-ness"
at the end of the command.
The other is to use "\epigraphhead" and place the epigraph at
the header area of a page.

My preference is to place epigraphs at he right hand side of the
page even in twocolumn layout. The effect of using "epigraphhead"
command is not identical to what I wanted, but the result seems
better than what I had first anticipated.

So, I chose the latter approach and composed this series to do
the change.

I'd like you to try it and give me feedback if any.

                                        Thanks, Akira
----

Akira Yokosawa (6):
  Update book.cls
  book.cls: Fix indent after \chapter in twocolumn
  Makefile: Add localized 'book.cls' to dependency
  epigraph: Use \epigraphhead{}
  epigraph: Increase width a little
  Tweak page layout of onecolumn

 Makefile                         |  3 ++-
 SMPdesign/SMPdesign.tex          |  4 ++--
 advsync/advsync.tex              |  4 ++--
 appendix/ack/ack.tex             |  4 ++--
 appendix/questions/questions.tex |  4 ++--
 book.cls                         | 21 +++++++++++++++------
 count/count.tex                  |  4 ++--
 cpu/cpu.tex                      |  4 ++--
 datastruct/datastruct.tex        |  4 ++--
 debugging/debugging.tex          |  4 ++--
 defer/defer.tex                  |  4 ++--
 easy/easy.tex                    |  4 ++--
 formal/formal.tex                |  4 ++--
 future/future.tex                |  4 ++--
 glossary.tex                     |  4 ++--
 intro/intro.tex                  |  4 ++--
 locking/locking.tex              |  4 ++--
 owned/owned.tex                  |  4 ++--
 perfbook.tex                     | 17 ++++++++++++-----
 qqz.sty                          |  2 +-
 rt/rt.tex                        |  4 ++--
 together/together.tex            |  4 ++--
 toolsoftrade/toolsoftrade.tex    |  4 ++--
 23 files changed, 68 insertions(+), 51 deletions(-)

-- 
1.9.1

