Return-Path: <SRS0=g3Xn=UV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hGwyFDGe+xGmcxyejyhV2mz+Hd8FIRJ3HxWep9pk3bc=;
        b=i17GN7CnCqQzuay25ztclMZcdzy32vGbORn9QM+di0qUGyU9UGSdyKHknwQ9gacemW
         7yblQ+wxUHjWQN3T7atZN9FRE9gI/bTdISFLijMptqs1k36GMlc0Yp2Ane1WINAtFIF+
         Py0fORKOoyW38sm0QmZLN7Ll1dYQys76+kr0Wg0uvW1YHiZmp8nY/o4iVioaBF1hZSUi
         DWXZNFaFr7wrkEA51Hm6mTGUQyB8w4VycYJsFWybdcHgBwkXDZocpI2oFYt2Ey/v+t9M
         UibvVHjnJY8ZKJmJwVpQ4OcYy+HLJAQroFLwTAHslkvfdu+6Z65hgk7N8WeECXMZcR4M
         f9PA==
Message-ID: <af3d935c-da9e-6303-efc8-946ba12aa008@gmail.com>
Date: Mon, 11 Apr 2022 16:59:44 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 4/7] run{first}latex.sh: Use variable for 'pdflatex'
 command
Content-Language: en-US
References: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In testing a dev version of upstream LaTeX, "pdflatex-dev" is used
in place of "pdflatex".

Using a variable named "LATEX", whose default is pdflatex, in the
scripts helps in such cases.

Update Makefile as well so that the dev version can be specified
as follows:

    make LATEX=pdflatex-dev

Note 1: The trick for setting a default value to a shell variable
using ":" is borrowed from an answer in unix.stackexchange.com:

    https://unix.stackexchange.com/questions/122845/

Note 2: To keep the test of utilities/parallel-latex-regress.sh
working, make copies of the scripts before this change as
utilities/run{first}latex.2022.01.25.sh.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile                              |   5 +-
 Makefile.2022.01.25                   |   4 +-
 utilities/runfirstlatex.2022.01.25.sh |  98 +++++++++++++++
 utilities/runfirstlatex.sh            |   6 +-
 utilities/runlatex.2022.01.25.sh      | 164 ++++++++++++++++++++++++++
 utilities/runlatex.sh                 |  12 +-
 6 files changed, 278 insertions(+), 11 deletions(-)
 create mode 100644 utilities/runfirstlatex.2022.01.25.sh
 create mode 100644 utilities/runlatex.2022.01.25.sh

diff --git a/Makefile b/Makefile
index fb899fa0..4ab54130 100644
--- a/Makefile
+++ b/Makefile
@@ -1,4 +1,5 @@
 SHELL = /bin/bash
+LATEX ?= pdflatex
 
 GITREFSTAGS := $(shell ls -d .git/refs/tags 2>/dev/null)
 
@@ -224,7 +225,7 @@ qqmsg: perfbook.pdf
 	@echo "built as perfbook.pdf."
 
 $(PDFTARGETS): %.pdf: %.tex %.bbl
-	sh utilities/runlatex.sh $(basename $@)
+	LATEX=$(LATEX) sh utilities/runlatex.sh $(basename $@)
 
 $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
 	bibtex $(basename $@)
@@ -233,7 +234,7 @@ $(PDFTARGETS:.pdf=.aux): %.aux: %.tex $(LATEXGENERATED)
 ifeq ($(NEWTXTEXT),)
 	$(error Font package 'newtx' not found. See #9 in FAQ-BUILD.txt)
 endif
-	sh utilities/runfirstlatex.sh $(basename $@)
+	LATEX=$(LATEX) sh utilities/runfirstlatex.sh $(basename $@)
 
 autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(LST_SOURCES) \
     $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
diff --git a/Makefile.2022.01.25 b/Makefile.2022.01.25
index 6ee849fd..9e4b7ecd 100644
--- a/Makefile.2022.01.25
+++ b/Makefile.2022.01.25
@@ -217,7 +217,7 @@ qqmsg: perfbook.pdf
 	@echo "built as perfbook.pdf."
 
 $(PDFTARGETS): %.pdf: %.tex %.bbl
-	sh utilities/runlatex.sh $(basename $@)
+	sh utilities/runlatex.2022.01.25.sh $(basename $@)
 
 $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
 	bibtex $(basename $@)
@@ -226,7 +226,7 @@ $(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES) $(LST_SOURCES)
 ifeq ($(NEWTXTEXT),)
 	$(error Font package 'newtx' not found. See #9 in FAQ-BUILD.txt)
 endif
-	sh utilities/runfirstlatex.sh $(basename $@)
+	sh utilities/runfirstlatex.2022.01.25.sh $(basename $@)
 
 autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) \
     $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
diff --git a/utilities/runfirstlatex.2022.01.25.sh b/utilities/runfirstlatex.2022.01.25.sh
new file mode 100644
index 00000000..81b66dc3
--- /dev/null
+++ b/utilities/runfirstlatex.2022.01.25.sh
@@ -0,0 +1,98 @@
+#!/bin/sh
+#
+# Run the first round of pdflatex.
+# It is assumed to be used together with runlatex.sh and invoked from
+# 'make' command.
+#
+# Usage: sh runfirstlatex.sh file[.tex]
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, you can access it online at
+# http://www.gnu.org/licenses/gpl-2.0.html.
+#
+# Copyright (C) IBM Corporation, 2012-2019
+# Copyright (C) Facebook, 2019
+# Copyright (C) Akira Yokosawa, 2016
+#
+# Authors: Paul E. McKenney <paulmck@us.ibm.com>
+#          Akira Yokosawa <akiyks@gmail.com>
+#
+# Saved as of 2022.01.25 for regression testing.
+
+if test -z "$1"
+then
+	echo No latex file specified, aborting.
+	exit 1
+fi
+
+if ! sh utilities/mpostcheck.sh
+then
+	exit 1
+fi
+
+# newtx font package version check (newer or equal to Ubuntu 14.04)
+NEWTXTEXT=`kpsewhich newtxtext.sty`
+NEWTXTEXT_DATE=`grep filedate $NEWTXTEXT | grep -o -E "[/0-9]*"`
+# We need TeX Live 2013/Debian (Ubuntu 14.04) or later
+if [ "$NEWTXTEXT_DATE" \< "2014/02/12" ]
+then
+	echo "############################################################"
+	echo "### Old version of font package 'newtx' is detected.     ###"
+	echo "### You need to upgrade your TeX Live installation.      ###"
+	echo "### See item 9 in FAQ-BUILD.txt for further info.        ###"
+	echo "############################################################"
+	exit 1
+fi
+
+DETECTED_BUGGY=0
+# listings package version check (TeX Live 2014 and 2015 had buggy ones)
+if grep -F "fileversion" `kpsewhich listings.sty` | grep -q -E "1.5[cde]"
+then
+	echo "############################################################"
+	echo "### Buggy version of LaTeX package 'listings' detected!! ###"
+	echo "### (Known issue in TeX Live 2014 and 2015)              ###"
+	echo "### Please install a latest version.                     ###"
+	echo "### See item 10 in FAQ-BUILD.txt for further info.       ###"
+	echo "############################################################"
+	DETECTED_BUGGY=1
+fi
+
+basename=`echo $1 | sed -e 's/\.tex$//'`
+
+echo "pdflatex 1 for $basename.pdf"
+pdflatex $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null || :
+if grep -q 'LaTeX Warning: You have requested' $basename.log
+then
+	grep -A 4 'LaTeX Warning: You have requested' $basename.log
+	echo "### Incompatible package(s) detected. See $basename.log for details. ###"
+	echo "### See items 9 and 10 in FAQ-BUILD.txt for how to update.          ###"
+	exit 1
+fi
+if [ $DETECTED_BUGGY -eq 1 ]; then
+	exit 1
+fi
+if grep -q '! Emergency stop.' $basename.log
+then
+	grep -B 15 -A 5 '! Emergency stop.' $basename.log
+	echo "----- Fatal latex error, see $basename.log for details. -----"
+	exit 1
+fi
+if grep -q '!pdfTeX error:' $basename.log
+then
+	grep -A 2 '!pdfTeX error:' $basename.log
+	echo "----- Fatal latex error, see $basename.log for details. -----"
+	exit 1
+fi
+grep 'LaTeX Warning:' $basename.log > $basename-warning.log
+touch $basename-first.log
+exit 0
diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index 22bafc2a..f5504f88 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -67,8 +67,10 @@ fi
 
 basename=`echo $1 | sed -e 's/\.tex$//'`
 
-echo "pdflatex 1 for $basename.pdf"
-pdflatex $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null || :
+: ${LATEX:-pdflatex}
+
+echo "$LATEX 1 for $basename.pdf"
+$LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null || :
 if grep -q 'LaTeX Warning: You have requested' $basename.log
 then
 	grep -A 4 'LaTeX Warning: You have requested' $basename.log
diff --git a/utilities/runlatex.2022.01.25.sh b/utilities/runlatex.2022.01.25.sh
new file mode 100644
index 00000000..22aca75f
--- /dev/null
+++ b/utilities/runlatex.2022.01.25.sh
@@ -0,0 +1,164 @@
+#!/bin/sh
+#
+# Run pdflatex on the specified file.
+# Attempt to avoid useless repeats.
+# This version is heavily customized to be used for perfbook.
+# It is assumed to be used together with runfirstlatex.sh
+# and Makefile of perfbook.
+#
+# Usage: sh runlatex.sh file[.tex]
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, you can access it online at
+# http://www.gnu.org/licenses/gpl-2.0.html.
+#
+# Copyright (C) IBM Corporation, 2012-2019
+# Copyright (C) Facebook, 2019
+# Copyright (C) Akira Yokosawa, 2016, 2017
+#
+# Authors: Paul E. McKenney <paulmck@us.ibm.com>
+#          Akira Yokosawa <akiyks@gmail.com>
+#
+# Saved as of 2022.01.25 for regression testing.
+
+diff_warning () {
+	if diff -q $basename-warning.log $basename-warning-prev.log >/dev/null
+	then
+		echo "No more improvement is expected, giving up."
+		return 0 ;
+	else
+#		echo "Some improvements are observed, continuing."
+		return 1 ;
+	fi
+}
+
+identical_warnings () {
+	if test -r $basename-warning-prev.log
+	then
+		if test "$iter" -gt "$min_iter" && diff_warning
+		then
+			return 0 ;
+		fi
+	fi
+	return 1 ;
+}
+
+exerpt_warnings () {
+	if grep -q "LaTeX Warning:" $basename.log
+	then
+		echo "----- Excerpt around remaining warning messages -----"
+		grep -B 8 -A 5 "LaTeX Warning:" $basename.log | tee $basename-warning.log
+		echo "----- You can see $basename-warning.log for the warnings above. -----"
+		echo "----- If you need to, see $basename.log for details. -----"
+		rm -f $basename-warning-prev.log
+		exit 1
+	fi
+}
+
+iterate_latex () {
+	perl utilities/adjustindexformat.pl $basename.idx > $basename-adjust.idx
+	cp -f $basename-adjust.idx $basename.idx
+	makeindex $basename.idx > /dev/null 2>&1
+	makeindex $basename-api.idx > /dev/null 2>&1
+	if grep -q '## Warning' $basename.ilg $basename-api.ilg
+	then
+		echo "----- Warning in makeindex, see .ilg log files. -----"
+		exit 1
+	fi
+	makeglossaries $basename > /dev/null 2>&1
+	pdflatex $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null || :
+	if grep -q '! Emergency stop.' $basename.log
+	then
+		grep -B 15 -A 5 '! Emergency stop.' $basename.log
+		echo "----- Fatal latex error, see $basename.log for details. -----"
+		exit 1
+	fi
+	if grep -q '!pdfTeX error:' $basename.log
+	then
+		grep -A 2 '!pdfTeX error:' $basename.log
+		echo "----- Fatal latex error, see $basename.log for details. -----"
+		exit 1
+	fi
+	if test -r $basename-warning.log
+	then
+		mv -f $basename-warning.log $basename-warning-prev.log
+	fi
+	grep 'LaTeX Warning:' $basename.log > $basename-warning.log
+	return 0 ;
+}
+
+if test -z "$1"
+then
+	echo No latex file specified, aborting.
+	exit 1
+fi
+
+basename=`echo $1 | sed -e 's/\.tex$//'`
+
+if ! test -r $basename-first.log
+then
+	echo "No need to update aux and bbl files."
+	echo "pdflatex 1 for $basename.pdf"
+	iter=1
+else
+	rm -f $basename-first.log
+	echo "pdflatex 2 for $basename.pdf # for possible bib update"
+	iter=2
+fi
+iterate_latex
+min_iter=2
+while grep -q 'LaTeX Warning: There were undefined references' $basename.log
+do
+	if test $undefined_refs
+	then
+		echo "Undefined refs remain, giving up."
+		exerpt_warnings
+	fi
+	if identical_warnings
+	then
+		break
+	fi
+	iter=`expr $iter + 1`
+	echo "pdflatex $iter for $basename.pdf # remaining undefined refs"
+	undefined_refs=1
+	iterate_latex
+done
+min_iter=3
+while grep -q 'LaTeX Warning: Label(s) may have changed' $basename.log
+do
+	if identical_warnings
+	then
+		break
+	fi
+	iter=`expr $iter + 1`
+	echo "pdflatex $iter for $basename.pdf # label(s) may have changed"
+	iterate_latex
+done
+exerpt_warnings
+rm -f $basename-warning.log $basename-warning-prev.log
+echo "'$basename.pdf' is ready."
+# cleveref version check (Ubuntu 18.04 LTS has buggy one
+if grep -q -F "packageversion{0.21.1}" `kpsewhich cleveref.sty`
+then
+	echo "############################################################"
+	echo "### Buggy version of LaTeX package 'cleveref' detected!! ###"
+	echo "### (Known issue on Ubuntu 18.04 LTS)                    ###"
+	echo "### Please consider installing a stable version.         ###"
+	echo "### See item 10 in FAQ-BUILD.txt for further info.       ###"
+	echo "############################################################"
+fi
+# to avoid redundant run of bibtex and pdflatex
+touch $basename.bbl
+touch $basename.pdf
+sh utilities/mpostcheck.sh
+exit 0
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 48761fd0..db196ad2 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -29,6 +29,8 @@
 # Authors: Paul E. McKenney <paulmck@us.ibm.com>
 #          Akira Yokosawa <akiyks@gmail.com>
 
+: ${LATEX:-pdflatex}
+
 diff_warning () {
 	if diff -q $basename-warning.log $basename-warning-prev.log >/dev/null
 	then
@@ -74,7 +76,7 @@ iterate_latex () {
 		exit 1
 	fi
 	makeglossaries $basename > /dev/null 2>&1
-	pdflatex $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null || :
+	$LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null || :
 	if grep -q '! Emergency stop.' $basename.log
 	then
 		grep -B 15 -A 5 '! Emergency stop.' $basename.log
@@ -106,11 +108,11 @@ basename=`echo $1 | sed -e 's/\.tex$//'`
 if ! test -r $basename-first.log
 then
 	echo "No need to update aux and bbl files."
-	echo "pdflatex 1 for $basename.pdf"
+	echo "$LATEX 1 for $basename.pdf"
 	iter=1
 else
 	rm -f $basename-first.log
-	echo "pdflatex 2 for $basename.pdf # for possible bib update"
+	echo "$LATEX 2 for $basename.pdf # for possible bib update"
 	iter=2
 fi
 iterate_latex
@@ -127,7 +129,7 @@ do
 		break
 	fi
 	iter=`expr $iter + 1`
-	echo "pdflatex $iter for $basename.pdf # remaining undefined refs"
+	echo "$LATEX $iter for $basename.pdf # remaining undefined refs"
 	undefined_refs=1
 	iterate_latex
 done
@@ -139,7 +141,7 @@ do
 		break
 	fi
 	iter=`expr $iter + 1`
-	echo "pdflatex $iter for $basename.pdf # label(s) may have changed"
+	echo "$LATEX $iter for $basename.pdf # label(s) may have changed"
 	iterate_latex
 done
 exerpt_warnings
-- 
2.25.1


