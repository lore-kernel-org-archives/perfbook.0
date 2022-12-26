Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672078619;
	bh=53Cnl1mV3fS87anPslaVVs5krH0XNHrh5cxpjDTEiLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MkMgYpGk5cnsv4INrpEk9dZbzkT+Ka+ezGGnYUFAO3W3UzL2biMacwtaAkQADpXPC
	 pZsN+bpUEhBMXKHEfv6rlvDaddMwSFedugQYFxXoSqfUJTEOebIgVNuX0DtAyOn2lM
	 MFvlZ9CrWvE5KFm2lsh5HD0pgKaEHX4tp/uxKHUGJDNU40GP4sl9baDgJ4tnuAgvCX
	 OzHeWDItH37pYzJWe/oGNYN5FMR9848EzkJ1YpJgHpixk/rd6w8fvK68zBY+2Wy9i1
	 MhuLGtsi6SiaUi9vCYDlU80sCbqlDiQT73NZ+zY9A8MWrk4kt84XZh5Hd1OwJITlK1
	 oPfo19x/guvcw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 1/4] datastruct: Remove unnecessary space
Date: Mon, 26 Dec 2022 10:16:31 -0800
Message-Id: <20221226181639.10795-2-sj@kernel.org>
In-Reply-To: <20221226181639.10795-1-sj@kernel.org>
References: <20221226181639.10795-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence in datastruct has unnecessary extra space between words.
Remove it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index ed404e5a..99c92d9a 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -34,7 +34,7 @@ which improves both performance and scalability.
 Because this chapter cannot delve into the details of every concurrent
 data structure,
 \cref{sec:datastruct:Other Data Structures}
-surveys a few  of the important ones.
+surveys a few of the important ones.
 Although the best performance and scalability results from design rather
 than after-the-fact micro-optimization, micro-optimization is nevertheless
 necessary for the absolute best possible performance and scalability,
-- 
2.17.1

