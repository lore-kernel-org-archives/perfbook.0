Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316321;
	bh=+NRCL+1AHVeZ/ryLELNqH4j2I8/ZC11WX1+Nw4lPOYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cWPkO9KqRTm1/eDt3JwdaWPAlcsRkDl0oAtub6Og6o2ilUQnMqPovSrXNASAxfAbp
	 byQxjSoUSnKaw5cq89RZhqA8r2JQvPRcbfQidUxDUPx9gIVnVHPhIILLF06gXqwEr5
	 p2LvpzVM/kXv4C9w4KB8ldWEi2pNruM8goD99wtVwHXzinEcuN9zXesPC5N1arF418
	 sFuqMPZ92WKcrMZFq7UYM4iWa58uf0lUIlv5zT3raIvkbVCOzCskeqfhnWEn+8TboA
	 gtMWPFq1+IvTGLmYiehRtTDUILwfL2A0gRdq5vuKBogaaqk3rF2KJxLR0VZdSppvya
	 pZQKHLa+G0+1g==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 13/13] defer/whichtochoose: Remove an unnecessary space.
Date: Thu, 24 Nov 2022 10:58:03 -0800
Message-Id: <20221124185803.8150-15-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/whichtochoose.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 846c1ea1..dad3217a 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -378,7 +378,7 @@ it must avoid freeing any object reachable by a given
 RCU reader until that reader completes.
 RCU therefore has an unbounded memory footprint, at least unless updates
 are throttled.
-In contrast, reference counting and hazard pointers need to  retain only
+In contrast, reference counting and hazard pointers need to retain only
 those data elements actually referenced by concurrent readers.
 
 This tension between memory footprint and acquisition
-- 
2.17.1

