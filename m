Return-Path: <SRS0=PE5W=SN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OnQFFL7aKr8zcLg/Nyrm6EmRcnsqgowPX/N/0AQjNhw=;
        b=EBWNXvJeWqkJHoMUNCebUpvva8+jG4EFKmqKKu/edE86dOg59KGaJ1kKpO0gDM9KyY
         tebPGQkiJWyPuGm6xYwVRBjHisXQU6U0QkUfFDWtC98cz0bDq6apG62qY/+aFTs1YUkr
         YjGMNj51uLOGN2UAvmx+z+7YcUmRmsi3LKP8yYNZl5jBvIR4XtBRP2iY4gsXA00dBfXU
         wRHS2kngFA1z2qmSqzxCov9ag2c+nC7BT6AGilos4OuWkURHyIScChKYBRZENuNPGcZH
         LgG7h2PyuXne4WLlGLUkiKzLi5dNSQwrA4S52f3DH8KbF21XMBIU4Lw81sbzXuBxUaz4
         o2Og==
Message-ID: <bbd1c4e2-00a5-28e6-61db-acdbe1f67916@gmail.com>
Date: Sat, 29 Jan 2022 20:25:30 +0900
MIME-Version: 1.0
Subject: [RFT PATCH -perfbook v3 v3 2/4] Makefile: Fix issues WRT parallel
 runs of pdflatex
Content-Language: en-US
References: <e4f48e3d-7efe-f822-1002-6836d63b542f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e4f48e3d-7efe-f822-1002-6836d63b542f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There is a couple of minor issues in Makefile WRT parallel runs of
runfirstlatex.sh.

When some of perfbook-xxx.tex files already exist, runfirstlatex.sh
for other main perfbook-yyy.tex can be invoked prematurely before
that .tex file gets ready.
Fix it by adding stricter dependencies of perfbook-xxx.aux on
perfbook-xxx.tex.

Also sort out dependencies around here.
autodate.tex now depends only on files in the Git repo.
Instead, perfbook_flat.tex acts as a barrier between the file
conversion phase and the pdflatex phase.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 6ee849fd..ee1880ff 100644
--- a/Makefile
+++ b/Makefile
@@ -222,18 +222,20 @@ $(PDFTARGETS): %.pdf: %.tex %.bbl
 $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
 	bibtex $(basename $@)
 
-$(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES) $(LST_SOURCES)
+$(PDFTARGETS:.pdf=.aux): %.aux: %.tex $(LATEXGENERATED)
 ifeq ($(NEWTXTEXT),)
 	$(error Font package 'newtx' not found. See #9 in FAQ-BUILD.txt)
 endif
 	sh utilities/runfirstlatex.sh $(basename $@)
 
-autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) \
-    $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
-    $(GITREFSTAGS) utilities/autodate.sh
+autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(SOURCES_OF_SNIPPET) \
+    $(LST_SOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) \
+    $(SVGSOURCES) $(GITREFSTAGS) \
+    utilities/autodate.sh
 	sh utilities/autodate.sh
 
-perfbook_flat.tex: autodate.tex
+perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) \
+    $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
 ifndef LATEXPAND
 	$(error --> $@: latexpand not found. Please install it)
 endif
-- 
2.17.1


