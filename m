Return-Path: <SRS0=s3ma=5R=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=oIuxgeOcw7CnvcPx6i6P+bHIZdj1BdY6erv7N8Gkrzs=;
        b=P6uQDtU4BxJT9zTb8Q6mh9aT/nLmZDI9pghnEn+rO6e6N7DTgBCJSPdQHLsj5JZgHh
         4bTb/TSw7HhXcXf1ewQByAP4J8kKRklEWKxe45Wf+fW8FSEBKKQeZgqYr6hJ3cm1MuMI
         11UQtyVyNb7nDDBy+y1Ohl1SfwEA2y6xJhPLlT3iEAWcCfcO3oHlSaPRCmw++5ljFcV/
         iLnWDU8mOa/1v+PzzpXJ/6Zy6kb02XymZErvc2jaAYMungEljcf2wnHq6Oy07OpvGmbA
         nCzpCA2atlpOzIujqZTSmpW6+01TPcd7G+alj1v69VamMjMBwKd0uZAnB8kvlFIKcw66
         aJcg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Makefile: Keep perfbook-lt.tex in 'make clean'
Message-ID: <f1ffa8ee-6fc3-141d-e9c3-8230d5037f44@gmail.com>
Date: Thu, 2 Apr 2020 00:14:50 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a6bd9bf5fa162e8b2c271e51163da3f2f27ac8c1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 2 Apr 2020 00:04:56 +0900
Subject: [PATCH] Makefile: Keep perfbook-lt.tex in 'make clean'

Commit 39cb8ba9cf56 ("Let paper size be orthogonal to 1c/2c layout
variations") changed the base of main .tex file from perfbook.tex to
perfbook-lt.tex.
However, the recipe of "clean" was not updated and it removes
perfbook-lt.tex rather than perfbook.tex.

Fix this by using a new variable GENERATED_MAIN in "clean".

Fixes: 39cb8ba9cf56 ("Let paper size be orthogonal to 1c/2c layout variations")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a2786b1b..e24c5729 100644
--- a/Makefile
+++ b/Makefile
@@ -22,6 +22,7 @@ TWOCOLTARGETS := mstx msr msn msnt sf qq nq
 ABBREVTARGETS := lt hb a4 1c tcb msns mss $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
 
 PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)
+GENERATED_MAIN := $(filter-out perfbook-lt.tex,$(foreach v,$(ABBREVTARGETS),perfbook-$(v).tex)) perfbook.tex
 
 EPSSOURCES_FROM_TEX := \
 	SMPdesign/DiningPhilosopher5.eps \
@@ -490,7 +491,7 @@ clean:
 		-o -name '*.dvi' -o -name '*.log' \
 		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' \
 		-o -name '*.pdfp' -o -name '*.pdfq' | xargs rm -f
-	rm -f perfbook_flat.tex perfbook*.out perfbook-*.tex
+	rm -f perfbook_flat.tex perfbook*.out $(GENERATED_MAIN)
 	rm -f $(LATEXGENERATED)
 	rm -f CodeSamples/snippets.d
 	rm -f *.synctex*
-- 
2.17.1

