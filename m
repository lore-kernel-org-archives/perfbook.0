Return-Path: <SRS0=U37W=PG=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+mA9EFojfLeVdPeDnw4oO0+vF9XMxGnVqjxz5fo4G1c=;
        b=ZT2DywVLT2vAH61nmb0rFMngHc9z3S8zHaYZADvZU1fKhCpS2OTBnUHSCOLROK3sOF
         7ikKkt93OEgFu+C3cQPVfSQDAHoiIMdpSA3ZB/17sJAT1NXS7y3ZUtqDNyQgqCLYKL/C
         3x5gKRDFRm2nYm8nz5SaRyKuysoFbg3VcArNH847kvBgK1wPC3hH72+PjbM5Cvkd+7Ot
         rXX0sLkHKXcVtw3hqTbRxbc/d98k1fmlpi9im+AaoZ74+aQ9rrzGpOaTneLVgCGHh7ef
         VQeK6F1Loynj33yZaKLu08JEfz99VobrAKtdJhpAcOxIJpSRlrn0g/8V/j2CT7rF5qVC
         dUtA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 4/5] toolsoftrade: Fix a typo
Date: Mon, 18 Oct 2021 10:44:38 +0200
Message-Id: <20211018084439.7112-4-sj38.park@gmail.com>
In-Reply-To: <20211018084439.7112-1-sj38.park@gmail.com>
References: <20211018084439.7112-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index f0fb360c..7cbe2f0b 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -851,7 +851,7 @@ rights to assume that the value of \co{goflag} would never change.
 	This leads to the question of how one thread can gain access to
 	another thread's \apig{__thread} variable, and the answer is that
 	the second thread must store a pointer to its \apig{__thread}
-	pointer somewhere that the first thread has access to.
+	variable somewhere that the first thread has access to.
 	One common approach is to maintain a linked list with one
 	element per thread, and to store the address of each thread's
 	\apig{__thread} variable in the corresponding element.
-- 
2.17.1

