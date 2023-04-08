Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975210;
	bh=nECmU2vK5FB3zYwYH7SE2WxFpYpkOzMuGfL1QxwhdmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IpwPlsaungNa6ZsCBZBzPArSaruUz+MMsLVJ8v/490QuOOr7cUg/2vP5H//XbsUxP
	 2ggL3RyumoAoXN1yOr6yJrrsg7Dc98bn3NR07D6aqS86dhxLzyAZOb6O7z7uqI3Q6N
	 1uiZTsS2qmMJVRkdD1t0+9rGHnCnvoyd1EmKBCltG51VBroQXqz+oRBmMvaiUVAxcP
	 9Fo4+JIno8DpKROENhDXaPAbNzaJf5dvHXVteTG/NQ8o5r5x6iF/RMg2fJM1mRPn9v
	 pkv3MnX5aP6vo8/0UlB8XVX5wZtKxmv/jrxgrAJPTtXSTfdGcbWWK2+i3YdaujYarK
	 l+IUC+z/XfiYg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 07/12] formal/ppcmem: Use uppercase 'S' for Spin
Date: Sat,  8 Apr 2023 10:33:04 -0700
Message-Id: <20230408173309.5543-8-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A few sentences in ppcmem.tex are using lowercase 's' for Spin, while
other sentences in other tex files are using the uppercase 'S'.
Consistently use uppercase 'S'.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 9f584b15..62a45383 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -7,7 +7,7 @@
 %
 \epigraph{Jack of all trades, master of none.}{Unknown}
 
-Although Promela and spin allow you to verify pretty much any (smallish)
+Although Promela and Spin allow you to verify pretty much any (smallish)
 algorithm, their very generality can sometimes be a curse.
 For example, Promela does not understand memory models or any sort
 of reordering semantics.
@@ -403,7 +403,7 @@ These tools do have some intrinsic limitations:
 	running on small numbers of threads.
 	Larger examples result
 	in state-space explosion, just as with similar tools such as
-	Promela and spin.
+	Promela and Spin.
 \item	The full state-space search does not give any indication of how
 	each offending state was reached.
 	That said, once you realize that the state is in fact reachable,
-- 
2.17.1

