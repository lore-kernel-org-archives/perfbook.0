Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6xyuUB6eX7sx6Qmqwp++WVCwCUAdZCC4RU+3ZlPs8FE=;
 b=L2aAQvaLuPPTyCZa7EKSA92vn9dmlUdzdWmeok0EO+xBWDZtkA2TidYguANpanSwKl
 C0N0lEqnwXnu+Re1jRMZD0LNXX+MnXxuVvGkJjMdSGtyKLTPSNF3/Ewv4ipZmGuLQz8y
 N8tn+++auPXBjTWRznZCxb6hZkDZUZixBhc4FxoBTk1xQavPuZ3YGAHWkYzdoY3a2L7C
 EZXhwWNak8X9apF6crxN3oszZq1K9OzQTcL8M32cDUPnjn6jqEiFwjCMP9WzmUV0qVDp
 mMDjjihvzeHKktQI2PyHSIJG+GhuH3tuJiBSKqYzEK1d529xILyzHxychYu9ZE3xdnKo
 iqcw==
Subject: [PATCH v2 2/5] memorder: Fix usage of \IfInBook macro
References: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
 <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <21334497-e914-63ab-0798-91981fee8b0c@gmail.com>
Date: Sun, 17 Sep 2017 00:08:46 +0900
MIME-Version: 1.0
In-Reply-To: <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e6392e493a8aacedabf7fbbdb0499c3fb3343856 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 15 Sep 2017 00:13:09 +0900
Subject: [PATCH v2 2/5] memorder: Fix usage of \IfInBook macro

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


