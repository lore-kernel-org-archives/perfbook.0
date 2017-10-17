Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NIoRWmHZQTyVTMrcW+dQcbM7A5Qsc5skCWtZiNl5zeU=;
 b=aI8WW0X3ZlxTjDJ6D8zJmSd39UH/V3x8NIDT/hBqCV+rdLeRK6NLc96jKmDty5Y+dU
 zkdCj1+22HPg8yu/XN0TOTJCnjOAN56vM4X2QBoIcqfYlwaz3GaEEeHeNWFOHvD5ej8a
 ++CJhBZXOtxco+r5ZriAw9PEMymk43uDoHAj5d7fdG/8lz35BN/iIvMNVvn7r/78nNiG
 ya0XyYKINCf1HIReKIEGL85GLaYLTOnvJw9gCU7kdRq2BKwRwCzzKhPm0gw2xYwQ1kuQ
 TCr4j3jGSfdrJQN+VvlWzMHA4SW0vTjXGeN5/cBdEj7HK7Ju26BInVTvBvcqC1eVOchZ
 XX7Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 4/5] memorder: Fix typo on instruction name (LDAR -> LDLAR)
Date: Tue, 17 Oct 2017 11:20:53 +0900
Message-Id: <20171017022054.32680-4-sj38.park@gmail.com>
In-Reply-To: <20171017022054.32680-1-sj38.park@gmail.com>
References: <20171017022054.32680-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 11fa280..28faeec 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4260,7 +4260,7 @@ and store-release (\co{STLLRB}, \co{STLLRH}, and \co{STLLR})
 instructions.
 These instructions act as ``half memory barriers'', so that
 ARMv8 CPUs can reorder previous accesses with a later \co{LDLAR}
-instruction, but are prohibited from reordering an earlier \co{LDAR}
+instruction, but are prohibited from reordering an earlier \co{LDLAR}
 instruction with later accesses, as fancifully depicted in
 Figure~\ref{fig:memorder:Half Memory Barrier}.
 Similarly, ARMv8 CPUs can reorder an earlier \co{STLLR} instruction with
-- 
2.10.0

