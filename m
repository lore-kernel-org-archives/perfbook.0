Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qHag/Q4UOw7Y0Kc2yiLABemV081Tjq+A7ZzndSMsHOM=;
        b=GSihXMyHgdehZautIxp9Fe6cc+IBU3Ahk9v67NNV4qqYG/b7BriwTpbplOO/HyHwfq
         E20e2XH+QPX2BVkqfkIQsFSp8X0zv+Uo19jnNP8LBx/r9xTxiBMpQHFZXBVj6/b9Z53S
         BuUc8dnB9D+dTwJMYQ7nurE7F4kfMKHilqoYTsEEM/khT1w30EpRFZ4TtqyWRlnjeKfX
         fj0vXctKDWZAFzg/jCvyLTxKdA4yzGTGCLWc2TXKt9i08L0c91ULRM/WMbkJkBsrMSuN
         Ds+Byx57ocJ/nxuP/J6rW2W52iui25YSUxKMcimVZFbv9Ci6GXYv6jihzl/IZhJUGfxu
         eufg==
Subject: [PATCH 5/7] toolsoftrade: Employ new scheme for snippet of compiler
 barriers
References: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3e872a7b-7251-efed-be21-9cdb94ea31b8@gmail.com>
Date: Sat, 27 Oct 2018 00:28:13 +0900
MIME-Version: 1.0
In-Reply-To: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 65dac5efc38d7dbb1710d727bc6b67732ce8968c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 14 Oct 2018 18:11:20 +0900
Subject: [PATCH 5/7] toolsoftrade: Employ new scheme for snippet of compiler barriers

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/api-pthreads/api-pthreads.h |  7 +++++--
 toolsoftrade/toolsoftrade.tex           | 12 +-----------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/CodeSamples/api-pthreads/api-pthreads.h b/CodeSamples/api-pthreads/api-pthreads.h
index 6bde0c9..f5510f0 100644
--- a/CodeSamples/api-pthreads/api-pthreads.h
+++ b/CodeSamples/api-pthreads/api-pthreads.h
@@ -53,7 +53,6 @@
 	const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
 	(type *)( (char *)__mptr - offsetof(type,member) );})
 #endif /* #ifndef offsetof */
-#define barrier() __asm__ __volatile__("": : :"memory")
 
 /*
  * Default machine parameters.
@@ -133,9 +132,13 @@ static __inline__ int spin_is_locked(spinlock_t *sp)
 #define spin_lock_irqsave(l, f) do { f = 1; spin_lock(l); } while (0)
 #define spin_unlock_irqrestore(l, f) do { f = 0; spin_unlock(l); } while (0)
 
+//\begin{snippet}[labelbase=ln:api-pthreads:api-pthreads:compiler_barrier,commandchars=\@\[\],numbers=none]
 #define ACCESS_ONCE(x) (*(volatile typeof(x) *)&(x))
-#define READ_ONCE(x) ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
+#define READ_ONCE(x) \
+            ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
 #define WRITE_ONCE(x, val) ({ ACCESS_ONCE(x) = (val); })
+#define barrier() __asm__ __volatile__("": : :"memory")
+//\end{snippet}
 #ifndef unlikely
 #define unlikely(x) x
 #endif /* #ifndef unlikely */
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index d808df6..f1a96ff 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1076,17 +1076,7 @@ and all three are discussed at length in
 Section~\ref{sec:toolsoftrade:Accessing Shared Variables}.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
-#define ACCESS_ONCE(x) (*(volatile typeof(x) *)&(x))
-#define READ_ONCE(x) \
-            ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
-#define WRITE_ONCE(x, val) ({ ACCESS_ONCE(x) = (val); })
-#define barrier() __asm__ __volatile__("": : :"memory")
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/api-pthreads/api-pthreads@compiler_barrier.fcv}
 \caption{Compiler Barrier Primitive (for \GCC)}
 \label{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)}
 \end{listing}
-- 
2.7.4


