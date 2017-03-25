Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=+GwSHg/gx94r8PcZHJkUEtfmQR62brxQX6Xru5nIWPs=;
 b=hdF9F5ayWsmrSn1aKHotP15sFoX6ARAl2LPwXjmSysfd8eVhbZ/G5zaNXSXjeeOSn1
 9xxmKXdadLFIqSA0Nzn/Rv/E6uCygoizTtqa3IPikr0+CRe53uBQlGNuIqK5TaiXrdCq
 cPCxn9UkJ3flCaHrT7jW7PdkPAyrjuiPCBfSRd+fedHVcx1f61pLTqlGbhfqpcCf1GSB
 gYRiot4mvilaZ1HuzufUG6CXmNMmm7kwquNiEk+OHgaB0hqIj/UlB25LY5PhWq9FAi4s
 CGrtqd5cawYunGyso9V89r4VANEa4nTcPaC7bg9EvbBZ04/KYAxy2B+C2yyPJqk/taeR
 MQWA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC PATCH] Promote 'mslm' to default target
Message-ID: <7f3ed34f-f3f7-c90a-ae8d-7aae10d58e44@gmail.com>
Date: Sat, 25 Mar 2017 11:20:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 446208435ff6ec1f8c2b55cfa2f6838376cf62cd Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 00:54:29 +0900
Subject: [RFC PATCH] Promote 'mslm' to default target

Targets "1c" and "hb" also use Latin Modern Typewriter ("lmtt")
font as monospace font.

Old defaults are preserved as targets "msns" and "mss".

All the targets except for "msns" and "mss" use "lmtt" font for
code snippets.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

So, this RFC patch promotes "mslm" to default.
Also, for other targets, "Latin Modern Typewriter" font ("lmtt")
is used in code snippets. Original idea was to use "Computer Modern
Teletype" font ("cmtt") for them, but "lmtt" gives you better result
than "cmtt" when you look closely by zooming in.
Old defaults "msns" and "mss" use their respective monospace font
for them to preserve their behavior.

I hope this change would invite people's opinion on font choice.

                               Thank, Akira
--
 Makefile     | 46 +++++++++++++++++++++++-----------------------
 perfbook.tex | 28 ++++++++++++++--------------
 2 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/Makefile b/Makefile
index e5f620c..88a23e2 100644
--- a/Makefile
+++ b/Makefile
@@ -9,7 +9,7 @@ LATEXSOURCES = \

 LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex

-ABBREVTARGETS := 1c hb msns mstx msr msn msnt mslm 1csf
+ABBREVTARGETS := 1c hb msns mss mstx msr msn msnt 1csf

 PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)

@@ -60,17 +60,17 @@ else
 	targ = $(default)
 endif

-.PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mss perfbook-mss.pdf mssmsg help
+.PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mslm perfbook-mslm.pdf mslmmsg help
 all: $(targ)

 2c: perfbook.pdf

-mss: perfbook-mss.pdf
+mslm: perfbook-mslm.pdf

-perfbook-mss.pdf: perfbook.pdf mssmsg
+perfbook-mslm.pdf: perfbook.pdf mslmmsg

-mssmsg:
-	@echo "perfbook-mss.pdf is promoted to default target,"
+mslmmsg:
+	@echo "perfbook-mslm.pdf is promoted to default target,"
 	@echo "built as perfbook.pdf."

 $(PDFTARGETS): %.pdf: %.tex %.bbl
@@ -107,33 +107,32 @@ perfbook-hb.tex: perfbook.tex
 	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@

 perfbook-msns.tex: perfbook.tex
-	sed -e 's/\[scaled=\.94\]{couriers}/{courier}/' < $< > $@
+	sed -e 's/%msfontstub/\\usepackage{courier}/' \
+	    -e 's/{lmttforcode}{true}/{lmttforcode}{false}/' < $< > $@
+
+perfbook-mss.tex: perfbook.tex
+	sed -e 's/%msfontstub/\\usepackage[scaled=.94]{couriers}/' \
+	    -e 's/{lmttforcode}{true}/{lmttforcode}{false}/' < $< > $@

 perfbook-mstx.tex: perfbook.tex
-	sed -e 's/usepackage\[scaled=\.94\]{couriers}/renewcommand*\\ttdefault{txtt}/' \
-	    -e 's/setboolean{cmttforcode}{false}/setboolean{cmttforcode}{true}/' < $< > $@
+	sed -e 's/%msfontstub/\\renewcommand*\\ttdefault{txtt}/' < $< > $@

 perfbook-msr.tex: perfbook.tex
-	sed -e 's/\[scaled=\.94\]{couriers}/[scaled=.94]{nimbusmono}/' < $< > $@
+	sed -e 's/%msfontstub/\\usepackage[scaled=.94]{nimbusmono}/' < $< > $@
 	@echo "## This target requires font package nimbus15. ##"

 perfbook-msn.tex: perfbook.tex
-	sed -e 's/\[scaled=\.94\]{couriers}/{nimbusmononarrow}/' < $< > $@
+	sed -e 's/%msfontstub/\\usepackage{nimbusmononarrow}/' < $< > $@
 	@echo "## This target requires font package nimbus15. ##"

 perfbook-msnt.tex: perfbook.tex
-	sed -e 's/\[scaled=\.94\]{couriers}/[zerostyle=a]{newtxtt}/' \
-	    -e 's/setboolean{cmttforcode}{false}/setboolean{cmttforcode}{true}/' < $< > $@
+	sed -e 's/%msfontstub/\\usepackage[zerostyle=a]{newtxtt}/' < $< > $@
 	@echo "## This target requires font package newtxtt. ##"
 	@echo "## If build fails, try target 'mstx' instead. ##"

-perfbook-mslm.tex: perfbook.tex
-	sed -e 's/%\\usepackage{lmodern}/\\usepackage{lmodern}/' \
-	    -e 's/\\usepackage\[scaled=\.94\]{couriers}/%\\usepackage[scaled=.94]{couriers}/' < $< > $@
-
 perfbook-1csf.tex: perfbook-1c.tex
 	sed -e 's/setboolean{sansserif}{false}/setboolean{sansserif}{true}/' \
-	    -e 's/\[scaled=\.94\]{couriers}/[var0]{inconsolata}[2013\/07\/17]/' < $< > $@
+	    -e 's/%msfontstub/\\usepackage[var0]{inconsolata}[2013\/07\/17]/' < $< > $@
 	@echo "## This target requires recent version (>= 1.3i) of mathastext. ##"

 # Rules related to perfbook_html are removed as of May, 2016
@@ -176,7 +175,7 @@ endif
 	@inkscape --export-pdf=$@ $<

 help:
-	@echo "Official targets:"
+	@echo "Official targets (Latin Modern Typewriter for monospace font):"
 	@echo "  Full,              Abbr."
 	@echo "  perfbook.pdf,      2c:   (default) 2-column layout"
 	@echo "  perfbook-1c.pdf,   1c:   1-column layout"
@@ -186,18 +185,19 @@ help:
 	@echo "  Full,              Abbr."
 	@echo "  perfbook-msnt.pdf, msnt: 2c with newtxtt as monospace (non-slashed 0)"
 	@echo "  perfbook-mstx.pdf, mstx: 2c with txtt as monospace"
-	@echo "  perfbook-mslm.pdf, mslm: 2c with lmtt (Latin Modern Typewriter) as monospace"
-	@echo "       (Latin Modern is a clone of Computer Modern with additional type faces)"
 	@echo "  perfbook-msr.pdf,  msr:  2c with regular thickness courier clone"
 	@echo "  perfbook-msn.pdf,  msn:  2c with narrow courier clone"

 	@echo "  perfbook-1csf.pdf, 1csf: 1c with sans serif font"
-	@echo "  perfbook-msns.pdf, msns: 2c with non-scaled courier"
+	@echo "  perfbook-msns.pdf, msns: 2c with non-scaled courier (orig default)"
+	@echo "  perfbook-mss.pdf,  mss:  2c with scaled courier (prev default)"
 	@echo "  \"msnt\" requires \"newtxtt\". \"mstx\" is fallback target for older TeX env."
-	@echo "  \"msnt\" and \"mstx\" use \"cmtt\" font for code snippet."
 	@echo "  \"msr\" and \"msn\" require \"nimbus15\"."
 	@echo "  \"msn\" doesn't cover bold face for monospace."
 	@echo "  \"1csf\" requires recent version (>=1.3i) of \"mathastext\"."
+	@echo
+	@echo "All targets except for \"msns\" and \"mss\" use \"Latin Modern Typewriter font"
+	@echo "for code snippets."

 clean:
 	find . -name '*.aux' -o -name '*.blg' \
diff --git a/perfbook.tex b/perfbook.tex
index 1f0916e..58b0cd2 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -5,12 +5,12 @@
 % standard packages

 % A more pleasant font
-%\usepackage{lmodern}
+\usepackage{lmodern}
 \usepackage[T1]{fontenc} % use postscript type 1 fonts
 \usepackage{textcomp} % use symbols in TS1 encoding
-\usepackage{mathptmx} % use nice, standard fonts for roman,
-\usepackage[scaled=.92]{helvet}   % sans serif,
-\usepackage[scaled=.94]{couriers}  % and monospace respectively
+\usepackage{mathptmx} % use nice, standard fonts for roman
+\usepackage[scaled=.92]{helvet} % and sans serif
+%msfontstub

 % Improves the text layout
 \usepackage{microtype}
@@ -65,9 +65,9 @@
 \newboolean{sansserif}
 \setboolean{sansserif}{false}
 \newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}{#1}{#2}}
-\newboolean{cmttforcode}
-\setboolean{cmttforcode}{false}
-\newcommand{\IfCmttForCode}[2]{\ifthenelse{\boolean{cmttforcode}}{#1}{#2}}
+\newboolean{lmttforcode}
+\setboolean{lmttforcode}{true}
+\newcommand{\IfLmttForCode}[2]{\ifthenelse{\boolean{lmttforcode}}{#1}{#2}}

 \newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}

@@ -78,13 +78,13 @@
 \renewcommand{\path}[1]{\nolinkurl{#1}} % workaround of interference with mathastext
 }{}

-\IfCmttForCode{
-\AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{cmtt}}
-\AtBeginEnvironment{verbbox}{\renewcommand{\ttdefault}{cmtt}}
-\AtBeginEnvironment{table}{\renewcommand{\ttdefault}{cmtt}}
-\AtBeginEnvironment{tabular}{\renewcommand{\ttdefault}{cmtt}}
-\AtBeginEnvironment{tabulary}{\renewcommand{\ttdefault}{cmtt}}
-\AtBeginEnvironment{minipage}{\renewcommand{\ttdefault}{cmtt}}
+\IfLmttForCode{
+\AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
+\AtBeginEnvironment{verbbox}{\renewcommand{\ttdefault}{lmtt}}
+\AtBeginEnvironment{table}{\renewcommand{\ttdefault}{lmtt}}
+\AtBeginEnvironment{tabular}{\renewcommand{\ttdefault}{lmtt}}
+\AtBeginEnvironment{tabulary}{\renewcommand{\ttdefault}{lmtt}}
+\AtBeginEnvironment{minipage}{\renewcommand{\ttdefault}{lmtt}}
 }{}

 \begin{document}
-- 
2.7.4

