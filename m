Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i6+n7CKW+0NQgjFE5BQoYmj1kKXm2Gx+vEjB1LhMTU0=;
 b=RIyMnRHew+TTzc0cmonmwkMG/yiiPbnplBqgM5aSKg0uDdqt4ZKgK42fqHx1xc2KL/
 1evgqWI8mahpo7q1ttvO4Eg3fPTalhVOlA+dkwE1F0MKcAtz767Itdp+QvfKXT5oLdL/
 5hP+ZfKWA5dsKb3nIejC7DQAXnXlxQ9zv0DIKrH3VycxCaI8GX8sF114m7/8I8Ug14p8
 2KxS7Xd9Eq620jCrfQ5ErfZTbh8NdX6HKFYJSe5+cG07mzJBfYRjK/aRnyVx//p2VEJ6
 QWZSzuQQxZVSRHYjTVWZYB5p5lW//Wyfnb7PyPNDZmmBVJOUW+5I/dzweT1m+6W2C51R
 TfOg==
Subject: [PATCH 1/5] Move caption of table to top
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5445ca77-bcf9-8ab1-3c07-42421aa52255@gmail.com>
Date: Mon, 23 Oct 2017 00:22:31 +0900
MIME-Version: 1.0
In-Reply-To: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a816ec3f6407f3de0b194dbf61498bca650ee818 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 22 Oct 2017 20:18:54 +0900
Subject: [PATCH 1/5] Move caption of table to top

For those who prefer caption of tables at the bottom, add a make
target "perfbook-tcb.pdf" (abbr. tcb: Table Caption Bottom).

Help message displayed by "make help" is updated accordingly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile                           |  6 +++++-
 appendix/styleguide/styleguide.tex |  6 ++++--
 perfbook.tex                       | 12 ++++++++++++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index d8d23c7..373f0d6 100644
--- a/Makefile
+++ b/Makefile
@@ -10,7 +10,7 @@ LATEXSOURCES = \

 LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex

-ABBREVTARGETS := 1c hb msns mss mstx msr msn msnt 1csf
+ABBREVTARGETS := tcb 1c hb msns mss mstx msr msn msnt 1csf

 PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)

@@ -101,6 +101,9 @@ contrib.tex: perfbook_flat.tex qqz.tex
 origpub.tex: perfbook_flat.tex
 	sh utilities/extractorigpub.sh < $< > $@

+perfbook-tcb.tex: perfbook.tex
+	sed -e 's/{tblcptop}{true}/{tblcptop}{false}/' < $< > $@
+
 perfbook-1c.tex: perfbook.tex
 	sed -e 's/,twocolumn//' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < $< > $@

@@ -179,6 +182,7 @@ help:
 	@echo "Official targets (Latin Modern Typewriter for monospace font):"
 	@echo "  Full,              Abbr."
 	@echo "  perfbook.pdf,      2c:   (default) 2-column layout"
+	@echo "  perfbook-tcb,      tct:  2-column layout with table caption at bottom"
 	@echo "  perfbook-1c.pdf,   1c:   1-column layout"
 	@echo "  perfbook-hb.pdf,   hb:   For hardcover books (2-column)"
 	@echo
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 3b3c62f..14fd620 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -915,11 +915,12 @@ look ugly.\footnote{
 Vertical lines should be avoided and horizontal lines should be
 used sparingly, especially in tables of simple structure.

+\IfTblCpTop{}{
 \floatstyle{plaintop}
 \restylefloat{table}
-\captionsetup[table]{hangindent=30pt}
 \setlength{\abovetopsep}{-2pt}
 \addtolength{\abovecaptionskip}{-2.5pt}
+}

 For example,
 Table~\ref{tab:future:Refrigeration Power Consumption}
@@ -1381,11 +1382,12 @@ have been recently converted to the scheme presented in this section.
 Refer to \path{memorder/memorder.tex}
 for examples of tables with complex headings.

+\IfTblCpTop{}{
 \floatstyle{plain}
 \restylefloat{table}
-\captionsetup[table]{hangindent=0pt}
 \addtolength{\abovecaptionskip}{2.5pt}
 \setlength{\abovetopsep}{0pt}
+}

 \subsubsection{Miscellaneous Candidates}
 \label{sec:app:styleguide:Miscellaneous Candidates}
diff --git a/perfbook.tex b/perfbook.tex
index 7e2cdd4..8a70c94 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -79,6 +79,9 @@
 \newboolean{lmttforcode}
 \setboolean{lmttforcode}{true}
 \newcommand{\IfLmttForCode}[2]{\ifthenelse{\boolean{lmttforcode}}{#1}{#2}}
+\newboolean{tblcptop}
+\setboolean{tblcptop}{true}
+\newcommand{\IfTblCpTop}[2]{\ifthenelse{\boolean{tblcptop}}{#1}{#2}}

 \newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}

@@ -107,6 +110,15 @@
 \AtBeginEnvironment{listing}{\renewcommand{\ttdefault}{lmtt}}
 }{}

+\IfTblCpTop{
+\floatstyle{plaintop}
+\restylefloat{table}
+\addtolength{\abovecaptionskip}{-2.5pt}
+\setlength{\abovetopsep}{-2pt}
+}{}
+\captionsetup{hangindent=20pt}
+\captionsetup[listing]{hangindent=20pt}
+
 \begin{document}

 %%HTMLSKIP
-- 
2.7.4


