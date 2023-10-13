Return-Path: <SRS0=p/V2=F3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697208154; x=1697812954; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/32FJJH8Dla/BDkcW+psXUvR3tD9BrkxDvpGljbBFrs=;
        b=glz6tNh5Z3ch6TNgplMBicYLonkE/c06WE5c3/FfeSZz1e6yQ/bNJaTxEmEXMfoYPF
         8W3eGolgOQ1Tl7OL1sWU1xi8ac6Z9CRTyMHJXNWfOEEuWEuYfyTh6CJx+pPi5llgGJJG
         SFklQZ1a09O75/e9lFEeGH7tWniaNiWdqhzxSBqJF1pR0hVXMUmAYludV69/WypA5JPS
         sStAqQA6HxtjyRHeI8RTGQ0gFglHUoOiK+0UsCixWK4Ye3cBerHP4sB4E1xEIepk2QGe
         umBaysPwM+luCpKk4IZwbnmys5S+WCHd6urkbeTV4413Ozb8eIh6yUVwQupoIUt43wSL
         U42w==
Message-ID: <93a5c37d-1f14-4522-9f39-3056e18a9c31@gmail.com>
Date: Fri, 13 Oct 2023 23:42:31 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/3] Make sure all PDF conversions are complete
Content-Language: en-US
References: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Crashes of Inkscape can disturb parallel runs of SVG --> PDF conversions.

Add a sub-make run of "make -j1 figs" in the early stage of latex
run to make sure any missing PDF figures can be prepared in time.

Note:
    If GNUmake's dependency check is perfect, when there were any
    missing PDF files remaining, the recipe of autodate.tex shouldn't
    run.  Unfortunately, it looks like that is not the case.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 6e220c2db524..3875c52b1570 100644
--- a/Makefile
+++ b/Makefile
@@ -267,6 +267,10 @@ endif
 autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(LST_SOURCES) \
     $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
      $(GITREFSTAGS) utilities/autodate.sh
+ifneq ($(IGNORE_INKSCAPE_ERROR),0)
+	# Make sure all SVG --> PDF conversions are complete
+	$(MAKE) -j1 figs
+endif
 	sh utilities/autodate.sh
 
 perfbook_flat.tex: autodate.tex
-- 
2.25.1


