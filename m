Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=tTuzAYtnjKtRbvfYQ0HED+BxbgNjhq/e7/XSzWiGwdI=;
 b=KMAqovbdR/A2QaoejX6PRGc0seW5eDciPe/lLHNrY5baCljz5c4chvk6l9tkV++WlN
 9SKq0PFBt2eidCI9jYtvxYCVBTHJs3GiLjGpNMcasZvd/h0cm+srZNmqn6E14LbPmbjp
 Z6heus4U2XqggdC9NQ+SxPaTKkkRGtc5xbsTXU3kW8vjQ/57iT+wdD8uWZivPptUs34a
 Q8cRIZIOp7HDBx8T3zlseb1BeXpiOw7+r0qO7qxXxyaN/2Q7DDVIQesWD5TY5LJ/UWwe
 p+7B5l/HqtFfOw2RH2ZYaDrw8U3qXueCimb7eu9fmtvlzRJ/puXMayw1ALrxAgukQdJj
 g0Tw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Transpose table 'Summary of Memory Ordering'
Message-ID: <d5818d00-416b-95fd-1be7-231f1b747162@gmail.com>
Date: Wed, 13 Sep 2017 00:40:03 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e74f9eb7cdc5cd21ca4cbc33dcd57d210585d492 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 13 Sep 2017 00:16:54 +0900
Subject: [PATCH] memorder: Transpose table 'Summary of Memory Ordering'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Now that this table gets wide, isn't it a good idea to transpose the table?
Then the tall heading of questions can be placed horizontally and should be
easier to read.

This patch is my attempt to do so.

You might want to keep CPU families in rows, so I'm not pushing the
conversion.

Transposed one is easier to be converted with booktabs' rules and
alternately colored rows, I suppose.

Thoughts?

      Thanks, Akira 
--
 memorder/memorder.tex | 145 +++++++++++++++++++++++++++-----------------------
 1 file changed, 78 insertions(+), 67 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index ac03c23..0a3ab28 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3702,78 +3702,89 @@ dependencies.
 \begin{table*}
 \small
 \centering
-\begin{tabular}{l|c|c|c|c|c|c|c|c|c|c||c|c|c}
-	~ & \multicolumn{10}{c||}{Memory Ordering} &
-		\multicolumn{3}{c}{Instructions} \\
-	\cline{2-14}
-	~ ~ ~ ~ ~ ~ ~ ~ ~
-	& \begin{picture}(6,200)(0,0)
-		\rotatebox{90}{Loads Reordered After Loads or Stores?}
+\renewcommand*{\arraystretch}{1.2}
+\begin{tabular}{l|p{2in}|c|c|c|c|c|c|c|c|c|c|c}
+	\multicolumn{2}{l|}{~}
+	& \begin{picture}(6,60)(0,0)
+		\rotatebox{90}{Alpha}
 	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Stores Reordered After Stores?}
+	& \begin{picture}(6,60)(0,0)
+		\rotatebox{90}{ARMv8}
 	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Stores Reordered After Loads?}
+	& \begin{picture}(6,60)(0,0)
+		\rotatebox{90}{ARMv7-A/R}
 	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Atomic Instructions Reordered With Loads or Stores?}
+	& \begin{picture}(6,60)(0,0)
+		\rotatebox{90}{Itanium}
 	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Dependent Loads Reordered?}
+	& \begin{picture}(6,60)(0,0)
+		\rotatebox{90}{MIPS}
 	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Dependent Stores Reordered?}
+	& \begin{picture}(6,60)(0,0)
+		\rotatebox{90}{(PA-RISC)}
 	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Non-Sequentially Consistent?}
+	& \begin{picture}(6,60)(0,0)
+		\rotatebox{90}{PA-RISC CPUs}
 	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Non-Multicopy Atomic?}
+	& \begin{picture}(6,60)(0,0)
+		\rotatebox{90}{POWER}
 	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Non-Other-Multicopy Atomic?}
+	& \begin{picture}(6,60)(0,0)
+		\rotatebox{90}{SPARC TSO}
 	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Non-Cache Coherent?}
+	& \begin{picture}(6,60)(0,0)
+		\rotatebox{90}{x86}
 	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Load-Acquire/Store-Release?}
-	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Atomic RMW Instruction Type?}
-	  \end{picture}
-	& \begin{picture}(6,185)(0,0)
-		\rotatebox{90}{Incoherent Instruction Cache/Pipeline?}
+	& \begin{picture}(6,60)(0,0)
+		\rotatebox{90}{z~Systems}
 	  \end{picture}
 	\\
 	\hline
-%			 R_  WW  WR  A_    DR  DW NSC  NM NOM NCC  LA RMW  IC
-	\hline
-	Alpha		& Y & Y & Y & Y   & Y & ~ & Y & Y & Y & ~ & F & L & Y \\
-	\hline
-	ARMv8		& Y & Y & Y & Y   & ~ & ~ & Y & Y & ~ & ~ & i & L & Y \\
-	\hline
-	ARMv7-A/R	& Y & Y & Y & Y   & ~ & ~ & Y & Y & Y & ~ & F & L & Y \\
-	\hline
-	Itanium		& Y & Y & Y & ~   & ~ & ~ & Y & Y & Y & Y & I & C & Y \\
-	\hline
-	MIPS		& Y & Y & Y & Y   & ~ & ~ & Y & Y & Y & ~ & ? & L & Y \\
-	\hline
-	(PA-RISC)	& Y & Y & Y & ~   & ~ & ~ & ~ & Y & ~ & ~ & ? & ? & ~ \\
-	\hline
-	PA-RISC CPUs	& ~ & ~ & ~ & ~   & ~ & ~ & Y & ~ & ~ & ~ & ~ & ? & ~ \\
-	\hline
-	POWER\textsuperscript{\texttrademark}
-			& Y & Y & Y & Y   & ~ & ~ & Y & Y & Y & ~ & b & L & Y \\
-	\hline
-	SPARC TSO	& ~ & ~ & Y & ~   & ~ & ~ & Y & Y & ~ & ~ & ~ & ? & Y \\
+%		 Alpha ARMv8 ARMv7 Itanium MIPS PA-RISC -CPUs PPC SPARC x86 z Systems
 	\hline
-	x86		& ~ & ~ & Y & ~   & ~ & ~ & Y & Y & ~ & ~ & ~ & C & Y \\
+        Memory Ordering
+	& Loads Reordered After Loads or Stores?
+		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & ~   & ~ & ~ \\
+	\cline{2-13}
+	& Stores Reordered After Stores?
+		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & ~   & ~ & ~ \\
+	\cline{2-13}
+	& Stores Reordered After Loads?
+		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & Y \\
+	\cline{2-13}
+	& Atomic Instructions Reordered With Loads or Stores?
+		 & Y   & Y   & Y   & ~     & Y  & ~     & ~   & Y & ~   & ~ & ~ \\
+	\cline{2-13}
+	& Dependent Loads Reordered?
+		 & Y   & ~   & ~   & ~     & ~  & ~     & ~   & ~ & ~   & ~ & ~ \\
+	\cline{2-13}
+	& Dependent Stores Reordered?
+		 & ~   & ~   & ~   & ~     & ~  & ~     & ~   & ~ & ~   & ~ & ~ \\
+	\cline{2-13}
+	& Non-Sequencially Consistent?
+		 & Y   & Y   & Y   & Y     & Y  & ~     & Y   & Y & Y   & Y & Y \\
+	\cline{2-13}
+	& Non-Multicopy Atomic?
+		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & ~ \\
+	\cline{2-13}
+	& Non-Other-Multicopy Atomic?
+		 & Y   & ~   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & ~ \\
+	\cline{2-13}
+	& Non-Cache Coherent?
+		 & ~   & ~   & ~   & Y     & ~  & ~     & ~   & ~ & ~   & ~ & ~ \\
 	\hline
-	z~Systems\textsuperscript{\textregistered}
-			& ~ & ~ & Y & ~   & ~ & ~ & Y & ~ & ~ & ~ & ~ & C & Y \\
+        \hline
+        Instructions
+	& Load-Acquire/Store-Release?
+		 & F   & i   & F   & I     & ?  & ?     & ~   & b & ~   & ~ & ~ \\
+        \cline{2-13}
+	& Atomic RMW Instruction Type?
+		 & L   & L   & L   & C     & L  & ?     & ?   & L & ?   & C & C \\
+        \cline{2-13}
+	& Incoherent Instruction Cache/Pipeline?
+		 & Y   & Y   & Y   & Y     & Y  & ~     & ~   & Y & Y   & Y & Y \\
 \end{tabular}
+\renewcommand*{\arraystretch}{1}
 \begin{tabular}{llcl}
 	~ & ~ & ~ & ~\\
 	{ \bf Key: } & ~ & ~ & ~ \\
@@ -3803,19 +3814,19 @@ For full details, see the reference manual for the CPU of interest.

 Getting back to
 Table~\ref{tab:memorder:Summary of Memory Ordering},
-the the first group of columns look at memory-ordering
+the first group of rows look at memory-ordering
 properties and the second group looks at instruction properties.

-The first three columns indicate whether a given CPU allows the four
+The first three rows indicate whether a given CPU allows the four
 possible combinations of loads and stores to be reordered, as discussed
 in
 Sections~\ref{sec:memorder:Ordering: Why and How?} and
 \ref{sec:memorder:Load Followed By Load}--\ref{sec:memorder:Store Followed By Store}.
-The next column (``Atomic Instructions Reordered With Loads or Stores?'')
+The next row (``Atomic Instructions Reordered With Loads or Stores?'')
 indicates whether a given CPU allows loads and stores
 to be reordered with atomic instructions.

-The fifth and sixth columns cover reordering and dependencies,
+The fifth and sixth rows cover reordering and dependencies,
 which was covered in
 Sections~\ref{sec:memorder:Address Dependencies}--\ref{sec:memorder:Control Dependencies}
 and which is explained in more detail in
@@ -3823,24 +3834,24 @@ Section~\ref{sec:memorder:Alpha}.
 The short version is that Alpha requires memory barriers for readers
 as well as updaters of linked data structures.

-The next column, ``Non-Sequentially Consistent'', indicates whether
+The next row, ``Non-Sequentially Consistent'', indicates whether
 the CPU's normal load and store instructions are constrained by
 sequential consistency.
 Almost all are not constrained in this way for performance reasons.

-The next two columns cover multicopy atomicity, which was defined in
+The next two rows cover multicopy atomicity, which was defined in
 Section~\ref{sec:memorder:Multicopy Atomicity}.
 The first is full-up (and rare) multicopy atomicity, and the second is the
 weaker other-multicopy atomicity.

-The next column, ``Non-Cache Coherent'', covers accesses from multiple
+The next row, ``Non-Cache Coherent'', covers accesses from multiple
 threads to a single variable, which was discussed in
 Section~\ref{sec:memorder:Cache Coherence}.

-The final three columns cover instruction-level choices and issues.
-The first column indicates how each CPU implements load-acquire
-and store-release, the second column classifies CPUs by atomic-instruction
-type, and the third and final column
+The final three rows cover instruction-level choices and issues.
+The first row indicates how each CPU implements load-acquire
+and store-release, the second row classifies CPUs by atomic-instruction
+type, and the third and final row
 indicates whether a given CPU has an incoherent
 instruction cache and pipeline.
 Such CPUs require special instructions be executed for self-modifying
-- 
2.7.4

