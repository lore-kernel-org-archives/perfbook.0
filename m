Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5KR4QeyjBkX4AW3XSiXhwvUjMjYjWVNGe3Q+ly3zuyE=;
 b=Qf8wawJAJbLVF7n0HH1ixf9AxIZXHr5UtlwTQPCqXdC35734fgu2GbJbpp97NPF9o4
 gIH3tIiUG/kbUwNARP41oclomedc0bKzmf4DqATAAH3aGnvfNkhZB/eg37rEzskovVx0
 NmEUC7NFcbo2aoxqBdHBNg5cclz4bpPWpatnLA1unJ4L3wRN/CRG3jta40v+JIhbbKQO
 i2/InZkSBup+jBKRASWk+Wth9AjGbVTlQ2txr3EwpJTXbM8ark1NfhCEueNyn/qDn4Rn
 PbiolVzcPtA6vfAz/fgfjS6Ax4HFYdDw5ZiTaib130fa9Zny5WFYhAk6WUy8SfBF2R0M
 b8ZQ==
Subject: [PATCH 01/14] advsync: Use pseudo asm in sequence in 'Paring' section
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0295da04-654d-5b1f-eeb4-7245096a4605@gmail.com>
Date: Mon, 17 Apr 2017 07:13:08 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 78178c3e06de801acde0c35f7077d7d27fa7900f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 15 Apr 2017 23:21:37 +0900
Subject: [PATCH 01/14] advsync: Use pseudo asm in sequence in 'Paring' section

Also format 2 CPU scenario in Quick Quiz Answer as a table.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 56 +++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 5f8ea7f..d82a968 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -520,11 +520,11 @@ on this weaker if-then conditional ordering guarantee.
 \tt
 \scriptsize
 \begin{tabular}{l|l}
-	\nf{CPU 1} &		\nf{CPU 2} \\
+	\nf{CPU 1}	& \nf{CPU 2} \\
 	\hline
-	access(A);	&	access(B); \\
-	\tco{smp_mb();}	&	\tco{smp_mb();} \\
-	access(B);	&	access(A); \\
+	<access> A	& <access> B \\
+	<memory barrier>& <memory barrier> \\
+	<access> B	& <access> A \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -615,11 +615,11 @@ pairings that portable software may depend on.
 	\tt
 	\scriptsize
 	\begin{tabular}{l|l}
-		\nf{CPU 1} &		\nf{CPU 2} \\
+		\nf{CPU 1}	& \nf{CPU 2} \\
 		\hline
-		A=1;		&	Y=B; \\
-		\tco{smp_mb();}	&	\tco{smp_mb();} \\
-		B=1;		&	X=A; \\
+		STORE A = 1	& Y = LOAD B \\
+		<memory barrier>& <memory barrier> \\
+		STORE B = 1	& X = LOAD A \\
 	\end{tabular}
 	\end{minipage}
 	\vspace{5pt}
@@ -647,11 +647,11 @@ pairings that portable software may depend on.
 	\tt
 	\scriptsize
 	\begin{tabular}{l|l}
-		\nf{CPU 1} &		\nf{CPU 2} \\
+		\nf{CPU 1}	& \nf{CPU 2} \\
 		\hline
-		X=A;            &	Y=B; \\
-		\tco{smp_mb();}	&	\tco{smp_mb();} \\
-		B=1;            &	A=1; \\
+		X = LOAD A	& Y = LOAD B \\
+		<memory barrier>& <memory barrier> \\
+		STORE B = 1	& STORE A = 1 \\
 	\end{tabular}
 	\end{minipage}
 	\vspace{5pt}
@@ -684,11 +684,11 @@ pairings that portable software may depend on.
 	\tt
 	\scriptsize
 	\begin{tabular}{l|l}
-		\nf{CPU 1} &		\nf{CPU 2} \\
+		\nf{CPU 1}	& \nf{CPU 2} \\
 		\hline
-		X=A;		&	B=2; \\
-		\tco{smp_mb();}	&	\tco{smp_mb();} \\
-		B=1;		&	A=1; \\
+		X = LOAD A	& STORE B = 2 \\
+		<memory barrier>& <memory barrier> \\
+		STORE B = 1	& STORE A = 1 \\
 	\end{tabular}
 	\end{minipage}
 	\vspace{5pt}
@@ -735,9 +735,19 @@ keep in mind that they used to be a \emph{lot} harder on some systems!
 \QuickQuizAnswer{
 	The scenario is as follows, with~A and~B both initially zero:

-	CPU~0: A=1; \co{smp_mb()}; r1=B;
-
-	CPU~1: B=1; \co{smp_mb()}; r2=A;
+	\vspace{5pt}
+	\begin{minipage}[t]{\columnwidth}
+	\tt
+	\scriptsize
+	\begin{tabular}{l|l}
+		\nf{CPU 0}	& \nf{CPU 1} \\
+		\hline
+		STORE A = 1	& STORE B = 1 \\
+		<memory barrier>& <memory barrier> \\
+		r1 = LOAD B	& r2 = LOAD A \\
+	\end{tabular}
+	\end{minipage}
+	\vspace{5pt}

 	If neither of the loads see the corresponding store, when both
 	CPUs finish, both \co{r1} and \co{r2} will be equal to zero.
@@ -765,11 +775,11 @@ keep in mind that they used to be a \emph{lot} harder on some systems!
 	\tt
 	\scriptsize
 	\begin{tabular}{l|l}
-		\nf{CPU 1} &		\nf{CPU 2} \\
+		\nf{CPU 1}	& \nf{CPU 2} \\
 		\hline
-		A=1;		&	B=2; \\
-		\tco{smp_mb();}	&	\tco{smp_mb();} \\
-		B=1;		&	A=2; \\
+		STORE A = 1	& STORE B = 2 \\
+		<memory barrier>& <memory barrier> \\
+		STORE B = 1	& STORE A = 2 \\
 	\end{tabular}
 	\end{minipage}
 	\vspace{5pt}
-- 
2.7.4


