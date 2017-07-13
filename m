Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ExYlnA1eo9kFvabwUuv0pTxQMf/u6msAc+dWr3FbXys=;
 b=VGAKGN/N8wd7xP0SkClRkJ9vvVzL3oXeH4AZlCQ3Teqv6tAJdnjrhl7AX0PPvW78k7
 gfme34fkDruyU7e8Gt6fhlhNgcV1PE02LwnWuNA6889baDf2kSO91KBo7Z74isal2CaB
 Ne2SEElsS5qqCchGescKoFbvs48rN2Qp1MF6C+nCPaGZ58dBG36cL3TGZ4noVCio9Cc9
 XH9F/w57b8IbRc13jbW+GEsMhcaT7pU67htvbDLFgzF0JFAiRYMgG2UNPFsopuJHo6I+
 9lwuIoTvMECsEv6KyhK1aUPkykhc2MyS5isUwaoSVp6TBaLYYFfGmfr5jzNhMXWAyDm9
 GF+Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] future/QC: Add space before citation
Date: Fri, 14 Jul 2017 08:19:23 +0900
Message-Id: <20170713231923.4929-2-sj38.park@gmail.com>
In-Reply-To: <20170713231923.4929-1-sj38.park@gmail.com>
References: <20170713231923.4929-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/QC.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/QC.tex b/future/QC.tex
index f985437..f873cd7 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -1058,7 +1058,7 @@ of logistics, but current classic heuristics can find near-optimal
 solutions for hundreds of cities~\cite{Martin:1992:LMC:2307953.2308141}
 and polynomial-time algorithms that are guaranteed to find routes
 that are no more than 40\% longer than optimal for arbitrarily
-large numbers of cities\cite{Sebo:2014:STN:2688265.2688281},
+large numbers of cities~\cite{Sebo:2014:STN:2688265.2688281},
 improving on the 50\% bound located a few decades
 earlier~\cite{NicosChristofides1976TSP-FiftyPercent}.
 As of 2006 TSP solvers were finding optimal solutions to
-- 
2.10.0

