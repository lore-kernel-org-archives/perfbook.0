Return-Path: <SRS0=LEX/=IW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jw+t+nhk0pr8uL52hgYJqo59a9tH90l0vsUNITXpHxw=;
        b=JiLmUIuGF7OSAbFNuYYAPGrkkXB2yfwa5J/xCEvjUgLKJiDq7+K/5OCFcZjB0Olws4
         jU2Q9bk5N977OixpPve/hMfdhanAazgDwENqhK2dm42TRVDZKGGv5px/m4qFov1SlmKa
         wW9ausIeydhEvu6JHXE4db1lKQcckPuiuzvyCK8I/i1ZfFBRGcobz4dVTRpGSxlQl/Cv
         ANFsAHMUovxNrKwep3/4lS9lyjkz0C+R7WjZ8ONkRsJfwRW/EQn94lulc2txe2TlwcOq
         HwwBslbF5PoctDhzBWUdl6QMQCbbLEq6Cfj7tKXI8LH6WlD1ldW2QgCVroolyBY+Xa3F
         dgWw==
Subject: [RFC PATCH 2/2] cpu, toolsoftrade, count, rcuapi: Shrink floats for
 ebook reader
References: <20210323010153.GH77072@balbir-desktop>
 <20210323052354.GS2696@paulmck-ThinkPad-P72>
 <20210323093822.GJ77072@balbir-desktop>
 <3a81ce2e-3c94-9609-b6a3-e4597425e838@gmail.com>
 <20210324011529.GK77072@balbir-desktop>
 <4b4a3289-9bd3-7f54-8d5b-6722d4d05e2b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f8c67c44-04da-513d-682d-08c2e60ba993@gmail.com>
Date: Wed, 24 Mar 2021 11:38:37 +0900
MIME-Version: 1.0
In-Reply-To: <4b4a3289-9bd3-7f54-8d5b-6722d4d05e2b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit demonstrates usages of \ebresizewidth, \ebresizewidthsw,
and \ebresizeverb.

NOTES:
o \ebresizeverb adds a blank line at the bottom of shrinked snippet.
  Hopefully, this can be fixed soon.
o One of sidewaystable in rcuapi uses \ebresizeverb, since tabularx
  in sidewaystable behaves unexpectedly within \ebresizewidthsw{}.
  The table has APIs enclosed in \tco{} which desides the widths of
  columns.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex               | 16 +++++++++++-----
 cpu/overheads.tex             |  2 ++
 defer/rcuapi.tex              | 12 +++++++++++-
 toolsoftrade/toolsoftrade.tex |  2 ++
 4 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index cafbcafc..abd85eaf 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -967,7 +967,7 @@ converge on the true value---hence this approach qualifies as
 eventually consistent.
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_stat_eventual@whole.fcv}
+\ebresizeverb{.9}{\input{CodeSamples/count/count_stat_eventual@whole.fcv}}
 \caption{Array-Based Per-Thread Eventually Consistent Counters}
 \label{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 \end{listing}
@@ -1666,7 +1666,11 @@ line~\lnref{adjglobal} makes the corresponding adjustment to
 
 \begin{figure*}[tb]
 \centering
+\IfEbookSize{
+\resizebox{\textwidth}{!}{\includegraphics{count/globbal}}
+}{
 \resizebox{5in}{!}{\includegraphics{count/globbal}}
+}
 \caption{Schematic of Globalization and Balancing}
 \label{fig:count:Schematic of Globalization and Balancing}
 \end{figure*}
@@ -1981,7 +1985,7 @@ the result.
 }\QuickQuizEnd
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_atomic@add_sub.fcv}
+\ebresizeverb{.76}{\input{CodeSamples/count/count_lim_atomic@add_sub.fcv}}
 \caption{Atomic Limit Counter Add and Subtract}
 \label{lst:count:Atomic Limit Counter Add and Subtract}
 \end{listing}
@@ -2095,7 +2099,7 @@ the reader.
 \end{fcvref}
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_atomic@read.fcv}
+\ebresizeverb{.85}{\input{CodeSamples/count/count_lim_atomic@read.fcv}}
 \caption{Atomic Limit Counter Read}
 \label{lst:count:Atomic Limit Counter Read}
 \end{listing}
@@ -2384,7 +2388,7 @@ and \co{theft} variables, respectively.
 \end{fcvref}
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_sig@data.fcv}
+\ebresizeverb{.9}{\input{CodeSamples/count/count_lim_sig@data.fcv}}
 \caption{Signal-Theft Limit Counter Data}
 \label{lst:count:Signal-Theft Limit Counter Data}
 \end{listing}
@@ -2413,7 +2417,7 @@ state to READY\@.
 \end{fcvref}
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_sig@migration.fcv}
+\ebresizeverb{.78}{\input{CodeSamples/count/count_lim_sig@migration.fcv}}
 \caption{Signal-Theft Limit Counter Value-Migration Functions}
 \label{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
 \end{listing}
@@ -2834,6 +2838,7 @@ will expand on these lessons.
 \small
 \centering
 \newcommand{\NA}{\cellcolor{white}}
+\ebresizewidth{
 \begin{tabular}{lrcS[table-format=2.1]S[table-format=3.0]S[table-format=4.0]
 		  S[table-format=6.0]S[table-format=6.0]}
 	\toprule
@@ -2869,6 +2874,7 @@ will expand on these lessons.
 		Y &  4.7 & 519 & 6 805 & 120 000 & 238 811 \\
 	\bottomrule
 \end{tabular}
+}
 \caption{Statistical/Limit Counter Performance on x86}
 \label{tab:count:Statistical/Limit Counter Performance on x86}
 \end{table*}
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 9a39e5a3..6b3b7008 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -137,6 +137,7 @@ optimization.
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \centering\small
+\ebresizewidth{
 \begin{tabular}
   {
     l
@@ -166,6 +167,7 @@ optimization.
 	Global Comms	& 195 000 000 & 409 500 000 & \\
 	\bottomrule
 \end{tabular}
+}
 \caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10\,GHz}
 \label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 \end{table*}
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 74efb10d..b4c2763e 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -51,7 +51,8 @@ API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
 \centering
 \caption{RCU Wait-to-Finish APIs}
 \label{tab:defer:RCU Wait-to-Finish APIs}
-\scriptsize\hspace*{-.125in}
+\scriptsize\IfEbookSize{\hspace*{-1.8in}}{\hspace*{-.125in}}
+\ebresizeverb{0.7}{
 \begin{tabularx}{8.5in}{>{\raggedright\arraybackslash}p{0.94in}
     >{\raggedright\arraybackslash}X
     >{\raggedright\arraybackslash}X
@@ -146,6 +147,7 @@ API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
 		    N/A \\
 \bottomrule
 \end{tabularx}
+}
 \end{sidewaystable*}
 
 If you are new to RCU, you might consider focusing on just one
@@ -415,6 +417,7 @@ that Linux supports~\cite{Spraul01}.
 \renewcommand*{\arraystretch}{1.15}
 \footnotesize
 \centering\OneColumnHSpace{-.4in}
+\ebresizewidth{
 \begin{tabular}{llp{2.2in}}
 \toprule
 Category &
@@ -457,6 +460,7 @@ Pointer subscribe (traveral) &
 		Simple instructions (memory barrier on Alpha) \\
 \bottomrule
 \end{tabular}
+}
 \caption{RCU Publish-Subscribe and Version Maintenance APIs}
 \label{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}
 \end{table*}
@@ -737,6 +741,7 @@ be a separate spinlock to be stored with the pointer itself.
   \setlength{\cwa}{1.95in}\setlength{\cwb}{2.15in}
   \setlength{\cwc}{1.9in}\setlength{\cwd}{1.7in}
 }
+\ebresizewidthsw{
 \begin{tabular}{>{\raggedright\arraybackslash}p{\cwa}
     >{\raggedright\arraybackslash}p{\cwb}
     >{\raggedright\arraybackslash}p{\cwc}
@@ -820,6 +825,7 @@ be a separate spinlock to be stored with the pointer itself.
 	    \\
 \bottomrule
 \end{tabular}
+}
 \end{sidewaystable*}
 
 The API members for these linked-list variants are summarized in
@@ -854,7 +860,11 @@ kfree(p);				\lnlbl[kfree]
 
 \begin{figure}[tbp]
 \centering
+\IfEbookSize{
+\resizebox{2in}{!}{\includegraphics{defer/RCUReplacement}}
+}{
 \resizebox{2.7in}{!}{\includegraphics{defer/RCUReplacement}}
+}
 \caption{RCU Replacement in Linked List}
 \label{fig:defer:RCU Replacement in Linked List}
 \end{figure}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 9e0838cb..bf34d2ca 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -479,7 +479,9 @@ lock~\cite{Hoare74}.
 }\QuickQuizEnd
 
 \begin{listing}[tbp]
+\ebresizeverb{.85}{
 \input{CodeSamples/toolsoftrade/lock@reader_writer.fcv}
+}
 \caption{Demonstration of Exclusive Locks}
 \label{lst:toolsoftrade:Demonstration of Exclusive Locks}
 \end{listing}
-- 
2.17.1


