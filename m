Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=bpRi979V5AZcorvDnC0xIE1/UyFWTM5kXztzmj3QAbY=;
 b=O+qIDkRzcPezEr9H+mlRGDwub1oZDYrpU5Z9VN2e5j/Ew3jb9ux0vL4Aa817ik4GhZ
 8w2R0B32KoZOrWz0o0UN7TOERoXRZV8Ti34FEs49YXTu5D44IvZvMYBgOaEALXoEh07z
 l8TMvjTt5M4BhQ1GRbYgbeC2ZW5LpaNn0u25t/C/TIQhUo9fvUlgI82HmzZ0pSY7jh0A
 aP4fsm1BA+H5cDj0N+W57eclHl0IPgbfmiVNlBwgiWyT5RBoSAofvQ/5nvNAoL3dfk6P
 PYD7iIdGttyFfYrta0w/vkPEvipgQI+FND2JbM5EvWoqC9IGuc7CRWsupyBl5DXRbYp+
 HDQw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Choose 'cmtt' font for code snippets in targets 'msnt' and
 'mstx'
Message-ID: <a0f0786c-d28a-1a9d-0159-58656f6490eb@gmail.com>
Date: Mon, 20 Mar 2017 13:58:15 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 25fb5aea63049454a5df2c923dac59285fe40720 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 20 Mar 2017 13:10:38 +0900
Subject: [PATCH] Choose 'cmtt' font for code snippets in targets 'msnt' and 'mstx'

By specifying "cmtt" (Computer Modern Teletype) font as \ttdefault
in verbatim, verbbox, table, tabular, tabulary, and minipage
environments, we can improve consistency of looks independent of
monospace font choice for main text. cmtt font is more than suitable
for listing of code snippet and program output.

However, when mixed used with Times Roman (clone) font, cmtt's
slightly lower x-height than Times Roman, and its similar thickness
as Times Roman, it is not distinctive enough as can be seen in
"mslm" target.

In this respect, "txtt" and its enhanced version "newtxtt" fonts
are more suitable as is described in [1].

This commit enables the font choice of cmtt for code snippets in
targets "msnt" and "mstx".

Help messages in Makefile are updated accordingly.

Any feedback on the font choice is welcome.

[1] Excerpt from newtxtt documentation:

    This package provides an interface to another alternative---the
    typewriter fonts provided with txfonts, with some enhancements.
    They have the same widths as cmtt, but are taller, heavier,
    more geometric and less shapely, with very low contrast, and
    are more suited to match Roman fonts of height and weight
    approximating that of Times.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile     | 17 +++++++++++------
 perfbook.tex | 13 +++++++++++++
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 2c88e6c..e5f620c 100644
--- a/Makefile
+++ b/Makefile
@@ -110,7 +110,8 @@ perfbook-msns.tex: perfbook.tex
 	sed -e 's/\[scaled=\.94\]{couriers}/{courier}/' < $< > $@

 perfbook-mstx.tex: perfbook.tex
-	sed -e 's/usepackage\[scaled=\.94\]{couriers}/renewcommand*\\ttdefault{txtt}/' < $< > $@
+	sed -e 's/usepackage\[scaled=\.94\]{couriers}/renewcommand*\\ttdefault{txtt}/' \
+	    -e 's/setboolean{cmttforcode}{false}/setboolean{cmttforcode}{true}/' < $< > $@

 perfbook-msr.tex: perfbook.tex
 	sed -e 's/\[scaled=\.94\]{couriers}/[scaled=.94]{nimbusmono}/' < $< > $@
@@ -121,8 +122,10 @@ perfbook-msn.tex: perfbook.tex
 	@echo "## This target requires font package nimbus15. ##"

 perfbook-msnt.tex: perfbook.tex
-	sed -e 's/\[scaled=\.94\]{couriers}/[zerostyle=a]{newtxtt}/' < $< > $@
+	sed -e 's/\[scaled=\.94\]{couriers}/[zerostyle=a]{newtxtt}/' \
+	    -e 's/setboolean{cmttforcode}{false}/setboolean{cmttforcode}{true}/' < $< > $@
 	@echo "## This target requires font package newtxtt. ##"
+	@echo "## If build fails, try target 'mstx' instead. ##"

 perfbook-mslm.tex: perfbook.tex
 	sed -e 's/%\\usepackage{lmodern}/\\usepackage{lmodern}/' \
@@ -181,17 +184,19 @@ help:
 	@echo
 	@echo "Experimental targets:"
 	@echo "  Full,              Abbr."
-	@echo "  perfbook-msr.pdf,  msr:  2c with regular thickness courier clone"
-	@echo "  perfbook-msn.pdf,  msn:  2c with narrow courier clone"
-	@echo "  perfbook-mstx.pdf, mstx: 2c with txtt as monospace"
 	@echo "  perfbook-msnt.pdf, msnt: 2c with newtxtt as monospace (non-slashed 0)"
+	@echo "  perfbook-mstx.pdf, mstx: 2c with txtt as monospace"
 	@echo "  perfbook-mslm.pdf, mslm: 2c with lmtt (Latin Modern Typewriter) as monospace"
 	@echo "       (Latin Modern is a clone of Computer Modern with additional type faces)"
+	@echo "  perfbook-msr.pdf,  msr:  2c with regular thickness courier clone"
+	@echo "  perfbook-msn.pdf,  msn:  2c with narrow courier clone"
+
 	@echo "  perfbook-1csf.pdf, 1csf: 1c with sans serif font"
 	@echo "  perfbook-msns.pdf, msns: 2c with non-scaled courier"
+	@echo "  \"msnt\" requires \"newtxtt\". \"mstx\" is fallback target for older TeX env."
+	@echo "  \"msnt\" and \"mstx\" use \"cmtt\" font for code snippet."
 	@echo "  \"msr\" and \"msn\" require \"nimbus15\"."
 	@echo "  \"msn\" doesn't cover bold face for monospace."
-	@echo "  \"msnt\" requires \"newtxtt\"."
 	@echo "  \"1csf\" requires recent version (>=1.3i) of \"mathastext\"."

 clean:
diff --git a/perfbook.tex b/perfbook.tex
index e8234c4..94f2f4b 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -15,6 +15,7 @@
 % Improves the text layout
 \usepackage{microtype}
 \UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
+\usepackage{etoolbox}

 \usepackage{lscape}
 \usepackage{epsfig}
@@ -64,6 +65,9 @@
 \newboolean{sansserif}
 \setboolean{sansserif}{false}
 \newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}{#1}{#2}}
+\newboolean{cmttforcode}
+\setboolean{cmttforcode}{false}
+\newcommand{\IfCmttForCode}[2]{\ifthenelse{\boolean{cmttforcode}}{#1}{#2}}

 \newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}

@@ -74,6 +78,15 @@
 \renewcommand{\path}[1]{\nolinkurl{#1}} % workaround of interference with mathastext
 }{}

+\IfCmttForCode{
+\AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{cmtt}}
+\AtBeginEnvironment{verbbox}{\renewcommand{\ttdefault}{cmtt}}
+\AtBeginEnvironment{table}{\renewcommand{\ttdefault}{cmtt}}
+\AtBeginEnvironment{tabular}{\renewcommand{\ttdefault}{cmtt}}
+\AtBeginEnvironment{tabulary}{\renewcommand{\ttdefault}{cmtt}}
+\AtBeginEnvironment{minipage}{\renewcommand{\ttdefault}{cmtt}}
+}{}
+                   
 \begin{document}

 %%HTMLSKIP
-- 
2.7.4

