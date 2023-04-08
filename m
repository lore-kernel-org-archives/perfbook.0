Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975209;
	bh=imuhkR5+eHbtP8k09MDD9QETyi8NuFTDXO6tmbAB9mA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BkIZj0hdlhPUvi+9NTtTNILik2j0M/do4K0/rNR+CR72mjXPFnFHLx2vd/4953eoC
	 nvbrCtvujvvEEGAldCR/NBoxFRhNvJ0d9QwASF1181ZDmtxr9/cMpj/8xU1gKgXVXA
	 63AGK8O9EveNa36YPmVL9EjvvF3jg+8vRgtXSUZoOvDd2GfQVyFxL9e382TldGAQoB
	 FNofdsUIDELWkMdWyx3Per11DW9iLvilD++CLYkOisgTjSmyQti186+4y8OJfOQowq
	 9+XNl7vqKigelB8sOIo/iIkDr2kO3bR8m1h+0elJ6e7ssoVDWsJqHRbePIBRiP8zDH
	 wx8yAzOXNA40A==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 03/12] formal/spinhint: Enclose example code snippets with \co{}
Date: Sat,  8 Apr 2023 10:33:00 -0700
Message-Id: <20230408173309.5543-4-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A few sentences in spinhint.tex are not enclosing example code snippets
with \co{}.  Enclose those for better readability and consistency.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/spinhint.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 0371f570..b740384d 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -397,8 +397,8 @@ The following tricks can help you to abuse Promela safely:
 
 \begin{enumerate}
 \item	Memory reordering.
-	Suppose you have a pair of statements copying globals x and y
-	to locals r1 and r2, where ordering matters (e.g., unprotected
+	Suppose you have a pair of statements copying globals \co{x} and \co{y}
+	to locals \co{r1} and \co{r2}, where ordering matters (e.g., unprotected
 	by locks), but where you have no \IXpl{memory barrier}.
 	This can be modeled in Promela as follows:
 
@@ -552,12 +552,12 @@ unclaiming it on \clnref{unclaim}, and releasing it on \clnref{unlock}.
 
 \begin{fcvref}[ln:formal:promela:lock:spin:init]
 The init block on \clnrefrange{b}{e} initializes the current locker's
-havelock array entry on \clnref{array}, starts the current locker on
+\co{havelock} array entry on \clnref{array}, starts the current locker on
 \clnref{start}, and advances to the next locker on \clnref{next}.
 Once all locker processes are spawned, the \co{do-od} loop
 moves to \clnref{chkassert}, which checks the assertion.
 \Clnref{sum,j} initialize the control variables,
-\clnrefrange{atm:b}{atm:e} atomically sum the havelock array entries,
+\clnrefrange{atm:b}{atm:e} atomically sum the \co{havelock} array entries,
 \clnref{assert} is the assertion, and \clnref{break} exits the loop.
 \end{fcvref}
 
-- 
2.17.1

