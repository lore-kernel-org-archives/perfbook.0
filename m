Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H/ZTfBeXZaYVYUTT9H/e/U/6Lkd6eRHR8PCEnS0/fPE=;
 b=jQIWJBW2oylJ7YV+NgNqffe9DPChJFS5+xwbVH9SYTiAW9/mQQp6u14xQ9PhdWT2Dd
 VEnWEQB3Sn5WMRXWO8yDHV5wtmkBBDTJcOSSYQHYz7H31/Nm+2Z4VbnrOzNWa54wr5HA
 F9s6qSerjT8Jbqoe2OZSPocfPSajvrCP8NlBsy2XLJU8ug/LAMTzE48TgzIZkYOtjHpI
 b4I7Y3YLiVD+slYuobJw0XwtME+FvGc0OgTqI3Unsh0Vrp3AyAH6IDnwa+N4qHJu4NoO
 p/10qgUgQW3jcOxe+GXhu+LozdhthSy3bcFbskabYOAlDgNUK8RW4tnAwKW7oTfR5IMa
 FLwA==
Subject: [PATCH RESEND] styleguide: Add example of partially colored rows
References: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
 <20170819002610.GB11320@linux.vnet.ibm.com>
 <27359aae-7f11-e155-49db-778f908fb750@gmail.com>
 <20170822160926.GC11320@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <be9e9a94-b1c3-55fe-d4a1-f4a706d6ace3@gmail.com>
Date: Wed, 23 Aug 2017 07:15:12 +0900
MIME-Version: 1.0
In-Reply-To: <20170822160926.GC11320@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2bc37e7fd32155f0496228080eeb34fbe8dac73a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 23 Aug 2017 00:01:14 +0900
Subject: [PATCH RESEND] styleguide: Add example of partially colored rows

Also add explanation of interference of \rowcolors{} commands and
\cmidrule{} commands in LaTeX source.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 137 ++++++++++++++++++++++++++++++++-----
 1 file changed, 118 insertions(+), 19 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index cfa3234..c0636db 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -1027,12 +1027,12 @@ Two types of memory barrier are denoted by subscripts here.

 \vspace{5pt}\hfill
 {\footnotesize
-\rowcolors{1}{}{lightgray}
-  \begin{tabular}{cp{1.5in}}
+\rowcolors{1}{}{}
+  \begin{tabular}{lp{1.8in}}
         A	& Atomic counting \\
+        C	& Check combined with the atomic acquisition operation \\
         M\textsubscript{R}	& Memory barriers required only on release \\
         M\textsubscript{A}	& Memory barriers required on acquire \\
-        C	& Check combined with the atomic acquisition operation \\
   \end{tabular}
 }
 \caption{Reference Counting and Synchronization Mechanisms}
@@ -1050,7 +1050,18 @@ A ``figure'' environment might be a proper choice here.
 \small
 \centering
 \renewcommand*{\arraystretch}{1.2}
-\rowcolors{5}{}{lightgray} % 5 is chosen due to disturbance of row count by cmidrule
+\rowcolors{6}{}{lightgray}
+% "6" is chosen due to disturbance of row count by cmidrule.
+% The command definition is:
+%     \rowcolors{<row>}{<odd-row color>}{<even-row color>}
+% Here, <row> specifies the row count where the coloring start.
+% In this table, the "Seq = 0" row is the 3rd row, so a "3" would
+% be a right choice.
+% However, because of the \cmidrule{} commands used in the heading,
+% internal row count of the "Seq = 0" row becomes "6".
+% This is why the 3rd row has the background color of <even-row color>.
+%
+% \cline of plain LaTeX also interfares the row count.
 \begin{tabular}{rclcccccc}
 	\toprule
 	& & & \multicolumn{4}{c}{CPU Cache} & \multicolumn{2}{c}{Memory} \\
@@ -1078,10 +1089,20 @@ is a tweaked version of
 Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}.
 Here, the ``Category'' column in the original is removed
 and the categories are indicated in rows of bold-face font
-just below the mid-rules.
+just below the mid-rules. This change makes it easier for
+\verb|\rowcolors{}| command of ``xcolor'' package to work
+properly.
+
+Table~\ref{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
+is another example which keeps original columns and colors rows only where
+a category has multiple rows. This is done by combining \verb|\rowcolors{}|
+of ``xcolor'' and \verb|\cellcolor{}| commands of the ``colortbl''
+package (\verb|\cellcolor{}| overrides \verb|\rowcolors{}|).
+
+For consistent looks, the latter layout might be our choice.

 \begin{table*}[tbh]
-\rowcolors{2}{}{lightgray}
+\rowcolors{2}{}{blue!15}
 \renewcommand*{\arraystretch}{1.1}
 \footnotesize
 \centering
@@ -1090,64 +1111,142 @@ just below the mid-rules.
 	Primitives &
 		Availability &
 			Overhead \\
-\midrule\rowcolor{blue!15}
-	\multicolumn{3}{l}{\bfseries List traversal} \\ \hiderowcolors
+\midrule
+	\multicolumn{3}{l}{\bfseries List traversal} \\
 	\tco{list_for_each_entry_rcu()} &
 		2.5.59 &
 			Simple instructions (memory barrier on Alpha) \\
-\midrule\rowcolor{blue!15}
-	\multicolumn{3}{l}{\bfseries List update} \\ \showrowcolors
+\midrule
+	\multicolumn{3}{l}{\bfseries List update} \\
 	\tco{list_add_rcu()} &
 		2.5.44 &
 			Memory barrier \\
+	\rowcolor{lightgray}\tco{list_add_tail_rcu()} &
+		2.5.44 &
+			Memory barrier \\
+	\tco{list_del_rcu()} &
+		2.5.44 &
+			Simple instructions \\
+	\rowcolor{lightgray}\tco{list_replace_rcu()} &
+		2.6.9 &
+			Memory barrier \\
+	\tco{list_splice_init_rcu()} &
+		2.6.21 &
+			Grace-period latency \\
+\midrule
+	\multicolumn{3}{l}{\bfseries Hlist traversal} \\
+	\tco{hlist_for_each_entry_rcu()} &
+		2.6.8 &
+			Simple instructions (memory barrier on Alpha) \\
+\midrule
+	\multicolumn{3}{l}{\bfseries Hlist update} \\
+	\tco{hlist_add_after_rcu()} &
+		2.6.14 &
+			Memory barrier \\
+	\rowcolor{lightgray}\tco{hlist_add_before_rcu()} &
+		2.6.14 &
+			Memory barrier \\
+	\tco{hlist_add_head_rcu()} &
+		2.5.64 &
+			Memory barrier \\
+	\rowcolor{lightgray}\tco{hlist_del_rcu()} &
+		2.5.64 &
+			Simple instructions \\
+	\tco{hlist_replace_rcu()} &
+		2.6.15 &
+			Memory barrier \\
+\midrule
+	\multicolumn{3}{l}{\bfseries Pointer traversal} \\
+	\tco{rcu_dereference()} &
+		2.6.9 &
+			Simple instructions (memory barrier on Alpha) \\
+\midrule
+	\multicolumn{3}{l}{\bfseries Pointer update} \\
+	\tco{rcu_assign_pointer()} &
+		2.6.10 &
+			Memory barrier \\
+\bottomrule
+\end{tabular}
+\caption{RCU Publish-Subscribe and Version Maintenance APIs}
+\label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs}
+\end{table*}
+
+\begin{table*}[tbhp]
+\renewcommand*{\arraystretch}{1.2}
+\rowcolors{3}{lightgray}{}
+\footnotesize
+\centering
+\begin{tabular}{lllp{1.2in}}\toprule
+Category &
+	Primitives &
+		Availability &
+			Overhead \\
+\midrule
+List traversal &
+	\tco{list_for_each_entry_rcu()} &
+		2.5.59 &
+			Simple instructions (memory barrier on Alpha) \\
+\midrule
+\cellcolor{white}List update &
+	\tco{list_add_rcu()} &
+		2.5.44 &
+			Memory barrier \\
+&
 	\tco{list_add_tail_rcu()} &
 		2.5.44 &
 			Memory barrier \\
+\cellcolor{white} &
 	\tco{list_del_rcu()} &
 		2.5.44 &
 			Simple instructions \\
+&
 	\tco{list_replace_rcu()} &
 		2.6.9 &
 			Memory barrier \\
+\cellcolor{white} &
 	\tco{list_splice_init_rcu()} &
 		2.6.21 &
 			Grace-period latency \\
-\midrule\rowcolor{blue!15}
-	\multicolumn{3}{l}{\bfseries Hlist traversal} \\ \hiderowcolors
+\midrule
+Hlist traversal &
 	\tco{hlist_for_each_entry_rcu()} &
 		2.6.8 &
 			Simple instructions (memory barrier on Alpha) \\
-\midrule\rowcolor{blue!15}
-	\multicolumn{3}{l}{\bfseries Hlist update} \\ \showrowcolors
+\midrule
+\cellcolor{white}Hlist update &
 	\tco{hlist_add_after_rcu()} &
 		2.6.14 &
 			Memory barrier \\
+&
 	\tco{hlist_add_before_rcu()} &
 		2.6.14 &
 			Memory barrier \\
+\cellcolor{white} &
 	\tco{hlist_add_head_rcu()} &
 		2.5.64 &
 			Memory barrier \\
+&
 	\tco{hlist_del_rcu()} &
 		2.5.64 &
 			Simple instructions \\
+\cellcolor{white} &
 	\tco{hlist_replace_rcu()} &
 		2.6.15 &
 			Memory barrier \\
-\midrule\rowcolor{blue!15}
-	\multicolumn{3}{l}{\bfseries Pointer traversal} \\ \hiderowcolors
+\midrule\hiderowcolors
+Pointer traversal &
 	\tco{rcu_dereference()} &
 		2.6.9 &
 			Simple instructions (memory barrier on Alpha) \\
-\midrule\rowcolor{blue!15}
-	\multicolumn{3}{l}{\bfseries Pointer update} \\ \hiderowcolors
+\midrule
+Pointer update &
 	\tco{rcu_assign_pointer()} &
 		2.6.10 &
 			Memory barrier \\
 \bottomrule
 \end{tabular}
 \caption{RCU Publish-Subscribe and Version Maintenance APIs}
-\label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs}
+\label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
 \end{table*}

 Table~\ref{tab:advsync:Memory Misordering: Store-Buffering Sequence of Events}
-- 
2.7.4


