Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zqqI89O9ePQBCq6U7m3tS+QRak6dAxlzBRfhovGCFTE=;
 b=oJRA8vK2iID2D29aZma1Hk1sDFiJqGtioR4mjJA1RIKbNBqft+xc06xE3d5UdfqQKC
 TVlk03rqZ/Xp5YlJioou0iPO56gFY5uxjA1qFfxlSDckhtTdm2Nl2kvhEKtteRcc8kTi
 cofXUWkZTXfUcyOIzCUbDp6OUTVkDwyGckCRUL5JB4VsfTjm+ROqETfxjVd4GRqugIf+
 7S0ZrDAvnHPRQWVkYl8Pto8cvygy8oLc5T97Aoij6zeAKXD1AK9Tuifs6YYTSHx3I5K5
 /knmKqnY61hGeTFp6z0Cu1rG7teJzJi5oHjZmHQFtTHg9PlemRxgexexIc5nMfd5PJbo
 2obg==
Subject: [PATCH 2/5] future/QC: Remove alternate-row coloring in Table 17.5
References: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <00843299-de69-5656-5bc1-fd3a1a76ef97@gmail.com>
Date: Sun, 25 Feb 2018 08:51:05 +0900
MIME-Version: 1.0
In-Reply-To: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2bbc03f5aef7c67348afed2c9e46627fc9740f5d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Feb 2018 18:03:21 +0900
Subject: [PATCH 2/5] future/QC: Remove alternate-row coloring in Table 17.5

Alternate-row coloring is redundant with the midrules in the tables.
So remove \rowcolors and \cellcolor macros.
Trimming left and right edges of the tables (by "@{}" column-format
specifier) further improves their looks when background colors are
not used.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index 6491985..d88aaac 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -632,12 +632,11 @@ $10^{-4}$).
 \end{figure}

 \begin{table*}[tbh]
-\rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \small
 \centering
 \subfloat[Single-Qubit Gate Properties]{
-\begin{tabular}{ll*{5}{S[table-format=2.3]}}
+\begin{tabular}{@{}ll*{5}{S[table-format=2.3]}@{}}
 	\toprule
 	& & \multicolumn{5}{c}{Qubit} \\
 	\cmidrule{3-7}
@@ -646,9 +645,9 @@ $10^{-4}$).
 		\multicolumn{1}{c}{Q\textsubscript{1}} &
 			\multicolumn{1}{c}{Q\textsubscript{2}} &
 				\multicolumn{1}{c}{Q\textsubscript{3}} &
-					\multicolumn{1}{c}{Q\textsubscript{4}} \\
+					\multicolumn{1}{c@{}}{Q\textsubscript{4}} \\
 	\cmidrule(r){1-2} \cmidrule{3-7}
-	\cellcolor{white}Per-Operation & \cellcolor{white}Error Rate (\%) &
+	Per-Operation & Error Rate (\%) &
 	 0.197 &
 		 0.129 &
 			 0.197 &
@@ -661,7 +660,7 @@ $10^{-4}$).
 				99.837 &
 					99.906 \\
 	\cmidrule(r){1-2} \cmidrule{3-7}
-	\cellcolor{white}Readout & \cellcolor{white}Error Rate (\%) &
+	Readout & Error Rate (\%) &
 	 4.50 &
 		 3.60 &
 			 2.00 &
@@ -677,9 +676,8 @@ $10^{-4}$).
 \end{tabular}
 }

-\rowcolors{2}{}{lightgray}
 \subfloat[Multi-Qubit Gate Properties (Entanglement)]{
-\begin{tabular}{ll*{6}{S[table-format=2.2]}}
+\begin{tabular}{@{}ll*{6}{S[table-format=2.2]}@{}}
 	\toprule
 	& & \multicolumn{6}{c}{Entanglement Connection} \\
 	\cmidrule{3-8}
@@ -689,9 +687,9 @@ $10^{-4}$).
 				\multicolumn{1}{c}{CX0\_2} &
 					\multicolumn{1}{c}{CX3\_2} &
 						\multicolumn{1}{c}{CX4\_2} &
-							\multicolumn{1}{c}{CX3\_4} \\
+							\multicolumn{1}{c@{}}{CX3\_4} \\
 	\cmidrule(r){1-2} \cmidrule{3-8}
-	\cellcolor{white}Readout & \cellcolor{white}Error Rate (\%) &
+	Readout & Error Rate (\%) &
 		 3.46 &
 			 4.07 &
 				 3.26 &
-- 
2.7.4


