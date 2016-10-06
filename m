Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=gQgL+Om4BaG7s5NHfkowbf6WlDptWDxC4UcZvHZvYT0=;
 b=fTWJjY+QFIo7HBPp9XJCRCe9MGDopNbL6BINzV9/h6iRLgg6nldrunVueb2qz3KM1N
 e+MbqrjIHFaREU4KZibSagSgpf503pKo7tfYH5rqCFNoFC3URdiK84R8gP7DjLPSCff9
 dnTrXO+JFYZN8PFhneBO9W/W/vJGBAChnnm4ywkvModfD/I265DQSMXf3NCeI6hkfflj
 SfHwIcVU5kK0KiJxanc6sZyDg5f6ECteZfo20/VmuD3ZAMUesaVAR5QGrwrcFDV54wqd
 AZPRczNBrF1RO55kfQUxuYIabBZH0LgxxCLP4MdNf0Wgq8YE598JEJh8tIauTamlzz5f
 cetA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Makefile: Use implicit rules for various layout options
Message-ID: <a63bd961-2db3-3348-419f-5d96bf5a5d19@gmail.com>
Date: Fri, 7 Oct 2016 00:24:54 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9300942224fc8072cad9d6582858993c5efa5131 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 6 Oct 2016 23:57:07 +0900
Subject: [PATCH] Makefile: Use implicit rules for various layout options

This commit replaces redundant rules for perfbook.pdf,
perfbook-1c.pdf, and perfbook-hb.pdf with custom implicit rules.
These implicit rules will also help when you want to add
tentative rules to try some experimental layout option.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/Makefile b/Makefile
index 0207473..55361c3 100644
--- a/Makefile
+++ b/Makefile
@@ -9,6 +9,8 @@ LATEXSOURCES = \

 LATEXGENERATED = qqz.tex contrib.tex origpub.tex

+PDFTARGETS := perfbook.pdf perfbook-1c.pdf perfbook-hb.pdf
+
 EPSSOURCES_FROM_TEX := \
 	SMPdesign/DiningPhilosopher5.eps \
 	SMPdesign/DiningPhilosopher5TB.eps \
@@ -65,14 +67,14 @@ all: $(targ)

 hb: perfbook-hb.pdf

-perfbook.pdf: perfbook.bbl
-	sh utilities/runlatex.sh perfbook
+$(PDFTARGETS): %.pdf: %.tex %.bbl
+	sh utilities/runlatex.sh $(basename $@)

-perfbook.bbl: $(BIBSOURCES) perfbook.aux
-	bibtex perfbook
+$(PDFTARGETS:.pdf=.bbl): %.bbl: $(BIBSOURCES) %.aux
+	bibtex $(basename $@)

-perfbook.aux: $(LATEXSOURCES) $(LATEXGENERATED)
-	sh utilities/runfirstlatex.sh perfbook
+$(PDFTARGETS:.pdf=.aux): $(LATEXSOURCES) $(LATEXGENERATED)
+	sh utilities/runfirstlatex.sh $(basename $@)

 perfbook_flat.tex: perfbook.tex $(LATEXSOURCES) $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG)
 	echo > qqz.tex
@@ -89,30 +91,12 @@ contrib.tex: perfbook_flat.tex qqz.tex
 origpub.tex: perfbook_flat.tex
 	sh utilities/extractorigpub.sh < perfbook_flat.tex > origpub.tex

-perfbook-1c.pdf: perfbook-1c.tex perfbook-1c.bbl
-	sh utilities/runlatex.sh perfbook-1c
-
 perfbook-1c.tex: perfbook.tex
 	sed -e 's/,twocolumn//' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < perfbook.tex > perfbook-1c.tex

-perfbook-1c.bbl: $(BIBSOURCES) perfbook-1c.aux
-	bibtex perfbook-1c
-
-perfbook-1c.aux: $(LATEXSOURCES) $(LATEXGENERATED)
-	sh utilities/runfirstlatex.sh perfbook-1c
-
-perfbook-hb.pdf: perfbook-hb.tex perfbook-hb.bbl
-	sh utilities/runlatex.sh perfbook-hb
-
 perfbook-hb.tex: perfbook.tex
 	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < perfbook.tex > perfbook-hb.tex

-perfbook-hb.bbl: $(BIBSOURCES) perfbook-hb.aux
-	bibtex perfbook-hb
-
-perfbook-hb.aux: $(LATEXSOURCES) $(LATEXGENERATED)
-	sh utilities/runfirstlatex.sh perfbook-hb
-
 # Rules related to perfbook_html are removed as of May, 2016

 $(EPSSOURCES_FROM_TEX): %.eps: %.tex
-- 
2.7.4

