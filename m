Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EgM7ftgbmpy9rxwVoVWhheGwjc820spsdESYLEtEKco=;
        b=UUpZJIf25md1Fi7ZhqQ+L9itH2P8DdQZ1ELoHEyDxzD1md2xP1NYwQJbaLYorTQsJc
         l5+7YzFWO3g8mtJBZXbV2OZgyI34TX9riu/8ojZdnSE3CuA0hAlgBHUKG0N79sGNjZxl
         UbA3uOp7bb83qZDx7Ab/XGylNSZFUkmfRk1PdJzgVc5cVaSj8JtxlOPwL52+WdmA5v9C
         /OapHplKVbP2HAi7d8APVhdQp8XLrQV5DCs050GbURlde2EwrwdWXnl7g5ue5EVpW/Jk
         MlvNTaUDilnV3hcpLLIfq7R9brBsrWU14yAMfY2SNRlNheqbJe5hWB1aJcKJvuHvk6CE
         bm/Q==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 4/4] toyrcu: fix typo.
Date: Tue, 23 Apr 2019 21:57:05 +0800
Message-Id: <1556027825-21106-5-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1556027825-21106-1-git-send-email-junchangwang@gmail.com>
References: <1556027825-21106-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This typo did confuse me when I was jumping from perfbook to the code.
So fix it.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 appendix/toyrcu/toyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index c25d205..5627c46 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -491,7 +491,7 @@ scheme that is more favorable to writers.
 \end{listing}
 
 Listing~\ref{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
-(\path{rcu_rcgp.h})
+(\path{rcu_rcpg.h})
 shows the read-side primitives of an RCU implementation that uses a pair
 of reference counters (\co{rcu_refcnt[]}),
 along with a global index that
-- 
2.7.4

