Return-Path: <SRS0=E7ue=IK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=OhUxRWCC58md1xfBDBYpIwp6EIjx24n8u7CZVQlG0pM=;
        b=pV/hIL2tz0V0j6EHVore/m05NvwSV1h8085xPWcq2aFyRXTmjDjbIBopxDz7jjycyK
         C7mOyF8NufuQivXNs3k7/KGVfDUuMrHdMZJo4s2RkfUrt3KDIqVSaAJqpeSCBLAtR6nF
         J+/kRmFZsweNMESXRzwb5ahsJCx0I+weCtvvPMPEiw93R4+KlnJq+SXQJ/X9mtFeqK9j
         qn+T3Op9fj4K3ZsoOUGBI+1X775Rgrvmwr7OXfS2Ai3xEiUf0Zrg31yxR6aIrpoMN4SP
         hfU3oPbJNYsm7JFy2IrGAyd90yPyZWhqVS+1PYLH+Tc76u0VeU/zFoTXPaesNn2u2C20
         5swg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL -perfbook] Minor tweaks for Edition 2
Message-ID: <b4d385ab-fced-17e5-6af0-ecd0e05260fa@gmail.com>
Date: Fri, 12 Mar 2021 09:03:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

So this is a collection of minor updates/tweaks for Edition 2.

Patch 1/9 adds an author field in a bibliography entry.
Patch 2/9 fixes font in a epigraph.
Patch 3/9 adjusts position of a sideways table with a typo fix.

Patches 4/9 -- 7/9 tweak float positions and line breaks mostly for
1c builds.  They affect 2c build as well.  If you find any undesirable
changes in 2c builds, please let me know.  I'll give a closer look.

Patch 8/9 removes adhoc tweaks which have become irrelevant.
Patch 9/9 restores a2ping in a recipe for ghostscript 9.53.x.
It turned out that a2ping can cope with the up-to-date ghostscript.

        Thanks, Akira
--
The following changes since commit 736cfb826271d7e25b45859cf793d4c7749d024b:

  appendix/questions: Updates and wordsmithing (2021-03-09 17:24:47 -0800)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.12a

for you to fetch changes up to c337d0756f8862f981eab9f67262d39371769dbe:

  Makefile: Restore a2ping for .tex originated .eps files (2021-03-12 08:27:17 +0900)

----------------------------------------------------------------
Akira Yokosawa (9):
      bib/syncrefs: Add author info to AndrewDBirrell1989Threads
      defer/updates: Use \emph{} for author part in epigraph
      defer/rcuapi: Fix position of 'RCU Wait-to-Finish APIs' table
      Use nbsp for 1c builds
      Use 'tbp' as option of floats
      Add \FloatBarrier to avoid far-away floats
      easy: Shrink and move 'Mandelbrot Set' figures
      Remove '\noclub[1]' tweaks
      Makefile: Restore a2ping for .tex originated .eps files

 Makefile                      |  4 +++-
 advsync/rt.tex                |  1 +
 appendix/toyrcu/toyrcu.tex    |  8 ++++----
 bib/syncrefs.bib              |  1 +
 debugging/debugging.tex       |  1 -
 defer/rcuapi.tex              |  4 ++--
 defer/rcufundamental.tex      | 10 +++++-----
 defer/updates.tex             |  2 +-
 easy/easy.tex                 | 18 +++++++++---------
 future/future.tex             |  2 ++
 future/tm.tex                 |  8 ++++----
 intro/intro.tex               |  6 +++---
 locking/locking.tex           |  1 -
 memorder/memorder.tex         | 41 +++++++++++++++++++++--------------------
 perfbook-lt.tex               |  3 ++-
 toolsoftrade/toolsoftrade.tex |  4 ++--
 16 files changed, 60 insertions(+), 54 deletions(-)
