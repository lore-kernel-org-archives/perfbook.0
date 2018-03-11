Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ApGausBxyKN+sS2ePlcJe/ERQyLps1kA6qlfv2hbMIE=;
 b=HmEp3sEXWsgvzI2i0QuPZ4cgn9JphZxYvJbSURY12j1xa3qA1KBt6jdE0YuoB8/fQ2
 hy7LPOUjtUsusCJXOgzy6IOM2U1zFo7KH8KxhGsr9rVSmAuI1nzReKkwxghRdZ9dR7fd
 42mWLwan7nZM42Hy9eY3nMgqdWaIa9vu+DB4twxHY6dynhliLczTBsDWgCa/bjf5KrEj
 3isr4slRkbC3k+R+laK2aS1HqF49RJqH0RwC+OoMRpALUUhVSVP/AnfI4nb+A2SA/kQ2
 UAVakYYi1kacMD569d+kskgrZgcoWsd8W2WMBo1wz6OtJZLYfCIZqHtga66fSIlyXo4C
 ZN4w==
Subject: [PATCH v2] Add poor person's slanted shape for 'newtxtext' font
References: <bfc8d604-9405-2f70-93e0-2b5db0335e71@gmail.com>
 <bcb7cf66-dcf5-ac42-33a4-c8ad7f1e43ae@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4c0f88de-015a-1544-a0c6-7d0df9bc3e70@gmail.com>
Date: Sun, 11 Mar 2018 12:24:58 +0900
MIME-Version: 1.0
In-Reply-To: <bcb7cf66-dcf5-ac42-33a4-c8ad7f1e43ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 12a6abc21cd570f4fcf371d79d983f43d673b67d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 11 Mar 2018 07:49:24 +0900
Subject: [PATCH v2] Add poor person's slanted shape for 'newtxtext' font

The "newtx" font package switched to TeX Gyre Termes fonts in
version 1.4 (released in TeX Live 2014). It lacks slanted shape.

In perfbook, slanted shape is not used in LaTeX sources at the
moment, but is used in page headers generated in the "book" document
class.

The change of Times Roman clone font to "newtxtext" font made in
commit b4ad25eae241 ("future/QC: Use upright glyph for math constant
and descriptive suffix") had a side-effect of page headers to
be rendered in italic font when TeX Live 2014 or later is used.
Most notably, chapter/section numbers in page headers are rendered
upright.

This commit adds poor person's slanted shapes for roman fonts
as suggested in https://tex.stackexchange.com/questions/247539/.

This change doesn't have visual effect on TeX Live 2013.

Fixes: b4ad25eae241 ("future/QC: Use upright glyph for math constant and descriptive suffix")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Change in v2:

 Moved the definitions into the "else" clause of \IfSansSerif to avoid
 conflict with the up-to-date version of "newtxsf" math font package in
 target "1csf".

NOTE 1: Target "1csf" does not affected by the lack of slanted shape in
roman font.

NOTE 2: Target "1csf" doesn't build on TeX Live 2013.
"newtxsf" on TeX Live 2015/debian or Tex Live 2016 on Fedora 26/27 does
not conflict in v1 of this patch.
You may need to install newtxsf v1.05 [1] to see the conflict and
the resolution in v2.

[1]: https://www.ctan.org/pkg/newtxsf

    Thanks, Akira
--
 perfbook.tex | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/perfbook.tex b/perfbook.tex
index efb6750..fe9421e 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -95,6 +95,12 @@
 \usepackage[slantedGreek,scaled=.96]{newtxsf}
 }{
 \usepackage[slantedGreek]{newtxmath} % math package to be used with newtxtext
+% Poor person's slanted shape for roman --- newtxtext lacks slanted shape
+\AtBeginDocument{%
+  \DeclareFontShape{\encodingdefault}{\rmdefault}{m}{sl}{<-> ptmro7t}{}%
+  \DeclareFontShape{\encodingdefault}{\rmdefault}{b}{sl}{<-> ptmbo7t}{}%
+  \DeclareFontShape{\encodingdefault}{\rmdefault}{bx}{sl}{<->ssub * ptm/b/sl}{}%
+}
 }

 \newcommand{\LstLineNo}{\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}
-- 
2.7.4


