Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3acm3PtB8+7JSpUCA7Eo9STCc5PcPcugA3Z/nSandmI=;
 b=ZgJHTQL5H1jHq5sL0P5O6p1X1rE/jvJ/4rXVa+m0XqUvY5M7pVMJpR+XaVZ6P2b8XF
 6W5BqnRVG54hC7rJ5r5PpgrPRJe72l081JsDSPyFOuLXSQsL3AAOH2rOBua/eJn5rR5J
 pgnZM7pdhCyXzCm4EKadwWm0OODjzSbntJ0by8Nx02V25QQk0buprsJN8AEIsP+lIrAK
 KWgeLB0+GKaaqCPprIzemQjDWX1IMSDAbpd+z8me9nX6FT3ZmzuxF03ZVQwd4yAsDt0a
 Gl8QgsmnW2OLbXcwhFNSafLnbSh9DEXpRqfy7ly/pLFoonsvMPUe7fkFK6RzxT7GkYQB
 I5Lw==
Subject: [PATCH 1/5] memorder: Convert tables to alternate-row coloring scheme
References: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4757ef0d-b70d-1edc-fe73-c8c89c4c83d8@gmail.com>
Date: Mon, 25 Sep 2017 07:02:13 +0900
MIME-Version: 1.0
In-Reply-To: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a2de9f65f942f0cce79da28099b616f5e8919489 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 23 Sep 2017 19:54:51 +0900
Subject: [PATCH 1/5] memorder: Convert tables to alternate-row coloring scheme

Instead of updating them in style guide, apply alternate-
row coloring scheme to tables in memorder chapter.
The scheme goes well with the looks of code snippets in "listing"
environment with "ruled" style already employed in this chapter.
Position of captions is not modified at the moment.

Corresponding tables in style guide will be removed later.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex |   1 -
 memorder/memorder.tex              | 130 +++++++++++++++----------------------
 perfbook.tex                       |   1 +
 3 files changed, 55 insertions(+), 77 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 46d93f6..8bedbef 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -927,7 +927,6 @@ used sparingly, especially in tables of simple structure.
 \restylefloat{table}
 \captionsetup[table]{position=top,hangindent=30pt}
 \renewcommand*{\abovetopsep}{-7pt}
-\definecolor{lightgray}{gray}{0.9}

 For example,
 Table~\ref{tab:future:Refrigeration Power Consumption}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 16de2b6..f393e33 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -200,30 +200,29 @@ In particular, these store buffers can cause the memory misordering
 shown in the store-buffering litmus test in
 Listing~\ref{lst:memorder:Memory Misordering: Store-Buffering Litmus Test}.

-\begin{table*}
+\begin{table*}[tbh]
+\rowcolors{6}{}{lightgray}
+\renewcommand*{\arraystretch}{1.1}
 \small
 \centering\OneColumnHSpace{-0.1in}
-\begin{tabular}{r||l|l|l||l|l|l}
-	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
-	\cline{2-7}
+\begin{tabular}{rllllll}
+	\toprule
+	& \multicolumn{3}{c}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
+	\cmidrule(l){2-4} \cmidrule(l){5-7}
 	& Instruction & Store Buffer & Cache &
 		Instruction & Store Buffer & Cache \\
-	\hline
-	\hline
+	\cmidrule{1-1} \cmidrule(l){2-4} \cmidrule(l){5-7}
 	1 & (Initial state) & & \tco{x1==0} &
 		(Initial state) & & \tco{x0==0} \\
-	\hline
 	2 & \tco{x0 = 2;} & \tco{x0==2} & \tco{x1==0} &
 		\tco{x1 = 2;} & \tco{x1==2} & \tco{x0==0} \\
-	\hline
 	3 & \tco{r2 = x1;} (0) & \tco{x0==2} & \tco{x1==0} &
 		\tco{r2 = x0;} (0) & \tco{x1==2} & \tco{x0==0} \\
-	\hline
 	4 & (Read-invalidate) & \tco{x0==2} & \tco{x0==0} &
 		(Read-invalidate) & \tco{x1==2} & \tco{x1==0} \\
-	\hline
 	5 & (Finish store) & & \tco{x0==2} &
 		(Finish store) & & \tco{x1==2} \\
+	\bottomrule
 \end{tabular}
 \caption{Memory Misordering: Store-Buffering Sequence of Events}
 \label{tab:memorder:Memory Misordering: Store-Buffering Sequence of Events}
@@ -380,33 +379,31 @@ than 800,000 times, as opposed to only 167 times for the
 barrier-free code in
 Listing~\ref{lst:memorder:Memory Misordering: Store-Buffering Litmus Test}.

-\begin{table*}
+\begin{table*}[tbh]
+\rowcolors{6}{}{lightgray}
+\renewcommand*{\arraystretch}{1.1}
 \small
 \centering\OneColumnHSpace{-0.1in}
-\begin{tabular}{r||l|l|l||l|l|l}
-	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
-	\cline{2-7}
+\begin{tabular}{rllllll}
+	\toprule
+	& \multicolumn{3}{c}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
+	\cmidrule(l){2-4} \cmidrule(l){5-7}
 	& Instruction & Store Buffer & Cache &
 		Instruction & Store Buffer & Cache \\
-	\hline
-	\hline
+	\cmidrule{1-1} \cmidrule(l){2-4} \cmidrule(l){5-7}
 	1 & (Initial state) & & \tco{x1==0} &
 		(Initial state) & & \tco{x0==0} \\
-	\hline
 	2 & \tco{x0 = 2;} & \tco{x0==2} & \tco{x1==0} &
 		\tco{x1 = 2;} & \tco{x1==2} & \tco{x0==0} \\
-	\hline
 	3 & \tco{smp_mb();} & \tco{x0==2} & \tco{x1==0} &
 		\tco{smp_mb();} & \tco{x1==2} & \tco{x0==0} \\
-	\hline
 	4 & (Read-invalidate) & \tco{x0==2} & \tco{x0==0} &
 		(Read-invalidate) & \tco{x1==2} & \tco{x1==0} \\
-	\hline
 	5 & (Finish store) & & \tco{x0==2} &
 		(Finish store) & & \tco{x1==2} \\
-	\hline
 	6 & \tco{r2 = x1;} (2) & & \tco{x1==2} &
 		\tco{r2 = x0;} (2) & & \tco{x0==2} \\
+	\bottomrule
 \end{tabular}
 \caption{Memory Ordering: Store-Buffering Sequence of Events}
 \label{tab:memorder:Memory Ordering: Store-Buffering Sequence of Events}
@@ -426,77 +423,63 @@ Note that variables \co{x0} and \co{x1} each still have more than one
 value on row~2, however, as promised earlier, the \co{smp_mb()}
 instances straighten things out in the end.

-\begin{table*}
+\begin{table*}[tbh]
 \small
-\centering\OneColumnHSpace{-0.8in}
-\begin{tabular}{l||c||c|c|c|c||c|c|c|c|c|c|c}
-	& & \multicolumn{4}{c||}{Prior Ordered Operation} &
+\centering\OneColumnHSpace{-0.7in}
+\renewcommand*{\arraystretch}{1.1}
+\rowcolors{7}{lightgray}{}
+\begin{tabular}{lcccccccccccc}\toprule
+	& & \multicolumn{4}{c}{Prior Ordered Operation} &
 		\multicolumn{7}{c}{Subsequent Ordered Operation} \\
-	\cline{3-6} \cline{7-13}
+	\cmidrule(l){3-6} \cmidrule(l){7-13}
 	Operation Providing Ordering & C &
 		Self & R & W & RMW & Self & R & W & DR & DW & RMW & SV \\
-	\hline
-	\hline
+	\cmidrule(r){1-1} \cmidrule{2-2} \cmidrule(l){3-6} \cmidrule(l){7-13}
 	Store, for example, \tco{WRITE_ONCE()} &  &
 		   Y &   &   &     &      &   &   &    &    &     &  Y \\
-	\hline
 	Load, for example, \tco{READ_ONCE()} &  &
 		   Y &   &   &     &      &   &   &    &  Y &     &  Y \\
-	\hline
 	Unsuccessful RMW operation &  &
 		   Y &   &   &     &      &   &   &    &  Y &     &  Y \\
-	\hline
 	\tco{smp_read_barrier_depends()} &  &
 		     & Y &   &     &      &   &   &  Y &  Y &     &    \\
-	\hline
 	\tco{*_dereference()} &  &
 		   Y &   &   &     &      &   &   &  Y &  Y &     &  Y \\
-	\hline
 	Successful \tco{*_acquire()} &   &
 		   R &   &   &     &      & Y & Y &  Y &  Y &   Y &  Y \\
-	\hline
 	Successful \tco{*_release()} & C &
 		     & Y & Y &   Y &    W &   &   &    &    &     &  Y \\
-	\hline
 	\tco{smp_rmb()} &   &
 		     & Y &   &   R &      & Y &   &  Y &    &   R &    \\
-	\hline
 	\tco{smp_wmb()} &   &
 		     &   & Y &   W &      &   & Y &    &  Y &   W &    \\
-	\hline
 	\tco{smp_mb()} and \tco{synchronize_rcu()} & CP &
 		     & Y & Y &   Y &      & Y & Y &  Y &  Y &   Y &    \\
-	\hline
 	Successful full-strength non-\tco{void} RMW & CP &
 		   Y & Y & Y &   Y &    Y & Y & Y &  Y &  Y &   Y &  Y \\
-	\hline
 	\tco{smp_mb__before_atomic()} & CP &
 		     & Y & Y &   Y &      & a & a & a  & a  &   Y &    \\
-	\hline
 	\tco{smp_mb__after_atomic()} & CP &
 		     & a & a &   Y &      & Y & Y &  Y &  Y &     &    \\
-	\multicolumn{13}{c}{~} \\
-	\multicolumn{1}{r}{Key:} &
-		\multicolumn{12}{l}{C: Ordering is cumulative} \\
-	\multicolumn{1}{r}{} &
-		\multicolumn{12}{l}{P: Ordering propagates} \\
-	\multicolumn{1}{r}{} &
-		\multicolumn{12}{l}{R: Read, for example, \tco{READ_ONCE()}, or read portion of RMW} \\
-	\multicolumn{1}{r}{} &
-		\multicolumn{12}{l}{W: Write, for example, \tco{WRITE_ONCE()}, or write portion of RMW} \\
-	\multicolumn{1}{r}{} &
-		\multicolumn{12}{l}{Y: Provides the specified ordering} \\
-	\multicolumn{1}{r}{} &
-		\multicolumn{12}{l}{a: Provides specified ordering given intervening RMW atomic operation} \\
-	\multicolumn{1}{r}{} &
-		\multicolumn{12}{l}{DR: Dependent read (address dependency, Section~\ref{sec:memorder:Address Dependencies})} \\
-	\multicolumn{1}{r}{} &
-		\multicolumn{12}{l}{DW: Dependent write (address, data, or control dependency, Sections~\ref{sec:memorder:Address Dependencies}--\ref{sec:memorder:Control Dependencies})} \\
-	\multicolumn{1}{r}{} &
-		\multicolumn{12}{l}{RMW: Atomic read-modify-write operation} \\
-	\multicolumn{1}{r}{} &
-		\multicolumn{12}{l}{SV: Same-variable access} \\
+	\bottomrule
 \end{tabular}
+
+\vspace{5pt}\hfill
+\framebox[\width]{\footnotesize\setlength{\tabcolsep}{3pt}
+\rowcolors{1}{}{}
+\begin{tabular}{lrl}
+	Key:	& C: & Ordering is cumulative \\
+		& P: & Ordering propagates \\
+		& R: & Read, for example, \tco{READ_ONCE()}, or read portion of RMW \\
+		& W: & Write, for example, \tco{WRITE_ONCE()}, or write portion of RMW \\
+		& Y: & Provides the specified ordering \\
+		& a: & Provides specified ordering given intervening RMW atomic operation \\
+		& DR: & Dependent read (address dependency, Section~\ref{sec:memorder:Address Dependencies}) \\
+		& DW: & Dependent write (address, data, or control dependency, Sections~\ref{sec:memorder:Address Dependencies}--\ref{sec:memorder:Control Dependencies}) \\
+		& RMW: & Atomic read-modify-write operation \\
+		& SV: & Same-variable access \\
+\end{tabular}
+}\OneColumnHSpace{-0.9in}
 \caption{Linux-Kernel Memory-Ordering Cheat Sheet}
 \label{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}
 \end{table*}
@@ -1928,46 +1911,41 @@ line to carry this new value to them.
 	Natural from a hardware point of view, that is!
 } \QuickQuizEnd

-\begin{table*}
+\begin{table*}[tbh]
 \small
 \centering\OneColumnHSpace{-0.8in}
-\begin{tabular}{r||l|l|l|l||l|l|l}
-	& \tco{P0()} & \multicolumn{2}{c|}{\tco{P0()} \& \tco{P1()}} & \tco{P1()} & \multicolumn{3}{c}{\tco{P2()}} \\
-	\cline{2-8}
+\renewcommand*{\arraystretch}{1.1}
+\rowcolors{13}{lightgray}{}
+\begin{tabular}{rlllllll}\toprule
+	& \multicolumn{1}{c}{\tco{P0()}} & \multicolumn{2}{c}{\tco{P0()} \& \tco{P1()}} &
+		\multicolumn{1}{c}{\tco{P1()}} & \multicolumn{3}{c}{\tco{P2()}} \\
+	\cmidrule(l){2-2} \cmidrule(l){3-4} \cmidrule(lr){5-5} \cmidrule(l){6-8}
 	& Instruction & Store Buffer & Cache & Instruction &
 			Instruction & Store Buffer & Cache \\
-	\hline
-	\hline
+	\cmidrule{1-1} \cmidrule(l){2-2} \cmidrule(l){3-3} \cmidrule(l){4-4}
+		\cmidrule(lr){5-5} \cmidrule(l){6-6} \cmidrule(l){7-7} \cmidrule(l){8-8}
 	1 & (Initial state) & & \tco{y==0} &
 		(Initial state) &
 			(Initial state) & & \tco{x==0} \\
-	\hline
 	2 & \tco{x = 1;} & \tco{x==1} & \tco{y==0} &
 		 & & & \tco{x==0} \\
-	\hline
 	3 & (Read-Invalidate \tco{x}) & \tco{x==1} & \tco{y==0} & \tco{r1 = x} (1)
 		 & & & \tco{x==0} \\
-	\hline
 	4 &  & \tco{x==1} \tco{y==1} & \tco{y==0} & \tco{y = r1}
 		 & \tco{r2 = y} & & \tco{x==0} \\
-	\hline
 	5 &  & \tco{x==1} & \tco{y==1} & (Finish store)
 		 & (Read \tco{y}) & & \tco{x==0} \\
-	\hline
 	6 & (Respond \tco{y}) & \tco{x==1} & \tco{y==1} &
 		 & (\tco{r2==1}) & & \tco{x==0} \tco{y==1} \\
-	\hline
 	7 & & \tco{x==1} & \tco{y==1} &
 		 & \tco{smp_rmb()} & & \tco{x==0} \tco{y==1} \\
-	\hline
 	8 & & \tco{x==1} & \tco{y==1} &
 		 & \tco{r3 = x (0)} & & \tco{x==0} \tco{y==1} \\
-	\hline
 	9 & & \tco{x==1} & \tco{x==0} \tco{y==1} &
 		 & (Respond \tco{x}) & & \tco{y==1} \\
-	\hline
 	10 & (Finish store) & & \tco{x==1} \tco{y==1} &
 		 &  & & \tco{y==1} \\
+	\bottomrule
 \end{tabular}
 \caption{Memory Ordering: WRC Sequence of Events}
 \label{tab:memorder:Memory Ordering: WRC Sequence of Events}
diff --git a/perfbook.tex b/perfbook.tex
index 415022c..10346c7 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -93,6 +93,7 @@
 \usepackage{bm} % for bold math mode fonts --- should be after math mode font choice
 \usepackage{booktabs}
 \usepackage{arydshln}
+\definecolor{lightgray}{gray}{0.9} % for coloring alternate rows in table

 \IfLmttForCode{
 \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
-- 
2.7.4


