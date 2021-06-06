Return-Path: <SRS0=2uZh=LA=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2KxDB5Ue3vH+HRVth455G8Eumd78comExlaI7UTMaWU=;
        b=fkNN4iXqSCXmcPcnTHNCMvZoFrOQw9RnBCBtTy/6jBMaDv4WUD/sE46T7eWpbjbGvx
         zQjmOQQYaEfVbKp7VNVrBrUXEn+gdQlfE6Kc2f8wVacLtJBgHpRnttX+wsSOlD+lejyP
         FVXG6q46MFprZ0gEJPk29z2TGFSL2O4HOj7VKQTz60gXVuCbk0BpjkBC4aABfdPh3u+/
         YNlqp13yq4Y0KJBK7VMmQojrFJAmyH2HL2PyY45pf26dlNN5jR9S2KozDmou1qh09B1C
         MuDcY//c3LeU++rgM2i2qK8HKV9mlLpwaCc+sxpQ0W5DZBFGBKUxPLJMG7vqGdyAHXK5
         J8Iw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] intro: Add missed unbreakable spaces
Date: Sun,  6 Jun 2021 10:17:27 +0200
Message-Id: <20210606081727.2125-3-sj38.park@gmail.com>
In-Reply-To: <20210606081727.2125-1-sj38.park@gmail.com>
References: <20210606081727.2125-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit adds missed unbreakable spaces ('~') in the intro chapter.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 intro/intro.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/intro/intro.tex b/intro/intro.tex
index 991a5f5d..5f2690fc 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -634,7 +634,7 @@ It should therefore be no surprise to see similar tradeoffs
 appear in the field of parallel computing.
 This tradeoff is shown schematically in
 \cref{fig:intro:Tradeoff Between Productivity and Generality}.
-Here, users~1, 2, 3, and 4 have specific jobs that they need the computer
+Here, users~1, 2, 3, and~4 have specific jobs that they need the computer
 to help them with.
 The most productive possible language or environment for a given user is one
 that simply does that user's job, without requiring any programming,
@@ -673,7 +673,7 @@ Haskell, Prolog, or Snobol), as is shown by the circular region near
 the center of
 \cref{fig:intro:Tradeoff Between Productivity and Generality}.
 These languages can be considered to be general in the sense that they
-are equally ill-suited to the jobs required by users~1, 2, 3, and 4.
+are equally ill-suited to the jobs required by users~1, 2, 3, and~4.
 In other words, their generality comes at the expense of
 decreased productivity when compared to domain-specific languages
 and environments.
-- 
2.17.1

