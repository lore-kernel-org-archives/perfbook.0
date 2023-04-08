Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975210;
	bh=aig51T+Pv+IpoGc0ZWEr6cLBFBn6OSlsRbelbIJlCtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H0vweaxfKRTWgoRWa1Fzplm2uHVKn9u4kv/dfWBkD4VLrkgT0++YNr/GmqPGDPzpo
	 NCigUDiAf+IJw5ZeP6SdI0uUz4bBgPSga50QQ+LEu0+E9kP8nAsJJQ2jeUTPmCFwzn
	 DmZM13a6b2jQ4H4IcZPaMMYFnrdnQOlpdhWlUDozzsVUYi9PkdDJUiIbTEaXZ8Xpya
	 ZaH1BhBBfUKXEYkjrynn5B0Y07CiTqPrgqyE+XWScpPgX/GKxuLYMxFaXtFkIz/U6c
	 rYQS2uvYUSq/2HBmcNGrk5x98tcV0iMrU/LJrv+T/dxcBiGPbc3CQXvH/RRl/sDHWS
	 kseNnAbCQ2QWg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 06/12] formal/dyntickrcu: Use \qco{} instead of ``\co{}''
Date: Sat,  8 Apr 2023 10:33:03 -0700
Message-Id: <20230408173309.5543-7-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A few sentences in dyntickrcu.tex are using ``\co{}'', which can be
shortenized with \qco{}.  Use the shorter one.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 25012738..42c0c55c 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -890,12 +890,12 @@ statements in that group execute atomically.
 %
 \QuickQuizE{
 	But what if the \co{dynticks_nohz()} process had
-	``if'' or ``do'' statements with conditions,
+	\qco{if} or \qco{do} statements with conditions,
 	where the statement bodies of these constructs
 	needed to execute non-atomically?
 }\QuickQuizAnswerE{
 	One approach, as we will see in a later section,
-	is to use explicit labels and ``goto'' statements.
+	is to use explicit labels and \qco{goto} statements.
 	For example, the construct:
 
 \begin{VerbatimU}
@@ -921,7 +921,7 @@ statements in that group execute atomically.
 \end{VerbatimU}
 
 	However, it is not clear that the macro is helping much in the case
-	of the ``if'' statement, so these sorts of situations will
+	of the \qco{if} statement, so these sorts of situations will
 	be open-coded in the following sections.
 }\QuickQuizEndE
 }
@@ -1067,7 +1067,7 @@ to \co{EXECUTE_IRQ()} as follows:
 \input{CodeSamples/formal/promela/dyntick/dyntickRCU-irq-nmi-ssl@dyntick_irq.fcv}
 
 \begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irq-nmi-ssl:dyntick_irq]
-Note that we have open-coded the ``if'' statements
+Note that we have open-coded the \qco{if} statements
 (for example, \clnrefrange{stmt1:b}{stmt1:e}).
 In addition, statements that process strictly local state
 (such as \clnref{inc_i}) need not exclude \co{dyntick_nmi()}.
-- 
2.17.1

