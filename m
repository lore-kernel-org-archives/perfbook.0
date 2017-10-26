Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ma+zvPo1viyA9X9egc/vSzcwt4gsYPAHI1Qg8kiBFq8=;
 b=Eg16lfQyerFtO2dp/gzgxj1+3exRS2vikQZFydHHJUUGHAsPiq1c34eo5yHS9Jc599
 e27Xnz1UwGwNLdL10MjFmN44Zrkbky1vCXbZelalu/WSIkJri8ga8KAiK0RCA9bn+1F2
 FOH7fZMAq7mIvLp26X9TjR/nRKw74ht0Ngx5j8bFUePl71hK/xxQ2Jt+34hCTmv4NWHn
 mCVJP6brZtpitU1JEStxwaNGJM+YOW8PdOtq7LUn4dxT5/ZR2dvPAya/3Xn4c5kwudaB
 1Ho7Ov8O68RFm1plgf8XF44IBOAFH8vRF12ZFOgMMaLc9PPP8bYL5jr8ClS7W8uzKAMw
 GngQ==
Subject: [PATCH 1/5] memorder: Fix excessive uses of midrule skip
References: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f593e28c-e910-127f-4cff-ea3d901465a6@gmail.com>
Date: Fri, 27 Oct 2017 07:51:42 +0900
MIME-Version: 1.0
In-Reply-To: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 02bb04ebd5d1cce822aebb1e01fb0331e8b56aad Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 25 Oct 2017 20:22:24 +0900
Subject: [PATCH 1/5] memorder: Fix excessive uses of midrule skip

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 238783e..0ee4cad 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1973,15 +1973,15 @@ line to carry this new value to them.
 \small
 \centering\OneColumnHSpace{-0.8in}
 \renewcommand*{\arraystretch}{1.1}
-\rowcolors{13}{lightgray}{}
+\rowcolors{10}{}{lightgray}
 \begin{tabular}{rlllllll}\toprule
 	& \multicolumn{1}{c}{\tco{P0()}} & \multicolumn{2}{c}{\tco{P0()} \& \tco{P1()}} &
 		\multicolumn{1}{c}{\tco{P1()}} & \multicolumn{3}{c}{\tco{P2()}} \\
 	\cmidrule(l){2-2} \cmidrule(l){3-4} \cmidrule(lr){5-5} \cmidrule(l){6-8}
 	& Instruction & Store Buffer & Cache & Instruction &
 			Instruction & Store Buffer & Cache \\
-	\cmidrule{1-1} \cmidrule(l){2-2} \cmidrule(l){3-3} \cmidrule(l){4-4}
-		\cmidrule(lr){5-5} \cmidrule(l){6-6} \cmidrule(l){7-7} \cmidrule(l){8-8}
+	\cmidrule{1-1} \cmidrule(l){2-2} \cmidrule(l){3-4}
+		\cmidrule(lr){5-5} \cmidrule(l){6-8}
 	1 & (Initial state) & & \tco{y==0} &
 		(Initial state) &
 			(Initial state) & & \tco{x==0} \\
-- 
2.7.4


