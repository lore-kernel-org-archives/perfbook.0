Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kLnxkVWhNbT67RRIGz6eUkGP0IIj6UBfmMvKAuCBiMg=;
 b=b5PHU8fGAGrdbVKhcokl3AukBZbWhXQtISSG5ljViqh+xjvPqDwfSsVAViXd9L7goX
 x4DF+OT8mOAdWZyjVCwZ61LDJeWz5Ak+1E39JuoWKASqCBhsjAnoSSKrcmyVecS9U1hm
 ROzWyaczV/HGWqXRi19INCZu8DSVetg9C8gGVR5BCWqqBg3Z5c/90R/cRd4mR9TqRPxu
 Gkuz24aFV0CLzQguI07KlBvrWbaaZkrI7aJxDBxoBE0QyKx8Nz//+q609TSgFWOI4aof
 eENXrJWW5ww8f5SOASyv8ik5xsjeMMKq+YCdAxsRmHEn/a42te0350DyL1dX9CMej7sS
 NNiA==
Subject: [PATCH 14/14] advsync: Use pseudo asm in sequence in 'SMP Barrier
 Pairing'
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fbc7e1ab-3afe-4f9c-99ed-6f03029f33e0@gmail.com>
Date: Mon, 17 Apr 2017 07:27:39 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6efc224d8e6d2b64bf7a86b52d03de01ccea7032 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 17:07:46 +0900
Subject: [PATCH 14/14] advsync: Use pseudo asm in sequence in 'SMP Barrier Pairing'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 100 ++++++++++++++++++++++-----------------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 9b878f3..f36994e 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2211,14 +2211,14 @@ write barrier, though, again, a general barrier is viable:
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	\nf{CPU 1} &	\nf{CPU 2} \\
+	\nf{CPU 1}	& \nf{CPU 2} \\
 	\hline
-	A = 1; & \\
-	<write barrier> & \\
-	B = 2;	&	\\
-		&	X = B; \\
-		&	<read barrier> \\
-		&	Y = A; \\
+	STORE A = 1	& \\
+	<write barrier>	& \\
+	STORE B = 2	& \\
+			& X = LOAD B \\
+			& <read barrier> \\
+			& Y = LOAD A \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -2230,14 +2230,14 @@ Or:
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	\nf{CPU 1} &	\nf{CPU 2} \\
+	\nf{CPU 1}	& \nf{CPU 2} \\
 	\hline
-	A = 1; & \\
-	<write barrier> & \\
-	B = \&A; &	\\
-		&	X = B; \\
-		&	<data dependency barrier> \\
-		&	Y = *X; \\
+	STORE A = 1	& \\
+	<write barrier>	& \\
+	STORE B = \&A	& \\
+			& X = LOAD B \\
+			& <data dependency barrier> \\
+			& Y = LOAD *X \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -2300,14 +2300,14 @@ loads.  Consider the following sequence of events with initial values
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	\nf{CPU 1} &	\nf{CPU 2} \\
+	\nf{CPU 1}	& \nf{CPU 2} \\
 	\hline
-	A = 1; & \\
-	B = 2; & \\
-	<write barrier> & \\
-	C = \&B; & 	LOAD X\\
-	D = 4;	&	LOAD C \nf{(gets \tco{&B})} \\
-		&	LOAD *C \nf{(reads \tco{B})} \\
+	STORE A = 1	& \\
+	STORE B = 2	& \\
+	<write barrier>	& \\
+	STORE C = \&B	& LOAD X\\
+	STORE D = 4	& LOAD C \nf{(gets \tco{&B})} \\
+			& LOAD *C \nf{(reads \tco{B})} \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -2336,15 +2336,15 @@ values of {\tt \{B~=~7, X~=~9, Y~=~8, C~=~\&Y\}}:
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	\nf{CPU 1} &	\nf{CPU 2} \\
+	\nf{CPU 1}	& \nf{CPU 2} \\
 	\hline
-	A = 1; & \\
-	B = 2; & \\
-	<write barrier> & \\
-	C = \&B; & 	LOAD X\\
-	D = 4;	&	LOAD C \nf{(gets \tco{&B})} \\
-		&	<data dependency barrier> \\
-		&	LOAD *C \nf{(reads \tco{B})} \\
+	STORE A = 1	& \\
+	STORE B = 2	& \\
+	<write barrier>	& \\
+	STORE C = \&B	& LOAD X\\
+	STORE D = 4	& LOAD C \nf{(gets \tco{&B})} \\
+			& <data dependency barrier> \\
+			& LOAD *C \nf{(reads \tco{B})} \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -2368,13 +2368,13 @@ following sequence of events, with initial values
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	\nf{CPU 1} &	\nf{CPU 2} \\
+	\nf{CPU 1}	& \nf{CPU 2} \\
 	\hline
-	A = 1; & \\
-	<write barrier> & \\
-	B = 2; & \\
-		&	LOAD B \\
-		&	LOAD A \\
+	STORE A = 1	& \\
+	<write barrier>	& \\
+	STORE B = 2	& \\
+			& LOAD B \\
+			& LOAD A \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -2399,14 +2399,14 @@ and the load of~\co{A} on CPU~2, again with initial values of
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	\nf{CPU 1} &	\nf{CPU 2} \\
+	\nf{CPU 1}	& \nf{CPU 2} \\
 	\hline
-	A = 1; & \\
-	<write barrier> & \\
-	B = 2; & \\
-		&	LOAD B \\
-		&	<read barrier> \\
-		&	LOAD A \\
+	STORE A = 1	& \\
+	<write barrier>	& \\
+	STORE B = 2	& \\
+			& LOAD B \\
+			& <read barrier> \\
+			& LOAD A \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -2432,15 +2432,15 @@ with the same initial values of
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
-	\nf{CPU 1} &	\nf{CPU 2} \\
+	\nf{CPU 1}	& \nf{CPU 2} \\
 	\hline
-	A = 1; & \\
-	<write barrier> & \\
-	B = 2; & \\
-		&	LOAD B \\
-		&	LOAD A \nf{(1\textsuperscript{st})} \\
-		&	<read barrier> \\
-		&	LOAD A \nf{(2\textsuperscript{nd})} \\
+	STORE A = 1	& \\
+	<write barrier>	& \\
+	STORE B = 2	& \\
+			& LOAD B \\
+			& LOAD A \nf{(1\textsuperscript{st})} \\
+			& <read barrier> \\
+			& LOAD A \nf{(2\textsuperscript{nd})} \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
-- 
2.7.4


