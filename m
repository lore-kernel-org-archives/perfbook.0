Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=NZ0OWJ0P0zwufgMlY5NghRpnfo3RWXoMp6gfi+IGO+s=;
 b=iphsL8HppNMJm0kFR7BqMUbQlnKzJJtNSG+lShPzNLuk0lfn69blveoUhBpxeK59DL
 6okcB4J2uXr18WHMymIAc8sugsZXU05JPnd8r68aMXHvfxIEHlHi5XxWMv8Ov9OGFVt2
 1oXdte+F0AAoM+BCK2LzUB8+lh5h+SUzVxaPiKWzCw5whHf1ULIBBwu2PLgdBFh43RC6
 06N5oaRK+4z8j8RdZ3qEDViu2ooamu0ROEGXHpYAgbadsz4EupFJRMl+CheX5pxOmwXu
 0OLyMx4BdxzvBq179jYJhHZhAejTWn9P/QJB32vFJaf5Y0cU0XK4kzBc2OQo+8hlnRpD
 ayBg==
Subject: [PATCH 3/6] whymb: Convert to 'description' (part 3)
References: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5156f730-9859-fc78-e4b6-4282eecfcb64@gmail.com>
Date: Mon, 20 Mar 2017 00:51:12 +0900
MIME-Version: 1.0
In-Reply-To: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 80cfeef3af82ce22777ed075206f5015d071095d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 19 Mar 2017 23:28:44 +0900
Subject: [PATCH 3/6] whymb: Convert to 'description' (part 3)

This list is also a good candidate to convert to "description".
\tco{} is safer than \co{} in labels.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 49d29ba..90da0df 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1969,8 +1969,8 @@ Its memory model is similar to that of Power
 (see Section~\ref{sec:app:whymb:POWER / PowerPC}, but ARM uses a
 different set of memory-barrier instructions~\cite{ARMv7A:2010}:

-\begin{enumerate}
-\item	\co{DMB} (data memory barrier) causes the specified type of
+\begin{description}
+\item	[\tco{DMB}] (data memory barrier) causes the specified type of
 	operations to \emph{appear} to have completed before any
 	subsequent operations of the same type.
 	The ``type'' of operations can be all operations or can be
@@ -1979,20 +1979,20 @@ different set of memory-barrier instructions~\cite{ARMv7A:2010}:
 	In addition, ARM allows cache coherence to have one of three
 	scopes: single processor, a subset of the processors
 	(``inner'') and global (``outer'').
-\item	\co{DSB} (data synchronization barrier) causes the specified
+\item	[\tco{DSB}] (data synchronization barrier) causes the specified
 	type of operations to actually complete before any subsequent
 	operations (of any type) are executed.
 	The ``type'' of operations is the same as that of \co{DMB}.
 	The \co{DSB} instruction was called \co{DWB} (drain write buffer
 	or data write barrier, your choice) in early versions of the
 	ARM architecture.
-\item	\co{ISB} (instruction synchronization barrier) flushes the CPU
+\item	[\tco{ISB}] (instruction synchronization barrier) flushes the CPU
 	pipeline, so that all instructions following the \co{ISB}
 	are fetched only after the \co{ISB} completes.
 	For example, if you are writing a self-modifying program
 	(such as a JIT), you should execute an \co{ISB} between
 	generating the code and executing it.
-\end{enumerate}
+\end{description}

 None of these instructions exactly match the semantics of Linux's
 \co{rmb()} primitive, which must therefore be implemented as a full
-- 
2.7.4


