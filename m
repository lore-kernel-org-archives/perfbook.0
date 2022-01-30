Return-Path: <SRS0=wfcr=SO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=G1zK0fnCY3e6nqBhcGj+gO6amStJ7TNhyaEsLMFJ6hU=;
        b=dQCO7XEj0mF0fyLU+sbpJyA6cJhv9FWcsyjwfOqFkhPeauOZObyMy3ey/i0c1LYuOI
         hqBlvJqVcz1lLss3fGnrusGWbtHPD3GZSJktxbpLUAc7uL6yk3OYBLenh0kSU0KJNKC5
         UKF+fat/dslfIU+SD8YMuHE6bbujcBr7zURuN98/AzBbFT+5QRu0j2/N4S3vbMaqkvV1
         2zNR4raJdjSZ29BKofExXEymxDa2A3O0CbM5htsPcekwU69PtiB52FPqN6ToRHFGaoVa
         MNX2zfDF1sk8V2b4sXac9JOch7yTUg/RJFPqkNWioUVxWcviU1HyBygTYq0AnLfzvIWP
         1V3Q==
Message-ID: <a786b98d-037a-649e-863a-f72aa8c224e5@gmail.com>
Date: Sun, 30 Jan 2022 18:38:37 +0900
MIME-Version: 1.0
Subject: [RFT PATCH -perfbook v3 5/4] Makefile: Fix regression of parallel run
 of autodate.sh
Content-Language: en-US
References: <e4f48e3d-7efe-f822-1002-6836d63b542f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e4f48e3d-7efe-f822-1002-6836d63b542f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Commit xxxxxxxxxxxx ("Makefile: Fix issues WRT parallel runs of
pdflatex") changed dependency around autodate.tex so that it
depends only on files in the Git repository.

However, this change causes autodate.sh to see untracked temporary
intermediate files from concurrent conversion of figures.
It ends up adding the "(m)" maker in autodate.tex even when there is
no untracked file in the beginning.

Fix the regression by partially reverting xxxxxxxxxxxx and restoring
dependencies of autodate.tex on converted PDF and .fcv files.

Note: This regression was caught by parallel-latex-regress.sh
when Paul ran it under clean Git repository.

Fixes: xxxxxxxxxxxx ("Makefile: Fix issues WRT parallel runs of pdflatex")
Reported-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

I can merge this with 2/4, but I'd rather keep this partial revert
as an example of regression found by the script.

If you push this series to master, please amend the commit ids
in the change log.

       Thanks, Akira
--
 Makefile | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index ee1880ff..e09ba32d 100644
--- a/Makefile
+++ b/Makefile
@@ -228,14 +228,12 @@ ifeq ($(NEWTXTEXT),)
 endif
 	sh utilities/runfirstlatex.sh $(basename $@)
 
-autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(SOURCES_OF_SNIPPET) \
-    $(LST_SOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) \
-    $(SVGSOURCES) $(GITREFSTAGS) \
-    utilities/autodate.sh
+autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(LST_SOURCES) \
+    $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
+     $(GITREFSTAGS) utilities/autodate.sh
 	sh utilities/autodate.sh
 
-perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) \
-    $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
+perfbook_flat.tex: autodate.tex
 ifndef LATEXPAND
 	$(error --> $@: latexpand not found. Please install it)
 endif
-- 
2.17.1


