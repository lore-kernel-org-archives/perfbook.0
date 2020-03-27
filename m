Return-Path: <SRS0=2js+=5M=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4mcABN2EJMJzzN2MiQjXXmxODjNNTwhfO5t+kG0U8lQ=;
        b=CtW+oAe2MGQcwao1043bY8MhTL/dTOlFTCOF3Lk75MK3MshAuNSF9w868t0o49mebh
         Tiuon+T6D1I6nQPRQtvHiEmnNXvx5i0di1fc8QVsKGP/PwwTkBAhYraAcbKvJv6Bgfrc
         yjTi0R+XRhhElAge9s03hqcv3puI1kzAcJzYoP+NxQm7Ue4T3zoOeNrVZFiVsMXs8XHO
         gTVfULENu8Au7W7H+FNP1rxNveqzFUNMx5nNUUzDlDOAeCHorVV8uWS2oxVDJYNVjmrN
         Zi8E2g2oDK3V9kZQSlmS1tf9/Ne5hC8j2bXF5ttXd7FWm6G22hXEjrTnv9hueABquVCB
         Todg==
Subject: [PATCH 2/4] Fix paper size of -hb build
References: <58f67d0a-cd08-387c-bd69-5c53c8049c4a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6408d423-4d8d-be96-1f63-38e5de8457b1@gmail.com>
Date: Fri, 27 Mar 2020 20:28:10 +0900
MIME-Version: 1.0
In-Reply-To: <58f67d0a-cd08-387c-bd69-5c53c8049c4a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4baaa6cf18f4bec4bd4e59fe0a07152c4c4ad885 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 26 Mar 2020 22:49:51 +0900
Subject: [PATCH 2/4] Fix paper size of -hb build

The change made in commit 648af1774e3a ("Stop using modified book.cls")
back in April 2018 caused pdflatex to output PDF with a default
paper size determined at installation time of TeX Live, normally
letterpaper.

As a workaround, use "geometry" package with the custom paper-size
options for -hb build.

Add the letterpaper option to \documentclass{} to make sure the
resulting PDF is of US letterpaper as well.

(Default paper size might be a4paper depending on the installation
option.)

Also remove definition of unused option "letterpaperhb" from
pfbook.cls.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile     |  2 +-
 perfbook.tex | 12 +++++++++---
 pfbook.cls   |  9 ++-------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index d1f4dff6..c65bd786 100644
--- a/Makefile
+++ b/Makefile
@@ -238,7 +238,7 @@ perfbook-1c.tex: perfbook.tex
 	sed -e 's/,twocolumn//' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < $< > $@
 
 perfbook-hb.tex: perfbook.tex
-	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@
+	sed -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@
 
 perfbook-msns.tex: perfbook.tex
 	sed -e 's/%msfontstub/\\usepackage{courier}/' < $< > $@
diff --git a/perfbook.tex b/perfbook.tex
index 2b88bf88..8141b15e 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -1,4 +1,4 @@
-\documentclass[10pt,twocolumn]{pfbook} % book class customized for perfbook
+\documentclass[10pt,twocolumn,letterpaper]{pfbook} % book class customized for perfbook
 % For arxiv.org, must be on or before line 5:
 \pdfoutput=1
 
@@ -254,6 +254,10 @@
 \newcommand{\pararef}[1]{Paragraph ``\nameref{#1}'' on Page~\pageref{#1}}
 \newcommand{\Pararef}[1]{Paragraph ``\nameref{#1}'' on Page~\pageref{#1}}
 
+\IfHardCover{
+\usepackage[paperheight=10.75in,paperwidth=8.25in]{geometry}
+}{}
+
 \begin{document}
 
 %%HTMLSKIP
@@ -331,8 +335,10 @@
 }
 
 \IfHardCover{
-\addtolength{\topmargin}{-0.25in}
-\addtolength{\evensidemargin}{-0.25in}
+\addtolength{\topmargin}{-0.125in}
+\addtolength{\oddsidemargin}{-0.05in}
+\addtolength{\evensidemargin}{-0.7in}
+\SetWatermarkVerCenter{.92\paperheight}
 }{}
 
 \setcounter{secnumdepth}{4} % Enable counter for paragraph
diff --git a/pfbook.cls b/pfbook.cls
index 9c1ef9f1..c27555cc 100644
--- a/pfbook.cls
+++ b/pfbook.cls
@@ -4,14 +4,9 @@
 % Copyright (C) 2018 Akira Yokosawa
 \NeedsTeXFormat{LaTeX2e}[1995/12/01]
 \ProvidesClass{pfbook}
-              [2018/04/01 v1.4h-pem-ay
+              [2020/03/26 v1.4i-ay
  book class customized for perfbook]
-% (by Paul E. McKenney)
-% Add an option "letterpaperhb" in order to generate 10.75x8.25in pages
-% for hardcover books.
-\DeclareOption{letterpaperhb}
-   {\setlength\paperheight {10.75in}%
-    \setlength\paperwidth  {8.25in}}
+%
 \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
 \ProcessOptions\relax
 \LoadClass{book}
-- 
2.17.1


