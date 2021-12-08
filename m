Return-Path: <SRS0=4u0W=QZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=zng/ivaGWuMYl1p08k5poyjGKNCdVxGtiMb7P2+l5FQ=;
        b=RfRO+TcSYtd7EoC/zPuYY7xuAcuBQNTidagt+V6PJBrUkY0lVl/Jf1ps2UgG+250Vz
         VGi9lJp8GSkB6j6wApU+uqKJrL4awah8FuamIXvkJrFtmQS5aOHQnXTf2SBBGczF3rnb
         K3b43zJ2239qwi0IDIHm2kPadc05QT8nXqEufLhm+5ktoGzzriZx8OsCrWbeTzJ/xOpP
         /srZEeDvkho8DJ0V9udm2kbWRIeqnLG3diQ1m02GI0YYA2TxR6zlqGwLo3I4fvUUUEsm
         aI/WCXY5bOvGdjBGbOi1eaf7iaVodaw/FeJSXLCYd4Sk3Nz6E+FsCUy4CNznm92lPBI7
         +ZgQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/4] Address potential widowing of headings
Message-ID: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
Date: Wed, 8 Dec 2021 16:37:26 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

There was some confusion on my side WRT undesired page/column
breaks.

While testing the added checks in cleverefcheck.pl, I saw too
many potential such cases flagged.  This made me do some tests
to reproduce unfortunate page/column breaks.

There are three such patterns I have confirmed.

1. "listing" environment (with contents of fancyvrb) next to proper
LaTeX headings (\chapter, \section, \subsection, etc.)

2. Any environment (not necessarily float) next to QQA heading
of "Answer:"

3. Any environment (not necessarily float) next to epigraph

This means commit f106e0e6dc43 ("defer/rcuusage: Move float objects
away of section titles") has no merit.  It is safe to revert it if
you'd like.  I was confused by patterns 2 and 3 and thought that
floating objects can cause undesired breaks. 

Patches 1/4--3/4 add tests in cleverefcheck.pl that check patterns
listed above respectively.

Patch 4/4 fixes problematic places flagged by the updated script.
Feel free to wordsmith the leading phrases I added in QQAs.

        Thanks, Akira
--
Akira Yokosawa (4):
  cleverefcheck.pl: Add test of listing next to heading
  cleverefcheck.pl: Add test of \begin{...} at head of QQA
  cleverefcheck.pl: Add test of \begin{...} next to epigraph
  treewide: Address potential widowing of headings

 appendix/questions/after.tex  |  4 +++
 datastruct/datastruct.tex     | 14 +++++-----
 defer/refcnt.tex              | 24 ++++++++---------
 formal/axiomatic.tex          | 22 +++++++--------
 locking/locking-existence.tex |  9 ++++---
 memorder/memorder.tex         |  6 ++---
 utilities/cleverefcheck.pl    | 50 +++++++++++++++++++++++++++++++++++
 7 files changed, 92 insertions(+), 37 deletions(-)


base-commit: f106e0e6dc436683bb119dd8992c6f173994d182
-- 
2.17.1

