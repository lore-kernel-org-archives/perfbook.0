Return-Path: <SRS0=Srvm=GU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1wtL7MJb8mjyORYr2pPtAqWGHrZuCUZ0FDpt4KmG05Y=;
        b=tImrv4kvrQsBrtULgIxDT5jP/FM6PYzdms5uGa3Y/AfPYXf8V8glXnTSndISuZ8dM1
         +OvmVg8hotdYsMSHNwmEM1/79gMhxQ8nUQ603wClCkiJX2eHAT3kwRcKhU8l4bCtw/tX
         F3pOIGX6JT1xdhgNx/VHGRrr/Qqv47OVZ5kwVDHeDkYthfEltxFXwwlXqWJaFBuQVv9h
         0yLm27wDbHIOeQgghnxRavwuCowunSmR3ixegAI9OdHj2ZJOdSOoD1SMqdyeQTSl07R0
         ZTc3+E4pBcNLDhfbwMPwRLEhA4Q3K+qnqZmeUBqclMmnje+qfEUAF7pZPvQHxe1P7wCm
         DV/w==
Subject: [PATCH 1/3] Makefile: Fix timing of autodate.tex generation
References: <25e9a0f4-8903-1523-9d04-ce34d7d97db6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <56807712-d5c4-b477-6fa7-ea346fea0215@gmail.com>
Date: Mon, 18 Jan 2021 00:04:23 +0900
MIME-Version: 1.0
In-Reply-To: <25e9a0f4-8903-1523-9d04-ce34d7d97db6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Commit bd1310a7bcd1 ("Makefile: Cope with GhostScript 9.53.0 or later")
introduced ps2pdf and pdfcrop commands in .eps --> .pdf conversion
of figures drawn by pstricks.

There commands generate a couple of temporary files during conversion
and cropping.
This causes autodate.sh to observe untracked files when perfbook is
first built by parallel make (-jN option).

Delay the generation of autodate.tex until after all those conversions
have finished by moving most dependencies of perfbook_flat.tex to
those of autodate.tex.

Fixes: bd1310a7bcd1 ("Makefile: Cope with GhostScript 9.53.0 or later")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 0c58f1a0..9d36156d 100644
--- a/Makefile
+++ b/Makefile
@@ -213,10 +213,12 @@ ifeq ($(NEWTXTEXT),)
 endif
 	sh utilities/runfirstlatex.sh $(basename $@)
 
-autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) $(SOURCES_OF_SNIPPET) $(GITREFSTAGS) utilities/fcvextract.pl utilities/autodate.sh
+autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) \
+    $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
+    $(GITREFSTAGS) utilities/autodate.sh
 	sh utilities/autodate.sh >autodate.tex
 
-perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
+perfbook_flat.tex: autodate.tex
 ifndef LATEXPAND
 	$(error --> $@: latexpand not found. Please install it)
 endif
-- 
2.17.1


