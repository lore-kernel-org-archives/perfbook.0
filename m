Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486851;
	bh=bP66pSqw4uhGMbOQldTh4c/SWyNtYxFzCyHuxm624UI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AbEgWdzsK9avdbTlbE4T+5dhEdym4LVGTCTBmwv1ca1uX7KLfVMu97iBoxi9w58je
	 t9Y7LotfnCsCP1PjZSL51TqwsD3sya8p/N8FjXbmE/qqinZZ3Cw2pLWclO1TYL0AXU
	 4sOXBNCS7bzkL9i3BnvMWhflk/pGz1SCEp588wC50xdhq3Pk7ShC9WpQGEovz3m42a
	 Auldr/IlRYXXjeg8bN8SHAk7o4jeOkTEHYiVG9byMxN6Uk2pZ1S3cHvcmxtmWRWpv/
	 +i8kFaPfADwn7G7zWAA0hJnn9WhTqBDmRtSZy4JXF+Onfkl1G1s7Q8vbHtNuOPSWo7
	 Ev4krj9U3JkgQ==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 03/10] memorder: Add missing unbreakable spaces between 'values', 'and', and numbers
Date: Sat, 23 Sep 2023 09:31:57 -0700
Message-Id: <20230923163204.14558-4-sj@kernel.org>
In-Reply-To: <20230923163204.14558-1-sj@kernel.org>
References: <20230923163204.14558-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence in memorder.tex is missing unbreakable spaces.  Add those.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index ba921ad8..38ff3a55 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2227,8 +2227,8 @@ situation arises.
 	But in
 	\cref{lst:memorder:Cache-Coherent IRIW Litmus Test},
 	wouldn't be just as bad if \co{P2()}'s \co{r1} and \co{r2}
-	obtained the values 2 and 1, respectively, while \co{P3()}'s
-	\co{r3} and \co{r4} obtained the values 1 and 2, respectively?
+	obtained the values~2 and~1, respectively, while \co{P3()}'s
+	\co{r3} and \co{r4} obtained the values~1 and~2, respectively?
 }\QuickQuizAnswer{
 	Yes, it would.
 	Feel free to modify the \co{exists} clause to
-- 
2.17.1

