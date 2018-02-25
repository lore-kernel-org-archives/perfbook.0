Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=25mJnr5FdZOyKkSYS7w58rUV1DgxW3onf0EQ2WyPwPg=;
 b=vGaAQxowAA803vUo8zpWHMv+6KDB4i/ocK+2Euzr6FM/mFMKZZdlic+Dku3AXYR8FV
 qHOz4YQVFMNVKAg+xLT8zeaBIEaOvfxQGNRz8qtfnvAg34snL2KCS35ZPaFtIejGkT/g
 8lSw0sjc+3aURguzNx0qMpMsvMOj/D1GLiOevha9JhRX8Z+K5AZwrjzcyzmuz+nva1QS
 0pVY7eujLxD6ge5XJtOF6Q8mTcpgcZL18Z+UBk5quw62M3gqM9cvh0Utz4zh9mDzPbQI
 P0F749A0+vbnlVFt+BYzsV+Le1/tUCalv9gag+FXe3UDdm0aOkjS0zUshqNk3o9JvQMX
 pC9Q==
Subject: [PATCH] future/QC: Remove 'Readout' in header of 'entanglement error
 rate' row
References: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
 <20180225182303.GE2855@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b8083f74-2290-0280-de67-cdcd69083502@gmail.com>
Date: Mon, 26 Feb 2018 07:30:08 +0900
MIME-Version: 1.0
In-Reply-To: <20180225182303.GE2855@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4d1964b2296525414181b8e9b8fc7a77297fa838 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 26 Feb 2018 07:10:27 +0900
Subject: [PATCH] future/QC: Remove 'Readout' in header of 'entanglement error rate' row

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

Looking at the retouched table once again, I find
"readout of entanglement gate" doesn't make sense. The "Readout"
in the header should be removed, shouldn't it?

        Thanks, Akra
--
 future/QC.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index 1afae2c..a5b1758 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -677,26 +677,26 @@ $10^{-4}$).
 }

 \subfloat[Multi-Qubit Gate Properties (Entanglement)]{
-\begin{tabular}{@{}ll*{6}{S[table-format=2.2]}@{}}
+\begin{tabular}{@{}l*{6}{S[table-format=2.2]}@{}}
 	\toprule
-	& & \multicolumn{6}{c}{Entanglement Connection} \\
-	\cmidrule{3-8}
-	\multicolumn{2}{c}{Gate Property} &
+	 & \multicolumn{6}{c}{Entanglement Connection} \\
+	\cmidrule{2-7}
+	Gate Property &
 		\multicolumn{1}{c}{CX0\_1} &
 			\multicolumn{1}{c}{CX1\_2} &
 				\multicolumn{1}{c}{CX0\_2} &
 					\multicolumn{1}{c}{CX3\_2} &
 						\multicolumn{1}{c}{CX4\_2} &
 							\multicolumn{1}{c@{}}{CX3\_4} \\
-	\cmidrule(r){1-2} \cmidrule{3-8}
-	Readout & Error Rate (\%) &
+	\cmidrule(r){1-1} \cmidrule{2-7}
+	Error Rate (\%) &
 		 3.46 &
 			 4.07 &
 				 3.26 &
 					 2.76 &
 						 2.23 &
 							 2.66 \\
-	& Fidelity (\%) &
+	Fidelity (\%) &
 		 96.54 &
 			95.93 &
 				96.74 &
-- 
2.7.4


