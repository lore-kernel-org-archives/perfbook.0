Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GNtPQNsvX6RkSpNbBS6hOekjhCctniLuePb5SUgrWI4=;
 b=AsW3UrbpHKch0hoEYOC5lHWDCfeExyAg6FKw1mNP4now7dGiHV1EaMIvgUYlEGGQnZ
 vniyyzhyGUnDxVjqvWbWbWr/Lo6ZeKnsCpQ7981Sp2ovE37eDAoLGm59rrdTNcYU/+la
 ZSVRUoOru9b0aqj4GSisUK72Uu1xlzeHSuz0xX/QECn0nxvkt3J8AbTelsU5eqV2dNfd
 Kd+sjlvtn37qWS7dhCroE1WmilbKcg2c0ZLMZZJbE1PJwTQueZup0NjUetdsoFK/RYBx
 KifzcUKg7eUsM9p8c6vo7KWpV1ONH+HVfC1Zogif7QnOtyUY9Ec65NoUaYpHPYPSl16z
 yNkQ==
Subject: [PATCH 7/9] Makefile: Remove redundant quotation marks in error
 functions
References: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0884c4fe-2bae-9b3e-f549-78074f1c5e16@gmail.com>
Date: Sat, 12 May 2018 13:22:18 +0900
MIME-Version: 1.0
In-Reply-To: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8a3e3ba5003346f1506dbb07b2704643d710add2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 May 2018 00:56:13 +0900
Subject: [PATCH 7/9] Makefile: Remove redundant quotation marks in error functions

Also adjust the position of an error function to avoid leaving
an intermediate file.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index a4875e2..42296fa 100644
--- a/Makefile
+++ b/Makefile
@@ -116,7 +116,7 @@ autodate.tex: perfbook.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOUR

 perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(TARGETS_OF_SVG)
 ifndef LATEXPAND
-	$(error "--> $@: latexpand not found. Please install it.")
+	$(error --> $@: latexpand not found. Please install it)
 endif
 	echo > qqz.tex
 	echo > contrib.tex
@@ -182,7 +182,7 @@ $(EPSSOURCES_FROM_TEX): %.eps: %.tex
 $(EPSSOURCES_FROM_DOT): %.eps: %.dot
 	@echo "$< --> $@"
 ifndef DOT
-	$(error "$< --> $@: dot not found. Please install graphviz")
+	$(error $< --> $@: dot not found. Please install graphviz)
 endif
 	@dot -Tps -o $@ $<
 	@sh $(FIXANEPSFONTS) $@
@@ -190,38 +190,38 @@ endif
 $(EPSSOURCES_FROM_FIG): %.eps: %.fig
 	@echo "$< --> $@"
 ifndef FIG2EPS
-	$(error "$< --> $@: fig2eps not found. Please install fig2ps")
+	$(error $< --> $@: fig2eps not found. Please install fig2ps)
 endif
 	@fig2eps --nogv $< > /dev/null 2>&1
 	@sh $(FIXANEPSFONTS) $@

 $(PDFTARGETS_OF_EPSORIG): %.pdf: %.eps
 	@echo "$< --> $@"
-	@cp $< $<i
-	@sh $(FIXANEPSFONTS) $<i
 ifndef A2PING
-	$(error "$< --> $@: a2ping not found. Please install it.")
+	$(error $< --> $@: a2ping not found. Please install it)
 endif
 ifeq ($(A2PING_GSCNFL),1)
-	$(error "a2ping conflict detected. See #7 in FAQ-BUILD.txt.")
+	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
 endif
+	@cp $< $<i
+	@sh $(FIXANEPSFONTS) $<i
 	@a2ping --below --hires --bboxfrom=compute-gs $<i $@ > /dev/null 2>&1
 	@rm -f $<i

 $(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
 	@echo "$< --> $@"
 ifndef A2PING
-	$(error "$< --> $@: a2ping not found. Please install it.")
+	$(error $< --> $@: a2ping not found. Please install it)
 endif
 ifeq ($(A2PING_GSCNFL),1)
-	$(error "a2ping conflict detected. See #7 in FAQ-BUILD.txt.")
+	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
 endif
 	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1

 $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 	@echo "$< --> $@"
 ifndef INKSCAPE
-	$(error "$< --> $@: inkscape not found. Please install it.")
+	$(error $< --> $@ inkscape not found. Please install it)
 endif
 ifeq ($(STEELFONTID),0)
 	@sh $(FIXSVGFONTS) < $< | sed -e 's/Steel City Comic/Test/g' > $<i
@@ -234,7 +234,7 @@ endif
 $(PNGTARGETS_OF_SVG): %.png: %.svg
 	@echo "$< --> $@"
 ifndef INKSCAPE
-	$(error "$< --> $@: inkscape not found. Please install it.")
+	$(error $< --> $@: inkscape not found. Please install it)
 endif
 ifeq ($(STEELFONTID),0)
 	@sh $(FIXSVGFONTS) < $< | sed -e 's/Steel City Comic/Test/g' > $<i
-- 
2.7.4


