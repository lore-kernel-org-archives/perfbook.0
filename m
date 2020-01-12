Return-Path: <SRS0=UsGV=3B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L5iv+q5vizP3O6t6MsVA5L5sDafSmqumHP3M0liFr9s=;
        b=giK5Q8q/VyAOO8WWIqz+3qtBKZguAt+QW6AloS8NIry0GAEV2w63w1xZ50SQuCUo5p
         hjvSA0wndKmJ28rtP5I7mB1GX78um9ZWSFMDJ5PPq1o6c5veOHIxXLfJUXFucxslaHb0
         AVv6PhYig+NamWrGWPHOh+dEZ9SsdZORkxbWejrG7QEknDlTA0IUWXsLh8ATpao5q6zx
         1/LftRzoCw49fuBCBkH1Uv9vZ7hblaph9d9JZUtb72rya+OLgqx4jeCnP3WSIeeNvOH1
         TUuVUXfcbjt7aHTbYzAgddDr8pvGMvtEMvBsCpXEckSSfb/5rWE2rmSpMnK2033U9R9E
         cE1g==
Subject: [PATCH 3/6] Prevent section epigraph from orphaned
References: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5c715173-e681-b738-98d3-158f05e52d2a@gmail.com>
Date: Sun, 12 Jan 2020 13:09:10 +0900
MIME-Version: 1.0
In-Reply-To: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a0018ab43dcde623de230b7077820c4ee86a5144 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 11 Jan 2020 08:17:27 +0900
Subject: [PATCH 3/6] Prevent section epigraph from orphaned

Latest "epigraph" package has a nice feature to make sure that
section epigraph is not orphaned.

Add version info to its \usepackage.
Also add it to #10 in FAQ-BUILD.txt.

Also suppress widows and orphans by using the "nowidow" package.
This prevents a single line of a paragraph to appear at the
bottom or the top of a page/column. For example, Short QQZ (less
than 4 lines) won't be broken in the middle any more.

This narrows the freedom of LaTeX's typesetting and slightly
increases page count, but should improve the ease of read.

NOTE 1: epigraph's document now mentions a macro \epigraphnoindent
which would have the same effect as \NoIndentAfterCmd{\epigraph},
but it has weird side effect on the spacing of other section
headings.

NOTE 2: This update causes stretched vertical spaces between
paragraphs in pages where section headings with epigraphs are
forwarded to the next pages.  They might need tweaks in LaTeX
sources later, especially in the -RC stages of the next edition.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 7 +++++--
 perfbook.tex  | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index f5066798..56d60a3e 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -178,11 +178,13 @@
 			tlmgr install newtx
 
 10.	Building perfbook fails with a warning of buggy cleveref/listings
-	or version mismatch of titlesec/draftwatermark. What can I do?
+	or version mismatch of titlesec/draftwatermark/epigraph.
+	What can I do?
 
 	A.	They are known issues on Ubuntu Xenial (titlesec),
 		Ubuntu Bionic (cleveref), TeX Live 2014/2015 (listings),
-		and TeX Live releases prior to 2015 (draftwatermark).
+		TeX Live releases prior to 2015 (draftwatermark),
+		and TeX Live releases prior to 2020 (epigraph).
 		This answer assumes Ubuntu, but it should work on other
 		distros.
 
@@ -191,6 +193,7 @@
 		http://mirrors.ctan.org/macros/latex/contrib/cleveref.zip
 		http://mirrors.ctan.org/macros/latex/contrib/listings.zip
 		http://mirrors.ctan.org/macros/latex/contrib/draftwatermark.zip
+		http://mirrors.ctan.org/macros/latex/contrib/epigraph.zip
 
 	    2.	Install it by following instructions at:
 		https://help.ubuntu.com/community/LaTeX#Installing_packages_manually
diff --git a/perfbook.tex b/perfbook.tex
index db334ae4..38272761 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -71,7 +71,7 @@
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
-\usepackage{epigraph}
+\usepackage{epigraph}[2020/01/02] % latest version prevents orphaned epigraph
 \setlength{\epigraphwidth}{2.6in}
 \usepackage[xspace]{ellipsis}
 \usepackage{braket} % for \ket{} macro in QC section
@@ -80,6 +80,7 @@
 \usepackage{multirow}
 \usepackage{noindentafter}
 \NoIndentAfterCmd{\epigraph}
+\usepackage[all]{nowidow}
 \titleformat{\paragraph}[runin]{\normalfont\normalsize\bfseries}{}{0pt}{}
 
 % custom packages
-- 
2.17.1


