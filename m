Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975211;
	bh=D4/1XPQeDMk1Tuui0xAQ0P3fJphgcWlfZR5RCXvk16k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rWmhDdLyEbzfS07ILJwAW1dWMTOzdWz6vnrxFEBjdKJprkSuXVwHOtR2L5Ma56nc+
	 XwzgxT/5OLIie/yFXIhhVFgzIpU67q/NGYBmk1BF5rBMH++4jXvD8lBPbDr+33F6os
	 e4qQMEOMmDLBtPSMu9m2AynWhH5nO3XYZHFsmST+eLmWN20++b9I0VKfleAkGyfnHW
	 gyLX5rq08Ga4Gotq0p+7AOhD/t0FG8oHEC8FKU3do6R/4HFvVhTsmD1UJzJDbnqUuf
	 CzWeiyWftrh+U6WXWOzlhYQLF2SyPtQtCP7deRvkeNyZZhYAZFypJ9lDffUVBPSPi8
	 slrcV9o1zqFfg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 12/12] formal/ppcmem: Fix label name for Fail1:
Date: Sat,  8 Apr 2023 10:33:09 -0700
Message-Id: <20230408173309.5543-13-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence is calling 'Fail1:' label as 'Fail:'.  Fix it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 181ca7c6..10526bca 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -209,7 +209,7 @@ and \clnref{P1lwz} is equivalent to the C statement \co{r3=x}.
 	by setting non-zero status in the condition-code register,
 	which in turn is tested by the \co{bne} instruction.
 	Because actually modeling the loop would result in state-space
-	explosion, we instead branch to the \co{Fail:} label,
+	explosion, we instead branch to the \co{Fail1:} label,
 	terminating the model with the initial value of~2 in P0's \co{r3}
 	register, which will not trigger the exists assertion.
 
-- 
2.17.1

