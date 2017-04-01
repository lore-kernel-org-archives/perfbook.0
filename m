Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=O75ZVrPbhixcSdloBRNCoGZDHuePixr21oZsM6MzHOk=;
 b=HKgm89kGOMJP1UEqaG88o/IKSmH5bCQaZoB0afFctQc27ricMa2U+2Le0JX8UOtBn1
 XLJr5HxGz2DOwcBxOI3+Y/muwSC83JwACCgQ53C00fkfitXGt7a4bwP4jOPrz8UHzAD7
 I99OHcVi6TAY0b1XW9yhRJtEhNfqYUIlylf8XbE8G9nWZw4ii0mf/d0XeLVreRJoVtK4
 HaLESWLVH5BeVldJ1LL3Cl99toITM+oR/u0xs+HtRSPv/LvdLg5Y55nl1puazjTjNca7
 mtz12Sqjaeh0pqYpGfkMTN8qTEZXE5aZGgdQhd7SdOnwVF8pcOAGzfc8mkvYqdQLA1K4
 NIHg==
Subject: [RFC PATCH 03/12] advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 3)
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c94a5853-761b-2965-52e7-2c2d3182f904@gmail.com>
Date: Sat, 1 Apr 2017 11:12:56 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 24e62a5c8dff4f8af1120900c8c9695e573f6758 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 26 Mar 2017 00:55:06 +0900
Subject: [RFC PATCH 03/12] advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 3)

This mostly corresponds to the final part of commit 2e4f5382d12a
("locking/doc: Rename LOCK/UNLOCK to ACQUIRE/RELEASE") in Linux
kernel repository. This commit does simple replacements.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 90 +++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 322ffbc..8471f0a 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2767,10 +2767,10 @@ These implicit memory barriers provide the following guarantees:

 \subsubsection{Locking Examples}

-\paragraph{LOCK Followed by UNLOCK:}
-A LOCK followed by an UNLOCK may not be assumed to be a full memory barrier
-because it is possible for an access preceding the LOCK to happen after the
-LOCK, and an access following the UNLOCK to happen before the UNLOCK, and the
+\paragraph{ACQUIRE Followed by RELEASE:}
+An ACQUIRE followed by a RELEASE may not be assumed to be a full memory barrier
+because it is possible for an access preceding the ACQUIRE to happen after the
+ACQUIRE, and an access following the RELEASE to happen before the RELEASE, and the
 two accesses can themselves then cross.
 For example, the following:

@@ -2779,8 +2779,8 @@ For example, the following:
 \scriptsize
 \begin{verbatim}
   1 *A = a;
-  2 LOCK
-  3 UNLOCK
+  2 ACQUIRE
+  3 RELEASE
   4 *B = b;
 \end{verbatim}
 \end{minipage}
@@ -2792,24 +2792,24 @@ might well execute in the following order:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-  2 LOCK
+  2 ACQUIRE
   4 *B = b;
   1 *A = a;
-  3 UNLOCK
+  3 RELEASE
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}

-Again, always remember that LOCK and UNLOCK are permitted to let preceding
+Again, always remember that ACQUIRE and RELEASE are permitted to let preceding
 operations and following operations ``bleed in'' to the critical section
 respectively.

 \QuickQuiz{}
-	What sequence of LOCK-UNLOCK operations \emph{would}
+	What sequence of ACQUIRE-RELEASE operations \emph{would}
 	act as a full memory barrier?
 \QuickQuizAnswer{
-	A series of two back-to-back LOCK-UNLOCK operations, or, somewhat
-	less conventionally, an UNLOCK operation followed by a LOCK
+	A series of two back-to-back ACQUIRE-RELEASE operations, or, somewhat
+	less conventionally, a RELEASE operation followed by an ACQUIRE
 	operation.
 } \QuickQuizEnd

@@ -2823,8 +2823,8 @@ respectively.
 	exercise for the reader.
 } \QuickQuizEnd

-\paragraph{LOCK-Based Critical Sections:}
-Although a LOCK-UNLOCK pair does not act as a full memory barrier,
+\paragraph{Lock-Based Critical Sections:}
+Although an ACQUIRE-RELEASE pair does not act as a full memory barrier,
 these operations \emph{do} affect memory ordering.

 Consider the following code:
@@ -2835,10 +2835,10 @@ Consider the following code:
 \begin{verbatim}
   1 *A = a;
   2 *B = b;
-  3 LOCK
+  3 ACQUIRE
   4 *C = c;
   5 *D = d;
-  6 UNLOCK
+  6 RELEASE
   7 *E = e;
   8 *F = f;
 \end{verbatim}
@@ -2853,12 +2853,12 @@ operations concurrently:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-  3 LOCK
+  3 ACQUIRE
   1 *A = a; *F = f;
   7 *E = e;
   4 *C = c; *D = d;
   2 *B = b;
-  6 UNLOCK
+  6 RELEASE
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}
@@ -2869,23 +2869,23 @@ operations concurrently:
   \# & Ordering: legitimate or not? \\
   \hline
   \hline
-  1 & \verb|*A; *B; LOCK; *C; *D; UNLOCK; *E; *F;| \\
+  1 & \verb|*A; *B; ACQUIRE; *C; *D; RELEASE; *E; *F;| \\
   \hline
-  2 & \verb|*A; {*B; LOCK;} *C; *D; UNLOCK; *E; *F;| \\
+  2 & \verb|*A; {*B; ACQUIRE;} *C; *D; RELEASE; *E; *F;| \\
   \hline
-  3 & \verb|{*F; *A;} *B; LOCK; *C; *D; UNLOCK; *E;| \\
+  3 & \verb|{*F; *A;} *B; ACQUIRE; *C; *D; RELEASE; *E;| \\
   \hline
-  4 & \verb|*A; *B; {LOCK; *C;} *D; {UNLOCK; *E;} *F;| \\
+  4 & \verb|*A; *B; {ACQUIRE; *C;} *D; {RELEASE; *E;} *F;| \\
   \hline
-  5 & \verb|*B; LOCK; *C; *D; *A; UNLOCK; *E; *F;| \\
+  5 & \verb|*B; ACQUIRE; *C; *D; *A; RELEASE; *E; *F;| \\
   \hline
-  6 & \verb|*A; *B; *C; LOCK; *D; UNLOCK; *E; *F;| \\
+  6 & \verb|*A; *B; *C; ACQUIRE; *D; RELEASE; *E; *F;| \\
   \hline
-  7 & \verb|*A; *B; LOCK; *C; UNLOCK; *D; *E; *F;| \\
+  7 & \verb|*A; *B; ACQUIRE; *C; RELEASE; *D; *E; *F;| \\
   \hline
-  8 & \verb|{*B; *A; LOCK;} {*D; *C;} {UNLOCK; *F; *E;}| \\
+  8 & \verb|{*B; *A; ACQUIRE;} {*D; *C;} {RELEASE; *F; *E;}| \\
   \hline
-  9 & \verb|*B; LOCK; *C; *D; UNLOCK; {*F; *A;} *E;| \\
+  9 & \verb|*B; ACQUIRE; *C; *D; RELEASE; {*F; *A;} *E;| \\
 \end{tabular}
 \caption{Lock-Based Critical Sections}
 \label{tab:advsync:Lock-Based Critical Sections}
@@ -2896,26 +2896,26 @@ operations concurrently:
 	concurrently, which of the rows of
 	Table~\ref{tab:advsync:Lock-Based Critical Sections}
 	are legitimate reorderings of the assignments to variables
-	``A'' through ``F'' and the LOCK/UNLOCK operations?
-	(The order in the code is A, B, LOCK, C, D, UNLOCK, E, F.)
+	``A'' through ``F'' and the ACQUIRE/RELEASE operations?
+	(The order in the code is {\tt *A, *B, ACQUIRE, *C, *D, RELEASE, *E, *F}.)
 	Why or why not?
 \QuickQuizAnswer{
 	\begin{enumerate}
 	\item	Legitimate, executed in order.
 	\item	Legitimate, the lock acquisition was executed concurrently
 		with the last assignment preceding the critical section.
-	\item	Illegitimate, the assignment to ``F'' must follow the LOCK
+	\item	Illegitimate, the assignment to ``F'' must follow the ACQUIRE
 		operation.
-	\item	Illegitimate, the LOCK must complete before any operation in
-		the critical section.  However, the UNLOCK may legitimately
+	\item	Illegitimate, the ACQUIRE must complete before any operation in
+		the critical section.  However, the RELEASE may legitimately
 		be executed concurrently with subsequent operations.
-	\item	Legitimate, the assignment to ``A'' precedes the UNLOCK,
+	\item	Legitimate, the assignment to ``A'' precedes the RELEASE,
 		as required, and all other operations are in order.
-	\item	Illegitimate, the assignment to ``C'' must follow the LOCK.
-	\item	Illegitimate, the assignment to ``D'' must precede the UNLOCK.
+	\item	Illegitimate, the assignment to ``C'' must follow the ACQUIRE.
+	\item	Illegitimate, the assignment to ``D'' must precede the RELEASE.
 	\item	Legitimate, all assignments are ordered with respect to the
-		LOCK and UNLOCK operations.
-	\item	Illegitimate, the assignment to ``A'' must precede the UNLOCK.
+		ACQUIRE and RELEASE operations.
+	\item	Illegitimate, the assignment to ``A'' must precede the RELEASE.
 	\end{enumerate}
 } \QuickQuizEnd

@@ -2932,10 +2932,10 @@ a pair of locks named ``M'' and ``Q''.
   \nf{CPU 1} &	\nf{CPU 2} \\
   \hline
   A = a; &	E = e; \\
-  LOCK M; &	LOCK Q; \\
+  ACQUIRE M; &	ACQUIRE Q; \\
   B = b; &	F = f; \\
   C = c; &	G = g; \\
-  UNLOCK M; &	UNLOCK Q; \\
+  RELEASE M; &	RELEASE Q; \\
   D = d; &	H = h; \\
 \end{tabular}}
 \caption{Ordering With Multiple Locks}
@@ -2953,10 +2953,10 @@ described in the previous section.
 \QuickQuizAnswer{
 	All CPUs must see the following ordering constraints:
 	\begin{enumerate}
-	\item	LOCK M precedes B, C, and D.
-	\item	UNLOCK M follows A, B, and C.
-	\item	LOCK Q precedes F, G, and H.
-	\item	UNLOCK Q follows E, F, and G.
+	\item	ACQUIRE M precedes B, C, and D.
+	\item	RELEASE M follows A, B, and C.
+	\item	ACQUIRE Q precedes F, G, and H.
+	\item	RELEASE Q follows E, F, and G.
 	\end{enumerate}
 } \QuickQuizEnd

@@ -2972,10 +2972,10 @@ Table~\ref{tab:advsync:Ordering With Multiple CPUs on One Lock}?
   \nf{CPU 1} &	\nf{CPU 2} \\
   \hline
   A = a; &	E = e; \\
-  LOCK M; &	LOCK M; \\
+  ACQUIRE M; &	ACQUIRE M; \\
   B = b; &	F = f; \\
   C = c; &	G = g; \\
-  UNLOCK M; &	UNLOCK M; \\
+  RELEASE M; &	RELEASE M; \\
   D = d; &	H = h; \\
 \end{tabular}}
 \caption{Ordering With Multiple CPUs on One Lock}
-- 
2.7.4


