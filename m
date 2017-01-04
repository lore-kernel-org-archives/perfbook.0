Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=aS1B2oIwRBzphNgnNbE76UJFFz2bE/uf26Xe+mYsIEY=;
 b=QIFcK2KHKZ6w145Vlo+Us4/t7PkZteapLSTQIOFOVO8pXhUeL4THuriTRtX9YDcb5/
 Nc16+D7rmd3dR94XaB8eq+h4NPxcJhc042vKlNyy2V2sLXrmpts5aa6fJ/20U3Ysp7/Q
 ydN1f6lVOkpqv0CjLlp8bCNDgw0p8YJapTE1sZP1yYPztcM588XOj8joF9tlMSGP0QSJ
 dUc2JgcUOt+WddeT7nT/+bGvfBI0zUh+TqT0YOqCXOVkAiaDnvfOmuOsHggvDNLIhJ19
 kJvfoAY1Hpg+CndEXEL+FV6NbIvwBbyCt9h8EsWNL0oB+xuuVEpAPORHF9x3eCZgEfMo
 /2gg==
Subject: [PATCH 1/2] Use \tco{} for API names inside of tables
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
 <20170104014004.GG3742@linux.vnet.ibm.com>
 <97f7304e-d989-1b21-0fed-465d540dd66d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1083e685-0c8a-7c42-6e53-e47d2e84a1b0@gmail.com>
Date: Wed, 4 Jan 2017 20:36:57 +0900
MIME-Version: 1.0
In-Reply-To: <97f7304e-d989-1b21-0fed-465d540dd66d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 93c2f3e7f773e15ff21ef2ea11a7d6c4e230b3c0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 4 Jan 2017 18:38:02 +0900
Subject: [PATCH 1/2] Use \tco{} for API names inside of tables

For people searching API names in latex sources, escaping by "\"
should be avoided.

Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex           | 20 ++++++++++----------
 appendix/whymb/whymemorybarriers.tex | 14 +++++++-------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 74d4f7b..721d893 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -523,7 +523,7 @@ on this weaker if-then conditional ordering guarantee.
 	\nf{CPU 1} &		\nf{CPU 2} \\
 	\hline
 	access(A);	&	access(B); \\
-	smp\_mb();	&	smp\_mb(); \\
+	\tco{smp_mb();}	&	\tco{smp_mb();} \\
 	access(B);	&	access(A); \\
 \end{tabular}
 \end{minipage}
@@ -618,7 +618,7 @@ pairings that portable software may depend on.
 		\nf{CPU 1} &		\nf{CPU 2} \\
 		\hline
 		A=1;		&	Y=B; \\
-		smp\_mb();	&	smp\_mb(); \\
+		\tco{smp_mb();}	&	\tco{smp_mb();} \\
 		B=1;		&	X=A; \\
 	\end{tabular}
 	\end{minipage}
@@ -650,7 +650,7 @@ pairings that portable software may depend on.
 		\nf{CPU 1} &		\nf{CPU 2} \\
 		\hline
 		X=A;            &	Y=B; \\
-		smp\_mb();	&	smp\_mb(); \\
+		\tco{smp_mb();}	&	\tco{smp_mb();} \\
 		B=1;            &	A=1; \\
 	\end{tabular}
 	\end{minipage}
@@ -687,7 +687,7 @@ pairings that portable software may depend on.
 		\nf{CPU 1} &		\nf{CPU 2} \\
 		\hline
 		X=A;		&	B=2; \\
-		smp\_mb();	&	smp\_mb(); \\
+		\tco{smp_mb();}	&	\tco{smp_mb();} \\
 		B=1;		&	A=1; \\
 	\end{tabular}
 	\end{minipage}
@@ -768,7 +768,7 @@ keep in mind that they used to be a \emph{lot} harder on some systems!
 		\nf{CPU 1} &		\nf{CPU 2} \\
 		\hline
 		A=1;		&	B=2; \\
-		smp\_mb();	&	smp\_mb(); \\
+		\tco{smp_mb();}	&	\tco{smp_mb();} \\
 		B=1;		&	A=2; \\
 	\end{tabular}
 	\end{minipage}
@@ -2076,12 +2076,12 @@ This is demonstrated by two related examples, with the initial values of
 \begin{tabular}{l|p{1.5in}}
 	\nf{CPU 0} &	\nf{CPU 1} \\
 	\hline
-	r1 = READ\_ONCE(x); &
-		r2 = READ\_ONCE(y); \\
+	\tco{r1 = READ_ONCE(x);} &
+		\tco{r2 = READ_ONCE(y);} \\
 	if (r1 > 0) &
 		if (r2 > 0) \\
-	~~~WRITE\_ONCE(y, 1); &
-		~~~WRITE\_ONCE(x, 1); \\
+	~~~\tco{WRITE_ONCE(y, 1);} &
+		~~~\tco{WRITE_ONCE(x, 1);} \\
 	\multicolumn{2}{l}{~} \\
 	\multicolumn{2}{l}{\tco{assert(!(r1 == 1 && r2 == 1));}} \\
 \end{tabular}
@@ -2099,7 +2099,7 @@ not), then adding the following CPU would guarantee a related assertion:
 \begin{tabular}{l}
 	\nf{CPU 2} \\
 	\hline
-	WRITE\_ONCE(y, 1); \\
+	\tco{WRITE_ONCE(y, 1);} \\
 	\multicolumn{1}{l}{~} \\
 	\multicolumn{1}{l}{\tco{assert(!(r1 == 1 && r2 == 1 && x == 1));}} \\
 \end{tabular}
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index bb8808d..0956226 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1363,9 +1363,9 @@ Each of ``a'', ``b'', and ``c'' are initially zero.
 	\hline
 	\hline
 	a = 1;		 &		& \\
-	smp\_wmb(); 	 & while (b == 0); & \\
+	\tco{smp_wmb();} & while (b == 0); & \\
 	b = 1;		 & c = 1;	& z = c; \\
-			 &		& smp\_rmb(); \\
+			 &		& \tco{smp_rmb();} \\
 			 &		& x = a; \\
 			 &		& assert(z == 0 || x == 1); \\
 \end{tabular}}
@@ -1423,8 +1423,8 @@ Both ``a'' and ``b'' are initially zero.
 	\hline
 	\hline
 	a = 1;	     & while (a == 0); & \\
-		     & smp\_mb();	& y = b; \\
-		     & b = 1;		& smp\_rmb(); \\
+		     & \tco{smp_mb();}	& y = b; \\
+		     & b = 1;		& \tco{smp_rmb();} \\
 		     &			& x = a; \\
 		     &			& assert(y == 0 || x == 1); \\
 \end{tabular}}
@@ -1465,13 +1465,13 @@ All variables are initially zero.
 	\hline
 	\hline
  1 &	a = 1; &			& \\
- 2 &	smb\_wmb();	&		& \\
+ 2 &	\tco{smb_wmb();}&		& \\
  3 &	b = 1;		& while (b == 0); & while (b == 0); \\
- 4 &			& smp\_mb();	& smp\_mb(); \\
+ 4 &			& \tco{smp_mb();}& \tco{smp_mb();} \\
  5 &			& c = 1;	& d = 1; \\
  6 &	while (c == 0); &		& \\
  7 &	while (d == 0); &		& \\
- 8 &	smp\_mb();	&		& \\
+ 8 &	\tco{smp_mb();}	&		& \\
  9 &	e = 1; &			& assert(e == 0 || a == 1); \\
 \end{tabular}}
 \caption{Memory Barrier Example 3}
-- 
2.7.4


