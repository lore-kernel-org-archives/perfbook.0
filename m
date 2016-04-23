Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=QzBuBUmEgzqM39vB6rgIFH2To5XjKIQfvDL0AJKFtDE=;
 b=dVwTTlcazfoBsd7/GNxkkuOW+70q3E+tfgLLn9VM2to2lt7qNarNv6NSorQKqS6V/q
 KT+X3TbL7isxcIXiWQvm3SLNPIk8LbahPSKPpjTo3+SDeMHoq4+3eQse3DuYbVlfnO0k
 VzDo1QGiLuDItCiB/ZyW+ZgGkU3A6agBoNCDZeW3czA5DanrRGu6WPGMLnxcKxu4qKls
 ENyxh38z3Rs1AMtnDyaRuTyISq+5tdY1x7P+AUpnnf20gf3pnELMXCfaAR2HJsBY1sGa
 oBzx2eeh5foTgaF3v0Ya5AHIW8U8Wb+kOrCauF6Dw4TmACbbwx2242bX/knOAS9iGJz3
 zLAg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v2 0/3] qqz and runlatex improvements
Message-ID: <571B5FBE.6030005@gmail.com>
Date: Sat, 23 Apr 2016 20:42:54 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0a9063f5bfc9a984b505fefe54d347f39e099f58 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Sat, 23 Apr 2016 20:37:29 +0900
Subject: [PATCH v2 0/3] qqz and runlatex improvements

Hi,

There have been two issues that bother me a little since I began to
build perfbook.pdf myself.
One is the cross-link references of quick quizzes that land on random
nearby places in the PDF.
The other is the premature termination of make with warning messages
displayed.
I think I have managed to fix both issues.

However, .sty file modification may introduce regressions and
should be fully tested before being pushed out. Can anybody on the
list test it and give feedback?

Thanks.

Changes since v1:
Refactored runlatex.sh into 3 parts and improved the build behavior
in response to the feedbacks from Paul[1].
As the result of the change, *.bbl files are not necessary any more,
so a patch to remove them is added.

[1] http://www.spinics.net/lists/perfbook/msg00160.html

Akira Yokosawa (3):
  qqz: Improve accuracy of cross-links
  Improve behavior of build scripts
  Remove *.bbl from repository

 .gitignore                 |    2 +-
 Makefile                   |   55 +-
 perfbook-1c.bbl            | 2103 -------------------------------------------
 perfbook-hb.bbl            | 1949 ----------------------------------------
 perfbook.bbl               | 2146 --------------------------------------------
 qqz.sty                    |   14 +-
 utilities/runfirstlatex.sh |   46 +
 utilities/runlatex.sh      |   85 +-
 8 files changed, 168 insertions(+), 6232 deletions(-)
 delete mode 100644 perfbook-1c.bbl
 delete mode 100644 perfbook-hb.bbl
 delete mode 100644 perfbook.bbl
 create mode 100644 utilities/runfirstlatex.sh

-- 
1.9.1

