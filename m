Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z3OLCaCRf1Gq5SwWvRS3RLM5ZJpad8olYMOjddsmOiI=;
        b=W/FxSOYWLFT6A0vKomB9nMliYfA1fvxQiRQi6WAsDVdwVJ3/bgOVSNmQyRBiX8ourw
         wBshLpkaEpV/xCXX/EO31CGclYzsbc6UANggxKSxvYgKkSXtKhGz6jWDp09SDQeXF8h9
         0isYok7VnWUcXPMjoNZooIXg5dsiQus+if2m9KrAgwfMGt6tMMZ30tVzlMdFboBvl6TM
         pIniP30qYR/OXI/dd6BXQU9aJ59yL98pUyjzEKU/GKadBgsGsGgl5iF4SM1mUbov7HGX
         NFxE2dh7NyVx2tynCYxzKEXuRaVVJ4iE50KHLyRyDgv3Xu8Si0QfogcCIYPqtQZRqOCE
         NnSg==
Subject: [PATCH 1/3] formal/spinhint: Add result of 3 readers 3 updaters QRCU
 Spin run
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
 <20190202173437.GO4240@linux.ibm.com>
 <d48a0e7f-6869-86ac-6edf-a47c33cdaeb7@gmail.com>
 <20190207091757.GE4240@linux.ibm.com>
 <152110af-bf63-2b7b-d48a-52484589de9d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a83e948f-d241-be30-733b-87975452fd1a@gmail.com>
Date: Tue, 12 Feb 2019 00:11:23 +0900
MIME-Version: 1.0
In-Reply-To: <152110af-bf63-2b7b-d48a-52484589de9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fe701731c7296b90deae52747f5f3be556511289 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 10 Feb 2019 00:02:26 +0900
Subject: [PATCH 1/3] formal/spinhint: Add result of 3 readers 3 updaters QRCU Spin run

By using the compiler flag "-DMA=N", run of qrcu.spin with 3 readers
and 3 updaters can be completed with the memory usage of 6.5GHz.

This commit adds the result and the command used to run the
verification. A Quick Quiz is added to present an indirect
evidence of search completeness.

As the compiler flag "-DCOLLAPSE" generates much faster code,
memory usage table with "-DCOLLAPSE" is kept. The complete
table for the runs with the flag "-DMA=N" is added as another
table.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../formal/promela/atomicincrement.spin.lst        |   2 +-
 CodeSamples/formal/promela/increment.spin.lst      |   2 +-
 CodeSamples/formal/promela/lock.spin.lst           |   2 +-
 CodeSamples/formal/promela/qrcu.spin.33ma.lst      |  37 +++++
 .../formal/promela/qrcu.spin.col-ma.diff.lst       |  48 +++++++
 formal/spinhint.tex                                | 150 ++++++++++++++++++++-
 6 files changed, 234 insertions(+), 7 deletions(-)
 create mode 100644 CodeSamples/formal/promela/qrcu.spin.33ma.lst
 create mode 100644 CodeSamples/formal/promela/qrcu.spin.col-ma.diff.lst

diff --git a/CodeSamples/formal/promela/atomicincrement.spin.lst b/CodeSamples/formal/promela/atomicincrement.spin.lst
index ab9150b..61dbe54 100644
--- a/CodeSamples/formal/promela/atomicincrement.spin.lst
+++ b/CodeSamples/formal/promela/atomicincrement.spin.lst
@@ -16,7 +16,7 @@ hash conflicts:         0 (resolved)
 
 Stats on memory usage (in Megabytes):
     0.004       equivalent memory usage for states
-                (stored*(State-vector + overhead))
+                  (stored*(State-vector + overhead))
     0.290       actual memory usage for states
   128.000       memory used for hash table (-w24)
     0.534       memory used for DFS stack (-m10000)
diff --git a/CodeSamples/formal/promela/increment.spin.lst b/CodeSamples/formal/promela/increment.spin.lst
index 2cab90f..c6765be 100644
--- a/CodeSamples/formal/promela/increment.spin.lst
+++ b/CodeSamples/formal/promela/increment.spin.lst
@@ -21,7 +21,7 @@ hash conflicts:         0 (resolved)
 
 Stats on memory usage (in Megabytes):
     0.003       equivalent memory usage for states
-                (stored*(State-vector + overhead))
+                  (stored*(State-vector + overhead))
     0.290       actual memory usage for states
   128.000       memory used for hash table (-w24)
     0.534       memory used for DFS stack (-m10000)
diff --git a/CodeSamples/formal/promela/lock.spin.lst b/CodeSamples/formal/promela/lock.spin.lst
index c9e9efd..807a732 100644
--- a/CodeSamples/formal/promela/lock.spin.lst
+++ b/CodeSamples/formal/promela/lock.spin.lst
@@ -16,7 +16,7 @@ hash conflicts:         0 (resolved)
 
 Stats on memory usage (in Megabytes):
     0.044       equivalent memory usage for states
-                (stored*(State-vector + overhead))
+                  (stored*(State-vector + overhead))
     0.288       actual memory usage for states
   128.000       memory used for hash table (-w24)
     0.534       memory used for DFS stack (-m10000)
diff --git a/CodeSamples/formal/promela/qrcu.spin.33ma.lst b/CodeSamples/formal/promela/qrcu.spin.33ma.lst
new file mode 100644
index 0000000..bd43b4c
--- /dev/null
+++ b/CodeSamples/formal/promela/qrcu.spin.33ma.lst
@@ -0,0 +1,37 @@
+(Spin Version 6.4.6 -- 2 December 2016)
+        + Partial Order Reduction
+        + Graph Encoding (-DMA=96)
+
+Full statespace search for:
+        never claim             - (none specified)
+        assertion violations    +
+        cycle checks            - (disabled by -DSAFETY)
+        invalid end states      +
+
+State-vector 96 byte, depth reached 2055621, errors: 0
+MA stats: -DMA=84 is sufficient
+Minimized Automaton:    56420520 nodes and 1.75128e+08 edges
+9.6647071e+09 states, stored
+9.7503813e+09 states, matched
+1.9415088e+10 transitions (= stored+matched)
+7.2047951e+09 atomic steps
+
+Stats on memory usage (in Megabytes):
+1142905.887     equivalent memory usage for states
+                  (stored*(State-vector + overhead))
+ 5448.879       actual memory usage for states
+                  (compression: 0.48%)
+ 1068.115       memory used for DFS stack (-m20000000)
+    1.619       memory lost to fragmentation
+ 6515.375       total actual memory usage
+
+unreached in proctype qrcu_reader
+        (0 of 18 states)
+unreached in proctype qrcu_updater
+        qrcu.spin:102, state 82, "-end-"
+        (1 of 82 states)
+unreached in init
+        (0 of 23 states)
+
+pan: elapsed time 2.72e+05 seconds
+pan: rate 35500.523 states/second
diff --git a/CodeSamples/formal/promela/qrcu.spin.col-ma.diff.lst b/CodeSamples/formal/promela/qrcu.spin.col-ma.diff.lst
new file mode 100644
index 0000000..61e527d
--- /dev/null
+++ b/CodeSamples/formal/promela/qrcu.spin.col-ma.diff.lst
@@ -0,0 +1,48 @@
+@@ -1,6 +1,6 @@
+ (Spin Version 6.4.6 -- 2 December 2016)
+         + Partial Order Reduction
+-        + Compression
++        + Graph Encoding (-DMA=88)
+
+ Full statespace search for:
+         never claim             - (none specified)
+@@ -9,27 +9,22 @@
+         invalid end states      +
+
+ State-vector 88 byte, depth reached 328014, errors: 0
++MA stats: -DMA=77 is sufficient
++Minimized Automaton:    2084798 nodes and 6.38445e+06 edges
+ 1.8620286e+08 states, stored
+ 1.7759831e+08 states, matched
+ 3.6380117e+08 transitions (= stored+matched)
+ 1.3724093e+08 atomic steps
+-hash conflicts: 1.1445626e+08 (resolved)
+
+ Stats on memory usage (in Megabytes):
+ 20598.919       equivalent memory usage for states
+                   (stored*(State-vector + overhead))
+- 8418.559       actual memory usage for states
+-                  (compression: 40.87%)
+-                state-vector as stored =
+-                  19 byte + 28 byte overhead
+- 2048.000       memory used for hash table (-w28)
++  204.907       actual memory usage for states
++                  (compression: 0.99%)
+    17.624       memory used for DFS stack (-m330000)
+-    1.509       memory lost to fragmentation
+-10482.675       total actual memory usage
++  222.388       total actual memory usage
+
+-nr of templates: [ 0:globals 1:chans 2:procs ]
+-collapse counts: [ 0:1021 2:32 3:1869 4:2 ]
+ unreached in proctype qrcu_reader
+         (0 of 18 states)
+ unreached in proctype qrcu_updater
+@@ -38,5 +33,5 @@
+ unreached in init
+         (0 of 23 states)
+
+-pan: elapsed time 369 seconds
+-pan: rate 505107.58 states/second
++pan: elapsed time 2.68e+03 seconds
++pan: rate 69453.282 states/second
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 53e674a..bbbaa10 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -240,7 +240,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 \begin{description}[style=nextline]
 \item	[\tco{spin -a qrcu.spin}]
 	Create a file \path{pan.c} that fully searches the state machine.
-\item	[\tco{cc -DSAFETY [-DCOLLAPSE] -o pan pan.c}]
+\item	[\tco{cc -DSAFETY [-DCOLLAPSE] [-DMA=N] -o pan pan.c}]
 	Compile the generated state-machine search.  The \co{-DSAFETY}
 	generates optimizations that are appropriate if you have only
 	assertions (and perhaps \co{never} statements).  If you have
@@ -256,18 +256,28 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 
 	The optional \co{-DCOLLAPSE} generates code for a state vector
 	compression mode.
-\item	[\tco{./pan [-mN]}]
+
+	Another optional flag \co{-DMA=N} generates code for a slow
+	but aggressive state-space memory compression mode.
+\item	[\tco{./pan [-mN] [-wN]}]
 	This actually searches the state space.  The number of states
 	can reach into the tens of millions with very small state
 	machines, so you will need a machine with large memory.
 	For example, \path{qrcu.spin} with 3~updaters and 2~readers required
 	10.5\,GB of memory even with the \co{-DCOLLAPSE} flag.
 
-	If you see a message from \co{pan} saying:
+	If you see a message from \co{./pan} saying:
 	``error: max search depth too small'', you need to increase
-	the maximum depth by a \co{-mN} flag for a complete search.
+	the maximum depth by a \co{-mN} option for a complete search.
 	The default is \co{-m10000}.
 
+	The \co{-wN} option specifies the hashtable size.
+	The default for full state-space search is \co{-w24}.\footnote{
+		As of Spin Version 6.4.6 and 6.4.8. In the online manual of
+		Spin dated 10 July 2011, the default for exhaustive search
+		mode is said to be \co{-w19}, which does not meet
+		the actual behavior.}
+
 	If you aren't sure whether your machine has enough memory,
 	run \co{top} in one window and \co{./pan} in another.  Keep the
 	focus on the \co{./pan} window so that you can quickly kill
@@ -880,6 +890,138 @@ Now, it would be nice to run the case with three readers and three
 updaters, however, simple extrapolation indicates that this will
 require on the order of half a terabyte of memory best case.
 So, what to do?
+
+As a last resort for full search of large state spaces,
+Spin provides a compiler flag \co{-DMA=N}
+which generates code for aggressive compression of
+state-space memory in exchange of search speed.
+Use of the flag is suggested in the output of an incomplete run of
+\co{./pan} due to lack of memory.
+An example from three readers and three updaters reads:
+
+\begin{VerbatimU}
+hint: to reduce memory, recompile with
+  -DCOLLAPSE # good, fast compression, or
+  -DMA=96   # better/slower compression, or
+  -DHC # hash-compaction, approximation
+  -DBITSTATE # supertrace, approximation
+\end{VerbatimU}
+
+So let's try the following:
+
+\begin{VerbatimU}
+spin -a qrcu.spin
+cc -DSAFETY -DMA=96 -O2 -o pan pan.c
+./pan -m20000000
+\end{VerbatimU}
+
+Here, the depth limit of 20,000,000 is one order of magnitude
+larger than the expected depth deduced from simple extrapolation.
+This will increase up-front memory usage, but we don't want
+a long run to end up in an incomplete search by specifying
+a tight limit.
+
+It took a little more than 3~days on a \Power{9} server.
+The result is shown in
+Listing~\ref{lst:formal:spinhint:3 Readers 3 Updaters QRCU Spin Output with -DMA=96}.
+As you can see, this Spin run completed with the total memory
+usage of \emph{only} 6.5\,GB, and the model passed this case
+as well.
+
+\begin{listing}
+\VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/qrcu.spin.33ma.lst}
+\vspace*{-9pt}
+\caption{3 Readers 3 Updaters QRCU Spin Output with \co{-DMA=96}}
+\label{lst:formal:spinhint:3 Readers 3 Updaters QRCU Spin Output with -DMA=96}
+\end{listing}
+
+\QuickQuiz{}
+	Compression rate of 0.48\,\%! Is the state-space search
+	really exhaustive???
+\QuickQuizAnswer{
+	As long as you believe documentation of Spin, yes, it should
+	be.
+
+\begin{listing}
+\VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/qrcu.spin.col-ma.diff.lst}
+\vspace*{-9pt}
+\caption{Spin Output Diff of \co{-DCOLLAPSE} and \co{-DMA=88}}
+\label{lst:formal:promela:Spin Output Diff of -DCOLLAPSE and -DMA=88}
+\end{listing}
+
+	As an indirect evidence, let's compare the results of
+	runs with \co{-DCOLLAPSE} and with \co{-DMA=88}
+	(two readers and three updaters).
+	The diff of outputs of those runs is shown in
+	Listing~\ref{lst:formal:promela:Spin Output Diff of -DCOLLAPSE and -DMA=88}.
+	As you can see, they agree on the numbers of states
+	(stored and matched).
+} \QuickQuizEnd
+
+\begin{table*}[tbp]
+\rowcolors{6}{}{lightgray}
+\renewcommand*{\arraystretch}{1.2}
+\footnotesize
+\centering
+\OneColumnHSpace{-0.7in}%
+\begin{tabular}{S[table-format = 1.0]S[table-format = 1.0]S[table-format = 9.0]
+		S[table-format = 9.0]S[table-format = 2.0]S[table-format = 5.2]
+		S[table-format = 4.2]S[table-format = 2.0]S[table-format = 4.2]
+		S[table-format = 6.2]}
+	\toprule
+	\multicolumn{4}{r}{} & \multicolumn{3}{c}{\tco{-DCOLLAPSE}} &
+					\multicolumn{3}{c}{\tco{-DMA=N}} \\
+	\cmidrule(l){5-7} \cmidrule(l){8-10}
+	\multicolumn{1}{r}{updaters} &
+	    \multicolumn{1}{r}{readers} &
+		\multicolumn{1}{r}{\# states} &
+		    \multicolumn{1}{r}{depth reached} &
+			\multicolumn{1}{r}{\tco{-wN}} &
+			    \multicolumn{1}{r}{memory (MB)} &
+				\multicolumn{1}{r}{runtime (s)} &
+				    \multicolumn{1}{r}{\tco{N}} &
+					\multicolumn{1}{r}{memory (MB)} &
+					    \multicolumn{1}{r}{runtime (s)} \\
+	\cmidrule{1-4} \cmidrule(l){5-7} \cmidrule(l){8-10}
+	1 & 1 &           376 &         95 & 12 &     0.10 & 0.00 &
+		40 &    0.29 &      0.00 \\
+	1 & 2 &         6 177 &        218 & 12 &     0.39 & 0.01 &
+		47 &    0.59 &      0.02 \\
+	1 & 3 &        99 728 &        385 & 16 &     4.60 & 0.14 &
+		54 &    3.04 &      0.45 \\
+        2 & 1 &        29 399 &        859 & 16 &     2.30 & 0.03 &
+		55 &    0.70 &      0.13 \\
+        2 & 2 &     1 071 181 &      2 352 & 20 &    49.24 & 1.45 &
+		62 &    7.77 &      5.76 \\
+        2 & 3 &    33 866 736 &     12 857 & 24 & 1 540.70 & 62.5 &
+		69 &  111.66 &    326    \\
+        3 & 1 &     2 749 453 &     53 809 & 21 &   125.25 & 4.01 &
+		70 &   11.41 &     19.5  \\
+        3 & 2 &   186 202 860 &    328 014 & 28 & 10 482.51 & 390 &
+		77 &  222.26 &   2560    \\
+	3 & 3 & 9 664 707 100 &  2 055 621 &    &          &      &
+		84 & 6515.38 & 272000    \\
+	\bottomrule
+\end{tabular}
+\caption{QRCU Spin Result Summary}
+\label{tab:formal:promela:QRCU Spin Result Summary}
+\end{table*}
+
+For reference, Table~\ref{tab:formal:promela:QRCU Spin Result Summary}
+summarizes the Spin results with \co{-DCOLLAPSE} and \co{-DMA=N}
+compiler flags.
+The memory usage is obtained with minimal sufficient
+search depths and \co{-DMA=N} parameters shown in the table.
+As for \co{-DCOLLAPSE}, hash table sizes are tweaked by
+the \co{-wN} option of \co{./pan} to avoid using too much
+memory for hashing small state space. Hence the memory usage is
+smaller than what is shown in
+Table~\ref{tab:advsync:Memory Usage of QRCU Model}.
+The runtime is taken on a \Power{9} server.
+
+So far so good. But as can be easily seen, full state-space search
+would be infeasible if you add a few more updaters\slash readers.
+So what to do?
 Here are some possible approaches:
 
 \begin{enumerate}
-- 
2.7.4


