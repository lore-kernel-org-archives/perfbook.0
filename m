Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316319;
	bh=9HtzCnUEQkfhsTuQQSv1jSK9DxMZXeb+5tv0ybyLcnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RDYQkfQ4Ablq4G0RW8O+82x1KboyOIUbEuH1sFgdtxD+TA02IsXAYDaNoD2sAGWaA
	 xWJ6w6CGl2MOjSrm2TY+mOMPCJmpV1iZ7UzUmew68ZZYs6PDuH/nHIX1uRtd5yHN4t
	 ADbTk1kVr3G0HHZSoQxjYXhZmRa/Wra1UybSPdUfNjHIVzHDOyif8XLgWUZat6b5Js
	 WQWZvF+asF5bdfH1kCmRYBw3duofa9wRP9rA/lAu49Xv7uSd/2IA+ZL7PwYD9cPBlN
	 exr15XYqsahSx9Epj4cuB5Xy5/bPJ18Bc6h1hrMP186ZIu6zECDBknDWswuhNq8kfw
	 Rzd/UHZTeWa4A==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 05/13] defer/seqlock: Use \co{} for boolean return value
Date: Thu, 24 Nov 2022 10:57:55 -0800
Message-Id: <20221124185803.8150-7-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

\co{} is used for some boolean return values and not for some other
cases.  To make it consistent, this commit makes it uses \co{} for all.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/seqlock.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index da1d19ec..f435a1af 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -144,14 +144,14 @@ will pass to a later call to \co{read_seqretry()}.
 }\QuickQuizEnd
 
 \begin{fcvref}[ln:defer:seqlock:impl:read_seqretry]
-\Clnrefrange{b}{e} show \co{read_seqretry()}, which returns true if there
+\Clnrefrange{b}{e} show \co{read_seqretry()}, which returns \co{true} if there
 was at least one writer since the time of the corresponding
 call to \co{read_seqbegin()}.
 \Clnref{mb} orders the caller's prior critical section before \clnref{fetch}'s
 fetch of the new snapshot of the sequence counter.
 \Clnref{ret} checks whether the sequence counter has changed,
 in other words, whether there has been at least one writer, and returns
-true if so.
+\co{true} if so.
 \end{fcvref}
 
 \QuickQuizSeries{%
-- 
2.17.1

