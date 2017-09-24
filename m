Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3fF/4L+x3C45q7QUfteLcSzPMYP4x5nWprwG1lNJ/OQ=;
 b=HdH7mOeLr62iHUYJjhsmrjJqRtGL37hKXIBvC+4H3JekMj00DJV//SUKXqt1gyvf7o
 CD6AdaasIJD2Tn/0HeMzPCLIUOsJ1vsp1lxQ0hU3wTE9/JJqFr6QlOm+kMl6aL2jg/Kn
 K5BNgt58h5lwbbrrM1ISzs1xKDsw5wQtiMpQXiPt7bGs1U8muN9txq23bAb0cPyOOyvf
 tCCUmFiwkCYvGz/jEGR885kK7AbGIHIZHV9pMiVFfwRgNx5qKKgBNu3OYduKmxrCuG3p
 +Lr8lwYW+4if0+rh0/G6wC7jRHHCFrezhPfGqTOcUZs15jx3d1KVP3+FSMtxKN7z9KO6
 3O1A==
Subject: [PATCH 2/5] memorder: Convert 'Summary of Memory Ordering' table to
 new scheme
References: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b9ede7b2-e505-b7b0-2f91-d0065de07014@gmail.com>
Date: Mon, 25 Sep 2017 07:03:20 +0900
MIME-Version: 1.0
In-Reply-To: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3834226426b8a0f5f6b032b1167e02fbe7ef7b15 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 23 Sep 2017 20:14:03 +0900
Subject: [PATCH 2/5] memorder: Convert 'Summary of Memory Ordering' table to new scheme

Employ alternate-row coloring scheme to the remaining table in this
chapter.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 47 ++++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index f393e33..00ff31c 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3675,12 +3675,14 @@ dependencies.
 \label{sec:memorder:Hardware Specifics}
 \OriginallyPublished{Appendix}{sec:memorder:Hardware Specifics}{Memory-Barrier Instructions For Specific CPUs}{Linux Journal}{PaulMcKenney2005i,PaulMcKenney2005j}

-\begin{table*}
+\begin{table*}[tbh]
+\rowcolors{4}{}{lightgray}
 \small
 \centering
 \renewcommand*{\arraystretch}{1.2}\OneColumnHSpace{-.6in}
-\begin{tabular}{l|p{2in}|c|c|c|c|c|c|c|c|c|c|c}
-	\multicolumn{2}{l|}{~}
+\begin{tabular}{lp{2in}ccccccccccc}
+	\toprule
+	\multicolumn{2}{l}{~}
 	& \begin{picture}(6,60)(0,0)
 		\rotatebox{90}{Alpha}
 	  \end{picture}
@@ -3715,56 +3717,54 @@ dependencies.
 		\rotatebox{90}{z~Systems}
 	  \end{picture}
 	\\
-	\hline
+	\cmidrule(r){1-2} \cmidrule{3-13}
 %		 Alpha ARMv8 ARMv7 Itanium MIPS PA-RISC -CPUs PPC SPARC x86 z Systems
-	\hline
-        Memory Ordering
+\cellcolor{white}
+	Memory Ordering
 	& Loads Reordered After Loads or Stores?
 		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & ~   & ~ & ~ \\
-	\cline{2-13}
 	& Stores Reordered After Stores?
 		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & ~   & ~ & ~ \\
-	\cline{2-13}
+\cellcolor{white}
 	& Stores Reordered After Loads?
 		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & Y \\
-	\cline{2-13}
 	& Atomic Instructions Reordered With Loads or Stores?
 		 & Y   & Y   & Y   & ~     & Y  & ~     & ~   & Y & ~   & ~ & ~ \\
-	\cline{2-13}
+\cellcolor{white}
 	& Dependent Loads Reordered?
 		 & Y   & ~   & ~   & ~     & ~  & ~     & ~   & ~ & ~   & ~ & ~ \\
-	\cline{2-13}
 	& Dependent Stores Reordered?
 		 & ~   & ~   & ~   & ~     & ~  & ~     & ~   & ~ & ~   & ~ & ~ \\
-	\cline{2-13}
+\cellcolor{white}
 	& Non-Sequentially Consistent?
 		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & Y \\
-	\cline{2-13}
 	& Non-Multicopy Atomic?
 		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & ~ \\
-	\cline{2-13}
+\cellcolor{white}
 	& Non-Other-Multicopy Atomic?
 		 & Y   & ~   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & ~ \\
-	\cline{2-13}
 	& Non-Cache Coherent?
 		 & ~   & ~   & ~   & Y     & ~  & ~     & ~   & ~ & ~   & ~ & ~ \\
-	\hline
-        \hline
-        Instructions
+	\cmidrule(r){1-2} \cmidrule{3-13}
+\cellcolor{white}
+	Instructions
 	& Load-Acquire/Store-Release?
 		 & F   & i   & F   & I     & ?  & ?     & ~   & b & ~   & ~ & ~ \\
-        \cline{2-13}
 	& Atomic RMW Instruction Type?
 		 & L   & L   & L   & C     & L  & ?     & ?   & L & ?   & C & C \\
-        \cline{2-13}
+\cellcolor{white}
 	& Incoherent Instruction Cache/Pipeline?
 		 & Y   & Y   & Y   & Y     & Y  & ~     & ~   & Y & Y   & Y & Y \\
+	\bottomrule
 \end{tabular}
+
+\vspace{5pt}\hfill
+\framebox[\width]{\footnotesize\setlength{\tabcolsep}{3pt}
+\rowcolors{1}{}{}
 \renewcommand*{\arraystretch}{1}
 \begin{tabular}{llcl}
-	~ & ~ & ~ & ~\\
-	{ \bf Key: } & ~ & ~ & ~ \\
-	~ & \multicolumn{3}{l}{Load-Acquire/Store-Release?} \\
+	{ \bf Key: }
+	  & \multicolumn{3}{l}{Load-Acquire/Store-Release?} \\
 	~ & ~ & b: & Lightweight memory barrier \\
 	~ & ~ & F: & Full memory barrier \\
 	~ & ~ & i: & Instruction with lightweight ordering \\
@@ -3773,6 +3773,7 @@ dependencies.
 	~ & ~ & C: & Compare-and-exchange instruction \\
 	~ & ~ & L: & Load-linked/store-conditional instruction \\
 \end{tabular}
+}\OneColumnHSpace{-0.7in}
 \caption{Summary of Memory Ordering}
 \label{tab:memorder:Summary of Memory Ordering}
 \end{table*}
-- 
2.7.4


