Return-Path: <SRS0=YgRm=PI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=x0CPIlVzO2g99g8Xj8vGnpoK/dnXqTARUU8MLEfHkoA=;
        b=nW+KroxFsNt68Uw2yk/G1VzaaPc7zw1m/cuW1fzVB+3O9GdNNpeCoA5S0LAOagVyWo
         2evgsNLnsoM2ipHnIspSlNpMEURLjvprm1lWBYpmE58WgWgu/WAVEfnc+ZMfJlluFhS0
         WCW1lR+e+hyqqtHv+BxsBuFWSE1sJXbbTlR1Eep9nq/wW2XHsS5EtNuNarp30+U3bRkf
         EtREvmoJwr3gVDy/SAmHgK+lq/iVUuRDRzPYNurf7g8V4saNqH9hRNoTJD3cRXmYQ46j
         G/E5zn9bhyqMJajcihpkh+tDmpEb4JS3sxy8Gfm4JjtAzZDvpppqLQM4ZGiP52CWXPJo
         Ufbg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Makefile: Add dependencies to font-conversion
 scripts
Message-ID: <4e8b3e73-5024-8e6a-913a-c1deffe05dd4@gmail.com>
Date: Wed, 20 Oct 2021 09:04:55 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

One might miss the rebuild of .pdf files when a font-conversion
script is updated.

Automate the rebuild by writing down such dependencies as make rules.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile         | 4 ++++
 a2ping-rule.mk   | 1 +
 epstopdf-rule.mk | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 0702fdb7..6ee849fd 100644
--- a/Makefile
+++ b/Makefile
@@ -393,6 +393,7 @@ perfbook-a4.tex:
 
 # Rules related to perfbook_html are removed as of May, 2016
 
+$(EPSSOURCES_FROM_TEX): $(FIXANEPSFONTS) $(FIXFONTS)
 $(EPSSOURCES_FROM_TEX): %.eps: %.tex
 	@echo "$< --> $(suffix $@)"
 	sh utilities/mpostcheck.sh
@@ -400,6 +401,7 @@ $(EPSSOURCES_FROM_TEX): %.eps: %.tex
 	@dvips -Pdownload35 -E $(patsubst %.tex,%.dvi,$<) -o $@ > /dev/null 2>&1
 	@sh $(FIXANEPSFONTS) $@
 
+$(EPSSOURCES_FROM_DOT): $(FIXANEPSFONTS) $(FIXFONTS)
 $(EPSSOURCES_FROM_DOT): %.eps: %.dot
 	@echo "$< --> $(suffix $@)"
 ifndef DOT
@@ -408,6 +410,7 @@ endif
 	@dot -Tps -o $@ $<
 	@sh $(FIXANEPSFONTS) $@
 
+$(EPSSOURCES_FROM_FIG): $(FIXANEPSFONTS) $(FIXFONTS)
 $(EPSSOURCES_FROM_FIG): %.eps: %.fig
 	@echo "$< --> $(suffix $@)"
 ifndef FIG2EPS
@@ -423,6 +426,7 @@ else
   include epstopdf-rule.mk
 endif
 
+$(PDFTARGETS_OF_SVG): $(FIXSVGFONTS)
 $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 	@echo "$< --> $(suffix $@)"
 ifeq ($(STEELFONT),0)
diff --git a/a2ping-rule.mk b/a2ping-rule.mk
index 2a312560..5260ec92 100644
--- a/a2ping-rule.mk
+++ b/a2ping-rule.mk
@@ -29,6 +29,7 @@ ifdef A2PING
   endif
 endif
 
+$(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): $(FIXANEPSFONTS) $(FIXFONTS)
 $(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): %.pdf: %.eps
 	@echo "$< --> $(suffix $@) (by a2ping)"
 ifndef A2PING
diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
index 8e824fbe..4efad17a 100644
--- a/epstopdf-rule.mk
+++ b/epstopdf-rule.mk
@@ -8,6 +8,7 @@ EPSTOPDF := $(shell which epstopdf 2>/dev/null)
 GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
 GS_OPT=--gsopt=-dPDFSETTINGS=/ebook
 
+$(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): $(FIXFONTS)
 $(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): %.pdf: %.eps
 	@echo "$< --> $(suffix $@)"
 ifndef EPSTOPDF

base-commit: 25705d5d0328cabdc48af567b253f73e027928a1
-- 
2.17.1

