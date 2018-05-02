Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k8SldwP4ycOnYu8q/KVjov+7Zyb1P1+rFlEQ/M1j4P4=;
 b=sVMRtWgYwT+aV6+B61xB4jEjp0sAhgfdjE+UDFl5T7qIug6a28L6f41MfAPXQYvwLS
 Bk+3or2b9ttXKn8yg3hrm6PW5ZWYGB1rY1ir8z9R9EIDNSYPvqqQgAT3CKN7tpBw9TZV
 nA0sfrOUrcOZoVjGL82Sojvf6BtsA85vc0dyvWe109T5VAO1xOW02KYKNLbJEjOU9/aJ
 DBUiaX7PT+vpfWZOLz52tTum6YjCJv6uF2rviZPkOu5/pFJipsXFd3VjW2XbQuoCAb26
 Mqd4HhYkP9XDXksyPfz5TOAy8VRNKlc+9+u7njVzbSIKTAomZUoFmk11V0ZDujiqtcbK
 HRSA==
Subject: [PATCH 4/5] Makefile: Use latexpand instead of texexpand
References: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <74c13ecc-616e-c140-aed5-db50529774e1@gmail.com>
Date: Wed, 2 May 2018 13:19:50 +0900
MIME-Version: 1.0
In-Reply-To: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0e99d58218ee3552fa583eb0035e32b53265b667 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 30 Apr 2018 23:43:15 +0900
Subject: [PATCH 4/5] Makefile: Use latexpand instead of texexpand

latexpand of TeX Live [1] works similarly as texexpand.
By this change, latex2html package becomes unnecessary for
building perfbook.

While we are here, straighten dependency of autodate.tex and
perfbook_flat.tex.

NOTE: Irrelevant warnings from latexpand are redirected to /dev/null.

[1]: https://www.ctan.org/pkg/latexpand

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 9ac521c..a208920 100644
--- a/Makefile
+++ b/Makefile
@@ -101,14 +101,14 @@ $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
 $(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES)
 	sh utilities/runfirstlatex.sh $(basename $@)

-autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES)
+autodate.tex: perfbook.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN)
 	sh utilities/autodate.sh >autodate.tex

-perfbook_flat.tex: perfbook.tex $(LATEXSOURCES) $(PDFTARGETS_OF_EPS) $(TARGETS_OF_SVG)
+perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(TARGETS_OF_SVG)
 	echo > qqz.tex
 	echo > contrib.tex
 	echo > origpub.tex
-	texexpand perfbook.tex > $@
+	latexpand --empty-comments perfbook.tex 1> $@ 2> /dev/null

 qqz.tex: perfbook_flat.tex
 	sh utilities/extractqqz.sh < $< | perl utilities/qqzreorder.pl > $@
-- 
2.7.4


