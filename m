Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=isJeO5IzZSctIsN++LmSqvL2q/Ccx9RD4W2zIPAQ8gI=;
 b=p1vXR6j9bpg8ItbuHTx/23Cro5shZqqm8MQAyuA9GFYq8uaId2Ba1URR2cAB/ddYiF
 MoLnRWjGWaMxORe1QZQe+n3jD0oc9e0eXDl1NiWivNmIvJkcUytxgSoL5mdTc8AcdTE5
 y8a4KfrXWjX/dQ0F3w2ynxy+enRTzNwXBEEry+ada2zGakttWekl5Qe9i3qH8cquEexy
 OiIrIDklBxa286DLjcnuYAcNlOz6aaoPkHjH/cFRfAi6KwW1K3HdhpjOv4e8kq9fu+Ot
 3q7yLKSHNRDXDDC7nXksvQb2CBWbaY0yccYTl4I3Y1XUVaPNv1boSec3RPgTe+wU0wf3
 TGcQ==
Subject: [PATCH 4/4] Makefile: Support URW++ v2 font family names
References: <46894f44-5b60-886f-2321-67c1b9b51c97@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4a141537-4615-457d-4a76-f8e00052e1f2@gmail.com>
Date: Sat, 27 Jan 2018 18:59:52 +0900
MIME-Version: 1.0
In-Reply-To: <46894f44-5b60-886f-2321-67c1b9b51c97@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3fd97ea1bffc46d5ea2946397d3fa5debf74579e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 27 Jan 2018 13:06:26 +0900
Subject: [PATCH 4/4] Makefile: Support URW++ v2 font family names

Add conversion scripts for URW++ v2 font family, which has been
introduced in Fedora 27.

Define macros in Makefile according to the output of "fc-list" so
that correct scripts are used for font conversion.

NOTE: Ghostscript 9.22 is not compatible with a2ping at the moment.[1]
Downgrading to 9.20 is necessary on Fedora 27.

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1530268

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile                         | 20 +++++++++----
 utilities/fixanepsfonts-urwps.sh | 27 ++++++++++++++++++
 utilities/fixfonts-urwps.sh      | 61 ++++++++++++++++++++++++++++++++++++++++
 utilities/fixsvgfonts-urwps.sh   | 23 +++++++++++++++
 4 files changed, 126 insertions(+), 5 deletions(-)
 create mode 100644 utilities/fixanepsfonts-urwps.sh
 create mode 100644 utilities/fixfonts-urwps.sh
 create mode 100644 utilities/fixsvgfonts-urwps.sh

diff --git a/Makefile b/Makefile
index f1b6715..465e139 100644
--- a/Makefile
+++ b/Makefile
@@ -59,6 +59,16 @@ A2PING := $(shell which a2ping 2>/dev/null)

 INKSCAPE := $(shell which inkscape 2>/dev/null)

+URWPS := $(shell fc-list | grep "Nimbus Mono PS" | wc -l)
+
+ifeq ($(URWPS),0)
+FIXSVGFONTS   = utilities/fixsvgfonts.sh
+FIXANEPSFONTS = utilities/fixanepsfonts.sh
+else
+FIXSVGFONTS   = utilities/fixsvgfonts-urwps.sh
+FIXANEPSFONTS = utilities/fixanepsfonts-urwps.sh
+endif
+
 default = $(PERFBOOK_DEFAULT)

 ifeq ($(default),)
@@ -152,7 +162,7 @@ $(EPSSOURCES_FROM_TEX): %.eps: %.tex
 	sh utilities/mpostcheck.sh
 	@latex -output-directory=$(shell dirname $<) $< > /dev/null 2>&1
 	@dvips -Pdownload35 -E $(patsubst %.tex,%.dvi,$<) -o $@ > /dev/null 2>&1
-	@sh utilities/fixanepsfonts.sh $@
+	@sh $(FIXANEPSFONTS) $@

 $(EPSSOURCES_FROM_DOT): %.eps: %.dot
 	@echo "$< --> $@"
@@ -160,7 +170,7 @@ ifndef DOT
 	$(error "$< --> $@: dot not found. Please install graphviz")
 endif
 	@dot -Tps -o $@ $<
-	@sh utilities/fixanepsfonts.sh $@
+	@sh $(FIXANEPSFONTS) $@

 $(EPSSOURCES_FROM_FIG): %.eps: %.fig
 	@echo "$< --> $@"
@@ -168,12 +178,12 @@ ifndef FIG2EPS
 	$(error "$< --> $@: fig2eps not found. Please install fig2ps")
 endif
 	@fig2eps --nogv $< > /dev/null 2>&1
-	@sh utilities/fixanepsfonts.sh $@
+	@sh $(FIXANEPSFONTS) $@

 $(PDFTARGETS_OF_EPSORIG): %.pdf: %.eps
 	@echo "$< --> $@"
 	@cp $< $<i
-	@sh utilities/fixanepsfonts.sh $<i
+	@sh $(FIXANEPSFONTS) $<i
 ifndef A2PING
 	$(error "$< --> $@: a2ping not found. Please install it.")
 endif
@@ -192,7 +202,7 @@ $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 ifndef INKSCAPE
 	$(error "$< --> $@: inkscape not found. Please install it.")
 endif
-	@sh utilities/fixsvgfonts.sh < $< > $<i
+	@sh $(FIXSVGFONTS) < $< > $<i
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
 	@rm -f $<i

diff --git a/utilities/fixanepsfonts-urwps.sh b/utilities/fixanepsfonts-urwps.sh
new file mode 100644
index 0000000..e1640c7
--- /dev/null
+++ b/utilities/fixanepsfonts-urwps.sh
@@ -0,0 +1,27 @@
+# fixanepsfonts-urwps.sh: Convert the specified .eps files to use
+# embeddable fonts.
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
+# Copyright (c) 2010 Paul E. McKenney, IBM Corporation.
+# Copyright (c) 2018 Akira Yokosawa
+
+names=$*
+for i in $names
+do
+	mv $i $i.badfonts
+	sh utilities/fixfonts-urwps.sh < $i.badfonts > $i
+	rm $i.badfonts
+done
diff --git a/utilities/fixfonts-urwps.sh b/utilities/fixfonts-urwps.sh
new file mode 100644
index 0000000..20dea73
--- /dev/null
+++ b/utilities/fixfonts-urwps.sh
@@ -0,0 +1,61 @@
+# fixfonts-urwps.sh: Convert an .eps file to use embeddable fonts, taking from
+#	standard input and putting on standar output.
+#
+# Based on fixfonts.sh, updated for Fedora 27 by Akira Yokosawa.
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
+# Copyright (c) 2011 Paul E. McKenney, IBM Corporation.
+# Copyright (c) 2018 Akira Yokosawa.
+
+sed	-e 's+Times-Roman-BoldItalic+NimbusSans-BoldItalic+g' \
+	-e 's+Times-Roman-Italic+NimbusSans-Italic+g' \
+	-e 's+Times-Roman-Bold+NimbusSans-Bold+g' \
+	-e 's+Times-Roman+NimbusSans-Regular+g' \
+	-e 's+Times+NimbusSans-Regular+g' \
+	-e 's+Helvetica-BoldOblique+NimbusSans-BoldItalic+g' \
+	-e 's+Helvetica-Oblique+NimbusSans-Italic+g' \
+	-e 's+Helvetica-Bold-iso+NimbusSans-Bold+g' \
+	-e 's+Helvetica-Bold+NimbusSans-Bold+g' \
+	-e 's+Helvetica-Narrow-BoldOblique-iso+NimbusSansNarrow-BdOblique+g' \
+	-e 's+Helvetica-Narrow-BoldOblique+NimbusSansNarrow-BdOblique+g' \
+	-e 's+Helvetica-Narrow-Oblique-iso+NimbusSansNarrow-Oblique+g' \
+	-e 's+Helvetica-Narrow-Oblique+NimbusSansNarrow-Oblique+g' \
+	-e 's+Helvetica-Narrow-Bold-iso+NimbusSansNarrow-Bold+g' \
+	-e 's+Helvetica-Narrow-Bold+NimbusSansNarrow-Bold+g' \
+	-e 's+Helvetica-Narrow-iso+NimbusSansNarrow-Regular+g' \
+	-e 's+Helvetica-Narrow+NimbusSansNarrow-Regular+g' \
+	-e 's+Helvetica-iso+NimbusSans-Regular+g' \
+	-e 's+Helvetica+NimbusSans-Regular+g' \
+	-e 's+Symbol+StandardSymbolsPS+g' \
+	-e 's+Courier-BoldOblique+NimbusMonoPS-BoldItalic+g' \
+	-e 's+Courier-Oblique+NimbusMonoPS-Italic+g' \
+	-e 's+Courier-Bold+NimbusMonoPS-Bold+g' \
+	-e 's+Courier+NimbusMonoPS-Regular+g' \
+	-e 's+NimbusSanL-BoldItal+NimbusSans-BoldItalic+g' \
+	-e 's+NimbusSanL-ReguItal+NimbusSans-Italic+g' \
+	-e 's+NimbusSanL-Bold+NimbusSans-Bold+g' \
+	-e 's+NimbusSanL-Regu+NimbusSans-Regular+g' \
+	-e 's+NimbusMonL-BoldObli+NimbusMonoPS-BoldItalic+g' \
+	-e 's+NimbusMonL-ReguObli+NimbusMonoPS-Italic+g' \
+	-e 's+NimbusMonL-Bold+NimbusMonoPS-Bold+g' \
+	-e 's+NimbusMonL-Regu+NimbusMonoPS-Regular+g' \
+	-e 's+StandardSymL+StandardSymbolsPS+g' \
+	-e 's+NimbusMono-Regular-Bold+NimbusMonoPS-Bold+g' \
+	-e 's+NimbusMono-Regular+NimbusMonoPS-Regular+g' \
+	-e 's+NimbusSans-Regular-Italic+NimbusSans-Italic+g' \
+	-e 's+NimbusSans-Regular-BoldItalic+NimbusSans-BoldItalic+g' \
+	-e 's+NimbusSans-Regular-Bold+NimbusSans-Bold+g' \
+	-e 's+StandardSymbolsPS-+Symbol-+g'
diff --git a/utilities/fixsvgfonts-urwps.sh b/utilities/fixsvgfonts-urwps.sh
new file mode 100644
index 0000000..ac55b4a
--- /dev/null
+++ b/utilities/fixsvgfonts-urwps.sh
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# fixsvgfonts-urwps.sh: Convert an .svg file to use embeddable fonts,
+#       taking from standard input and putting on standar output.
+#
+# Copyright (c) 2018 Akira Yokosawa
+
+sed	-e 's+family:Helvetica+family:Nimbus Sans+g' \
+	-e 's+family="Helvetica+family="Nimbus Sans+g' \
+	-e 's+family:Sans+family:Nimbus Sans+g' \
+	-e 's+cation:Sans+cation:Nimbus Sans+g' \
+	-e 's+family:Courier+family:Nimbus Mono PS+g' \
+	-e 's+family="Courier+family="Nimbus Mono PS+g' \
+	-e 's+family:Symbol+family:Standard Symbols PS+g' \
+	-e 's+cation:Symbol+cation:Standard Symbols PS+g' \
+	-e 's+family:Nimbus Sans L+family:Nimbus Sans+g' \
+	-e 's+family="Nimbus Sans L+family="Nimbus Sans+g' \
+	-e 's+cation:Nimbus Sans L+cation:Nimbus Sans+g' \
+	-e 's+family:Nimbus Mono L+family:Nimbus Mono PS+g' \
+	-e 's+family="Nimbus Mono L+family="Nimbus Mono PS+g' \
+	-e 's+cation:Nimbus Mono L+cation:Nimbus Mono PS+g' \
+	-e 's+family:Standard Symbols L+family:Standard Symbols PS+g' \
+	-e 's+cation:Standard Symbosl L+cation:Standard Symbols PS+g'
-- 
2.7.4


