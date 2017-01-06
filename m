Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=TE3VLLht1P21GriUIoDlqpE5iLgZdfiXtAhc8MYX+6Y=;
 b=FUlRGisf5V0BA97rNI7IU0BkPmDDj2NokChPQabR7aAnq+xNdxTmKXBCyEopbCEVcF
 l2Vmc7xI4qDhBFk2VlxSThicPPBqNDQ87/JNcMVhZFvn3WDmJVxHDLuF4k7+o8eVc62O
 SdToqpCOAwIi9adqTa/cFZKa6gUCJ2VEhR1HUXVx9XDA2loaRr6ZzGAZw/B7+wwx7f+8
 z8GxAw7EjJQHNWG1K5VvJPiDHMWothHkX+trxizIP68aHNZ/QNmYhid1CCMIBPCQw9Kh
 sl6dmXVPMkmQ4oupmMeH9QV3GBSAfc//55uexudKum7POuQyhJ1jrMQJdiktzYjmlrCn
 UtbA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Layout tweaks for 1c layout
Message-ID: <e7d84ef8-9394-069f-9ad8-9cc8d806b89a@gmail.com>
Date: Sat, 7 Jan 2017 00:50:05 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5de4d0c55d19b94e7e7ef6c69bb497324e443977 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 5 Jan 2017 16:42:41 +0900
Subject: [PATCH] Layout tweaks for 1c layout

Tweak horizontal spaces of wide figures and tables for 1c layout
using a macro derived from \IfTwoColumn{}{}.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This is in response to commit b9ffcb217d7b ("Adjust "Notification
Insufficient" cartoon for single-column"), which uses \textwidth to
support both 2c and 1c layouts.
There are other wide figures and tables that run past the right-side
margins in 1c layout. They are mostly text (code snippets and tables),
and using \resizebox{} with \textwidth for them will cause inconsistent
looks.
So I defined a macro derived from \IfTwoColumn{}{} which works
only in one-column layout. By using the macro, they can be placed near
the center of the pages in 1c layout. The tweaks might look ad hoc,
but they are not so many and should be manageable (I hope). 

                                            Thanks, Akira

 defer/rcuusage.tex      |  6 +++---
 defer/whichtochoose.tex |  2 +-
 future/HTMtable.tex     |  2 +-
 future/HTMtableRCU.tex  |  2 +-
 howto/howto.tex         | 10 ++++++----
 perfbook.tex            |  2 ++
 6 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index a02f4d0..5c4fb4c 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -617,7 +617,7 @@ Wikipedia~\cite{WikipediaRCU}.
  9 LIST_HEAD(head);                      9 LIST_HEAD(head);
 \end{verbbox}
 }
-\hspace*{5em}
+\hspace*{0.9in}\OneColumnHSpace{-0.5in}
 \theverbbox
 \caption{Converting Reader-Writer Locking to RCU: Data}
 \label{fig:defer:Converting Reader-Writer Locking to RCU: Data}
@@ -643,7 +643,7 @@ Wikipedia~\cite{WikipediaRCU}.
 15 }                                    15 }
 \end{verbbox}
 }
-\hspace*{5em}
+\hspace*{0.9in}\OneColumnHSpace{-0.5in}
 \theverbbox
 \caption{Converting Reader-Writer Locking to RCU: Search}
 \label{fig:defer:Converting Reader-Writer Locking to RCU: Search}
@@ -671,7 +671,7 @@ Wikipedia~\cite{WikipediaRCU}.
 16 }                                    17 }
 \end{verbbox}
 }
-\hspace*{5em}
+\hspace*{0.9in}\OneColumnHSpace{-0.5in}
 \theverbbox
 \caption{Converting Reader-Writer Locking to RCU: Deletion}
 \label{fig:defer:Converting Reader-Writer Locking to RCU: Deletion}
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index cf21341..edbdcb9 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -6,7 +6,7 @@

 \begin{table*}
 \footnotesize
-\centering\tymin=0.4in\tymax=2in
+\centering\tymin=0.4in\tymax=2in\OneColumnHSpace{-.3in}
 \begin{tabulary}{5.3in}{L||L|L|L|L}

 		& Reference Counting
diff --git a/future/HTMtable.tex b/future/HTMtable.tex
index 8eab89f..d317f94 100644
--- a/future/HTMtable.tex
+++ b/future/HTMtable.tex
@@ -4,7 +4,7 @@
 \begin{table*}[p]
 \centering
 % \scriptsize
-\small
+\small\OneColumnHSpace{-.8in}
 \begin{tabular}{p{1.0in}||c|p{2.0in}||c|p{2.0in}}
 & \multicolumn{2}{c||}{Locking} & \multicolumn{2}{c}{Hardware Transactional Memory} \\
 \hline
diff --git a/future/HTMtableRCU.tex b/future/HTMtableRCU.tex
index 2bc5a5b..c4af932 100644
--- a/future/HTMtableRCU.tex
+++ b/future/HTMtableRCU.tex
@@ -3,7 +3,7 @@

 \begin{table*}[p]
 \centering
-\small
+\small\OneColumnHSpace{-.8in}
 %\raggedright
 \begin{tabular}{p{1.0in}||c|p{2.0in}||c|p{2.0in}}
 & \multicolumn{2}{c||}{Locking with RCU or Hazard Pointers} & \multicolumn{2}{c}{Hardware Transactional Memory} \\
diff --git a/howto/howto.tex b/howto/howto.tex
index 9a8604c..f5e4f36 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -362,7 +362,7 @@ Other types of systems have well-known ways of locating files by filename.
 \begin{figure*}[tbp]
 {
 \scriptsize
-\begin{verbatim}
+\begin{verbbox}
   1 git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
   2 cd perfbook
   3 # You may need to install a font here. See item 1 in FAQ.txt.
@@ -370,8 +370,9 @@ Other types of systems have well-known ways of locating files by filename.
   5 evince perfbook.pdf & # Two-column version
   6 make perfbook-1c.pdf
   7 evince perfbook-1c.pdf & # One-column version for e-readers
-\end{verbatim}
+\end{verbbox}
 }
+\hspace*{1in}\OneColumnHSpace{-0.5in}\theverbbox
 \caption{Creating an Up-To-Date PDF}
 \label{fig:howto:Creating a Up-To-Date PDF}
 \end{figure*}
@@ -379,15 +380,16 @@ Other types of systems have well-known ways of locating files by filename.
 \begin{figure*}[tbp]
 {
 \scriptsize
-\begin{verbatim}
+\begin{verbbox}
   1 git remote update
   2 git checkout origin/master
   3 make
   4 evince perfbook.pdf & # Two-column version
   5 make perfbook-1c.pdf
   6 evince perfbook-1c.pdf & # One-column version for e-readers
-\end{verbatim}
+\end{verbbox}
 }
+\hspace*{1in}\OneColumnHSpace{-0.5in}\theverbbox
 \caption{Generating an Updated PDF}
 \label{fig:howto:Generating an Updated PDF}
 \end{figure*}
diff --git a/perfbook.tex b/perfbook.tex
index f90ba18..441dfea 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -63,6 +63,8 @@
 \setboolean{sansserif}{false}
 \newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}{#1}{#2}}

+\newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}
+
 \IfSansSerif{
 \renewcommand{\familydefault}{\sfdefault}
 \normalfont
-- 
2.7.4

