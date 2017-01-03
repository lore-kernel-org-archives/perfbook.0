Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UK1xkghpvHIFtQUd2FpoNFWp6smDvXPYJTZp/Kdd/Pk=;
 b=GPTpbAN9MUGMq4H3euJ7T3mzJvQWX0wpDmyBZFmVfxt1w9pNkX0f+9T1uW8gvoBzcC
 vFaBQCLRmeE3kkEe6W3uwg6Zc3ivARQSCogOCq0SE8osDmXkj4ZOWEi/MHIJYlORAL1V
 MvwBeFLlOzw3sdALeCq/VGC3djo+rwgpNF4M7GE5QDcVGA5GWl1Ff1RzpkbNfPIduD4O
 XbV5vnSPgWJWJJgKU0A08L57gUBadNqZojhpyEshvbAge5oJFe7heCNZ7/6cdIM2vIo0
 Oa5pznWwE1avpZ3vRZ0WKwOpVWIW8/NJTqnZ6EZ2ofhihnXJU16JPcR2ucAkRR/g3amL
 /TgA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] toolsoftrade: Add suffix `()` to function name
Date: Wed,  4 Jan 2017 03:59:53 +0900
Message-Id: <20170103185953.3000-2-sj38.park@gmail.com>
In-Reply-To: <20170103185953.3000-1-sj38.park@gmail.com>
References: <20170103185953.3000-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 899ef01e6e2a..bc51437eb141 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1383,7 +1383,7 @@ initialization code.

 The Linux kernel uses
 \co{struct task_struct} pointers to track kthreads,
-\co{kthread_create} to create them,
+\co{kthread_create()} to create them,
 \co{kthread_should_stop()} to externally suggest that they stop
 (which has no POSIX equivalent),
 \co{kthread_stop()} to wait for them to stop, and
-- 
2.10.0

