Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316319;
	bh=jxMnGyczFiZ6CvL5F6g1qPR3EeWhjcK808ptMcm0OTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yf1pDCJyQxgJMRWqnPcBfN7I07PfqkJzwyRdWV7VDBz70i12Ot72CDUNwcSNoGxt5
	 7jMcopmu1w993tvbnzczSNYclF5U8gd8rRSmdXlcJ+vKv5bAFVf+1C2ps4iTzXGwIG
	 ry3qFmzjB5yazfWHLPNHznMwh17TLVlGYY60WRomFtuUczQEXIoEPA0gPHpU+lImEp
	 8V+cYeNM8c8tAOBDjvERYM+cEhh8V8FDqJHTgwTvOmwQW+11KzIFrTlbCwmyRX/Fy5
	 EMwBbB5vCdqtpjkcH8dpIBOVbAQE6hj7ZmvrPDCgL/eHijTUuotet+QMBHnOFaYnP4
	 NpwKOFMCdJUjA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 08/13] defer/rcuusage: Add a missed unbreakable space
Date: Thu, 24 Nov 2022 10:57:58 -0800
Message-Id: <20221124185803.8150-10-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcuusage.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 18abf340..ba13bd96 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -689,7 +689,7 @@ the slab allocator's deferred reclamation specified by the
 Gamsa et al.~\cite{Gamsa99}
 discuss \IXpl{existence guarantee} and describe how a mechanism
 resembling RCU can be used to provide these existence guarantees
-(see Section~5 on page 7 of the PDF), and
+(see Section~5 on page~7 of the PDF), and
 \cref{sec:locking:Lock-Based Existence Guarantees}
 discusses how to guarantee existence via locking, along with the
 ensuing disadvantages of doing so.
-- 
2.17.1

