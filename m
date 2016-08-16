Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=caHykC273Cg4vG/uYqrT2tp36zTLSrfwJBmL7J+V9SA=;
 b=d8AF2hdGNYjx+rA+AgwcXVo7+ubJYN53FmGa0ne2hRXkUOY7ucgJptoZxPAO4W6SNd
 6fCfBMNPOcYBIJsI4xLDt8+eCTGWcNellLND1oHvHnoxkK/WrRTPdpe/7gllO78+nqLb
 uZPKrQ90vaifAOzTTQ7CvrQUcLhKwRQjj9I/FZtGCE0BRi3bZB2IZC/RaGLYg4ABi2Ob
 vhy/DvCEYbh4taQKuzK0fZHfefBBu/z9gPKbZHQz+lzgzM6fKcG6YrM/uHuV2KVuS4G5
 U6Njc/wTVqfHoQarZHoN6gsic0Amis8WWYjSw61XkiiedPEM+ezSMexmCCReUA11OGIy
 WICw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Makefile: Remove empty target 'extraction'
Message-ID: <c752dd9e-4b36-93d4-af4f-ee769e529d21@gmail.com>
Date: Tue, 16 Aug 2016 20:17:40 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f224cf6d4b4fe21edd23d712a4b102396fa66755 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 16 Aug 2016 18:53:45 +0900
Subject: [PATCH] Makefile: Remove empty target 'extraction'

As commit 69523c880c9a ("Remove generated files contrib.tex and
origpub.tex from archive") removed files I called out as
necessary in commit 7f46bce80811 ("Makefile: Add comment on why
'extraction' is an empty target"), I noticed that the comment
added then was simply bogus.
We can safely remove the target "extraction" and define rules
for qqz.tex, contrib.tex, and origpug.tex in Makefile.

This commit adds those rules instead of target "extraction",
and removes the wrong comment.

"extraction" is intentionally left in the "clean" rule and
in .gitignore for the time being. They can be removed later,
say after the next release.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 41 ++++++++++++++---------------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/Makefile b/Makefile
index 60e8e96..570b79e 100644
--- a/Makefile
+++ b/Makefile
@@ -6,6 +6,8 @@ LATEXSOURCES = \
 	*/*.tex \
 	*/*/*.tex

+LATEXGENERATED = qqz.tex contrib.tex origpub.tex
+
 EPSSOURCES_FROM_TEX := \
 	SMPdesign/DiningPhilosopher5.eps \
 	SMPdesign/DiningPhilosopher5TB.eps \
@@ -68,18 +70,23 @@ perfbook.pdf: perfbook.bbl
 perfbook.bbl: $(BIBSOURCES) perfbook.aux
 	bibtex perfbook

-perfbook.aux: $(LATEXSOURCES) extraction
+perfbook.aux: $(LATEXSOURCES) $(LATEXGENERATED)
 	sh utilities/runfirstlatex.sh perfbook

-perfbook_flat.tex qqz.tex: perfbook.tex $(LATEXSOURCES) $(EPSSOURCES) $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG)
+perfbook_flat.tex: perfbook.tex $(LATEXSOURCES) $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG)
 	echo > qqz.tex
+	echo > contrib.tex
+	echo > origpub.tex
 	texexpand perfbook.tex > perfbook_flat.tex
+
+qqz.tex: perfbook_flat.tex
 	sh utilities/extractqqz.sh < perfbook_flat.tex > qqz.tex

-extraction: perfbook_flat.tex
+contrib.tex: perfbook_flat.tex qqz.tex
 	cat perfbook_flat.tex qqz.tex | sh utilities/extractcontrib.sh > contrib.tex
+
+origpub.tex: perfbook_flat.tex
 	sh utilities/extractorigpub.sh < perfbook_flat.tex > origpub.tex
-	touch extraction

 perfbook-1c.pdf: perfbook-1c.tex perfbook-1c.bbl
 	sh utilities/runlatex.sh perfbook-1c
@@ -90,7 +97,7 @@ perfbook-1c.tex: perfbook.tex
 perfbook-1c.bbl: $(BIBSOURCES) perfbook-1c.aux
 	bibtex perfbook-1c

-perfbook-1c.aux: $(LATEXSOURCES) extraction
+perfbook-1c.aux: $(LATEXSOURCES) $(LATEXGENERATED)
 	sh utilities/runfirstlatex.sh perfbook-1c

 perfbook-hb.pdf: perfbook-hb.tex perfbook-hb.bbl
@@ -102,7 +109,7 @@ perfbook-hb.tex: perfbook.tex
 perfbook-hb.bbl: $(BIBSOURCES) perfbook-hb.aux
 	bibtex perfbook-hb

-perfbook-hb.aux: $(LATEXSOURCES) extraction
+perfbook-hb.aux: $(LATEXSOURCES) $(LATEXGENERATED)
 	sh utilities/runfirstlatex.sh perfbook-hb

 # Rules related to perfbook_html are removed as of May, 2016
@@ -148,7 +155,7 @@ clean:
 		-o -name '*.dvi' -o -name '*.log' \
 		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' | xargs rm -f
 	rm -f perfbook_flat.tex perfbook.out perfbook-1c.out
-	rm -f qqz.tex
+	rm -f $(LATEXGENERATED)
 	rm -f perfbook-hb.out perfbook-1c.tex perfbook-hb.tex
 	rm -f extraction

@@ -165,23 +172,3 @@ ls-unused:
 neatfreak: distclean
 	# Don't forget to regenerate the .pdf from each .svg file
 	find . -name '*.pdf' | xargs rm -f
-
-# Note on why 'extraction' should be an empty target
-#
-# There are dependency loops around perfbook_flat.tex.
-# perfbook_flat.tex requires an empty qqz.tex and up-to-date
-# contrib.tex and origpub.tex for texexpand to work properly.
-#
-# Both contrib.tex and origpub.tex requires perfbook_flat.tex.
-# contrib.tex also requires up-to-date qqz.tex.
-#
-# So at first glance, rules for contrib.tex and origpub.tex
-# can be defined, but that requires 'extraction' to be a phony
-# target.
-#
-# 'extraction' is prerequisite for perfbook.aux.
-# If you make it a phony target, the rule for perfbook.aux is
-# always executed. That means runfirstlatex.run will run even
-# if no source file is updated.
-# To avoid the redundant run, we need to make 'extraction' an
-# empty target.
-- 
1.9.1

