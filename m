Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HsSSWsCc5XkUO54xBPiL97Ioo0GhRGAR03g+xLLw6ko=;
 b=copXA9GkDOVsQWiIOpE7ZcCQD6PbUt/0iF1AYyc/yA2ASsBQaBQtuLlj7chmKqiMUt
 YlyTXz1pnB3te/RBW5eeaq0/HwyROslcV00MTjpSGVq0HMvVuPB5EtfdrkYH6q1Kewnh
 6TkZdCQs1TYbESuP+NQZhz+BB8kVP0DsDj0VFJB+mN/TS0o1820J+o0+rD1zh83HZg66
 zwSxiQiafyv/NBL7OMaUv8SkQ8/nCl7HG9vPuiXLR85VzcuU0t7Ba+KhVH05iHOqqkaU
 pDRUTB5VHOSJg1/NbDZNcRg3ysvHRzqFjHE/QcfkpVEiMbSovADfEWMSrBJXOYGzA/hm
 xFgw==
Subject: [PATCH 2/8] future/QC: Tweak appearance of tables
References: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f743a79d-ea7d-4988-237f-a580078aa648@gmail.com>
Date: Sat, 17 Jun 2017 12:57:14 +0900
MIME-Version: 1.0
In-Reply-To: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 265717d1d83c49017280b38faf56162c6d72adbf Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 1 Jun 2017 21:09:38 +0900
Subject: [PATCH 2/8] future/QC: Tweak appearance of tables

Add \centering\footnotesize.
Also adjust column width and move a \hline to where it should be.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index b90cca6..36b68ad 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -123,6 +123,7 @@ QC systems have been making substantial Moore's-Law-style progress
 in a number of technical areas.

 \begin{table}
+\centering\footnotesize
 \begin{tabular}{l|r|r|r}
 	&	&	& Years per \\
 System
@@ -639,7 +640,8 @@ to transport heat from a low temperature ($T_L$) to a high temperature
 \end{equation}

 \begin{table}
-\begin{tabular}{p{1.5in}|p{1.2in}}
+\centering\footnotesize
+\begin{tabular}{p{1.7in}|p{0.95in}}
 Law of Thermodynamics
 	& English Translation \\
 \hline
@@ -685,6 +687,7 @@ at low temperatures.\footnote{
 	a less daunting refrigeration barrier to QC-on-a-chip.}

 \begin{table}
+\centering\footnotesize
 \begin{tabular}{l|r|r|r}
 	&	&	& Power per watt \\
 Situation
@@ -692,7 +695,6 @@ Situation
 		& $C_P$	& waste heat (W) \\
 \hline
 \hline
-\hline
 Dry Ice
 	& $195$
 		& $1.990$
@@ -702,6 +704,7 @@ Liquid N$_2$
 	& $77$
 		& $0.356$
 			& 2.8 \\
+\hline
 Liquid H$_2$
 	& $20$
 		& $0.073$
-- 
2.7.4


