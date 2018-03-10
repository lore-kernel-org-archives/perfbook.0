Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=kv2ljxQ3mSSb0z+nL+2VOU4bXV9FDjn46BjgSbxt+A0=;
 b=g5dDqGvcVfqJdFoQMhymhOsyVR/m37SYbwbpClVvysT31wRbPilEcjAEnVPO53ddR3
 beGra2pgHSSur2iOpxtaJTNy8DYHqTdY1F/UQWo60oxgfN6cKh5A6Ei3eZPyXJcxRLiN
 UtWgOxVv2gPZW/Nnjtkqa47mdRszrRWinCYu6ruso2JLZ9OuHjH9zwj0rFvqV1sy2cCG
 yFE6y4KDrgi7czyipyHQJFqX1tDu9JRk6p7kuvku167KwZXdPNuvv+7iMT9ICt04O/S4
 JU9D1KwcsrG1g/Zqjoi/pVVBzOUNzP3PYpYE56PAVXKRDQk/wtrEDQ3nINfS7eD6KKel
 3T2g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Add poor person's slanted shape for 'newtxtext' font
Message-ID: <bfc8d604-9405-2f70-93e0-2b5db0335e71@gmail.com>
Date: Sun, 11 Mar 2018 08:59:28 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9a2d254007e243e39ec9ee13319f1d25d882fea1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 11 Mar 2018 07:49:24 +0900
Subject: [PATCH] Add poor person's slanted shape for 'newtxtext' font

The "newtx" font package switched to TeX Gyre Termes fonts in
version 1.4 (released in TeX Live 2014). It lacks slanted shape.

In perfbook, slanted shape is not used in LaTeX sources at the
moment, but is used in page headers generated in the "book" document
style.

The switch of Times Roman clone font to "newtxtext" font made in
commit b4ad25eae241 ("future/QC: Use upright glyph for math constant
and descriptive suffix") had a side-effect of page headers to
be rendered in italic font when TeX Live 2014 or later is used.
Most notably, chapter/section numbers in page headers are rendered
upright.

This commit adds poor person's slanted shapes for roman fonts
as suggested at https://tex.stackexchange.com/questions/247539/.

This change should not have visual difference on TeX Live 2013.

Fixes: b4ad25eae241 ("future/QC: Use upright glyph for math constant and descriptive suffix")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/perfbook.tex b/perfbook.tex
index efb6750..ce0c3a0 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -12,6 +12,12 @@
 \renewcommand*\ttdefault{lmtt}
 %msfontstub

+% Poor person's slanted shape for roman --- newtxtext lacks slanted shape
+\AtBeginDocument{%
+  \DeclareFontShape{\encodingdefault}{\rmdefault}{m}{sl}{<-> ptmro7t}{}%
+  \DeclareFontShape{\encodingdefault}{\rmdefault}{b}{sl}{<-> ptmbo7t}{}%
+  \DeclareFontShape{\encodingdefault}{\rmdefault}{bx}{sl}{<->ssub * ptm/b/sl}{}%
+}
 % Improves the text layout
 \usepackage{microtype}
 \UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
-- 
2.7.4

