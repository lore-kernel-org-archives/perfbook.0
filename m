Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PJmsrrcK767aQmq+QKZMxsDzKPzzIkKNNJJm3Le/xG0=;
 b=FHlJPRojeD++hJN/BRZUWUqslQBP/cKWDM4QCJAHTKz2VRdnYyIxV7h7EIdY7nARWs
 IUys3LFkF1AEhXpc1+WRnOwPTJ7kWOuPzyi13oX8ABNHEbtbZ5OUUv01Y5N1sJOsbytV
 Bx6FaoJYxKE1crCQ45Tu1Q0jHSjymB1sgZnCCg2xQCpe9nakMOkgcRaUkuvjb4iSga+B
 HD50q5kvl0w3NAd8tEcBDoSogjQZAZrVQ1ppGESi1r/yhfmfG/desHAlHn1nmehvDe1F
 4jE5LbA/3XYl10yXZ4yWTi2CXWaG5UQDGHI6bKn4WjEnIUBrQuCxjkTQ5H7raOVMtHsP
 RMzQ==
Subject: [PATCH 4/6] advsync: Trivial typo fixes
References: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4826ee68-d905-1a29-d966-0d6c44b8503a@gmail.com>
Date: Thu, 13 Jul 2017 00:11:40 +0900
MIME-Version: 1.0
In-Reply-To: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4e13865babb05ec6bd0521ae74d523fd562af6ce Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 12 Jul 2017 22:49:00 +0900
Subject: [PATCH 4/6] advsync: Trivial typo fixes

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 10d28f0..b085443 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -670,7 +670,7 @@ this~\cite{JadeAlglave2011ppcmem}.
 \end{figure}

 Therefore, portable code relying on ordering in this case should
-add explicit ordering, for example, the \co{smp_rmb(} shown on
+add explicit ordering, for example, the \co{smp_rmb()} shown on
 line~20 of
 Figure~\ref{fig:advsync:Enforcing Order of Message-Passing Litmus Test}.

@@ -956,7 +956,7 @@ Figure~\ref{fig:advsync:S Address-Dependency Litmus Test}?
 Because no production-quality architecture speculated writes,
 it is not possible for the \co{WRITE_ONCE()} on line~10 to overwrite
 the \co{WRITE_ONCE()} on line~21, meaning that the \co{exists}
-clause on line`25 cannot be satisfied, even on DEC Alpha, even
+clause on line~25 cannot be satisfied, even on DEC Alpha, even
 without the \co{lockless_dereference()} that is required in the
 dependent-read case.

-- 
2.7.4


