Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TxIPnPVFIFhNq/mADmvw7+0aItQPig88hyAVIyAqmxY=;
 b=jO/B1rK1FacMwstchSmJ6dEkLFfYxVyGTXJ316buegodGpJbvcL3LPNo9IWkCxAiUN
 IjKIZt+jyeWXA2tKVnPq9ioQTyRBTHYx+QHWudF6fN4e5MNB3FuabAGgu4w9wZIS/Iie
 2xQUa0r4SKHZBbSAlACl+4qrudvyJSbGxb7a2hPM423NaXFUp2XgJY0CbujeMtankai3
 oBpbl7Sgcf5pba4DWYI8Pu9Av/kJZP7XSckpYqYO1vfSN7g1whNWXCGngZWW0QNMZ7Xg
 oCThUQMabyyBm6n8zhspHtJAuAkXZnacQ/cKrqGHnbwaLPehBikTXOUSEPenuAOIULb6
 3Jzg==
Subject: [PATCH 03/10] future/QC: Insert narrow space in front of percent
 symbol
References: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fe1b32a7-1f30-d751-0d87-12c69b8e2fa4@gmail.com>
Date: Fri, 6 Oct 2017 00:51:35 +0900
MIME-Version: 1.0
In-Reply-To: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 85760945ceceff79e0d43156ad428043141c38b0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 30 Sep 2017 18:01:14 +0900
Subject: [PATCH 03/10] future/QC: Insert narrow space in front of percent symbol

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index e5ff74e..437a4d4 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -309,10 +309,10 @@ A qubit is said to:
 \item	Collapse to a zero ($\ket{0}$) or a one ($\ket{1}$) if measured,
 	with probability being a function of the relative distance from
 	$\ket{0}$ and $\ket{1}$, but projected onto the Z-axis.
-	Thus, a qubit on the equator of the Bloch sphere has a 50\%
+	Thus, a qubit on the equator of the Bloch sphere has a 50\,\%
 	probability of being measured as a one or as a zero, while
 	a qubit on the 45\textdegree-north latitude would have
-	a 14\% chance of being measured as one and 86\% chance
+	a 14\,\% chance of being measured as one and 86\,\% chance
 	of being measured as zero.
 	This situation naturally causes developers to prefer a line
 	segment---or a classic-computing bit---over a sphere.
@@ -335,7 +335,7 @@ are as follows:
 	positive X-axis intersects the Bloch sphere, and rotates $\ket{1}$
 	to the point at which the negative X-axis intersects the Bloch
 	sphere.
-	Either way, we get a qubit that is 50\% one and 50\% zero.
+	Either way, we get a qubit that is 50\,\% one and 50\,\% zero.
 \item[\qop{S}\,:]
 	Rotate 90\degree{} ($\frac{\pi}{2}$ radians) about the
 	Bloch-sphere Z-axis, which has no effect on qubits in the
@@ -1260,9 +1260,9 @@ be extremely valuable in reducing costs (and environmental impacts)
 of logistics, but current classic heuristics can find near-optimal
 solutions for hundreds of cities~\cite{Martin:1992:LMC:2307953.2308141}
 and polynomial-time algorithms that are guaranteed to find routes
-that are no more than 40\% longer than optimal for arbitrarily
+that are no more than 40\,\% longer than optimal for arbitrarily
 large numbers of cities~\cite{Sebo:2014:STN:2688265.2688281},
-improving on the 50\% bound located a few decades
+improving on the 50\,\% bound located a few decades
 earlier~\cite{NicosChristofides1976TSP-FiftyPercent}.
 As of 2006 TSP solvers were finding optimal solutions to
 85,900-city problems~\cite{DLApplegate2007TSPtextbook}.
-- 
2.7.4


