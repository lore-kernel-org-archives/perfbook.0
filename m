Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pID7FbCh6kZ0Y4wsnLThrmhgdw0YZR/HW6uGdedZ9kU=;
 b=e6gCR8R4d1LX9NcnJetIsZ9c5/G6huqvxB2SamDaixbilXDRX7UovqDOgC6gE+TJbK
 sPyFIJp2t0lLgLSI2aXbma+oRQrZvosjST7zAJ5FXg9HnV9nSICV+1Gek7QwXskRg54a
 W3moBD6YtkTYF00ULK7sHlcqltzjHocP78r1JSEO1lwue8Wd8T3sXQUSw5j73s7nGbnz
 HpCE19D7gHEWSuFiClHhMdhGaRr45aB1wzevGsXI14iJEPz8/8ZbnDYd7RV+w5zclo42
 YVazbMky2gMkrCQPaArxpFW1lceBzK6bwfD0Dw51OCAXDSj+SVyMWuKcnlHuG40Y9/zY
 d4mQ==
Subject: [NOT YET PULL v2] Trial of labeling lines in code snippets
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7f933561-fa81-8006-0c7d-a30e6eb93682@gmail.com>
Date: Tue, 31 Jul 2018 01:04:18 +0900
MIME-Version: 1.0
In-Reply-To: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is v2 of the trial of fancyvrb scheme.

---
The following changes since commit 3b62f67a76e15f8d8f8190a4252362d4ac0cdf23:

  Regenerating the atomic counter graph on a more modern CPU (2018-07-23 13:47:51 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git trial-fancyvrb-20180730a

for you to fetch changes up to 3361b7331cf0f08a75bf6a9f69b7ea2f126e3b75:

  [EXP] Automate sub makefile update (2018-07-31 00:31:56 +0900)

----------------------------------------------------------------
Akira Yokosawa (6):
      [EXP] toolsoftrade: Add labels in code samples as comments
      [EXP] Add script to extract code snippet from code sample
      [EXP] toolsoftrade: Reference line in code snippets by label
      [EXP] Update hyphen2endash
      [EXP] Add *.fcv to .gitignore
      [EXP] Automate sub makefile update

 .gitignore                              |   2 +
 CodeSamples/api-pthreads/api-pthreads.h |  18 ++--
 CodeSamples/toolsoftrade/forkjoinvar.c  |  12 ++-
 CodeSamples/toolsoftrade/pcreate.c      |   7 +-
 Makefile                                |  14 ++-
 perfbook.tex                            |  12 +++
 toolsoftrade/toolsoftrade.tex           | 174 ++++++++++----------------------
 utilities/fcvextract.pl                 | 166 ++++++++++++++++++++++++++++++
 utilities/gen_snippet_mk.pl             |  55 ++++++++++
 utilities/hyphen2endash.sh              |   3 +
 10 files changed, 322 insertions(+), 141 deletions(-)
 create mode 100755 utilities/fcvextract.pl
 create mode 100755 utilities/gen_snippet_mk.pl

---

There are quite a few changes since v1:

    o Rebased to current master.
    o Use line label format of "ln:directory:filename:function:linelabel"
    o To avoid repetitive use of long labels in reference, introduce
      \lnlblbase and \lnrefbase macros. By this change, now \lnlbl{} and
      \lnref{} can have simple line labels.
    o Add a script to extract VerbatimL sources from code samples.
    o Add a script to generate sub makefile for snippet extraction.
    o Update Makefile accordingly.

The scheme looks like to work for 90% of code snippets.

TODO list for me to improve:

    o Support of code snippets other than "C".
    o Support option to meta command \begin{snippet} other than labelbase and
      commandchars.
    o Support of commandchars option with no escape charactor required

If this looks ready for you to merge, I'll amend commit logs and
add header comment to gen_snippets_mk.pl and send a proper pull request.
Please try this branch and let me know what you think.

        Thanks, Akika

