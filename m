Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Wprjb1DJbRHhSrFltNgd7yCyDUrB+LYeklmCVH3tdzc=;
 b=pz8fd75njOkdDOdzOOEf7mHssWBLw5mmHNp5JLX6Uue8B2PQFEqVGaZ8IVbSp4Jp4f
 z7hcPotCMyxlSWZZ6ijJ1qersiX5nenBptLNvTWezc1XhMPN0y88b0G2mKnyGuvj1T6x
 axvg5VE/cfs5RfQz1qDt5pgLD7LQYUYSVWkxPwFZtA+ZIntRu1IHaZjT5a6HQ5nwj9rD
 rs1QzCcFDtexDp0qz8OuooEmAYpAORHIHkM6BhiEXt4lp27G1f4djTGY77DMHv81X05O
 Uu249HhwNJzDHNVHvhDlBvvLIer4TIq0hGGXMpd9jobRuelsFciSE9rFHUAcR2q0FT0e
 LdkA==
Subject: [PATCH 1/2] Add script to tweak output of 'alphapf' bibliography
 stile
References: <72375aa0-f2bd-72b0-e39c-69ce8d7ccadc@gmail.com>
 <20161106234719.GL24166@linux.vnet.ibm.com>
 <20161224070505.GA16424@linux.vnet.ibm.com>
 <ac74555d-18c3-9bb1-66cc-e2acb3888dcd@gmail.com>
 <af2c3345-2e60-1582-1f8f-d2adb3413927@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c24b3bcb-e6d5-eae6-e0da-4cc13c04fafb@gmail.com>
Date: Sun, 25 Dec 2016 20:45:07 +0900
MIME-Version: 1.0
In-Reply-To: <af2c3345-2e60-1582-1f8f-d2adb3413927@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 446d9fb1743d3750b06923e32f449469cb1364de Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 25 Dec 2016 19:59:58 +0900
Subject: [PATCH 1/2] Add script to tweak output of 'alphapf' bibliography stile

"inlinelinks" in alphapf.bst caused PDFTeX to abort.
This was because href-ed long titles in Bibliography can cross
page boundaries. The combination of PDFTeX and "hyperref" package
can't handle such a situation.
You can avoid the issue by manually adjust page breaks. But in
perfbook, page boundaries in Bibliography can not be controlled
precisely.
This commit adds a script to convert \href related output of BiBTeX
on the fly. It shortens the href-ed part in title strings to the
beginning of two characters.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile                    |  1 +
 utilities/tweakhrefinbbl.pl | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 utilities/tweakhrefinbbl.pl

diff --git a/Makefile b/Makefile
index f0944f0..0ace9dc 100644
--- a/Makefile
+++ b/Makefile
@@ -70,6 +70,7 @@ $(PDFTARGETS): %.pdf: %.tex %.bbl

 $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux
 	bibtex $(basename $@)
+	perl utilities/tweakhrefinbbl.pl $@

 $(PDFTARGETS:.pdf=.aux): $(LATEXSOURCES) $(LATEXGENERATED) $(BIBSOURCES)
 	sh utilities/runfirstlatex.sh $(basename $@)
diff --git a/utilities/tweakhrefinbbl.pl b/utilities/tweakhrefinbbl.pl
new file mode 100644
index 0000000..6727a28
--- /dev/null
+++ b/utilities/tweakhrefinbbl.pl
@@ -0,0 +1,37 @@
+#!/usr/bin/perl -pi
+# Tweak output of BiBTeX with alphapf bibliography style
+#
+# This script does the following conversion in .bbl
+#
+#  o \newblock \href {http://URL} {Title of the site}.
+#    ->
+#    \newblock \href {http://URL} {Ti}{tle of the site}.
+#  o \newblock \href {http://URL} {{\em Book Title}}.
+#    ->
+#    \newblock \href {http://URL} {{\em {Bo}}}{\em {ok Title}}.
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
+use strict;
+use warnings;
+
+BEGIN {undef $/;}
+
+s/\\newblock \\href\s+\{([^}]*)\}\s+\{([^\\\{]{1}\S?)(.*?)\}\.$/\\newblock \\href {$1} {$2}{$3}./smg ;
+s/\\newblock \\href\s+\{([^}]*)\}\s+\{\{\\em\s+([^\\\{]{1}\S?)(.*?)\}\.$/\\newblock \\href {$1} {{\\em {$2}}}{\\em {$3}./smg ;
-- 
2.7.4


