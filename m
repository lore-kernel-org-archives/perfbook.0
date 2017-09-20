Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=4t6CjvFN6SFyMr4Yg2Inz57BX+J+NcawJ0wJQ0MDw88=;
 b=dqUX4aksQcO8OQUJqZlA9j2NERXqz67i+iEoOGqOaIU9AjQfY9SwUr/0PuYJ9tNJ2u
 X7FApA3SjeQAr+ThEvMS1dlqWtubIM5hPjvaBR0U5iIoFiAq4Nz1Mc1VudpyahQLoVbc
 XRHDPAViFELLaBkiR2UVL6wvLbmCIaYYa16IjHJ3Hy2Ez2IaLG/PMg8t9OFSYXp+/9Xr
 ieebLUrDnaQ8Cb3CK0GPcH+4CzIkHnQg3UIOwhD3HlqooY2ej7cP9Y3KUc4CD1zpJ5LU
 hItL5bXD22aaEaCxYg9zFq6SVaqc4MbZyWMR3EMBps4Puh/o1O/p6BubCnWQk+H0jx/V
 LYpw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] styleguide: Substitute experimental table
Message-ID: <ce6f1746-3285-caa7-c1b6-74b7cf77ecde@gmail.com>
Date: Thu, 21 Sep 2017 07:38:14 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3f03b3a2728c1bb72c9ad687c430980d45df7445 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 21 Sep 2017 07:02:12 +0900
Subject: [PATCH] styleguide: Substitute experimental table

The original table was substituted in commit 3162ff468ef4 ("memorder:
Substitute WRC for WWC to illustrate non-MCA").

Also tweak hspace of cheat sheet in 1c layout.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 52 ++++++++++++++++++--------------------
 memorder/memorder.tex              |  2 +-
 2 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 07d2e72..46d93f6 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -1389,7 +1389,7 @@ and~\ref{tab:memorder:Memory Ordering: WRC Sequence of Events}
 recently added in Chapter~\ref{chp:memorder:Memory Ordering}
 can be typeset as
 Tables~\ref{tab:app:styleguide:Linux-Kernel Memory-Ordering Cheat Sheet}
-and~\ref{tab:app:styleguide:Memory Ordering: WWC Sequence of Events}
+and~\ref{tab:app:styleguide:Memory Ordering: WRC Sequence of Events}
 using booktabs' ruled lines.

 \begin{table*}
@@ -1448,7 +1448,7 @@ using booktabs' ruled lines.
 		& RMW: & Atomic read-modify-write operation \\
 		& SV: & Same-variable access \\
 \end{tabular}
-}
+}\OneColumnHSpace{-0.9in}
 \caption{Linux-Kernel Memory-Ordering Cheat Sheet}
 \label{tab:app:styleguide:Linux-Kernel Memory-Ordering Cheat Sheet}
 \end{table*}
@@ -1466,35 +1466,31 @@ using booktabs' ruled lines.
 			Instruction & Store Buffer & Cache \\
 	\cmidrule{1-1} \cmidrule(l){2-2} \cmidrule(l){3-3} \cmidrule(l){4-4}
 		\cmidrule(lr){5-5} \cmidrule(l){6-6} \cmidrule(l){7-7} \cmidrule(l){8-8}
-	1 & (Initial state) & & \tco{y==&b} &
+	1 & (Initial state) & & \tco{y==0} &
 		(Initial state) &
-			(Initial state) & & \tco{x==&a} \\
-	2 & \tco{x = &x;} & \tco{x==&x} & \tco{y==&b} &
-		 & & & \tco{x==&a} \\
-	3 & (Read-Invalidate \tco{x}) & \tco{x==&x} & \tco{y==&b} & \tco{r1 = x} (\tco{&x})
-		 & & & \tco{x==&a} \\
-	4 &  & \tco{x==&x} \tco{y==&x} & \tco{y==&b} & \tco{y = r1}
-		 & \tco{r2 = y} & & \tco{x==&a} \\
-	5 &  & \tco{x==&x} & \tco{y==&x} & (Finish store)
-		 & (Read \tco{y}) & & \tco{x==&a} \\
-	6 & & \tco{x==&x} & \tco{y==&x} &
-		 & (\tco{r2==&x}) & & \tco{x==&a} \tco{y==&x} \\
-	7 & & \tco{x==&x} & \tco{y==&x} &
-		 & \tco{*r2 = &c} & \tco{y==&c} & \tco{x==&a} \tco{y==&x} \\
-	8 & & \tco{x==&x} & \tco{y==&x} &
-		 & (Read Invalidate \tco{y}) & \tco{y==&c} & \tco{x==&a} \tco{y==&x} \\
-	9 & & \tco{x==&x} &  &
-		 &  & \tco{y==&c} & \tco{x==&a} \tco{y==&x} \\
-	10 & & \tco{x==&x} &  &
-		 & (Finish store) & & \tco{x==&a} \tco{y==&c} \\
-	11 & & \tco{x==&x} & \tco{x==&a} &
-		 & (Respond \co{x}) & & \tco{y==&c} \\
-	12 & (Finish store) & & \tco{x==&x} &
-		 &  & & \tco{y==&c} \\
+			(Initial state) & & \tco{x==0} \\
+	2 & \tco{x = 1;} & \tco{x==1} & \tco{y==0} &
+		 & & & \tco{x==0} \\
+	3 & (Read-Invalidate \tco{x}) & \tco{x==1} & \tco{y==0} & \tco{r1 = x} (1)
+		 & & & \tco{x==0} \\
+	4 &  & \tco{x==1} \tco{y==1} & \tco{y==0} & \tco{y = r1}
+		 & \tco{r2 = y} & & \tco{x==0} \\
+	5 &  & \tco{x==1} & \tco{y==1} & (Finish store)
+		 & (Read \tco{y}) & & \tco{x==0} \\
+	6 & (Respond \tco{y}) & \tco{x==1} & \tco{y==1} &
+		 & (\tco{r2==1}) & & \tco{x==0} \tco{y==1} \\
+	7 & & \tco{x==1} & \tco{y==1} &
+		 & \tco{smp_rmb()} & & \tco{x==0} \tco{y==1} \\
+	8 & & \tco{x==1} & \tco{y==1} &
+		 & \tco{r3 = x (0)} & & \tco{x==0} \tco{y==1} \\
+	9 & & \tco{x==1} & \tco{x==0} \tco{y==1} &
+		 & (Respond \tco{x}) & & \tco{y==1} \\
+	10 & (Finish store) & & \tco{x==1} \tco{y==1} &
+		 &  & & \tco{y==1} \\
 	\bottomrule
 \end{tabular}
-\caption{Memory Ordering: WWC Sequence of Events}
-\label{tab:app:styleguide:Memory Ordering: WWC Sequence of Events}
+\caption{Memory Ordering: WRC Sequence of Events}
+\label{tab:app:styleguide:Memory Ordering: WRC Sequence of Events}
 \end{table*}

 \floatstyle{plain}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 316bab7..16de2b6 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -428,7 +428,7 @@ instances straighten things out in the end.

 \begin{table*}
 \small
-\centering\OneColumnHSpace{-0.7in}
+\centering\OneColumnHSpace{-0.8in}
 \begin{tabular}{l||c||c|c|c|c||c|c|c|c|c|c|c}
 	& & \multicolumn{4}{c||}{Prior Ordered Operation} &
 		\multicolumn{7}{c}{Subsequent Ordered Operation} \\
-- 
2.7.4

