Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=potFhUFj2t9cAtmZpQiPLp40YItoO8g7svkhd0qZcb8=;
 b=oDK833Ev//Edt18JiqCZVMHwY8tAa5jrEv4Oh+RmErO07PQmZmLjTLScrbrx3uafQX
 6tWEet5o/Zaf/ARXVgBq0UImqeja3jwCoo82YtMECLU3kKN0pimOPbz9SGJQ9g1Dp1nd
 b7KzHshy39WtcIrrGY83LncLVxgdzrnS9P6Wvvi4qi799FpM4YRBrygD04jnfdj65P/7
 tcOoRUf6Qwv9v51VXnGd3pL1iGIXR0wH5A4HMdF7mQu2QUNvtzNnWQ6G7OBOMSxijlvd
 JGk3wFPLY8TXUCWC/0d672oCybqVYQOxaHPW2TZ/yRY3LU8gxlFnemaNl/NNzDZ5Kx6Y
 AX9Q==
Subject: [PATCH 3/3] advsync: Tweak vertical spacing around code snippets
References: <5711F2CF.1030907@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5711F4FC.4070000@gmail.com>
Date: Sat, 16 Apr 2016 17:17:00 +0900
MIME-Version: 1.0
In-Reply-To: <5711F2CF.1030907@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e9f9f2126a24841bb19970292716819f0300872b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Sat, 16 Apr 2016 12:50:54 +0900
Subject: [PATCH 3/3] advsync: Tweak vertical spacing around code snippets

In the `Guarantees` subsection, code snippets have wider
vertical spacings around them than other code snippets in the
section.
This is supposedly caused by the interaction between the
'enumerate' tag and the 'minipage' tag.
This commit removes \vspace{} commands around minipages within
enumerations. Some \vspace{} commands which break sentences
are reduced in width and moved into minipages to stabilize the
resulting vertical spacings.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 0ef020f..505adc0 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1236,72 +1236,61 @@ There are some minimal guarantees that may be expected of a CPU:
 \item	On any given CPU, dependent memory accesses will be issued in order,
 	with respect to itself.  This means that for:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
 Q = P; D = *Q;
 \end{verbatim}
 \end{minipage}
-\vspace{5pt}

 	the CPU will issue the following memory operations:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
 Q = LOAD P, D = LOAD *Q
 \end{verbatim}
 \end{minipage}
-\vspace{5pt}

 	and always in that order.

 \item	Overlapping loads and stores within a particular CPU will appear to be
 	ordered within that CPU.  This means that for:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
 a = *X; *X = b;
 \end{verbatim}
 \end{minipage}
-\vspace{5pt}

 	the CPU will only issue the following sequence of memory operations:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
 a = LOAD *X, STORE *X = b
 \end{verbatim}
+\vspace{1pt}
 \end{minipage}
-\vspace{5pt}

 	And for:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
 *X = c; d = *X;
 \end{verbatim}
 \end{minipage}
-\vspace{5pt}

 	the CPU will only issue:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
 STORE *X = c, d = LOAD *X
 \end{verbatim}
 \end{minipage}
-\vspace{5pt}

 	(Loads and stores overlap if they are targeted at overlapping pieces of
 	memory).
@@ -1317,19 +1306,15 @@ And there are a number of things that \emph{must} or \emph{must not} be assumed:
 \item	It \emph{must not} be assumed that independent loads and stores will
 	be issued in the order given.  This means that for:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
 X = *A; Y = *B; *D = Z;
 \end{verbatim}
 \end{minipage}
-\vspace{5pt}

 	we may get any of the following sequences:

-
-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
@@ -1341,23 +1326,19 @@ STORE *D = Z,  X = LOAD *A,  Y = LOAD *B
 STORE *D = Z,  Y = LOAD *B,  X = LOAD *A
 \end{verbatim}
 \end{minipage}
-\vspace{5pt}

 \item	It \emph{must} be assumed that overlapping memory accesses may
 	be merged or discarded.  This means that for:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
 X = *A; Y = *(A + 4);
 \end{verbatim}
 \end{minipage}
-\vspace{5pt}

 	we may get any one of the following sequences:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
@@ -1365,23 +1346,20 @@ X = LOAD *A; Y = LOAD *(A + 4);
 Y = LOAD *(A + 4); X = LOAD *A;
 {X, Y} = LOAD {*A, *(A + 4) };
 \end{verbatim}
+\vspace{1pt}
 \end{minipage}
-\vspace{5pt}

 	And for:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
 *A = X; *(A + 4) = Y;
 \end{verbatim}
 \end{minipage}
-\vspace{5pt}

 	we may get any of:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
@@ -1389,23 +1367,20 @@ STORE *A = X; STORE *(A + 4) = Y;
 STORE *(A + 4) = Y; STORE *A = X;
 STORE {*A, *(A + 4) } = {X, Y};
 \end{verbatim}
+\vspace{1pt}
 \end{minipage}
-\vspace{5pt}

 	Finally, for:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
 *A = X; *A = Y;
 \end{verbatim}
 \end{minipage}
-\vspace{5pt}

 	we may get either of:

-\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
@@ -1413,7 +1388,6 @@ STORE *A = X; STORE *A = Y;
 STORE *A = Y;
 \end{verbatim}
 \end{minipage}
-\vspace{5pt}

 \end{enumerate}

-- 
1.9.1


