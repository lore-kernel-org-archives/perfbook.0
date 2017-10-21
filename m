Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=If+QhP9lK4S1MC7q9aI2uJ/yzOaLPbXyRxIPjLiFLNo=;
 b=kUWDjhzLd3dbAon8nfHr4Dm/bnOzbW9idFD85rPAhWt+w1BGtZAApOUJbCqFGo3f8a
 DjQ5wsbhfWwh7DnRnyGCjY+7qTA8Eo2fFD/xb5xoBLA/w50lMbn7LjrCnN6GaFXyCrmk
 dR2eH2tBSuADYxUnVeNGhXWcCNawgvy5ZE/hTSt0zg9tZIH/8HjW6lg7M7MnflJtJ+O0
 sCR0hlHvcteUkDa5qC07OxWPfvZTZoSkfHIBZaguS6GRBHw0mx5kUYemffBCG1DPw72B
 1Yq5MALEMEdf2kEZ7FnKHw6PVMhABhY9En5tWmUC5MGo4NoYKKOnMvlgN9FkLI/G0h3C
 9vOg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/3] debugging: Use \ln for natural logarithm in Eq E.9
Message-ID: <6d7b64ad-0a50-74f9-cae4-5800334e5569@gmail.com>
Date: Sat, 21 Oct 2017 09:07:28 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ad506b1b01a5c13bbbe393c7acaa11b4320d0601 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 21 Oct 2017 07:53:36 +0900
Subject: [PATCH 1/3] debugging: Use \ln for natural logarithm in Eq E.9

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index a4537b0..700e725 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -1265,7 +1265,7 @@ following formula:
 	Equation~\ref{eq:debugging:Error-Free Test Duration}, resulting in:

 	\begin{equation}
-		T = - \frac{1}{3} \log \frac{100 - 99.9}{100} = 2.3
+		T = - \frac{1}{3} \ln \frac{100 - 99.9}{100} = 2.3
 	\end{equation}

 	If the test runs without failure for 2.3 hours, we can be 99.9\,\%
-- 
2.7.4

