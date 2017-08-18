Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8YMCZHQbbe0lzhD09RNBfYoGg1GdV1e1/QV/YScT+58=;
 b=jrXbdp/FfLucVdNasB9vykL6kQBlIeePfms09IaNs2KUM5dwp3TuerMJ+gthd/TUid
 rWyVnQo8gXOI8KFjqDyI/Ic7Q6QM+6xts4sPRnnypFpPbo+gr15pPpQs2GOdlykZdwcS
 zJQ+fSZQP7pVHJy3fStysTuCo5S8kolLwljiV3NZhiEk09SKmWBY+PbEplaM9tsRGiE7
 4yDdE/KjCV9v/QkxadJR4k0w+Q/8UzTRM4D9+Qw9EltYPGtHMpBJrBNYJZaxIhOIy6N8
 /Hdzuxy4TTOltWjRHNlv/ZG355qq+L0OUAl/w1WSQf9gvMSFPMizGqpEajnFtuWUy0bD
 xL9A==
Subject: [PATCH 2/4] styleguide: Add more table experiments
References: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <24a1a37d-929b-426f-e64f-3b09dd5f5e68@gmail.com>
Date: Sat, 19 Aug 2017 08:32:14 +0900
MIME-Version: 1.0
In-Reply-To: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ed8efd5ad9c05e764a8084a56e88d5886f50c523 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 16 Aug 2017 00:43:11 +0900
Subject: [PATCH 2/4] styleguide: Add more table experiments

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 346 +++++++++++++++++++++++++++++++------
 1 file changed, 292 insertions(+), 54 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 47251a1..31a83eb 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -722,6 +722,20 @@ It should be regarded as a band-aid tweak.
 \subsubsection{Grouping Related Figures/Listings}
 \label{sec:app:styleguide:Grouping Related Figures/Listings}

+\begin{figure*}[tbhp]\centering
+\begin{minipage}[t][][t]{2.1in}
+\resizebox{2.1in}{!}{\includegraphics{cartoons/1kHz}}
+\caption{Timer Wheel at 1\,kHz}
+\label{fig:app:styleguide:Timer Wheel at 1kHz}
+\end{minipage}
+\qquad
+\begin{minipage}[t][][t]{2.3in}
+\resizebox{2.3in}{!}{\includegraphics{cartoons/100kHz}}
+\caption{Timer Wheel at 100\,kHz}
+\label{fig:app:styleguide:Timer Wheel at 100kHz}
+\end{minipage}
+\end{figure*}
+
 To prevent a pair of closely related figures or listings
 from being placed in different pages, it is desirable to group
 them into a single floating object.
@@ -739,20 +753,6 @@ as shown in
 Figures~\ref{fig:app:styleguide:Timer Wheel at 1kHz}
 and~\ref{fig:app:styleguide:Timer Wheel at 100kHz}.

-\begin{figure*}[tbhp]\centering
-\begin{minipage}[t][][t]{2.1in}
-\resizebox{2.1in}{!}{\includegraphics{cartoons/1kHz}}
-\caption{Timer Wheel at 1\,kHz}
-\label{fig:app:styleguide:Timer Wheel at 1kHz}
-\end{minipage}
-\qquad
-\begin{minipage}[t][][t]{2.3in}
-\resizebox{2.3in}{!}{\includegraphics{cartoons/100kHz}}
-\caption{Timer Wheel at 100\,kHz}
-\label{fig:app:styleguide:Timer Wheel at 100kHz}
-\end{minipage}
-\end{figure*}
-
 By using subfig package,
 Listings~\ref{lst:advsync:Message-Passing Litmus Test}
 and~\ref{lst:advsync:Enforcing Order of Message-Passing Litmus Test}
@@ -867,53 +867,17 @@ look ugly.\footnote{
 Vertical lines should be avoided and horizontal lines should be
 used sparingly, especially in tables of simple structure.

-For example,
-Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
-can be tweaked by the help of ``booktabs'' package as is shown in
-Table~\ref{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System},
-with the caption at the top.
-
 \floatstyle{plaintop}
 \restylefloat{table}
 \captionsetup[table]{position=top,hangindent=30pt}
 \renewcommand*{\abovetopsep}{-7pt}
+\definecolor{lightgray}{gray}{0.9}

-\begin{table}[htb]
-\renewcommand*{\arraystretch}{1.2}\centering\small
-\begin{tabular}{@{}lrr@{}}\toprule
-
-	Operation		& Cost (ns) 	& \parbox[b]{.7in}{\raggedleft Ratio\par (cost/clock)} \\
-	\midrule
-	Clock period		&           0.6	&           1.0 \\
-	Best-case CAS		&          37.9	&          63.2 \\
-	Best-case lock		&          65.6	&         109.3 \\
-	Single cache miss	&         139.5	&         232.5 \\
-	CAS cache miss		&         306.0	&         510.0 \\
-	Comms Fabric		&       5,000\textcolor{white}{.0}
-						&       8,330\textcolor{white}{.0}
-								\\
-	Global Comms		& 195,000,000\textcolor{white}{.0}
-						& 325,000,000\textcolor{white}{.0} \\
-\bottomrule
-\end{tabular}
-\caption{Performance of Synchronization Mechanisms of 4-CPU 1.8\,GHz AMD Opteron 844 System}
-\label{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}
-\end{table}
-
-Note that ruled lines of booktabs can not be mixed with
-vertical lines in a table.\footnote{
-  There is another package named ``arydshln'' which provides dashed lines
-  to be used in tables.
-  Unfortunately, it conflicts with the tabulary package and prevents us
-  from experimenting it for the moment.
-}
-
-Another option is to color rows alternately by using the feature of xcolor
-package. For example,
+For example,
 Table~\ref{tab:future:Refrigeration Power Consumption}
 can be tweaked as shown in
-Table~\ref{tab:app:styleguide:Refrigeration Power Consumption}.
-\definecolor{lightgray}{gray}{0.9}
+Table~\ref{tab:app:styleguide:Refrigeration Power Consumption}
+with the help of ``booktabs'' and ``xcolor'' packages.

 \begin{table}[htbp]
 \rowcolors{1}{}{lightgray}
@@ -948,6 +912,280 @@ IBM~Q	& $0.015$
 \label{tab:app:styleguide:Refrigeration Power Consumption}
 \end{table}

+Note that ruled lines of booktabs can not be mixed with
+vertical lines in a table.\footnote{
+  There is another package named ``arydshln'' which provides dashed lines
+  to be used in tables.
+  Unfortunately, it conflicts with the tabulary package and prevents us
+  from experimenting it for the moment.
+}
+
+\vfil
+\pagebreak % to permit wide tables to be printed
+
+\subsubsection{Table Layout Experiment}
+\label{sec:app:styleguide:Table Layout Experiment}
+
+To see how far we can go without vertical rules in tables,
+several experiments using booktabs and xcolors are presented
+in this section.
+
+Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
+can be tweaked as is shown in
+Table~\ref{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}.
+In this table, original tabular source contains tweaks with
+\verb|\textcolor{}| commands. They are removed by using ``S'' column
+specifiers provided by the ``siunitx'' package.
+
+\begin{table}[htb]
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.1}
+\sisetup{group-minimum-digits=4,group-separator={,}}
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
+	Clock period		&           0.6	&           1.0 \\
+	Best-case CAS		&          37.9	&          63.2 \\
+	Best-case lock		&          65.6	&         109.3 \\
+	Single cache miss	&         139.5	&         232.5 \\
+	CAS cache miss		&         306.0	&         510.0 \\
+	Comms Fabric		&       5 000	&       8 330	\\
+	Global Comms		& 195 000 000	& 325 000 000   \\
+	\bottomrule
+\end{tabular}
+\caption{Performance of Synchronization Mechanisms of 4-CPU 1.8\,GHz AMD Opteron 844 System}
+\label{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}
+\end{table}
+
+Table~\ref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms}
+is a tweaked version of
+Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms},
+which has more complex header than the tables experimented so far.
+
+\begin{table}[htbp]
+\small
+\centering
+\renewcommand*{\arraystretch}{1.25}
+\rowcolors{3}{}{lightgray}
+\begin{tabular}{lccc}
+	\toprule
+	& \multicolumn{3}{c}{Release Synchronization} \\
+	\cmidrule(l){2-4}
+	\parbox[c]{.8in}{Acquisition\\Synchronization}
+			& Locking
+				& \parbox[c]{.5in}{Reference\\Counting}
+				        & RCU \\
+	\cmidrule{1-1} \cmidrule(l){2-4}
+	Locking		& $-$	& CAM	& CA  \\
+	\parbox[c][6ex]{.8in}{Reference\\Counting}
+			& A	& AM	& A   \\
+	RCU		& CA	& MCA	& CA  \\
+	\bottomrule
+\end{tabular}
+\caption{Reference Counting and Synchronization Mechanisms}
+\label{tab:app:styleguide:Reference Counting and Synchronization Mechanisms}
+\end{table}
+
+In
+Table~\ref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms},
+the gap in the mid-rule corresponds to the distinction
+which is represented by double vertical rules in
+Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms}.
+
+However, it makes no sense when it is separated from the explanation near~%
+Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms}
+due to the lack of explanation of abbreviations used in the matrix.
+An example with proper legends is shown in
+Table~\ref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms (Legends)}.
+Two types of memory barrier are denoted by subscripts here.
+
+\begin{table}[htbp]
+\small
+\centering
+\renewcommand*{\arraystretch}{1.25}
+\rowcolors{3}{}{lightgray}
+\begin{tabular}{lccc}
+	\toprule
+	& \multicolumn{3}{c}{Release Synchronization} \\
+	\cmidrule(l){2-4}
+	\parbox[c]{.8in}{Acquisition\\Synchronization}
+			& Locking
+				& \parbox[c]{.5in}{Reference\\Counting}
+				        & RCU \\
+	\cmidrule{1-1} \cmidrule(l){2-4}
+	Locking		& $-$	& CAM\textsubscript{R}	& CA  \\
+	\parbox[c][6ex]{.8in}{Reference\\Counting}
+			& A	& AM\textsubscript{R}	& A   \\
+	RCU		& CA	& M\textsubscript{A}CA	& CA  \\
+	\bottomrule
+\end{tabular}
+
+\vspace{5pt}\hfill
+{\footnotesize
+\rowcolors{1}{}{lightgray}
+  \begin{tabular}{cp{1.5in}}
+        A	& Atomic counting \\
+        M\textsubscript{R}	& Memory barriers required only on release \\
+        M\textsubscript{A}	& Memory barriers required on acquire \\
+        C	& Check combined with the atomic acquisition operation \\
+  \end{tabular}
+}
+\caption{Reference Counting and Synchronization Mechanisms}
+\label{tab:app:styleguide:Reference Counting and Synchronization Mechanisms (Legends)}
+\end{table}
+
+Table~\ref{tab:app:whymb:Cache Coherence Example}
+can be tweaked as in
+Table~\ref{tab:app:styleguide:Cache Coherence Example}
+in a similar manner.
+It is not a ``table'' in the narrow sense, rather a sequence diagram.
+A ``figure'' environment might be a proper choice here.
+
+\begin{table*}[htb]
+\small
+\centering
+\renewcommand*{\arraystretch}{1.2}
+\rowcolors{5}{}{lightgray} % 5 is chosen due to disturbance of row count by cmidrule
+\begin{tabular}{rclcccccc}
+	\toprule
+	& & & \multicolumn{4}{c}{CPU Cache} & \multicolumn{2}{c}{Memory} \\
+	\cmidrule(lr){4-7} \cmidrule(l){8-9}
+	Sequence \# & CPU \# & Operation & 0 & 1 & 2 & 3 & 0 & 8 \\
+	\cmidrule(r){1-3} \cmidrule(lr){4-7} \cmidrule(l){8-9}
+%	Seq CPU Operation	------------- CPU -------------   - Memory -
+%				   0	   1	   2	   3	    0   8
+	0 &   & Initial State	& $-$/I & $-$/I & $-$/I & $-$/I   & V & V \\
+	1 & 0 & Load		& 0/S &   $-$/I & $-$/I & $-$/I   & V & V \\
+	2 & 3 & Load		& 0/S &   $-$/I & $-$/I & 0/S     & V & V \\
+	3 & 0 & Invalidation	& 8/S &   $-$/I & $-$/I & 0/S     & V & V \\
+	4 & 2 & RMW		& 8/S &   $-$/I & 0/E &   $-$/I   & V & V \\
+	5 & 2 & Store		& 8/S &   $-$/I & 0/M &   $-$/I   & I & V \\
+	6 & 1 & Atomic Inc	& 8/S &   0/M &   $-$/I & $-$/I   & I & V \\
+	7 & 1 & Writeback	& 8/S &   8/S &   $-$/I & $-$/I   & V & V \\
+	\bottomrule
+\end{tabular}
+\caption{Cache Coherence Example}
+\label{tab:app:styleguide:Cache Coherence Example}
+\end{table*}
+
+Table~\ref{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs}
+is a tweaked version of
+Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}.
+Here, the ``Category'' column in the original is removed
+and the categories are indicated in rows of bold-face font
+just below the mid-rules.
+
+\begin{table*}[htb]
+\rowcolors{2}{}{lightgray}
+\renewcommand*{\arraystretch}{1.1}
+\footnotesize
+\centering
+\begin{tabular}{lll}
+\toprule
+	Primitives &
+		Availability &
+			Overhead \\
+\midrule\rowcolor{blue!15}
+	\multicolumn{3}{l}{\bfseries List traversal} \\ \hiderowcolors
+	\tco{list_for_each_entry_rcu()} &
+		2.5.59 &
+			Simple instructions (memory barrier on Alpha) \\
+\midrule\rowcolor{blue!15}
+	\multicolumn{3}{l}{\bfseries List update} \\ \showrowcolors
+	\tco{list_add_rcu()} &
+		2.5.44 &
+			Memory barrier \\
+	\tco{list_add_tail_rcu()} &
+		2.5.44 &
+			Memory barrier \\
+	\tco{list_del_rcu()} &
+		2.5.44 &
+			Simple instructions \\
+	\tco{list_replace_rcu()} &
+		2.6.9 &
+			Memory barrier \\
+	\tco{list_splice_init_rcu()} &
+		2.6.21 &
+			Grace-period latency \\
+\midrule\rowcolor{blue!15}
+	\multicolumn{3}{l}{\bfseries Hlist traversal} \\ \hiderowcolors
+	\tco{hlist_for_each_entry_rcu()} &
+		2.6.8 &
+			Simple instructions (memory barrier on Alpha) \\
+\midrule\rowcolor{blue!15}
+	\multicolumn{3}{l}{\bfseries Hlist update} \\ \showrowcolors
+	\tco{hlist_add_after_rcu()} &
+		2.6.14 &
+			Memory barrier \\
+	\tco{hlist_add_before_rcu()} &
+		2.6.14 &
+			Memory barrier \\
+	\tco{hlist_add_head_rcu()} &
+		2.5.64 &
+			Memory barrier \\
+	\tco{hlist_del_rcu()} &
+		2.5.64 &
+			Simple instructions \\
+	\tco{hlist_replace_rcu()} &
+		2.6.15 &
+			Memory barrier \\
+\midrule\rowcolor{blue!15}
+	\multicolumn{3}{l}{\bfseries Pointer traversal} \\ \hiderowcolors
+	\tco{rcu_dereference()} &
+		2.6.9 &
+			Simple instructions (memory barrier on Alpha) \\
+\midrule\rowcolor{blue!15}
+	\multicolumn{3}{l}{\bfseries Pointer update} \\ \hiderowcolors
+	\tco{rcu_assign_pointer()} &
+		2.6.10 &
+			Memory barrier \\
+\bottomrule
+\end{tabular}
+\caption{RCU Publish-Subscribe and Version Maintenance APIs}
+\label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs}
+\end{table*}
+
+Table~\ref{tab:advsync:Memory Misordering: Store-Buffering Sequence of Events}
+can be tweaked as shown in
+Table~\ref{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}.
+It is also a sequence diagram drawn as a tabular object.
+
+\begin{table*}[htb]
+\rowcolors{6}{}{lightgray}
+\renewcommand*{\arraystretch}{1.1}
+\small
+\centering\OneColumnHSpace{-0.1in}
+\begin{tabular}{rllllll}
+	\toprule
+	& \multicolumn{3}{c}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
+	\cmidrule(l){2-4} \cmidrule(l){5-7}
+	& Instruction & Store Buffer & Cache &
+		Instruction & Store Buffer & Cache \\
+	\cmidrule{1-1} \cmidrule(l){2-4} \cmidrule(l){5-7}
+	1 & (Initial state) & & \tco{x1==0} &
+		(Initial state) & & \tco{x0==0} \\
+	2 & \tco{x0 = 2;} & \tco{x0==2} & \tco{x1==0} &
+		\tco{x1 = 2;} & \tco{x1==2} & \tco{x0==0} \\
+	3 & \tco{r2 = x1;} (0) & \tco{x0==2} & \tco{x1==0} &
+		\tco{r2 = x0;} (0) & \tco{x1==2} & \tco{x0==0} \\
+	4 & (Read-invalidate) & \tco{x0==2} & \tco{x0==0} &
+		(Read-invalidate) & \tco{x1==2} & \tco{x1==0} \\
+	5 & (Finish store) & & \tco{x0==2} &
+		(Finish store) & & \tco{x1==2} \\
+	\bottomrule
+\end{tabular}
+\caption{Memory Misordering: Store-Buffering Sequence of Events}
+\label{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}
+\end{table*}
+
 \floatstyle{plain}
 \restylefloat{table}
 \captionsetup[table]{position=bottom,hangindent=0pt}
-- 
2.7.4


