Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=dp2l4blQmzDRmHZY/ROyZLCawFVTWEAdoVy9Sq9YhWU=;
        b=MoD39Fak33Pb1SSyANA9cb2GUNmDx45ca2NAlxZY+kR7Qrr6Slv5LDJHAfataeC6Rr
         EsbnDCu9sai0EoBsii9FJESBNHMOIBijXUw6QUxhRLGb8HeUj20pdmYgDXkWzXjqp2Qi
         RH+mnw3eqpWYROvqJ0eqtwQBjhcT0sIJ18wYf50wkXBTm42iQrwtZafRpVuyddPpETlh
         oRkb9KalEzNzvfCfK10ITrGpvOB6me9GTlu44ZXOHGHibpRM9t8W3mgZsqzxTyolMMO3
         r2n+Cg+r17Sks7q4gVfH248c8R54E4vSpiQOAZTmgAF5O7aPb4x27qBnE4Pn41wrFnaf
         6uuA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] Makefile: Automate OBSOLETE_FILES definition
Message-ID: <91c8ec61-e42c-9768-150f-39db5ac2280d@gmail.com>
Date: Tue, 15 Jan 2019 07:24:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 96dd811c7e084d97cbf4ef3b4b3f68099f6e15eb Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 15 Jan 2019 07:10:15 +0900
Subject: [PATCH 1/2] Makefile: Automate OBSOLETE_FILES definition

Commit 2da175371873 ('defer/rcu: Rework "Introduction to RCU"')
obsoleted .eps files used to be generated from the removed .fig
files. Instead of manually updating the variable in Makefile,
automate the definition of OBSOLETE_FILES for replacements of
".fig -> .svg".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 79ccd99..b76eea0 100644
--- a/Makefile
+++ b/Makefile
@@ -12,7 +12,6 @@ LATEXSOURCES = \
 	*/*/*.tex
 
 LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex
-OBSOLETE_FILES = intro/PPGrelation.eps extraction
 
 ABBREVTARGETS := tcb 1c hb msns mss mstx msr msn msnt 1csf
 
@@ -32,6 +31,12 @@ FIGSOURCES := $(wildcard */*.fig) $(wildcard */*/*.fig)
 
 EPSSOURCES_FROM_FIG := $(FIGSOURCES:%.fig=%.eps)
 
+SVGSOURCES := $(wildcard */*.svg)
+FAKE_EPS_FROM_SVG := $(SVGSOURCES:%.svg=%.eps)
+PDFTARGETS_OF_SVG := $(SVGSOURCES:%.svg=%.pdf)
+
+OBSOLETE_FILES = extraction $(FAKE_EPS_FROM_SVG)
+
 EPSSOURCES_DUP := \
 	$(wildcard */*.eps) \
 	$(wildcard */*/*.eps) \
@@ -51,9 +56,6 @@ PDFTARGETS_OF_EPSOTHER := $(filter-out $(PDFTARGETS_OF_EPSORIG),$(PDFTARGETS_OF_
 
 BIBSOURCES := bib/*.bib alphapf.bst
 
-SVGSOURCES := $(wildcard */*.svg)
-PDFTARGETS_OF_SVG := $(SVGSOURCES:%.svg=%.pdf)
-
 DOT := $(shell which dot 2>/dev/null)
 FIG2EPS := $(shell which fig2eps 2>/dev/null)
 A2PING := $(shell which a2ping 2>/dev/null)
@@ -294,8 +296,9 @@ clean:
 		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' \
 		-o -name '*.fcv' -o -name '*.ltms' | xargs rm -f
 	rm -f perfbook_flat.tex perfbook*.out perfbook-*.tex
-	rm -f $(LATEXGENERATED) $(OBSOLETE_FILES)
+	rm -f $(LATEXGENERATED)
 	rm -f CodeSamples/snippets.mk CodeSamples/snippets.d
+	@rm -f $(OBSOLETE_FILES)
 
 distclean: clean
 	sh utilities/cleanpdf.sh
-- 
2.7.4

