Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=OWH9o/EqE97fi9bLjhX7XjSJePKbuq1JT9x95M17ui0=;
 b=Ubs3XObpWhz4R0cTxaa5wim/UU6cmW7Bf8EqaBVKLrC/YTw9mnN1domXEr+Kgh6t09
 FGW+pUoPEjCmqjtRwzKAuIGNDlfB6OLz6nbHZZaBePrLv8FcaKXBI7FmNLn294cbMcQO
 BwGjmdfkHYJN/UZQvSfGvIufp3UyE+ZL9GIZeR43KtyueqhPga7yeV93PM1vwY9QbGD8
 usbUJdd3kXGWZyZPpHNuqGKp7Rq2jr2lswEN8X8HkUm7cYxMWCL3JEPZHTv6mTpwE3Mf
 McSRQ1cb7Lks8OBsoLBkLIVziL36659duWX8oLwr2XKhjh1Tw+RQ2/RzNJtjCSv0FbrZ
 kJwQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] formal/regression: Tweak table format and indent in listing
Message-ID: <f28a0cc5-ef5d-0134-73d5-cf0ba7d6d746@gmail.com>
Date: Mon, 30 Oct 2017 00:44:48 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 729f4ef5e8116d8a61b56d0f2a86d005f354ac59 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 30 Oct 2017 00:27:49 +0900
Subject: [PATCH] formal/regression: Tweak table format and indent in listing

Use "S" column specifier in tables containing time duration.

Remove vertical and horizontal rules in scorecard. Instead,
add narrow skips between colored cells by adding empty columns
in between and reducing \tabcolsep length locally in the table.
\addlinespace is a booktabs' command to add vertical space between
rows.

Substitute two white spaces for TAB characters in "verbbox" for
proper indentation.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/regression.tex | 133 ++++++++++++++++++++++++++------------------------
 1 file changed, 69 insertions(+), 64 deletions(-)

diff --git a/formal/regression.tex b/formal/regression.tex
index 0d464b1..9e564f7 100644
--- a/formal/regression.tex
+++ b/formal/regression.tex
@@ -174,24 +174,24 @@ C C-SB+l-o-o-u+l-o-o-u-C

 P0(int *sl, int *x0, int *x1)
 {
-	int r2;
-	int r1;
+  int r2;
+  int r1;

-	r2 = cmpxchg_acquire(sl, 0, 1);
-	WRITE_ONCE(*x0, 1);
-	r1 = READ_ONCE(*x1);
-	smp_store_release(sl, 0);
+  r2 = cmpxchg_acquire(sl, 0, 1);
+  WRITE_ONCE(*x0, 1);
+  r1 = READ_ONCE(*x1);
+  smp_store_release(sl, 0);
 }

 P1(int *sl, int *x0, int *x1)
 {
-	int r2;
-	int r1;
+  int r2;
+  int r1;

-	r2 = cmpxchg_acquire(sl, 0, 1);
-	WRITE_ONCE(*x1, 1);
-	r1 = READ_ONCE(*x0);
-	smp_store_release(sl, 0);
+  r2 = cmpxchg_acquire(sl, 0, 1);
+  WRITE_ONCE(*x1, 1);
+  r1 = READ_ONCE(*x0);
+  smp_store_release(sl, 0);
 }

 filter (0:r2=0 /\ 1:r2=0)
@@ -205,14 +205,15 @@ exists (0:r1=0 /\ 1:r1=0)
 \end{listing}

 \begin{table}[tbh]
-\rowcolors{6}{}{lightgray}
+\rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \small
-\centering\OneColumnHSpace{-0.1in}
-\begin{tabular}{rrr}
+\centering
+\begin{tabular}{S[table-format=1.0]S[table-format=1.3]S[table-format=2.3]}
 	\toprule
-	\# Threads & Locking & \tco{cmpxchg_acquire} \\
-	\cmidrule{1-1} \cmidrule{2-2} \cmidrule{3-3}
+	\multicolumn{1}{c}{\# Threads} & \multicolumn{1}{c}{Locking} &
+			\multicolumn{1}{c}{\tco{cmpxchg_acquire}} \\
+	\midrule
 	2 & 0.004 &  0.022 \\
 	3 & 0.041 &  0.743 \\
 	4 & 0.374 & 59.565 \\
@@ -250,19 +251,22 @@ is more than two orders of magnitude faster than emulation!
 	the \co{exists} clause, which provides significant speedups.

 \begin{table}[tbh]
-\rowcolors{6}{}{lightgray}
+\rowcolors{7}{lightgray}{}
 \renewcommand*{\arraystretch}{1.1}
 \small
-\centering\OneColumnHSpace{-0.1in}
-\begin{tabular}{rrrrrr}
+\centering
+\begin{tabular}{S[table-format=1.0]S[table-format=1.3]S[table-format=2.3]
+		S[table-format=3.3]S[table-format=2.3]S[table-format=3.3]}
 	\toprule
 	& & \multicolumn{2}{c}{\tco{cmpxchg_acquire}}
 		& \multicolumn{2}{c}{\tco{xchg_acquire}} \\
 	\cmidrule(l){3-4} \cmidrule(l){5-6}
-	\# & Locking & \tco{filter} & \tco{exists}
-		& \tco{filter} & \tco{exists} \\
-	\cmidrule(l){1-1} \cmidrule(l){2-2} \cmidrule(l){3-3} \cmidrule(l){4-4}
-		\cmidrule(l){5-5} \cmidrule(l){6-6}
+	\multicolumn{1}{c}{\#} & \multicolumn{1}{c}{Locking}
+		& \multicolumn{1}{c}{\tco{filter}}
+			& \multicolumn{1}{c}{\tco{exists}}
+				& \multicolumn{1}{c}{\tco{filter}}
+					& \multicolumn{1}{c}{\tco{exists}} \\
+	\cmidrule{1-1} \cmidrule(l){2-2} \cmidrule(l){3-4} \cmidrule(l){5-6}
 	2 & 0.004 &  0.022 &   0.039 &  0.027 &  0.058 \\
 	3 & 0.041 &  0.743 &   1.653 &  0.968 &  3.203 \\
 	4 & 0.374 & 59.565 & 151.962 & 74.818 & 500.96 \\
@@ -400,53 +404,54 @@ required if we are to actually increase software reliability.

 \begin{table*}[tbh]
 % \rowcolors{6}{}{lightgray}
-\renewcommand*{\arraystretch}{1.1}
+%\renewcommand*{\arraystretch}{1.1}
 \small
-\centering\OneColumnHSpace{-0.1in}
-\begin{tabular}{l|c|c|c|c|c}
+\centering
+\setlength{\tabcolsep}{2pt}
+\begin{tabular}{lcccccccccc}
 	\toprule
-	& Promela & PPCMEM & \tco{herd} & \tco{cbmc} & Nidhugg \\
-	\hline
-	(1) Automated
-		& \cellcolor{red!50}
-			& \cellcolor{orange!50}
-				& \cellcolor{orange!50}
-					& \cellcolor{blue!50}
+	& & Promela & & PPCMEM & & \tco{herd} & & \tco{cbmc} & & Nidhugg \\
+	\midrule
+	(1) Automated &
+		& \cellcolor{red!50} &
+			& \cellcolor{orange!50} &
+				& \cellcolor{orange!50} &
+					& \cellcolor{blue!50} &
 						& \cellcolor{blue!50} \\
-	\hline
-	(2) Environment
-		& \cellcolor{red!50} (MM)
-			& \cellcolor{green!50}
-				& \cellcolor{blue!50}
-					& \cellcolor{yellow!50} (MM)
+	\addlinespace[3pt]
+	(2) Environment &
+		& \cellcolor{red!50} (MM) &
+			& \cellcolor{green!50} &
+				& \cellcolor{blue!50} &
+					& \cellcolor{yellow!50} (MM) &
 						& \cellcolor{orange!50} (MM) \\
-	\hline
-	(3) Overhead
-		& \cellcolor{yellow!50}
-			& \cellcolor{red!50}
-				& \cellcolor{yellow!50}
-					& \cellcolor{yellow!50} (SAT)
+	\addlinespace[3pt]
+	(3) Overhead &
+		& \cellcolor{yellow!50} &
+			& \cellcolor{red!50} &
+				& \cellcolor{yellow!50} &
+					& \cellcolor{yellow!50} (SAT) &
 						& \cellcolor{green!50} \\
-	\hline
-	(4) Locate Bugs
-		& \cellcolor{yellow!50}
-			& \cellcolor{yellow!50}
-				& \cellcolor{yellow!50}
-					& \cellcolor{green!50}
+	\addlinespace[3pt]
+	(4) Locate Bugs &
+		& \cellcolor{yellow!50} &
+			& \cellcolor{yellow!50} &
+				& \cellcolor{yellow!50} &
+					& \cellcolor{green!50} &
 						& \cellcolor{green!50} \\
-	\hline
-	(5) Minimal Scaffolding
-		& \cellcolor{green!50}
-			& \cellcolor{yellow!50}
-				& \cellcolor{yellow!50}
-					& \cellcolor{blue!50}
+	\addlinespace[3pt]
+	(5) Minimal Scaffolding &
+		& \cellcolor{green!50} &
+			& \cellcolor{yellow!50} &
+				& \cellcolor{yellow!50} &
+					& \cellcolor{blue!50} &
 						& \cellcolor{blue!50} \\
-	\hline
-	(6) Relevant Bugs
-		& \cellcolor{yellow!50} ???
-			& \cellcolor{yellow!50} ???
-				& \cellcolor{yellow!50} ???
-					& \cellcolor{yellow!50} ???
+	\addlinespace[3pt]
+	(6) Relevant Bugs &
+		& \cellcolor{yellow!50} ??? &
+			& \cellcolor{yellow!50} ??? &
+				& \cellcolor{yellow!50} ??? &
+					& \cellcolor{yellow!50} ??? &
 						& \cellcolor{yellow!50} ??? \\
 	\bottomrule
 \end{tabular}
-- 
2.7.4

