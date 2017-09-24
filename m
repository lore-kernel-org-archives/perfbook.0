Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LoAzszxVKw5L5JfEtW1HigJtBMRoWGUQ3YPFrB0hrlQ=;
 b=ufgL0GLQT+pIoA6epobh4F+gbCJWcdG9iICigGIhxIAshPZQByIC2m9Lvu6PItfxrs
 nQSa/2mu4C+EX7uCn+OBOSm/sFYh/ijKxnWYSFf/yHz+oGSK68I7bx9MwtsgAvb7CK8A
 XWMfdhrNG6Ak9n6k/2teQxF9MBdsqxUD69MCjOFSx6iysrCAIOO0MW1X5Al750r6end4
 2m0VZ7A+gDdf+VSL3bMkXjPM3UWsiZxqkPPvSDOI0OjxHnETs7nqn0pLJQKxpRncb/3M
 5Gnog+KrZnbSdJb2W7ZWwAEKNxrojlQQo68wzUNWso+p572t7ZmX5+LozKV0TtS+dwfH
 FOjg==
Subject: [PATCH 3/5] styleguide: Remove experimental tables updated in
 memorder chapter
References: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <780a1a3c-db7c-af0a-4c6c-097474aa4478@gmail.com>
Date: Mon, 25 Sep 2017 07:04:51 +0900
MIME-Version: 1.0
In-Reply-To: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3e7f4562704eac72d3652613ea25aee2e00f176d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 23 Sep 2017 20:42:16 +0900
Subject: [PATCH 3/5] styleguide: Remove experimental tables updated in memorder chapter

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 112 ++-----------------------------------
 1 file changed, 4 insertions(+), 108 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 8bedbef..bb100a9 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -1383,114 +1383,10 @@ IBM~Q	& $0.015$
 \label{tab:app:styleguide:Refrigeration Power Consumption (arydshln-2)}
 \end{table}

-Tables~\ref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}
-and~\ref{tab:memorder:Memory Ordering: WRC Sequence of Events}
-recently added in Chapter~\ref{chp:memorder:Memory Ordering}
-can be typeset as
-Tables~\ref{tab:app:styleguide:Linux-Kernel Memory-Ordering Cheat Sheet}
-and~\ref{tab:app:styleguide:Memory Ordering: WRC Sequence of Events}
-using booktabs' ruled lines.
-
-\begin{table*}
-\small
-\centering\OneColumnHSpace{-0.7in}
-\renewcommand*{\arraystretch}{1.1}
-\rowcolors{7}{lightgray}{}
-\begin{tabular}{lcccccccccccc}\toprule
-	& & \multicolumn{4}{c}{Prior Ordered Operation} &
-		\multicolumn{6}{c}{Subsequent Ordered Operation} \\
-	\cmidrule(l){3-6} \cmidrule(l){7-13}
-	Operation Providing Ordering & C &
-		Self & R & W & RMW & Self & R & W & DR & DW & RMW & SV\\
-	\cmidrule(r){1-1} \cmidrule{2-2} \cmidrule(l){3-6} \cmidrule(l){7-13}
-	Write, for example, \tco{WRITE_ONCE()} &  &
-		   Y &   &   &     &      &   &   &    &    &     &  Y \\
-	Load, for example, \tco{READ_ONCE()} &  &
-		   Y &   &   &     &      &   &   &    &  Y &     &  Y \\
-	Unsuccessful RMW operation &  &
-		   Y &   &   &     &      &   &   &    &  Y &     &  Y \\
-	\tco{smp_read_barrier_depends()} &  &
-		     & Y &   &     &      &   &   &  Y &  Y &     &    \\
-	\tco{*_dereference()} &  &
-		   Y &   &   &     &      &   &   &  Y &  Y &     &  Y \\
-	Successful \tco{*_acquire()} &   &
-		   R &   &   &     &      & Y & Y &  Y &  Y &   Y &  Y \\
-	Successful \tco{*_release()} & C &
-		     & Y & Y &   Y &    W &   &   &    &    &     &  Y \\
-	\tco{smp_rmb()} &   &
-		     & Y &   &   R &      & Y &   &  Y &    &   R &    \\
-	\tco{smp_wmb()} &   &
-		     &   & Y &   W &      &   & Y &    &  Y &   W &    \\
-	\tco{smp_mb()} & CP &
-		     & Y & Y &   Y &      & Y & Y &  Y &  Y &   Y &    \\
-	Successful full-strength non-\tco{void} RMW & CP &
-		   Y & Y & Y &   Y &    Y & Y & Y &  Y &  Y &   Y &  Y \\
-	\tco{smp_mb__before_atomic()} & CP &
-		     & Y & Y &   Y &      & a & a & a  & a  &   Y &    \\
-	\tco{smp_mb__after_atomic()} & CP &
-		     & a & a &   Y &      & Y & Y &  Y &  Y &     &    \\
-	\bottomrule
-\end{tabular}
-
-\vspace{5pt}\hfill
-\framebox[\width]{\footnotesize\setlength{\tabcolsep}{3pt}
-\rowcolors{1}{}{}
-\begin{tabular}{lrl}
-	Key:	& C: & Ordering is cumulative \\
-		& P: & Ordering propagates \\
-		& R: & Read, for example, \tco{READ_ONCE()}, or read portion of RMW \\
-		& W: & Write, for example, \tco{WRITE_ONCE()}, or write portion of RMW \\
-		& Y: & Provides the specified ordering \\
-		& a: & Provides specified ordering given intervening RMW atomic operation \\
-		& DR: & Dependent read (address dependency, Section~\ref{sec:memorder:Address Dependencies}) \\
-		& DW: & Dependent write (address, data, or control dependency, Sections~\ref{sec:memorder:Address Dependencies}--\ref{sec:memorder:Control Dependencies}) \\
-		& RMW: & Atomic read-modify-write operation \\
-		& SV: & Same-variable access \\
-\end{tabular}
-}\OneColumnHSpace{-0.9in}
-\caption{Linux-Kernel Memory-Ordering Cheat Sheet}
-\label{tab:app:styleguide:Linux-Kernel Memory-Ordering Cheat Sheet}
-\end{table*}
-
-\begin{table*}
-\small
-\centering\OneColumnHSpace{-0.8in}
-\renewcommand*{\arraystretch}{1.1}
-\rowcolors{13}{lightgray}{}
-\begin{tabular}{rlllllll}\toprule
-	& \multicolumn{1}{c}{\tco{P0()}} & \multicolumn{2}{c}{\tco{P0()} \& \tco{P1()}} &
-		\multicolumn{1}{c}{\tco{P1()}} & \multicolumn{3}{c}{\tco{P2()}} \\
-	\cmidrule(l){2-2} \cmidrule(l){3-4} \cmidrule(lr){5-5} \cmidrule(l){6-8}
-	& Instruction & Store Buffer & Cache & Instruction &
-			Instruction & Store Buffer & Cache \\
-	\cmidrule{1-1} \cmidrule(l){2-2} \cmidrule(l){3-3} \cmidrule(l){4-4}
-		\cmidrule(lr){5-5} \cmidrule(l){6-6} \cmidrule(l){7-7} \cmidrule(l){8-8}
-	1 & (Initial state) & & \tco{y==0} &
-		(Initial state) &
-			(Initial state) & & \tco{x==0} \\
-	2 & \tco{x = 1;} & \tco{x==1} & \tco{y==0} &
-		 & & & \tco{x==0} \\
-	3 & (Read-Invalidate \tco{x}) & \tco{x==1} & \tco{y==0} & \tco{r1 = x} (1)
-		 & & & \tco{x==0} \\
-	4 &  & \tco{x==1} \tco{y==1} & \tco{y==0} & \tco{y = r1}
-		 & \tco{r2 = y} & & \tco{x==0} \\
-	5 &  & \tco{x==1} & \tco{y==1} & (Finish store)
-		 & (Read \tco{y}) & & \tco{x==0} \\
-	6 & (Respond \tco{y}) & \tco{x==1} & \tco{y==1} &
-		 & (\tco{r2==1}) & & \tco{x==0} \tco{y==1} \\
-	7 & & \tco{x==1} & \tco{y==1} &
-		 & \tco{smp_rmb()} & & \tco{x==0} \tco{y==1} \\
-	8 & & \tco{x==1} & \tco{y==1} &
-		 & \tco{r3 = x (0)} & & \tco{x==0} \tco{y==1} \\
-	9 & & \tco{x==1} & \tco{x==0} \tco{y==1} &
-		 & (Respond \tco{x}) & & \tco{y==1} \\
-	10 & (Finish store) & & \tco{x==1} \tco{y==1} &
-		 &  & & \tco{y==1} \\
-	\bottomrule
-\end{tabular}
-\caption{Memory Ordering: WRC Sequence of Events}
-\label{tab:app:styleguide:Memory Ordering: WRC Sequence of Events}
-\end{table*}
+Tables in Chapter~\ref{chp:memorder:Memory Ordering}
+have been recently converted to the scheme presented in this section.
+Refer to \path{memorder/memorder.tex}
+for examples of tables with complex headings.

 \floatstyle{plain}
 \restylefloat{table}
-- 
2.7.4


