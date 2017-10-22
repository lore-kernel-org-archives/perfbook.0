Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E3sKqg9gnTgAWtYwMPY1uOaUyTJYz54tRzLUX9QsrWg=;
 b=UHzdQIC7dBm6R4wkAI2ZpWVaifV1UAw/du9coaNOMnntJScBWh5xtJcY/4Dzv07xpd
 u+GiCqkKc09bhoicpvdh8bTZYxFfuquHVXYPN17juvNG/LTwvXTNAOFsr/T0oWNNgSUL
 jtTq29+GtyfjFkHwT6T4S1mVqcXWFcQJuoHPKQIXD2IztunuS/LMxyCy+3DxIuIK+2xj
 zfrWLoqyUGkxXil5hRIBPXaR15SMmRn70uhVydgJeAVxYz7Ho5DXfGCPXXCUssWEI2Ks
 WnVz+28IR0gTJbVED9vdzqdIfWkp6pXKye14E8NBnRaqJ8OaVjSC2ExyegZPukXrlHGU
 cGVw==
Subject: [PATCH 4/5] Update tables using booktabs and alternate-row coloring
 scheme
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d9ddac9d-95b4-261d-b346-f214addae979@gmail.com>
Date: Mon, 23 Oct 2017 00:26:23 +0900
MIME-Version: 1.0
In-Reply-To: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d60ffad87aa1fdbd34e224437e4275c672cb3be1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 22 Oct 2017 22:59:35 +0900
Subject: [PATCH 4/5] Update tables using booktabs and alternate-row coloring scheme

Note: Some of complex or large tables have not touched yet.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex            | 10 +++--
 appendix/questions/after.tex       | 25 +++++++++----
 appendix/styleguide/styleguide.tex | 14 ++++---
 count/count.tex                    | 50 +++++++++++++++----------
 cpu/overheads.tex                  | 76 +++++++++++++++++---------------------
 defer/rcuapi.tex                   | 16 ++++----
 defer/rcufundamental.tex           | 16 ++++----
 defer/rcuusage.tex                 | 10 +++--
 defer/whichtochoose.tex            | 27 +++++---------
 formal/spinhint.tex                | 68 +++++++++++++++++-----------------
 future/QC.tex                      | 75 +++++++++++++++++++------------------
 perfbook.tex                       |  1 +
 together/refcnt.tex                | 25 +++++++------
 13 files changed, 215 insertions(+), 198 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 2e5b69f..56eac22 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -1346,17 +1346,19 @@ as shown in
 Table~\ref{fig:app:questions:Schematic of Real-World Parallel Allocator}.

 \begin{table}[tbp]
-\footnotesize
+\rowcolors{1}{}{lightgray}
+\small
 \centering
 \renewcommand*{\arraystretch}{1.25}
-\setlength\tabcolsep{4pt}
-\begin{tabularx}{\twocolumnwidth}{l|l|>{\raggedright\arraybackslash}X}
+\begin{tabularx}{\twocolumnwidth}{ll>{\raggedright\arraybackslash}X}
+\toprule
 Level	& Locking & Purpose \\
-\hline
+\midrule
 Per-thread pool	  & Data ownership & High-speed allocation \\
 Global block pool & Data locking   & Distributing blocks among threads \\
 Coalescing	  & Data locking   & Combining blocks into pages \\
 System memory	  & Code locking   & Memory from/to system \\
+\bottomrule
 \end{tabularx}
 \caption{Schematic of Real-World Parallel Allocator}
 \label{fig:app:questions:Schematic of Real-World Parallel Allocator}
diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index cea0791..4749a0a 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -138,11 +138,15 @@ columns labelled ``a'', ``b'', and ``c'' show the amount that these
 variables increased since the prior snapshot collected by the consumer.

 \begin{table}[htbp]
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.2}
+\sisetup{group-digits=false}
 \centering
 \scriptsize
-\begin{tabular}{rcrrrr}
-seq    & time (seconds) & delta~    &  a &  b &  c \\
-\hline
+\begin{tabular}{rS[table-format=7.6]rS[table-format=3.0]S[table-format=3.0]S[table-format=3.0]}
+\toprule
+seq    & \multicolumn{1}{c}{time (seconds)} & delta~  &  a &  b &  c \\
+\midrule
 17563: & 1152396.251585 & ($-16.928$) & 27 & 27 & 27 \\
 18004: & 1152396.252581 & ($-12.875$) & 24 & 24 & 24 \\
 18163: & 1152396.252955 & ($-19.073$) & 18 & 18 & 18 \\
@@ -150,6 +154,7 @@ seq    & time (seconds) & delta~    &  a &  b &  c \\
 19863: & 1152396.256960 & ($-6.914$) & 18 & 18 & 18 \\
 21644: & 1152396.260959 & ($-5.960$) & 18 & 18 & 18 \\
 23408: & 1152396.264957 & ($-20.027$) & 15 & 15 & 15 \\
+\bottomrule
 \end{tabular}
 \caption{``After'' Program Sample Output}
 \label{tab:app:questions:After Program Sample Output}
@@ -219,13 +224,17 @@ there are only cases with more than 1,000 counts difference between
 consecutive reads by the consumer.

 \begin{table}[htbp]
+\renewcommand*{\arraystretch}{1.2}
+\sisetup{group-digits=false}
 \centering
 \scriptsize
-\begin{tabular}{rcrrrr}
-seq    & time (seconds) & delta~    &  a &  b &  c \\
-\hline
-58597:  & 1156521.556296 & (3.815) & 1485 & 1485 & 1485 \\
-403927: & 1156523.446636 & (2.146) & 2583 & 2583 & 2583 \\
+\begin{tabular}{rS[table-format=7.6]rS[table-format=4.0]S[table-format=4.0]S[table-format=4.0]}
+\toprule
+seq    & \multicolumn{1}{c}{time (seconds)} & delta~  &  a &  b &  c \\
+\midrule
+58597:  & 1156521.556296 & ($3.815$) & 1485 & 1485 & 1485 \\
+403927: & 1156523.446636 & ($2.146$) & 2583 & 2583 & 2583 \\
+\bottomrule
 \end{tabular}
 \caption{Locked ``After'' Program Sample Output}
 \label{fig:app:questions:Locked After Program Sample Output}
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 14fd620..024270c 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -268,14 +268,18 @@ Table~\ref{tab:app:styleguide:Digit-Grouping Style}.
 \begin{tabular}{lrrr}\toprule
   Style & \multicolumn{3}{c}{Outputs of \co{\\num\{\}}} \\
   \midrule
-  NIST/SI (English) & \num{\NumDigitGrpA} & \num{\NumDigitGrpB} & \num{\NumDigitGrp} \\
-  SI (French) & \num[locale=FR]{\NumDigitGrpA} &
-    \num[locale=FR]{\NumDigitGrpB} & \num[locale=FR]{\NumDigitGrp} \\
+  NIST/SI (English) & \num[group-separator={\,},group-digits=integer]{\NumDigitGrpA} &
+    \num[group-separator={\,},group-digits=integer]{\NumDigitGrpB} &
+      \num[group-separator={\,},group-digits=integer]{\NumDigitGrp} \\
+  SI (French) & \num[locale=FR,group-separator={\,}]{\NumDigitGrpA} &
+    \num[locale=FR,group-separator={\,}]{\NumDigitGrpB} &
+      \num[locale=FR,group-separator={\,}]{\NumDigitGrp} \\
   English & \num[group-separator={,},group-digits=integer]{\NumDigitGrpA} &
     \num[group-separator={,},group-digits=integer]{\NumDigitGrpB} &
       \num[group-separator={,},group-digits=integer]{\NumDigitGrp} \\
-  French & \num[locale=FR]{\NumDigitGrpA} &
-    \num[locale=FR]{\NumDigitGrpB} & \num[locale=FR]{\NumDigitGrp} \\
+  French & \num[locale=FR,group-separator={\,}]{\NumDigitGrpA} &
+    \num[locale=FR,group-separator={\,}]{\NumDigitGrpB} &
+      \num[locale=FR,group-separator={\,}]{\NumDigitGrp} \\
   Other Europe & \num[group-separator={.},output-decimal-marker={,},group-digits=integer]{\NumDigitGrpA} &
     \num[group-separator={.},output-decimal-marker={,},group-digits=integer]{\NumDigitGrpB} &
       \num[group-separator={.},output-decimal-marker={,},group-digits=integer]{\NumDigitGrp} \\
diff --git a/count/count.tex b/count/count.tex
index c35c7c2..9a4835d 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -3313,22 +3313,27 @@ will expand on these lessons.
 \label{sec:count:Parallel Counting Performance}

 \begin{table*}
+\rowcolors{4}{}{lightgray}
+\renewcommand*{\arraystretch}{1.1}
 \small
 \centering
-\begin{tabular}{l|r|r|r|r}
-	& & & \multicolumn{2}{c}{Reads} \\
-	\cline{4-5}
-	Algorithm & Section & Updates & 1 Core & 32 Cores \\
-	\hline
-	\hline
+\begin{tabular}{lrS[table-format = 2.1]S[table-format = 3.0]S[table-format = 5.0]}
+	\toprule
+	& & & \multicolumn{2}{c}{Reads (ns)} \\
+	\cmidrule{4-5}
+	Algorithm & Section & \multicolumn{1}{r}{Updates (ns)} &
+				    \multicolumn{1}{r}{1 Core} &
+					\multicolumn{1}{r}{32 Cores} \\
+        \midrule
 	\path{count_stat.c} & \ref{sec:count:Array-Based Implementation} &
-		11.5 ns & 408 ns & 409 ns \\
+		11.5 & 408 &    409 \\
 	\path{count_stat_eventual.c} & \ref{sec:count:Eventually Consistent Implementation} &
-		11.6 ns & 1 ns & 1 ns \\
+		11.6 &   1 &      1 \\
 	\path{count_end.c} & \ref{sec:count:Per-Thread-Variable-Based Implementation} &
-		6.3 ns & 389 ns & 51,200 ns \\
+		 6.3 & 389 & 51 200 \\
 	\path{count_end_rcu.c} & \ref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters} &
-		5.7 ns & 354 ns & 501 ns \\
+		 5.7 & 354 &    501 \\
+	\bottomrule
 \end{tabular}
 \caption{Statistical Counter Performance on \Power{6}}
 \label{tab:count:Statistical Counter Performance on Power-6}
@@ -3393,22 +3398,27 @@ courtesy of eventual consistency.
 } \QuickQuizEnd

 \begin{table*}
+\rowcolors{4}{}{lightgray}
+\renewcommand*{\arraystretch}{1.1}
 \small
 \centering
-\begin{tabular}{l|r|c|r|r|r}
-	& & & & \multicolumn{2}{c}{Reads} \\
-	\cline{5-6}
-	Algorithm & Section & Exact? & Updates & 1 Core & 64 Cores \\
-	\hline
-	\hline
+\begin{tabular}{lrcS[table-format = 2.1]S[table-format = 3.0]S[table-format = 5.0]}
+	\toprule
+	& & & & \multicolumn{2}{c}{Reads (ns)} \\
+	\cmidrule{5-6}
+	Algorithm & Section & Exact? & \multicolumn{1}{r}{Updates (ns)} &
+					\multicolumn{1}{r}{1 Core} &
+					 \multicolumn{1}{r}{64 Cores} \\
+	\midrule
 	\path{count_lim.c} & \ref{sec:count:Simple Limit Counter Implementation} &
-		N & 3.6 ns & 375 ns & 50,700 ns \\
+		N &  3.6 & 375 & 50 700 \\
 	\path{count_lim_app.c} & \ref{sec:count:Approximate Limit Counter Implementation} &
-		N & 11.7 ns & 369 ns & 51,000 ns \\
+		N & 11.7 & 369 & 51 000 \\
 	\path{count_lim_atomic.c} & \ref{sec:count:Atomic Limit Counter Implementation} &
-		Y & 51.4 ns & 427 ns & 49,400 ns \\
+		Y & 51.4 & 427 & 49 400 \\
 	\path{count_lim_sig.c} & \ref{sec:count:Signal-Theft Limit Counter Implementation} &
-		Y & 10.2 ns & 370 ns & 54,000 ns \\
+		Y & 10.2 & 370 & 54 000 \\
+	\bottomrule
 \end{tabular}
 \caption{Limit Counter Performance on \Power{6}}
 \label{tab:count:Limit Counter Performance on Power-6}
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 74fed94..bd4c814 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -124,30 +124,27 @@ optimization.
 \label{sec:cpu:Costs of Operations}

 \begin{table}
-\small
-\centering
-\begin{tabular}{l||r|r}
-				& 	 	& Ratio \\
-	Operation		& Cost (ns) 	& (cost/clock) \\
-	\hline
-	\hline
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.1}
+\centering\small
+\begin{tabular}
+  {
+    l
+    S[table-format = 9.1]
+    S[table-format = 9.1]
+  }
+	\toprule
+	Operation		& \multicolumn{1}{r}{Cost (ns)}
+			& {\parbox[b]{.7in}{\raggedleft Ratio\\(cost/clock)}} \\
+	\midrule
 	Clock period		&           0.6	&           1.0 \\
-	\hline
 	Best-case CAS		&          37.9	&          63.2 \\
-	\hline
 	Best-case lock		&          65.6	&         109.3 \\
-	\hline
 	Single cache miss	&         139.5	&         232.5 \\
-	\hline
 	CAS cache miss		&         306.0	&         510.0 \\
-	\hline
-	Comms Fabric		&       5,000\textcolor{white}{.0}
-						&       8,330\textcolor{white}{.0}
-								\\
-	\hline
-	Global Comms		& 195,000,000\textcolor{white}{.0}
-						& 325,000,000\textcolor{white}{.0} \\
-								\\
+	Comms Fabric		&       5 000	&       8 330	\\
+	Global Comms		& 195 000 000	& 325 000 000   \\
+	\bottomrule
 \end{tabular}
 \caption{Performance of Synchronization Mechanisms on 4-CPU 1.8\,GHz AMD Opteron 844 System}
 \label{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
@@ -211,40 +208,35 @@ global agreement.
 	\end{enumerate}

 \begin{table}
-\small
-\centering
-\begin{tabular}{l||r|r}
-				& 	 	& Ratio \\
-	Operation		& Cost (ns) 	& (cost/clock) \\
-	\hline
-	\hline
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.1}
+\centering\small
+\begin{tabular}
+  {
+    l
+    S[table-format = 9.1]
+    S[table-format = 9.1]
+  }
+	\toprule
+	Operation		& \multicolumn{1}{r}{Cost (ns)}
+			& {\parbox[b]{.7in}{\raggedleft Ratio\\(cost/clock)}} \\
+	\midrule
 	Clock period		&           0.4	&           1.0 \\
-	\hline
 	``Best-case'' CAS	&          12.2	&          33.8 \\
-	\hline
 	Best-case lock		&          25.6	&          71.2 \\
-	\hline
 	Single cache miss	&          12.9	&          35.8 \\
-	\hline
 	CAS cache miss		&           7.0	&          19.4 \\
-	\hline
+	\midrule
 	Off-Core		&		&		\\
-	\hline
 	Single cache miss	&          31.2	&          86.6 \\
-	\hline
 	CAS cache miss		&          31.2	&          86.5 \\
-	\hline
+	\midrule
 	Off-Socket		&		&		\\
-	\hline
 	Single cache miss	&          92.4	&         256.7 \\
-	\hline
 	CAS cache miss		&          95.9	&         266.4 \\
-	\hline
-	Comms Fabric		&       2,600\textcolor{white}{.0}
-						&	7,220\textcolor{white}{.0} \\
-	\hline
-	Global Comms		& 195,000,000\textcolor{white}{.0}
-						& 542,000,000\textcolor{white}{.0} \\
+	Comms Fabric		&       2 600   &       7 220   \\
+	Global Comms		& 195 000 000	& 542 000 000   \\
+	\bottomrule
 \end{tabular}
 \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8\,GHz Intel X5550 (Nehalem) System}
 \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 6b4337a..874b8b1 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -460,20 +460,21 @@ the memory-ordering models of each of the 20+ CPU families
 that Linux supports~\cite{Spraul01}.

 \begin{table*}[tb]
+\renewcommand*{\arraystretch}{1.15}
 \footnotesize
 \centering
-\begin{tabular}{l|l|l|p{1.2in}}
+\begin{tabular}{lllp{1.2in}}
+\toprule
 Category &
 	Primitives &
 		Availability &
 			Overhead \\
-\hline
-\hline
+\midrule
 List traversal &
 	\tco{list_for_each_entry_rcu()} &
 		2.5.59 &
 			Simple instructions (memory barrier on Alpha) \\
-\hline
+\midrule
 List update &
 	\tco{list_add_rcu()} &
 		2.5.44 &
@@ -494,7 +495,7 @@ List update &
 	\tco{list_splice_init_rcu()} &
 		2.6.21 &
 			Grace-period latency \\
-\hline
+\midrule
 Hlist traversal &
 	\tco{hlist_for_each_entry_rcu()} &
 		2.6.8 &
@@ -519,16 +520,17 @@ Hlist traversal &
 	\tco{hlist_replace_rcu()} &
 		2.6.15 &
 			Memory barrier \\
-\hline
+\midrule
 Pointer traversal &
 	\tco{rcu_dereference()} &
 		2.6.9 &
 			Simple instructions (memory barrier on Alpha) \\
-\hline
+\midrule
 Pointer update &
 	\tco{rcu_assign_pointer()} &
 		2.6.10 &
 			Memory barrier \\
+\bottomrule
 \end{tabular}
 \caption{RCU Publish-Subscribe and Version Maintenance APIs}
 \label{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index a500f51..27c6421 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -380,30 +380,32 @@ circular list:
 \vspace{5pt}

 \begin{table*}[tb]
+\renewcommand*{\arraystretch}{1.2}
 \centering
-\scriptsize
-\begin{tabular}{l||l|l|l}
+\footnotesize
+\begin{tabular}{llll}
+\toprule
 Category  & Publish	& Retract	& Subscribe \\
-\hline
-\hline
+\midrule
 Pointers  & \tco{rcu_assign_pointer()}
 			& \tco{rcu_assign_pointer(..., NULL)}
 					& \tco{rcu_dereference()} \\
-\hline
+\midrule
 Lists     & \parbox[c][0.37in][c]{1.3in}{
 		\co{list_add_rcu()} \\
 		\co{list_add_tail_rcu()} \\
 		\co{list_replace_rcu()} }
 			& \tco{list_del_rcu()}
 					& \tco{list_for_each_entry_rcu()} \\
-\hline
+\midrule
 Hlists    & \parbox[c][0.5in][c]{1.3in}{
 		\co{hlist_add_after_rcu()} \\
 		\co{hlist_add_before_rcu()}  \\
 		\co{hlist_add_head_rcu()} \\
 		\co{hlist_replace_rcu()} }
 			& \tco{hlist_del_rcu()}
-					& \tco{hlist_for_each_entry_rcu()}
+					& \tco{hlist_for_each_entry_rcu()} \\
+\bottomrule
 \end{tabular}
 \caption{RCU Publish and Subscribe Primitives}
 \label{tab:defer:RCU Publish and Subscribe Primitives}
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 9ad1a1e..499c6bd 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -5,12 +5,13 @@
 \OriginallyPublished{Section}{sec:defer:RCU Usage}{RCU Usage}{Linux Weekly News}{PaulEMcKenney2008WhatIsRCUUsage}

 \begin{table}[tb]
+\renewcommand*{\arraystretch}{1.2}
 \centering
-\scriptsize
-\begin{tabular}{l|l}
+\small
+\begin{tabular}{ll}
+\toprule
 Mechanism RCU Replaces & Section \\
-\hline
-\hline
+\midrule
 Reader-writer locking &
 	Section~\ref{sec:defer:RCU is a Reader-Writer Lock Replacement} \\
 Restricted reference-counting mechanism &
@@ -25,6 +26,7 @@ Type-Safe Memory &
 	Section~\ref{sec:defer:RCU is a Way of Providing Type-Safe Memory} \\
 Wait for things to finish &
 	Section~\ref{sec:defer:RCU is a Way of Waiting for Things to Finish} \\
+\bottomrule
 \end{tabular}
 \caption{RCU Usage}
 \label{tab:defer:RCU Usage}
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 0b716ef..95d82b4 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -5,88 +5,81 @@
 \label{sec:defer:Which to Choose?}

 \begin{table*}
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.25}
 \footnotesize
 \centering\OneColumnHSpace{-.3in}
-\begin{tabularx}{5.3in}{>{\raggedright\arraybackslash}p{1.1in}||
-    >{\raggedright\arraybackslash}p{1.2in}|
-    >{\raggedright\arraybackslash}X|
-    >{\raggedright\arraybackslash}X|
+\begin{tabularx}{5.3in}{>{\raggedright\arraybackslash}p{1.1in}
+    >{\raggedright\arraybackslash}p{1.2in}
+    >{\raggedright\arraybackslash}X
+    >{\raggedright\arraybackslash}X
     >{\raggedright\arraybackslash}p{.9in}}
-
+	\toprule
+	Property
 		& Reference Counting
 			& Hazard Pointers
 				& Sequence Locks
 					& RCU \\
-	\hline
 %		  RC	  HP	  SL	  RCU \\
-	\hline
+	\midrule
 	Existence Guarantees
 		& Complex
 			& Yes
 				& No
 					& Yes \\
-	\hline
 	Updates and Readers Progress Concurrently
 		& Yes
 			& Yes
 				& No
 					& Yes \\
-	\hline
 	Contention Among Readers
 		& High
 			& None
 				& None
 					& None \\
-	\hline
 	Reader Per\-/Critical\-/Section Overhead
 		& N/A
 			& N/A
 				& Two \tco{smp_mb()}
 					& Ranges from none to two
 					  \tco{smp_mb()} \\
-	\hline
 	Reader Per-Object Traversal Overhead
 		& Read-modify-write atomic operations, memory\-/barrier
 		  instructions, and cache misses
 			& \tco{smp_mb()}
 				& None, but unsafe
 					& None (volatile accesses) \\
-	\hline
 	Reader Forward Progress Guarantee
 		& Lock free
 			& Lock free
 				& Blocking
 					& Bounded wait free \\
-	\hline
 	Reader Reference Acquisition
 		& Can fail (conditional)
 			& Can fail (conditional)
 				& Unsafe
 					& Cannot fail (unconditional) \\
-	\hline
 	Memory Footprint
 		& Bounded
 			& Bounded
 				& Bounded
 					& Unbounded \\
-	\hline
 	Reclamation Forward Progress
 		& Lock free
 			& Lock free
 				& N/A
 					& Blocking \\
-	\hline
 	Automatic Reclamation
 		& Yes
 			& No
 				& N/A
 					& No \\
-	\hline
 	Lines of Code
 		& 94
 			& 79
 				& 79
 					& 73 \\
+	\bottomrule
 \end{tabularx}
 \caption{Which Deferred Technique to Choose?}
 \label{tab:defer:Which Deferred Technique to Choose?}
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index ff33839..2d04b80 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -348,25 +348,24 @@ of the state space, as shown in
 Listing~\ref{lst:analysis:Atomic Increment spin Output}.

 \begin{table}
-\footnotesize
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.2}
+\small
 \centering
-\begin{tabular}{c|r|r}
-	\# incrementers & \# states &	megabytes \\
-	\hline
-	\hline
+\begin{tabular}{S[table-format = 1.0]S[table-format = 7.0]S[table-format = 3.1]}
+	\toprule
+	\multicolumn{1}{l}{\# incrementers} &
+		\multicolumn{1}{r}{\# states} &
+			\multicolumn{1}{r}{megabytes} \\
+	\midrule
 	1 &		        11 &          2.6 \\
-	\hline
 	2 &		        52 &          2.6 \\
-	\hline
 	3 &		       372 &          2.6 \\
-	\hline
-	4 &		     3,496 &          2.7 \\
-	\hline
-	5 &		    40,221 &          5.0 \\
-	\hline
-	6 &		   545,720 &         40.5 \\
-	\hline
-	7 &		 8,521,450 &        652.7 \\
+	4 &		     3 496 &          2.7 \\
+	5 &		    40 221 &          5.0 \\
+	6 &		   545 720 &         40.5 \\
+	7 &		 8 521 450 &        652.7 \\
+	\bottomrule
 \end{tabular}
 \caption{Memory Usage of Increment Model}
 \label{tab:advsync:Memory Usage of Increment Model}
@@ -1221,28 +1220,27 @@ cc -DSAFETY -o pan pan.c
 \vspace{5pt}

 \begin{table}
-\footnotesize
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.2}
+\small
 \centering
-\begin{tabular}{c|r|r|r}
-	updaters &
-	    readers &
-		   \# states & MB \\
-	\hline
+\begin{tabular}{S[table-format = 1.0]S[table-format = 1.0]S[table-format = 9.0]
+		S[table-format = 5.1]}
+	\toprule
+	\multicolumn{1}{r}{updaters} &
+	    \multicolumn{1}{r}{readers} &
+		\multicolumn{1}{r}{\# states} &
+		    \multicolumn{1}{r}{MB} \\
+	\midrule
 	1 & 1 &         376 &      2.6 \\
-	\hline
-	1 & 2 &       6,177 &      2.9 \\
-	\hline
-	1 & 3 &      82,127 &      7.5 \\
-	\hline
-	2 & 1 &      29,399 &      4.5 \\
-	\hline
-	2 & 2 &   1,071,180 &     75.4 \\
-	\hline
-	2 & 3 &  33,866,700 &  2,715.2 \\
-	\hline
-	3 & 1 &     258,605 &     22.3 \\
-	\hline
-	3 & 2 & 169,533,000 & 14,979.9 \\
+	1 & 2 &       6 177 &      2.9 \\
+	1 & 3 &      82 127 &      7.5 \\
+	2 & 1 &      29 399 &      4.5 \\
+	2 & 2 &   1 071 180 &     75.4 \\
+	2 & 3 &  33 866 700 &  2 715.2 \\
+	3 & 1 &     258 605 &     22.3 \\
+	3 & 2 & 169 533 000 & 14 979.9 \\
+	\bottomrule
 \end{tabular}
 \caption{Memory Usage of QRCU Model}
 \label{tab:advsync:Memory Usage of QRCU Model}
diff --git a/future/QC.tex b/future/QC.tex
index a053240..f470de5 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -125,34 +125,33 @@ QC systems have been making substantial Moore's-Law-style progress
 in a number of technical areas.

 \begin{table}
-\centering\footnotesize
-\begin{tabular}{l|r|r|r}
-	&	&	& Years per \\
+\renewcommand*{\arraystretch}{1.2}
+\rowcolors{1}{}{lightgray}
+\centering\small
+\begin{tabular}{lrS[table-format = 4.0]S[table-format = 1.1]}
+\toprule
 System
 	& Availability
-		& Qubits
-			& Doubling \\
-\hline
-\hline
+		& \multicolumn{1}{r}{Qubits}
+			& \multicolumn{1}{r}{\parbox[b]{.5in}{Years per\\Doubling}} \\
+\midrule
 D-Wave One
 	& May 2011
 		& 128
 			& 1.4 \\
-\hline
 D-Wave Two
 	& May 2013
 		& 512
 			& 1.9 \\
-\hline
 D-Wave 2X
 	& Aug 2015
 		& 1152
 			& 1.7 \\
-\hline
 D-Wave 2000Q
 	& Jan 2017
 		& 2048
-			& --- \\
+			& \multicolumn{1}{c}{$-$} \\
+\bottomrule
 \end{tabular}
 \caption{D-Wave Qubit Growth Rate}
 \label{tab:future:D-Wave Qubit Growth Rate}
@@ -645,20 +644,21 @@ to transport heat from a low temperature ($\TLo$) to a high temperature
 \end{equation}

 \begin{table}
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.25}
 \centering\footnotesize
-\begin{tabular}{p{1.7in}|p{0.95in}}
+\begin{tabular}{p{1.7in}p{0.95in}}
+\toprule
 Law of Thermodynamics
 	& English Translation \\
-\hline
-\hline
+\midrule
 Energy is conserved.
 	& Can't win! \\
-\hline
 Entropy increases in closed systems.
 	& Can't break even! \\
-\hline
 Entropy approaches a constant value as temperature approaches absolute zero.
 	& Can't leave the game! \\
+\bottomrule
 \end{tabular}
 \caption{The Three Laws of Thermodynamics}
 \label{tab:future:The Three Laws of Thermodynamics}
@@ -692,37 +692,36 @@ at low temperatures.\footnote{
 	a less daunting refrigeration barrier to QC-on-a-chip.}

 \begin{table}
-\centering\footnotesize
-\begin{tabular}{l|r|r|r}
-	&	&	& Power per watt \\
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.2}
+\centering\small
+\begin{tabular}{lS[table-format = 3.3]S[table-format = 1.6]S[table-format = 5.1]}
+\toprule
 Situation
-	& $T$ (K)
-		& $\CPf$ & waste heat (W) \\
-\hline
-\hline
+	& \multicolumn{1}{c}{$T$ (K)}
+		& \multicolumn{1}{c}{$\CPf$}
+			& \multicolumn{1}{r}{\parbox[b]{.75in}{Power per watt\\waste heat (W)}} \\
+\midrule
 Dry Ice
-	& $195$
-		& $1.990$
+	& 195
+		& 1.990
 			& 0.5 \\
-\hline
 Liquid N$_2$
-	& $77$
-		& $0.356$
+	& 77
+		& 0.356
 			& 2.8 \\
-\hline
 Liquid H$_2$
-	& $20$
-		& $0.073$
+	& 20
+		& 0.073
 			& 13.7 \\
-\hline
 Liquid He
-	& $4$
-		& $0.0138$
+	& 4
+		& 0.0138
 			& 72.3 \\
-\hline
-IBM~Q	& $0.015$
-		& $0.000051$
-			& 19,500.0 \\
+IBM~Q	& 0.015
+		& 0.000051
+			& 19 500.0 \\
+\bottomrule
 \end{tabular}
 \caption{Refrigeration Power Consumption}
 \label{tab:future:Refrigeration Power Consumption}
diff --git a/perfbook.tex b/perfbook.tex
index 93d2253..32f0e6d 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -56,6 +56,7 @@
 \usepackage[xspace]{ellipsis}
 \usepackage{braket} % for \ket{} macro in QC section
 \usepackage{siunitx} % for \num{} macro
+\sisetup{group-minimum-digits=4,group-separator={,},group-digits=integer}

 % custom packages

diff --git a/together/refcnt.tex b/together/refcnt.tex
index 8a7fa1d..cc04367 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -65,21 +65,24 @@ locking, and RCU.
 } \QuickQuizEnd

 \begin{table}[tb]
-\footnotesize
+\renewcommand*{\arraystretch}{1.25}
+\rowcolors{3}{}{lightgray}
+\small
 \centering
-\begin{tabular}{l||c|c|c}
+\begin{tabular}{lccc}
+	\toprule
 	& \multicolumn{3}{c}{Release Synchronization} \\
-	\cline{2-4}
-	Acquisition     &         & Reference &     \\
-	Synchronization & Locking & Counting  & RCU \\
-	\hline
-	\hline
+	\cmidrule(l){2-4}
+	\parbox[c]{.8in}{Acquisition\\Synchronization}
+			& Locking
+				& \parbox[c]{.5in}{Reference\\Counting}
+				        & RCU \\
+	\cmidrule{1-1} \cmidrule(l){2-4}
 	Locking		& $-$	  & CAM	      & CA  \\
-	\hline
-	Reference	& A	  & AM	      & A   \\
-	Counting	&  	  &   	      &     \\
-	\hline
+	\parbox[c][6ex]{.8in}{Reference\\Counting}
+			& A	  & AM        & A   \\
 	RCU		& CA	  & MCA	      & CA  \\
+	\bottomrule
 \end{tabular}
 \caption{Reference Counting and Synchronization Mechanisms}
 \label{tab:together:Reference Counting and Synchronization Mechanisms}
-- 
2.7.4


