Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=7UaS+ANu3BUsTYvFpIhQmFol3tJqNpfO9Y8NN5w+qRQ=;
 b=uA/dMRZrYwXbdDwDaixfVhRACC6miaC1/DIIfnXRpSJr1oBR18wnoavAC4WhErD9Qi
 OA47VjT4WkCNilXN14l7umvJRtqBu/QF1xY4U5c9hhpI+FCcBCQGjQ8AEJU8hOICz4js
 6g0sJbpWat8ZgbHrFMQPDTF6T7oq92La268JYiZShRgFrM0RaqUHb0g1quGuYYC/X8/P
 FnNQgVU1KDTeMBcxcQdLhbgRs2JTsMIEMV3zEBft5V3BsCNNLBWxCxCKTjpFglEyXdhs
 6Z23Q4NFEeCOtL9Ht2gvOn81hQDdbSm7qK3oqQDU1PYOUJJyee+3yeeWExVP1BosRYMe
 iBEA==
Subject: [PATCH 1/5] Promote target 'mss' to default
References: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <febf57ae-6a13-045b-7522-a1836e53710d@gmail.com>
Date: Thu, 5 Jan 2017 09:31:58 +0900
MIME-Version: 1.0
In-Reply-To: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cfe4542cfa118e68d309f81e40ce23adad88edc3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Dec 2016 00:27:22 +0900
Subject: [PATCH 1/5] Promote target 'mss' to default

This commit switches the default monospace font to "couriers" with
the option "[scaled=.94]", which has been used for target "mss"
for a while.

After this commit, perfbook.pdf, perfbook-1c.pdf, and perfbook-hb.pdf
use the scaled courier font as monospace font.

The target "mss" now builds perfbook.pdf.

A new target "msns" ([m]ono[s]pace [n]on-[s]caled) is added to
preserve the previous default font choice for comparison.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile     | 26 +++++++++++++++++---------
 perfbook.tex |  2 +-
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 151fba7..997a4cf 100644
--- a/Makefile
+++ b/Makefile
@@ -9,7 +9,7 @@ LATEXSOURCES = \

 LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex

-ABBREVTARGETS := 1c hb mss mstx msr msn msnt 1csf
+ABBREVTARGETS := 1c hb msns mstx msr msn msnt 1csf

 PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)

@@ -60,11 +60,19 @@ else
 	targ = $(default)
 endif

-.PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS)
+.PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mss perfbook-mss.pdf mssmsg
 all: $(targ)

 2c: perfbook.pdf

+mss: perfbook-mss.pdf
+
+perfbook-mss.pdf: perfbook.pdf mssmsg
+
+mssmsg:
+	@echo "perfbook-mss.pdf is promoted to default target,"
+	@echo "built as perfbook.pdf."
+
 $(PDFTARGETS): %.pdf: %.tex %.bbl
 	sh utilities/runlatex.sh $(basename $@)

@@ -98,27 +106,27 @@ perfbook-1c.tex: perfbook.tex
 perfbook-hb.tex: perfbook.tex
 	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@

-perfbook-mss.tex: perfbook.tex
-	sed -e 's/usepackage{courier}/usepackage[scaled=0.94]{couriers}/' < $< > $@
+perfbook-msns.tex: perfbook.tex
+	sed -e 's/\[scaled=\.94\]{couriers}/{courier}/' < $< > $@

 perfbook-mstx.tex: perfbook.tex
-	sed -e 's/usepackage{courier}/renewcommand*\\ttdefault{txtt}/' < $< > $@
+	sed -e 's/usepackage\[scaled=\.94\]{couriers}/renewcommand*\\ttdefault{txtt}/' < $< > $@

 perfbook-msr.tex: perfbook.tex
-	sed -e 's/usepackage{courier}/usepackage[scaled=0.94]{nimbusmono}/' < $< > $@
+	sed -e 's/\[scaled=\.94\]{couriers}/[scaled=.94]{nimbusmono}/' < $< > $@
 	@echo "## This target requires font package nimbus15. ##"

 perfbook-msn.tex: perfbook.tex
-	sed -e 's/usepackage{courier}/usepackage{nimbusmononarrow}/' < $< > $@
+	sed -e 's/\[scaled=\.94\]{couriers}/{nimbusmononarrow}/' < $< > $@
 	@echo "## This target requires font package nimbus15. ##"

 perfbook-msnt.tex: perfbook.tex
-	sed -e 's/usepackage{courier}/usepackage[zerostyle=a]{newtxtt}/' < $< > $@
+	sed -e 's/\[scaled=\.94\]{couriers}/[zerostyle=a]{newtxtt}/' < $< > $@
 	@echo "## This target requires font package newtxtt. ##"

 perfbook-1csf.tex: perfbook-1c.tex
 	sed -e 's/setboolean{sansserif}{false}/setboolean{sansserif}{true}/' \
-	    -e 's/usepackage{courier}/usepackage[var0]{inconsolata}/' < $< > $@
+	    -e 's/\[scaled=\.94\]{couriers}/[var0]{inconsolata}/' < $< > $@
 	@echo "## This target requires recent version (>= 1.3i) of mathastext. ##"

 # Rules related to perfbook_html are removed as of May, 2016
diff --git a/perfbook.tex b/perfbook.tex
index bb1e47e..f90ba18 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -9,7 +9,7 @@
 \usepackage{textcomp} % use symbols in TS1 encoding
 \usepackage{mathptmx} % use nice, standard fonts for roman,
 \usepackage[scaled=.92]{helvet}   % sans serif,
-\usepackage{courier}  % and monospace respectively
+\usepackage[scaled=.94]{couriers}  % and monospace respectively

 % Improves the text layout
 \usepackage{microtype}
-- 
2.7.4


