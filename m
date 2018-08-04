Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K48gPmpN3359zidCn3xuRB2F8SvGFfeQyPGF/ztY+OE=;
 b=Y1rmo01RmPlVSgbpUocmLf8+z2Hnxav3qpKrU2EMW+3tYLWmI+XrEClC4eAaJvkRJF
 NcIA7Nj+4yKaGIAPXvsJ3J8WlNVBCceB6DHjMfJn5gPKLoZF+crO+K00DQp+rtSTBb/d
 O3bhMejSdoTaaVu24sTN03KDPENKhff/oGWgNAxGcU9uhxovmGRbQrmxPDYARy2HMY3q
 B8Wz17sB1c4WvXB/msYLOtayku37PzNhIeci6YzuWnPLTql92QTOaXaX4f6xYyzAvaB7
 K7nYru7W4L3ys3cf40nKfSPXEqnGYpXhK37s07GonHL6r6R/JHDStXWv0TeIbP9RU8QN
 QUuw==
Subject: [GIT PULL v4] Trial of labeling lines in code snippets
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e8301596-cb58-491d-89aa-ad9a35d21b66@gmail.com>
Date: Sat, 4 Aug 2018 20:57:55 +0900
MIME-Version: 1.0
In-Reply-To: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is v4 of the trial of fancyvrb scheme.

Changes since v3:

    o gen_snippet_mk.pl: Add check of failure mode observed by Paul.
    o gen_snippet.mk.sh: Remove broken CodeSamples/snippets.mk when the failure
      is caught.
    o Add dependencies in Makefile regarding the generation and extraction
      scripts/sub makefile.
    o Change "make clean" so that it does not depend on CodeSamples/snippets.mk
      and remove the sub makefile.

I'm not sure these changes resolve the issue you encountered.
Does "make clean; make" work for you now?

        Thanks, Akira

--- 
The following changes since commit 3b62f67a76e15f8d8f8190a4252362d4ac0cdf23:

  Regenerating the atomic counter graph on a more modern CPU (2018-07-23 13:47:51 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git trial-fancyvrb-20180804a

for you to fetch changes up to dd1559612728fcf8726a5b367147cc51ca8f27a8:

  Add dependencis to scripts for extracting code snippets (2018-08-04 19:36:07 +0900)

----------------------------------------------------------------
Akira Yokosawa (11):
      toolsoftrade: Add labels in code samples as comments
      Add script to extract code snippet from code sample
      toolsoftrade: Reference line in code snippets by label
      Update hyphen2endash
      Add *.fcv to .gitignore
      Automate sub makefile update
      Specify lmtt font for VerbatimM env
      toolsoftrade: Use \lnlbl in inline code snippet
      Add 'linelabel' and 'lineref' environment
      Catch failure in genaration of CodeSamples/snippets.mk
      Add dependencis to scripts for extracting code snippets

 .gitignore                              |   2 +
 CodeSamples/api-pthreads/api-pthreads.h |  18 +--
 CodeSamples/toolsoftrade/forkjoinvar.c  |  12 +-
 CodeSamples/toolsoftrade/pcreate.c      |   7 +-
 Makefile                                |  15 ++-
 perfbook.tex                            |  21 ++++
 toolsoftrade/toolsoftrade.tex           | 211 +++++++++++---------------------
 utilities/fcvextract.pl                 | 168 +++++++++++++++++++++++++
 utilities/gen_snippet_mk.pl             |  72 +++++++++++
 utilities/gen_snippet_mk.sh             |   8 ++
 utilities/hyphen2endash.sh              |   3 +
 11 files changed, 379 insertions(+), 158 deletions(-)
 create mode 100755 utilities/fcvextract.pl
 create mode 100755 utilities/gen_snippet_mk.pl
 create mode 100644 utilities/gen_snippet_mk.sh

