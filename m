Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=c+8Vvt+bdWPCZdHfdc7HYD99vAb6TqH43eWJvq30PYU=;
 b=HD76JgMd4/EetA6UA052BpltVrP5Qh+pq+ld4NEexlmr9BFDUE5f7qP48gebKj+M+R
 sYltWTtqiAHczRy6hsWlwHqPQ5JyA+jOpkkagPmjdu2SF2WhVGYmarw10yMPzFXufDj9
 oocyhCjmnzzv8Xgz+mRKV5z5Cr5CoFRIQYuHM+w4PPpZ2zVnd5ChJ0t2ZL5Z5WgQI+Dr
 GUIahPQajoewblzJ/I93dhNk7n1LGV8G6cd3rifOWzFT++W2Ow+8/xZwabbqGxIbb8kR
 Tr/hzV95Q5t1+DktAYwzYHDzHtr9zDr6TpMbFyFT4R3Ym/rCZDR/+qx5QM3GWyEhpf+/
 vRAg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] toolsoftrade: Fix line order in latex source
Message-ID: <3f77b38a-3995-e163-8694-cd836d3611f6@gmail.com>
Date: Thu, 29 Dec 2016 10:23:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From bcf7ae453896f6f7fd99bcfd867009c1ad659a19 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 29 Dec 2016 10:09:25 +0900
Subject: [PATCH] toolsoftrade: Fix line order in latex source

Fix line order error in latex source introduced by commit 7945ae1a06c5
("Further editing to Tools of Trade").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 842fd19..b49496c 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1245,9 +1245,9 @@ Figure~\ref{fig:toolsoftrade:Measuring Reader-Writer Lock Scalability}.
 In some cases, it is only necessary to ensure that the compiler
 avoids optimizing away a given memory read, in which case the
 \co{READ_ONCE()} primitive may be used, as it was on line~17 of
+Figure~\ref{fig:toolsoftrade:Demonstration of Exclusive Locks}.
 Similarly, the \co{WRITE_ONCE()} primitive may be used to prevent the
 compiler from optimizing a way a given memory write.
-Figure~\ref{fig:toolsoftrade:Demonstration of Exclusive Locks}.
 These last two primitives are not provided directly by gcc,
 but may be implemented straightforwardly as follows:

-- 
2.7.4

