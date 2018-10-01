Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kZYis15qBNJb+EIXHMFnXAkoQ9P7AwNGVC+jCwZSXB4=;
        b=lrVqvNAoqwcCLaN88VPwnepNfl0kinyPpSe187TQq9a5VS3v5lJDen3uzv5GNw82Qu
         IE1ysjwosTfvwzNT6nimW4evQyYX9QX9OlZMGVNParZvWKiaGVPORWL5LmDsH2vLCPeW
         TNNU0ZMTa2EaRrMTpnE92eBTJbTgltO+Hj5Wp3+udAyNoAYxxmNxiITJwEcOfOkgi4V/
         G1KayuNqYLhjMuSTDOIYPlKiof7HwXrRMbbJ9EN6163kkiNS+GenlfypcqoQkDaQ5M6f
         W2zFtk2iD1VJMtXg2TXLxcQZOCafwJ03i9mkMKPCVYATAwvLRaW5pGT4OAQiuYFEA7J/
         2thQ==
Subject: [PATCH 5/5] Makefile: Remove rules for QC section
References: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9ecd6c6c-9b41-fa43-9406-93465bc47336@gmail.com>
Date: Mon, 1 Oct 2018 22:56:32 +0900
MIME-Version: 1.0
In-Reply-To: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c545a33aea39aeae40bcff478285f814c32a4456 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 30 Sep 2018 18:36:32 +0900
Subject: [PATCH 5/5] Makefile: Remove rules for QC section

This patch effectively reverts commit 11bd603a8aae ("Makefile:
Reduce file size of figure generated from ibmqx2-labeled.svg").
The figure belonged to the QC section removed by commit
972946a5298a ("future/QC: Remove quantum-computing section").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .gitignore |  1 -
 Makefile   | 21 ++-------------------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/.gitignore b/.gitignore
index 1a40230..34bbb85 100644
--- a/.gitignore
+++ b/.gitignore
@@ -4,7 +4,6 @@
 *.dvi
 *.log
 *.pdf
-*.png
 *.qqz
 *.toc
 *.sav
diff --git a/Makefile b/Makefile
index 10d120d..c928c80 100644
--- a/Makefile
+++ b/Makefile
@@ -51,10 +51,7 @@ PDFTARGETS_OF_EPSOTHER := $(filter-out $(PDFTARGETS_OF_EPSORIG),$(PDFTARGETS_OF_
 BIBSOURCES := bib/*.bib alphapf.bst
 
 SVGSOURCES := $(wildcard */*.svg)
-SVG_LARGE_BITMAP := future/ibmqx2-labeled.svg
-PDFTARGETS_OF_SVG := $(filter-out $(SVG_LARGE_BITMAP:%.svg=%.pdf),$(SVGSOURCES:%.svg=%.pdf))
-PNGTARGETS_OF_SVG := $(SVG_LARGE_BITMAP:%.svg=%.png)
-TARGETS_OF_SVG :=  $(PDFTARGETS_OF_SVG) $(PNGTARGETS_OF_SVG)
+PDFTARGETS_OF_SVG := $(SVGSOURCES:%.svg=%.pdf)
 
 DOT := $(shell which dot 2>/dev/null)
 FIG2EPS := $(shell which fig2eps 2>/dev/null)
@@ -129,7 +126,7 @@ $(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES)
 autodate.tex: perfbook.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) $(SOURCES_OF_SNIPPET) utilities/fcvextract.pl
 	sh utilities/autodate.sh >autodate.tex
 
-perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(TARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
+perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
 ifndef LATEXPAND
 	$(error --> $@: latexpand not found. Please install it)
 endif
@@ -249,19 +246,6 @@ endif
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
 	@rm -f $<i
 
-$(PNGTARGETS_OF_SVG): %.png: %.svg
-	@echo "$< --> $@"
-ifndef INKSCAPE
-	$(error $< --> $@: inkscape not found. Please install it)
-endif
-ifeq ($(STEELFONTID),0)
-	@sh $(FIXSVGFONTS) < $< | sed -e 's/Steel City Comic/Test/g' > $<i
-else
-	@sh $(FIXSVGFONTS) < $< > $<i
-endif
-	@inkscape --export-dpi=200 --export-png=$@ $<i > /dev/null 2>&1
-	@rm -f $<i
-
 CodeSamples/snippets.d: $(SOURCES_OF_SNIPPET) $(GEN_SNIPPET_D)
 	sh ./utilities/gen_snippet_d.sh
 
@@ -310,7 +294,6 @@ clean:
 		-o -name '*.fcv' -o -name '*.ltms' | xargs rm -f
 	rm -f perfbook_flat.tex perfbook*.out perfbook-*.tex
 	rm -f $(LATEXGENERATED)
-	rm -f $(SVG_LARGE_BITMAP:%.svg=%.pdf) $(PNGTARGETS_OF_SVG)
 	rm -f extraction
 	rm -f CodeSamples/snippets.mk CodeSamples/snippets.d
 
-- 
2.7.4


