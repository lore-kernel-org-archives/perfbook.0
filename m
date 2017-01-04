Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=+Byan1l82UtidqPZdhcRwFONxaI2ZIxdaymNTZ0afo0=;
 b=ZDbymk9hNNqudlXma3+fDyVb5hGfWJqDli9pCAJ0AzghrFmKHrz8T53/nJEzQjAGzl
 RdASHKNllxDKUsvmhwC5B8wVUO6iMDV++cvqDqotl7R+iF7vwo2reUtUdVR9fSKwm3uE
 1bOxxyMatqmN5AvPwsWr/Wi4sR+Fl+eoWMsVOfdasaCstaqb24twRyaEI2682slJXXA5
 ooaVJCWVtjRbmHqSVNIj71x/CINpfsrS9iYLkJPxdAcga8pX2ZbEUHuwJ75XeWzTHzrp
 d/StosAdumqyiCN0pFOLJoyDtCxCd6Ewttf2urcX6WbnmBBuS1IxYkhlJTYyAOMsMja2
 ej5A==
Subject: [PATCH 11/13] memorybarriers: Add \nf{} command to table header
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9443f347-0c4b-35a1-edf8-c94f83f6ad27@gmail.com>
Date: Wed, 4 Jan 2017 10:30:57 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f09bec66accb5e0340777fb4c2590f930ddd5aa6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 1 Jan 2017 13:57:17 +0900
Subject: [PATCH 11/13] memorybarriers: Add \nf{} command to table header

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 50 +++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 3bf3a7f..7f1c3c8 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -15,7 +15,7 @@ RCU.
 \begin{table}
 \centering{\tt
 \begin{tabular}{l|l}
-	Thread 1 & Thread 2 \\
+	\nf{Thread 1} & \nf{Thread 2} \\
 	\hline
 	x = 1;  & y = 1; \\
 	r1 = y; & r2 = x; \\
@@ -520,7 +520,7 @@ on this weaker if-then conditional ordering guarantee.
 \tt
 \scriptsize
 \begin{tabular}{l|l}
-	CPU 1 &			CPU 2 \\
+	\nf{CPU 1} &		\nf{CPU 2} \\
 	\hline
 	access(A);	&	access(B); \\
 	smp\_mb();	&	smp\_mb(); \\
@@ -615,7 +615,7 @@ pairings that portable software may depend on.
 	\tt
 	\scriptsize
 	\begin{tabular}{l|l}
-		CPU 1 &			CPU 2 \\
+		\nf{CPU 1} &		\nf{CPU 2} \\
 		\hline
 		A=1;		&	Y=B; \\
 		smp\_mb();	&	smp\_mb(); \\
@@ -647,7 +647,7 @@ pairings that portable software may depend on.
 	\tt
 	\scriptsize
 	\begin{tabular}{l|l}
-		CPU 1 &			CPU 2 \\
+		\nf{CPU 1} &		\nf{CPU 2} \\
 		\hline
 		X=A;            &	Y=B; \\
 		smp\_mb();	&	smp\_mb(); \\
@@ -684,7 +684,7 @@ pairings that portable software may depend on.
 	\tt
 	\scriptsize
 	\begin{tabular}{l|l}
-		CPU 1 &			CPU 2 \\
+		\nf{CPU 1} &		\nf{CPU 2} \\
 		\hline
 		X=A;		&	B=2; \\
 		smp\_mb();	&	smp\_mb(); \\
@@ -765,7 +765,7 @@ keep in mind that they used to be a \emph{lot} harder on some systems!
 	\tt
 	\scriptsize
 	\begin{tabular}{l|l}
-		CPU 1 &			CPU 2 \\
+		\nf{CPU 1} &		\nf{CPU 2} \\
 		\hline
 		A=1;		&	B=2; \\
 		smp\_mb();	&	smp\_mb(); \\
@@ -1050,7 +1050,7 @@ the sequence of operations might be as follows:
 \begin{minipage}[t]{\columnwidth}
 \tt \scriptsize
 \begin{tabular}{l|l}
-	CPU 1 &			CPU 2 \\
+	\nf{CPU 1} &		\nf{CPU 2} \\
 	\hline
 	(critical section) &	\tco{atomic_xchg(&lck->a, 1)->1} \\
 	\tco{smp_mb();}    &	lck->a->1 \\
@@ -1148,7 +1148,7 @@ initial values {\tt \{A = 1, B = 2\}}:
 \tt
 \scriptsize
 \begin{tabular}{l|l}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	A = 3; &	x = A; \\
 	B = 4; &	y = B; \\
@@ -1205,7 +1205,7 @@ initial values {\tt \{A = 1, B = 2, C = 3, P = \&A, Q = \&C\}}:
 \tt
 \scriptsize
 \begin{tabular}{l|l}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	B = 4; &	Q = P; \\
 	P = \&B &	D = *Q; \\
@@ -1654,7 +1654,7 @@ following sequence of events, with initial values
 \tt
 \scriptsize
 \begin{tabular}{l|l}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	B = 4; & \\
 	<write barrier> & \\
@@ -1707,7 +1707,7 @@ address load and the data load (again with initial values of
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	B = 4; & \\
 	<write barrier> & \\
@@ -1743,7 +1743,7 @@ access with initial values
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	M[1] = 4; & \\
 	<write barrier> & \\
@@ -2074,7 +2074,7 @@ This is demonstrated by two related examples, with the initial values of
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 0 &		CPU 1 \\
+	\nf{CPU 0} &	\nf{CPU 1} \\
 	\hline
 	r1 = READ\_ONCE(x); &
 		r2 = READ\_ONCE(y); \\
@@ -2097,7 +2097,7 @@ not), then adding the following CPU would guarantee a related assertion:
 \tt
 \scriptsize
 \begin{tabular}{l}
-	CPU 2 \\
+	\nf{CPU 2} \\
 	\hline
 	WRITE\_ONCE(y, 1); \\
 	\multicolumn{1}{l}{~} \\
@@ -2181,7 +2181,7 @@ write barrier, though, again, a general barrier is viable:
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	A = 1; & \\
 	<write barrier> & \\
@@ -2200,7 +2200,7 @@ Or:
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	A = 1; & \\
 	<write barrier> & \\
@@ -2270,7 +2270,7 @@ loads.  Consider the following sequence of events with initial values
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	A = 1; & \\
 	B = 2; & \\
@@ -2306,7 +2306,7 @@ values of {\tt \{B = 7, X = 9, Y = 8, C = \&Y\}}:
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	A = 1; & \\
 	B = 2; & \\
@@ -2338,7 +2338,7 @@ following sequence of events, with initial values
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	A = 1; & \\
 	<write barrier> & \\
@@ -2369,7 +2369,7 @@ and the load of \co{A} on CPU~2, again with initial values of
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	A = 1; & \\
 	<write barrier> & \\
@@ -2402,7 +2402,7 @@ with the same initial values of
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 	A = 1; & \\
 	<write barrier> & \\
@@ -2465,7 +2465,7 @@ For example, consider the following:
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 		&	LOAD B \\
 		&	DIVIDE \\
@@ -2500,7 +2500,7 @@ load:
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	CPU 1 &		CPU 2 \\
+	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
 		&	LOAD B \\
 		&	DIVIDE \\
@@ -2745,7 +2745,7 @@ a pair of locks named ``M'' and ``Q''.
 \begin{table}[htbp]
 \scriptsize\centering{\tt
 \begin{tabular}{r|l}
-  CPU 1 &	CPU 2 \\
+  \nf{CPU 1} &	\nf{CPU 2} \\
   \hline
   A = a; &	E = e; \\
   LOCK M; &	LOCK Q; \\
@@ -2785,7 +2785,7 @@ Table~\ref{tab:advsync:Ordering With Multiple CPUs on One Lock}?
 \begin{table}[htbp]
 \scriptsize\centering{\tt
 \begin{tabular}{r|l}
-  CPU 1 &	CPU 2 \\
+  \nf{CPU 1} &	\nf{CPU 2} \\
   \hline
   A = a; &	E = e; \\
   LOCK M; &	LOCK M; \\
-- 
2.7.4


