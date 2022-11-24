Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316319;
	bh=ry7wZYyK5T4DonLAcM7KqfV8eNAYnVsDH4e4KfjPsaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gaDvf+0bb+d0iN0Hvuyczu2q+HztYz7r60tZpiK77rgkWXFA9Oh/bjMoyRLvGhFA+
	 5yHd0gZe1MdItkHWtbK1kbSeq08JGNOf54MZPBT7VnkGftDGzWZ0+zk2cQIgyizQ9M
	 VNtAzrplTr8Nf1oGRsB6kGxEaHmr6HtN6egL8xQ+XzR4lxK3sEs2sckm7m2kNNzu16
	 6yeZoiRIqjHWso/I53c1xFAuunNpc3xgMfD3Sr/GoYNvbuSt/Ts782F7rWWek1kZBe
	 G67c21grdEg1POuhQO+/TU6ZHIW/7+TCabFtXfhHt+tG1Ftfu9uVGWqeqRRofGOTgh
	 K5O4owLrNMQgA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 06/13] defer/rcuusage: Call paragraphs paragraphs, not sections
Date: Thu, 24 Nov 2022 10:57:56 -0800
Message-Id: <20221124185803.8150-8-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Some sentences in rcuusage calls following paragraphs as sections.  Fix
it to minimize any confusion.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcuusage.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 9da0e04c..8c45093f 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -946,7 +946,7 @@ There are, of course, limitations to RCU, including the fact that
 readers and updaters run concurrently, that low-priority RCU readers
 can block high-priority threads waiting for a grace period to elapse,
 and that grace-period latencies can extend for many milliseconds.
-These advantages and limitations are discussed in the following sections.
+These advantages and limitations are discussed in the following paragraphs.
 
 \paragraph{Performance}
 
@@ -1162,7 +1162,7 @@ systems are no longer uncommon and that a number of system calls (and
 thus any RCU read-side critical sections that they contain) complete
 within microseconds.
 
-In addition, as is discussed in the next section,
+In addition, as is discussed in the next paragraph,
 RCU read-side primitives are almost entirely deadlock-immune.
 
 
-- 
2.17.1

