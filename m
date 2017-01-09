Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=34ZgjUvfmBLkLh4bkd9b3Mrdk82SrfBL11kGXxSX65A=;
 b=vaVfYc1vwbSwB7/3dq/3WAkPlFXGXWMoP+qRQ8koIwtuHJQzSfrSKHEmUtisK/WqXZ
 QpBdcc5CmRnkQyfK+0qVW3YrmSQssB6NvDkQ2vorJscrtD8D+XbrSZEG4cw0Dl+k2870
 Ul/Bt9Vs2Bjxfx5d4NcXZA7Ck4DrEkrHDCJgfUTJLq8p6MFZY4GVCDn9kPLvORucH8mA
 /c0M6iRlZw6PQaI8zemZtaMp9Re/eNTEiCpoSNyVERAT0MK3wcw8Tl91WwSwMG9xBKKZ
 2TM2HvlVRy+umaMwr4xnGZjlP21J/c6PUH3PICgqkB3LlAXOxfauhhgwmEmbeY2ByNMN
 CF4A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Quick Quiz layout update
Message-ID: <04f10e4e-b325-c5a3-4076-3417a188ece2@gmail.com>
Date: Mon, 9 Jan 2017 23:37:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6da1b01ee71e53c559a73e20686eabe67ba23935 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 9 Jan 2017 23:09:24 +0900
Subject: [PATCH 0/3] Quick Quiz layout update

Hi Paul,

This patch set improves layout of Appendix "Answers to Quick Quizzes".
White boxes at the end of answers sometimes become "orphans".
This happens when an answer finishes with an "enumerate" or "figure"
environment. As an end of these environments is treated as a page/column
break candidate, a white box just after the end of an environment tends to
become an orphan (single symbol at the top of next page/column).

To prevent this, white boxes can be moved to just after the final item
of "enumerate" environments. Or they can be moved to just after the final
paragraph before "figure" environments. 

I wrote a script to do this (Patch 1), and incorporated it into the rule of
target "qqz.tex" (Patch 2). Patch 3 tweaks vertical space parameters for
a better look of the Appendix

                                                 Thanks, Akira
--
Akira Yokosawa (3):
  qqz: Add script to reorder lines in qqz.tex
  Makefile: Use qqzreorder.pl in qqz.tex target
  qqz.sty: Tweak \vspace{} parameter

 Makefile                |  2 +-
 qqz.sty                 |  6 ++--
 utilities/qqzreorder.pl | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+), 4 deletions(-)
 create mode 100644 utilities/qqzreorder.pl

-- 
2.7.4

