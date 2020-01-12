Return-Path: <SRS0=UsGV=3B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=GX8m4EJJ7vja6j8ATn2hCoB8pLDST1YP27SruECJfns=;
        b=U38VZImIbVrtPJLlDbrRBVOv0d3FI8CxKa/9+rSFaUrPCGWGfvJn1WwdtURDCd5zfv
         n9PFxsMi4seg35D2+Bw0AvEioQMphlUH39VuZP/GoZm7JcWfzqemKivhoI947o2yaQHO
         YHYN9gFlvKZvegKENrbBsA9/9UYxpQvFdJwdAcjYv38luAyia6mntWX1bblQiXjUYF86
         RiXEeHoGF5R8GAtAqGSXiNv03BPvkpo27Nb7A6kVLFE+5tkxgSNJeEcWHI9ztsAjxzhJ
         s6coZ06/5CSGNsHBkaonutsn9FWMf0Eq37kiiM9C2gYNIOtK5YApi2QmmlehviMOPcl1
         VGrA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] Avoid widow/orphan headings and lines
Message-ID: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
Date: Sun, 12 Jan 2020 13:02:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

(LaTeX adviser hat on)

This patch set is prompted by a recent update of the "epigraph"
package mentioned in the change log of 3/6.
epigraph v1.5e now suppress epigraphs from orphaned (appear at
the bottom of a page/column).
In 2C layout of v2019.12.22a, epigraphs of Sections 9.5, 10.2,
and 10.4 are orphaned.
Upgrading to epigraph v1.5e resolves the issue, but there is
another occurence of orphaned heading of Section 10.2.2 (1C
layout of v2019.12.22a).

The reason of the orphaned heading is the float object at the
beginning of the sub section. I've found a recommendation of
where to put floats in LaTeX sources at

  https://www.latex-project.org/publications/2014-FMi-TUB-tb111mitt-float-placement.pdf

,as mentioned in the change log of 2/6. It is a good read for
the algorithm of float placement by LaTeX.
Quote from Section 4.7:

    Do not place a float directly after a heading, unless
    it is a heading that always starts a page. The reason
    is that headings normally form very large objects (as
    a heading prevents a page break directly after it).
    However placing a float in the middle of this means
    that the output routine gets triggered before LATEX
    makes its decision where to break and any footnotes
    get moved into the wrong place.

So, I moved such floats in 2/6. I might have missed one or two
of other such floats, though.

Patch 1/6 fixes a minor typo in epigraph.
Patch 2/6 moves floats as mentioned above.
Patch 3/6 enforces the upgrade of epigraph package, and also
applies "nowidow" package to prevent orphan/widow lines.
As mentioned in the change log, this change will cause large
gaps between paragraphs on a few pages. You might find them
ugly, but I prefer the ease of read, especially short QQZs.
Patch 4/6 retouches a quick quiz to avoid such a large gap
at the end of the Quiz part.
Patch 5/6 changes the definition of \clnrefrange and
\Clnrefrange to prevent breaks at endashes.
Patch 6/6 is unrelated to widow/orphan, but improves the
readability of longer footnotes in 1C layout.

Patches 3/6, 5/6, and 6/6 modifies preamble (and related
FAQ-BUILD.txt) only. You can skip any of them if you'd be
inclined to.

        Thanks, Akira
--
Akira Yokosawa (6):
  together/count: Fix double quotes in epigraph
  Prevent section heading from orphaned
  Prevent section epigraph from orphaned
  count: Promote code snippet in Quiz part of QQZ to listing
  Use unbreakable endash in \clnrefrange{}{}
  Reduce footnote width in 1c layout

 FAQ-BUILD.txt              |   7 +-
 SMPdesign/beyond.tex       |  13 ++-
 appendix/toyrcu/toyrcu.tex | 167 +++++++++++++++----------------
 count/count.tex            | 111 +++++++++++----------
 datastruct/datastruct.tex  |  77 +++++++--------
 defer/rcuapi.tex           |  32 +++---
 defer/rcuusage.tex         |  15 ++-
 formal/axiomatic.tex       |  24 ++---
 formal/dyntickrcu.tex      | 194 ++++++++++++++++++-------------------
 formal/ppcmem.tex          |  14 +--
 formal/spinhint.tex        |  59 ++++++-----
 locking/locking.tex        |  79 ++++++++-------
 memorder/memorder.tex      |  60 ++++++------
 perfbook.tex               |  13 ++-
 together/applyrcu.tex      |  48 ++++-----
 together/count.tex         |   2 +-
 16 files changed, 453 insertions(+), 462 deletions(-)

-- 
2.17.1

