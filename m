Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316313;
	bh=SlHSCwIlkEYP5B07iVTX0rdpAp2xslqJyXq0o2y2SWI=;
	h=From:To:Cc:Subject:Date:From;
	b=Ksg/2gU4ryv1zHNfbw4vG/y2VAPITfpOYaz698K/WyiuoJw9pxGcjbAg+Qamdr6a0
	 F1X/TUYJVLVO4ywB6VjzjGU7mrgbwwwZAm7WMsTsT2ECZSIHMnTdOQmMt9r+F/mzNr
	 DFalN8tSQ8OKSIY9h9POrIMxlcaGmq+oM16qzmZe6j5Zo8zvLMkN+3OMbzgu/HxYqq
	 JU8/phN5mn555SsAxGijLsnsd2dlvPJds1yp0pO0CRLrDtDQVEVoPwfUohIxVSoXmW
	 zkkRDZx9Hp07TZH1sZeruTLoPfdDE8t10mFJmRqkU+fS4Qzonwm4O6Fatsh0EoyAx7
	 5dvOlb+A6bbRA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 00/13] Minor fixes for defer/
Date: Thu, 24 Nov 2022 10:57:49 -0800
Message-Id: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

This patchset contains minor fixes for defer/ that found during the
Korean translation[1] of it.

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (13):
  defer/rcuintro: Clearly point the QSBR described section
  defer/rcufundamental: Add non-breaking spaces
  defer/rcuapi: Add missed unbreakable spaces
  defer/rcuapi: Use \co{} for boolean return value
  defer/seqlock: Use \co{} for boolean return value
  defer/rcuusage: Call paragraphs paragraphs, not sections
  defer/rcuusage: Provide the reference to synchronous RCU update-side
    primitives
  defer/rcuusage: Add a missed unbreakable space
  defer/rcuusage: Add missing '()' for 'rcu_dereference()'
  defer/rcuusage: Fix wrong function name: s/timer_stop/nmi_stop/
  defer/rcurelated: Remove unopen closing parentheses
  defer/whichtochoose: Fix a wrongly positioned unbreakable space
  defer/whichtochoose: Remove an unnecessary space.

 defer/rcuapi.tex         | 10 +++++-----
 defer/rcufundamental.tex |  6 +++---
 defer/rcuintro.tex       |  3 ++-
 defer/rcurelated.tex     |  2 +-
 defer/rcuusage.tex       | 14 ++++++++------
 defer/seqlock.tex        |  4 ++--
 defer/whichtochoose.tex  |  4 ++--
 7 files changed, 23 insertions(+), 20 deletions(-)

-- 
2.17.1

