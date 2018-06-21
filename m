Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=8AncBqGgR6LRn1vFF93Kf5ZVNmINhouVoGeUbuxPuFI=;
 b=Y9vlzgOoYr2f1wTiwbRc8TRnWzgNmKSCVS39dOfqqOfOJSm/+ykvDA+a9qG4tnxpzE
 gmqpN5/lECc/cXHGVqWm2vgBPzEJGWMOLxi3tIJlUv4ZryoeT1PXj59qSzJN7e8DBohy
 1GD2ixkGIKSloJz1WoCCN1nB15Wtb6CY1ZHhzpoQGD0f7etFb/UGaLPMXIJSHXZYNRfj
 NLBAmNTHOuwHaa56nDbb+EYG+llO70jCLxImraM3tMgPejMyB4jNLYOGDqWlPNf7YUUV
 uy1ifh60kpHaLbKaGs+bbFWhZ8tJIkCEfKQDouefneEQ/Gzh/OS6IZWl7+Ky55W3tKaz
 40ow==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] bib/QC: Use ASCII apostrophe
Message-ID: <d9f4012a-8b2a-e227-34e2-0002a38a91fd@gmail.com>
Date: Thu, 21 Jun 2018 22:17:51 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d31dccd5a0e41c8082893c8caef8a43ae4065f94 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 21 Jun 2018 21:23:43 +0900
Subject: [PATCH] bib/QC: Use ASCII apostrophe

Also keep some capital letters in title.

Fixes: f1903322bdb8 ("Bibliography update")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/QC.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/QC.bib b/bib/QC.bib
index f598d26..0c80e46 100644
--- a/bib/QC.bib
+++ b/bib/QC.bib
@@ -1167,7 +1167,7 @@

 @unpublished{JohnBoyd2018ClassicalAnneal
 ,Author="Johhn Boyd"
-,Title="Fujitsu’s CMOS Digital Annealer Produces Quantum Computer Speeds"
+,Title="Fujitsu's {CMOS Digital Annealer} Produces Quantum Computer Speeds"
 ,month="May"
 ,day="30"
 ,year="2018"
-- 
2.7.4

