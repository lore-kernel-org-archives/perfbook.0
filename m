Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=tVCzggjXj0uWdHmOyMn/lUvtVWnlmvnzLehWWt6FE/w=;
 b=hAfGVyNQSlQwLfKOSfY7FaIUbZSXfX+l7zt7QsLgmf3hrcZWZr/VgqR/5Vxw6X7DF+
 lFbLWW0B5GqZVKMUcF9e/khpPD4EMy7n5J81ebbHpwWecApEUifHn859lKcvxTI3WXgi
 u7ugzQZTULdqqnPVXRZSZr6QL8rfGNVMfFtDrH5I/W3AdWJSszqZzcqyaQsj17z7LkMo
 CxEqxU2vP97eMuVJ+mDbZTvzW2KXWejU0wSSV7kQtN4LtZdjVERzDZ7/a31Dv0uuF/AD
 lgsfzGd9N/dF3WiC/SkSLjZ+e40yFixXgpgY4JsCCwpPz7GMrO6QTpsPw5CJI+sZjzoH
 VilA==
Subject: [PATCH 3/6] Makefile: Add targets for alternative monospace fonts
References: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <42f9533d-e9cb-6764-d350-ef3bb6c41579@gmail.com>
Date: Wed, 19 Oct 2016 07:03:39 +0900
MIME-Version: 1.0
In-Reply-To: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 22d9797e88856033fb4837542b22da37dd0687e2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 15 Oct 2016 19:34:08 +0900
Subject: [PATCH 3/6] Makefile: Add targets for alternative monospace fonts

"courier" font is a bit too wide and thin when used among text of
"Times Roman" font. Also, code snippets figures tend to become too
wide for two-column layout.
Some of such figures have been tweaked by using non-standard font
sizes and line spacings.

This issue of courier font is fairly well known among LaTeX
community and quite a few packages exist to address it.

Courier based:
  o "couriers" (courier-scaled) package [1] provides scaling of
    courier font.
  o "nimbus15" package [2] provides courier based monospace fonts with
    thicker and narrower geometries.
"txtt" based:
  o "txtt" font provided in "txfonts" package (thicker than courier
    and looks better when mixed with Times font)
  o "newtxtt" package [3] provides improved txtt font with an option to
    select appearance of zero character.

This commit adds 5 make targets to use these alternative fonts.

  o "mss" ([m]ono[s]pace [s]caled): "couriers" with "scaled=.94"
    option.
  o "mstx" ([m]ono[s]pace [tx]tt): "txtt"
  o "msr" ([m]ono[s]pace [r]egular): "nimbusmono" with "scaled=.94"
    option.
  o "msn" ([m]ono[s]pace [n]arrow): "minbusmononarrow".
  o "msnt" ([m]ono[s]pace [n]ew[t]xtt): "newtxtt" with "zerostyle=a"
    option.

Scaling factor of 0.94 is chosen to reduce overfulness of code
snippets which are not yet tweaked.

When these targets are used, code snippet figures of scriptsize can
hold the following number of characters within the column width
of two-column layout.

courier          : 54 (current default)
mss, msr         : 57
mstx, msnt       : 61
msn              : 64

Note that packages "newtxtt" and "nimbus15" are fairly new, and
you may need install them or upgrade TeX installation to use targets
"msr", "msn", and "msnt".
The target "mstx" is provided as an easy means to evaluate "newtxtt"
without installing it.

[1] http://mirrors.ctan.org/fonts/psfonts/courier-scaled/Couriers.pdf
[2] http://mirrors.ctan.org/fonts/nimbus15/doc/nimbus15-doc.pdf
[3] http://mirrors.ctan.org/fonts/newtxtt/doc/newtxtt-doc.pdf

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index eb83af4..de6cd0d 100644
--- a/Makefile
+++ b/Makefile
@@ -9,7 +9,7 @@ LATEXSOURCES = \

 LATEXGENERATED = qqz.tex contrib.tex origpub.tex

-ABBREVTARGETS := 1c hb
+ABBREVTARGETS := 1c hb mss mstx msr msn msnt

 PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)

@@ -95,6 +95,24 @@ perfbook-1c.tex: perfbook.tex
 perfbook-hb.tex: perfbook.tex
 	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@

+perfbook-mss.tex: perfbook.tex
+	sed -e 's/usepackage{courier}/usepackage[scaled=0.94]{couriers}/' < $< > $@
+
+perfbook-mstx.tex: perfbook.tex
+	sed -e 's/usepackage{courier}/renewcommand*\\ttdefault{txtt}/' < $< > $@
+
+perfbook-msr.tex: perfbook.tex
+	sed -e 's/usepackage{courier}/usepackage[scaled=0.94]{nimbusmono}/' < $< > $@
+	@echo "## This target requires font package nimbus15. ##"
+
+perfbook-msn.tex: perfbook.tex
+	sed -e 's/usepackage{courier}/usepackage{nimbusmononarrow}/' < $< > $@
+	@echo "## This target requires font package nimbus15. ##"
+
+perfbook-msnt.tex: perfbook.tex
+	sed -e 's/usepackage{courier}/usepackage[zerostyle=a]{newtxtt}/' < $< > $@
+	@echo "## This target requires font package newtxtt. ##"
+
 # Rules related to perfbook_html are removed as of May, 2016

 $(EPSSOURCES_FROM_TEX): %.eps: %.tex
-- 
2.7.4


