Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xu4Rj+mojYGi0wrgPVTrtcKEofb6KcsQJuAL/OTxyOU=;
 b=r58kAGrhFsTrd1DDJg8quxM2zO6kOCOB3ZXwlFItZLeR6JdFcuyRKMTy91DP8aXdWv
 ugjvRtEEeE0Zn3+Ah05uBjGtp8/dgfWX2N47Rrh1ioGH4FFKkoWJ9IXCcoOAJH/k5gM9
 YJVpbyiTY3X+1Er4ap6MjQjGYekVQYAo2ZVZBHQbQLyDENM6BT+vJIQarZF/NYc/RgqA
 TFKvj5gpJx8jIdQE9WRiEkO0OcCriDrl8IYC/e5JMKrQqIz71wIWu6XL70pZ+6LQJiQM
 r98SQ1kDwqitJK7YlemqTAPcDPkHIP8LK0FJdnXH/ngqpG9lFHj72GwXVIPZrrY4ZUxT
 c61g==
Subject: [PATCH 4/5] memorder: Update reference to memory-barrier primitives
References: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a4766c09-c775-b903-92d9-4c9fd50e9bad@gmail.com>
Date: Sun, 17 Sep 2017 00:00:25 +0900
MIME-Version: 1.0
In-Reply-To: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b08c836fef6b054125b74c77a2fddc3e53ade5bc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 16 Sep 2017 11:05:36 +0900
Subject: [PATCH 4/5] memorder: Update reference to memory-barrier primitives

This reference used to reside in appendix. Now it lives in
the same chapter and it should be made to a previous section.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index a6a33b6..596367d 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3899,7 +3899,7 @@ the compiler to eschew any optimizations that would have the effect
 of reordering memory optimizations across the barriers.
 The \co{smp_read_barrier_depends()} primitive has a similar effect, but
 only on Alpha CPUs.
-\IfInBook{See Chapter~\ref{chp:memorder:Memory Ordering} for
+\IfInBook{See Section~\ref{sec:memorder:Ordering: Why and How?} for
 more information on use of these primitives.}{}

 These primitives generate code only in SMP kernels, however, each
-- 
2.7.4


