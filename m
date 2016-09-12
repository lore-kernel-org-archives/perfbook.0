Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=vPq2RHWV7l9kd3zm09fZs8zKnqjA35zplbVWf6Uh/pI=;
 b=PafxKqz2Qk+54+fWczYe9UpSolh14fKx35sbMe33KCUenx98hRrWaTMkbuPQVl/76U
 zgC4NCw9B30z/Jk6e/5NrmT6d+pS0DicBlxSo4TerPIg2t9QsmwpB6WPRffGjfvgjkiK
 nWJgmWDffwtje7qBxF5Jw+YJYBp/gnU7hoC6+q2ZcyVyR5JrNataUzyipeww17c+e2LS
 vgxJ+B1IOR7kqrnHge1H6qm2Rr0xJDU2eoFk7K6bqy/GPQaMuH4AiPmT1N8O9TH2CmER
 R383cHknoHfE/PJXWTzkrMeJwibyj/RbZixN4QcUJTbPDefbl5AO9OwL5Je26yRsJAsw
 vXjQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Add scripts to check 'verbbox' env usage
Message-ID: <9188d6a7-2735-ef7a-68da-bac8bb531cb7@gmail.com>
Date: Tue, 13 Sep 2016 00:08:11 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 177cdd60c2cfe8798547ad260bb821feeb896133 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 12 Sep 2016 23:39:22 +0900
Subject: [PATCH] Add scripts to check 'verbbox' env usage

This commit adds scripts to search modification candidates
for enclosing "verbbox" environment within "figure" environment.

At the top of perfbook directory, the command

$ sh utilities/doverbboxcheck.sh

will show \begin{figure} statements to be moved ahead of
"verbbox" environment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/doverbboxcheck.sh | 36 +++++++++++++++++++++++++++
 utilities/verbboxcheck.pl   | 59 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 utilities/doverbboxcheck.sh
 create mode 100644 utilities/verbboxcheck.pl

diff --git a/utilities/doverbboxcheck.sh b/utilities/doverbboxcheck.sh
new file mode 100644
index 0000000..2801bf1
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
+# Authors: Akira Yokosawa <akiyks@gmain.com>
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
index 0000000..976a41f
--- /dev/null
+++ b/utilities/verbboxcheck.pl
@@ -0,0 +1,59 @@
+#!/usr/bin/perl
+#
+# Check usage pattern of "verbbox" environment
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
+my $line_now;
+my $line_prev;
+my $line_prev_prev;
+my $in_figure = 0;
+my $interval = 0;
+my $line_num;
+my $fig_line;
+my $fig_line_num;
+my $infile = $ARGV[0];
+
+$line_prev_prev = <>;
+$line_prev = <>;
+$line_now = <>;
+$line_num = 3;
+
+while($line_now) {
+    if ($in_figure == 1) {
+	if ($line_now =~ /\\theverbbox/) {
+	    print "$infile:$fig_line_num:$fig_line";
+	    $in_figure = 0;
+	}
+	$interval++;
+    }
+    if ($line_now =~ /\\begin\{figure\}/) {
+	$in_figure = 1;
+	$fig_line = $line_now;
+	$fig_line_num = $line_num;
+    }
+    if ($interval > 3) {
+	$in_figure = 0;
+	$interval = 0;
+    }
+    $line_prev_prev = $line_prev;
+    $line_prev = $line_now;
+    $line_now = <>;
+    $line_num++;
+}
-- 
1.9.1

