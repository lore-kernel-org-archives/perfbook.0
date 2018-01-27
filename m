Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f42.google.com ([74.125.83.42]:44098 "EHLO
 mail-pg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751943AbeA0J4G (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 27
 Jan 2018 04:56:06 -0500
Received: by mail-pg0-f42.google.com with SMTP id m20so1595337pgc.11 for
 <perfbook@vger.kernel.org>; Sat, 27 Jan 2018 01:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F/HBIC++SjY0EinO3jJeTDfImomeXT5aVJJOKF/mbDY=;
 b=NYDqRGjNXj4NiF3HEQaEUSckh4cGapUYCFtwC1mFigPBKYn6nJeLrTyuTknoeN7WTx
 j6ypTGE8NCLSVRq0sbmkJ5Z6gAThUgD4khl0mBEnkcQdHznIqOqPVqFxXwEug7+V5gzw
 167u3ffzgE+QOukyqQFXIuJT//ZZkVB+0AuGx6xlDROqcQyMBmDdNHi/r1FKP/7uTJZn
 4W1sGmWIR/xGTrWj4teiHXmmVsf9Jg3YZCsOo06cP8Xb6isCA+sDl+Adm92I5rqtAhtq
 0UBAW4jhbTiIPro/mpw2ik2+O2bcnIpHDOccewsWiu6hYjUfNAMGJTJd8IeGqbIDYiep
 Ppew==
Subject: [PATCH 1/4] Add fixsvgfonts.sh
References: <46894f44-5b60-886f-2321-67c1b9b51c97@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <68edefba-baec-4c96-5501-3309a7e23fbb@gmail.com>
Date: Sat, 27 Jan 2018 18:55:59 +0900
MIME-Version: 1.0
In-Reply-To: <46894f44-5b60-886f-2321-67c1b9b51c97@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From ba9206e36d668cc89ce14e920d0fafe7cfad42e3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 27 Jan 2018 12:41:55 +0900
Subject: [PATCH 1/4] Add fixsvgfonts.sh

Convert font names in svg files to those of URW.

Also add rules to convert fonts in eps files which are the origin
of figures.

This change will remove proprietary and generic font-family names
such as "Helvetica" and "Sans".

NOTE: URW font v2 uses a different set of font families.
Fedora 27 uses only the v2 names. We will need a different set of
scripts to use them.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile                 | 22 ++++++++++++++++++++--
 utilities/fixsvgfonts.sh | 15 +++++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 utilities/fixsvgfonts.sh

diff --git a/Makefile b/Makefile
index 373f0d6..f1b6715 100644
--- a/Makefile
+++ b/Makefile
@@ -39,6 +39,12 @@ EPSSOURCES := $(sort $(EPSSOURCES_DUP))

 PDFTARGETS_OF_EPS := $(EPSSOURCES:%.eps=%.pdf)

+EPSORIGIN := $(filter-out $(EPSSOURCES_FROM_TEX) $(EPSSOURCES_FROM_DOT) $(EPSSOURCES_FROM_FIG),$(EPSSOURCES))
+
+PDFTARGETS_OF_EPSORIG := $(EPSORIGIN:%.eps=%.pdf)
+
+PDFTARGETS_OF_EPSOTHER := $(filter-out $(PDFTARGETS_OF_EPSORIG),$(PDFTARGETS_OF_EPS))
+
 BIBSOURCES := bib/*.bib alphapf.bst

 SVGSOURCES := $(wildcard */*.svg)
@@ -164,7 +170,17 @@ endif
 	@fig2eps --nogv $< > /dev/null 2>&1
 	@sh utilities/fixanepsfonts.sh $@

-$(PDFTARGETS_OF_EPS): %.pdf: %.eps
+$(PDFTARGETS_OF_EPSORIG): %.pdf: %.eps
+	@echo "$< --> $@"
+	@cp $< $<i
+	@sh utilities/fixanepsfonts.sh $<i
+ifndef A2PING
+	$(error "$< --> $@: a2ping not found. Please install it.")
+endif
+	@a2ping --below --hires --bboxfrom=compute-gs $<i $@ > /dev/null 2>&1
+	@rm -f $<i
+
+$(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
 	@echo "$< --> $@"
 ifndef A2PING
 	$(error "$< --> $@: a2ping not found. Please install it.")
@@ -176,7 +192,9 @@ $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 ifndef INKSCAPE
 	$(error "$< --> $@: inkscape not found. Please install it.")
 endif
-	@inkscape --export-pdf=$@ $<
+	@sh utilities/fixsvgfonts.sh < $< > $<i
+	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
+	@rm -f $<i

 help:
 	@echo "Official targets (Latin Modern Typewriter for monospace font):"
diff --git a/utilities/fixsvgfonts.sh b/utilities/fixsvgfonts.sh
new file mode 100644
index 0000000..812cbc2
--- /dev/null
+++ b/utilities/fixsvgfonts.sh
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# fixsvgfonts.sh: Convert an .svg file to use embeddable fonts, taking from
+#	standard input and putting on standar output.
+#
+# Copyright (c) 2018 Akira Yokosawa
+
+sed	-e 's+family:Helvetica+family:Nimbus Sans L+g' \
+	-e 's+family="Helvetica+family="Nimbus Sans L+g' \
+	-e 's+family:Sans+family:Nimbus Sans L+g' \
+	-e 's+cation:Sans+cation:Nimbus Sans L+g' \
+	-e 's+family:Courier+family:Nimbus Mono L+g' \
+	-e 's+family="Courier+family="Nimbus Mono L+g' \
+	-e 's+family:Symbol+family:Standard Symbols L+g' \
+	-e 's+cation:Symbol+cation:Standard Symbols L+g'
-- 
2.7.4


