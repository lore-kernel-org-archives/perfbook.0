Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975209;
	bh=JWWw1SS1/Je3Cmd1UGFYz8pf6J2mrZJscWXKaDcnoh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r2QoDhfR+jfBEnlrHWDSlmHsTUxJuubI6e2wB0KeWWHdb1jwfJ/587WadTVvohyJC
	 BArlmtuS4iqHsH1Qqiwjhhfb4v7Mur4aZ4X5JawaOhaUR37qEuT2ub6kRV6JvSNCfw
	 kc8v60KCs6TvByq09isA5Zk92iP6hCkzPQ2tqCoNOxOaBwRc4JmwoQLxEMvpIteZSx
	 pmyHcgLNhqh2G5TuXn+XPrv6E7WQ7HLX8U0zwVwKG9DhKYLt29NrlKYqu0u3w+Z21Y
	 ULUIVGny995/TdvmUeg2BEP0UaJK9uWY+FXto/nEzPD6piy+I45CU+LVgLJjbjayZS
	 Z7wCS7W2ne44A==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 04/12] formal/spinhint: Do not call 2013 paper as recent
Date: Sat,  8 Apr 2023 10:33:01 -0700
Message-Id: <20230408173309.5543-5-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence in spinhint.tex is mentioning Jade Alglave's 2013 paper as
recent one.  It's a decade ago, so drop the word, 'recent'.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/spinhint.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index b740384d..9bb5f574 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -1178,7 +1178,7 @@ easier to understand.
 Is QRCU really correct?
 We have a Promela-based mechanical proof and a by-hand proof that both
 say that it is.
-However, a recent paper by \pplsur{Jade}{Alglave} et al.~\cite{JadeAlglave2013-cav}
+However, a paper by \pplsur{Jade}{Alglave} et al.~\cite{JadeAlglave2013-cav}
 says otherwise (see Section~5.1 of the paper at the bottom of page~12).
 Which is it?
 
-- 
2.17.1

