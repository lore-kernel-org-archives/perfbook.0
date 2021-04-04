Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AubsOcPgjgC+eAbsIv5Bw2p6Dhgrw9lcYeUREXEF55I=;
        b=b+Z5I+wPOSRC3fZj46N7QvR6au8mv5HcduZqlPEtw15AbByROiw9Qh7QJSnmCvaV0S
         rNUETnesMlohK3Y+2+nT4KYueIe9sZLvgjnqWJD29tg7AqRAKBBdYvqA4CUC9f9yffa9
         XdNmthWwcDzEmwLwl7JEGRUa28oEMa87AnXWGEJP6ddt8RHyTAjaQundcx5sF+7oGL+S
         Ss9Fyhp75IS20AI5Q1Gs5P11GJ9hfBHdTevXgJeL0VWbpZSX95y/mbAwe+4LAxRgfk6T
         W3UciAfqWLzXrRXCUJXW3RBri9V+8C3o87bYfS36NLiGcBaQRf/Edx8vtKT0ABPSGHks
         LC0w==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 4/4] howto: Fix a typo (License -> license)
Date: Sun,  4 Apr 2021 09:50:10 +0200
Message-Id: <20210404075010.15858-5-sj38.park@gmail.com>
In-Reply-To: <20210404075010.15858-1-sj38.park@gmail.com>
References: <20210404075010.15858-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit fixes a trivial typo.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 howto/howto.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index a0a4b755..b505aa98 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -511,7 +511,7 @@ a very specific meaning, namely that you are certifying that:
 	the open source license indicated in the file; or
 \item	The contribution is based upon previous work
 	that, to the best of my knowledge, is covered
-	under an appropriate open source License and I
+	under an appropriate open source license and I
 	have the right under that license to submit that
 	work with modifications, whether created in whole
 	or in part by me, under the same open source
-- 
2.17.1

