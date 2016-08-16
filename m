Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=JTuhUR+EJycIg+zCoPc/U/TiHCjhqralwc20MAhBcQw=;
 b=ilEOovl16u6TLw8Kf2aWkHlieeDqStY5KKcxqEjQLhCsK/AE2BWx/rsV5w4WyDSxgI
 YX+VeKRDTm7m8EkuZPa/6XkrcLhkdWC+h3d2s9CiDLEiSvB9nNXVe4yfqAAQl3pTjGwz
 KDQ79tHHxcjKUwiVi3vCs/FRuKvPAUXbekBP3EXn1+zPSVFIcGTf06uJUVxjKFwOEcTZ
 9zmBvpPx4CbZskTENTzGMZUIZRINUj1C+NEojV9GRTGWLSVejpYI3ATLW4ztMoehyF6s
 R+XuQ2FkakC9Ao1POLd+bDaVud8FujfcOSGe45X8NY2Bh+J4lXfuhSxOiG9865HmwO3u
 47Vg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] Makefile: Check availability of `a2ping` and `inkscape`
Date: Tue, 16 Aug 2016 10:16:51 +0900
Message-Id: <1471310212-4354-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit modifies Makefile to check availability of `a2ping` and
`inkscape` command as it already does for `dot` and `fig2eps`.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index b3d7c4c..60e8e96 100644
--- a/Makefile
+++ b/Makefile
@@ -41,6 +41,10 @@ DOT := $(shell which dot 2>/dev/null)

 FIG2EPS := $(shell which fig2eps 2>/dev/null)

+A2PING := $(shell which a2ping 2>/dev/null)
+
+INKSCAPE := $(shell which inkscape 2>/dev/null)
+
 default = $(PERFBOOK_DEFAULT)

 ifeq ($(default),)
@@ -127,10 +131,16 @@ endif

 $(PDFTARGETS_OF_EPS): %.pdf: %.eps
 	@echo "$< --> $@"
+ifndef A2PING
+	$(error "$< --> $@: a2ping not found. Please install it.")
+endif
 	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1

 $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 	@echo "$< --> $@"
+ifndef INKSCAPE
+	$(error "$< --> $@: inkscape not found. Please install it.")
+endif
 	@inkscape --export-pdf=$@ $<

 clean:
-- 
1.9.1

