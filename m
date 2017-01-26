Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=0ERtF7ttcMQvS0O1gXYyqh9rFDmt4PwwkjzlXO9TjwA=;
 b=XEHYFWFW9UwN9JmaN0YSWh1t4S2VjS3bWVCCB67BB2QHr+l+0W8aK+9t7VVwGMSIEd
 Kes6WzTXef7Rv+B7yAnEBOKfDsCk75j2KS6xN2qG7XqgCkYtdHfTU+SdAp97fcDQSK0a
 7D1uDqvmaMffjTB/TiG8DemtGHxT9TL9tAnmLOCO4gMWwwADH++dPMjAf53FAcii6wD5
 vfJ/a+o+EommtB6fg6rCByLUPq21z2hyNO9x3jPwvJfTsI5Y4k6N+JOEGtq9ijUhjPvJ
 3l0f8cS0AJp0OVsX1rSo/LhgZcvu5KXLvH6bJDWealw8RiQNJooofHCdGOuiKFFm4zAH
 6g0Q==
Subject: [PATCH 2/5] Narrow textwidth of legal and TOB pages in 2c build
References: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b7b72e4e-5039-5955-4798-46b3a0c90ba9@gmail.com>
Date: Fri, 27 Jan 2017 00:19:22 +0900
MIME-Version: 1.0
In-Reply-To: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 57d4d9e8ee4f106068747e46b3d3e4bbbc2e4774 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 7 Jan 2017 20:31:47 +0900
Subject: [PATCH 2/5] Narrow textwidth of legal and TOB pages in 2c build

In 2c layout, these pages look too wide.
By using "changepage" package, this commit narrows their effective
textwidths as the same as in 1c layout. It also moves commands to
switch between onecolumn and twocolumn layouts in legal.tex to
perfbook.tex.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 legal.tex    | 4 ----
 perfbook.tex | 8 ++++++++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/legal.tex b/legal.tex
index 965c76e..fbd62ff 100644
--- a/legal.tex
+++ b/legal.tex
@@ -1,8 +1,6 @@
 % legal.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0

-\IfTwoColumn{\onecolumn}{}
-
 \section*{Legal Statement}

 This work represents the views of the editor and the authors and does not
@@ -43,5 +41,3 @@ If you are unsure of the license for a given code fragment,
 you should assume GPLv2-only.

 Combined work {\textcopyright}~2005-\commityear\ by Paul E. McKenney.
-
-\IfTwoColumn{\twocolumn}{}
diff --git a/perfbook.tex b/perfbook.tex
index 2c13e3f..a3b2d84 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -27,6 +27,7 @@
 \usepackage{ifthen}
 \usepackage{xcolor}
 \usepackage[shortcuts]{extdash}
+\usepackage{changepage}
 \usepackage{listings}
 \lstset{basicstyle=\ttfamily}
 % \usepackage[strings]{underscore}
@@ -153,8 +154,15 @@
 \frontmatter

 \maketitle
+\IfTwoColumn{
+  \onecolumn\begin{adjustwidth*}{.95in}{.8in}
+  \addtolength{\parindent}{6pt}
+}{}
 \input{legal}
 \tableofcontents
+\IfTwoColumn{
+  \end{adjustwidth*}\twocolumn
+}{}

 \mainmatter

-- 
2.7.4


