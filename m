Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-pl1-f177.google.com ([209.85.214.177]:41842 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfIRWwL (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 18 Sep 2019 18:52:11 -0400
Received: by mail-pl1-f177.google.com with SMTP id t10so639831plr.8
        for <perfbook@vger.kernel.org>; Wed, 18 Sep 2019 15:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qzpRwXgbpklWwi7bn3LJvgHMu8K5PmJpw+oeusztxiQ=;
        b=A/ePpEvTh2j0VDaTn/AwOMTUSnb7Amik9Tua81xWKm1rFKh6KB+nRJaIE1cEyQQ9Kx
         LPo6+Mvk20Hff5LU81Q1n47851G37OwJvyBuZNcuiZvncPor4yMELtp/niUXaj/LBW8C
         lGT4OIxiCE1oazR/Wo3M3vcwPBaiMqILJVKIAxPnMu9pM+qxhzRk/6a/2K6jgwHPS7w3
         y4ECxBk/4btnSXce6KUR/HaWiB8OqGvqvDcKXoqtAx1nHg1zR3XnOp3gDUEfO+1vnD4n
         ME1WAp34pAyph/QRYXKT5LOyq7QL4HdIkgG0w9mFNN5+fcmEeu6P9PMFpgiHnXcR1w/C
         UaGg==
Subject: [EXP PATCH] Make hyperlinks colorful and browsable in PDF viewer
References: <aeaa1b9d-1917-a177-3396-da8dd736889c@gmail.com>
 <36156427-7c2b-130b-41b6-a18b425eff2e@gmail.com>
 <CAKTCnz=8penAT4UJUFvxjx8sXFHKAdP2oCuQDX2H2oo6o5mQ0g@mail.gmail.com>
 <a161e1ba-37c0-4edf-da13-463ad2f3eb6a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c8228db6-1ebd-2b77-2b7c-bd100068d367@gmail.com>
Date: Thu, 19 Sep 2019 07:52:05 +0900
MIME-Version: 1.0
In-Reply-To: <a161e1ba-37c0-4edf-da13-463ad2f3eb6a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Balbir Singh <bsingharora@gmail.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From: Balbir Singh <bsingharora@gmail.com>

Without these changes the PDF does not provide a browsable TOC
to choose for navigation, also add a bit of color to the links
to make them screen friendly.

[akiyks: Split from patch [1].
    As 2c layouts are supposed to be for printing, enable coloring
    of hyperlinks only in 1c layout. To do this, add a boolean
    variable "colorlinks" and set it true for 1c layout. This would
    make it easy to change the condition to enable "colorlinks".

    Select "DarkBlue" via xcolor's "svgnames" option as it looks
    less distracting than the pure "blue".

    Redundant framing of links in bibliography is disabled when
    "colorlinks" is effective.

    Also make the page numbers in TOC hyperlinks as well.

    [1]: https://www.spinics.net/lists/perfbook/msg02350.html
]

Signed-off-by: Balbir Singh <bsingharora@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul and Balbir,

This is an experimental patch.
Does the links in "DarkBlue" acceptable (in 1c layout) to you?
Any suggestion of color choice is welcome!

        Thanks, Akira
--
 appendix/appendix.tex |  8 ++++++--
 perfbook.tex          | 16 ++++++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/appendix/appendix.tex b/appendix/appendix.tex
index d246a7f7..7b0d5c76 100644
--- a/appendix/appendix.tex
+++ b/appendix/appendix.tex
@@ -14,9 +14,13 @@
 }{
   \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
 }
-\hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
+\IfColorLinks{}{
+  \hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
+}
 \bibliography{bib/RCU,bib/WFS,bib/hw,bib/os,bib/parallelsys,bib/patterns,bib/perfmeas,bib/refs,bib/syncrefs,bib/search,bib/swtools,bib/realtime,bib/TM,bib/standards,bib/OSS,bib/maze,bib/energy,bib/QC,bib/NP}
-\hypersetup{pdfborder=0 0 0}
+\IfColorLinks{}{
+  \hypersetup{pdfborder=0 0 0}
+}
 \IfTwoColumn{
   \end{adjustwidth*}\twocolumn
 }{
diff --git a/perfbook.tex b/perfbook.tex
index 85696333..a0805831 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -42,7 +42,7 @@
 \setlist[description]{style=unboxed}
 %\usepackage{enumerate}
 \usepackage{ifthen}
-\usepackage[table]{xcolor}
+\usepackage[table,svgnames]{xcolor}
 \usepackage[shortcuts]{extdash}
 \usepackage{changepage}
 \usepackage{listings}
@@ -58,7 +58,7 @@
 \usepackage{tabularx}
 \usepackage[hyphens]{url}
 \usepackage{threeparttable}
-\usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0}]{hyperref}
+\usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
 \usepackage{epigraph}
@@ -100,6 +100,18 @@
 \setboolean{nimbusavail}{false}
 \newcommand{\IfNimbusAvail}[2]{\ifthenelse{\boolean{nimbusavail}}{#1}{#2}}
 
+\newboolean{colorlinks}
+\setboolean{colorlinks}{false}
+\newcommand{\IfColorLinks}[2]{\ifthenelse{\boolean{colorlinks}}{#1}{#2}}
+
+\IfTwoColumn{}{
+\setboolean{colorlinks}{true}
+}
+
+\IfColorLinks{
+\hypersetup{colorlinks=true,allcolors=DarkBlue}
+}{}
+
 \IfNimbusAvail{
 \usepackage{nimbusmononarrow}
 }{}
-- 
2.17.1


