Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=KK74e/zkvUcCovxdVbOe2mRz+5nyKPgg9cEMWUKmerU=;
 b=Mozn88v3udgc0FFh1mzPECFZ+2vc3qT6yKbBweg00tzv6lzpWL4dZARoU9HRtgpNJq
 ZEbCI2Ecjj/VKIbiuIa1A7p1Abxz82C8N7B1EXI3wT1fNkSrl5/zgdRQC44QBOfNfCK0
 owFx5P7oQMqIjp1VvUfzXIrWwHRzfQ5TtdzSdylcIvPqAjjx1aFGvmO95BnnegdvI8Iy
 9lylY41cz7r6rLFFkXPeInz5hSf8U7nOi8gUCrhvTKbar6bX9IXkQU8KDED/2oiejyX6
 YVvtKVFso3qN6CKi3koZic3+SEJiuIjlDnrPKNQJFzzCouUFcXv4b6UkTbAGH7N56iqX
 8/eA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] future: Update Locking and HTM comparison tables
Message-ID: <49209cfd-5494-fc54-ba4b-f8389ba4aed7@gmail.com>
Date: Thu, 7 Dec 2017 00:00:02 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d6497dadbc973d7d94591f48730c4c0ce1c129a8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 6 Dec 2017 23:40:04 +0900
Subject: [PATCH 0/2] future: Update Locking and HTM comparison tables

Hi Paul,

I have tackled the remaining two tables of old style in Section 17.3.
"Advantage", "Disadvantage", and "Strong Disadvantage" can be indicated
by background colors, and their structures can be simplified.
This scheme is inspired by Table 12.4, with using lower saturation
colors.

Patch #1 modifies the tables.
Patch #2 adds a merged table of the two as a sidewaystable.

Background colors are chosen so that they can be distinguished
when they are printed in grayscale.

Thoughts?

        Thanks, Akira
--
Akira Yokosawa (2):
  future: Update Locking and HTM comparison tables
  future: Add merged table of locking & HTM comparison

 appendix/styleguide/styleguide.tex |   6 -
 future/HTMtable.tex                | 201 ++++++++++++++---------------
 future/HTMtableColor.tex           |   9 ++
 future/HTMtableFull.tex            | 148 +++++++++++++++++++++
 future/HTMtableRCU.tex             | 254 +++++++++++++++++--------------------
 future/htm.tex                     |   6 +
 perfbook.tex                       |   1 +
 7 files changed, 370 insertions(+), 255 deletions(-)
 create mode 100644 future/HTMtableColor.tex
 create mode 100644 future/HTMtableFull.tex

-- 
2.7.4

