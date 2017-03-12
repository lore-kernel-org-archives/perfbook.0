Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=kT3ZApQzYaC2ObcHxY62mrncW9HiV8jkthNatxJAKc0=;
 b=J+WEdh5AI2u2wxSxuLvtRZ8BZTWE54DdrSE/FlZWcMJ3ZKhMSyYfyqiXBlka8g+8ni
 OXeremq5gDQTroqrcr3dOjIei9xuHtGAOOzHrtsrTZL1cEKub2x8ZtDWuOwW+qt0Ibhg
 qTNsNfbdj9smM5QY/xZA9jAlGLPF4AljwqGzNi0Gk4Riv3jmlZRHV/ErEhovaKh4rOk9
 JEi4EWUgvN/Q8uyWD9YhMHOyimfNpB4T4kIZxbPxPLZwu1wHX8sPKUtM0wekdDqUbsg6
 oyFykHN0KFDbI4xiopiztZEXrdlgX8Jw6im6kMxtuyxgwZI0lHqD1F4Ty1gw2oneqMaw
 nzZw==
Subject: [PATCH 4/4] Add target 'mslm' for 'Latin Modern Typewriter' font
References: <09b2c966-ea73-1ef9-cf84-2e2eefbf7517@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <866f9e4e-150c-3f3d-3936-74839206fedf@gmail.com>
Date: Mon, 13 Mar 2017 00:43:28 +0900
MIME-Version: 1.0
In-Reply-To: <09b2c966-ea73-1ef9-cf84-2e2eefbf7517@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2f6614cdf5e1b0f7da9a5c05833dbc4a251eaa9c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 12 Mar 2017 23:28:39 +0900
Subject: [PATCH 4/4] Add target 'mslm' for 'Latin Modern Typewriter' font

"Latin Modern" family font[1] is an enhanced version of Computer
Modern font.

Although perfbook uses Times Roman clone for main text, "cmtt"
(Computer Modern Typewriter font) is a reasonable option for
monospace font despite its x-height is shorter than Times Roman.
As cmtt doesn't cover bold face, use "Latin Modern Typewriter" font
instead. By loading "lmodern" package first and "mathptmx", etc.,
later, only monospace font can be switched.

To do this, a comment of the form "%\usepackage{lmodern}" is added
in perfbook.tex. This comment will be substituted on the fly.

Also add a comment in help message on target "msn" to mention that
the monospace font (nimbusmononarrow) does not cover bold face.

Also add explicit version requirements of "mathastext" and
"inconsolata" packages in perfbook.tex and substituting string in
Makefile for target "1csf".

  [1] http://ctan.org/pkg/lm

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile     | 11 +++++++++--
 perfbook.tex |  3 ++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index e953842..2c88e6c 100644
--- a/Makefile
+++ b/Makefile
@@ -9,7 +9,7 @@ LATEXSOURCES = \

 LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex

-ABBREVTARGETS := 1c hb msns mstx msr msn msnt 1csf
+ABBREVTARGETS := 1c hb msns mstx msr msn msnt mslm 1csf

 PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)

@@ -124,9 +124,13 @@ perfbook-msnt.tex: perfbook.tex
 	sed -e 's/\[scaled=\.94\]{couriers}/[zerostyle=a]{newtxtt}/' < $< > $@
 	@echo "## This target requires font package newtxtt. ##"

+perfbook-mslm.tex: perfbook.tex
+	sed -e 's/%\\usepackage{lmodern}/\\usepackage{lmodern}/' \
+	    -e 's/\\usepackage\[scaled=\.94\]{couriers}/%\\usepackage[scaled=.94]{couriers}/' < $< > $@
+
 perfbook-1csf.tex: perfbook-1c.tex
 	sed -e 's/setboolean{sansserif}{false}/setboolean{sansserif}{true}/' \
-	    -e 's/\[scaled=\.94\]{couriers}/[var0]{inconsolata}/' < $< > $@
+	    -e 's/\[scaled=\.94\]{couriers}/[var0]{inconsolata}[2013\/07\/17]/' < $< > $@
 	@echo "## This target requires recent version (>= 1.3i) of mathastext. ##"

 # Rules related to perfbook_html are removed as of May, 2016
@@ -181,9 +185,12 @@ help:
 	@echo "  perfbook-msn.pdf,  msn:  2c with narrow courier clone"
 	@echo "  perfbook-mstx.pdf, mstx: 2c with txtt as monospace"
 	@echo "  perfbook-msnt.pdf, msnt: 2c with newtxtt as monospace (non-slashed 0)"
+	@echo "  perfbook-mslm.pdf, mslm: 2c with lmtt (Latin Modern Typewriter) as monospace"
+	@echo "       (Latin Modern is a clone of Computer Modern with additional type faces)"
 	@echo "  perfbook-1csf.pdf, 1csf: 1c with sans serif font"
 	@echo "  perfbook-msns.pdf, msns: 2c with non-scaled courier"
 	@echo "  \"msr\" and \"msn\" require \"nimbus15\"."
+	@echo "  \"msn\" doesn't cover bold face for monospace."
 	@echo "  \"msnt\" requires \"newtxtt\"."
 	@echo "  \"1csf\" requires recent version (>=1.3i) of \"mathastext\"."

diff --git a/perfbook.tex b/perfbook.tex
index a999705..e8234c4 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -5,6 +5,7 @@
 % standard packages

 % A more pleasant font
+%\usepackage{lmodern}
 \usepackage[T1]{fontenc} % use postscript type 1 fonts
 \usepackage{textcomp} % use symbols in TS1 encoding
 \usepackage{mathptmx} % use nice, standard fonts for roman,
@@ -69,7 +70,7 @@
 \IfSansSerif{
 \renewcommand{\familydefault}{\sfdefault}
 \normalfont
-\usepackage[italic]{mathastext}
+\usepackage[italic]{mathastext}[2016/01/06]
 \renewcommand{\path}[1]{\nolinkurl{#1}} % workaround of interference with mathastext
 }{}

-- 
2.7.4


