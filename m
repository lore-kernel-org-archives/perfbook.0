Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ENwM8y5Db+bBRmGmKQN5DzfMNIDTGGUZOXqc6a/K+eM=;
 b=MzD7uvy6jd4rCcns8jjSGLEKTmwqB1ci5UcWpQRDahQ7BfOCMg2FfwwAPwuVGkL7j9
 aU73P7D+6/KmwxJzw5B4ljV61G3NdUoKXQAI0gtorhwmZc5CnpVvu+3RLm8o+7mmiEFg
 RlqsrsIZkRVdVCJoCMtNZK3s4Zlbii4gEWtJsQVmiyI8O9fmHqw9HD7RIqulJgPNBwEF
 aIFURSUZ4osczTxDCzjbetZcvijFT6sLIlB7moNAM4u1hud2HggRQlbL+ejV3dSOdLAO
 ts1w3coaagQXMO/uu/kL/CRuOyNHckkWFGv4hl12Mg1P4Rsr4W85Qlc5YGLxHdSBEx7r
 wSDQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/3] whymb: fix trivial typos
Date: Sun, 20 Mar 2016 09:24:19 +0900
Message-Id: <1458433461-20936-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1458433461-20936-1-git-send-email-sj38.park@gmail.com>
References: <1458433461-20936-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit fixes trivial typos in `whymemorybarriers.tex` file.  The
trivial typos are missed tildes, few grammatical typos, wrong position
of sentence ending dot, and an evident typo (s/HIPS/MIPS).

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 86 ++++++++++++++++++------------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 856961f..8025bec 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -618,10 +618,10 @@ to a given item of data, its performance for the first write to
 a given cache line is quite poor.
 To see this, consider
 Figure~\ref{fig:app:whymb:Writes See Unnecessary Stalls},
-which shows a timeline of a write by CPU 0 to a cacheline held in
-CPU 1's cache.
-Since CPU 0 must wait for the cache line to arrive before it can
-write to it, CPU 0 must stall for an extended period of time.\footnote{
+which shows a timeline of a write by CPU~0 to a cacheline held in
+CPU~1's cache.
+Since CPU~0 must wait for the cache line to arrive before it can
+write to it, CPU~0 must stall for an extended period of time.\footnote{
 	The time required to transfer a cache line from one CPU's cache
 	to another's is typically a few orders of magnitude more than
 	that required to execute a simple register-to-register instruction.}
@@ -635,9 +635,9 @@ write to it, CPU 0 must stall for an extended period of time.\footnote{
 \label{fig:app:whymb:Writes See Unnecessary Stalls}
 \end{figure}

-But there is no real reason to force CPU 0 to stall for so long --- after
-all, regardless of what data happens to be in the cache line that CPU 1
-sends it, CPU 0 is going to unconditionally overwrite it.
+But there is no real reason to force CPU~0 to stall for so long --- after
+all, regardless of what data happens to be in the cache line that CPU~1
+sends it, CPU~0 is going to unconditionally overwrite it.

 \subsection{Store Buffers}
 \label{sec:app:whymb:Store Buffers}
@@ -645,9 +645,9 @@ sends it, CPU 0 is going to unconditionally overwrite it.
 One way to prevent this unnecessary stalling of writes is to add
 ``store buffers'' between each CPU and its cache, as shown in
 Figure~\ref{fig:app:whymb:Caches With Store Buffers}.
-With the addition of these store buffers, CPU 0 can simply record
+With the addition of these store buffers, CPU~0 can simply record
 its write in its store buffer and continue executing.
-When the cache line does finally make its way from CPU 1 to CPU 0,
+When the cache line does finally make its way from CPU~1 to CPU~0,
 the data will be moved from the store buffer to the cache line.

 \QuickQuiz{}
@@ -711,26 +711,26 @@ Figure~\ref{fig:app:whymb:Caches With Store Buffers},
 one would be surprised.
 Such a system could potentially see the following sequence of events:
 \begin{enumerate}
-\item	CPU 0 starts executing the \co{a = 1}.
-\item	CPU 0 looks ``a'' up in the cache, and finds that it is missing.
-\item	CPU 0 therefore sends a ``read invalidate'' message in order to
+\item	CPU~0 starts executing the \co{a = 1}.
+\item	CPU~0 looks ``a'' up in the cache, and finds that it is missing.
+\item	CPU~0 therefore sends a ``read invalidate'' message in order to
 	get exclusive ownership of the cache line containing ``a''.
-\item	CPU 0 records the store to ``a'' in its store buffer.
-\item	CPU 1 receives the ``read invalidate'' message, and responds
+\item	CPU~0 records the store to ``a'' in its store buffer.
+\item	CPU~1 receives the ``read invalidate'' message, and responds
 	by transmitting the cache line and removing that cacheline from
 	its cache.
-\item	CPU 0 starts executing the \co{b = a + 1}.
-\item	CPU 0 receives the cache line from CPU 1, which still has
+\item	CPU~0 starts executing the \co{b = a + 1}.
+\item	CPU~0 receives the cache line from CPU~1, which still has
 	a value of zero for ``a''.
-\item	CPU 0 loads ``a'' from its cache, finding the value zero.
+\item	CPU~0 loads ``a'' from its cache, finding the value zero.
 	\label{item:app:whymb:Need Store Buffer}
-\item	CPU 0 applies the entry from its store buffer to the newly
+\item	CPU~0 applies the entry from its store buffer to the newly
 	arrived cache line, setting the value of ``a'' in its cache
 	to one.
-\item	CPU 0 adds one to the value zero loaded for ``a'' above,
+\item	CPU~0 adds one to the value zero loaded for ``a'' above,
 	and stores it into the cache line containing ``b''
-	(which we will assume is already owned by CPU 0).
-\item	CPU 0 executes \co{assert(b == 2)}, which fails.
+	(which we will assume is already owned by CPU~0).
+\item	CPU~0 executes \co{assert(b == 2)}, which fails.
 \end{enumerate}

 The problem is that we have two copies of ``a'', one in the cache and
@@ -788,7 +788,7 @@ with variables ``a'' and ``b'' initially zero:

 Suppose CPU~0 executes foo() and CPU~1 executes bar().
 Suppose further that the cache line containing ``a'' resides only in CPU~1's
-cache, and that the cache line containing ``b'' is owned by CPU 0.
+cache, and that the cache line containing ``b'' is owned by CPU~0.
 Then the sequence of operations might be as follows:
 \begin{enumerate}
 \item	CPU~0 executes \co{a = 1}.  The cache line is not in
@@ -1366,9 +1366,9 @@ Each of ``a'', ``b'', and ``c'' are initially zero.
 \small
 \begin{center}
 \begin{tabular}{l|l|l}
-	\multicolumn{1}{c|}{CPU 0} &
-		\multicolumn{1}{c|}{CPU 1} &
-			\multicolumn{1}{c}{CPU 2} \\
+	\multicolumn{1}{c|}{CPU~0} &
+		\multicolumn{1}{c|}{CPU~1} &
+			\multicolumn{1}{c}{CPU~2} \\
 	\hline
 	\hline
 	\co{a = 1;}	 &		& \\
@@ -1427,9 +1427,9 @@ Both ``a'' and ``b'' are initially zero.
 \small
 \begin{center}
 \begin{tabular}{l|l|l}
-	\multicolumn{1}{c|}{CPU 0} &
-		\multicolumn{1}{c|}{CPU 1} &
-			\multicolumn{1}{c}{CPU 2} \\
+	\multicolumn{1}{c|}{CPU~0} &
+		\multicolumn{1}{c|}{CPU~1} &
+			\multicolumn{1}{c}{CPU~2} \\
 	\hline
 	\hline
 	\co{a = 1;} & \co{while (a == 0)}; & \\
@@ -1470,9 +1470,9 @@ All variables are initially zero.
 \scriptsize
 \begin{center}
 \begin{tabular}{r|l|l|l}
-	& \multicolumn{1}{c|}{CPU 0} &
-		\multicolumn{1}{c|}{CPU 1} &
-			\multicolumn{1}{c}{CPU 2} \\
+	& \multicolumn{1}{c|}{CPU~0} &
+		\multicolumn{1}{c|}{CPU~1} &
+			\multicolumn{1}{c}{CPU~2} \\
 	\hline
 	\hline
  1 &	\co{a = 1;} &			& \\
@@ -1521,7 +1521,7 @@ Therefore, CPU~2's assertion on line~9 is guaranteed \emph{not} to fire.
 	Table~\ref{tab:app:whymb:Memory Barrier Example 3},
 	would this assert ever trigger?
 \QuickQuizAnswer{
-	The result depends on whether the CPU supports ``transitivity.''
+	The result depends on whether the CPU supports ``transitivity''.
 	In other words, CPU~0 stored to ``e'' after seeing CPU~1's
 	store to ``c'', with a memory barrier between CPU~0's load
 	from ``c'' and store to ``e''.
@@ -1728,7 +1728,7 @@ Figure~\ref{fig:app:whymb:Insert and Lock-Free Search}.
 This {\tt smp\_wmb()} on line~9 of this figure
 guarantees that the element initialization
 in lines 6-8 is executed before the element is added to the
-list on line 10, so that the lock-free search will work correctly.
+list on line~10, so that the lock-free search will work correctly.
 That is, it makes this guarantee on all CPUs {\em except} Alpha.

 \begin{figure}
@@ -1767,25 +1767,25 @@ That is, it makes this guarantee on all CPUs {\em except} Alpha.
 \end{figure}

 Alpha has extremely weak memory ordering
-such that the code on line 20 of
+such that the code on line~20 of
 Figure~\ref{fig:app:whymb:Insert and Lock-Free Search} could see the old
-garbage values that were present before the initialization on lines 6-8.
+garbage values that were present before the initialization on lines~6-8.

 Figure~\ref{fig:app:whymb:Why smp-read-barrier-depends() is Required}
 shows how this can happen on
 an aggressively parallel machine with partitioned caches, so that
-alternating caches lines are processed by the different partitions
+alternating cache lines are processed by the different partitions
 of the caches.
 Assume that the list header {\tt head} will be processed by cache bank~0,
 and that the new element will be processed by cache bank~1.
 On Alpha, the {\tt smp\_wmb()} will guarantee that the cache invalidates performed
-by lines 6-8 of
+by lines~6-8 of
 Figure~\ref{fig:app:whymb:Insert and Lock-Free Search} will reach
-the interconnect before that of line 10 does, but
+the interconnect before that of line~10 does, but
 makes absolutely no guarantee about the order in which the new values will
 reach the reading CPU's core.
-For example, it is possible that the reading CPU's cache bank 1 is very
-busy, but cache bank 0 is idle.
+For example, it is possible that the reading CPU's cache bank~1 is very
+busy, but cache bank~0 is idle.
 This could result in the cache invalidates for the new element being
 delayed, so that the reading CPU gets the new value for the pointer,
 but sees the old cached values for the new element.
@@ -1976,8 +1976,8 @@ different set of memory-barrier instructions~\cite{ARMv7A:2010}:
 	pipeline, so that all instructions following the \co{ISB}
 	are fetched only after the \co{ISB} completes.
 	For example, if you are writing a self-modifying program
-	(such as a JIT), you should execute an \co{ISB} after
-	between generating the code and executing it.
+	(such as a JIT), you should execute an \co{ISB} between
+	generating the code and executing it.
 \end{enumerate}

 None of these instructions exactly match the semantics of Linux's
@@ -2108,7 +2108,7 @@ definition of transitivity or cumulativity similar to that of
 ARM and Power.
 However, it appears that different MIPS implementations can have
 different memory-ordering properties, so it is important to consult
-the documentation for the specific HIPS implementation you are using.
+the documentation for the specific MIPS implementation you are using.

 \subsection{PA-RISC}

-- 
1.9.1

