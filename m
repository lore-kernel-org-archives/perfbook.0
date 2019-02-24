Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TXLCpgKYI3fwkEkE2irMqLEoChh4KoraUNo7pTjCWZI=;
        b=kIy/f9ilPjVNsb1XeJ9cSrIFZAe8UO99SXzwDGOB7KAdJCtFrQcUBzSvLASC/LS0C/
         wBwopHJHA+tpv+yIxVA60T2LZF6+JhQIwp/kNdcQG7aeJx6eo446RGecHjB/tOM+cVcx
         RKxbpgC+ZvDyX5Jzf8OQyjiLsZyMCAIV+Zt8jz26+4oKn3A2n9L8MHCOcVFV5g69danZ
         GJ8DYH16pu5DE1z7iQAyv+/O9KOrt6b19zrzuJuIEmLBzcIJd+UKgZivBKjQGxoZsaq8
         JXe3gHLvVp8rZXv69aVtolyZBSGtI4QswytcEKBnEzeX3tn7bnooTJ0aQjZzXw/KM6mA
         YY0w==
Subject: [PATCH 8/8] Widen tabsize of code snippets for 1c layout
References: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b21ace60-5e45-5770-c017-a329f0f1ecb8@gmail.com>
Date: Sun, 24 Feb 2019 09:17:36 +0900
MIME-Version: 1.0
In-Reply-To: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 409e0528f63f20877a3fc6a8b4280acd879dd056 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 23 Feb 2019 19:41:35 +0900
Subject: [PATCH 8/8] Widen tabsize of code snippets for 1c layout

Most readers are supposed to be used to tabsize=8.
Use it for 1c layout.

While we are here, use \fvset{} to set common default parameters.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/perfbook.tex b/perfbook.tex
index bbf8455..ac37477 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -129,13 +129,19 @@
 \usepackage{arydshln}
 \definecolor{lightgray}{gray}{0.9} % for coloring alternate rows in table
 
+\fvset{fontsize=\scriptsize,obeytabs=true}
+\IfTwoColumn{
+\fvset{tabsize=2}
+}{
+\fvset{tabsize=8}
+}
 \DefineVerbatimEnvironment{VerbatimL}{Verbatim}%
-{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,obeytabs=true,tabsize=2}
+{numbers=left,numbersep=5pt,xleftmargin=9pt}
 \AfterEndEnvironment{VerbatimL}{\vspace*{-9pt}}
 \DefineVerbatimEnvironment{VerbatimN}{Verbatim}%
-{fontsize=\scriptsize,numbers=left,numbersep=3pt,xleftmargin=5pt,xrightmargin=5pt,obeytabs=true,tabsize=2,frame=single}
+{numbers=left,numbersep=3pt,xleftmargin=5pt,xrightmargin=5pt,frame=single}
 \DefineVerbatimEnvironment{VerbatimU}{Verbatim}%
-{fontsize=\scriptsize,numbers=none,xleftmargin=5pt,xrightmargin=5pt,obeytabs=true,tabsize=2,samepage=true,frame=single}
+{numbers=none,xleftmargin=5pt,xrightmargin=5pt,samepage=true,frame=single}
 
 \IfLmttForCode{
 \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
-- 
2.7.4


