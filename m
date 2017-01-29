Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=sl5JvB/b99QO53/IJ+T2wmEtIh9fXTyKY9J9x3fF2oE=;
 b=uljahNNql3jKwEmRxYwL8l4423uDrrjcGzwvn+0Lp6KVKB2YAtty9+FsgWc4uuCULX
 V2XzPhfGKqOMt6FaMqxOP2yzLn1bZ6G484y7PCKCHZ06RFWqtUmlBy8U+jWRkJ3bLrrj
 XpqlgigaaA7SmCyfw0auGhhf20CrCmPNtirA6GRhQzqFde9NLukUz/eXOSeYN4dUu5CM
 2WHYyBjRsGYJ1/vXR9W8C+Jh++E4ifu9x6XNyH/IFxaICfHqWlGx0TOabGVixBLOLnkH
 x/bCtR7AUrisw5SoXCbotugXMnCfvRDyW4OdpTYrmsp2+pYxGKNuwex2RmqFtTikSVId
 hliw==
Subject: [PATCH 1/8] bib/WFS: Add 'eprint' field to
 DanAlitarh2013PracticalProgress
References: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9758822e-584d-70f0-8b3d-0e3fcf83a398@gmail.com>
Date: Mon, 30 Jan 2017 00:27:18 +0900
MIME-Version: 1.0
In-Reply-To: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 50b85227c26de44aa0926d44067767f8d7a003f9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 5 Nov 2016 00:34:08 +0900
Subject: [PATCH 1/8] bib/WFS: Add 'eprint' field to DanAlitarh2013PracticalProgress

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/WFS.bib | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bib/WFS.bib b/bib/WFS.bib
index 2913043..43dfe3d 100644
--- a/bib/WFS.bib
+++ b/bib/WFS.bib
@@ -444,5 +444,6 @@ William N. {Scherer III} and Nir Shavit}
 ,Title="Are Lock-Free Concurrent Algorithms Practically Wait-Free?"
 ,month="December"
 ,year="2013"
+,eprint="1311.3200v2"
 ,note="ArXiv:1311.3200v2"
 }
-- 
2.7.4


