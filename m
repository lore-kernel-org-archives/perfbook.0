Return-Path: <SRS0=vqDK=OX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ugAoFfUCqxK6q8COYLc/rl3kCxXyCuxT4PHBYsNgiNI=;
        b=L0GchVs2oMLwDzSVBdqLd8CrcxPiLW0UOnqBy+y1/72S23/WsgB8zWWQ9kKUjFOp3P
         f399SWX4DXkmlDHl5rRwbzcoFf8OyJ3avoEm5yw2DfFCJ3zi5K0NpaJ/M1MFWEUbPkxo
         s6cjERYc8Jc2MGOtwLKX/D0AuXCJPDd6iCI3A0f/NEznwoi0+yX97a3TK5DEYylSEBxm
         5MiZK5Y+iA59Iw9/GZRGxgQ/5nbCHv30cVY6WPXJFgGoN8QAoBqP9rl/OdpglC5bwuE1
         Nbx7IgNagcMqlBhmZVAU+ZotylRZ5z5ieIipTeRjdhvfzDI3nzO8vNweDA4DEKxPxryk
         ZjGQ==
Subject: [PATCH -perfbook 2/6] Makefile: Split rules related to a2ping into
 a2ping-rule.mk
References: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dd8f91a7-4e9b-4766-d16a-2857e77d0de3@gmail.com>
Date: Sun, 3 Oct 2021 23:41:31 +0900
MIME-Version: 1.0
In-Reply-To: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Preparatory change for adding alternative rules for "eps --> pdf"
conversion.
No behavior change is intended.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile       | 64 ++--------------------------------------------
 a2ping-rule.mk | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 62 deletions(-)
 create mode 100644 a2ping-rule.mk

diff --git a/Makefile b/Makefile
index e2838779..5d9ef4b9 100644
--- a/Makefile
+++ b/Makefile
@@ -88,7 +88,6 @@ BIBSOURCES := bib/*.bib alphapf.bst
 # required commands
 DOT := $(shell which dot 2>/dev/null)
 FIG2EPS := $(shell which fig2eps 2>/dev/null)
-A2PING := $(shell which a2ping 2>/dev/null)
 INKSCAPE := $(shell which inkscape 2>/dev/null)
 ifdef INKSCAPE
   INKSCAPE_ONE := $(shell inkscape --version 2>/dev/null | grep -c "Inkscape 1")
@@ -137,29 +136,6 @@ endif
 
 STEELFONTID := $(shell fc-list | grep -i steel | grep -c Steel)
 
-ifdef A2PING
-  GS_950_OR_LATER := $(shell gs --version | grep -c -E "9\.[5-9].?")
-  A2PING_277P := $(shell a2ping --help 2>&1 | grep -c "2.77p,")
-  A2PING_283P := $(shell a2ping --help 2>&1 | grep -c "2.83p,")
-  GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
-  ifeq ($(A2PING_277P),1)
-    A2PING_GSCNFL = 1
-  else
-    ifeq ($(A2PING_283P),1)
-      ifeq ($(GS_950_OR_LATER),1)
-        A2PING_GSCNFL = 1
-      else
-        A2PING_GSCNFL = 0
-      endif
-    else
-      A2PING_GSCNFL = 0
-    endif
-  endif
-  ifeq ($(GS_953_OR_LATER),1)
-    A2PING_GSCNFL = 2
-  endif
-endif
-
 LINELABEL_ENV_BEGIN := $(shell grep -l -F '\begin{linelabel}' $(LATEXSOURCES))
 LINELABEL_ENV_END   := $(shell grep -l -F '\end{linelabel}'   $(LATEXSOURCES))
 LINEREF_ENV_BEGIN   := $(shell grep -l -F '\begin{lineref}'   $(LATEXSOURCES))
@@ -431,44 +407,8 @@ endif
 	@fig2eps --nogv $< > /dev/null 2>&1
 	@sh $(FIXANEPSFONTS) $@
 
-$(PDFTARGETS_OF_EPSORIG): %.pdf: %.eps
-	@echo "$< --> $@"
-ifndef A2PING
-	$(error $< --> $@: a2ping not found. Please install it)
-endif
-ifeq ($(A2PING_GSCNFL),1)
-	$(error You need to update a2ping. See #7 in FAQ-BUILD.txt)
-endif
-	@cp $< $<i
-	@sh $(FIXANEPSFONTS) $<i
-	@a2ping --below --hires --bboxfrom=compute-gs $<i $@ > /dev/null 2>&1
-	@rm -f $<i
-
-$(PDFTARGETS_OF_TEX): %.pdf: %.eps
-	@echo "$< --> $@"
-ifndef A2PING
-	$(error $< --> $@: a2ping not found. Please install it)
-endif
-ifeq ($(A2PING_GSCNFL),1)
-	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
-endif
-ifeq ($(A2PING_GSCNFL),2)
-	@a2ping --below --gsextra=-dALLOWPSTRANSPARENCY $< $(basename $@)__.pdf > /dev/null 2>&1
-	@pdfcrop --hires $(basename $@)__.pdf $@ > /dev/null
-	@rm -f $(basename $@)__.pdf
-else
-	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1
-endif
-
-$(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
-	@echo "$< --> $@"
-ifndef A2PING
-	$(error $< --> $@: a2ping not found. Please install it)
-endif
-ifeq ($(A2PING_GSCNFL),1)
-	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
-endif
-	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1
+# .eps --> .pdf rules
+include a2ping-rule.mk
 
 $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 	@echo "$< --> $@"
diff --git a/a2ping-rule.mk b/a2ping-rule.mk
new file mode 100644
index 00000000..296fc575
--- /dev/null
+++ b/a2ping-rule.mk
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Copyright (C) Akira Yokosawa, 2021
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+A2PING := $(shell which a2ping 2>/dev/null)
+
+ifdef A2PING
+  GS_950_OR_LATER := $(shell gs --version | grep -c -E "9\.[5-9].?")
+  A2PING_277P := $(shell a2ping --help 2>&1 | grep -c "2.77p,")
+  A2PING_283P := $(shell a2ping --help 2>&1 | grep -c "2.83p,")
+  GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
+  ifeq ($(A2PING_277P),1)
+    A2PING_GSCNFL = 1
+  else
+    ifeq ($(A2PING_283P),1)
+      ifeq ($(GS_950_OR_LATER),1)
+        A2PING_GSCNFL = 1
+      else
+        A2PING_GSCNFL = 0
+      endif
+    else
+      A2PING_GSCNFL = 0
+    endif
+  endif
+  ifeq ($(GS_953_OR_LATER),1)
+    A2PING_GSCNFL = 2
+  endif
+endif
+
+$(PDFTARGETS_OF_EPSORIG): %.pdf: %.eps
+	@echo "$< --> $@"
+ifndef A2PING
+	$(error $< --> $@: a2ping not found. Please install it)
+endif
+ifeq ($(A2PING_GSCNFL),1)
+	$(error You need to update a2ping. See #7 in FAQ-BUILD.txt)
+endif
+	@cp $< $<i
+	@sh $(FIXANEPSFONTS) $<i
+	@a2ping --below --hires --bboxfrom=compute-gs $<i $@ > /dev/null 2>&1
+	@rm -f $<i
+
+$(PDFTARGETS_OF_TEX): %.pdf: %.eps
+	@echo "$< --> $@"
+ifndef A2PING
+	$(error $< --> $@: a2ping not found. Please install it)
+endif
+ifeq ($(A2PING_GSCNFL),1)
+	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
+endif
+ifeq ($(A2PING_GSCNFL),2)
+	@a2ping --below --gsextra=-dALLOWPSTRANSPARENCY $< $(basename $@)__.pdf > /dev/null 2>&1
+	@pdfcrop --hires $(basename $@)__.pdf $@ > /dev/null
+	@rm -f $(basename $@)__.pdf
+else
+	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1
+endif
+
+$(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
+	@echo "$< --> $@"
+ifndef A2PING
+	$(error $< --> $@: a2ping not found. Please install it)
+endif
+ifeq ($(A2PING_GSCNFL),1)
+	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
+endif
+	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1
-- 
2.17.1


