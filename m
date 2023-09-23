Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486852;
	bh=FrCbq4C/NcuCu8+EfSD1Q2/KAGlFpKtShdsxFOb2qpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HFOIzid38odLKQlpMZkzoVGOYVjJWyY5IxXqQw2ZRoTVoOiGKx6SD9TpWleH+uVQJ
	 RgXzPHcyCjHZNq4zqwY89sVJx7LoP1Tfg3POp8OVTmrhFPwbY7JG6t8bFt4UwLHXsl
	 ki1cj+UvY0ptDnmgOckqjfSPSC9SVYB4A0L4up0+KSWbi3DMRM9LnJi4Lp5w/+D6sE
	 TUYYWRsEJK9iT6C8FNIxhGDssuFXa9QL1AKvBVmKOCq5RNUVAUvSlTSek4ch5IrQD7
	 M/rHKCxkP4FAoWBN1419upzSUVKj1JATsyHpg+nmU3N/PM3NkGqovKWzo3wr0SAti1
	 QHI2DIZBafFtg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 10/10] memorder: Fix wrong primitive names in a quick quizz
Date: Sat, 23 Sep 2023 09:32:04 -0700
Message-Id: <20230923163204.14558-11-sj@kernel.org>
In-Reply-To: <20230923163204.14558-1-sj@kernel.org>
References: <20230923163204.14558-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

memorder.tex explains READ_ONCE() is having smp_mb(), but the following
quick quizz asks why it has mb() instead of rmb().  Fix the wrong names
in the quick quizz.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 5c978fbe..b3acc14a 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -5491,7 +5491,7 @@ Alpha is the only CPU whose \co{READ_ONCE()} includes an \co{smp_mb()}.
 \QuickQuizSeries{%
 \QuickQuizB{
 	Why does Alpha's \co{READ_ONCE()} include an
-	\co{mb()} rather than \co{rmb()}?
+	\co{smp_mb()} rather than \co{smp_rmb()}?
 }\QuickQuizAnswerB{
 	Alpha has only \co{mb} and \co{wmb} instructions,
 	so \co{smp_rmb()} would be implemented by the Alpha \co{mb}
-- 
2.17.1

