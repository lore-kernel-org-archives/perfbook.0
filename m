Return-Path: <SRS0=LG5i=PF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yn+zKkuOIrgf3okKC9QTUoZkTiqAk4WzM82M2bcexVo=;
        b=FY60mDplCu4bm+WvlBupXNmmNF0aCLwPidVClejSph5MlXRxLU6uUwCskkNgmDpvjy
         L5taSRYrSy7uO3PIF8weEUHzHSx/8MtoZKFLF5/UqgSuCvdqf2eBr5XIpOr+ndhYWV7S
         nLoBXP43Y9LLzTf2/RzooJV1zo7xuvxZycfNIgaFiSJFK3AzldwqcYESUt8JonBKaEwz
         DboQh0x4qP3w2UW7I4kbp0tO9JoPnxDs6DumoAhFgIRIpCqz4qRGdPylBLiMk71d2zJX
         GkGJU/nMu53uAxErrjli7QrGSmVhWdvVnuODm+KvV9MKJoSyNfr2vimHciq8elN8cN1l
         /+Lw==
Subject: [PATCH -perfbook 2/3] Makefile: Shorten progress report
 (dir/filename.src --> .dst)
References: <e803eeb3-d39d-8bbf-4e5e-d7c3fbbfcd84@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8e09cc8a-8952-b1e6-b879-c193359dce35@gmail.com>
Date: Sun, 17 Oct 2021 17:17:37 +0900
MIME-Version: 1.0
In-Reply-To: <e803eeb3-d39d-8bbf-4e5e-d7c3fbbfcd84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

For brevity, instead of displaying a long and redundant report:

    intro/PPGrelation.svg --> intro/PPGrelation.pdf

, display a shorter one:

    intro/PPGrelation.svg --> .pdf

Also, for easy distinction of enabled rule, add hints in recipes
of a2ping-rule.mk as follows:

    CodeSamples/count/atomic.eps --> .pdf (by a2ping)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile         | 14 +++++++-------
 a2ping-rule.mk   |  6 +++---
 epstopdf-rule.mk |  6 +++---
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 3202ad6f..6083cda4 100644
--- a/Makefile
+++ b/Makefile
@@ -394,14 +394,14 @@ perfbook-a4.tex:
 # Rules related to perfbook_html are removed as of May, 2016
 
 $(EPSSOURCES_FROM_TEX): %.eps: %.tex
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@)"
 	sh utilities/mpostcheck.sh
 	@latex -output-directory=$(shell dirname $<) $< > /dev/null 2>&1
 	@dvips -Pdownload35 -E $(patsubst %.tex,%.dvi,$<) -o $@ > /dev/null 2>&1
 	@sh $(FIXANEPSFONTS) $@
 
 $(EPSSOURCES_FROM_DOT): %.eps: %.dot
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@)"
 ifndef DOT
 	$(error $< --> $@: dot not found. Please install graphviz)
 endif
@@ -409,7 +409,7 @@ endif
 	@sh $(FIXANEPSFONTS) $@
 
 $(EPSSOURCES_FROM_FIG): %.eps: %.fig
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@)"
 ifndef FIG2EPS
 	$(error $< --> $@: fig2eps not found. Please install fig2ps)
 endif
@@ -424,7 +424,7 @@ else
 endif
 
 $(PDFTARGETS_OF_SVG): %.pdf: %.svg
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@)"
 ifeq ($(STEELFONT),0)
 	$(error "Steel City Comic" font not found. See #1 in FAQ.txt)
 endif
@@ -463,17 +463,17 @@ CodeSamples/snippets.d: $(SOURCES_OF_SNIPPET) $(GEN_SNIPPET_D)
 	sh ./utilities/gen_snippet_d.sh
 
 $(FCVSNIPPETS):
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@)"
 	@utilities/fcvextract.pl $< $(subst +,\\+,$(subst @,:,$(basename $(notdir $@)))) > $@
 	@utilities/checkfcv.pl $@
 
 $(FCVSNIPPETS_VIA_LTMS):
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@)"
 	@utilities/fcvextract.pl $< $(subst +,\\+,$(subst @,:,$(basename $(notdir $@)))) > $@
 	@utilities/checkfcv.pl $@
 
 $(FCVSNIPPETS_LTMS):
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@)"
 	@utilities/reorder_ltms.pl $< > $@
 
 help-official:
diff --git a/a2ping-rule.mk b/a2ping-rule.mk
index c0e170f1..2a312560 100644
--- a/a2ping-rule.mk
+++ b/a2ping-rule.mk
@@ -30,7 +30,7 @@ ifdef A2PING
 endif
 
 $(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): %.pdf: %.eps
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@) (by a2ping)"
 ifndef A2PING
 	$(error $< --> $@: a2ping not found. Please install it)
 endif
@@ -43,7 +43,7 @@ endif
 	@rm -f $<i
 
 $(PDFTARGETS_OF_TEX): %.pdf: %.eps
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@) (by a2ping)"
 ifndef A2PING
 	$(error $< --> $@: a2ping not found. Please install it)
 endif
@@ -59,7 +59,7 @@ else
 endif
 
 $(PDFTARGETS_OF_EPSORIG_NOFIXFONTS) $(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@) (by a2ping)"
 ifndef A2PING
 	$(error $< --> $@: a2ping not found. Please install it)
 endif
diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
index 1c3a2041..8e824fbe 100644
--- a/epstopdf-rule.mk
+++ b/epstopdf-rule.mk
@@ -9,7 +9,7 @@ GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
 GS_OPT=--gsopt=-dPDFSETTINGS=/ebook
 
 $(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): %.pdf: %.eps
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@)"
 ifndef EPSTOPDF
 	$(error $< --> $@: epstopdf not found. Please install it)
 endif
@@ -19,7 +19,7 @@ endif
 	@rm -f $(basename $<)__.eps $(basename $<)___.eps
 
 $(PDFTARGETS_OF_TEX): %.pdf: %.eps
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@)"
 ifndef EPSTOPDF
 	$(error $< --> $@: epstopdf not found. Please install it)
 endif
@@ -33,7 +33,7 @@ endif
 	@rm -f $(basename $<)__.eps
 
 $(PDFTARGETS_OF_EPSORIG_NOFIXFONTS) $(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
-	@echo "$< --> $@"
+	@echo "$< --> $(suffix $@)"
 ifndef EPSTOPDF
 	$(error $< --> $@: epstopdf not found. Please install it)
 endif
-- 
2.17.1


