Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cBcd5wxZJhnWWD9FODKvIoqQT1mWbUHUQfE2+4u3QBE=;
 b=HCred1TB0u5qzRFEJC+hjSfDuByTeRVqxSWs/w4tpWSEMGwck/mZTDGy0gco6yU15S
 mi7bTv5yNi5gyoHNwH3LYlryH+Wn4r4oWu71foCbxSnFQ5X9adtHEY7t6Ans7vZUnV7O
 vA5i1Rx7WV2OaKmA+14dxmKBtLEOkMsqQneOBwjUEeHdEImiTtJ617Uqg3YYZBOCCUqU
 1qTmXZSg+GYU/cO1VizI63Icumrs8kew4bEESvfkiMQZCAznaiMgNaK9yWCU0MoOWNFC
 Y3/wIdjtSXws9pYE16rMWf//Hn9l3ItyPAp9oefauwN/tIpsgrIecOFgVspjFV0I+R5b
 4i8g==
Subject: [PATCH 1/5] future/QC: Improve layout of Table 17.5 by using subfloat
References: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <205f751c-2ecb-432d-8e88-47319f0df2cb@gmail.com>
Date: Sun, 25 Feb 2018 08:49:32 +0900
MIME-Version: 1.0
In-Reply-To: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e3688c8cdf8e8e34d36012a3a3463ce9e8825ef4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Feb 2018 17:39:08 +0900
Subject: [PATCH 1/5] future/QC: Improve layout of Table 17.5 by using subfloat

This enables us to offload part of row headers to captions of
sub-tables.

In perfbook.tex, font size of sub captions is increased to "small"
from the default of "footnotesize".

Also remove "%" in each cell and indicate the unit in row headers.
By this change, the "S" column-layout specifier of siunitx package
can be used to align decimal points.

Also add headers to indicate what "Qn" and "CXm_n" mean.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 125 ++++++++++++++++++++++++++++++++--------------------------
 perfbook.tex  |   1 +
 2 files changed, 70 insertions(+), 56 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index df464a4..6491985 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -635,66 +635,79 @@ $10^{-4}$).
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \small
-\centering\OneColumnHSpace{-0.1in}
-\begin{tabular}{lrrrrr}
+\centering
+\subfloat[Single-Qubit Gate Properties]{
+\begin{tabular}{ll*{5}{S[table-format=2.3]}}
 	\toprule
-	& Q\textsubscript{0} &
-		Q\textsubscript{1} &
-			Q\textsubscript{2} &
-				Q\textsubscript{3} &
-					Q\textsubscript{4} \\
-	% \cmidrule(l){2-4} \cmidrule(l){5-7}
-	% \cmidrule{1-1} \cmidrule(l){2-4} \cmidrule(l){5-7}
-	Gate Per-Operation Error Rate &
-	   0.197\% &
-	  	 0.129\% &
-			 0.197\% &
-				 0.163\% &
-					 0.094\% \\
-	Gate Per-Operation Fidelity &
-	  99.803\% &
-	  	99.871\% &
-			99.803\% &
-				99.837\% &
-					99.906\% \\
-	Gate Readout Error Rate &
-	   4.50\% &
-	  	 3.60\% &
-			 2.00\% &
-				 1.60\% &
-					 2.50\% \\
-	Gate Readout Fidelity &
-	  95.50\% &
-	  	96.40\% &
-			98.00\% &
-				98.40\% &
-					97.50\% \\
-	& & & & & \\
+	& & \multicolumn{5}{c}{Qubit} \\
+	\cmidrule{3-7}
+	\multicolumn{2}{c}{Gate Property} &
+	\multicolumn{1}{c}{Q\textsubscript{0}} &
+		\multicolumn{1}{c}{Q\textsubscript{1}} &
+			\multicolumn{1}{c}{Q\textsubscript{2}} &
+				\multicolumn{1}{c}{Q\textsubscript{3}} &
+					\multicolumn{1}{c}{Q\textsubscript{4}} \\
+	\cmidrule(r){1-2} \cmidrule{3-7}
+	\cellcolor{white}Per-Operation & \cellcolor{white}Error Rate (\%) &
+	 0.197 &
+		 0.129 &
+			 0.197 &
+				 0.163 &
+					 0.094 \\
+	& Fidelity (\%) &
+	99.803 &
+		99.871 &
+			99.803 &
+				99.837 &
+					99.906 \\
+	\cmidrule(r){1-2} \cmidrule{3-7}
+	\cellcolor{white}Readout & \cellcolor{white}Error Rate (\%) &
+	 4.50 &
+		 3.60 &
+			 2.00 &
+				 1.60 &
+					 2.50 \\
+	& Fidelity (\%) &
+	95.50 &
+		96.40 &
+			98.00 &
+				98.40 &
+					97.50 \\
+	\bottomrule
 \end{tabular}
-\begin{tabular}{lrrrrrr}
-	Multi-Qubit Gate Properties (Entanglement) &
-		CX0\_1 &
-			CX1\_2 &
-				CX0\_2 &
-					CX3\_2 &
-						CX4\_2 &
-							CX3\_4 \\
-	Error Rate &
-		   3.46\% &
-			 4.07\% &
-				 3.26\% &
-					 2.76\% &
-						 2.23\% &
-						 	2.66\% \\
-	Gate Readout Fidelity &
-	  96.54\% &
-	  	95.93\% &
-			96.74\% &
-				97.24\% &
-					97.77\% &
-						97.34\% \\
+}
+
+\rowcolors{2}{}{lightgray}
+\subfloat[Multi-Qubit Gate Properties (Entanglement)]{
+\begin{tabular}{ll*{6}{S[table-format=2.2]}}
+	\toprule
+	& & \multicolumn{6}{c}{Entanglement Connection} \\
+	\cmidrule{3-8}
+	\multicolumn{2}{c}{Gate Property} &
+		\multicolumn{1}{c}{CX0\_1} &
+			\multicolumn{1}{c}{CX1\_2} &
+				\multicolumn{1}{c}{CX0\_2} &
+					\multicolumn{1}{c}{CX3\_2} &
+						\multicolumn{1}{c}{CX4\_2} &
+							\multicolumn{1}{c}{CX3\_4} \\
+	\cmidrule(r){1-2} \cmidrule{3-8}
+	\cellcolor{white}Readout & \cellcolor{white}Error Rate (\%) &
+		 3.46 &
+			 4.07 &
+				 3.26 &
+					 2.76 &
+						 2.23 &
+							 2.66 \\
+	& Fidelity (\%) &
+		 96.54 &
+			95.93 &
+				96.74 &
+					97.24 &
+						97.77 &
+							97.34 \\
 	\bottomrule
 \end{tabular}
+}
 \caption{Error Rates For IBM Five-Qubit Chip}
 \label{tab:future:Error Rates For IBM Five-Qubit Chip}
 \end{table*}
diff --git a/perfbook.tex b/perfbook.tex
index e4bba02..8c2288a 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -28,6 +28,7 @@
 \newsubfloat{listing}
 \captionsetup{labelfont=bf}
 \captionsetup[listing]{font=small,labelsep=colon}
+\captionsetup[subfloat]{font=small}
 % \usepackage{breakurl}
 \usepackage{graphicx}
 \usepackage{rotating}
-- 
2.7.4


