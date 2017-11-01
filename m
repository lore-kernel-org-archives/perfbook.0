Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=mqBylXEQ77B3bpn1+2FUkPj7ZS9R+gBe71ODuv9/kaQ=;
 b=oZtEbre7OUxnCxIbvfgDiEr+33gBmbSkwZQIbk3Bw1VtJqSyOMB7WbZqGKNFmnT+Jb
 K0FhjElI0BJCvRRJHqnQiHPqrBol6UIlxbPyL6FP8HIhVLI9ZZsTLbfIbZZuz67FGvLT
 D+GmGhqVcDS/h91HY0iQDfpr06caoemyzo4T/xF3zoH0v3sGXL78eqPIqh+wCvujVkii
 C2egAapMrweSZKIZtHDlXXkGjzvhd3vJw7klFoKVlkr+e87PwYnUD8epxgERDvq9nLHZ
 9vXHTbWVxkCEIPgYZpnf0RDxrKpUnpiI9HjahNwykhIga5c87Ip+CDmKuIGgkDsvUDGj
 CSSQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Adjust height of Table 15.5's header
Message-ID: <0337637d-91f3-df97-7dd0-2f7b66676145@gmail.com>
Date: Wed, 1 Nov 2017 23:27:10 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a7e4a7ee67e980055dbef5808b89335fc0eba483 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 1 Nov 2017 23:14:44 +0900
Subject: [PATCH] memorder: Adjust height of Table 15.5's header

While we are here, for the ease of maintenance of the table,
define a helper macro "\cpufml{}" to be used in the header.

Also adjust hspace for 1c layout and comment out a paragraph
which is pointless for the moment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 45 ++++++++++++++-------------------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index db5e065..b7d20f0 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3980,39 +3980,22 @@ dependencies.
 \rowcolors{4}{}{lightgray}
 \small
 \centering
-\renewcommand*{\arraystretch}{1.2}\OneColumnHSpace{-.6in}
+\newcommand{\cpufml}[1]{\begin{picture}(6,50)(0,0)\rotatebox{90}{#1}\end{picture}}
+\renewcommand*{\arraystretch}{1.2}\OneColumnHSpace{-.35in}
 \begin{tabular}{llccccccccc}
 	\toprule
 	\multicolumn{2}{l}{~} & \multicolumn{9}{c}{CPU Family} \\
 	\cmidrule{3-11}
 	\multicolumn{2}{c}{\raisebox{.5ex}{Property}}
-	& \begin{picture}(6,60)(0,0)
-		\rotatebox{90}{Alpha}
-	  \end{picture}
-	& \begin{picture}(6,60)(0,0)
-		\rotatebox{90}{ARMv8}
-	  \end{picture}
-	& \begin{picture}(6,60)(0,0)
-		\rotatebox{90}{ARMv7-A/R}
-	  \end{picture}
-	& \begin{picture}(6,60)(0,0)
-		\rotatebox{90}{Itanium}
-	  \end{picture}
-	& \begin{picture}(6,60)(0,0)
-		\rotatebox{90}{MIPS}
-	  \end{picture}
-	& \begin{picture}(6,60)(0,0)
-		\rotatebox{90}{\Power{}}
-	  \end{picture}
-	& \begin{picture}(6,60)(0,0)
-		\rotatebox{90}{SPARC TSO}
-	  \end{picture}
-	& \begin{picture}(6,60)(0,0)
-		\rotatebox{90}{x86}
-	  \end{picture}
-	& \begin{picture}(6,60)(0,0)
-		\rotatebox{90}{z~Systems}
-	  \end{picture}
+	& \cpufml{Alpha}
+	& \cpufml{ARMv8}
+	& \cpufml{ARMv7-A/R}
+	& \cpufml{Itanium}
+	& \cpufml{MIPS}
+	& \cpufml{\Power{}}
+	& \cpufml{SPARC TSO}
+	& \cpufml{x86}
+	& \cpufml{z~Systems}
 	\\
 	\cmidrule(r){1-2} \cmidrule{3-11}
 %		 Alpha ARMv8 ARMv7 Itanium MIPS PPC SPARC x86 z Systems
@@ -4070,7 +4053,7 @@ dependencies.
 	~ & ~ & C: & Compare-and-exchange instruction \\
 	~ & ~ & L: & Load-linked/store-conditional instruction \\
 \end{tabular}
-}\OneColumnHSpace{-0.7in}
+}\OneColumnHSpace{-0.4in}
 \caption{Summary of Memory Ordering}
 \label{tab:memorder:Summary of Memory Ordering}
 \end{table*}
@@ -4132,8 +4115,8 @@ instruction cache and pipeline.
 Such CPUs require special instructions be executed for self-modifying
 code.

-Parenthesized CPU names indicate modes that are architecturally allowed,
-but rarely used in practice.
+%Parenthesized CPU names indicate modes that are architecturally allowed,
+%but rarely used in practice.

 The common ``just say no'' approach to memory-ordering operations
 can be eminently reasonable where it applies,
-- 
2.7.4

