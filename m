Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=n6yjo3GSaOsaspMzuNv7TJKmvSczzYa/x+Ut9US9LLg=;
 b=M3+8JPItmc/ZHsEsNevsFzESM+RGSePJjZvukpUwOzZmdH6vU2l4H80D1fp9Qs5qla
 OZPhcbQP15ZJIEOF63p2J4GX0xjVLwhIh0Mjs0kRl5fpaan49X7+N4y0Y4ef4OiATvY+
 sL8/YIqgkizznECtYTRhfrDM4FQ30LIG2NsLEdPN6eLj/b3bgfBv1vUHR47lUEv4jE5Z
 k8u0WaC/B7ky7b2gDc8TK9X86UTdIwkUaaOCXEZN1u5FoaXS4X+H7AqKHm/F1WrKS9lq
 y4fd+h3E25UAbyz9dZZnzlGuXY3jJymRsn+Y9rULwXqfe8jwW6iw4sbx8w40dvhnSyns
 8dQg==
Subject: [PATCH 2/6] whymb: Convert to 'description' (part 2)
References: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0ce2c80f-9248-0736-e57d-2073d7f2a806@gmail.com>
Date: Mon, 20 Mar 2017 00:49:42 +0900
MIME-Version: 1.0
In-Reply-To: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8b81634e0268329ecdcad3ce731a33d9d42e0786 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 19 Mar 2017 23:25:12 +0900
Subject: [PATCH 2/6] whymb: Convert to 'description' (part 2)

This list is also a good candidate to convert to "description".
As labels are printed in bold, colons at the tail of API names
can be removed. Also replace double quotes after labels with
parentheses for consistency with other lists in the Appendix.
\tco{} is safer than \co{} in labels.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index bd87ee7..49d29ba 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1656,18 +1656,18 @@ use of memory barriers is required.
 Therefore,
 Linux provides a carefully chosen least-common-denominator
 set of memory-barrier primitives, which are as follows:
-\begin{itemize}
-\item	\co{smp_mb()}: ``memory barrier'' that orders both loads and
+\begin{description}
+\item	[\tco{smp_mb()}] (memory barrier) that orders both loads and
 	stores.
 	This means that loads and stores preceding the memory barrier
 	will be committed to memory before any loads and stores
 	following the memory barrier.
-\item	\co{smp_rmb()}: ``read memory barrier'' that orders only loads.
-\item	\co{smp_wmb()}: ``write memory barrier'' that orders only stores.
-\item	\co{smp_read_barrier_depends()} that forces subsequent operations
+\item	[\tco{smp_rmb()}] (read memory barrier) that orders only loads.
+\item	[\tco{smp_wmb()}] (write memory barrier) that orders only stores.
+\item	[\tco{smp_read_barrier_depends()}] that forces subsequent operations
 	that depend on prior operations to be ordered.
 	This primitive is a no-op on all platforms except Alpha.
-\item	{\tt mmiowb()} that forces ordering on MMIO writes that are guarded
+\item	[\tco{mmiowb()}] that forces ordering on MMIO writes that are guarded
 	by global spinlocks.
 	This primitive is a no-op on all platforms on which the memory
 	barriers in spinlocks already enforce MMIO ordering.
@@ -1675,7 +1675,7 @@ set of memory-barrier primitives, which are as follows:
 	some (but not all) IA64, FRV, MIPS, and SH systems.
 	This primitive is relatively new, so relatively few drivers take
 	advantage of it.
-\end{itemize}
+\end{description}
 The \co{smp_mb()}, \co{smp_rmb()}, and \co{smp_wmb()}
 primitives also force
 the compiler to eschew any optimizations that would have the effect
-- 
2.7.4


