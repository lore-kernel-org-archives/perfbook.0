Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yH050uDPK6+ka2PYIiGGlJQk0UZ61pRifL8RxD1tj7M=;
        b=iv0QaSgm7dQXoyaBy/wG0fjiCWubtlPTCyU7er3oKmUSjAc04OzVbVaWCTXiCxRQJx
         vC6XApbH2ZDHHFjnoskuaTXPhRR39+gqc30HRf3qHqlzmnoUGoJcpQDtkOESNCMO2pi/
         qh6rCCbMb1RgK4GoddWJLWx7uPNwRdCJ/QmVsnLq+skydqZVr68l/+gr/idsE3J17h4J
         cxUmibzfhyetbR5niAWTepHy53UE/fwN8xQomHNl4SsE4vMQF29DaWFAd/+QxALRY62X
         TEOY603OHM6hWYIhNUIYOyMcfeT8mF7cSPFU7K/9qWvTFBlLEwulwzRFv4kyufMGlhnM
         tszA==
Subject: [PATCH 7/8] Makefile: Don't remove .fcv and .ltms files in target
 'clean'
References: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d214ff5e-d006-62ec-3672-7ff9ce1d64a6@gmail.com>
Date: Sun, 24 Feb 2019 09:16:35 +0900
MIME-Version: 1.0
In-Reply-To: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e0bedfe0587f182db5401fe7c244e4b8487aaab9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 23 Feb 2019 19:40:38 +0900
Subject: [PATCH 7/8] Makefile: Don't remove .fcv and .ltms files in target 'clean'

In the case of a build error due to out-of-date CodeSamples/snippets.d,
Removing the outdated file suffices. .fcv and .ltms files need not
be removed.  Defer their removal to the target 'distclean'.

While we are here, add CodeSamples/snippets.mk to OBSOLETE_FILES.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 648091a..c07dde0 100644
--- a/Makefile
+++ b/Makefile
@@ -37,7 +37,7 @@ SVGSOURCES := $(wildcard */*.svg)
 FAKE_EPS_FROM_SVG := $(SVGSOURCES:%.svg=%.eps)
 PDFTARGETS_OF_SVG := $(SVGSOURCES:%.svg=%.pdf)
 
-OBSOLETE_FILES = extraction $(FAKE_EPS_FROM_SVG)
+OBSOLETE_FILES = extraction $(FAKE_EPS_FROM_SVG) CodeSamples/snippets.mk
 
 EPSSOURCES_DUP := \
 	$(wildcard */*.eps) \
@@ -346,16 +346,16 @@ clean:
 	find . -name '*.aux' -o -name '*.blg' \
 		-o -name '*.dvi' -o -name '*.log' \
 		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' \
-		-o -name '*.fcv' -o -name '*.ltms' \
 		-o -name '*.pdfp' -o -name '*.pdfq' | xargs rm -f
 	rm -f perfbook_flat.tex perfbook*.out perfbook-*.tex
 	rm -f $(LATEXGENERATED)
-	rm -f CodeSamples/snippets.mk CodeSamples/snippets.d
+	rm -f CodeSamples/snippets.d
 	@rm -f $(OBSOLETE_FILES)
 
 distclean: clean
 	sh utilities/cleanpdf.sh
 	rm -f $(EPSSOURCES_FROM_DOT) $(EPSSOURCES_FROM_TEX) $(EPSSOURCES_FROM_FIG)
+	find . -name '*.fcv' -o -name '*.ltms' | xargs rm -f
 
 touchsvg:
 	find . -name '*.svg' | xargs touch
-- 
2.7.4


