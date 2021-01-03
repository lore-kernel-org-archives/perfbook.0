Return-Path: <SRS0=Fff6=GG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=ElYV7/iUT3jtQFej+vUHyUcB+yemqGQWKBR755s9Uuc=;
        b=CzI910xPMtsXHpw7sF8pSDNLf0ZWNuRzFLumoTJ0N481LzeLsmyswzMisr+M8WfeVs
         oyHIqT4dBpZY1g2A7J1zoQfuqwmhholyVq7SIduYKs4LLA+ZSL8EWrCRPGDybJXzikvh
         SPs+3E2kRmz29NLSfBVmvkMTOA2y5Vv+qu0VxUvGp4i586IH4kkAvofbKfUJwMC6aucx
         os/cwZEyQeYAwVXNmZDX5W/0pVOFHxNPZll0SQ96j0u6pkO3bpvHNtR4qKsTvS435YKX
         GdI91VWIEUAdLN3CRoBAB6IQDAChsTvxJ4MAjqnw+1u4KaOjssOb37g8uYYuEnlXk8n6
         9yyQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Makefile: Cope with GhostScript 9.53.0 or later
Message-ID: <29de25dd-09e4-cd0b-a743-6e5a7c8dfb36@gmail.com>
Date: Sun, 3 Jan 2021 20:23:12 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>, Felipe Balbi <balbi@kernel.org>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

=46rom f04ab9441df5256aa9df73bb4fa005b43517f2f2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 3 Jan 2021 19:15:25 +0900
Subject: [PATCH -perfbook] Makefile: Cope with GhostScript 9.53.0 or late=
r
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Combination of GhostScript 9.53.x and pstricks-base 3.01 requires
an additional option of "gs" to enable transparency.

Current version of a2ping can not cope with this change.

Instead, use the pair of commands "ps2pdf" and "pdfcrop" for .eps
files originated from .tex sources.

Reported-by: =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=B9 =D0=94=D1=8C=D1=8F=
=D1=87=D0=B5=D0=BD=D0=BA=D0=BE <dimhen@gmail.com>
Reported-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi all,

My previous comment on the build error reported by Dmitry and Felipe
was not accurate.

pstricks-base 3.01 did what the update announcement said and is
compatible with GhostScript 9.53.x or later by adding prologue code
to enable transparency support when gs version is larger than 9.52.

Due to the behavior change, for "gs" to accept eps files generated from
pstricks-base 3.01, it (9.53.0 or later) needs an additional option
-dALLOWPSTRANSPARENCY.

Current version of a2ping doesn't know of this change and it invokes
"gs" without the option. This is the root cause of the build error.
I tried a2ping's "--gsextra=3D" option to add it, but couldn't resovle
the error.

Instead of a2ping, the pair of ps2pdf and pdfcrop can do the same
auto cropping of PDF figures.  ps2pdf is distributed among GhostScript
releases and if you have gs 9.53.x, you should also have a compatible ps2=
pdf.

This patch fixes the build error by detecting GhostScript 9.53.0 or
later (up to 9.59.x for the moment) and switching the command to use.

Minor nit:

I tried to test this patch on Ubuntu 18.04 with up-to-date TeX Live
and manually installed GhostScript 9.53.3.
However, I couldn't setup font info properly for it to work with the
font replacement (Adobe -> Nimbus) scripts enabled.

On Fedora 33 and CentOS 8, this patch works just fine.

For those who stick with distro versions of TeX Live and GhostScript,
this patch should have no effect until those packages are upgraded.

        Thanks, Akira

PS. (especially to Paul)

This mail is sent in UTF-8 encoding due to Dmitry's name in Reported-by.
I don't think it would break this message in git-am incompatible way,
but if it does, please let me know.
--
 Makefile | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 56ce62bf..bf2e89ba 100644
--- a/Makefile
+++ b/Makefile
@@ -38,6 +38,8 @@ EPSSOURCES_FROM_TEX :=3D \
 	SMPdesign/DiningPhilosopher4part-b.eps \
 	SMPdesign/DiningPhilosopher5PEM.eps
=20
+PDFTARGETS_OF_TEX :=3D $(EPSSOURCES_FROM_TEX:%.eps=3D%.pdf)
+
 DOTSOURCES :=3D $(wildcard */*.dot)
=20
 EPSSOURCES_FROM_DOT :=3D $(DOTSOURCES:%.dot=3D%.eps)
@@ -70,7 +72,7 @@ EPSORIGIN :=3D $(filter-out $(EPSSOURCES_FROM_TEX) $(EP=
SSOURCES_FROM_DOT) $(EPSSOU
=20
 PDFTARGETS_OF_EPSORIG :=3D $(EPSORIGIN:%.eps=3D%.pdf)
=20
-PDFTARGETS_OF_EPSOTHER :=3D $(filter-out $(PDFTARGETS_OF_EPSORIG),$(PDFT=
ARGETS_OF_EPS))
+PDFTARGETS_OF_EPSOTHER :=3D $(filter-out $(PDFTARGETS_OF_EPSORIG) $(PDFT=
ARGETS_OF_TEX),$(PDFTARGETS_OF_EPS))
=20
 BIBSOURCES :=3D bib/*.bib alphapf.bst
=20
@@ -124,19 +126,23 @@ ifdef A2PING
   GS_950_OR_LATER :=3D $(shell gs --version | grep -c -E "9\.[5-9].?")
   A2PING_277P :=3D $(shell a2ping --help 2>&1 | grep -c "2.77p,")
   A2PING_283P :=3D $(shell a2ping --help 2>&1 | grep -c "2.83p,")
+  GS_953_OR_LATER :=3D $(shell gs --version | grep -c -E "9\.5[3-9].?")
   ifeq ($(A2PING_277P),1)
-    A2PING_GSCNFL :=3D 1
+    A2PING_GSCNFL =3D 1
   else
     ifeq ($(A2PING_283P),1)
       ifeq ($(GS_950_OR_LATER),1)
-        A2PING_GSCNFL :=3D 1
+        A2PING_GSCNFL =3D 1
       else
-        A2PING_GSCNFL :=3D 0
+        A2PING_GSCNFL =3D 0
       endif
     else
-      A2PING_GSCNFL :=3D 0
+      A2PING_GSCNFL =3D 0
     endif
   endif
+  ifeq ($(GS_953_OR_LATER),1)
+    A2PING_GSCNFL =3D 2
+  endif
 endif
=20
 LINELABEL_ENV_BEGIN :=3D $(shell grep -l -F '\begin{linelabel}' $(LATEXS=
OURCES))
@@ -395,6 +401,20 @@ endif
 	@a2ping --below --hires --bboxfrom=3Dcompute-gs $<i $@ > /dev/null 2>&1=

 	@rm -f $<i
=20
+$(PDFTARGETS_OF_TEX): %.pdf: %.eps
+	@echo "$< --> $@"
+ifndef A2PING
+	$(error $< --> $@: a2ping not found. Please install it)
+endif
+ifeq ($(A2PING_GSCNFL),1)
+	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
+endif
+ifeq ($(A2PING_GSCNFL),2)
+	@ps2pdf -dALLOWPSTRANSPARENCY -dNOSAFER $< - | pdfcrop -hires - $@  > /=
dev/null 2>&1
+else
+	@a2ping --below --hires --bboxfrom=3Dcompute-gs $< $@ > /dev/null 2>&1
+endif
+
 $(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
 	@echo "$< --> $@"
 ifndef A2PING
--=20
2.17.1


