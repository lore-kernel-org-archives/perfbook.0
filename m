Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bRbJX442shyykubqMAJ+sRWOA3WlNwMr8Ti/bQ33SRs=;
 b=JOZ2TEe46bDNoQd9zI2qEAtawYBA/Ae6gXu0kxYihI8Nv40EiGA4NllFzDfohH7MvW
 Zwe1wrrKn061p6BEdUknC8Tp7joV65gyRQuzOC90zldNO3rxl2QGZFSZ/MlzCXYXxrOj
 B+HD+FdJEAZRNDsg0qEhjXGj91noUPb5LsmKI4VAwxRks2voHC/+x/ZdxlV8LRzDTkW1
 ucbhtNZRAe1mMDDmUDAtc/nkmFUjCh6UHGKRgeHyB3TmTmu2I5Sj7nVt9l9zaLuB55PG
 XJIkymD1A52ITqEO/TFEjbInnE7R1meGPwzLhdRDY7Rw0uKhWV0MDQx/3ZAu/5toGaQ3
 qE0g==
Subject: [PATCH 13/14] advsync: Use pseudo asm in sequence in 'Data Dependency
 Barriers'
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <edadfa20-ea24-0c3c-cce0-9e85a01caf96@gmail.com>
Date: Mon, 17 Apr 2017 07:26:43 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2b779ea16b0185b121063faa0ca534a75d67fc8d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 16:14:24 +0900
Subject: [PATCH 13/14] advsync: Use pseudo asm in sequence in 'Data Dependency Barriers'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 2b36214..9b878f3 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1622,8 +1622,8 @@ Section~\ref{sec:advsync:Device Operations}).
 	\begin{minipage}[t]{\columnwidth}
 	\small
 	\begin{verbatim}
-	a = 1;
-	b = 1;
+	STORE a = 1
+	STORE b = 1
 	<write barrier>
 	\end{verbatim}
 	\end{minipage}
@@ -1673,7 +1673,8 @@ of the confines of a given architecture:

 The usage requirements of data dependency barriers are a little subtle, and
 it's not always obvious that they're needed.  To illustrate, consider the
-following sequence of events, with initial values
+following sequence of events (in pseudo asm), with initial values of shared
+variables
 {\tt \{A~=~1, B~=~2, C~=~3, P~=~\&A, Q~=~\&C\}}:

 \vspace{5pt}
@@ -1681,13 +1682,13 @@ following sequence of events, with initial values
 \tt
 \scriptsize
 \begin{tabular}{l|l}
-	\nf{CPU 1} &	\nf{CPU 2} \\
+	\nf{CPU 1}	& \nf{CPU 2} \\
 	\hline
-	B = 4; & \\
-	<write barrier> & \\
-	P = \&B; &	\\
-		&	Q = P; \\
-		&	D = *Q; \\
+	STORE B = 4	& \\
+	<write barrier>	& \\
+	STORE P = \&B	& \\
+			& Q = LOAD P \\
+			& D = LOAD *Q \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -1734,14 +1735,14 @@ address load and the data load (again with initial values of
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	\nf{CPU 1} &	\nf{CPU 2} \\
+	\nf{CPU 1}	& \nf{CPU 2} \\
 	\hline
-	B = 4; & \\
-	<write barrier> & \\
-	P = \&B; &	\\
-		&	Q = P; \\
-		&	<data dependency barrier> \\
-		&	D = *Q; \\
+	STORE B = 4	& \\
+	<write barrier>	& \\
+	STORE P = \&B	& \\
+			& Q = LOAD P \\
+			& <data dependency barrier> \\
+			& D = LOAD *Q \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
-- 
2.7.4


