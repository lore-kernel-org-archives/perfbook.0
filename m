Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ssQK8zHYi8S2/6favGCXWveNLc6nQFiMgKUPXA5SU6I=;
 b=mpIwDe7+xSTfV5CzkOuysfgE9jOA5VT9GBVsogPbpxBXNu15qgThLmmC70rKSjEvB1
 6Er1DU4HeBuVprKY4x94BzGLR+Ny3KkP4fTPGDWd5TRoHiubXTl0jqZoIqaXIO68mm+5
 2OHyHdYSCYDyoMk7NbtnbzNRRivXkB9sP9NAVy/bGk+RYIVU5ToteRS+Y0KzkQ5mySza
 onNPmJ/HFMp7wK2jYuS86/rJInRcDNokD+Pu+qSNlbdee5Bj2QoT3VcmcLyA/j2Pxtnf
 4oY7BroIM2nJ+TkUy+Y0RPP8kQ4+pa5VkU6mj1vPds2sJnTXFgOjkt6eUi6gD4CKY/ah
 Gaug==
Subject: [PATCH 2/2] Makefile: Use secondary expansion
References: <dee02541-574c-3686-8dc7-5cb02303a408@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <085886d5-a536-1f32-8f37-bc039b31a2ba@gmail.com>
Date: Fri, 14 Oct 2016 07:08:40 +0900
MIME-Version: 1.0
In-Reply-To: <dee02541-574c-3686-8dc7-5cb02303a408@gmail.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3fc3583818c9103ef2d1c01516b362c4b6768604 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 10 Oct 2016 00:10:27 +0900
Subject: [PATCH 2/2] Makefile: Use secondary expansion

By using secondary expansion, abbreviated targets' dependencies
can be expressed as a single rule.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 6e6d66b..eb83af4 100644
--- a/Makefile
+++ b/Makefile
@@ -9,7 +9,9 @@ LATEXSOURCES = \

 LATEXGENERATED = qqz.tex contrib.tex origpub.tex

-PDFTARGETS := perfbook.pdf perfbook-1c.pdf perfbook-hb.pdf
+ABBREVTARGETS := 1c hb
+
+PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)

 EPSSOURCES_FROM_TEX := \
 	SMPdesign/DiningPhilosopher5.eps \
@@ -58,15 +60,11 @@ else
 	targ = $(default)
 endif

-.PHONY: all touchsvg clean distclean neatfreak 1c 2c hb ls-unused
+.PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS)
 all: $(targ)

-1c: perfbook-1c.pdf
-
 2c: perfbook.pdf

-hb: perfbook-hb.pdf
-
 $(PDFTARGETS): %.pdf: %.tex %.bbl
 	sh utilities/runlatex.sh $(basename $@)

@@ -156,3 +154,6 @@ ls-unused:
 neatfreak: distclean
 	# Don't forget to regenerate the .pdf from each .svg file
 	find . -name '*.pdf' | xargs rm -f
+
+.SECONDEXPANSION:
+$(ABBREVTARGETS): %: perfbook-$$@.pdf
-- 
2.7.4


