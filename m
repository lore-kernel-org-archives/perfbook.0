Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K6Ervcnj9PVveCfv1LBzDvwrPxZIHRkJTIg5mQpMFKg=;
 b=HgYPqmXWHwBKHN3mtm5fyVs0pMhf4G/KCzLq1R0MiIQcUjclR/XtuwNAMZEDYQqQWp
 uf2d/GoMNbxNlOwxh0yEx86gA/jM+34ZFzjaXc4dW9zCEhBmZF1lg1pvqthU4RNAZQXe
 u7J1MoHfxYvyEfwhkBuPLIHtqs+vu22Xl9RHxynUSohCZZhyBxx3gqf2TeEaiKzlWqRD
 lfF/VYI0symQeZRthRf+ZufuCL2x168IaX62iLho3QMFL2jAb7A+jVzHCzRKfqTiBn/y
 S68hVVmSxK1lMLQRMg3Ja86Gv7JYZn663Ze2pSOMpAxJzA1MUauvh3flJNE5AkLdbEii
 Q3sA==
Subject: [PATCH 3/4] whymb: Prevent line breaks between "bcr" and "15,0"
References: <01efa9e6-095c-2db8-2a93-e07ffa48b7d6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <517860fd-aef2-7754-384b-500a89ec2e1d@gmail.com>
Date: Mon, 24 Apr 2017 08:55:01 +0900
MIME-Version: 1.0
In-Reply-To: <01efa9e6-095c-2db8-2a93-e07ffa48b7d6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9b6444fcf2c6a57c2edb88ed81f0b35231a03d10 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 22 Apr 2017 00:19:54 +0900
Subject: [PATCH 3/4] whymb: Prevent line breaks between "bcr" and "15,0"

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 502e37f..96daa7b 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -2345,7 +2345,7 @@ mainframe family, previously
 known as the 360, 370, and 390~\cite{IBMzSeries04a}.
 Parallelism came late to zSeries, but given that these mainframes first
 shipped in the mid 1960s, this is not saying much.
-The \co{bcr 15,0} instruction is used for the Linux \co{smp_mb()},
+The \qco{bcr 15,0} instruction is used for the Linux \co{smp_mb()},
 \co{smp_rmb()}, and \co{smp_wmb()} primitives.
 It also has comparatively strong memory-ordering semantics, as shown in
 Table~\ref{tab:app:whymb:Summary of Memory Ordering}, which should allow the
@@ -2363,7 +2363,7 @@ That said, many actual zSeries machines do in fact accommodate self-modifying
 code without serializing instructions.
 The zSeries instruction set provides a large set of serializing instructions,
 including compare-and-swap, some types of branches (for example, the
-aforementioned \co{bcr 15,0} instruction), and test-and-set,
+aforementioned \qco{bcr 15,0} instruction), and test-and-set,
 among others.

 \section{Are Memory Barriers Forever?}
-- 
2.7.4


