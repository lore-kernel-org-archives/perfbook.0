Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sfTYp8IWEvEO62iw8ccpssyprFml04N1jhXxCAODf1Y=;
        b=CUDqXEOSXTMJ24DZLduQhbtODHB56qg6jN04yocAnXONuNLAyjAxDNjLHVq2aE8KVg
         IimB+MpGGIq4lF3qRuIBQfC63biOYD7tYUmNFYdZQA8NlqTW04o/LKt2r6xKzQ3qLfms
         jqBmh141Y3Sms2CV5mm4WdPYja/S4Ha/s7TjrvaIFkodLLX05vCLdpMAeDmEAbQS55Qd
         qb/KCC/CvQQJv2oCo+SGb6y3CJF5bsyBZhze0Uifjq8poxffhig4CJDbfaTPdTl6EZym
         WX/Jwlw/nHMio4NTs1HnXYPQXo4HierbgthMj8UkwCWPnhG4iu5hCSirvGE9Xg9ZRy5V
         2txg==
Subject: [PATCH 3/8] Makefile: Add check of font package availability
References: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <64c78cdc-abf9-bc50-2c17-e910069a1f2e@gmail.com>
Date: Sun, 24 Feb 2019 09:05:51 +0900
MIME-Version: 1.0
In-Reply-To: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 81b62c1185e0e9439bf201bca5921742f786efca Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 22 Feb 2019 20:59:22 +0900
Subject: [PATCH 3/8] Makefile: Add check of font package availability

Add existence check of relatively recent font packages required for
experimental targets.

Those targets used to just print info on required font, and to run
"pdflatex".  Now "make" aborts with a message indicating where to
see if any of required font packages is missing.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 42 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 89abea2..338669a 100644
--- a/Makefile
+++ b/Makefile
@@ -58,14 +58,30 @@ PDFTARGETS_OF_EPSOTHER := $(filter-out $(PDFTARGETS_OF_EPSORIG),$(PDFTARGETS_OF_
 
 BIBSOURCES := bib/*.bib alphapf.bst
 
+# required commands
 DOT := $(shell which dot 2>/dev/null)
 FIG2EPS := $(shell which fig2eps 2>/dev/null)
 A2PING := $(shell which a2ping 2>/dev/null)
 INKSCAPE := $(shell which inkscape 2>/dev/null)
 LATEXPAND := $(shell which latexpand 2>/dev/null)
+
+# required fonts
 STEELFONT := $(shell fc-list | grep -c -i steel)
 URWPS := $(shell fc-list | grep "Nimbus Mono PS" | wc -l)
 
+# required font packages
+FONTPACKAGES := $(shell kpsewhich nimbusmono.sty newtxtt.sty newtxsf.sty inconsolata.sty)
+NIMBUSMONO := $(findstring nimbusmono,$(FONTPACKAGES))
+NEWTXTT := $(findstring newtxtt,$(FONTPACKAGES))
+NEWTXSF := $(findstring newtxsf,$(FONTPACKAGES))
+INCONSOLATA := $(findstring inconsolata,$(FONTPACKAGES))
+
+# for line break in error text
+define n
+
+
+endef
+
 ifeq ($(URWPS),0)
 FIXSVGFONTS   = utilities/fixsvgfonts.sh
 FIXANEPSFONTS = utilities/fixanepsfonts.sh
@@ -168,27 +184,43 @@ perfbook-mstx.tex: perfbook.tex
 	sed -e 's/%msfontstub/\\renewcommand*\\ttdefault{txtt}/' < $< > $@
 
 perfbook-msr.tex: perfbook.tex
+ifeq ($(NIMBUSMONO),)
+	$(error Font package 'nimbus15' not found. See #9 in FAQ-BUILD.txt)
+endif
 	sed -e 's/%msfontstub/\\usepackage[scaled=.94]{nimbusmono}/' \
 	    -e 's/{nimbusavail}{false}/{nimbusavail}{true}/' < $< > $@
-	@echo "## This target requires font package nimbus15. ##"
 
 perfbook-msn.tex: perfbook.tex
+ifeq ($(NIMBUSMONO),)
+	$(error Font package 'nimbus15' not found. See #9 in FAQ-BUILD.txt)
+endif
 	sed -e 's/\\renewcommand\*\\ttdefault{lmtt}//' \
 	    -e 's/{lmttforcode}{true}/{lmttforcode}{false}/' \
 	    -e 's/{nimbusavail}{false}/{nimbusavail}{true}/' < $< > $@
-	@echo "## This target requires font package nimbus15. ##"
 
 perfbook-msnt.tex: perfbook.tex
+ifeq ($(NEWTXTT),)
+	$(error Font package 'newtxtt' not found.$nInstall it or try 'make mstx' instead. See #9 in FAQ-BUILD.txt)
+endif
+ifeq ($(NIMBUSMONO),)
+	$(error Font package 'nimbus15' not found. See #9 in FAQ-BUILD.txt)
+endif
 	sed -e 's/%msfontstub/\\usepackage[zerostyle=a]{newtxtt}/' \
 	    -e 's/{nimbusavail}{false}/{nimbusavail}{true}/' < $< > $@
-	@echo "## This target requires font packages newtxtt and nimbus15. ##"
-	@echo "## If build fails, try target 'mstx' instead.               ##"
 
 perfbook-1csf.tex: perfbook-1c.tex
+ifeq ($(NEWTXSF),)
+	$(error Font package 'newtxsf' not found. See #9 in FAQ-BUILD.txt)
+endif
+ifeq ($(INCONSOLATA),)
+	$(error Font package 'inconsolata' not found. See #9 in FAQ-BUILD.txt)
+endif
+ifeq ($(NIMBUSMONO),)
+	$(error Font package 'nimbus15' not found. See #9 in FAQ-BUILD.txt)
+endif
 	sed -e 's/setboolean{sansserif}{false}/setboolean{sansserif}{true}/' \
 	    -e 's/{nimbusavail}{false}/{nimbusavail}{true}/' \
 	    -e 's/%msfontstub/\\usepackage[var0]{inconsolata}[2013\/07\/17]/' < $< > $@
-	@echo "## This target requires math font packages newtxsf and nimbus15. ##"
 
 # Rules related to perfbook_html are removed as of May, 2016
 
-- 
2.7.4


