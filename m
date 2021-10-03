Return-Path: <SRS0=vqDK=OX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LMh2rHseeBMFR8vgEHH9MijNE3Cm+7jDLbMfOR7FKx0=;
        b=LpRDpZGiY3ZKSy/3f/pK/fzHwGWNtERDLrBLZcD+iSNo++NtJEB1BfyNFBPD54itK1
         k0yqSfCRmjYelZH1rCFcqGzeXa9jSV4n4YQ0fDkK3FgB3rmCJ9H9dAAg2HuFsCccyrHc
         8OOVIQ1568c8jmL++3E+Dwc9TgZ6E6q20nGUg8R3z3KOO+9/OIoOd+LaeoeVFPWamGrm
         bgJgQnmZ3L28B7oMxVBTaMkqQgmpYOwgeG26TsYM7TKoI6gVREdR5ZDj69qmn/3kIy9a
         sLw12fZsJgawxuzGEBPKYH9XwMZ35igFM+MxvODAnnpFva46RzfeWwtj63JBX6ay0qy9
         cSzQ==
Subject: [PATCH -perfbook 3/6] epstopdf-rule.mk: Add alternative rules for
 .eps --> .pdf conversion
References: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <053b8431-c05a-a4fe-d988-c635fc6bf742@gmail.com>
Date: Sun, 3 Oct 2021 23:54:26 +0900
MIME-Version: 1.0
In-Reply-To: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

a2ping is convenient in that it accepts most eps/ps files (not
necessarily EPS conformant) and generates properly cropped
figures in most cases.

However, recent updates of Ghostscript have conflicted with a2ping's
internal postscript and perl code.

As a2ping has limited active users, it tends to lag behind
Ghostscript changes.

So this commit attempts to achieve the same effect by adding
rules using other similar tools that have larger user bases
in the hope of getting timely fixes to catch up changes in
Ghostscript.

It is enabled when NO_A2PING is defined, for example:

    make NO_A2PING=1

The pair of commands, eps2eps and epstopdf, work similarly as a2ping.

The alternative rules generate much larger .pdf files than those
with a2ping does as of this change.
Size reduction will be attempted in a later change.

Current maintainer of epstopdf is Karl Berry, who has been active in
TeX Live and CTAN communities.
eps2eps is a command in the Ghostscript bundle.

Notes:
  o On Fedora, epstopdf is in texlive-collection-fontutils,
    or just installing texlive-esptopdf should suffice.
  o On Ubuntu, it is covered by the existing list of dependent
    packages in FAQ-BUILD.txt, namely "texlive-pstricks".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile         |  6 +++++-
 epstopdf-rule.mk | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 epstopdf-rule.mk

diff --git a/Makefile b/Makefile
index 5d9ef4b9..d3fcffca 100644
--- a/Makefile
+++ b/Makefile
@@ -408,7 +408,11 @@ endif
 	@sh $(FIXANEPSFONTS) $@
 
 # .eps --> .pdf rules
-include a2ping-rule.mk
+ifndef NO_A2PING
+  include a2ping-rule.mk
+else
+  include epstopdf-rule.mk
+endif
 
 $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 	@echo "$< --> $@"
diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
new file mode 100644
index 00000000..51425972
--- /dev/null
+++ b/epstopdf-rule.mk
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Copyright (C) Akira Yokosawa, 2021
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+EPSTOPDF := $(shell which epstopdf 2>/dev/null)
+GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
+
+$(PDFTARGETS_OF_EPSORIG): %.pdf: %.eps
+	@echo "$< --> $@"
+ifndef EPSTOPDF
+	$(error $< --> $@: epstopdf not found. Please install it)
+endif
+	@cp $< $(basename $<)__.eps
+	@sh $(FIXANEPSFONTS) $(basename $<)__.eps
+	@eps2eps $(basename $<)__.eps $(basename $<)___.eps
+	@epstopdf $(basename $<)___.eps $@
+	@rm -f $(basename $<)__.eps $(basename $<)___.eps
+
+$(PDFTARGETS_OF_TEX): %.pdf: %.eps
+	@echo "$< --> $@"
+ifndef EPSTOPDF
+	$(error $< --> $@: epstopdf not found. Please install it)
+endif
+ifeq ($(GS_953_OR_LATER),1)
+	@eps2eps -dALLOWPSTRANSPARENCY $< $(basename $<)__.eps
+	@epstopdf --gsopt=-dALLOWPSTRANSPARENCY $(basename $<)__.eps $@
+else
+	@eps2eps $< $(basename $<)__.eps
+	@epstopdf --nosafer $(basename $<)__.eps $@
+endif
+	@rm -f $(basename $<)__.eps
+
+$(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
+	@echo "$< --> $@"
+ifndef EPSTOPDF
+	$(error $< --> $@: epstopdf not found. Please install it)
+endif
+	@eps2eps $< $(basename $<)__.eps
+	@epstopdf $(basename $<)__.eps $@
+	@rm -f $(basename $<)__.eps
-- 
2.17.1


