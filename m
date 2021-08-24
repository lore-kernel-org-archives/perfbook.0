Return-Path: <SRS0=6cBa=NP=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0rlYKapTW9fHlw1ZIi7SsYEzKzxNzqs/h0XbpTm/R4Y=;
        b=NzGzvXSp3H3oSl3bT6wobaQ9bS838n7YraCmSxyvdNIfrmmvAOPXayeiIKXyvLdnKc
         RI5MFR/ezwx0lrNNOxGwfKI32TbCrxmsQ8YPm13XjZ3CVxItFHez9Pp2PJs9aE6wfGHL
         dId07+qZdIdQAz1NEaCjjCh5TdmWPOjzlKoIZjVMWhrCALO6b39TTzJe0mYfMBHg2drh
         PGsolwiHdUK8fwl+VXy17Ozk5xAu2q/kMcwb7rIylD/cIMkA6kTMtgC2AgU/CrsxFXbO
         W7i9pIerooDksMzhSZkOJK99B/i9dEk/9XL1fMFV6tNgKehMfN+wp4yliFARFDTH+bX4
         7f/A==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] fix a typo in QQ 10.15
Date: Tue, 24 Aug 2021 17:16:47 +0800
Message-Id: <1629796607-6214-1-git-send-email-zhouzhouyi@gmail.com>
To: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul,

When I examine the answer to QQ 10.15, I can't find the word "roughly"
around, so I guess it should be "rough" instead ;-)

Thanks
Zhouyi
--
 datastruct/datastruct.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index c370033..552bd95 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1696,7 +1696,7 @@ bottleneck.
 	the bottleneck and the larger number of buckets increases this
 	workload's memory footprint.
 
-	The alert reader will have noted the word ``roughly'' above
+	The alert reader will have noted the word ``rough'' above
 	and might be interested in a more detailed analysis.
 	Such readers are invited to run similar benchmarks, using
 	whatever performance counters or hardware-analysis tools
-- 
2.5.0

