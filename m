Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=MI9/1lVhoB/NUSfCN2t3bZ+P4wy4d86nL56LCfvDVAI=;
 b=uM2Ge0+b5oHhxSF3Prge4C8fIcx9MjjPHWCnrf1ROEHV7paFWh8bBp9t44jTwgSkz0
 uvSpe6b1rQOTZ1l3wT2FKMxzeCnKpz/N8VjuPnBBL+oZXsYXQsTHt/heWtMwDtXlbC4M
 tc2G8R7596P/iQcr/pQ8VpnhDGINLZITu72XuhEA4Ns8B/woOkMEk/sG26/M+/k3BWoc
 mPNtRYd82ThdMHpN7NtBQtxw2nov/JUed1fo0Ij/BI4KDnDEKsIt9iuKevfXVLL2NeoN
 uNVjSGMzXbnOLpxKjFMN20rhdQB6W57u7Y42Ks0CmRA5SOHpPGRpiGwoNg/TLmPvkdZI
 xhaQ==
Subject: [PATCH 2/7] bib/swtools: Salvage url of DouglasEngelbart1968
References: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ad0d0960-7cae-4507-cee4-bd2130c719c7@gmail.com>
Date: Fri, 3 Feb 2017 23:06:46 +0900
MIME-Version: 1.0
In-Reply-To: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 44f7a8f64d67aad10a242da8009f811713b977ae Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 Nov 2016 19:21:14 +0900
Subject: [PATCH 2/7] bib/swtools: Salvage url of DouglasEngelbart1968

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/swtools.bib | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bib/swtools.bib b/bib/swtools.bib
index cbf0612..1a470fa 100644
--- a/bib/swtools.bib
+++ b/bib/swtools.bib
@@ -5,9 +5,9 @@
 ,year="1968"
 ,month="December"
 ,day="9"
-,note="Available:
-\url{http://video.google.com/videoplay?docid=-8734787622017763097}
-[Viewed November 28, 2008]"
+,note="URL:
+\url{http://dougengelbart.org/firsts/dougs-1968-demo.html}"
+,lastchecked="November 12, 2016"
 }

 @unpublished{StephenJohnson1977lint
-- 
2.7.4


