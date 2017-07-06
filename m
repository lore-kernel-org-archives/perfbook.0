Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=9N0D4e6EYEmUZpMUMy185DVhttLLnGhldQQvt5/0+bQ=;
 b=GvkoEcsa+vhDUkVK8WzZtNzOc8+MGVMGoFXwI9g7YTir5FWY4gU7MYo+gccua6J5fj
 hqN61isXxukrJqF/Nk1FWKKDKpvOc/9LgX9QFZ/LnTLWjYmY7AY8JCuKhb+SKp9ME2ct
 D4mSNO+vtb+aogsI0d+YLE30MEVx/nkIfphu8eVjO7TsD9EmDElUdEvnpIeJy/uklBxg
 J+ynf/oioOUX7g1tF2OLRA4LNjURufdoEOLX1rEOI7HMaD+I3zO3dKvD8M8WlTWhekfA
 q/jHuCJA5ZWgy0XO3xorwNgOEsMUE1wjCZ9pveSM9PU5eBXHWl4ra2kaFSsY+l2jyWw7
 VsMQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] advsync/memorybarriers: Fix a typo:
 s/documention/documentation
Date: Fri,  7 Jul 2017 03:04:45 +0900
Message-Id: <20170706180445.25261-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 4ae3ca8..659a8c2 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -54,7 +54,7 @@ After all, if \nbco{0:r2=0} as shown in the \co{exists} clause,\footnote{
 	That is, Thread~\co{P0()}'s instance of local variable \co{r2}
 	equals zero.
 	See Section~\ref{sec:formal:Anatomy of a Litmus Test}
-	for documention of litmus-test nomenclature.}
+	for documentation of litmus-test nomenclature.}
 we might hope that Thread~\co{P0()}'s
 load from~\co{x1} must have happened before Thread~\co{P1()}'s store to~\co{x1},
 which might raise
-- 
2.10.0

