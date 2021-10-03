Return-Path: <SRS0=vqDK=OX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sjYzMiu1Q2LTB93auZwCeSpMmSp3RO88Zv3ytnjgNqM=;
        b=OyCe91tvSBlXqLmFyYUcW0VpBTwdpzp/9ucEpQVNGDzz1Wfz47RWI2yXOyR7+hkXXh
         9jcnxJ+92Z8zr53SZ2+rx22JbVu2vLLAYfrTE7lhjVnLN0LeXptl5xyz4Qrox1XAdT0Z
         Gc9S9psvMe7bm448yd4EGdhwhDdvPHWHWkOoK2hR2UUUByV/w6Zpk3CtjXP4fiZU/rqo
         1yIftvpk2A4ooY/DFzXHvBTFIL34J/JXnH7OmN3/k3PD84L3+C7DiGQPtGJZDfmaPmSW
         Go2S9I5ukAyALci3YF2g7O+5w84T/pdqKwfXl0SQgcssKXxTg81gCydG+hlgBLIH1GpV
         bw7g==
Subject: [PATCH -perfbook 6/6] Makefile: Don't run fixfonts on .eps with
 embedded font
References: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0f40a488-61a4-5c18-b1bf-84715fc82568@gmail.com>
Date: Mon, 4 Oct 2021 00:01:39 +0900
MIME-Version: 1.0
In-Reply-To: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Most of our .eps files from gnuplot have the NimbusSanL font embedded.
Therefore, they don't need font adjustment by the fixfonts script
even on systems without NimbusSanL font installed.

Embedded font data has the keyword of "/FontMatrix".
Use it as a hint for determining whether fixfonts is necessary or not.

.eps files of scanned images under cartoons/ don't need fixfonts,
either.

Create lists of .pdf files of those files and use the recipe
with fixfonts only for PDF_TARGETS_OF_GNUPLOT_NEEDFIXFONTS.

Move other targets of EPSORIG files (PDFTARGETS_OF_EPSORIG_NOFIXFONTS)
to the recipe of PDFTARGETS_OF_EPSOTHER, which consists of figures
originating from .fig and .dot files and already taken care of
by the FIXANEPSFONTS script.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile         | 7 +++++++
 a2ping-rule.mk   | 4 ++--
 epstopdf-rule.mk | 4 ++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 29c067c0..3202ad6f 100644
--- a/Makefile
+++ b/Makefile
@@ -79,7 +79,14 @@ PDFTARGETS_OF_EPS := $(EPSSOURCES:%.eps=%.pdf)
 
 EPSORIGIN := $(filter-out $(EPSSOURCES_FROM_TEX) $(EPSSOURCES_FROM_DOT) $(EPSSOURCES_FROM_FIG),$(EPSSOURCES))
 
+GNUPLOT_ORIG := $(shell grep -l gnuplot $(EPSORIGIN))
+GNUPLOT_ORIG_NOFIXFONTS := $(shell grep -l '/FontMatrix' $(GNUPLOT_ORIG))
+GNUPLOT_ORIG_NEEDFIXFONTS := $(filter-out $(GNUPLOT_ORIG_NOFIXFONTS),$(GNUPLOT_ORIG))
+EPSORIG_NOFIXFONTS := $(filter-out $(GNUPLOT_ORIG_NEEDFIXFONTS),$(EPSORIGIN))
+
 PDFTARGETS_OF_EPSORIG := $(EPSORIGIN:%.eps=%.pdf)
+PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS := $(GNUPLOT_ORIG_NEEDFIXFONTS:%.eps=%.pdf)
+PDFTARGETS_OF_EPSORIG_NOFIXFONTS := $(EPSORIG_NOFIXFONTS:%.eps=%.pdf)
 
 PDFTARGETS_OF_EPSOTHER := $(filter-out $(PDFTARGETS_OF_EPSORIG) $(PDFTARGETS_OF_TEX),$(PDFTARGETS_OF_EPS))
 
diff --git a/a2ping-rule.mk b/a2ping-rule.mk
index 296fc575..c0e170f1 100644
--- a/a2ping-rule.mk
+++ b/a2ping-rule.mk
@@ -29,7 +29,7 @@ ifdef A2PING
   endif
 endif
 
-$(PDFTARGETS_OF_EPSORIG): %.pdf: %.eps
+$(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): %.pdf: %.eps
 	@echo "$< --> $@"
 ifndef A2PING
 	$(error $< --> $@: a2ping not found. Please install it)
@@ -58,7 +58,7 @@ else
 	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1
 endif
 
-$(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
+$(PDFTARGETS_OF_EPSORIG_NOFIXFONTS) $(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
 	@echo "$< --> $@"
 ifndef A2PING
 	$(error $< --> $@: a2ping not found. Please install it)
diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
index 5bf4a435..1c3a2041 100644
--- a/epstopdf-rule.mk
+++ b/epstopdf-rule.mk
@@ -8,7 +8,7 @@ EPSTOPDF := $(shell which epstopdf 2>/dev/null)
 GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
 GS_OPT=--gsopt=-dPDFSETTINGS=/ebook
 
-$(PDFTARGETS_OF_EPSORIG): %.pdf: %.eps
+$(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): %.pdf: %.eps
 	@echo "$< --> $@"
 ifndef EPSTOPDF
 	$(error $< --> $@: epstopdf not found. Please install it)
@@ -32,7 +32,7 @@ else
 endif
 	@rm -f $(basename $<)__.eps
 
-$(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
+$(PDFTARGETS_OF_EPSORIG_NOFIXFONTS) $(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
 	@echo "$< --> $@"
 ifndef EPSTOPDF
 	$(error $< --> $@: epstopdf not found. Please install it)
-- 
2.17.1


