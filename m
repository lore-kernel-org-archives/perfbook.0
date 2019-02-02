Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yhvjsSDmJvXHn4X8dv7yTQENTkFd3uYMzkxkPRMIQDU=;
        b=ZsDO10lU+sSiRapZGYUB7IGTgGj4Jcbj1f1mu3IN0ezYDg7f3/0ha1FhfIq6sjmI69
         UydelG/IECKoYUjosotF5YucsUERV9HrU8U8yEE24pHe9G34XHUGc8IPb2AlnFGrP7LF
         sLOiEcOmLerOU7K5J6QqWKMq2ST8d6/ySlJNl5ISxwW7HbHzWPD6aSRtMo9K4Q+Y5Xy8
         kZZU/OUSXu9woeGsTQmemP1e7zqvjCrHFkaxt/LvhnbCxsRHfMEESdFg3oJ18vb4Uw+N
         NPZuKF1cM1qIqqWrlvJAcYL3aUOZ+Ul0P9K/1Qs3Tt7FTbr/nO+Tx7DYf5rO2FE/RdcQ
         wEzA==
Subject: [PATCH 4/6] formal/spinhint: Update tables of memory usage of Spin
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <393aefe6-f3e4-1e3d-3f5e-7ffb44f5b040@gmail.com>
Date: Sun, 3 Feb 2019 00:13:37 +0900
MIME-Version: 1.0
In-Reply-To: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 72b1807d846432592d01c8642cebfa6a655802ed Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 31 Jan 2019 00:13:21 +0900
Subject: [PATCH 4/6] formal/spinhint: Update tables of memory usage of Spin

Update tables of memory usage of increment.spin and qrcu.spin.

As for qrcu.spin, to complete search of 3 updaters and 2 readers
on a machine with 16GB memory, the "-DCOLLAPSE" flag is necessary
to avoid memory exhaustion. This doesn't affect the completeness of
state search. Add explantion of the flag and update the table of
qrcu.spin with the usage obtained with the flag enabled.

There seems to have been incomplete searches due to insufficient
search depth.  Update "# state" figures from the complete results
obtained with deeper search limits.

Depth reached:
    updaters readers   depth
    1        1            95
    1        2           218
    1        3           385
    2        1           859
    2        2          2352
    2        3         12857
    3        1         53809
    3        2        328014

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 64 ++++++++++++++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 4332f3e..9c56b00 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -198,22 +198,22 @@ Listing~\ref{lst:analysis:Atomic Increment spin Output}.
 
 \begin{table}
 \rowcolors{1}{}{lightgray}
-\renewcommand*{\arraystretch}{1.2}
 \small
+\renewcommand*{\arraystretch}{1.2}
 \centering
 \begin{tabular}{S[table-format = 1.0]S[table-format = 7.0]S[table-format = 3.1]}
 	\toprule
 	\multicolumn{1}{l}{\# incrementers} &
 		\multicolumn{1}{r}{\# states} &
-			\multicolumn{1}{r}{megabytes} \\
+			\multicolumn{1}{r}{total memory usage (MB)} \\
 	\midrule
-	1 &		        11 &          2.6 \\
-	2 &		        52 &          2.6 \\
-	3 &		       372 &          2.6 \\
-	4 &		     3 496 &          2.7 \\
-	5 &		    40 221 &          5.0 \\
-	6 &		   545 720 &         40.5 \\
-	7 &		 8 521 450 &        652.7 \\
+	1 &		        11 &        128.7 \\
+	2 &		        52 &        128.7 \\
+	3 &		       372 &        128.7 \\
+	4 &		     3 496 &        128.9 \\
+	5 &		    40 221 &        131.7 \\
+	6 &		   545 720 &        174.0 \\
+	7 &		 8 521 446 &        881.9 \\
 	\bottomrule
 \end{tabular}
 \caption{Memory Usage of Increment Model}
@@ -226,7 +226,7 @@ as a function of number of incrementers modeled
 (by redefining {\tt NUMPROCS}):
 
 Running unnecessarily large models is thus subtly discouraged, although
-652\,MB is well within the limits of modern desktop and laptop machines.
+882\,MB is well within the limits of modern desktop and laptop machines.
 
 With this example under our belt, let's take a closer look at the
 commands used to analyze Promela models and then look at more
@@ -240,7 +240,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 \begin{description}[style=nextline]
 \item	[\tco{spin -a qrcu.spin}]
 	Create a file \path{pan.c} that fully searches the state machine.
-\item	[\tco{cc -DSAFETY -o pan pan.c}]
+\item	[\tco{cc -DSAFETY [-DCOLLAPSE] -o pan pan.c}]
 	Compile the generated state-machine search.  The \co{-DSAFETY}
 	generates optimizations that are appropriate if you have only
 	assertions (and perhaps \co{never} statements).  If you have
@@ -253,12 +253,20 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	An example situation where you cannot use \co{-DSAFETY} is
 	when checking for livelocks (AKA ``non-progress cycles'')
 	via \co{-DNP}.
-\item	[\tco{./pan}]
+
+	The optional \co{-DCOLLAPSE} generates code for a state vector
+	compression mode.
+\item	[\tco{./pan [-mN]}]
 	This actually searches the state space.  The number of states
 	can reach into the tens of millions with very small state
 	machines, so you will need a machine with large memory.
-	For example, \path{qrcu.spin} with 3 readers and 2 updaters required
-	2.7\,GB of memory.
+	For example, \path{qrcu.spin} with 3~updaters and 2~readers required
+	10.5\,GB of memory even with the \co{-DCOLLAPSE} flag.
+
+	If you see a message from \co{pan} saying:
+	``error: max search depth too small'', you need to increase
+	the maximum depth by a \co{-mN} flag for a complete search.
+	The default is \co{-m10000}.
 
 	If you aren't sure whether your machine has enough memory,
 	run \co{top} in one window and \co{./pan} in another.  Keep the
@@ -269,6 +277,10 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	windowing system to grab enough memory to do anything for
 	you.
 
+	Another option to avoid memory exhaustion is the
+	\co{-DMEMLIM=N} compiler flag. \co{-DMEMLIM=2000}
+	would set the maximum of 2\,GB.
+
 	Don't forget to capture the output, especially
 	if you are working on a remote machine.
 
@@ -826,8 +838,8 @@ Then use the following commands to build and run the QRCU model:
 
 \begin{VerbatimU}
 spin -a qrcu.spin
-cc -DSAFETY -o pan pan.c
-./pan
+cc -DSAFETY [-DCOLLAPSE] -o pan pan.c
+./pan [-mN]
 \end{VerbatimU}
 
 \begin{table}
@@ -843,14 +855,14 @@ cc -DSAFETY -o pan pan.c
 		\multicolumn{1}{r}{\# states} &
 		    \multicolumn{1}{r}{MB} \\
 	\midrule
-	1 & 1 &         376 &      2.6 \\
-	1 & 2 &       6 177 &      2.9 \\
-	1 & 3 &      82 127 &      7.5 \\
-	2 & 1 &      29 399 &      4.5 \\
-	2 & 2 &   1 071 180 &     75.4 \\
-	2 & 3 &  33 866 700 &  2 715.2 \\
-	3 & 1 &     258 605 &     22.3 \\
-	3 & 2 & 169 533 000 & 14 979.9 \\
+	1 & 1 &         376 &    128.7 \\
+	1 & 2 &       6 177 &    128.9 \\
+	1 & 3 &      99 728 &    132.6 \\
+	2 & 1 &      29 399 &    129.8 \\
+	2 & 2 &   1 071 181 &    169.6 \\
+	2 & 3 &  33 866 736 &  1 540.8 \\
+	3 & 1 &   2 749 453 &    236.6 \\
+	3 & 2 & 186 202 860 & 10 483.7 \\
 	\bottomrule
 \end{tabular}
 \caption{Memory Usage of QRCU Model}
@@ -859,7 +871,9 @@ cc -DSAFETY -o pan pan.c
 
 The resulting output shows that this model passes all of the cases
 shown in
-Table~\ref{tab:advsync:Memory Usage of QRCU Model}.
+Table~\ref{tab:advsync:Memory Usage of QRCU Model}.\footnote{
+	Figures in the table are obtained with the \co{-DCOLLAPSE}
+	compiler flag specified.}
 Now, it would be nice to run the case with three readers and three
 updaters, however, simple extrapolation indicates that this will
 require on the order of a terabyte of memory best case.
-- 
2.7.4


