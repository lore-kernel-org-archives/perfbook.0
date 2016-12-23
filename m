Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=cskQgLXeucujZIOTRMxtlxDf6gstwCNycJLQOwRv8AE=;
 b=hW4mq/iEFY6CQgSqaVB+w2PxDKNmyXhGtJO+hdJzM9Wan9bTkx58KlrZeUrigU/GeA
 jGs4QIWbGUY5etKVKwx7IR3NYMTXFGCQVuvSBGF6+S3bVSu5H6jCgFc/9NQMDo5RtRHP
 W49WOdAhAkpHQd123IjbEKJ+cDVwnm2jvpJ659cB5lp8NF6gSGtIgLB9N6/13HDppm1O
 gO9uUBzZW8yTWKMo1QwivHyTFjZnaALSA8ntPpxgS/XBXRtOMAofBdpF8OXqpqPbodcD
 vzCVYkNF8fefqIKuXceJ4YjcWntg6xhYW1kU5Wb6ZHS6nNpoOMNo5X4iY4hW3FYUMW3C
 PZYw==
Subject: [PATCH 2/3] advsync/memorybarriers: Fix typo (READ_ONCE ->
 WRITE_ONCE)
References: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3defa463-0386-fc63-44db-14d7b0e52593@gmail.com>
Date: Fri, 23 Dec 2016 17:10:44 +0900
MIME-Version: 1.0
In-Reply-To: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9cd64784778068743b68110c830547e9dfeb5e9b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 23 Dec 2016 16:14:38 +0900
Subject: [PATCH 2/3] advsync/memorybarriers: Fix typo (READ_ONCE -> WRITE_ONCE)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 8018f8c..e117c2c 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1845,7 +1845,7 @@ as follows:
 \scriptsize
 \begin{verbatim}
   1 q = READ_ONCE(a);
-  2 READ_ONCE(b, 1); /* BUG: CPU can reorder!!! */
+  2 WRITE_ONCE(b, 1); /* BUG: CPU can reorder!!! */
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}
-- 
2.7.4


