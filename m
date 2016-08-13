Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=1ID+rv57hD19itEzztuXDDDQTOxq0Oe0WNHuSfLvrh0=;
 b=PiVVYfHhqqCvFsI20GOWb1r9uQ5aKeFz6s3m7nEwl+unpaBvEySwZkBN9GDsopOQjH
 QZoVZ4OcX9VkTcZhoDaBMvBpJaddKeSq+h+gtkK7g2cbPFDA4V8g5YAl+R5OB5yWbeaA
 heEejnn7udDa5GxuPzfnsgmhRDNEP1ZRu4wW85KDRDfAjnXt1mEpLkbKuombPiVLQIQ1
 veeKlaBBApD+AsiLh8qtVfV18HEG7tIaQ/LvCJVsXl5URQ4JUilXo5Ao2LNWGUoeALmD
 MKuz/tfAx+cZYmkKB78nM9lrzVNRxPlsJ4CYzXoUCEMrxOgbJuOu/G/WiQQmDI6Vukxl
 eT5Q==
Subject: [RFC PATCH 1/3] Trial of replacing hyphens with en-dashes for number
References: <6ccb8aae-d3f1-9081-745c-a98ff8d2875c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <04056c08-c1f0-8cea-ef34-7d51d8162d3b@gmail.com>
Date: Sat, 13 Aug 2016 12:39:32 +0900
MIME-Version: 1.0
In-Reply-To: <6ccb8aae-d3f1-9081-745c-a98ff8d2875c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 449dc8ab744b917a66ea1a38b7f5d7af09ba8025 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 10 Aug 2016 06:59:07 +0900
Subject: [RFC PATCH 1/3] Trial of replacing hyphens with en-dashes for number
 ranges

This commit adds scripts to do replacing.
By doing "sh utilities/dohyphen2endash.sh" in the top directory,
hyphens used in number ranges such as "Lines~m-n" will be replaced
with en-dashes such as "Lines~m--n" in LaTeX sources.
For patterns used to find replacement candidates, see
"utilities/hyphen2endash.sh".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/dohyphen2endash.sh | 36 +++++++++++++++++++++++++++++++
 utilities/hyphen2endash.sh   | 50 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 utilities/dohyphen2endash.sh
 create mode 100644 utilities/hyphen2endash.sh

diff --git a/utilities/dohyphen2endash.sh b/utilities/dohyphen2endash.sh
new file mode 100644
index 0000000..3270983
--- /dev/null
+++ b/utilities/dohyphen2endash.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+#
+# Apply hypen2endash.sh for all .tex files
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
+# Copyright (C) Akira Yokosawa, 2016
+#
+# Authors: Akira Yokosawa <akiyks@gmain.com>
+
+texfiles=`find . -name '*.tex' -print`
+for i in $texfiles
+do
+	basename="${i%.tex}"
+#	echo $basename
+	sh ./utilities/hyphen2endash.sh $basename.tex > $basename.tmp
+	if diff -q $basename.tex $basename.tmp >/dev/null
+	then
+		rm $basename.tmp
+	else
+		echo "$basename.tex modified"
+		mv -f $basename.tmp $basename.tex
+	fi
+done
diff --git a/utilities/hyphen2endash.sh b/utilities/hyphen2endash.sh
new file mode 100644
index 0000000..2b37696
--- /dev/null
+++ b/utilities/hyphen2endash.sh
@@ -0,0 +1,50 @@
+#!/bin/sh
+#
+# Find hyphens used for number range and replace them with en dashes.
+#
+# Replacement candidates are
+# Lines~nn-mm -> Lines~nn--mm
+# Lines nn-mm -> Lines~nn--mm
+# lines~nn-mm -> lines~nn--mm
+# lines nn-mm -> lines~nn--mm
+# line nn-mm -> lines~nn--mm  -- includes typo fix
+# Line nn-mm -> Lines~nn--mm  -- includes typo fix
+# line~nn-mm -> lines~nn--mm  -- includes typo fix
+# Line~nn-mm -> Lines~nn--mm  -- includes typo fix
+# Lines~nn--mm and oo-pp -> Lines~nn--mm and oo--pp
+# Slides nn-mm -> Slides~nn--mm
+# Figures~\ref{foo}-\ref{bar} -> Figures~\ref{foo}--\ref{bar}
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
+# Copyright (C) Akira Yokosawa, 2016
+#
+# Authors: Akira Yokosawa <akiyks@gmain.com>
+
+cat $1 |
+	sed -e 's/Lines~\([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2/g' \
+	    -e 's/Lines \([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2/g' \
+	    -e 's/lines~\([0-9]\+\)-\([0-9]\+\)/lines~\1--\2/g' \
+	    -e 's/lines \([0-9]\+\)-\([0-9]\+\)/lines~\1--\2/g' \
+	    -e 's/Line~\([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2/g' \
+	    -e 's/Line \([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2/g' \
+	    -e 's/line~\([0-9]\+\)-\([0-9]\+\)/lines~\1--\2/g' \
+	    -e 's/line \([0-9]\+\)-\([0-9]\+\)/lines~\1--\2/g' \
+	    -e 's/Lines~\([0-9]\+\)--\([0-9]\+\) and \([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2 and \3--\4/g' \
+	    -e 's/Slides \([0-9]\+\)-\([0-9]\+\)/Slides~\1--\2/g' \
+	    -e 's/Figures~\(\\ref{.*}\)-\(\\ref{.*}\)/Figures~\1--\2/g' \
+	    -e 's/\/\* Lines~\([0-9]\+\)--\([0-9]\+\) \*\//\/\* Lines \1-\2 \*\//g'
+
+# Last pattern is to preserve "Lines n-m" in comments within code snippet
-- 
1.9.1


