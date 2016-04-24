Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=85tJLGRCYjmMPyxA31XcUtxrO/vdgIQpEujWrIR62tg=;
 b=nWg37M4Sf4wbVw6340d+tBJSo3JR3z0FilMlik9Mm822nuDsY4b4iS/ivpVSjdJ4sO
 shmDy7yk6fNPzwZLcX6R0ggiOyUA9QZ6Lbfmh1MYQNt1ymMGhC4EJG8rc7XPRCoz8GmE
 DAH4HJpces91eMXdla96mMbBPC5HyvMXsoiwSfNvheSC5K/EwhV9U1PltP+VViMXGlTN
 P92qZN2b8oKIuWcfCLOL0y3DrCFKZPYrHy1sjo05vWslJb56v/8PMmQ2LSP5ShQDUzLf
 8P5RtEvWYIUSqLppcAgYa7rgolwdSOwE1mjHMQciLpjvm93m9wvuFzSKlwP6kCAJLJYc
 DE9g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v3 0/3] qqz and runlatex improvements
Message-ID: <571C1843.1060906@gmail.com>
Date: Sun, 24 Apr 2016 09:50:11 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 687dd92a14a751c5919c80f9d7d8609db94d7634 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Sun, 24 Apr 2016 09:26:52 +0900
Subject: [PATCH v3 0/3] qqz and runlatex improvements

Hi,

There have been two issues that bother me a little since I began to
build perfbook.pdf myself.
One is the cross-link references of quick quizzes that land on random
nearby places in the PDF.
The other is the premature termination of make with warning messages
displayed.
I think I have managed to fix both issues.

Paul tested v2 of this series and found that it is ready to be pushed
out if minor fixes of a trailing blank and "XXXXXX" in commit messages
are done.

Changes since v2:
    Updated copyright notices in qqz.sty
    Removed a trailing blank in runfirstlatex.sh
    Fixed "XXXXXX" in commit messages
    Added "-f" option to "rm" in runlatex.sh
    Other minor changes in commit messages

Changes since v1:
Refactored runlatex.sh into 3 parts and improved the build behavior
in response to the feedback's from Paul[1].
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
 qqz.sty                    |   18 +-
 utilities/runfirstlatex.sh |   46 +
 utilities/runlatex.sh      |   85 +-
 8 files changed, 172 insertions(+), 6232 deletions(-)
 delete mode 100644 perfbook-1c.bbl
 delete mode 100644 perfbook-hb.bbl
 delete mode 100644 perfbook.bbl
 create mode 100644 utilities/runfirstlatex.sh

-- 
1.9.1

