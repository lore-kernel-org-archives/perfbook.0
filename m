Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=58nMZznGJlhKHZHLa/NDxuJ5mYmaTRsYgNkcZ+UJ8ds=;
 b=ZelVyJLo3ira2jNng7yEIWBXZPchtfF78rSEOuL0Pl0lOIpwXlskbpXUpOIkX0koyt
 Y6CqLJNx94uN8/zqDIlsGWqOJqaAToZ3q5gNl9/E5DFU4H+p3eK2hDxbUASDizEZmovU
 Sjyh2co00Z1u/5HJHkSY3h7POPZRXkJ8ryo9B1WoAkg8mxIUb3Yg2THOhvEMjo4yrR32
 0KonvA9vUOnvvexs4ZL0mrzboQK3R5G7/QKXxtmWJzEERFP3ARTG3dnGkXsroNLxv/4i
 NNIRNKSutLhtvjwge8h8zFSrU/42rr6fqUniIFgYS3zVx4QdbMQCT67Urn2nePTRmBIJ
 P8Jw==
Subject: [GIT PULL v5] Trial of labeling lines in code snippets
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <65eb47fb-678b-b8a1-9c5b-483e82b6516a@gmail.com>
Date: Sun, 5 Aug 2018 09:06:27 +0900
MIME-Version: 1.0
In-Reply-To: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is hopefully the final version of this trial branch.

Changes since v4:

    o Instead of generating CodeSamples/snippets.mk and calling it from
      main Makefile, generate CodeSamples/snippets.d which contains
      only dependencies and include it in the Makefile.

This change can fix the error you encountered in the previous version.
I'm just hoping...

        Thanks, Akira

--- 
The following changes since commit 3b62f67a76e15f8d8f8190a4252362d4ac0cdf23:

  Regenerating the atomic counter graph on a more modern CPU (2018-07-23 13:47:51 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git trial-fancyvrb-20180804b

for you to fetch changes up to d9a36224084b2e4ba55797eff0c37de528b59d6b:

  Add dependencies of perfbook_flat.tex to CodeSamples/.../*.fcv files (2018-08-05 08:44:02 +0900)

----------------------------------------------------------------
Akira Yokosawa (12):
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
      Add dependencies of perfbook_flat.tex to CodeSamples/.../*.fcv files

 .gitignore                              |   2 +
 CodeSamples/api-pthreads/api-pthreads.h |  18 +--
 CodeSamples/toolsoftrade/forkjoinvar.c  |  12 +-
 CodeSamples/toolsoftrade/pcreate.c      |   7 +-
 Makefile                                |  25 +++-
 perfbook.tex                            |  21 ++++
 toolsoftrade/toolsoftrade.tex           | 211 +++++++++++---------------------
 utilities/fcvextract.pl                 | 168 +++++++++++++++++++++++++
 utilities/gen_snippet_d.pl              |  65 ++++++++++
 utilities/gen_snippet_d.sh              |   8 ++
 utilities/hyphen2endash.sh              |   3 +
 11 files changed, 382 insertions(+), 158 deletions(-)
 create mode 100755 utilities/fcvextract.pl
 create mode 100755 utilities/gen_snippet_d.pl
 create mode 100644 utilities/gen_snippet_d.sh

