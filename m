Return-Path: <SRS0=dwV0=3F=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ezLQXrW0A8CY6RRKdDEpGJ5yaFVRu/Hf2dw1hAl/WlU=;
        b=H6f2Jj7E5vQhtD4RJ9StAKInwJ695QreNf0DFBKz8gJx6MsY4cR9P8xI19a1o+EXG4
         RTOW5gq/5KPnBhwuuscQVqgtVM8fdC5X2SsZTgvPGpF8+S4SutH6s2ipvPk4gDRih7Pq
         hA89ushnbmqKHTF8Nu8sk60LfE5nNZCVFkYj4HWwM4FD8xxBPWPH4Q5+bbyHRPnk3g4C
         v6Rn0l4hOO5cM4LUZ9t6vio+WbmL2OlnznMXpV/78jFwKgvWaO7QnBZNdlGwDzsqRkYw
         gOsFkSjZMCMgtMGQLshJsE36wCp2z29wuQPqOwb6jeecYt/hOUNIiT6qk+5DeJNtIyBX
         l1pw==
Subject: [PATCH 1/3] utilities/fixsvgfonts-urwps.sh: Use symbol font available
 on F31
References: <805bd7c5-477f-c398-b025-34a630f663f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <798e25b0-80c5-2030-224d-75378fcafd39@gmail.com>
Date: Fri, 17 Jan 2020 06:57:46 +0900
MIME-Version: 1.0
In-Reply-To: <805bd7c5-477f-c398-b025-34a630f663f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 539b8d93663885fd9184ebee35bfd0ad91482687 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 14 Jan 2020 21:35:06 +0900
Subject: [PATCH 1/3] utilities/fixsvgfonts-urwps.sh: Use symbol font available on F31

Fedora 31 upgraded pango to 1.44 which abandoned support of bitmap
and type1 fonts such as StandardSymbolsPS.t1 [1].
This change affected some of .svg figures under advsync/.
Use MdSymbol (.otf) as an alternative which should be available in
texlive-collection-fontsextra on Fedora.
Or it can be installed on its own as texlive-mdsymbol.

Update Makefile and FAQ-BUILD.txt to add existence check of MdSymbol.

Also remove a few unnecessary rules for symbol fonts in scripts for
.eps files and Ubuntu's .svg files.

[1]: https://blogs.gnome.org/mclasen/2019/05/25/pango-future-directions/

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt                  |  3 ++-
 Makefile                       | 11 ++++++++++-
 utilities/fixfonts-urwps.sh    |  5 +----
 utilities/fixfonts.sh          |  4 +---
 utilities/fixsvgfonts-urwps.sh |  8 +++-----
 utilities/fixsvgfonts.sh       |  4 +---
 6 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 56d60a3e..27780759 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -146,7 +146,7 @@
 			http://tex.stackexchange.com/questions/88423/
 
 		Following is a list of links to font packages perfbook
-		depends on as of October 2019 which are not included
+		depends on as of January 2020 which are not included
 		in -fonts-recommended:
 
 			https://www.ctan.org/pkg/newtx
@@ -155,6 +155,7 @@
 			https://www.ctan.org/pkg/courier-scaled
 			https://www.ctan.org/pkg/inconsolata
 			https://www.ctan.org/pkg/newtxsf
+			https://www.ctan.org/pkg/mdsymbol (for Fedora/CentOS)
 
 	    Note 1: Manually installing a font package newer than the one
 		already exists in your TeX installation is a tricky business
diff --git a/Makefile b/Makefile
index 7f2af1b1..06226d63 100644
--- a/Makefile
+++ b/Makefile
@@ -71,13 +71,14 @@ STEELFONT := $(shell fc-list | grep -c -i steel)
 URWPS := $(shell fc-list | grep "Nimbus Mono PS" | wc -l)
 
 # required font packages
-FONTPACKAGES := $(shell kpsewhich newtxtext.sty nimbusmono.sty newtxtt.sty newtxsf.sty inconsolata.sty couriers.sty)
+FONTPACKAGES := $(shell kpsewhich newtxtext.sty nimbusmono.sty newtxtt.sty newtxsf.sty inconsolata.sty couriers.sty mdsymbol.sty)
 NEWTXTEXT := $(findstring newtxtext,$(FONTPACKAGES))
 NIMBUSMONO := $(findstring nimbusmono,$(FONTPACKAGES))
 NEWTXTT := $(findstring newtxtt,$(FONTPACKAGES))
 COURIERS := $(findstring couriers,$(FONTPACKAGES))
 NEWTXSF := $(findstring newtxsf,$(FONTPACKAGES))
 INCONSOLATA := $(findstring inconsolata,$(FONTPACKAGES))
+MDSYMBOL := $(findstring mdsymbol,$(FONTPACKAGES))
 
 # for line break in error text
 define n
@@ -91,6 +92,11 @@ FIXANEPSFONTS = utilities/fixanepsfonts.sh
 else
 FIXSVGFONTS   = utilities/fixsvgfonts-urwps.sh
 FIXANEPSFONTS = utilities/fixanepsfonts-urwps.sh
+  ifeq ($(MDSYMBOL),)
+    NEEDMDSYMBOL := 1
+  else
+    NEEDMDSYMBOL := 0
+  endif
 endif
 
 STEELFONTID := $(shell fc-list | grep -i steel | grep -c Steel)
@@ -302,6 +308,9 @@ ifeq ($(STEELFONTID),0)
 	@sh $(FIXSVGFONTS) < $< | sed -e 's/Steel City Comic/Test/g' > $<i
 else
 	@sh $(FIXSVGFONTS) < $< > $<i
+endif
+ifeq ($(NEEDMDSYMBOL),1)
+	$(error Font package 'mdsymbol' not found. See #9 in FAQ-BUILD.txt)
 endif
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
 	@rm -f $<i
diff --git a/utilities/fixfonts-urwps.sh b/utilities/fixfonts-urwps.sh
index 7521f15b..f3e41fe3 100644
--- a/utilities/fixfonts-urwps.sh
+++ b/utilities/fixfonts-urwps.sh
@@ -40,7 +40,6 @@ sed	-e 's+Times-Roman-BoldItalic+NimbusSans-BoldItalic+g' \
 	-e 's+Helvetica-Narrow+NimbusSansNarrow-Regular+g' \
 	-e 's+Helvetica-iso+NimbusSans-Regular+g' \
 	-e 's+Helvetica+NimbusSans-Regular+g' \
-	-e 's+Symbol+StandardSymbolsPS+g' \
 	-e 's+Courier-BoldOblique+NimbusMonoPS-BoldItalic+g' \
 	-e 's+Courier-Oblique+NimbusMonoPS-Italic+g' \
 	-e 's+Courier-Bold+NimbusMonoPS-Bold+g' \
@@ -53,10 +52,8 @@ sed	-e 's+Times-Roman-BoldItalic+NimbusSans-BoldItalic+g' \
 	-e 's+NimbusMonL-ReguObli+NimbusMonoPS-Italic+g' \
 	-e 's+NimbusMonL-Bold+NimbusMonoPS-Bold+g' \
 	-e 's+NimbusMonL-Regu+NimbusMonoPS-Regular+g' \
-	-e 's+StandardSymL+StandardSymbolsPS+g' \
 	-e 's+NimbusMono-Regular-Bold+NimbusMonoPS-Bold+g' \
 	-e 's+NimbusMono-Regular+NimbusMonoPS-Regular+g' \
 	-e 's+NimbusSans-Regular-Italic+NimbusSans-Italic+g' \
 	-e 's+NimbusSans-Regular-BoldItalic+NimbusSans-BoldItalic+g' \
-	-e 's+NimbusSans-Regular-Bold+NimbusSans-Bold+g' \
-	-e 's+StandardSymbolsPS-+Symbol-+g'
+	-e 's+NimbusSans-Regular-Bold+NimbusSans-Bold+g'
diff --git a/utilities/fixfonts.sh b/utilities/fixfonts.sh
index f50ac6db..c5ea888a 100644
--- a/utilities/fixfonts.sh
+++ b/utilities/fixfonts.sh
@@ -38,12 +38,10 @@ sed	-e 's+Times-Roman-BoldItalic+NimbusSanL-BoldItal+g' \
 	-e 's+Helvetica-Narrow+NimbusSanL-ReguCond+g' \
 	-e 's+Helvetica-iso+NimbusSanL-Regu+g' \
 	-e 's+Helvetica+NimbusSanL-Regu+g' \
-	-e 's+Symbol+StandardSymL+g' \
 	-e 's+Courier-BoldOblique+NimbusMonL-BoldObli+g' \
 	-e 's+Courier-Oblique+NimbusMonL-ReguObli+g' \
 	-e 's+Courier-Bold+NimbusMonL-Bold+g' \
 	-e 's+Courier+NimbusMonL-Regu+g' \
 	-e 's+NimbusSanL-Regu-Italic+NimbusSanL-ReguItal+g' \
 	-e 's+NimbusSanL-Regu-BoldItalic+NimbusSanL-BoldItal+g' \
-	-e 's+NimbusSanL-Regu-Bold+NimbusSanL-Bold+g' \
-	-e 's+StardardSymL-+Symbol-+g'
+	-e 's+NimbusSanL-Regu-Bold+NimbusSanL-Bold+g'
diff --git a/utilities/fixsvgfonts-urwps.sh b/utilities/fixsvgfonts-urwps.sh
index a917fea2..55a5a3f2 100644
--- a/utilities/fixsvgfonts-urwps.sh
+++ b/utilities/fixsvgfonts-urwps.sh
@@ -11,13 +11,11 @@ sed	-e 's+family:Helvetica+family:Nimbus Sans+g' \
 	-e 's+cation:Sans+cation:Nimbus Sans+g' \
 	-e 's+family:Courier+family:Nimbus Mono PS+g' \
 	-e 's+family="Courier+family="Nimbus Mono PS+g' \
-	-e 's+family:Symbol+family:Standard Symbols PS+g' \
-	-e 's+cation:Symbol+cation:Standard Symbols PS+g' \
+	-e 's+family:Symbol+family:MdSymbol+g' \
+	-e 's+cation:Symbol+cation:MdSymbol+g' \
 	-e 's+family:Nimbus Sans L+family:Nimbus Sans+g' \
 	-e 's+family="Nimbus Sans L+family="Nimbus Sans+g' \
 	-e 's+cation:Nimbus Sans L+cation:Nimbus Sans+g' \
 	-e 's+family:Nimbus Mono L+family:Nimbus Mono PS+g' \
 	-e 's+family="Nimbus Mono L+family="Nimbus Mono PS+g' \
-	-e 's+cation:Nimbus Mono L+cation:Nimbus Mono PS+g' \
-	-e 's+family:Standard Symbols L+family:Standard Symbols PS+g' \
-	-e 's+cation:Standard Symbols L+cation:Standard Symbols PS+g'
+	-e 's+cation:Nimbus Mono L+cation:Nimbus Mono PS+g'
diff --git a/utilities/fixsvgfonts.sh b/utilities/fixsvgfonts.sh
index 287d3e2c..657c3001 100644
--- a/utilities/fixsvgfonts.sh
+++ b/utilities/fixsvgfonts.sh
@@ -10,6 +10,4 @@ sed	-e 's+family:Helvetica+family:Nimbus Sans L+g' \
 	-e 's+family:Sans+family:Nimbus Sans L+g' \
 	-e 's+cation:Sans+cation:Nimbus Sans L+g' \
 	-e 's+family:Courier+family:Nimbus Mono L+g' \
-	-e 's+family="Courier+family="Nimbus Mono L+g' \
-	-e 's+family:Symbol+family:Standard Symbols L+g' \
-	-e 's+cation:Symbol+cation:Standard Symbols L+g'
+	-e 's+family="Courier+family="Nimbus Mono L+g'
-- 
2.17.1


