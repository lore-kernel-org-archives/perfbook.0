Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=uhDz7BAaAweXybMiniF6ioniPH1a++UwbgUV/CmrZXs=;
 b=jZH4zUVc+ygw8x/RYvH5g5zdrtAzvwowPoL9y8xc9shjWEskj2Dx1rI/p9Hdt4Optd
 ssmom8JxrkXk+S5sXFGWQGxdVrUbA5frbERBNRqsZ9lEKc68YpurhqQHYcR5mRJxIcY2
 2Yb3t6VGggZIMTR1dg30+UExjw8UVPDt6IvTOgobRvogi1bJ8ixMSZmuCZPByHGfmEFI
 r0s1A7pYGrJFBQSgX+n+88jsDbHgbaEFlDGrItqU6B79b1Z0KPg22dWygFuHmKNQkXYi
 Q7GMSYyKoByv7FgyFmjh4Em0zu5smgxpTxXfuZc8dLU7NVJqALSpnmlitKZD1YcCSe3H
 8Rxw==
Subject: [PATCH 4/6] whymb: Use 'nextline' style for 'description'
References: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <61fd9f5f-3d64-cc85-8257-d0e0906e7a8b@gmail.com>
Date: Mon, 20 Mar 2017 00:53:00 +0900
MIME-Version: 1.0
In-Reply-To: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 26833e78b20ac0e7ebf5276fc1e45c9875b067c7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 19 Mar 2017 23:29:37 +0900
Subject: [PATCH 4/6] whymb: Use 'nextline' style for 'description'

This list looks better in "nextline" style.
Also use \tco{} macro in labels and remove escapes of underscore.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 90da0df..9015a85 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -2092,26 +2092,26 @@ not to hardware considerations, but rather to the use cases provided
 by the Linux kernel and the C++11 standard~\cite{RichardSmith2015N4527}
 in a manner similar to the ARM64 additions:

-\begin{description}
-\item[SYNC]
+\begin{description}[style=nextline]
+\item[\tco{SYNC}]
 	Full barrier for a number of hardware operations in addition
 	to memory references.
-\item[SYNC\_WMB]
+\item[\tco{SYNC_WMB}]
 	Write memory barrier, which can be used to implement the
 	\co{smp_wmb()} primitive in the Linux kernel.
-\item[SYNC\_MB]
+\item[\tco{SYNC_MB}]
 	Full memory barrier, but only for memory operations.
 	This may be used to implement the Linux-kernel \co{smp_mb()}
 	and the C++ \co{atomic_thread_fence(memory_order_seq_cst)}.
-\item[SYNC\_ACQUIRE]
+\item[\tco{SYNC_ACQUIRE}]
 	Acquire memory barrier, which may be used to implement the
 	Linux-kernel \co{smp_load_acquire()} and the C++
 	\co{atomic_load_explicit(..., memory_order_acquire)}.
-\item[SYNC\_RELEASE]
+\item[\tco{SYNC_RELEASE}]
 	Release memory barrier, which may be used to implement the
 	Linux-kernel \co{smp_store_release()} and the C++
 	\co{atomic_store_explicit(..., memory_order_release)}.
-\item[SYNC\_RMB]
+\item[\tco{SYNC_RMB}]
 	Read memory barrier, which can be used to implement the
 	\co{smp_rmb()} primitive in the Linux kernel.
 \end{description}
-- 
2.7.4


