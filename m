Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=54vlhVIIDDg8iSP78VlcJnOr5LjPAPQ7CwmwDJRH99Q=;
 b=HkZc1Xrl1U+Gnf9ruWk73bAlDMSJkcd1uxcBp/J/xbswtBoMY8DLXSK5s7g664nHR9
 1bqJoapsF310/6dHn+PSwem5EYXvoWHjxHqbdN7vkuOV3JcJZ/uUd+JQ06xvm5xfnChJ
 STe2DOqdwFs5qel+QUlx16y9qf3GbQa2H7PxvLVy/EAX65QNduieS2PTQXvJIPu1bRac
 OwoIsvecwQNwpawUWjJ04o4WL2bnP9+QFxu8vYZ7cdwmWJ6nxHx8dAzm46LrTgepdDDD
 SyuMvuaWvVRQO/8JQKqbVkCuYvx8cLdvNVaJMxnBvqSJZh91MDRKr2Sw4Fkh6QhJeC6m
 h+fg==
Subject: [GIT PULL v3] Trial of labeling lines in code snippets
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <18fcce90-11d6-4ab1-c6fc-73791a305091@gmail.com>
Date: Fri, 3 Aug 2018 07:34:51 +0900
MIME-Version: 1.0
In-Reply-To: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is v3 of the trial of fancyvrb scheme.

Changes in v2 -> v3

    o Define "linelabel" and "lineref" environments and use them in the early part of
      toolsoftrade.
    o Define "VerbatimU" env for short snippet with no line count and use it for
      a couple of snippet in toolsoftrade.
    o Rename "VerbatimM" to "VerbatimN".
    o Remove "[EXP]" in commit log titles.

          Thanks, Akira

---
The following changes since commit 3b62f67a76e15f8d8f8190a4252362d4ac0cdf23:

  Regenerating the atomic counter graph on a more modern CPU (2018-07-23 13:47:51 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git trial-fancyvrb-20180802a

for you to fetch changes up to 6bf7a51b7b9dadf54a0b1edc8959fafed0fcf671:

  Add 'linelabel' and 'lineref' environment (2018-08-03 07:21:49 +0900)

----------------------------------------------------------------
Akira Yokosawa (9):
      toolsoftrade: Add labels in code samples as comments
      Add script to extract code snippet from code sample
      toolsoftrade: Reference line in code snippets by label
      Update hyphen2endash
      Add *.fcv to .gitignore
      Automate sub makefile update
      Specify lmtt font for VerbatimM env
      toolsoftrade: Use \lnlbl in inline code snippet
      Add 'linelabel' and 'lineref' environment

 .gitignore                              |   2 +
 CodeSamples/api-pthreads/api-pthreads.h |  18 +--
 CodeSamples/toolsoftrade/forkjoinvar.c  |  12 +-
 CodeSamples/toolsoftrade/pcreate.c      |   7 +-
 Makefile                                |  14 ++-
 perfbook.tex                            |  21 ++++
 toolsoftrade/toolsoftrade.tex           | 211 +++++++++++---------------------
 utilities/fcvextract.pl                 | 166 +++++++++++++++++++++++++
 utilities/gen_snippet_mk.pl             |  55 +++++++++
 utilities/hyphen2endash.sh              |   3 +
 10 files changed, 351 insertions(+), 158 deletions(-)
 create mode 100755 utilities/fcvextract.pl
 create mode 100755 utilities/gen_snippet_mk.pl

