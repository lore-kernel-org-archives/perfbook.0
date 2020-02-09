Return-Path: <SRS0=caq+=35=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Lzi2r0VBBkkgtdvJjpruuu0GOSk7SnLiC7XdLZ/c1i4=;
        b=mbsIqnim5W268aoNibvY9qpKrcSbf8jssctClMqykB1ZpYN62fPyuROoy4z92I6XWO
         UoMsebGJ82hCLCZOazSmkhMWuiGo8gILFtwuL0lR1rlH/7FGtkf01qwHF6y/sQVeDcrx
         iY2k3ujU8lYSqj9btO7D8UcoJGNVP4h1x+70oFz+OUHrxCsiGORJvJ6NTph+SpxjEmqq
         39rtUZkRdlgXJPWueZB5wjVRQ64RlXh872iEYGzeYCd4epKfKDA2na4wCOvS1/ByI2FW
         D3t7hultzi6vILGM16qe+woyc48GivyhLwnwEplR7hkIReACaBLzan9RI+r8sdBfc+MI
         Ggww==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] Revert "Remove required version of 'epigraph'"
Message-ID: <3cd61bd0-40a0-bb56-57aa-95422018e628@gmail.com>
Date: Sun, 9 Feb 2020 13:05:31 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3686a767517066f5212f97e2b2ac026c772af48f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 9 Feb 2020 07:38:12 +0900
Subject: [PATCH 1/2] Revert "Remove required version of 'epigraph'"

This reverts commit 4c6ee39761a0991e93f147151d71f965b2e433e0.

Now that TeX Live 2015/Debian with the up-to-date "epigraph" does
not suffer from the excessively wide vertical spaces, we can
revert commit 4c6ee39761a0 ("Remove required version of 'epigraph'")
and make the up-to-date epigraph mandatory.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 28 +++++-----------------------
 Makefile      | 21 ---------------------
 perfbook.tex  |  2 +-
 3 files changed, 6 insertions(+), 45 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 2eca5027..b8ad20d8 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -179,13 +179,14 @@
 			tlmgr install newtx
 
 10.	Building perfbook fails with a warning of buggy cleveref/listings,
-	version mismatch of titlesec/draftwatermark/fvextra, or missing
-	fvextra. What can I do?
+	version mismatch of titlesec/draftwatermark/epigraph/fvextra, or
+	missing fvextra. What can I do?
 
 	A.	They are known issues on Ubuntu Xenial (titlesec),
 		Ubuntu Bionic (cleveref), TeX Live 2014/2015 (listings),
 		TeX Live releases prior to 2015 (draftwatermark),
-		and TeX Live releases prior to 2017 (fvextra).
+		TeX Live releases prior to 2017 (fvextra),
+		and TeX Live releases prior to 2020 (epigraph).
 		This answer assumes Ubuntu, but it should work on other
 		distros.
 
@@ -194,6 +195,7 @@
 		http://mirrors.ctan.org/macros/latex/contrib/cleveref.zip
 		http://mirrors.ctan.org/macros/latex/contrib/listings.zip
 		http://mirrors.ctan.org/macros/latex/contrib/draftwatermark.zip
+		http://mirrors.ctan.org/macros/latex/contrib/epigraph.zip
 		http://mirrors.ctan.org/macros/latex/contrib/fvextra.zip
 
 	    2.	Install it by following instructions at:
@@ -255,23 +257,3 @@
 
 		"make neatfreak; make" will rebuild all the figures.
 		The "-jN" option should accelerate the rebuild.
-
-13	Building perfbook has succeeded, but I find some of the
-	epigraphs at bottom of columns/pages.
-	What can I do?
-
-	A.	A new version of "epigraph" package recently released
-		has resolved the issue. You can upgrade it by following
-		the instructions at #10 above.
-		The Up-to-date package can be downloaded from:
-		http://mirrors.ctan.org/macros/latex/contrib/epigraph.zip
-
-	    NOTE: On Tex Live 2015/Debian (Ubuntu Xenial) and TeX Live 2016,
-		the up-to-date "epigraph" does not work properly along
-		with the "nowidow" package.
-		If you'd really like to get rid of orphaned epigraphs,
-		upgrading TeX Live to 2017/Debian (Ubuntu Bionic) or
-		later is the way to go.
-		The updated "epigraph" package is expected to be
-		distributed in upstream TeX Live 2020 and Tex Live 2019/Debian
-		(Ubuntu Focal).
diff --git a/Makefile b/Makefile
index 6f8417f3..ccc840be 100644
--- a/Makefile
+++ b/Makefile
@@ -131,23 +131,6 @@ LINEREF_ENV_END     := $(shell grep -l -F '\end{lineref}'     $(LATEXSOURCES))
 LINELABEL_ENV := $(sort $(LINELABEL_ENV_BEGIN) $(LINELABEL_ENV_END))
 LINEREF_ENV   := $(sort $(LINEREF_ENV_BEGIN) $(LINEREF_ENV_END))
 
-OLD_EPIGRAPH := $(shell grep -c '2009/09/02' `kpsewhich epigraph.sty`)
-TEXLIVE_2015_DEBIAN := $(shell pdftex --version | grep -c 'TeX Live 2015/Debian')
-TEXLIVE_2016 := $(shell pdftex --version | grep -c 'TeX Live 2016')
-ifeq ($(OLD_EPIGRAPH),1)
-  ifeq ($(TEXLIVE_2015_DEBIAN),1)
-    SUGGEST_UPGRADE_EPIGRAPH := 0
-  else
-    ifeq ($(TEXLIVE_2016),1)
-      SUGGEST_UPGRADE_EPIGRAPH := 0
-    else
-      SUGGEST_UPGRADE_EPIGRAPH := 1
-    endif
-  endif
-else
-  SUGGEST_UPGRADE_EPIGRAPH := 0
-endif
-
 SOURCES_OF_SNIPPET_ALL := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
 SOURCES_OF_LITMUS      := $(shell grep -r -l -F '\begin[snippet]' CodeSamples)
 SOURCES_OF_LTMS        := $(patsubst %.litmus,%.ltms,$(SOURCES_OF_LITMUS))
@@ -186,10 +169,6 @@ mslmmsg:
 
 $(PDFTARGETS): %.pdf: %.tex %.bbl
 	sh utilities/runlatex.sh $(basename $@)
-ifeq ($(SUGGEST_UPGRADE_EPIGRAPH),1)
-	@echo "Consider upgrading 'epigraph' to prevent orphaned epigraphs."
-	@echo "See #13 in FAQ-BUILD.txt."
-endif
 
 $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
 	bibtex $(basename $@)
diff --git a/perfbook.tex b/perfbook.tex
index 30796c44..87c1eaa1 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -72,7 +72,7 @@
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
-\usepackage{epigraph}
+\usepackage{epigraph}[2020/01/02] % latest version prevents orphaned epigraph
 \setlength{\epigraphwidth}{2.6in}
 \usepackage[xspace]{ellipsis}
 \usepackage{braket} % for \ket{} macro in QC section
-- 
2.17.1

