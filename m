Return-Path: <SRS0=aoJh=3T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gui8MF3elB1Mo8Pc0J++//WWLxPUJ4YW9I1e+XaHLmM=;
        b=SmnEuitiZbbVm2LTFppEDlhwvOfpxxR2TshAe+g1OGXJIYRTL1wg24HV0GJuIhhfAI
         kUTZs2nOQ2Ek3dU5EVaC/nful2FwG7r+8sdjyMMVQLkOUUohhc+LuohXkd2E5N/MEm0Z
         JHi6kEomO/MnT0yokgZHQQHUDLpPzyE5Txh/pNRlT+ouFzDx5vFv9BS7YQmqLwAYqRhi
         RAVy5BhozhXu2yXOtj/Rlj2CDIbzT+GUnSbyHkU2ob9BRCYQTX032XRiuIwOD8vmJjqH
         2GcsZ5sVBkd10nXtLN24zzTgU6LlHhDhhHshZvKhpixpRm74Q+pHHn55AzLIOxq2Rueo
         8/0w==
Subject: [PATCH 6/6] Remove required version of 'epigraph'
References: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d87e0fb9-ec7c-aff9-649b-b7d4fd9fee22@gmail.com>
Date: Fri, 31 Jan 2020 07:45:16 +0900
MIME-Version: 1.0
In-Reply-To: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dc553b44983b30584d0f1003a729885b8b7290f2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 28 Jan 2020 00:46:52 +0900
Subject: [PATCH 6/6] Remove required version of 'epigraph'

It turned out that the up-to-date "epigraph" doesn't work well
with the "nowidow" package on TeX Live 2015/Debian (Ubuntu Xenial)
and TeX Live 2016.

Instead, suggest upgrade when the old version is detected and
TeX Live version is compatible with the up-to-date "epigraph"
package.

This permits TeX Live 2015/Debian (Ubuntu Xenial) to complete
the build with the older "epigraph".

Update FAQ-BUILD.txt accordingly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 28 +++++++++++++++++++++++-----
 Makefile      | 21 +++++++++++++++++++++
 perfbook.tex  |  2 +-
 3 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 98cfb57b..c0bc45aa 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -179,14 +179,13 @@
 			tlmgr install newtx
 
 10.	Building perfbook fails with a warning of buggy cleveref/listings,
-	version mismatch of titlesec/draftwatermark/epigraph/fvextra, or
-	missing fvextra. What can I do?
+	version mismatch of titlesec/draftwatermark/fvextra, or missing
+	fvextra. What can I do?
 
 	A.	They are known issues on Ubuntu Xenial (titlesec),
 		Ubuntu Bionic (cleveref), TeX Live 2014/2015 (listings),
 		TeX Live releases prior to 2015 (draftwatermark),
-		TeX Live releases prior to 2017 (fvextra),
-		and TeX Live releases prior to 2020 (epigraph).
+		and TeX Live releases prior to 2017 (fvextra).
 		This answer assumes Ubuntu, but it should work on other
 		distros.
 
@@ -195,7 +194,6 @@
 		http://mirrors.ctan.org/macros/latex/contrib/cleveref.zip
 		http://mirrors.ctan.org/macros/latex/contrib/listings.zip
 		http://mirrors.ctan.org/macros/latex/contrib/draftwatermark.zip
-		http://mirrors.ctan.org/macros/latex/contrib/epigraph.zip
 		http://mirrors.ctan.org/macros/latex/contrib/fvextra.zip
 
 	    2.	Install it by following instructions at:
@@ -257,3 +255,23 @@
 
 		"make neatfreak; make" will rebuild all the figures.
 		The "-jN" option should accelerate the rebuild.
+
+13	Building perfbook has succeeded, but I find some of the
+	epigraphs at bottom of columns/pages.
+	What can I do?
+
+	A.	A new version of "epigraph" package recently released
+		has resolved the issue. You can upgrade it by following
+		the instructions at #10 above.
+		The Up-to-date package can be downloaded from:
+		http://mirrors.ctan.org/macros/latex/contrib/fvextra.zip
+
+	    NOTE: On Tex Live 2015/Debian (Ubuntu Xenial) and TeX Live 2016,
+		the up-to-date "epigraph" does not work properly along
+		with the "nowidow" package.
+		If you'd really like to get rid of orphaned epigraphs,
+		upgrading TeX Live to 2017/Debian (Ubuntu Bionic) or
+		later is the way to go.
+		The updated "epigraph" package is expected to be
+		distributed in upstream TeX Live 2020 and Tex Live 2019/Debian
+		(Ubuntu Focal).
diff --git a/Makefile b/Makefile
index 3dbd5d53..d39ab571 100644
--- a/Makefile
+++ b/Makefile
@@ -129,6 +129,23 @@ LINEREF_ENV_END     = $(patsubst ./%,%,$(shell grep -R -l -F '\end{lineref}' .))
 LINELABEL_ENV = $(filter-out $(LINE_ENV_IGNORE),$(sort $(LINELABEL_ENV_BEGIN) $(LINELABEL_ENV_END)))
 LINEREF_ENV   = $(filter-out $(LINE_ENV_IGNORE),$(sort $(LINEREF_ENV_BEGIN) $(LINEREF_ENV_END)))
 
+OLD_EPIGRAPH := $(shell grep -c '2009/09/02' `kpsewhich epigraph.sty`)
+TEXLIVE_2015_DEBIAN := $(shell pdftex --version | grep -c 'TeX Live 2015/Debian')
+TEXLIVE_2016 := $(shell pdftex --version | grep -c 'TeX Live 2016')
+ifeq ($(OLD_EPIGRAPH),1)
+  ifeq ($(TEXLIVE_2015_DEBIAN),1)
+    SUGGEST_UPGRADE_EPIGRAPH := 0
+  else
+    ifeq ($(TEXLIVE_2016),1)
+      SUGGEST_UPGRADE_EPIGRAPH := 0
+    else
+      SUGGEST_UPGRADE_EPIGRAPH := 1
+    endif
+  endif
+else
+  SUGGEST_UPGRADE_EPIGRAPH := 0
+endif
+
 SOURCES_OF_SNIPPET_ALL := $(shell grep -R -l -F '\begin{snippet}' CodeSamples)
 SOURCES_OF_LITMUS      := $(shell grep -R -l -F '\begin[snippet]' CodeSamples)
 SOURCES_OF_LTMS        := $(patsubst %.litmus,%.ltms,$(SOURCES_OF_LITMUS))
@@ -167,6 +184,10 @@ mslmmsg:
 
 $(PDFTARGETS): %.pdf: %.tex %.bbl
 	sh utilities/runlatex.sh $(basename $@)
+ifeq ($(SUGGEST_UPGRADE_EPIGRAPH),1)
+	@echo "Consider upgrading 'epigraph' to prevent orphaned epigraphs."
+	@echo "See #13 in FAQ-BUILD.txt."
+endif
 
 $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
 	bibtex $(basename $@)
diff --git a/perfbook.tex b/perfbook.tex
index 87c1eaa1..30796c44 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -72,7 +72,7 @@
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
-\usepackage{epigraph}[2020/01/02] % latest version prevents orphaned epigraph
+\usepackage{epigraph}
 \setlength{\epigraphwidth}{2.6in}
 \usepackage[xspace]{ellipsis}
 \usepackage{braket} % for \ket{} macro in QC section
-- 
2.17.1


