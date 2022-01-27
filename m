Return-Path: <SRS0=rWVQ=SL=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=7VHK2vz2B6mgMsD1tUJhAzRC2EYORTabImWY+urs8bA=;
        b=Ji66aP3blFzmSa7bMkzST9om2TXoFW2+3YCpuCLpWFpkXxyYNO09wqM4qhF2RWPoGo
         KODi6Siaktqnu0WX1MthHLY3RYDc0/WXnNHXX9SZcXp/Wj0uyWm8B5v1luFg47+hHSuf
         ZV0G8dc/g4n3d+teJh8PaUWczr80lZHRcZnDJtBi7puD7729DH1yeB1KGAtMKD5ptBPb
         63Zk239xwhaMCcLZSvVDMa0mO7crE9Kh8B3tM0qtv6KZcW2qxvvxL+46/VNRZVCueYTV
         ktu4RR96uKoX4qjMTJZ8n3wOnjTik+iHKDST/xu7bsqFQCAdTbMBcJwfFAoHtxunjt+E
         e4XA==
Message-ID: <b27908db-9717-5d37-12ea-05dda137dd55@gmail.com>
Date: Thu, 27 Jan 2022 10:51:25 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFT PATCH -perfbook] Enable parallel runs of pdflatex
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Parallel build of PDF figures and .fcv snippets by "make -jN" worked
when a single PDF target was given to "make", such as
"make neatfreak; make -j4 eb".
On the other hand, "make -j3 2c 1c eb" ended up in various errors
during parallel runs of pdflatex.

It turns out that the cause of the error is the \include{} commands
in appendix/appendix.tex and perfbook-lt.tex.
\include{} switches to its own .aux file, in this case,
appendix/questions.aux, appendix/toyrcu.aux, and so on.
As their names are common to different PDF targets, those .aux files
can be overwritten/corrupted by parallel runs of pdflatex.

\include{} implies \cleardoublepage both in front of and next to it.
In perfbook, included LaTeX sources have \chapter{} commands and
the implied page breaks are redundant.

By replacing \include{} with \input{}, parallel runs of pdflatex can
be enabled.

There were a couple of minor issues in Makefile WRT parallel runs of
runfirstlatex.sh.

When some of perfbook-xxx.tex files already existed, runfirstlatex.sh
for other main perfbook-yyy.tex could be invoked prematurely before
that .tex file was ready.

Fix it by adding stricter dependencies of perfbook-xxx.aux on
perfbook-xxx.tex.
Also remove some redundant dependencies around here.

Note: LATEXSOURCES contains perfbook-lt.tex

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

For quite a while, I was wondering why "make -j3 2c 1c eb"
didn't work as expected.

I think I have managed to get it work.

But changes in Makefile need extra testing.  Especially,
those involving parallelizing.

So I'd like you to give this a fair amount of testing before
pushing it.

        Thanks, Akira
--
 Makefile              | 6 +++---
 appendix/appendix.tex | 8 ++++----
 perfbook-lt.tex       | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 6ee849fd..9946be3a 100644
--- a/Makefile
+++ b/Makefile
@@ -222,14 +222,14 @@ $(PDFTARGETS): %.pdf: %.tex %.bbl
 $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
 	bibtex $(basename $@)
 
-$(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES) $(LST_SOURCES)
+$(PDFTARGETS:.pdf=.aux): %.aux: %.tex $(LATEXGENERATED) $(LST_SOURCES)
 ifeq ($(NEWTXTEXT),)
 	$(error Font package 'newtx' not found. See #9 in FAQ-BUILD.txt)
 endif
 	sh utilities/runfirstlatex.sh $(basename $@)
 
-autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) \
-    $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
+autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(PDFTARGETS_OF_EPS) \
+    $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
     $(GITREFSTAGS) utilities/autodate.sh
 	sh utilities/autodate.sh
 
diff --git a/appendix/appendix.tex b/appendix/appendix.tex
index f2640157..edcfe7ef 100644
--- a/appendix/appendix.tex
+++ b/appendix/appendix.tex
@@ -2,9 +2,9 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\include{appendix/questions/questions}
-\include{appendix/toyrcu/toyrcu}
-\include{appendix/whymb/whymemorybarriers}
-\include{appendix/styleguide/styleguide}
+\input{appendix/questions/questions}
+\input{appendix/toyrcu/toyrcu}
+\input{appendix/whymb/whymemorybarriers}
+\input{appendix/styleguide/styleguide}
 \renewcommand{\bottomtitlespace}{.08\textheight}
 \QuickQuizAnswers
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 085ce55d..d70dde66 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -667,12 +667,12 @@
 
 % Credits
 \setcounter{secnumdepth}{-1} % surpress section numbering in backmatter
-\include{ack}
+\input{ack}
 
 % Index if enabled
 \IfIndexOn{
 \IfIndexHier{
-\include{indexsee}
+\input{indexsee}
 }{}
 \phantomsection
 \IfEbookSize{

base-commit: f24ccfbd345eab8a70d6c08e71c84f18df46a3a1
-- 
2.17.1

