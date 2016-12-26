Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bO47LWogs+p7YdkIMP88RRgUT5Kam2LRUEEQAyGRCHM=;
 b=lnpm9mQHYMqF5koDHImdcljcDyFx/kaQu0pk3sXrG7O3rfP5hM9PHKtxc54XpQnO5w
 PGjPDr9zghS8l3CJJ7nhthDwyzKB3p7ohqVVxfvjNOFi2zYoH7Vx1pKRkzz91niGYVD9
 I2tft/AEEOmao3bArDGf+TbMoN8ALmLIBtduZgbekdu9GNLsudOJOipiIAU5Zunq674f
 GrfpyGAZwXyVDgQu+LoQ7PTJ7toIAyU+dQx8atuuIAqmQ2D1+jZGYik+GATOV+Y2BKCd
 27G3fNy75I69sIgbMX5xVJG7koTyVtFE1x4ewjVCdft/lxkCwllQxNwTq7Lt7/Lfy16u
 YWbw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/4] future/htm: Add a missing nbsp
Date: Tue, 27 Dec 2016 04:43:12 +0900
Message-Id: <20161226194314.7868-2-sj38.park@gmail.com>
In-Reply-To: <20161226194314.7868-1-sj38.park@gmail.com>
References: <20161226194314.7868-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/htm.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/htm.tex b/future/htm.tex
index 625d480b6670..9a1271b4dffe 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -388,7 +388,7 @@ have on ease of use.
 	\end{minipage}
 	\vspace{5pt}

-	Suppose that the user sets a breakpoint at line 3, which triggers,
+	Suppose that the user sets a breakpoint at line~3, which triggers,
 	aborting the transaction and entering the debugger.
 	Suppose that between the time that the breakpoint triggers
 	and the debugger gets around to stopping all the threads, some
-- 
2.10.0

