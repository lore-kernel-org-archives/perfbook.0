Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MMzs2uv0NxzXSegW+ymA9Y2BQXGv8AV5dRH10v6Xf9Q=;
 b=GrluRGbwO/phw4ANBkMQKFhQNc0Mzr4ldY2zifRLCoE95MigvDJ0d/uz3mjxNKZRhD
 ueY5Ax+JBgBK3RnGZ0JcHeLBCfWpXnilmiWipNkl4slC/MqKtaiZ/msyo3tp0a87ToD5
 Z4z0uhTYNMAWL23pQQwURAd7RLSxeJdVAWIfxNzVLH+XZ3w13ZRiP8DdSMAB4MmshQJ+
 AyDgS58rfyJyAX1yGo9C+uwXQtYMWXU1vkVK02h3WYI8ydOAxRm+7AbsDDaDGkLboJ7V
 kxVOUFLjOmUjDQ/MGoVl3WqXon1BcqYTia1IXjVKdir46zmPRrGrhO0Nr7QUuAZmkGXQ
 V5zw==
Subject: [PATCH 10/14] advsync: Use READ_ONCE()/WRITE_ONCE() in sequence in
 'Guarantees'
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <83cb31e0-c27d-297a-9cc9-3ec95f24226b@gmail.com>
Date: Mon, 17 Apr 2017 07:23:36 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e3b3c4d1b9bc77cbedd5282ae00c26bc853750d9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 10:55:49 +0900
Subject: [PATCH 10/14] advsync: Use READ_ONCE()/WRITE_ONCE() in sequence in 'Guarantees'

Using pseudo-asm code for sequences here also gives redundant look.
Using READ_ONCE/WRITE_ONCE() instead is a good idea.
In memory-barriers.txt, sequences corresponding to the latter part
of this section are not yet enclosed by READ_ONCE()/WRITE_ONCE(),
but memory subsystem can merge overlapping accesses even if these
directives are used.

Also use "," as delimiters in the memory access ordering lists.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index f94b113..0cd690b 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1296,12 +1296,12 @@ There are some minimal guarantees that may be expected of a CPU:

 \begin{enumerate}
 \item	On any given CPU, dependent memory accesses will be issued in order,
-	with respect to itself.  This means that for:
+	with respect to itself.  This means that for a sequence (in C):

 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-Q = P; D = *Q;
+Q = READ_ONCE(P); D = READ_ONCE(*Q);
 \end{verbatim}
 \end{minipage}

@@ -1322,7 +1322,7 @@ Q = LOAD P, D = LOAD *Q
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-a = *X; *X = b;
+a = READ_ONCE(*X); WRITE_ONCE(*X, b);
 \end{verbatim}
 \end{minipage}

@@ -1341,7 +1341,7 @@ a = LOAD *X, STORE *X = b
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-*X = c; d = *X;
+WRITE_ONCE(*X, c); d = READ_ONCE(*X);
 \end{verbatim}
 \end{minipage}

@@ -1371,7 +1371,7 @@ And there are a number of things that \emph{must} or \emph{must not} be assumed:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-X = *A; Y = *B; *D = Z;
+X = READ_ONCE(*A); Y = READ_ONCE(*B); WRITE_ONCE(*D, Z);
 \end{verbatim}
 \end{minipage}

@@ -1395,7 +1395,7 @@ STORE *D = Z,  Y = LOAD *B,  X = LOAD *A
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-X = *A; Y = *(A + 4);
+X = READ_ONCE(*A); Y = READ_ONCE(*(A + 4));
 \end{verbatim}
 \end{minipage}

@@ -1404,9 +1404,9 @@ X = *A; Y = *(A + 4);
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-X = LOAD *A; Y = LOAD *(A + 4);
-Y = LOAD *(A + 4); X = LOAD *A;
-{X, Y} = LOAD {*A, *(A + 4) };
+X = LOAD *A, Y = LOAD *(A + 4)
+Y = LOAD *(A + 4), X = LOAD *A
+{X, Y} = LOAD {*A, *(A + 4) }
 \end{verbatim}
 \vspace{1pt}
 \end{minipage}
@@ -1416,7 +1416,7 @@ Y = LOAD *(A + 4); X = LOAD *A;
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-*A = X; *(A + 4) = Y;
+WRITE_ONCE(*A, X); WRITE_ONCE(*(A + 4), Y);
 \end{verbatim}
 \end{minipage}

@@ -1425,9 +1425,9 @@ Y = LOAD *(A + 4); X = LOAD *A;
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-STORE *A = X; STORE *(A + 4) = Y;
-STORE *(A + 4) = Y; STORE *A = X;
-STORE {*A, *(A + 4) } = {X, Y};
+STORE *A = X, STORE *(A + 4) = Y
+STORE *(A + 4) = Y, STORE *A = X
+STORE {*A, *(A + 4) } = {X, Y}
 \end{verbatim}
 \vspace{1pt}
 \end{minipage}
@@ -1437,7 +1437,7 @@ STORE {*A, *(A + 4) } = {X, Y};
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-*A = X; *A = Y;
+WRITE_ONCE(*A, X); WRITE_ONCE(*A, Y);
 \end{verbatim}
 \end{minipage}

@@ -1446,8 +1446,8 @@ STORE {*A, *(A + 4) } = {X, Y};
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-STORE *A = X; STORE *A = Y;
-STORE *A = Y;
+STORE *A = X, STORE *A = Y
+STORE *A = Y
 \end{verbatim}
 \end{minipage}

-- 
2.7.4


