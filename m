Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975209;
	bh=359nH/pzW298cpdWAWhybMWQWC54izmyaezjf1YpWDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OxDbIyEgEaQJLydpDiKspZLYqtY66X5obEXstbg853yGgtvd4HF6gaRgxHNgL3qWG
	 yfAx7ezYzb/sBK+5W1UqPiF9nRo36lmutOdwExFByEjrpDZZ6quImdJ80Qo4u2Ls4P
	 KhfH12iXI2dDZ5vH/WfWLBe9GeUxmlkZQ/XF+OA86H2KXs4ATzIN3Lco2eFUg4xXKv
	 GX8pVt5Fxr8ge5i+vfrgrmtrkfyHC4zU2Ty75X4p729hlXrzJNuYsSVFM2izDfxB9p
	 JE+SejJwjQGqTl34k4uKWsQiEMFtJIgQf6bxqexkhSmqgsO7t4PhCxy73wea1+I8cV
	 uYyPdGM93eFmw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 05/12] formal/dyntickrcu: Quote 'trail' file consistently
Date: Sat,  8 Apr 2023 10:33:02 -0700
Message-Id: <20230408173309.5543-6-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence in dyntickrcu quotes 'trail' keyword with `` and '', while
another one doesn't.   Do quote consistently.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index bee5b4da..25012738 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -534,7 +534,7 @@ through preemptible RCU's grace-period processing.
 
 \begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-base:grace_period]
 \Clnrefrange{print:b}{print:e} print out the loop limit
-(but only into the .trail file
+(but only into the ``.trail'' file
 in case of error) and models a line of code
 from \co{rcu_try_flip_idle()} and its call to
 \co{dyntick_save_progress_counter()}, which takes a
-- 
2.17.1

