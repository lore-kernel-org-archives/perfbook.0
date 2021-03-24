Return-Path: <SRS0=LEX/=IW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cBN/9fMGK7VQZNQtKaQQF1PrngazFcys/iGIUERUxFI=;
        b=Aq5oXQbU0b5eQOxHJhtUESSKx/bA+z5X+yvEapK0xdJc+nun/72ezR586O0UHFeSon
         Tq6+VkMtC4l0HScD9F5aBXaUJhvhC4D96bqQK/eRuVY6mhMiHLMBvD4cDp0IE42gvSVV
         l13+FTMMEXRkGIMp+j5xDKsZhXB5SIsWD8vPFz1YR44XDLDPMJ/XfPXSUpqPrYmpy1le
         WDzaJNzbXy31mA+64DpCjNka/SiRkbQKYFBQv6VY3NKR3QUtvwhLRAOdTM4gftOzcWUJ
         BX8Z4DSAcKYSaNyx2ThSI5M/BaV0A7rCZZS1WJw/UDZqPIMf3Hlo7stwNIJS//aYGCWO
         C+1g==
Subject: [RFC PATCH 1/2] perfbook-lt: Add macro to shrink floats for ebook
References: <20210323010153.GH77072@balbir-desktop>
 <20210323052354.GS2696@paulmck-ThinkPad-P72>
 <20210323093822.GJ77072@balbir-desktop>
 <3a81ce2e-3c94-9609-b6a3-e4597425e838@gmail.com>
 <20210324011529.GK77072@balbir-desktop>
 <4b4a3289-9bd3-7f54-8d5b-6722d4d05e2b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4c78a483-8a15-7b18-db65-5883754be1f0@gmail.com>
Date: Wed, 24 Mar 2021 11:37:19 +0900
MIME-Version: 1.0
In-Reply-To: <4b4a3289-9bd3-7f54-8d5b-6722d4d05e2b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

\ebresizewidth{} is for table and figure.
\ebresizewidthsw{} is for sidewaystable.
\ebresizeverb{}{} is for code snippets.  1st argument specifies
shrink ratio.

These macro affect the ebook-size build (perfbook-er.pdf) only.

See subsequent changes for usage examples.

Also do minor cosmetic changes:

o Adjust position of commit/tag watermark closer to the bottom.
o Select onesided build for ebook readers.  By this change,
  chapters can start from both odd and even pages.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 42 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index a884011a..dc4da264 100644
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
@@ -176,11 +177,12 @@
 
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
@@ -202,7 +204,11 @@
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
@@ -325,8 +331,9 @@
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
@@ -366,6 +373,27 @@
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
+}
+}{
+\newcommand{\ebresizewidth}[1]{#1}
+\newcommand{\ebresizewidthsw}[1]{#1}
+\newcommand{\ebresizeverb}[2]{#2}
+}
+
+
 \begin{document}
 
 %%HTMLSKIP
-- 
2.17.1


