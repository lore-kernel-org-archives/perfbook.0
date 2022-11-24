Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316319;
	bh=wYiiP1s0QUXflOYIi8HPNyhFEzG3LNc8XQC908d7oE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BRdq0qzXPcGZZT37qiAG3FNK4TYwX1sAdx1suMutX3r28xlLlKiHlG9u3nvtIBUdp
	 iT5MiE/ZNPyjcREBw85anVrF4Mr/Fj2IQ/872erRjV8gipBS8YbPqkYdKqbH38lD3M
	 LY5DIadR0U9+8z/OH2mPVn5636bYLuIl+AN1blKQN8ILYAsatBOF+9lsX45M37sy2e
	 rND6yBAc2gaRIgaW4T0kH1haXc6rDRlpqcjUyoHgivkRh5eurnv9QrAVNqZ0jayDAP
	 e+pOc8/x9GIYiGRbUcI9ep7ZrM33CdAcCHPqokPRo46yuBlyWCBKpsFdIvuHKsJJww
	 V6oqXY6qcmIyw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 07/13] defer/rcuusage: Provide the reference to synchronous RCU update-side primitives
Date: Thu, 24 Nov 2022 10:57:57 -0800
Message-Id: <20221124185803.8150-9-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

'Deadlock Immunity' paragraph prohibits synchronous RCU update-side
primitives within RCU read-side critical section.  This means those in
'RCU Wait-to-Finish APIs' table, but someone might think those as
general RCU update-side primitives like 'rcu_assign_pointer()'.  To make
it clear, provide the reference to the table.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcuusage.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 8c45093f..18abf340 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -1209,7 +1209,9 @@ rcu_read_unlock();
 	result of the grace period completing.
 	Plus Linux kernel's lockdep facility will yell at you.
 
-	In short, do not invoke synchronous RCU update-side primitives
+	In short, do not invoke synchronous RCU update-side primitives, which
+	are listed in
+	\cref{tab:defer:RCU Wait-to-Finish APIs},
 	from within an RCU read-side critical section.
 
 	In addition, within the Linux kernel, RCU uses the scheduler
-- 
2.17.1

