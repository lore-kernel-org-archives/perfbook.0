Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Wcf7hNBhJaGzZEooQvzHtgubzwt9+yVufgGIWZXIBYg=;
 b=RMWBtnxSwF3LerOTwK72+i5ba+U6AZQIvGHiCS9lbSG1ZS4dUAtLDPyNB2cOJZJqeR
 /6h2rQ7xoVskTgzz21x0tjHCTcfDqtQeIOSqz9Aqsf96/nMtE8jLYo5T6A5OsNvXSQT9
 AistbKXR4yeCWBX+/uUdD1AUUh4tGIPhzNRlC8n0lJiqk3vYD52aNtfnyjmRG3HHLQVS
 kVsIXeO5v28tjOljvbcWHR4ycwFIICUQEkb4JVxk5Q+4Rt5ui87MgjdLlVfPxUsqqioI
 E1JFc7K64Sh9vss3yew7lrxLw9RBprIQ653eZC3t5+26k7uFY/QL2BaPOphtSxSpoP1z
 m+yQ==
Subject: [PATCH v2] Add scripts to check 'verbbox' env usage
References: <9188d6a7-2735-ef7a-68da-bac8bb531cb7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cbec0f8e-e8b1-ab1e-6e17-f9bb2ae51306@gmail.com>
Date: Tue, 13 Sep 2016 07:15:09 +0900
MIME-Version: 1.0
In-Reply-To: <9188d6a7-2735-ef7a-68da-bac8bb531cb7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 376bd195eeb599184f5e12e6f109f88cfc19ee94 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 12 Sep 2016 23:39:22 +0900
Subject: [PATCH v2] Add scripts to check 'verbbox' env usage

This commit adds scripts to search modification candidates
for enclosing "verbbox" environment within "figure" environment.

At the top of perfbook directory, the command

$ sh utilities/doverbboxcheck.sh

will show \begin{figure} statements to be moved ahead of
"verbbox" environment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/doverbboxcheck.sh | 36 +++++++++++++++++++++++++++++++
 utilities/verbboxcheck.pl   | 52 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 utilities/doverbboxcheck.sh
 create mode 100644 utilities/verbboxcheck.pl

diff --git a/utilities/doverbboxcheck.sh b/utilities/doverbboxcheck.sh
new file mode 100644
index 0000000..cda60f0
--- /dev/null
+++ b/utilities/doverbboxcheck.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+#
+# Apply verbboxcheck.pl for all .tex files
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
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+# check if companion script exists
+if ! test -e utilities/verbboxcheck.pl
+then
+	echo "utilities/verrboxcheck.pl not found."
+	exit 1
+fi
+texfiles=`find . -name '*.tex' -print`
+for i in $texfiles
+do
+	basename="${i%.tex}"
+#	echo $basename
+	perl ./utilities/verbboxcheck.pl $basename.tex
+done
+
diff --git a/utilities/verbboxcheck.pl b/utilities/verbboxcheck.pl
new file mode 100644
index 0000000..ce60a52
--- /dev/null
+++ b/utilities/verbboxcheck.pl
@@ -0,0 +1,52 @@
+#!/usr/bin/perl
+#
+# Check usage pattern of "verbbox" environment
+#
+# This script searches \begin{figure} within a few lines ahead of
+# \theverbbox.
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
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+my $line;
+my $in_figure = 0;
+my $interval = 0;
+my $line_num = 1;
+my $fig_line;
+my $fig_line_num;
+my $infile = $ARGV[0];
+
+while($line = <>) {
+    if ($in_figure) {
+	if ($line =~ /\\theverbbox/) {
+	    print "$infile:$fig_line_num:$fig_line";
+	    $in_figure = 0;
+	}
+	$interval++;
+    }
+    if ($line =~ /\\begin\{figure\}/) {
+	$in_figure = 1;
+	$fig_line = $line;
+	$fig_line_num = $line_num;
+    }
+    if ($interval > 3) {
+	$in_figure = 0;
+	$interval = 0;
+    }
+    $line_num++;
+}
-- 
1.9.1


