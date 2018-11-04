Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=71coWdg3InsJGUSoZYBVRcuB0UO4vrwVODalYzt9QCw=;
        b=vJJBTHhza2a6kobqBmgZpkGGTEhiCXhdla9eWMxjSc414YXb1WSdg6n7ATV1KkTA93
         dFwVcr6Wmew4TnteE8lkoC6ocbZhot+/d1F3yJDT/n807Qy+hYSTNcx8blARdB7A0ZkF
         icnc6b6ZhqYXS5cJWvx5MAwhNYK6cRofUXDCCFFPth5PJNHxVnZ89cl8FPqbDOn3NQ4/
         gBO5JD52njdBqhl0s1bN09TaAlcXhEVoBLjR45TabdByvGPincTXI+K3wPTpKLmpEVSL
         fuXMJ76TqAjAVpaqsR3qK/tYL1eu2dljQETPO8tXB5oel5FLh232sLd6I/JzNggrDBLY
         eDEg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/7] Further conversion of code snippets (howto, cpu,
 SMPdesign)
Message-ID: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
Date: Sun, 4 Nov 2018 09:07:36 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is another set of patches converting code snippets to new scheme.
Notes on the changes other than simple conversion follow.

Patch #2 contains somewhat ugly hack in lockhdeq.c to suppress
"____cacheline_internodealigned_in_smp" in the resulting snippet.
I'm afraid it could hurt your eyes.

Patch #5 renames "percpu*" to "perthread*" to respect the names
used in actual code.

Patch #6 includes substitution of ACCESS_ONCE -> READ_ONCE.

Patch #7 does the substitution under CodeSamples. It also adds
a couple of function prototypes in maze.h.

        Thanks, Akira
--
Akira Yokosawa (7):
  howto, cpu: Employ new scheme for command/code snippets
  SMPdesign: Employ new scheme for snippet of lockhdeq.c
  SMPdesign: Employ new scheme for snippet of lockhdeq.c and locktdeq.c
  SMPdesign: Employ new scheme for inline snippets
  SMPdesign: Employ new scheme for snippets from smpalloc.c
  SMPdesign/beyond: Employ new scheme for inline pseudocode snippets
  CodeSamples/SMPdesign/maze: Substitute {READ/WRITE}_ONCE() for
    ACCESS_ONCE()

 CodeSamples/SMPdesign/lockhdeq.c       |  53 ++--
 CodeSamples/SMPdesign/locktdeq.c       |  70 ++---
 CodeSamples/SMPdesign/maze/maze.h      |   6 +
 CodeSamples/SMPdesign/maze/maze_fg.c   |  18 +-
 CodeSamples/SMPdesign/maze/maze_part.c |  18 +-
 CodeSamples/SMPdesign/smpalloc.c       |  57 ++--
 SMPdesign/SMPdesign.tex                | 479 ++++++++++++++-------------------
 SMPdesign/beyond.tex                   | 319 +++++++++++-----------
 SMPdesign/partexercises.tex            | 263 ++++++------------
 cpu/overview.tex                       |  15 +-
 howto/howto.tex                        |  60 ++---
 11 files changed, 605 insertions(+), 753 deletions(-)

-- 
2.7.4

