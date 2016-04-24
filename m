Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=zjUDzSSBcQ35q5nonxB719e2yUk0bREOpOOkOj8PtpU=;
 b=NnhuFskNb+Wcst873xYWg46kLQKgSI8P9Q13eTBKJ/lqhqgRVORchfqTF9s8UXH2uV
 ODaI364UbiRlVvccmX/sxRl/nrBbyghFPhgPen4TYZsnBkRCYt8x//FuO7t74VENHo3u
 Cgc0hwmomO6ZXCgRrjH+BtoGeZkRfh2G7ZSAJn/Cx8XP3Iu7lm7tcn40Je1cZJbH8Xel
 2hObe2oq3q1XG4l8U/BW0DRIiZlo5FDttx9E6iwjDWIkVcnbNWMrlIdOVvLhlbdLW30u
 tDdpk39MuUenkClRUHDDfkx7pelbTxHmd3ehS4y5pYhpv3uksK/QCZ13jI+iTGZwhv+4
 JXHA==
Subject: [PATCH v3 2/3] Improve behavior of build scripts
References: <571C1843.1060906@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <571C1CF9.5000803@gmail.com>
Date: Sun, 24 Apr 2016 10:10:17 +0900
MIME-Version: 1.0
In-Reply-To: <571C1843.1060906@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From bda40978aed2cdd9bd0a52bd7a9c43e149a011b4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Sun, 24 Apr 2016 09:02:50 +0900
Subject: [PATCH v3 2/3] Improve behavior of build scripts

This commit takes care of the possible increase of pdflatex
iterations introduced by the previous commit ("qqz: Improve
accuracy of cross-links") that would cause 'make' to terminate
prematurely. The same issue seems to have been observed since
commit 33b93f8258f5 ("qqz: Cross-link questions and answers").
However, no one has attempted to fix it because a final PDF can
be obtained by just repeating 'make' again.

To fix the issue, this commit refactors 'runlinux.sh' into 3 parts.

1) bibtex related part is moved to 'Makefile' as rules for targets
such as 'perfbook.bbl'. It also adds necessary rules which support
the '.bbl' rules.

2) 'runfirstlatex.sh' is separated so that it can be invoked in
rules for '.aux' targets which support '.bbl' rules.

3) 'runlatex.sh' is intensively modified. The first while loop
watches the 'LaTeX Warning: There were undefined references'
message and the second one watches the 'LaTeX Warning: Label(s)
may have changed' message.
The loops watch the variation in 'LaTeX Warning:" lines in
$basename.log and when they find no change, they will give up.
Note that in early rounds of the loop, there may be cases when
there is no change in 'LaTeX Warning' messages while there
is still room for improvement. To accommodate this, giving-up
will fire only after a certain number of iterations for each loop.
Since the minimum iteration numbers are chosen after trial and
error, they might need to be changed in the future.

For each round of the loop, a message representing which warning
is being watched is displayed.
When the giving-up logic kicks in, grep of the remaining warnings
is also displayed.

'$basename-first.log', '$basename-warning.log' and
'$basename-warning-prev.log' files are used to track things.
They are removed when the build succeeds.

This commit also updates the copyright notices in the scripts.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 Makefile                   | 54 ++++++++++++++++++++++++-----
 utilities/runfirstlatex.sh | 46 +++++++++++++++++++++++++
 utilities/runlatex.sh      | 85 +++++++++++++++++++++++++++++++++++-----------
 3 files changed, 158 insertions(+), 27 deletions(-)
 create mode 100644 utilities/runfirstlatex.sh

diff --git a/Makefile b/Makefile
index 9eeaa16..d96bc46 100644
--- a/Makefile
+++ b/Makefile
@@ -145,18 +145,56 @@ EPSSOURCES = \
 	locking/NonLocalLockHierarchy.eps \
 	locking/rnplock.eps

+BIBSOURCES = \
+	bib/OSS.bib \
+	bib/RCU.bib \
+	bib/RCUuses.bib \
+	bib/TM.bib \
+	bib/WFS.bib \
+	bib/energy.bib \
+	bib/hw.bib \
+	bib/maze.bib \
+	bib/os.bib \
+	bib/parallelsys.bib \
+	bib/patterns.bib \
+	bib/perfmeas.bib \
+	bib/realtime.bib \
+	bib/refs.bib \
+	bib/search.bib \
+	bib/standards.bib\
+	bib/swtools.bib \
+	bib/syncrefs.bib
+
 all: perfbook.pdf

-perfbook.pdf: $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
-	sh utilities/runlatex.sh perfbook bib
+perfbook.pdf: perfbook.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
+	sh utilities/runlatex.sh perfbook
+
+perfbook.bbl: $(BIBSOURCES) perfbook.aux
+	bibtex perfbook

-perfbook-1c.pdf: $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
+perfbook.aux: $(LATEXSOURCES) $(EPSSOURCES)
+	sh utilities/runfirstlatex.sh perfbook
+
+perfbook-1c.pdf: perfbook-1c.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
 	sed -e 's/,twocolumn//' -e '/^\\frontmatter/a \\\\pagestyle{plain}' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < perfbook.tex > perfbook-1c.tex
-	sh utilities/runlatex.sh perfbook-1c bib
+	sh utilities/runlatex.sh perfbook-1c
+
+perfbook-1c.bbl: $(BIBSOURCES) perfbook-1c.aux
+	bibtex perfbook-1c

-perfbook-hb.pdf: $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
+perfbook-1c.aux: $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
+	sh utilities/runfirstlatex.sh perfbook-1c
+
+perfbook-hb.pdf: perfbook-hb.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
 	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < perfbook.tex > perfbook-hb.tex
-	sh utilities/runlatex.sh perfbook-hb bib
+	sh utilities/runlatex.sh perfbook-hb
+
+perfbook-hb.bbl: $(BIBSOURCES) perfbook-hb.aux
+	bibtex perfbook-hb
+
+perfbook-hb.aux: $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
+	sh utilities/runfirstlatex.sh perfbook-hb

 perfbook_flat.tex: $(LATEXSOURCES) $(EPSSOURCES) embedfonts
 	echo > qqz.tex
@@ -217,7 +255,7 @@ count/sig-theft.eps: count/sig-theft.dot
 clean:
 	find . -name '*.aux' -o -name '*.blg' \
 		-o -name '*.dvi' -o -name '*.log' \
-		-o -name '*.qqz' -o -name '*.toc' | xargs rm
+		-o -name '*.qqz' -o -name '*.toc' | xargs rm -f
 	rm -f perfbook_flat.tex perfbook_html.tex perfbook.out perfbook-1c.out
 	rm -rf perfbook_html
 	rm -f SMPdesign/DiningPhilosopher5.eps \
@@ -230,4 +268,4 @@ distclean: clean

 neatfreak: distclean
 	# Don't forget to regenerate the .pdf from each .svg file
-	find . -name '*.pdf' | xargs rm
+	find . -name '*.pdf' | xargs rm -f
diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
new file mode 100644
index 0000000..9111308
--- /dev/null
+++ b/utilities/runfirstlatex.sh
@@ -0,0 +1,46 @@
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
+# Copyright (C) IBM Corporation, 2012
+# Copyright (C) Akira Yokosawa, 2016
+#
+# Authors: Paul E. McKenney <paulmck@us.ibm.com>
+#          Akira Yokosawa <akiyks@gmail.com>
+
+if test -z "$1"
+then
+	echo No latex file specified, aborting.
+	exit 1
+fi
+
+basename=`echo $1 | sed -e 's/\.tex$//'`
+
+echo "pdflatex 1"
+pdflatex $basename > /dev/null 2>&1 < /dev/null || :
+if grep -q '! Emergency stop.' $basename.log
+then
+	echo "----- Fatal latex error, see $basename.log for details. -----"
+	exit 1
+fi
+grep 'Latex Warning:' $basename.log > $basename-warning.log
+touch $basename-first.log
+exit 0
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 8d2d77a..61acf52 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -1,9 +1,12 @@
 #!/bin/sh
 #
-# Run latex on the specified file and bibliography directory.
+# Run pdflatex on the specified file.
 # Attempt to avoid useless repeats.
+# This version is heavily customized to be used for perfbook.
+# It is assumed to be used together with runfirstlatex.sh
+# and Makefile of perfbook.
 #
-# Usage: runlatex.sh file.tex [ bibdir ]
+# Usage: sh runlatex.sh file[.tex]
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -20,47 +23,91 @@
 # http://www.gnu.org/licenses/gpl-2.0.html.
 #
 # Copyright (C) IBM Corporation, 2012
+# Copyright (C) Akira Yokosawa, 2016
 #
 # Authors: Paul E. McKenney <paulmck@us.ibm.com>
+#          Akira Yokosawa <akiyks@gmail.com>

 if test -z "$1"
 then
-	echo No latex file, aborting.
+	echo No latex file specified, aborting.
 	exit 1
 fi

 basename=`echo $1 | sed -e 's/\.tex$//'`

 iter=1
-echo "pdflatex $iter"
-pdflatex $basename > /dev/null 2>&1 < /dev/null || :
-if grep -q '! Emergency stop.' $basename.log
+if ! test -r $basename-first.log
 then
-	echo "----- Fatal latex error, see $basename.log for details. -----"
-fi
-if grep -q 'LaTeX Warning: There were undefined references' $basename.log
-then
-	if test -d "$2"
+	echo "pdflatex 1"
+	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
+	if grep -q '! Emergency stop.' $basename.log
 	then
-		bibtex $basename || :
-	else
-		echo "No bibliography directory, skipping bibtex."
+		echo "----- Fatal latex error, see $basename.log for details. -----"
+		exit 1
 	fi
+	grep 'LaTex Warning:' $basename.log > $basename-warning.log
 fi
-while grep -q 'LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.' $basename.log
+rm -f $basename-first.log
+while grep -q 'LaTeX Warning: There were undefined references' $basename.log
 do
+	if test -r $basename-warning-prev.log
+	then
+		if test "$iter" -gt 2 && diff -q $basename-warning.log $basename-warning-prev.log >/dev/null
+		then
+			echo "No more improvement is expected, giving up."
+			break
+		else
+			echo "Some improvements are observed, continuing."
+		fi
+	fi
 	iter=`expr $iter + 1`
-	echo "pdflatex $iter"
+	echo "pdflatex $iter # remaining undefined refs"
 	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
 	if grep -q '! Emergency stop.' $basename.log
 	then
 		echo "----- Fatal latex error, see $basename.log for details. -----"
+		exit 1
+	fi
+	if test -r $basename-warning.log
+	then
+		mv -f $basename-warning.log $basename-warning-prev.log
+	fi
+	grep 'LaTex Warning:' $basename.log > $basename-warning.log
+done
+while grep -q 'LaTeX Warning: Label(s) may have changed' $basename.log
+do
+	if test -r $basename-warning-prev.log;
+	then
+		if test "$iter" -gt 3 && diff -q $basename-warning.log $basename-warning-prev.log >/dev/null
+		then
+			echo "No more improvement is expected, giving up."
+			break
+		else
+			echo "Some improvements are observed, continuing."
+		fi
 	fi
-	if test "$iter" -eq 4
+	iter=`expr $iter + 1`
+	echo "pdflatex $iter # label(s) may have been changed"
+	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
+	if grep -q '! Emergency stop.' $basename.log
 	then
-		echo "Iteration limit: $iter passes through pdflatex"
+		echo "----- Fatal latex error, see $basename.log for details. -----"
 		exit 1
 	fi
+	if test -r $basename-warning.log
+	then
+		mv -f $basename-warning.log $basename-warning-prev.log
+	fi
+	grep 'LaTex Warning:' $basename.log > $basename-warning.log
 done
-grep "LaTeX Warning:" $basename.log
+if grep "LaTeX Warning:" $basename.log
+then
+	echo "----- You can see $basename-warning.log for the warnings above. -----"
+	echo "----- If you need to, see $basename.log for details. -----"
+	rm -f $basename-warning-prev.log
+	exit 1
+fi
+rm -f $basename-warning.log $basename-warning-prev.log
+echo "No 'LaTeX Warning' found. '$basename.pdf' is ready."
 exit 0
-- 
1.9.1


