Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486851;
	bh=bsrB1VNCxrX0uwejaxfITf5C5c7auigOhL33TW/fR9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HhRxE1qkc5xu56Ka+xzXbBHevKoBJqqZm2vpJ6V9KS6Xpq6pVEqcXfMVM61z+pI++
	 tcpg62PjEIlUvpgUEvLlN5JScQd+rCXvwIbZzS5gw2XBDo5sEVy0qREibA6MeC7L04
	 CoImt0PMrsg9f+ITLpIIoXZzA5rFtdBGcBRTSCeplg3fLiMi1Ta+uxIq/IXrU3Ng0C
	 6/F7MK+1eqTH7J/n3dxzc3nDCr845YINlE4F3+54+Jd/+ywMrZIT2osNreUuBwEp7G
	 bK/0oEzk03xIPyd/4Rpwy9Qvpl9n3Ib9a2tHuN2uQ9ZiScLpSG+IPVLmDHPUPFrwKm
	 jcnwDBMzOCnkw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 05/10] memorder: Remove braces for single line if-else blocks
Date: Sat, 23 Sep 2023 09:31:59 -0700
Message-Id: <20230923163204.14558-6-sj@kernel.org>
In-Reply-To: <20230923163204.14558-1-sj@kernel.org>
References: <20230923163204.14558-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Code snippets in memorder.tex usually don't use braces for signle-line
if blocks, like Linux kernel coding style.  However, some code snippets
use braces.  Don't use the braces to be consistent.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 5ad7e796..b5887764 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3896,11 +3896,10 @@ optimization levels:
 q = READ_ONCE(x);
 barrier();
 WRITE_ONCE(y, 1);  /* BUG: No ordering!!! */
-if (q) {
+if (q)
 	do_something();
-} else {
+else
 	do_something_else();
-}
 \end{VerbatimN}
 
 Now there is no conditional between the load from~\co{x} and the store
@@ -4005,11 +4004,10 @@ not necessarily apply to code following the if-statement:
 
 \begin{VerbatimN}
 q = READ_ONCE(x);
-if (q) {
+if (q)
 	WRITE_ONCE(y, 1);
-} else {
+else
 	WRITE_ONCE(y, 2);
-}
 WRITE_ONCE(z, 1);  /* BUG: No ordering. */
 \end{VerbatimN}
 
-- 
2.17.1

