Return-Path: <SRS0=bx9V=YP=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sTcQHnp3fLKF6Azy84fWTP7kILQRDpPvBDhHU/qAmeM=;
        b=CG82ue1ZOcAsYLGDkR2YywL+GQqyUqJ+TB/LUN1nJCHTgcfNN2QRgN4aHN1ucVzgWu
         sWNHuyPzKZ5vpA8ul7KiRrdOxG4YrKprptLjSkzlkOCrUX0oJsOzegDXztT5je4SGr0A
         xp+50obs3fZoBvtnTrElZXNg8eymgXpvtlgvNhFzAphgPGkuB0HnEqo36coyhZW1QTAK
         v/IlwRbcpyyCGImgMSIFIPgCTTa/5FYpEYKaQavO8DRKX9F8r9OxpaWLvvb56W0N5xin
         M9Fj+1XwChWjdwJ0Ig56irxHWpGryXUzjBAvBNZT4IIMetIyvfHZQhkQXapjpi+OQHCF
         ThQQ==
Subject: [PATCH v3 2/6] Add synctex-forward.sh
References: <fac2cbbb-492c-acde-14a8-15ee04b95ea9@gmail.com>
 <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
 <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <663968ba-bc03-cb5a-da27-499135cc0533@gmail.com>
Date: Tue, 22 Oct 2019 20:19:39 +0900
MIME-Version: 1.0
In-Reply-To: <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 967beab61d94f966c06f245b9c22e1e702d6c785 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 20 Oct 2019 00:51:00 +0900
Subject: [PATCH v3 2/6] Add synctex-forward.sh

This script sets up "% mainfile:" tags in sub .tex files with
a suitable "perfbook-xx.tex" file name.
They enable SyncTeX forward search to perfbook-xx.pdf.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/synctex-forward.sh | 89 ++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100755 utilities/synctex-forward.sh

diff --git a/utilities/synctex-forward.sh b/utilities/synctex-forward.sh
new file mode 100755
index 00000000..312f9cc3
--- /dev/null
+++ b/utilities/synctex-forward.sh
@@ -0,0 +1,89 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Set "% mainfile:" lines with proper "% mainfile: <...>" tags in
+# sub .tex files.
+#
+# With no argument, the main file will be "perfbook.tex",
+# which will do nothing by default.
+# With abbrev target such as "1c", "hb", and so on, the main file
+# will be "perfbook-1c.tex", perfbook-hb.tex", and so on.
+#
+# Depth of subdirectory is deduced from the path of each sub .tex file.
+#
+# Changes made by this script can be reverted by running without
+# argument.
+#
+# WARNING: By runnig this script, your working tree will be modified.
+# It is highly recommented to commit your changes before running
+# this script.
+
+# If LATEX_OPT does not have "synctex", do nothing
+if ! echo $LATEX_OPT | grep -q synctex ; then
+	echo "LATEX_OPT has no synctex option. Exiting..."
+	exit 1
+fi
+
+# warn if git status is not clean later
+gitstatus=`git status --porcelain | wc -l`
+if [ $gitstatus != "0" ] ; then
+	wasnotclean=1
+else
+	wasnotclean=0
+fi
+
+if [ $# -eq 0 ] ; then
+	main="perfbook.tex"
+	change="reverted"
+else
+	case $1 in
+	2c)
+		main="perfbook.tex"
+		change="reverted"
+		;;
+	1c|hb|tcb|msnt|mstx|msr|msn|1csf|msns|mss)
+		main="perfbook-$1.tex"
+		change="modified"
+		;;
+	*)
+		echo "Unknown target!!"
+		exit 1
+		;;
+	esac
+fi
+
+tmpf=`mktemp`
+texfiles=`find . -name '*.tex' -print`
+modified=0
+for i in $texfiles
+do
+	c=$(expr `echo $i | grep -o "/" | wc -l` - 1)
+	x=
+	for j in $(seq 1 $c)
+	do
+		x=..\\/$x
+	done
+	mainpath=$x$main
+	pattern="s/% mainfile: .*perfbook.*\.tex/% mainfile: $mainpath/"
+	cat $i | sed -e "$pattern" > $tmpf
+	if ! diff -q $i $tmpf >/dev/null ; then
+		echo "$i $change."
+		cp -f $tmpf $i
+		modified=1
+	fi
+done
+
+if [ $modified -eq 0 ] ; then
+	echo "No modification."
+else
+	if [ $main != "perfbook.tex" -a $wasnotclean -eq 1 ] ; then
+		echo "### Git status was not clean."
+		echo "### To revert the changes, just run '$0'."
+	fi
+fi
+
+# check if synctex database exists
+mainbase="${main%.tex}"
+if [ `ls -1 perfbook* | grep -c $mainbase.synctex` -eq 0 ] ; then
+	echo "### $mainbase.synctex*: file not found."
+fi
-- 
2.17.1


