Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OCfhNdKpyeV0mGLSXZGFCwxc/8QQHYgGu1RgZSAYZ80=;
 b=uzceZoxULdzjUmuEtCZDhDJnL7GDAxyQXl9x8NWcaGGSqN0y20ZKrNDwK8mBsdskST
 3VvZQrPg7vEXT0HEmjbsSReMFtsVhRGwr0xORIjMPdMEZfYNB2XqS3JLF4eNOljLI9Zn
 PnlnubK6WiBD6uWlOUTcogydTNBkPdAdYTX3BzGFGh5dKy0Zbu1ilr6DuueegQa4Ta9W
 L6IP6AabkA8U+9A96JdFqTgdc3I7sDpXeKwG2W4s+OykWKF0jCabCqfKPfs7d48HKltk
 f/y5Cp8AyX1QBPocRWX73sHsac4twFsfJfgI+F0eVsWIUYYxAx5sI3DxJtaGjQYDHN5S
 qc0Q==
Subject: [PATCH 2/2] styleguide: Add more experimental tables
References: <f5647f1b-5849-d267-4310-b18d72b9f63d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <80881838-cded-26d9-6611-94276e9f9534@gmail.com>
Date: Sun, 3 Sep 2017 23:58:12 +0900
MIME-Version: 1.0
In-Reply-To: <f5647f1b-5849-d267-4310-b18d72b9f63d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 91874614a21874550a5d9ffa3d0fba5f6d6416f1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 3 Sep 2017 21:24:20 +0900
Subject: [PATCH 2/2] styleguide: Add more experimental tables

These are tweaked version of tables recently added in memorder.
Although they have fairly complex headers, they can still be
expressed without vertical rules.

In WWC sequence, narrow and wide skips in mid-rules roughly
correspond to the single and double vertical rules used in
the original table.

Also remove the tweaked version of Table 13.1 without legends.
Also use frame boxes for legends in Table D.5 as the same as
Table D.12.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 151 ++++++++++++++++++++++++++++---------
 1 file changed, 114 insertions(+), 37 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 831e7c2..ac6bfa5 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -1022,41 +1022,12 @@ is a tweaked version of
 Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms},
 which has more complex header than the tables experimented so far.

-\begin{table}[tb]
-\small
-\centering
-\renewcommand*{\arraystretch}{1.25}
-\rowcolors{3}{}{lightgray}
-\begin{tabular}{lccc}
-	\toprule
-	& \multicolumn{3}{c}{Release Synchronization} \\
-	\cmidrule(l){2-4}
-	\parbox[c]{.8in}{Acquisition\\Synchronization}
-			& Locking
-				& \parbox[c]{.5in}{Reference\\Counting}
-				        & RCU \\
-	\cmidrule{1-1} \cmidrule(l){2-4}
-	Locking		& $-$	& CAM	& CA  \\
-	\parbox[c][6ex]{.8in}{Reference\\Counting}
-			& A	& AM	& A   \\
-	RCU		& CA	& MCA	& CA  \\
-	\bottomrule
-\end{tabular}
-\caption{Reference Counting and Synchronization Mechanisms}
-\label{tab:app:styleguide:Reference Counting and Synchronization Mechanisms}
-\end{table}
-
 In
 Table~\ref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms},
 the gap in the mid-rule corresponds to the distinction
 which is represented by double vertical rules in
 Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms}.
-
-However, it makes no sense when it is separated from the explanation near~%
-Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms}
-due to the lack of explanation of abbreviations used in the matrix.
-An example with proper legends is shown in
-Table~\ref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms (Legends)}.
+The legends in the frame box explain the abbreviations used in the matrix.
 Two types of memory barrier are denoted by subscripts here.

 \begin{table}[tb]
@@ -1081,17 +1052,17 @@ Two types of memory barrier are denoted by subscripts here.
 \end{tabular}

 \vspace{5pt}\hfill
-{\footnotesize
+\framebox[\width]{\footnotesize\setlength{\tabcolsep}{3pt}
 \rowcolors{1}{}{}
-  \begin{tabular}{lp{1.8in}}
-        A	& Atomic counting \\
-        C	& Check combined with the atomic acquisition operation \\
-        M\textsubscript{R}	& Memory barriers required only on release \\
-        M\textsubscript{A}	& Memory barriers required on acquire \\
+  \begin{tabular}{lrp{2in}}
+	Key:	& A: & Atomic counting \\
+		& C: & Check combined with the atomic acquisition operation \\
+		& M\textsubscript{R}: & Memory barriers required only on release \\
+		& M\textsubscript{A}: & Memory barriers required on acquire \\
   \end{tabular}
 }
 \caption{Reference Counting and Synchronization Mechanisms}
-\label{tab:app:styleguide:Reference Counting and Synchronization Mechanisms (Legends)}
+\label{tab:app:styleguide:Reference Counting and Synchronization Mechanisms}
 \end{table}

 Table~\ref{tab:app:whymb:Cache Coherence Example}
@@ -1413,6 +1384,112 @@ IBM~Q	& $0.015$
 \label{tab:app:styleguide:Refrigeration Power Consumption (arydshln-2)}
 \end{table}

+Tables~\ref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}
+and~\ref{tab:memorder:Memory Ordering: WWC Sequence of Events}
+recently added in Chapter~\ref{chp:memorder:Memory Ordering}
+can be typeset as
+Tables~\ref{tab:app:styleguide:Linux-Kernel Memory-Ordering Cheat Sheet}
+and~\ref{tab:app:styleguide:Memory Ordering: WWC Sequence of Events}
+using booktabs' ruled lines.
+
+\begin{table*}
+\small
+\centering\OneColumnHSpace{-0.7in}
+\renewcommand*{\arraystretch}{1.1}
+\rowcolors{7}{lightgray}{}
+\begin{tabular}{lccccccccccc}\toprule
+	& & \multicolumn{4}{c}{Prior Ordered Operation} &
+		\multicolumn{6}{c}{Subsequent Ordered Operation} \\
+	\cmidrule(l){3-6} \cmidrule(l){7-12}
+	Operation Providing Ordering & C &
+		Self & R & W & RMW & Self & R & W & DR & DW & RMW \\
+	\cmidrule(r){1-1} \cmidrule{2-2} \cmidrule(l){3-6} \cmidrule(l){7-12}
+	\tco{READ_ONCE()} &  &
+		   Y &   &   &     &      &   &   &    &  Y &     \\
+	\tco{smp_read_barrier_depends()} &  &
+		     & Y &   &     &      &   &   &  Y &  Y &     \\
+	Successful \tco{*_acquire()} &   &
+		   R &   &   &     &      & Y & Y &  Y &  Y &   Y \\
+	Successful \tco{*_release()} & C &
+		     & Y & Y &   Y &    W &   &   &    &    &     \\
+	\tco{smp_rmb()} &   &
+		     & Y &   &   R &      & Y &   &  Y &    &   R \\
+	\tco{smp_wmb()} &   &
+		     &   & Y &   W &      &   & Y &    &  Y &   W \\
+	\tco{smp_mb()} & CP &
+		     & Y & Y &   Y &      & Y & Y &  Y &  Y &   Y \\
+	Successful Non-Relaxed Non-\tco{void} RMW & CP &
+		   Y & Y & Y &   Y &    Y & Y & Y &  Y &  Y &   Y \\
+	\tco{smp_mb__before_atomic()} & CP &
+		     & Y & Y &   Y &      & a & a & a  & a  &   Y \\
+	\tco{smp_mb__after_atomic()} & CP &
+		     & a & a &   Y &      & Y & Y &  Y &  Y &     \\
+	\bottomrule
+\end{tabular}
+
+\vspace{5pt}\hfill
+\framebox[\width]{\footnotesize\setlength{\tabcolsep}{3pt}
+\rowcolors{1}{}{}
+\begin{tabular}{lrl}
+	Key:	& C: & Ordering is cumulative \\
+		& P: & Ordering propagates \\
+		& R: & Read, or read portion of RMW \\
+		& W: & Write, or write portion of RMW \\
+		& Y: & Provides the specified ordering \\
+		& a: & Provides specified ordering given intervening RMW atomic operation \\
+		& DR: & Dependent read (address dependency) \\
+		& DW: & Dependent write (address, data, or control dependency) \\
+		& RMW: & Atomic read-modify-write operation \\
+\end{tabular}
+}
+\caption{Linux-Kernel Memory-Ordering Cheat Sheet}
+\label{tab:app:styleguide:Linux-Kernel Memory-Ordering Cheat Sheet}
+\end{table*}
+
+\begin{table*}
+\small
+\centering\OneColumnHSpace{-0.8in}
+\renewcommand*{\arraystretch}{1.1}
+\rowcolors{13}{lightgray}{}
+\begin{tabular}{rlllllll}\toprule
+	& \multicolumn{1}{c}{\tco{P0()}} & \multicolumn{2}{c}{\tco{P0()} \& \tco{P1()}} &
+		\multicolumn{1}{c}{\tco{P1()}} & \multicolumn{3}{c}{\tco{P2()}} \\
+	\cmidrule(l){2-2} \cmidrule(l){3-4} \cmidrule(lr){5-5} \cmidrule(l){6-8}
+	& Instruction & Store Buffer & Cache & Instruction &
+			Instruction & Store Buffer & Cache \\
+	\cmidrule{1-1} \cmidrule(l){2-2} \cmidrule(l){3-3} \cmidrule(l){4-4}
+		\cmidrule(lr){5-5} \cmidrule(l){6-6} \cmidrule(l){7-7} \cmidrule(l){8-8}
+	1 & (Initial state) & & \tco{y==&b} &
+		(Initial state) &
+			(Initial state) & & \tco{x==&a} \\
+	2 & \tco{x = &x;} & \tco{x==&x} & \tco{y==&b} &
+		 & & & \tco{x==&a} \\
+	3 & (Read-Invalidate \tco{x}) & \tco{x==&x} & \tco{y==&b} & \tco{r1 = x} (\tco{&x})
+		 & & & \tco{x==&a} \\
+	4 &  & \tco{x==&x} \tco{y==&x} & \tco{y==&b} & \tco{y = r1}
+		 & \tco{r2 = y} & & \tco{x==&a} \\
+	5 &  & \tco{x==&x} & \tco{y==&x} & (Finish store)
+		 & (Read \tco{y}) & & \tco{x==&a} \\
+	6 & & \tco{x==&x} & \tco{y==&x} &
+		 & (\tco{r2==&x}) & & \tco{x==&a} \tco{y==&x} \\
+	7 & & \tco{x==&x} & \tco{y==&x} &
+		 & \tco{*r2 = &c} & \tco{y==&c} & \tco{x==&a} \tco{y==&x} \\
+	8 & & \tco{x==&x} & \tco{y==&x} &
+		 & (Read Invalidate \tco{y}) & \tco{y==&c} & \tco{x==&a} \tco{y==&x} \\
+	9 & & \tco{x==&x} &  &
+		 &  & \tco{y==&c} & \tco{x==&a} \tco{y==&x} \\
+	10 & & \tco{x==&x} &  &
+		 & (Finish store) & & \tco{x==&a} \tco{y==&c} \\
+	11 & & \tco{x==&x} & \tco{x==&a} &
+		 & (Respond \co{x}) & & \tco{y==&c} \\
+	12 & (Finish store) & & \tco{x==&x} &
+		 &  & & \tco{y==&c} \\
+	\bottomrule
+\end{tabular}
+\caption{Memory Ordering: WWC Sequence of Events}
+\label{tab:app:styleguide:Memory Ordering: WWC Sequence of Events}
+\end{table*}
+
 \floatstyle{plain}
 \restylefloat{table}
 \captionsetup[table]{position=bottom,hangindent=0pt}
-- 
2.7.4


