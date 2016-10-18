Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=lOxR/nnzGRb8rH4zHE4hl/YK15/lLhVnooT9lDMJ7/k=;
 b=i3m+GIdo1A1wxt6hNjJ9KpsBl7f6YsolbQD5oAglIVgWDLofJ/44CFlbEN6j1w+BH5
 z1rhH3a7/Qhr+OO+NAVa/8aqRuqoI9E26Vg6jO32YWzcy35xE6yltz+05UHroCWDEcuQ
 fUjD9BW8wWtJxxY3jFHfzTh1GKKWZvCev/Vq3lox2b1BTemckrQpb4JXW1CMTP8MiC7r
 ZpuG2x314aitiqPe6Q2PWByDUvq3A7dv3+5EXFj5Htygm+h19MmIYYSadTrHFYEyytgl
 nYyblSkVzqdBrLUu3c8I3U9eCQnMCrdIbZii4UEPYwzDWBb8pUq64P7kcDDhh5fB3DTL
 qcHA==
Subject: [PATCH 4/6] Makefile: Add target '1csf' (one-column sans serif)
References: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c95b8c05-43d3-e036-2063-d6499fb09056@gmail.com>
Date: Wed, 19 Oct 2016 07:05:18 +0900
MIME-Version: 1.0
In-Reply-To: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From bfa3017cea4952b495aa706643a87b83ffd9637e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 10 Oct 2016 16:08:07 +0900
Subject: [PATCH 4/6] Makefile: Add target '1csf' (one-column sans serif)

Sans serif fonts are said to be easier to read on a (not high
definition) display than serif fonts.
Current perfbook-1c.pdf is supposed to be for such readers, but
is using serif font (Times Roman).
To try a sans serif font (Helvetica) version for one-column layout,
this commit adds a new boolean "sansserif" in the preamble and
a make target "1csf" that sets the boolean true.

Since the boolean is referred to in an earlier part of the preamble,
declarations of custom booleans are moved forward along with the
new boolean.

The result can not be said as optimal, but it is mostly good.
As for monospece font this commit uses "inconsolata", which is
mostly sans serif.
For epigraphs, Times Roman is used as before.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile     |  6 +++++-
 perfbook.tex | 33 ++++++++++++++++++++++-----------
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index de6cd0d..2ccce9d 100644
--- a/Makefile
+++ b/Makefile
@@ -9,7 +9,7 @@ LATEXSOURCES = \

 LATEXGENERATED = qqz.tex contrib.tex origpub.tex

-ABBREVTARGETS := 1c hb mss mstx msr msn msnt
+ABBREVTARGETS := 1c hb mss mstx msr msn msnt 1csf

 PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)

@@ -113,6 +113,10 @@ perfbook-msnt.tex: perfbook.tex
 	sed -e 's/usepackage{courier}/usepackage[zerostyle=a]{newtxtt}/' < $< > $@
 	@echo "## This target requires font package newtxtt. ##"

+perfbook-1csf.tex: perfbook-1c.tex
+	sed -e 's/setboolean{sansserif}{false}/setboolean{sansserif}{true}/' \
+	    -e 's/usepackage{courier}/usepackage[var0]{inconsolata}/' < $< > $@
+
 # Rules related to perfbook_html are removed as of May, 2016

 $(EPSSOURCES_FROM_TEX): %.eps: %.tex
diff --git a/perfbook.tex b/perfbook.tex
index f808c7f..0d6f08d 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -45,6 +45,27 @@
 \usepackage{qqz}
 \usepackage{origpub}

+% custom booleans
+
+\newboolean{inbook}
+\setboolean{inbook}{true}
+\newcommand{\IfInBook}[2]{\ifthenelse{\boolean{inbook}}{#1}{#2}}
+\newboolean{twocolumn}
+\setboolean{twocolumn}{true}
+\newcommand{\IfTwoColumn}[2]{\ifthenelse{\boolean{twocolumn}}{#1}{#2}}
+\newboolean{hardcover}
+\setboolean{hardcover}{false}
+\newcommand{\IfHardCover}[2]{\ifthenelse{\boolean{hardcover}}{#1}{#2}}
+\newboolean{sansserif}
+\setboolean{sansserif}{false}
+\newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}{#1}{#2}}
+
+\IfSansSerif{
+\renewcommand{\familydefault}{\sfdefault}
+\normalfont
+\usepackage[italic]{mathastext}
+}{}
+
 \begin{document}

 %%HTMLSKIP
@@ -69,7 +90,7 @@
 % ---  End of workaround for Fedora 23 Texlive bug
 \newcommand{\co}[1]{\lstinline[breaklines=true,breakatwhitespace=true]{#1}}
 \newcommand{\nbco}[1]{\lstinline[breaklines=false,breakatwhitespace=false]{#1}}
-\newcommand{\Epigraph}[2]{\epigraphhead[65]{\epigraph{#1}{#2}}}
+\newcommand{\Epigraph}[2]{\epigraphhead[65]{\rmfamily\epigraph{#1}{#2}}}

 \title{Is Parallel Programming Hard, And, If So, What Can You Do About It?}
 \author{
@@ -93,16 +114,6 @@
 \renewcommand\dbltopfraction{.75}
 \renewcommand\dblfloatpagefraction{.5}

-\newboolean{inbook}
-\setboolean{inbook}{true}
-\newcommand{\IfInBook}[2]{\ifthenelse{\boolean{inbook}}{#1}{#2}}
-\newboolean{twocolumn}
-\setboolean{twocolumn}{true}
-\newcommand{\IfTwoColumn}[2]{\ifthenelse{\boolean{twocolumn}}{#1}{#2}}
-\newboolean{hardcover}
-\setboolean{hardcover}{false}
-\newcommand{\IfHardCover}[2]{\ifthenelse{\boolean{hardcover}}{#1}{#2}}
-
 \IfTwoColumn{
 \setlength{\textheight}{8.25in}
 \setlength{\textwidth}{6.5in}
-- 
2.7.4


