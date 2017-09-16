Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5hICeoUtgc33FmjPKSnt2aoGPCdAZbcsy2Rc7+qBeWI=;
 b=KQlNiKf+PyEf8XvNdDhTrbQ8hCeFBFeJvvxgeXYwdOpW5qDJzuE2kAXPazZ0s8l15H
 cpUxPnHohvtfbzFnv+EOxq2ytFcpvpPGtoJG/JaZHEuU87V1GOIjbytAMnHjDnXJ9m2g
 Ere2TPxCFHBH+JiHjlGei6BXVtwGi2VRIBPbKyM9rMgNjuVyfjPbLoppntBejwxeRsME
 IKSEQeYORhVEW8G6hgjurvLsL7v1bEogBVwRLtxAxym7J57sHjwlf+vr7ZkjRpNXqNT1
 wf7m8IZ3skMwoq0+y0wzIZWu6fByWOBu7Xvlhv30od327JyUhnlceqOIdK8Nqy20iIAL
 HmYw==
Subject: [PATCH 2/5] memorder: Fix usage of \IfInBook macro
References: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <22ef1ea3-7b99-8191-e2ef-70e2f2b50e84@gmail.com>
Date: Sat, 16 Sep 2017 23:58:43 +0900
MIME-Version: 1.0
In-Reply-To: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e6392e493a8aacedabf7fbbdb0499c3fb3343856 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 15 Sep 2017 00:13:09 +0900
Subject: From e6392e493a8aacedabf7fbbdb0499c3fb3343856 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 15 Sep 2017 00:13:09 +0900
Subject: [PATCH 2/5] memorder: Fix usage of \IfInBook macro

This macro requires two arguments, one is for "then" case,
the other is for "else" case.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 9a66829..10aa380 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3900,7 +3900,7 @@ of reordering memory optimizations across the barriers.
 The \co{smp_read_barrier_depends()} primitive has a similar effect, but
 only on Alpha CPUs.
 \IfInBook{See Chapter~\ref{chp:memorder:Memory Ordering} for
-more information on use of these primitives.}
+more information on use of these primitives.}{}

 These primitives generate code only in SMP kernels, however, each
 also has a UP version ({\tt mb()}, {\tt rmb()}, {\tt wmb()},
-- 
2.7.4



This macro requires two arguments, one is for "then" case,
the other is for "else" case.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 9a66829..10aa380 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3900,7 +3900,7 @@ of reordering memory optimizations across the barriers.
 The \co{smp_read_barrier_depends()} primitive has a similar effect, but
 only on Alpha CPUs.
 \IfInBook{See Chapter~\ref{chp:memorder:Memory Ordering} for
-more information on use of these primitives.}
+more information on use of these primitives.}{}

 These primitives generate code only in SMP kernels, however, each
 also has a UP version ({\tt mb()}, {\tt rmb()}, {\tt wmb()},
-- 
2.7.4


