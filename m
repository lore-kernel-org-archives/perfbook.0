Return-Path: <SRS0=/aQ/=OQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=byfy/xdX2jHVqn2YMRKBfmrQQMfjPnNDv9+ePaTr0fc=;
        b=PZ+uPuc52iMfjsXwZIgFbH4tNhcFWk/GBLdwqcrKYTJoalUu1uKq7YT+LcuwkeU8H/
         s6fMUpBuOBRIgj0jwb0K0wY1jUIWiOM9Ey0wozpjllJKIVlsJs6gEGL8dryRoozawqUC
         ezCtHpCABJPmEUVht7aRXCyNmpoyHTw1EZTUC9H8sFsg6/rhA3AhF/0mRlmy2dvHeSqv
         fPkZMoGWKPu/jlYmTRbsXBzMQB4LgfWq1rY5LtvftaJBnVj0FncsZrrtGqe82Yrfm30D
         ZacR0Dtp7r4eUFg0hFaX8CbVZBcIWy2yjPPhzZ/HGVlQOWBz7IfnCqWZ7tpFsf2ZcB5O
         rJ0A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] Update on-the-fly font-substitution patterns
 for .eps and .svg files
Message-ID: <3842d24f-8c0b-c9aa-2259-38e62c807f32@gmail.com>
Date: Sun, 26 Sep 2021 19:33:03 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Key changes:

   o Merge patterns.
   o Add patterns to catch default monospace font.
   o Use "DejaVu Sans Mono" as a fallback for unmarked monospace
     (both .eps and .svg) and Courier (only .eps).
   o Use FreeSans of gnu-freefont as Symbol font. (mdsymbol is not
     required any longer.)
   o Update rules in Makefile to catch missing nice-to-have font
     packages and to emit informative messages.
   o Update item #9 of FAQ-BUILD.txt to mention the nice-to-have
     font packages.

"DejaVu Sans Mono" is thicker than Courier or its clone "Nimbus
Mono L/PS" and easier to read in diagrams.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

So, this is a follow-up patch to the fix of RCUspacetime.svg.
It has a default monospace font specification of:

  -inkscape-font-specification:'monospace, Normal';

, which old patterns in fixsvgfonts scripts failed to catch.

My first update was to replace it with "Nimbus Mono L/PS",
but it looked too light in the figure.

So I chose "DejaVu Sans Mono" font instead.
As a matter of fact, on some of minimal container images,
inkscape picked it as a fall back to the generic
'monospace, Normal' font and it looked nicer to my eyes.
"DejaVu Sans Mono" has the same width as "Courier" and
"Nimbus Mono L/PS".

fixfonts.sh and fixfonts-urwps.sh are updated similarly.
Now, monospace font in .fig files is replaced with
"DejaVu Sans Mono".

Affected figures are Figures 4.1 and A.2.

You need to run "make neatfreak" to see the effect of this change.

Do they look reasonable to you?

        Thanks, Akira
--
 FAQ-BUILD.txt                  |  5 +++--
 Makefile                       | 27 ++++++++++++++++++---------
 utilities/fixfonts-urwps.sh    |  5 +++--
 utilities/fixfonts.sh          |  5 +++--
 utilities/fixsvgfonts-urwps.sh | 31 ++++++++++++++-----------------
 utilities/fixsvgfonts.sh       | 19 ++++++++++---------
 6 files changed, 51 insertions(+), 41 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 80b71c42..eea4fa37 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -145,7 +145,7 @@
 			http://tex.stackexchange.com/questions/88423/
 
 		Following is a list of links to font packages perfbook
-		depends on as of January 2020 which are not included
+		depends on as of October 2021 which are not included
 		in -fonts-recommended:
 
 			https://www.ctan.org/pkg/newtx
@@ -154,7 +154,8 @@
 			https://www.ctan.org/pkg/courier-scaled
 			https://www.ctan.org/pkg/inconsolata
 			https://www.ctan.org/pkg/newtxsf
-			https://www.ctan.org/pkg/mdsymbol (for Fedora/CentOS)
+			https://www.ctan.org/pkg/gnu-freefont
+			https://www.ctan.org/pkg/dejavu
 
 	    Note 1: Manually installing a font package newer than the one
 		already exists in your TeX installation is a tricky business
diff --git a/Makefile b/Makefile
index 990ffe9e..eca23aab 100644
--- a/Makefile
+++ b/Makefile
@@ -101,14 +101,15 @@ STEELFONT := $(shell fc-list | grep -c -i steel)
 URWPS := $(shell fc-list | grep "Nimbus Mono PS" | wc -l)
 
 # required font packages
-FONTPACKAGES := $(shell kpsewhich newtxtext.sty nimbusmono.sty newtxtt.sty newtxsf.sty inconsolata.sty couriers.sty mdsymbol.sty)
+FONTPACKAGES := $(shell kpsewhich newtxtext.sty nimbusmono.sty newtxtt.sty newtxsf.sty inconsolata.sty couriers.sty)
 NEWTXTEXT := $(findstring newtxtext,$(FONTPACKAGES))
 NIMBUSMONO := $(findstring nimbusmono,$(FONTPACKAGES))
 NEWTXTT := $(findstring newtxtt,$(FONTPACKAGES))
 COURIERS := $(findstring couriers,$(FONTPACKAGES))
 NEWTXSF := $(findstring newtxsf,$(FONTPACKAGES))
 INCONSOLATA := $(findstring inconsolata,$(FONTPACKAGES))
-MDSYMBOL := $(findstring mdsymbol,$(FONTPACKAGES))
+FREESANS := $(shell fc-list | grep FreeSans | wc -l)
+DEJAVUMONO := $(shell fc-list | grep "DejaVu Sans Mono" | wc -l)
 
 # for line break in error text
 define n
@@ -122,11 +123,16 @@ FIXANEPSFONTS = utilities/fixanepsfonts.sh
 else
 FIXSVGFONTS   = utilities/fixsvgfonts-urwps.sh
 FIXANEPSFONTS = utilities/fixanepsfonts-urwps.sh
-  ifeq ($(MDSYMBOL),)
-    NEEDMDSYMBOL := 1
-  else
-    NEEDMDSYMBOL := 0
-  endif
+endif
+ifeq ($(FREESANS),0)
+  RECOMMEND_FREEFONT := 1
+else
+  RECOMMEND_FREEFONT := 0
+endif
+ifeq ($(DEJAVUMONO),0)
+  RECOMMEND_DEJAVU := 1
+else
+  RECOMMEND_DEJAVU := 0
 endif
 
 STEELFONTID := $(shell fc-list | grep -i steel | grep -c Steel)
@@ -476,8 +482,11 @@ ifeq ($(STEELFONTID),0)
 else
 	@sh $(FIXSVGFONTS) < $< > $<i
 endif
-ifeq ($(NEEDMDSYMBOL),1)
-	$(error Font package 'mdsymbol' not found. See #9 in FAQ-BUILD.txt)
+ifeq ($(RECOMMEND_FREEFONT),1)
+	$(info Nice-to-have font package 'gnu-freefont' not found. See #9 in FAQ-BUILD.txt)
+endif
+ifeq ($(RECOMMEND_DEJAVU),1)
+	$(info Nice-to-have font package 'dejavu' not found. See #9 in FAQ-BUILD.txt)
 endif
 ifeq ($(INKSCAPE_ONE),0)
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
diff --git a/utilities/fixfonts-urwps.sh b/utilities/fixfonts-urwps.sh
index f3e41fe3..a7a7b988 100644
--- a/utilities/fixfonts-urwps.sh
+++ b/utilities/fixfonts-urwps.sh
@@ -19,7 +19,7 @@
 #
 # Copyright (c) 2011-2019 Paul E. McKenney, IBM Corporation.
 # Copyright (c) 2019 Paul E. McKenney, Facebook.
-# Copyright (c) 2018 Akira Yokosawa.
+# Copyright (c) 2018, 2021 Akira Yokosawa.
 
 sed	-e 's+Times-Roman-BoldItalic+NimbusSans-BoldItalic+g' \
 	-e 's+Times-Roman-Italic+NimbusSans-Italic+g' \
@@ -56,4 +56,5 @@ sed	-e 's+Times-Roman-BoldItalic+NimbusSans-BoldItalic+g' \
 	-e 's+NimbusMono-Regular+NimbusMonoPS-Regular+g' \
 	-e 's+NimbusSans-Regular-Italic+NimbusSans-Italic+g' \
 	-e 's+NimbusSans-Regular-BoldItalic+NimbusSans-BoldItalic+g' \
-	-e 's+NimbusSans-Regular-Bold+NimbusSans-Bold+g'
+	-e 's+NimbusSans-Regular-Bold+NimbusSans-Bold+g' \
+	-e 's+NimbusMonoPS-Regular+DejaVuSansMono+g'
diff --git a/utilities/fixfonts.sh b/utilities/fixfonts.sh
index c5ea888a..275a289c 100644
--- a/utilities/fixfonts.sh
+++ b/utilities/fixfonts.sh
@@ -17,7 +17,7 @@
 #
 # Copyright (c) 2011-2019 Paul E. McKenney, IBM Corporation.
 # Copyright (c) 2019 Paul E. McKenney, Facebook.
-# Copyright (c) 2018 Akira Yokosawa
+# Copyright (c) 2018, 2021 Akira Yokosawa
 
 sed	-e 's+Times-Roman-BoldItalic+NimbusSanL-BoldItal+g' \
 	-e 's+Times-Roman-Italic+NimbusSanL-ReguItal+g' \
@@ -44,4 +44,5 @@ sed	-e 's+Times-Roman-BoldItalic+NimbusSanL-BoldItal+g' \
 	-e 's+Courier+NimbusMonL-Regu+g' \
 	-e 's+NimbusSanL-Regu-Italic+NimbusSanL-ReguItal+g' \
 	-e 's+NimbusSanL-Regu-BoldItalic+NimbusSanL-BoldItal+g' \
-	-e 's+NimbusSanL-Regu-Bold+NimbusSanL-Bold+g'
+	-e 's+NimbusSanL-Regu-Bold+NimbusSanL-Bold+g' \
+	-e 's+NimbusMonL-Regu +DejaVuSansMono +g'
diff --git a/utilities/fixsvgfonts-urwps.sh b/utilities/fixsvgfonts-urwps.sh
index 17c30e81..a3dcd91a 100644
--- a/utilities/fixsvgfonts-urwps.sh
+++ b/utilities/fixsvgfonts-urwps.sh
@@ -3,21 +3,18 @@
 # fixsvgfonts-urwps.sh: Convert an .svg file to use embeddable fonts,
 #       taking from standard input and putting on standard output.
 #
-# Copyright (c) 2018 Akira Yokosawa
+# Copyright (c) 2018, 2021 Akira Yokosawa
 
-sed	-e 's+family:Helvetica+family:Nimbus Sans+g' \
-	-e 's+family="Helvetica+family="Nimbus Sans+g' \
-	-e 's+family:Sans+family:Nimbus Sans+g' \
-	-e 's+cation:Sans+cation:Nimbus Sans+g' \
-	-e 's+family:sans-serif+family:Nimbus Sans+g' \
-	-e 's+cation:sans-serif+cation:Nimbus Sans+g' \
-	-e 's+family:Courier+family:Nimbus Mono PS+g' \
-	-e 's+family="Courier+family="Nimbus Mono PS+g' \
-	-e 's+family:Symbol+family:MdSymbol+g' \
-	-e 's+cation:Symbol+cation:MdSymbol+g' \
-	-e 's+family:Nimbus Sans L+family:Nimbus Sans+g' \
-	-e 's+family="Nimbus Sans L+family="Nimbus Sans+g' \
-	-e 's+cation:Nimbus Sans L+cation:Nimbus Sans+g' \
-	-e 's+family:Nimbus Mono L+family:Nimbus Mono PS+g' \
-	-e 's+family="Nimbus Mono L+family="Nimbus Mono PS+g' \
-	-e 's+cation:Nimbus Mono L+cation:Nimbus Mono PS+g'
+sed	-e 's+:Helvetica+:Nimbus Sans+g' \
+	-e 's+="Helvetica+="Nimbus Sans+g' \
+	-e 's+:Sans+:Nimbus Sans+g' \
+	-e 's+:sans-serif+:Nimbus Sans+g' \
+	-e 's+:Courier+:Nimbus Mono PS+g' \
+	-e 's+="Courier+="Nimbus Mono PS+g' \
+	-e 's+:monospace+:DejaVu Sans Mono+g' \
+	-e 's+monospace,+DejaVu Sans Mono,+g' \
+	-e 's+:Symbol+:FreeSans+g' \
+	-e 's+:Nimbus Sans L+:Nimbus Sans+g' \
+	-e 's+="Nimbus Sans L+="Nimbus Sans+g' \
+	-e 's+:Nimbus Mono L+:Nimbus Mono PS+g' \
+	-e 's+="Nimbus Mono L+="Nimbus Mono PS+g'
diff --git a/utilities/fixsvgfonts.sh b/utilities/fixsvgfonts.sh
index 47dbaea9..1fa4fedb 100644
--- a/utilities/fixsvgfonts.sh
+++ b/utilities/fixsvgfonts.sh
@@ -3,13 +3,14 @@
 # fixsvgfonts.sh: Convert an .svg file to use embeddable fonts, taking from
 #	standard input and putting on standard output.
 #
-# Copyright (c) 2018 Akira Yokosawa
+# Copyright (c) 2018, 2021 Akira Yokosawa
 
-sed	-e 's+family:Helvetica+family:Nimbus Sans L+g' \
-	-e 's+family="Helvetica+family="Nimbus Sans L+g' \
-	-e 's+family:Sans+family:Nimbus Sans L+g' \
-	-e 's+cation:Sans+cation:Nimbus Sans L+g' \
-	-e 's+family:sans-serif+family:Nimbus Sans L+g' \
-	-e 's+cation:sans-serif+cation:Nimbus Sans L+g' \
-	-e 's+family:Courier+family:Nimbus Mono L+g' \
-	-e 's+family="Courier+family="Nimbus Mono L+g'
+sed	-e 's+:Helvetica+:Nimbus Sans L+g' \
+	-e 's+="Helvetica+="Nimbus Sans L+g' \
+	-e 's+:Sans+:Nimbus Sans L+g' \
+	-e 's+:sans-serif+:Nimbus Sans L+g' \
+	-e 's+:Courier+:Nimbus Mono L+g' \
+	-e 's+="Courier+="Nimbus Mono L+g' \
+	-e 's+:monospace+:DejaVu Sans Mono+g' \
+	-e 's+monospace,+DejaVu Sans Mono,+g' \
+	-e 's+:Symbol+:FreeSans+g'
-- 
2.17.1

