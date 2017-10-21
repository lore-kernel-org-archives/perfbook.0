Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=44NT2KLew5Aw1Axfmg6lp5dRoU3oNxyFwzsYzE68PAA=;
 b=H1xaZhMKIg9F8hwy8aGEO27EDMbQgDeWT1f4GEKnl8LNpUI6Etx2iGxwmzOgeBvEEN
 6h0N42n+2UcpSXnFFcSLwoyZ+nWB37kRFPlDMyF1PVEeM8f1rGy8dxhBckCgkjpa4+l4
 ljl3dKu9s7Fkkud3Ihzy0uGN8w8jJlzJNnfR9YoSi2wqX+FMJck7qsHm/2eLCvBWTY78
 Ed1Yq6M5ij4pbylzejQmioYKzmTCa8h6jrjaqQdWhBNvELl0A4TgX2u+xq9gxEEQPQyR
 T1WkSC1o3CkgZFEWYUpF2vDVhjoUnlsZ4/POFqa71s8NkvjPcOB0EUyAmQQCA18k++aE
 GehQ==
Subject: [PATCH 3/3] toolsoftrade: Adjust wording on age of POWER5
References: <6d7b64ad-0a50-74f9-cae4-5800334e5569@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0f250ee5-7928-8d51-00a5-78e7cf48796c@gmail.com>
Date: Sat, 21 Oct 2017 09:10:23 +0900
MIME-Version: 1.0
In-Reply-To: <6d7b64ad-0a50-74f9-cae4-5800334e5569@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 79aa63bf91eacaec2c8cdf15d1f1874fbc42913e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 21 Oct 2017 08:40:45 +0900
Subject: [PATCH 3/3] toolsoftrade: Adjust wording on age of POWER5

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 77b3eba..d37a295 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1137,7 +1137,7 @@ This situation will only get worse as you add CPUs.
 } \QuickQuizEnd

 \QuickQuiz{}
-	\Power{5} is several years old, and new hardware should
+	\Power{5} is more than a decade old, and new hardware should
 	be faster.
 	So why should anyone worry about reader-writer locks being slow?
 \QuickQuizAnswer{
-- 
2.7.4


