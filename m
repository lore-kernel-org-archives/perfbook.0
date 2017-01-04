Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=FJn1FksQK8fqUA6VihTdmKYjqdgt7rxDmAlRM0BKcfI=;
 b=mkSh6Ix7lwk/JuSwS1bHJXR91COpMcku7PKAR3jOZ9d8zppnyQU4kvkOCuRw1rz0sM
 uIOoRYZFSADVCD0zBBheExEf/pVCDUik5a38vYUwegbykMe2RkkKKpzlC/bBCg9Nqo5l
 yenk+YTYMyFZFk2aKZEgtXVKiK7n5D2JqdESApYLPiCFHNPPEcMlufc279W9+3M6S6MQ
 omo2i+sF6c/rjeNGtjKDSvF84uskSD8JVrgnxzT50AxM+R8AhYqfw3nTz3132Ubtz3oA
 MfTq5UxlWGMDPFbHJu6bc4hjCHTrsA1CLQIRm/rHVsJd/ffIhINrLN/05UHxDimbjIDQ
 oCrg==
Subject: [PATCH 06/13] memorybarriers: Remove \co{} in tabular env
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3cf2c0bb-1d38-b255-0e6c-a1cde9912512@gmail.com>
Date: Wed, 4 Jan 2017 10:24:27 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0c2deaa9675059d632aed04cfbd6f9f86f045720 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 1 Jan 2017 13:41:04 +0900
Subject: [PATCH 06/13] memorybarriers: Remove \co{} in tabular env

Not just replacing \co{}s, this commit removes unnecessary commands
which are already in typewriter font. It also proactively uses
escapes by "\" for a single "_" in API.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 109 ++++++++++++++++++++++-----------------------
 1 file changed, 54 insertions(+), 55 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index b8bc611..100b67d 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -13,15 +13,15 @@ use of standard mutual-exclusion mechanisms, such as locking and
 RCU.

 \begin{table}
-\centering
+\centering{\tt
 \begin{tabular}{l|l}
 	Thread 1 & Thread 2 \\
 	\hline
-	\co{x = 1;} & \co{y = 1;} \\
-	\co{r1 = y;} & \co{r2 = x;} \\
+	x = 1;  & y = 1; \\
+	r1 = y; & r2 = x; \\
 	\hline
-	\multicolumn{2}{l}{\co{assert(r1 == 1 || r2 == 1);}} \\
-\end{tabular}
+	\multicolumn{2}{l}{assert(r1 == 1 || r2 == 1);} \\
+\end{tabular}}
 \caption{Memory Misordering: Dekker}
 \label{tab:advsync:Memory Misordering: Dekker}
 \end{table}
@@ -522,9 +522,9 @@ on this weaker if-then conditional ordering guarantee.
 \begin{tabular}{l|l}
 	CPU 1 &			CPU 2 \\
 	\hline
-	\co{access(A);} &	\co{access(B);} \\
-	\co{smp_mb();} &	\co{smp_mb();} \\
-	\co{access(B);} &	\co{access(A);} \\
+	access(A);	&	access(B); \\
+	smp\_mb();	&	smp\_mb(); \\
+	access(B);	&	access(A); \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -617,9 +617,9 @@ pairings that portable software may depend on.
 	\begin{tabular}{l|l}
 		CPU 1 &			CPU 2 \\
 		\hline
-		\co{A=1;} &		\co{Y=B;} \\
-		\co{smp_mb();} &	\co{smp_mb();} \\
-		\co{B=1;} &		\co{X=A;} \\
+		A=1;		&	Y=B; \\
+		smp\_mb();	&	smp\_mb(); \\
+		B=1;		&	X=A; \\
 	\end{tabular}
 	\end{minipage}
 	\vspace{5pt}
@@ -649,9 +649,9 @@ pairings that portable software may depend on.
 	\begin{tabular}{l|l}
 		CPU 1 &			CPU 2 \\
 		\hline
-		\co{X=A;} &		\co{Y=B;} \\
-		\co{smp_mb();} &	\co{smp_mb();} \\
-		\co{B=1;} &		\co{A=1;} \\
+		X=A;            &	Y=B; \\
+		smp\_mb();	&	smp\_mb(); \\
+		B=1;            &	A=1; \\
 	\end{tabular}
 	\end{minipage}
 	\vspace{5pt}
@@ -686,9 +686,9 @@ pairings that portable software may depend on.
 	\begin{tabular}{l|l}
 		CPU 1 &			CPU 2 \\
 		\hline
-		\co{X=A;} &		\co{B=2;} \\
-		\co{smp_mb();} &	\co{smp_mb();} \\
-		\co{B=1;} &		\co{A=1;} \\
+		X=A;		&	B=2; \\
+		smp\_mb();	&	smp\_mb(); \\
+		B=1;		&	A=1; \\
 	\end{tabular}
 	\end{minipage}
 	\vspace{5pt}
@@ -767,9 +767,9 @@ keep in mind that they used to be a \emph{lot} harder on some systems!
 	\begin{tabular}{l|l}
 		CPU 1 &			CPU 2 \\
 		\hline
-		\co{A=1;} &		\co{B=2;} \\
-		\co{smp_mb();} &	\co{smp_mb();} \\
-		\co{B=1;} &		\co{A=2;} \\
+		A=1;		&	B=2; \\
+		smp\_mb();	&	smp\_mb(); \\
+		B=1;		&	A=2; \\
 	\end{tabular}
 	\end{minipage}
 	\vspace{5pt}
@@ -1049,17 +1049,16 @@ the sequence of operations might be as follows:
 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \tt \scriptsize
-\scriptsize
 \begin{tabular}{l|l}
 	CPU 1 &			CPU 2 \\
 	\hline
-	(critical section) &	\co{atomic_xchg(&lck->a, 1)->1} \\
-	\co{smp_mb();} &	\co{lck->a->1} \\
-	\co{lck->a=0;} &	\co{lck->a->1} \\
-	&			\co{lck->a->0} \\
-	&			(implicit \co{smp_mb()} 1) \\
-	&			\co{atomic_xchg(&lck->a, 1)->0} \\
-	&			(implicit \co{smp_mb()} 2) \\
+	(critical section) &	\tco{atomic_xchg(&lck->a, 1)->1} \\
+	\tco{smp_mb();}    &	lck->a->1 \\
+	lck->a=0;	   &	lck->a->1 \\
+	&			lck->a->0 \\
+	&			(implicit \tco{smp_mb()} 1) \\
+	&			\tco{atomic_xchg(&lck->a, 1)->0} \\
+	&			(implicit \tco{smp_mb()} 2) \\
 	&			(critical section) \\
 \end{tabular}
 \end{minipage}
@@ -2077,14 +2076,14 @@ This is demonstrated by two related examples, with the initial values of
 \begin{tabular}{l|p{1.5in}}
 	CPU 0 &		CPU 1 \\
 	\hline
-	\co{r1 = READ_ONCE(x);} &
-		\co{r2 = READ_ONCE(y);} \\
-	\co{if (r1 > 0)} &
-		\co{if (r2 > 0)} \\
-	~~~\co{WRITE_ONCE(y, 1);} &
-		~~~\co{WRITE_ONCE(x, 1);} \\
+	r1 = READ\_ONCE(x); &
+		r2 = READ\_ONCE(y); \\
+	if (r1 > 0) &
+		if (r2 > 0) \\
+	~~~WRITE\_ONCE(y, 1); &
+		~~~WRITE\_ONCE(x, 1); \\
 	\multicolumn{2}{l}{~} \\
-	\multicolumn{2}{l}{\co{assert(!(r1 == 1 && r2 == 1));}} \\
+	\multicolumn{2}{l}{\tco{assert(!(r1 == 1 && r2 == 1));}} \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -2100,9 +2099,9 @@ not), then adding the following CPU would guarantee a related assertion:
 \begin{tabular}{l}
 	CPU 2 \\
 	\hline
-	\co{WRITE_ONCE(y, 1);} \\
+	WRITE\_ONCE(y, 1); \\
 	\multicolumn{1}{l}{~} \\
-	\multicolumn{1}{l}{\co{assert(!(r1 == 1 && r2 == 1 && x == 1));}} \\
+	\multicolumn{1}{l}{\tco{assert(!(r1 == 1 && r2 == 1 && x == 1));}} \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -2744,17 +2743,17 @@ Table~\ref{tab:advsync:Ordering With Multiple Locks}, which uses
 a pair of locks named ``M'' and ``Q''.

 \begin{table}[htbp]
-\scriptsize\centering
+\scriptsize\centering{\tt
 \begin{tabular}{r|l}
-  \co{CPU 1}     & \co{CPU 2} \\
+  CPU 1 &	CPU 2 \\
   \hline
-  \co{A = a;}    & \co{E = e;} \\
-  \co{LOCK M;}   & \co{LOCK Q;} \\
-  \co{B = b;}    & \co{F = f;} \\
-  \co{C = c;}    & \co{G = g;} \\
-  \co{UNLOCK M;} & \co{UNLOCK Q;} \\
-  \co{D = d;}    & \co{H = h;} \\
-\end{tabular}
+  A = a; &	E = e; \\
+  LOCK M; &	LOCK Q; \\
+  B = b; &	F = f; \\
+  C = c; &	G = g; \\
+  UNLOCK M; &	UNLOCK Q; \\
+  D = d; &	H = h; \\
+\end{tabular}}
 \caption{Ordering With Multiple Locks}
 \label{tab:advsync:Ordering With Multiple Locks}
 \end{table}
@@ -2784,17 +2783,17 @@ the same lock, as shown in
 Table~\ref{tab:advsync:Ordering With Multiple CPUs on One Lock}?

 \begin{table}[htbp]
-\scriptsize\centering
+\scriptsize\centering{\tt
 \begin{tabular}{r|l}
-  \co{CPU 1}     & \co{CPU 2} \\
+  CPU 1 &	CPU 2 \\
   \hline
-  \co{A = a;}    & \co{E = e;} \\
-  \co{LOCK M;}   & \co{LOCK M;} \\
-  \co{B = b;}    & \co{F = f;} \\
-  \co{C = c;}    & \co{G = g;} \\
-  \co{UNLOCK M;} & \co{UNLOCK M;} \\
-  \co{D = d;}    & \co{H = h;} \\
-\end{tabular}
+  A = a; &	E = e; \\
+  LOCK M; &	LOCK M; \\
+  B = b; &	F = f; \\
+  C = c; &	G = g; \\
+  UNLOCK M; &	UNLOCK M; \\
+  D = d; &	H = h; \\
+\end{tabular}}
 \caption{Ordering With Multiple CPUs on One Lock}
 \label{tab:advsync:Ordering With Multiple CPUs on One Lock}
 \end{table}
-- 
2.7.4


