Return-Path: <SRS0=p/V2=F3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697207960; x=1697812760; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIK+rLROovc+yng2PTFqJS1oIAGjEaMlJGTjftaCUSY=;
        b=hr3WeBd2N7r0P5SYkzMxmFkeicns65eJEe1k+vYpcCeTi+EHLJPtbUCrPOeUJLDgTf
         aF43wD8/fhrXcUiKr+81maTnIgId/MC9f/gtS8SdsOxrwIE+XraTO/9pbCx8g3ryXTRd
         E03JAaVq8gSaCb89qQbIdwFuTLWBRPma4GkQvCscoP3kA4+4SXwO/6RPimYb504R3JaY
         IuadQfU1fBI9ozFyZoJEdP2SJwWSXMty9njTtE8Xl5N4w+Yv045FSvp3hw6uhQpRHXNC
         f/DZFl8PS7gV4kW73y8L9E8TeKKnCqlk1M38MsS3aqr7yOair31RFk2htw5cbVi0LA1K
         30fw==
Message-ID: <18ea094b-2d2e-48e1-8e0e-83a97c3fc7e4@gmail.com>
Date: Fri, 13 Oct 2023 23:39:18 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/3] Ignore emergency-save SVG files from Inkscape
Content-Language: en-US
References: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

When Inkscape is terminated by an error, it saves the SVG file
it was processing into an emergency-save SVG file.

In perfbook, this results in extra SVG files such as:

    - advsync/rt-regimes.svgi.2023_MM_DD_hh_mm_ss.0.svg
    - datastruct/hashzu-a.svgi.2023_MM_DD_hh_mm_ss.0.svg

Ignore those files in successive runs of make and remove them
in "make clean", "make cleanfigs", and "make cleanfigs-svg".

Update .gitignore as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .gitignore | 1 +
 Makefile   | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/.gitignore b/.gitignore
index fa20ccb5de94..ce93394f53b1 100644
--- a/.gitignore
+++ b/.gitignore
@@ -19,6 +19,7 @@
 *.epsi
 *__.eps
 *.svgi
+*.svg*.svg
 *.fcv
 *.ltms
 *.pdfp
diff --git a/Makefile b/Makefile
index 18639b60cece..6e220c2db524 100644
--- a/Makefile
+++ b/Makefile
@@ -52,7 +52,9 @@ FIGSOURCES := $(wildcard */*.fig) $(wildcard */*/*.fig)
 
 EPSSOURCES_FROM_FIG := $(FIGSOURCES:%.fig=%.eps)
 
-SVGSOURCES := $(wildcard */*.svg)
+SVGSOURCES_ALL := $(wildcard */*.svg)
+SVG_EMERGENCY := $(wildcard */*.svg*.svg)
+SVGSOURCES := $(filter-out $(SVG_EMERGENCY),$(SVGSOURCES_ALL))
 FAKE_EPS_FROM_SVG := $(SVGSOURCES:%.svg=%.eps)
 PDFTARGETS_OF_SVG := $(SVGSOURCES:%.svg=%.pdf)
 
@@ -603,7 +605,7 @@ clean:
 	rm -f perfbook*.sil
 	rm -f CodeSamples/snippets.d
 	rm -f *.synctex*
-	@rm -f $(OBSOLETE_FILES) $(EPSSOURCES_TMP)
+	@rm -f $(OBSOLETE_FILES) $(EPSSOURCES_TMP) $(SVG_EMERGENCY)
 
 paper-clean:
 	rm -f $(BASE_DEPENDS)
@@ -627,7 +629,7 @@ cleanfigs-eps:
 	rm -f $(PDFTARGETS_OF_EPS)
 
 cleanfigs-svg:
-	rm -f $(PDFTARGETS_OF_SVG)
+	rm -f $(PDFTARGETS_OF_SVG) $(SVG_EMERGENCY)
 
 cleanfigs: cleanfigs-eps cleanfigs-svg
 
-- 
2.25.1


