Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=8jwzhGPc9MQd9Gh364j4MCZ5hkI8dOGpdFSZEJ4L75c=;
 b=U+GTQFnPOPMQrM3HsAE4/34WszRHYDaIrft0iFlWVPV8A4lKB3EafJOyAvJz+JJmrM
 kJgoVXsZ1/CsdBVdcQgg0Wi/WvaemYD6V/sYASg7eMp5DpcBaVgXtZns3rEJwaZ+qSLP
 nCtUI+djMgIBWpNCgQJx776KRLZBPBzXMzWezbgbL6k/TddrXD+PSEoZi8S0T19P/e/P
 9jUai1kEXL18tkTYAw2ktcLh+/0Rf+uYk7rKFZfrjpDOujueeQmtdofrs7Zed5hA1aiF
 TIp4A/mFag0kreU3AR80/PAbCWc24CKLTEneo39K+gGY+Q3PtAkcNGXwsZCIiHHfwyGP
 KO9w==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] intro: Polish a sentence for MIPS graphs
Date: Sun, 11 Mar 2018 21:52:41 +0900
Message-Id: <20180311125241.30343-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit polishes a sentence for MIPS graphs, which is updated by
commit "cpu: Update MIPS graphs, adding past five years of CPUs"
(71d8328f3d18).  The sentence is saying that the updated graph is
showing past three decades, though it is now showing past forty years
and the sentence also says so at last.  This commit polishes the
sentence to say about the fourty years.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 intro/intro.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/intro/intro.tex b/intro/intro.tex
index a4ec3a8..2f5679d 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -449,7 +449,7 @@ The CSIRAC and the Z80 are two points in a long-term trend, as can be
 seen in
 Figure~\ref{fig:intro:MIPS per Die for Intel CPUs}.
 This figure plots an approximation to computational power per die
-over the past three decades, showing an impressive six-order-of-magnitude
+over the past four decades, showing an impressive six-order-of-magnitude
 increase over a period of forty years.
 Note that the advent of multicore CPUs has permitted this increase to
 continue apace despite the clock-frequency wall encountered in 2003,
-- 
2.10.0

