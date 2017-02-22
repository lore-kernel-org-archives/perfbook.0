Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=NRtXixg55xHsrSeqBSG3xFWMEzlW+jVrqvizyk+tX4c=;
 b=N40ed/pV21YxaVLLKqG6qvXbzWtf3dI8+p4QnEUFZbse9BskkNRcpqiQoSgn8W6opE
 /uBdXeM7h2AufCgDuLHqgMwFaUJQWCt1QlZvg2oCDGBEbmtpeHEzhWPoHzsUE8xA0529
 rg+AUouUYBGRXeGhgVTyy5yW2aYvNsmioRbrdLlFsqV6IQHapn56gDriNAuSatLjGfsW
 VOoxaanTXPuKBTfC68NNSWogOiecL7TURhSi1jJNg1aAGna+r6Q/OJaV3fQ24daSRZvo
 1qTSuciRnqPq28p5tEa+CCHfbvwJfLna6E1u1S/DncShZhVSVSHhmLcHeo93M7RLIUOO
 b+ww==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] bib/syncrefs: Use consistent date format
Date: Thu, 23 Feb 2017 00:28:06 +0900
Message-Id: <20170222152806.2313-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 bib/syncrefs.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index c702ac577774..f3495e1bc5d1 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -1275,7 +1275,7 @@ Simple Locks in a Multiprocessor System"
 ,number="6,842,809"
 ,month="January"
 ,url="https://www.google.com/patents/US6842809"
-,lastchecked="December 07, 2016"
+,lastchecked="December 7, 2016"
 }

 @inproceedings{YossiLev2009SNZIrwlock
-- 
2.10.0

