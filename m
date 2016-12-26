Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=CkLAcML9DFc4UP/cybAA+yzgPWIorMlwm6GgmPCkzag=;
 b=sIlCZ/gW9+CqFowFleMtOCbBig6QhDRmnEWYvj7jThI84gy4Cg9fH6RZDPyUNP2Pu9
 X2AExpTdHech64AiHY/ALdXrLc1olehgbtm6GwfMLnBmdEk2Fo7RKsbZYLbPuO57Gqjt
 0AltI31v0muVM3a5lUjO4j2tQTLUQNsvbt+zkwQjMahL3IgH76Mm1a0EfIOsKg8ogV9/
 MtMbFR4iTBDQi2qyEY7uZqDF5ZTZYjz+2ELkMbH2AHK2bQd5/qPwxaZ61AopT480k9p7
 T5QchnT1tFvLBjqNqKa4i6H3WrnJ3fkaqsBZxQ935f8snxO2lRgQI/+rPv6De8PXcZjH
 kaAA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/4] future/tm: Add missing period
Date: Tue, 27 Dec 2016 04:43:11 +0900
Message-Id: <20161226194314.7868-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/tm.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/tm.tex b/future/tm.tex
index 04d6c909c299..80aabf4340ed 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -641,7 +641,7 @@ lock-based critical sections and from RCU read-side critical sections.
 However, in initial transactional-memory hardware
 implementations~\cite{DaveDice2009ASPLOSRockHTM} an exception within
 a transaction will abort that transaction, which in turn means that
-breakpoints abort all enclosing transactions
+breakpoints abort all enclosing transactions.

 So how can transactions be debugged?

-- 
2.10.0

