Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=BH/KWU1IIrID0n/7bSuroSu1EqfxO9velPauf0oqSc8=;
 b=Hw//XAkXFsMqdES0CvFiYh7a5O+QUp+PFB2qzyLLLoDe+4Cc8CBI1BU5og993dMROX
 M/qVUOmzNxcbuOIlHd8jbk/gKmHfKcxlTS76P0Wl/OoWqIpnxtWLpyGztN5ov6m3K4Fd
 pm8xHyOmiEGhcAR/+foyf+XdTie52iIDP4k1ljkTPoUEPXhJGGwuF1SUI7/pM5sf4mAZ
 CZU3QWqD4iFUtxfKqNHhwFOzjXdmYnitLOq8HsHskeiIfdztNQKsFYtW5xdm10nE77dw
 QYoac/18mtdw+u7o7fW/M3lrCFy332iLscGpuKmQfjivwOQJDkZv2UUAHA2tUs+bDjbS
 CZgg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] locking: Update table layout
Message-ID: <4cfc2b83-44b8-b1b8-056d-45f88f50c316@gmail.com>
Date: Tue, 24 Oct 2017 22:26:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 126fac5ccb8966764d49cb81b6c61d55bd1d21f4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 24 Oct 2017 07:54:30 +0900
Subject: [PATCH 1/2] locking: Update table layout

To imply vertical lines, instead of coloring alternate rows,
put light gray boxes in blank cells.

Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 locking/locking.tex | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 9cb0176..a574a0c 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1311,44 +1311,42 @@ or even milliseconds.
 \subsection{Beyond Reader-Writer Locks}
 \label{sec:locking:Beyond Reader-Writer Locks}

+\newcommand{\x}{\textcolor{gray!20}{\rule{7pt}{7pt}}}
+
 \begin{table}
+\renewcommand*{\arraystretch}{1.2}
 \small
 \centering
-\begin{tabular}{l||c|c|c|c|c|c}
-	~ ~ ~ ~ ~ ~ ~ ~ ~
-	& \begin{picture}(6,70)(0,0)
+\begin{tabular}{lcccccc}
+	\toprule
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Null (Not Held)}
 	  \end{picture}
-	& \begin{picture}(6,70)(0,0)
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Concurrent Read}
 	  \end{picture}
-	& \begin{picture}(6,70)(0,0)
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Concurrent Write}
 	  \end{picture}
-	& \begin{picture}(6,70)(0,0)
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Protected Read}
 	  \end{picture}
-	& \begin{picture}(6,70)(0,0)
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Protected Write}
 	  \end{picture}
-	& \begin{picture}(6,70)(0,0)
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Exclusive}
 	  \end{picture}
 	\\
-	\hline
-%				 NL  CR  CW  PR    PW  EX
-	\hline
-	Null (Not Held)		& ~ & ~ & ~   & ~ & ~ & ~ \\
-	\hline
-	Concurrent Read		& ~ & ~ & ~   & ~ & ~ & X \\
-	\hline
-	Concurrent Write	& ~ & ~ & ~   & X & X & X \\
-	\hline
-	Protected Read		& ~ & ~ & X   & ~ & X & X \\
-	\hline
-	Protected Write		& ~ & ~ & X   & X & X & X \\
-	\hline
-	Exclusive		& ~ & X & X   & X & X & X \\
+%				  NL   CR   CW     PR   PW   EX
+	\cmidrule(r){1-1} \cmidrule{2-7}
+	Null (Not Held)		& \x & \x & \x   & \x & \x & \x \\
+	Concurrent Read		& \x & \x & \x   & \x & \x &  X \\
+	Concurrent Write	& \x & \x & \x   &  X &  X &  X \\
+	Protected Read		& \x & \x &  X   & \x &  X &  X \\
+	Protected Write		& \x & \x &  X   &  X &  X &  X \\
+	Exclusive		& \x &  X &  X   &  X &  X &  X \\
+	\bottomrule
 \end{tabular}
 \caption{VAX/VMS Distributed Lock Manager Policy}
 \label{tab:locking:VAX/VMS Distributed Lock Manager Policy}
-- 
2.7.4

