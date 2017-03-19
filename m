Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ErYr/lgyEmxh27FFQtdPGif9mMggWuEbkVQNueqyEPE=;
 b=Tl8DgcKa0dN3AD7JNScW1wO4dB1l92C7g/Dk7MbXBprcH6WeGbjXGVdk/SIDoc5OAd
 xTknqOgS7hPUOrUOrilHJFGIJhg1p6g1CLrENx4ybEgECvv74fjG0zjQl3edttDjsB9T
 EZmKvlAYFXr4qeZsJQcXmpgtrCiNcKhGCEy+rUpogh6hCfkVmzORsSaV530nEjLxZr8m
 lLmU66tjDO+XKLkxR6xhRIpKdcOGaJGtuABqeMDVuM5icKZoulQhfgPZcEEptNF8GDAH
 HMYRkqJLQRhpg2w4Y6YoI2ohjE9U7/RVxql6j/spjDXp2fBg3lswCjypkRm7sy3/0tHo
 ALBQ==
Subject: [PATCH 5/6] whymb: Convert to 'description' (part 4)
References: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6d993155-7422-f408-bf31-35a384735a63@gmail.com>
Date: Mon, 20 Mar 2017 00:54:22 +0900
MIME-Version: 1.0
In-Reply-To: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 101cacb83ff135f713afecd1edefbc8b5df7b8bc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 19 Mar 2017 23:32:24 +0900
Subject: [PATCH 5/6] whymb: Convert to 'description' (part 4)

This list is not necessarily to be enumerated and suited to
"description". Using \tco{} in labels enables them to be
in bold face. (Note: "\tt" specifies "normal" typewriter text.)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 9015a85..d6dd15f 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -2138,11 +2138,11 @@ barrier.
 The POWER and PowerPC\textsuperscript{\textregistered}
 CPU families have a wide variety of memory-barrier
 instructions~\cite{PowerPC94,MichaelLyons05a}:
-\begin{enumerate}
-\item	{\tt sync} causes all preceding operations to {\em appear to have}
+\begin{description}
+\item	[\tco{sync}] causes all preceding operations to {\em appear to have}
 	completed before any subsequent operations are started.
 	This instruction is therefore quite expensive.
-\item	{\tt lwsync} (light-weight sync) orders loads with respect to
+\item	[\tco{lwsync}] (light-weight sync) orders loads with respect to
 	subsequent loads and stores, and also orders stores.
 	However, it does {\em not} order stores with respect to subsequent
 	loads.
@@ -2151,20 +2151,20 @@ instructions~\cite{PowerPC94,MichaelLyons05a}:
 	SPARC TSO.
 	The \co{lwsync} instruction may be used to implement
 	load-acquire and store-release operations.
-\item	{\tt eieio} (enforce in-order execution of I/O, in case you
+\item	[\tco{eieio}] (enforce in-order execution of I/O, in case you
 	were wondering) causes all preceding cacheable stores to appear
 	to have completed before all subsequent stores.
 	However, stores to cacheable memory are ordered separately from
 	stores to non-cacheable memory, which means that {\tt eieio}
 	will not force an MMIO store to precede a spinlock release.
-\item	{\tt isync} forces all preceding instructions to appear to have
+\item	[\tco{isync}] forces all preceding instructions to appear to have
 	completed before any subsequent instructions start execution.
 	This means that the preceding instructions must have progressed
 	far enough that any traps they might generate have either happened
 	or are guaranteed not to happen, and that any side-effects of
 	these instructions (for example, page-table changes) are seen by the
 	subsequent instructions.
-\end{enumerate}
+\end{description}

 Unfortunately, none of these instructions line up exactly with Linux's
 {\tt wmb()} primitive, which requires {\em all} stores to be ordered,
-- 
2.7.4


