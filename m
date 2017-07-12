Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L+LMhb5O54FkmTxwOjwh9PS4JuX+N6IePuhS2e1Db50=;
 b=EvXLey5gj321qCEgavvp5zshjWI/JB+r6zXmP1vPBS1WIYUl/PKO62zNNsGa6t29Tc
 NV/M2J5xF8hcqQm+jj1fqJrhCDDJBjcL0qo9JwBJ5H8x9+3GkimphJkg8PEHcz0bnWYw
 2ma2MKMLqtvhF02K9txGhIgIdkfyv4f+I4JVj65vmC/F/1iQo4iVB49dZS7XSYJjV4L3
 ty0IQdoSk/JNy2+C5AXfESaW4MW2pYJ+r76wBy1NiqBXYXQRLYIgzB/2OnWiH4i7xYyy
 mqN90x2rZ1t52YiLKCnKs7pqb/63AAZM2t8/h+nRLod8YSi3ZBZdoE8rNNMJ/afzgorn
 9GJQ==
Subject: [PATCH 6/6] advsync: Adjust value expressions in Tables 14.1 and 14.2
References: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e54738c4-6125-7576-6072-f1b424e5fea4@gmail.com>
Date: Thu, 13 Jul 2017 00:14:32 +0900
MIME-Version: 1.0
In-Reply-To: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From de45acd5a73354cbe03abaf3130177687c77e4cb Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 12 Jul 2017 23:21:52 +0900
Subject: [PATCH 6/6] advsync: Adjust value expressions in Tables 14.1 and 14.2

As x0 and x1 are pointers, they should be in dereferenced form.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 48 +++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 8693cac..b9dd1fa 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -179,7 +179,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.

 \begin{table*}
 \small
-\centering\OneColumnHSpace{-.1in}
+\centering\OneColumnHSpace{-.2in}
 \begin{tabular}{r||l|l|l||l|l|l}
 	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
 	\cline{2-7}
@@ -187,20 +187,20 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
 		Instruction & Store Buffer & Cache \\
 	\hline
 	\hline
-	1 & (Initial state) & & \tco{x1==0} &
-		(Initial state) & & \tco{x0==0} \\
+	1 & (Initial state) & & \tco{*x1==0} &
+		(Initial state) & & \tco{*x0==0} \\
 	\hline
-	2 & \tco{*x0 = 2} & \tco{x0==2} & \tco{x1==0} &
-		\tco{*x1 = 2;} & \tco{x1==2} & \tco{x0==0} \\
+	2 & \tco{*x0 = 2;} & \tco{*x0==2} & \tco{*x1==0} &
+		\tco{*x1 = 2;} & \tco{*x1==2} & \tco{*x0==0} \\
 	\hline
-	3 & \tco{r2 = *x1;} (0) & \tco{x0==2} & \tco{x1==0} &
-		\tco{r2 = *x0;} (0) & \tco{x1==2} & \tco{x0==0} \\
+	3 & \tco{r2 = *x1;} (0) & \tco{*x0==2} & \tco{*x1==0} &
+		\tco{r2 = *x0;} (0) & \tco{*x1==2} & \tco{*x0==0} \\
 	\hline
-	4 & (Read-invalidate) & \tco{x0==2} & \tco{x0==0} &
-		(Read-invalidate) & \tco{x1==2} & \tco{x1==0} \\
+	4 & (Read-invalidate) & \tco{*x0==2} & \tco{*x0==0} &
+		(Read-invalidate) & \tco{*x1==2} & \tco{*x1==0} \\
 	\hline
-	5 & (Finish store) & & \tco{x0==2} &
-		(Finish store) & & \tco{x1==2} \\
+	5 & (Finish store) & & \tco{*x0==2} &
+		(Finish store) & & \tco{*x1==2} \\
 \end{tabular}
 \caption{Memory Misordering: Store-Buffering Sequence of Events}
 \label{tab:advsync:Memory Misordering: Store-Buffering Sequence of Events}
@@ -343,7 +343,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.

 \begin{table*}
 \small
-\centering\OneColumnHSpace{-0.75in}
+\centering\OneColumnHSpace{-0.2in}
 \begin{tabular}{r||l|l|l||l|l|l}
 	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
 	\cline{2-7}
@@ -351,23 +351,23 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
 		Instruction & Store Buffer & Cache \\
 	\hline
 	\hline
-	1 & (Initial state) & & \tco{x1==0} &
-		(Initial state) & & \tco{x0==0} \\
+	1 & (Initial state) & & \tco{*x1==0} &
+		(Initial state) & & \tco{*x0==0} \\
 	\hline
-	2 & \tco{*x0 = 2} & \tco{x0==2} & \tco{x1==0} &
-		\tco{*x1 = 2;} & \tco{x1==2} & \tco{x0==0} \\
+	2 & \tco{*x0 = 2;} & \tco{*x0==2} & \tco{*x1==0} &
+		\tco{*x1 = 2;} & \tco{*x1==2} & \tco{*x0==0} \\
 	\hline
-	3 & \tco{smp_mb()} & \tco{x0==2} & \tco{x1==0} &
-		\tco{smp_mb()} & \tco{x1==2} & \tco{x0==0} \\
+	3 & \tco{smp_mb();} & \tco{*x0==2} & \tco{*x1==0} &
+		\tco{smp_mb();} & \tco{*x1==2} & \tco{*x0==0} \\
 	\hline
-	4 & (Read-invalidate) & \tco{x0==2} & \tco{x0==0} &
-		(Read-invalidate) & \tco{x1==2} & \tco{x1==0} \\
+	4 & (Read-invalidate) & \tco{*x0==2} & \tco{*x0==0} &
+		(Read-invalidate) & \tco{*x1==2} & \tco{*x1==0} \\
 	\hline
-	5 & (Finish store) & & \tco{x0==2} &
-		(Finish store) & & \tco{x1==2} \\
+	5 & (Finish store) & & \tco{*x0==2} &
+		(Finish store) & & \tco{*x1==2} \\
 	\hline
-	6 & \tco{r2 = *x1;} (2) & & \tco{x1==2} &
-		\tco{r2 = *x0;} (2) & & \tco{x0==2} \\
+	6 & \tco{r2 = *x1;} (2) & & \tco{*x1==2} &
+		\tco{r2 = *x0;} (2) & & \tco{*x0==2} \\
 \end{tabular}
 \caption{Memory Ordering: Store-Buffering Sequence of Events}
 \label{tab:advsync:Memory Ordering: Store-Buffering Sequence of Events}
-- 
2.7.4


