Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=q2uR5+Xb8oqrl7Gnwt8xWKkR1N0e2SFlB2iYlv4ScfE=;
 b=qalPqPCsLLoln/BipkI6Lq1C4HQ1ag+kjnyaLwLL5gH/3aMpwuIdUzEmqFHq5KBvTm
 ld9dCVClHnvnRjqZOju+HIx+P88nPoQqUyDVIFPxCdzoph6t6nOEUBi6r0gXzXUk5LIP
 kCUTkvXdiG+5r4nkhTq9MUxdY6WHIkQJsFaq/FCJHTJX+/I+7MdLLKbqESNbj4dmhxlT
 CaV/dUk0NgrNr6VRXXtirvtFPv8MtlfWcbYIXBhkxR+pMEQqmwzXuJsAaHwPNwhFWqBx
 qpPKJ0MIeYiHYgRv+yRS3aC5Yp26MbSw60IvYEPP3JYGgmJ7OK0Ot78uZI2Cf0mfuRSK
 SzKw==
Subject: [RFC PATCH 3/3] Makefile: Promote eps2pdf.sh to implicit rules
References: <be0f87e8-a39f-6c82-1946-46bacfcd6f66@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <addf9868-338a-b16e-f25c-46309d93861d@gmail.com>
Date: Sun, 5 Jun 2016 23:58:59 +0900
MIME-Version: 1.0
In-Reply-To: <be0f87e8-a39f-6c82-1946-46bacfcd6f66@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d6c5dc0374c6e558d0acc003273b42537e50297f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 5 Jun 2016 15:06:23 +0900
Subject: [RFC PATCH 3/3] Makefile: Promote eps2pdf.sh to implicit rules

In the first build or a build after removing '.pdf' files by
'make neatfreak' or 'make distclean', '.pdf' figures can be built
in parallel if the rules for '.eps' -> 'pdf' and '.svn' -> 'pdf'
are given in Makefile instead of shell scripts.

This commit adds what are done in utilities/eps2pdf.sh, etc. as
implicit rules in Makefile.
As the result of the change, empty target 'embedfonts' is removed.
Now 'make -j2' works fine despite several warnings of duplicated
targets. Those warnings will be taken care of by a later patch.

Note that as of this commit, '-jN' option is not guaranteed to always
work as expected.
It is safe to use it when you specify a single target.

Using '-jN' for multiple targets such as in 'make -j2 1c 2c', some
of the targets may fail to build depending on the timing of parallel
processing, supposedly due to interference of '.aux' files used by
'bibtex'.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 64 ++++++++++++++++++++++++++--------------------------------------
 1 file changed, 26 insertions(+), 38 deletions(-)

diff --git a/Makefile b/Makefile
index d842263..6acb341 100644
--- a/Makefile
+++ b/Makefile
@@ -26,42 +26,29 @@ LATEXSOURCES = \
 	together/*.tex \
 	toolsoftrade/*.tex

-EPSTARGETS_OF_TEX = \
+EPSSOURCES_FROM_TEX = \
 	SMPdesign/DiningPhilosopher5.eps \
 	SMPdesign/DiningPhilosopher5TB.eps \
 	SMPdesign/DiningPhilosopher4part-b.eps \
 	SMPdesign/DiningPhilosopher5PEM.eps

-EPSTARGETS_OF_DOT = \
+EPSSOURCES_FROM_DOT = \
 	advsync/store15tred.eps \
 	count/sig-theft.eps

 EPSSOURCES = \
-	SMPdesign/*.eps \
-	advsync/*.eps \
-	appendix/questions/*.eps \
-	appendix/whymb/*.eps \
-	count/*.eps \
-	cpu/*.eps \
-	datastruct/*.eps \
-	defer/*.eps \
-	easy/*.eps \
-	future/*.eps \
-	intro/*.eps \
-	locking/*.eps \
-	$(EPSTARGETS_OF_TEX) \
-	$(EPSTARGETS_OF_DOT)
+	$(wildcard */*.eps) \
+	$(wildcard */*/*.eps) \
+	$(EPSSOURCES_FROM_TEX) \
+	$(EPSSOURCES_FROM_DOT)
+
+PDFTARGETS_OF_EPS := $(EPSSOURCES:%.eps=%.pdf)

 BIBSOURCES = bib/*.bib

-SVGSOURCES = \
-	cartoons/*.svg \
-	debugging/*.svg \
-	count/*.svg \
-	SMPdesign/*.svg \
-	defer/*.svg \
-	datastruct/*.svg \
-	rt/*.svg
+SVGSOURCES = $(wildcard */*.svg)
+
+PDFTARGETS_OF_SVG := $(SVGSOURCES:%.svg=%.pdf)

 default = $(PERFBOOK_DEFAULT)

@@ -86,10 +73,10 @@ perfbook.pdf: perfbook.bbl
 perfbook.bbl: $(BIBSOURCES) perfbook.aux
 	bibtex perfbook

-perfbook.aux: $(LATEXSOURCES) extraction embedfonts
+perfbook.aux: $(LATEXSOURCES) extraction
 	sh utilities/runfirstlatex.sh perfbook

-perfbook_flat.tex qqz.tex: perfbook.tex $(LATEXSOURCES) $(EPSSOURCES) embedfonts
+perfbook_flat.tex qqz.tex: perfbook.tex $(LATEXSOURCES) $(EPSSOURCES) $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG)
 	echo > qqz.tex
 	texexpand perfbook.tex > perfbook_flat.tex
 	sh utilities/extractqqz.sh < perfbook_flat.tex > qqz.tex
@@ -99,12 +86,6 @@ extraction: perfbook_flat.tex
 	sh utilities/extractorigpub.sh < perfbook_flat.tex > origpub.tex
 	touch extraction

-embedfonts: $(EPSSOURCES) $(SVGSOURCES)
-	sh utilities/fixfigfonts.sh
-	sh utilities/fixdotfonts.sh
-	sh utilities/eps2pdf.sh
-	touch embedfonts
-
 perfbook-1c.pdf: perfbook-1c.tex perfbook-1c.bbl
 	sh utilities/runlatex.sh perfbook-1c

@@ -114,7 +95,7 @@ perfbook-1c.tex: perfbook.tex
 perfbook-1c.bbl: $(BIBSOURCES) perfbook-1c.aux
 	bibtex perfbook-1c

-perfbook-1c.aux: $(LATEXSOURCES) extraction embedfonts
+perfbook-1c.aux: $(LATEXSOURCES) extraction
 	sh utilities/runfirstlatex.sh perfbook-1c

 perfbook-hb.pdf: perfbook-hb.tex perfbook-hb.bbl
@@ -126,18 +107,25 @@ perfbook-hb.tex: perfbook.tex
 perfbook-hb.bbl: $(BIBSOURCES) perfbook-hb.aux
 	bibtex perfbook-hb

-perfbook-hb.aux: $(LATEXSOURCES) extraction embedfonts
+perfbook-hb.aux: $(LATEXSOURCES) extraction
 	sh utilities/runfirstlatex.sh perfbook-hb

 # Rules related to perfbook_html are removed as of May, 2016

-$(EPSTARGETS_OF_TEX): %.eps: %.tex
+$(EPSSOURCES_FROM_TEX): %.eps: %.tex
 	latex -output-directory=$(shell dirname $<) $<
 	dvips -Pdownload35 -E $(patsubst %.tex,%.dvi,$<) -o $@
 	sh utilities/fixanepsfonts.sh $@

-$(EPSTARGETS_OF_DOT): %.eps: %.dot
+$(EPSSOURCES_FROM_DOT): %.eps: %.dot
 	dot -Tps -o $@ $<
+	sh utilities/fixanepsfonts.sh $@
+
+$(PDFTARGETS_OF_EPS): %.pdf: %.eps
+	a2ping --below --hires --bboxfrom=compute-gs $< $@
+
+$(PDFTARGETS_OF_SVG): %.pdf: %.svg
+	inkscape --export-pdf=$@ $<

 clean:
 	find . -name '*.aux' -o -name '*.blg' \
@@ -146,11 +134,11 @@ clean:
 	rm -f perfbook_flat.tex perfbook.out perfbook-1c.out
 	rm -f qqz.tex
 	rm -f perfbook-hb.out perfbook-1c.tex perfbook-hb.tex
-	rm -f extraction embedfonts
+	rm -f extraction

 distclean: clean
 	sh utilities/cleanpdf.sh
-	rm -f $(EPSTARGETS_OF_DOT) $(EPSTARGETS_OF_TEX)
+	rm -f $(EPSSOURCES_FROM_DOT) $(EPSSOURCES_FROM_TEX)

 touchsvg:
 	find . -name '*.svg' | xargs touch
-- 
1.9.1


