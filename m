Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UWcFhmcYY2R22OH/PTTo0UIi4s0V0d5VcKlySN9JfxU=;
 b=eZrHMphUM37QZKalivyxPcwuSKdknzdlAbMtHHN6F4gCxVQGTlx4a/Q7Ee9zt8zick
 WMir5ixdpgIBnrE/rqf0STyWMfqACLda67ba5Bs77nA9zopeRCrleROfOrNMueIOTcVa
 k+sBmaisGziGMWFM/T6VM5fLKrjG0BFBG37gnmr0nKUhA0MOKjLnK/io7wq+MovaXLJp
 n7j81Qcic1fSQAXZiCWMaG4rfTyym+9rqG+Pv4y6zZ9e8sCCaTd5bg/zrgsTMqO9z/w2
 1t5asQt2SGh6pz7SY4bX/OK/aQwWGCjL4a7Ghzy2Y+mnomS8Sdn0ot+rtXqolrHSR75c
 T/Bg==
Subject: [PATCH 3/4] Get rid of 'tabulary' package
References: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e74407c4-5273-42d8-2c12-9a5afde8fa8f@gmail.com>
Date: Sat, 19 Aug 2017 08:33:17 +0900
MIME-Version: 1.0
In-Reply-To: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fe6cf8fa360b8d437d9dedeb626a1f841d44e127 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 17 Aug 2017 19:39:04 +0900
Subject: [PATCH 3/4] Get rid of 'tabulary' package

Use "tabularx" package instead.
This change gives us the chance to try dashed rules of "arydshln"
package.
Also increase the font size to footnotesize for readability.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex            |  8 +++++---
 appendix/styleguide/styleguide.tex |  4 +---
 defer/rcuapi.tex                   | 11 ++++++++---
 defer/whichtochoose.tex            | 10 +++++++---
 perfbook.tex                       |  4 ++--
 5 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 842341f..1936d27 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -1346,16 +1346,18 @@ as shown in
 Table~\ref{fig:app:questions:Schematic of Real-World Parallel Allocator}.

 \begin{table}[tbp]
-\scriptsize
+\footnotesize
 \centering
-\begin{tabulary}{0.95\columnwidth}{l|l|L}
+\renewcommand*{\arraystretch}{1.25}
+\setlength\tabcolsep{4pt}
+\begin{tabularx}{\columnwidth}{l|l|>{\raggedright\arraybackslash}X}
 Level	& Locking & Purpose \\
 \hline
 Per-thread pool	  & Data ownership & High-speed allocation \\
 Global block pool & Data locking   & Distributing blocks among threads \\
 Coalescing	  & Data locking   & Combining blocks into pages \\
 System memory	  & Code locking   & Memory from/to system \\
-\end{tabulary}
+\end{tabularx}
 \caption{Schematic of Real-World Parallel Allocator}
 \label{fig:app:questions:Schematic of Real-World Parallel Allocator}
 \end{table}
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 31a83eb..40dfa74 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -448,7 +448,7 @@ a white space, or an operator \tco{->}.
 Although \verb|\co{}| command is convenient for inlining within text,
 it is fragile because of its capability of line break.
 When it is used inside a ``tabular'' environment or its derivative
-such as ``tabulary'', it confuses column width
+such as ``tabularx'', it confuses column width
 estimation of those environments.
 Furthermore, \verb|\co{}| can not be safely used in section headings nor
 description headings.
@@ -916,8 +916,6 @@ Note that ruled lines of booktabs can not be mixed with
 vertical lines in a table.\footnote{
   There is another package named ``arydshln'' which provides dashed lines
   to be used in tables.
-  Unfortunately, it conflicts with the tabulary package and prevents us
-  from experimenting it for the moment.
 }

 \vfil
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index f2aa3ff..158ebff 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -18,8 +18,13 @@ presents concluding remarks.

 \begin{sidewaystable*}[htbp]
 \centering
-\scriptsize\tymin=1.0in
-\begin{tabulary}{7.6in}{L|L|L|L|L|L}
+\footnotesize
+\begin{tabularx}{7.9in}{>{\raggedright\arraybackslash}p{1.08in}|
+    >{\raggedright\arraybackslash}X|
+    >{\raggedright\arraybackslash}X|
+    >{\raggedright\arraybackslash}X|
+    >{\raggedright\arraybackslash}X|
+    >{\raggedright\arraybackslash}p{1.22in}}
 Attribute &
     RCU Classic &
 	RCU BH &
@@ -118,7 +123,7 @@ Non-\tco{PREEMPT_RT} implementation &
 	    Forced Schedule on all CPUs &
 	        Realtime RCU &
 		    SRCU \\
-\end{tabulary}
+\end{tabularx}
 \caption{RCU Wait-to-Finish APIs}
 \label{tab:defer:RCU Wait-to-Finish APIs}
 \end{sidewaystable*}
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index edbdcb9..0b716ef 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -6,8 +6,12 @@

 \begin{table*}
 \footnotesize
-\centering\tymin=0.4in\tymax=2in\OneColumnHSpace{-.3in}
-\begin{tabulary}{5.3in}{L||L|L|L|L}
+\centering\OneColumnHSpace{-.3in}
+\begin{tabularx}{5.3in}{>{\raggedright\arraybackslash}p{1.1in}||
+    >{\raggedright\arraybackslash}p{1.2in}|
+    >{\raggedright\arraybackslash}X|
+    >{\raggedright\arraybackslash}X|
+    >{\raggedright\arraybackslash}p{.9in}}

 		& Reference Counting
 			& Hazard Pointers
@@ -83,7 +87,7 @@
 			& 79
 				& 79
 					& 73 \\
-\end{tabulary}
+\end{tabularx}
 \caption{Which Deferred Technique to Choose?}
 \label{tab:defer:Which Deferred Technique to Choose?}
 \end{table*}
diff --git a/perfbook.tex b/perfbook.tex
index 4590338..3cfc4fd 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -45,7 +45,7 @@
 \usepackage{gensymb} % symbols for both text and math modes such as \degree and \micro
 \usepackage{verbatimbox}[2014/01/30] % for centering verbatim listing in figure environment
 \usepackage[bottom]{footmisc} % place footnotes under floating figures/tables
-\usepackage{tabulary}
+\usepackage{tabularx}
 \usepackage[hyphens]{url}
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0}]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
@@ -98,7 +98,7 @@
 \AtBeginEnvironment{verbbox}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{table}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{tabular}{\renewcommand{\ttdefault}{lmtt}}
-\AtBeginEnvironment{tabulary}{\renewcommand{\ttdefault}{lmtt}}
+\AtBeginEnvironment{tabularx}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{minipage}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{listing}{\renewcommand{\ttdefault}{lmtt}}
 }{}
-- 
2.7.4


