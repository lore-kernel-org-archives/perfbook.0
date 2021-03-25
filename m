Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ys/HokKRotBTbccgr4VOYLsm1cPS9vuXRYIiX02PC30=;
        b=RqyEB/PWQQKfkucVjYYjKB5gp9wTq9wUc9O6PvImzqvGPVQmAhk8AUEm4P7FRKpGcf
         aCAwa9jzAMQt3uI2WCbJ4WxxG3KcoY+57t4hzvy9gCLeOZ3Ptndu2xIKEzvSGg3w8rfu
         9ZanzU7Qqk7IiPME9rnXBecrkyV6mUJuapDYm9gKVR9YRHPVBarEKbsjUI0OBL6VC+5T
         xDirmgRN7bXCwUpdoqpC9LGanrVDe0CFG/aahagCK06J1Hze7oAsO8Jd+qAeGwkoHc8B
         YcUB9SfCUXt8D73kI76kCzPhaDGp0UHUaJL162XHbWQX02kViARF1v3ExwJ/8pK4mkJH
         GnmQ==
Subject: [PATCH -perfbook 2/5] perfbook-lt: Add macros to shrink floats for
 ebook
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <291b72a3-1f65-0fd0-114e-d2154bd66c94@gmail.com>
Date: Thu, 25 Mar 2021 19:55:51 +0900
MIME-Version: 1.0
In-Reply-To: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

\ebresizewidth{} is for table and figure.
\ebresizewidthsw{} is for sidewaystable.
\ebresizeverb{}{} is for code snippets.  1st argument specifies
a resize ratio.

These macros affect the ebook-size build (e.g. perfbook-eb.pdf) only.

See subsequent changes for their usage examples.

Also do minor cosmetic changes:

o Move commit/tag watermark closer to the bottom.
o Select onesided build for ebooksize.
  By this change, chapters can start from both odd and even pages.
o Select 'section' option of placeins for ebook-size build.
  This change prevents overloaded floats to appear far from where
  they are mentioned.  This will occasionally cause premature
  page breaks, but they should be acceptable for ebook builds.
o Void \OneColumnHSpace
o Define \ebFloatBarrier macro which can be used for ebook-size-only
  float barriers.
o Allow footnotes to occupy full textwidth.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Acked-by: Balbir Singh <bsingharora@gmail.com>
---
 perfbook-lt.tex | 51 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index a884011a..1272fc95 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -35,6 +35,7 @@
 \captionsetup[listing]{font=small,labelsep=colon}
 \captionsetup[subfloat]{font=small}
 % \usepackage{breakurl}
+\usepackage{varwidth}
 \usepackage{graphicx}
 \usepackage{rotating}
 \usepackage{setspace}
@@ -74,7 +75,6 @@
 \usepackage[split,makeindex]{splitidx}
 \usepackage[nottoc]{tocbibind}
 \usepackage[columns=3,totoc,indentunit=12pt,justific=raggedright,font=small,columnsep=.15in,unbalanced]{idxlayout}
-\usepackage{placeins}
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
@@ -147,6 +147,11 @@
 \setboolean{indexhl}{false}
 \newcommand{\IfIndexHl}[2]{\ifthenelse{\boolean{indexhl}}{#1}{#2}}
 
+\IfEbookSize{
+\usepackage[section]{placeins}
+}{
+\usepackage{placeins}
+}
 % Custom commands for index
 \newindex[API Index]{api} % index for API
 \newindex[People Name Index]{ppl} % index for People Name
@@ -176,11 +181,12 @@
 
 \IfTwoColumn{}{
   \setboolean{colorlinks}{true}
-  \renewcommand\footnotelayout{%
-    \advance\leftskip 0.0in
-    \advance\rightskip 0.7in
-  }
-}
+  \IfEbookSize{}{
+    \renewcommand\footnotelayout{%
+      \advance\leftskip 0.0in
+      \advance\rightskip 0.7in
+    }
+}}
 
 \IfColorLinks{
 \hypersetup{colorlinks=true,allcolors=MediumBlue}
@@ -202,7 +208,11 @@
 \renewcommand*\ttdefault{lmtt}
 %msfontstub
 
-\newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}
+\IfEbookSize{
+  \newcommand{\OneColumnHSpace}[1]{}
+}{
+  \newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}
+}
 
 \IfSansSerif{
 \renewcommand{\familydefault}{\sfdefault}
@@ -325,8 +335,9 @@
   \setlength{\twocolumnwidth}{3.125in}
   \IfEbookSize {
     % From https://tex.stackexchange.com/questions/16735/latex-options-for-kindle
-    \usepackage[papersize={4.5in,6.3in},margin=0.2in,onecolumn]{geometry}
+    \usepackage[papersize={4.5in,6.3in},margin=0.2in,onecolumn,twoside=false]{geometry}
     \sloppy
+    \setlength{\onecolumntextwidth}{4.1in}
     %\pagestyle{empty}
     %\usepackage[scaled]{helvet}
     %\renewcommand{\familydefault}{\sfdefault}
@@ -366,6 +377,30 @@
 \SetWatermarkVerCenter{.95\paperheight}
 }{}
 
+\IfEbookSize{
+\SetWatermarkHorCenter{.8\paperwidth}
+\SetWatermarkVerCenter{.99\paperheight}
+\newsavebox\ebbox
+\newcommand{\ebresizewidth}[1]{\resizebox{\textwidth}{!}{#1}}
+\newcommand{\ebresizewidthsw}[1]{\resizebox{.95\textheight}{!}{#1}}
+\newcommand{\ebresizeverb}[2]{%
+  \begin{lrbox}{\ebbox}%
+    \begin{varwidth}{\textwidth}%
+      {#2}%
+    \end{varwidth}%
+  \end{lrbox}%
+  \resizebox{#1\textwidth}{!}{\usebox{\ebbox}}%
+  \vspace*{-7pt}%
+}
+\newcommand\ebFloatBarrier{\FloatBarrier}
+}{
+\newcommand{\ebresizewidth}[1]{#1}
+\newcommand{\ebresizewidthsw}[1]{#1}
+\newcommand{\ebresizeverb}[2]{#2}
+\newcommand\ebFloatBarrier{}
+}
+
+
 \begin{document}
 
 %%HTMLSKIP
-- 
2.17.1


