Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316320;
	bh=iORk5ZW/Ir7PYUaI53Y/4w57jPVNQOmEbb6V3wam9HY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KBTeyJCZOxzVjumq35G4VTOO6ebB4oSTXUdz6SnIqNwGqa8AT5XiCD4D5LqLyZqD9
	 noChdMufejFfalpf9UN85UcjPTqSVmAznafNnt2HEihxrRbnq+54JKw83esBqCAzBt
	 Ya09jZeUPg3tSBxatqnxT0yVahD73MFCDoO7JBmHrenSYNJt3iWQgQr7cdNhXQ+2eK
	 yvJC/fESBonMFKvKBzpIEs6rm03nh6YfzFAiPboG9ZMr+u9gl2ynRYD12ZUQ9nG3XN
	 BW2gneuXPDE1/rFNKxpOjTpjHhnKuM+moGNtHe0WPiXstEyJ4hc5oEVZXypT004hlw
	 boSdsiJozKlfA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 11/13] defer/rcurelated: Remove unopen closing parentheses
Date: Thu, 24 Nov 2022 10:58:01 -0800
Message-Id: <20221124185803.8150-13-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence in rcurelated.tex has a closing parentheses whilt it has no
counter opening parentheses.  Probably a typo, so remove it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcurelated.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcurelated.tex b/defer/rcurelated.tex
index 1ca25d9e..190c8456 100644
--- a/defer/rcurelated.tex
+++ b/defer/rcurelated.tex
@@ -111,7 +111,7 @@ Unfortunately, this implementation achieves linearizability by incurring
 the full latency of grace-period waits while holding locks, which degrades
 scalability of update-only workloads.
 One way around this problem is to abandon
-linearizability~\cite{AndreasHaas2012FIFOisnt,PaulEMcKennneyAtomicTreeN4037}),
+linearizability~\cite{AndreasHaas2012FIFOisnt,PaulEMcKennneyAtomicTreeN4037},
 however, Arbel and Attiya instead created an RCU variant that reduces
 low-end grace-period latency.
 Of course, nothing comes for free, and this RCU variant appears to hit
-- 
2.17.1

