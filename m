Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=qCRf017sMOMcMdzwE6mIkCvFenYZoUCdq9FKAOMeFc4=;
 b=MweWvp/BXC4jqO0EdgsPcaOEAuhUxJKI8dGODFHBZjFXd4+jcGGg73uYNHJzzjQBQx
 PGOZEjRuQNaHCU7Awccfs8tID130EUabAyOs1Z3cAih1zWJpRfDFNMB4SGvaN8IzNCaR
 I9LZxSQluhd4t8Po6LzzNcOnFl7Qsk0MACtkAynI4Yt8SSHv29mUp7t9WOUhKnt3L120
 YTCvcPOWjl4DgiboRG87SVKcezE4HXexpkJ11Nf5ARY0MIvuz6Mbkqx00KDs4WFk5u0E
 yH0P56QkinqVa70ue674gmxcKNKdxeLys6y7dHkuUd80ttsX9lRs8zsKt2Ol0ZLJYIZ+
 3Xyw==
Subject: [PATCH 1/2] Makefile: Use more automatic variables
References: <dee02541-574c-3686-8dc7-5cb02303a408@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <459f86ae-cb02-3eea-ab8b-eaebf0e68be5@gmail.com>
Date: Fri, 14 Oct 2016 07:07:07 +0900
MIME-Version: 1.0
In-Reply-To: <dee02541-574c-3686-8dc7-5cb02303a408@gmail.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2d0765641c633f9e259339f0814259aefbae863e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 9 Oct 2016 20:38:46 +0900
Subject: [PATCH 1/2] Makefile: Use more automatic variables

This commit simplifies some rules by using automatic variables
such as "$<" and "$@".
It also simplifies the "clean" rule by using wildcards.
.gitignore is modified accordingly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .gitignore |  7 ++-----
 Makefile   | 15 +++++++--------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/.gitignore b/.gitignore
index 4a2dc33..965b94d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -18,11 +18,8 @@ perfbook_flat.tex
 qqz.tex
 contrib.tex
 origpub.tex
-perfbook.out
-perfbook-1c.tex
-perfbook-1c.out
-perfbook-hb.tex
-perfbook-hb.out
+perfbook*.out
+perfbook-*.tex
 extraction
 embedfonts

diff --git a/Makefile b/Makefile
index 55361c3..6e6d66b 100644
--- a/Makefile
+++ b/Makefile
@@ -80,22 +80,22 @@ perfbook_flat.tex: perfbook.tex $(LATEXSOURCES) $(PDFTARGETS_OF_EPS) $(PDFTARGET
 	echo > qqz.tex
 	echo > contrib.tex
 	echo > origpub.tex
-	texexpand perfbook.tex > perfbook_flat.tex
+	texexpand perfbook.tex > $@

 qqz.tex: perfbook_flat.tex
-	sh utilities/extractqqz.sh < perfbook_flat.tex > qqz.tex
+	sh utilities/extractqqz.sh < $< > $@

 contrib.tex: perfbook_flat.tex qqz.tex
-	cat perfbook_flat.tex qqz.tex | sh utilities/extractcontrib.sh > contrib.tex
+	cat $^ | sh utilities/extractcontrib.sh > $@

 origpub.tex: perfbook_flat.tex
-	sh utilities/extractorigpub.sh < perfbook_flat.tex > origpub.tex
+	sh utilities/extractorigpub.sh < $< > $@

 perfbook-1c.tex: perfbook.tex
-	sed -e 's/,twocolumn//' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < perfbook.tex > perfbook-1c.tex
+	sed -e 's/,twocolumn//' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < $< > $@

 perfbook-hb.tex: perfbook.tex
-	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < perfbook.tex > perfbook-hb.tex
+	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@

 # Rules related to perfbook_html are removed as of May, 2016

@@ -139,9 +139,8 @@ clean:
 	find . -name '*.aux' -o -name '*.blg' \
 		-o -name '*.dvi' -o -name '*.log' \
 		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' | xargs rm -f
-	rm -f perfbook_flat.tex perfbook.out perfbook-1c.out
+	rm -f perfbook_flat.tex perfbook*.out perfbook-*.tex
 	rm -f $(LATEXGENERATED)
-	rm -f perfbook-hb.out perfbook-1c.tex perfbook-hb.tex
 	rm -f extraction

 distclean: clean
-- 
2.7.4


