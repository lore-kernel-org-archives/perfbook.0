Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35712 "EHLO
 mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750933AbdGaFuM (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 31
 Jul 2017 01:50:12 -0400
Received: by mail-pf0-f194.google.com with SMTP id q85so25180014pfq.2 for
 <perfbook@vger.kernel.org>; Sun, 30 Jul 2017 22:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=w4erMm2Jp8h/az0CAS9XGz7iRpsWhvS2h7+4V41PCzM=;
 b=HfJu4arSxozkfzlYtIMwTGN2vtICVqXRxXpYKjQfAFfnd5hA2vXkG5ZJxiZ8QC4t68
 nAf2vzekPvjnbLadXY0rrUanArPktdCWtplSpkmdnuKdoS0glAGyo/D2km7jXEE8O2Xi
 aVndifRkWxbi7IjlAgOcK0psI1oRBHZSqVZS0vFQ8jQ46ovm9cxi7Ln9oYAza8IRYQfK
 RUel/yHJv+Z2oUrnQsetCIzq5RDBPp4Ls1MRFwnuWe85lWsa1W56DpBpB0e8z+ajbHon
 zNNQjPDjU6tB57OWt9Uac8CeNJayCM0+5Tm65VQn29CUnnoSVZG16V2CDn9I0KCewIYk
 l1AA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] howto: Add unbreakable space for volume number
Date: Mon, 31 Jul 2017 14:50:05 +0900
Message-Id: <20170731055005.18716-1-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 howto/howto.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 323f95f..90abb14 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -276,10 +276,10 @@ Fortunately, there are many alternatives available to you:
 	on programming-language pragmatics.
 \item	If you are interested in an object-oriented patternist
 	treatment of parallel programming focussing on C++,
-	you might try Volumes~2 and 4 of Schmidt's POSA
+	you might try Volumes~2 and~4 of Schmidt's POSA
 	series~\cite{SchmidtStalRohnertBuschmann2000v2Textbook,
 	BuschmannHenneySchmidt2007v4Textbook}.
-	Volume 4 in particular has some interesting chapters
+	Volume~4 in particular has some interesting chapters
 	applying this work to a warehouse application.
 	The realism of this example is attested to by
 	the section entitled ``Partitioning the Big Ball of Mud'',
-- 
2.10.0

