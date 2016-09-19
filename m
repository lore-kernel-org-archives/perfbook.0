Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=52H2DJFWkDccoBNe50SIA4nUw3QHkZ07nZVBV3TbCsc=;
 b=FUGdT4n/EsE4iau3ai6O8WuDjzNa9osU9ML4DFHIPThttEqB553cKwxRCkcMzzQxq9
 NGA89Bweb1991OSeH0ToB/RfpUh8wzOz+xoaToBsgmW0KwSNgxvD968zbzom9SeZaExG
 uuMHwwU1ORtkhKOQzEiGN9EhNSbtCHOlo6JxFBzqWu9R/Hoc2s57emR6XPR/OALpI9Ny
 zlZvtuQj6TCExUl11NryUoUJ6KLyaftxOjzFRm8e9DpKYFtTQAe9vk2cfUDQ9FGuUPLj
 1gNbMgzZ+obn4GSR5naqRaCjBCLX68S8IVDfjmCsZosyF7UB34WT/p6C84plP4iB92Zs
 ptuw==
Subject: [RFC PATH 6/6] Tweak page layout of onecolumn
References: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0363e9e8-50b9-6e16-cbcd-faf26b16536f@gmail.com>
Date: Mon, 19 Sep 2016 12:08:41 +0900
MIME-Version: 1.0
In-Reply-To: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 85e0ec292cb75cad1ef71812fee11ed44ecc4ce8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 12 Sep 2016 06:55:49 +0900
Subject: [RFC PATH 6/6] Tweak page layout of onecolumn

The use of \epigraphhead{} requires proper layout of header.
This commit enables default page layout for onecolumn by modifying
the sed pattern in Makefile and adjusting layout width params
in the preamble.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile     |  2 +-
 perfbook.tex | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index e06b0a8..0207473 100644
--- a/Makefile
+++ b/Makefile
@@ -93,7 +93,7 @@ perfbook-1c.pdf: perfbook-1c.tex perfbook-1c.bbl
 	sh utilities/runlatex.sh perfbook-1c

 perfbook-1c.tex: perfbook.tex
-	sed -e 's/,twocolumn//' -e '/^\\frontmatter/a \\\\pagestyle{plain}' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < perfbook.tex > perfbook-1c.tex
+	sed -e 's/,twocolumn//' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < perfbook.tex > perfbook-1c.tex

 perfbook-1c.bbl: $(BIBSOURCES) perfbook-1c.aux
 	bibtex perfbook-1c
diff --git a/perfbook.tex b/perfbook.tex
index 77342c6..1493d16 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -88,10 +88,6 @@
 \renewcommand\dbltopfraction{.75}
 \renewcommand\dblfloatpagefraction{.5}

-\setlength{\textheight}{8.25in}
-\setlength{\textwidth}{6.5in}
-\setlength{\columnsep}{0.25in}
-
 \newboolean{inbook}
 \setboolean{inbook}{true}
 \newcommand{\IfInBook}[2]{\ifthenelse{\boolean{inbook}}{#1}{#2}}
@@ -102,6 +98,16 @@
 \setboolean{hardcover}{false}
 \newcommand{\IfHardCover}[2]{\ifthenelse{\boolean{hardcover}}{#1}{#2}}

+\IfTwoColumn{
+\setlength{\textheight}{8.25in}
+\setlength{\textwidth}{6.5in}
+\setlength{\columnsep}{0.25in}
+}{
+\setlength{\textheight}{8.25in}
+\setlength{\textwidth}{4.75in}
+\setlength{\columnsep}{0in}
+}
+
 \IfHardCover{
 \setlength{\topmargin}{13pt}
 \setlength{\evensidemargin}{-4pt}
-- 
1.9.1


