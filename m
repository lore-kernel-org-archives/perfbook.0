Return-Path: <SRS0=g3Xn=UV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pza2t8pgWZMwrhO3Xw7ZozvZtSsWF9M1n1L/nJDyCrc=;
        b=aSHshDaBfBPGTNKz7QsR1DXngHKL/T9lHsqrQmZ5vG/x7wAGQYVdIqG0GbQG1B2ugl
         Y7tUUBf+irHMmtWF2WHqb7P2cl/z4HDQHzHyGX4zTr7lPdQ5lgIfaWGgSphnNaclPIGF
         oJbzZsJqYAKX47179o4se+mC9HFdOcnrDhkGskGlr4nRIq23nQttOh3cQouXJwBNgCdX
         rHhxB3PYm4RuBoH8kPIZbLV7PAAnmggS8WLfm7B+eb79tD+YURqxDnOGxaRMRk4dDx4n
         9ckgrWChNa/Au0L0mNDnxMIW/uWukketY80lk18/BcvhHulZtj67CRVQikeEgbCPUcr2
         F2vw==
Message-ID: <44f3cbf1-1315-aaa0-0b1f-ba35417d33c4@gmail.com>
Date: Mon, 11 Apr 2022 17:01:38 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 5/7] Makefile: Test $(LATEX) before invoking
 runfirstlatex.sh
Content-Language: en-US
References: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The LATEX variable can have a typo.  Check if it is available
before invoking it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 4ab54130..abcd7e2c 100644
--- a/Makefile
+++ b/Makefile
@@ -101,6 +101,7 @@ PDFTARGETS_OF_EPSOTHER := $(filter-out $(PDFTARGETS_OF_EPSORIG) $(PDFTARGETS_OF_
 BIBSOURCES := bib/*.bib alphapf.bst
 
 # required commands
+LATEX_CMD := $(shell which $(LATEX) 2>/dev/null)
 DOT := $(shell which dot 2>/dev/null)
 FIG2EPS := $(shell which fig2eps 2>/dev/null)
 INKSCAPE := $(shell which inkscape 2>/dev/null)
@@ -225,6 +226,9 @@ qqmsg: perfbook.pdf
 	@echo "built as perfbook.pdf."
 
 $(PDFTARGETS): %.pdf: %.tex %.bbl
+ifeq ($(LATEX_CMD),)
+	$(error LaTeX engine "$(LATEX)" not found.)
+endif
 	LATEX=$(LATEX) sh utilities/runlatex.sh $(basename $@)
 
 $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
@@ -233,6 +237,9 @@ $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
 $(PDFTARGETS:.pdf=.aux): %.aux: %.tex $(LATEXGENERATED)
 ifeq ($(NEWTXTEXT),)
 	$(error Font package 'newtx' not found. See #9 in FAQ-BUILD.txt)
+endif
+ifeq ($(LATEX_CMD),)
+	$(error LaTeX engine "$(LATEX)" not found.)
 endif
 	LATEX=$(LATEX) sh utilities/runfirstlatex.sh $(basename $@)
 
-- 
2.25.1


