Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486851;
	bh=vvp/pxsCaFaCm5nMocCUw/ui2djWULCe3RvBjO2dYr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PveB7DOzz/S0ibFZvCrca2a2ApwNolT/Roi/t78tsu6MX9OBLgcTkrCHjAUaV7aHu
	 9p6iGO+/ebyJ/4Cyyr5BhAVK1MHH+mBgiQWecxUYSHd6ke/ETat3qyn2BGFvGHKkBB
	 aepXra5I5fvBbE1U2y2Na2/D5Nht+Mz6xBiEuUPCDCldbTMV+IJpuCViArfOeqgD5Q
	 fJnCkR503eK77BGa8EvaKw6AiLt1BjU2hrD9T8vrKnlVHtg93WccShYy7lwTK8h/TP
	 tAVEv56bBAskeI4y/1/+rNF9l9WpQhkZh11+0vAHJw102kk+oay1INTxL3jPr2l/yq
	 Q1z5xynt5NQhA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 04/10] memorder: Remove an empty fcvref block
Date: Sat, 23 Sep 2023 09:31:58 -0700
Message-Id: <20230923163204.14558-5-sj@kernel.org>
In-Reply-To: <20230923163204.14558-1-sj@kernel.org>
References: <20230923163204.14558-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

memorder.tex is unnecessarily having one empty fcvref block.  Remove it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 --
 1 file changed, 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 38ff3a55..5ad7e796 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -5431,8 +5431,6 @@ in v5.9 of the Linux kernel in favor of augmenting Alpha's definition
 of \co{READ_ONCE()}.
 Thus, as of v5.9, core kernel code no longer needs to concern itself
 with this aspect of DEC Alpha.
-\begin{fcvref}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
-\end{fcvref}
 \begin{fcvref}[ln:memorder:Safe Insert and Lock-Free Search]
 However, it is better to use \co{rcu_dereference()}
 as shown on \clnref{deref1,deref2} of
-- 
2.17.1

