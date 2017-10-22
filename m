Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gckjpxt93bLANSumR49GQSVdaJXBFx99LNybHYwy9Zs=;
 b=mcS9XTCplZF/gHphXVGaGO9C+OyU50CJS/zlSys6ON80X2a8XOLD1TL71PMXvQUdx5
 lfvcOHTqDiHV7FyMvzSTXtVkhY5OHGhxn3OTV8Ox+BzOxxdb8G+kN+OpVFjnz9KbBKRf
 Bckv45V/s9bZEny48aYL4WID4Vw5pHGfMWqHJLdRRhrbX6aw5MvP7oxpF1+8g+TSQpoH
 ulh3h2pJeXnffOXr8YtIS8oyQftNRboVEjrSkeYDEvsGeqRuZ+BHkCjaxy6mB/2Vhz/D
 bnjbxMe/nMrouOJKjGNP6+j8EncPq5P3tbvbVdPdG5uirSUcYPbfeDXtetMOA6RS1I1R
 ZB0A==
Subject: [PATCH 5/5] datastruct: Convert 'NUMA Topology of System Under Test'
 to figure
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <644b7ee2-3900-6d86-c9a1-002e9cc3dd5b@gmail.com>
Date: Mon, 23 Oct 2017 00:28:13 +0900
MIME-Version: 1.0
In-Reply-To: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d224db4bfed5d4ce0639062a920bafc6f9442e16 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 22 Oct 2017 23:31:29 +0900
Subject: [PATCH 5/5] datastruct: Convert 'NUMA Topology of System Under Test' to figure

This can be regarded as a figure drawn using the "tabular" environment.
By using dashed rules of "arydshln" package, it looks more like a figure.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 46b4d8b..1dc2b49 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -458,7 +458,7 @@ Clearly something else is going on.

 The problem is that this is a multi-socket system, with CPUs~0-7
 and~32-39 mapped to the first socket as shown in
-Table~\ref{tab:datastruct:NUMA Topology of System Under Test}.
+Figure~\ref{fig:datastruct:NUMA Topology of System Under Test}.
 Test runs confined to the first eight CPUs therefore perform quite
 well, but tests that involve socket~0's CPUs~0-7 as well as
 socket~1's CPU~8 incur the overhead of passing data across
@@ -504,27 +504,36 @@ the caches, which in turn promotes locality of reference.
 The next section therefore examines optimizations that can be carried out in
 read-mostly cases where updates are rare, but could happen at any time.

-\begin{table}
+\setlength\dashlinedash{1pt}
+\setlength\dashlinegap{2pt}
+
+\begin{figure}
+\renewcommand*{\arraystretch}{1.2}
 \footnotesize
 \centering
-\begin{tabular}{r|r|r|r|r|r|r|r|r}
-	Socket & \multicolumn{8}{|c}{Core} \\
+\begin{tabular}{r|r:r:r:r:r:r:r:r|}
+	Socket & \multicolumn{8}{c|}{Core} \\
 	\hline
 	0 &  0 &  1 &  2 &  3 &  4 &  5 &  6 &  7 \\
+	\cdashline{2-9}
 	  & 32 & 33 & 34 & 35 & 36 & 37 & 38 & 39 \\
 	\hline
 	1 &  8 &  9 & 10 & 11 & 12 & 13 & 14 & 15 \\
+	\cdashline{2-9}
 	  & 40 & 41 & 42 & 43 & 44 & 45 & 46 & 47 \\
 	\hline
 	2 & 16 & 17 & 18 & 19 & 20 & 21 & 22 & 23 \\
+	\cdashline{2-9}
 	  & 48 & 49 & 50 & 51 & 52 & 53 & 54 & 55 \\
 	\hline
 	3 & 24 & 25 & 26 & 27 & 28 & 29 & 30 & 31 \\
+	\cdashline{2-9}
 	  & 56 & 47 & 58 & 59 & 60 & 61 & 62 & 63 \\
+	\hline
 \end{tabular}
 \caption{NUMA Topology of System Under Test}
-\label{tab:datastruct:NUMA Topology of System Under Test}
-\end{table}
+\label{fig:datastruct:NUMA Topology of System Under Test}
+\end{figure}

 \section{Read-Mostly Data Structures}
 \label{sec:datastruct:Read-Mostly Data Structures}
-- 
2.7.4


