Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M/GlJnEL9a3JTv3C01QLXHCQpfytWYw7qhwMbaOPc/Q=;
 b=HpWZNtd5BmG5t04emMY2HOhP5iURMedvrsWde0mBN+Qvc1oSNfPisXiGoB6uvOYXwF
 skxGY1G4vUkfiP+N77CW6/0RjdOHTdAHbPs4L0153M2/y1r66zYJ+NCv2vNidsfao6TK
 kK75RHS3emZW4ORVa0AyPQf7toQAfNuXvaOricKiuQv6+jxsRfNixRlfOz2BSfsXYrm0
 8fvuxP195AA6E2EoyIxPMzyhsB+uLyGJ/tdWR7Aa9/fBDjfNe4vSp5SrDbSbvZXhemLq
 GxRnQo6Iz2VwnVroxzdhnPKWn1Xm7oQINiXM4m2yAIZEeQxHhbrUJycm71KxqcMH8lgC
 k6iw==
Subject: [PATCH 2/5] Define \twocolumnwidth for 1c layout
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7e565cee-996d-e00f-f20e-176ded943c62@gmail.com>
Date: Mon, 23 Oct 2017 00:24:18 +0900
MIME-Version: 1.0
In-Reply-To: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d04822df9b8f292309ca6b176a8e1c37da84eb11 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 22 Oct 2017 20:25:28 +0900
Subject: [PATCH 2/5] Define \twocolumnwidth for 1c layout

Using \columnwidth in \resizebox{} and tabularx environment causes
several figures and a table to be too wide in 1c layout. By defining
and using a length \twocolumnwidth for both 2c and 1c layouts, the
problem can be avoided.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex | 2 +-
 memorder/memorder.tex   | 8 ++++----
 perfbook.tex            | 4 ++++
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 0dbef1e..2e5b69f 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -1350,7 +1350,7 @@ Table~\ref{fig:app:questions:Schematic of Real-World Parallel Allocator}.
 \centering
 \renewcommand*{\arraystretch}{1.25}
 \setlength\tabcolsep{4pt}
-\begin{tabularx}{\columnwidth}{l|l|>{\raggedright\arraybackslash}X}
+\begin{tabularx}{\twocolumnwidth}{l|l|>{\raggedright\arraybackslash}X}
 Level	& Locking & Purpose \\
 \hline
 Per-thread pool	  & Data ownership & High-speed allocation \\
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 53878f0..3c6d21a 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2315,7 +2315,7 @@ exists (1:r2=0 /\ x1=2)

 \begin{figure}[htbp]
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{memorder/fr}}
+\resizebox{\twocolumnwidth}{!}{\includegraphics{memorder/fr}}
 \caption{Load-to-Store is Counter-Temporal}
 \label{fig:memorder:Load-to-Store is Counter-Temporal}
 \end{figure}
@@ -2439,7 +2439,7 @@ Listing~\ref{lst:memorder:W+WRC Litmus Test With More Barriers}

 \begin{figure}[tbp]
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{memorder/co}}
+\resizebox{\twocolumnwidth}{!}{\includegraphics{memorder/co}}
 \caption{Store-to-Store is Counter-Temporal}
 \label{fig:memorder:Store-to-Store is Counter-Temporal}
 \end{figure}
@@ -2458,7 +2458,7 @@ But sometimes time is on our side, as shown in the next section.

 \begin{figure}[tbp]
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{memorder/rf}}
+\resizebox{\twocolumnwidth}{!}{\includegraphics{memorder/rf}}
 \caption{Store-to-Load is Temporal}
 \label{fig:memorder:Store-to-Load is Temporal}
 \end{figure}
@@ -4111,7 +4111,7 @@ in Alpha's heyday.

 \begin{figure}[tbp]
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{memorder/Alpha}}
+\resizebox{\twocolumnwidth}{!}{\includegraphics{memorder/Alpha}}
 \caption{Why \tco{smp_read_barrier_depends()} is Required}
 \label{fig:memorder:Why smp-read-barrier-depends() is Required}
 \end{figure}
diff --git a/perfbook.tex b/perfbook.tex
index 8a70c94..93d2253 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -119,6 +119,7 @@
 \captionsetup{hangindent=20pt}
 \captionsetup[listing]{hangindent=20pt}

+
 \begin{document}

 %%HTMLSKIP
@@ -193,15 +194,18 @@
 \renewcommand\dbltopfraction{.75}
 \renewcommand\dblfloatpagefraction{.5}

+\newlength{\twocolumnwidth}
 \IfTwoColumn{
 \setlength{\textheight}{8.25in}
 \setlength{\textwidth}{6.5in}
 \setlength{\columnsep}{0.25in}
+\setlength{\twocolumnwidth}{\columnwidth}
 \renewcommand\floatpagefraction{.75}
 }{
 \setlength{\textheight}{8.25in}
 \setlength{\textwidth}{4.75in}
 \setlength{\columnsep}{0in}
+\setlength{\twocolumnwidth}{3.125in}
 \addtolength{\oddsidemargin}{0.3in}
 \addtolength{\evensidemargin}{-0.3in}
 }
-- 
2.7.4


