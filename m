Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E965HggFgkmD4ucdW9FY2Ps+GlkIg3Gcb3EAWIPBMnU=;
        b=oQD/YDn09N4a14X5QL/DaXnPWw+rtJdLLuHxOryLtLqOy533apxbiV9j/+iyscEBmn
         +bCzV20CIYPela+5PcoTMzRTIkcKwzuPK0+p8f9D9q+DkKY8W3lq/Tk/a27Q4kuj6fbH
         18Amj3nQffQmfR4P7d8aXjYYXGIWwo7Z1roCvjGXQabg1W3b1YgZABqW2wGxnzvo1Jkd
         /pT9f6VeyMQJQ6dsFr2mJ5DZIddqdyDr//DqFiR8exHrbHE+3KgnJ9EuPJwZE1QQ4MRJ
         SHrvDYQt/2UfR7fhZRcGV6ESdKtSszbXo5YpMEJBZlGf1qf7Vyo+timCHz0RFbDkek+m
         +CRg==
Subject: [PATCH 5/7] howto: Stop mentioning quantum computing
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <13bf28c8-9a8c-74c9-1ea4-009fa44f6697@gmail.com>
Date: Sun, 21 Jul 2019 09:10:37 +0900
MIME-Version: 1.0
In-Reply-To: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2aadd71518c8dda2748541618038c495903ee9da Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 6 May 2019 00:02:22 +0900
Subject: [PATCH 5/7] howto: Stop mentioning quantum computing

Paul gave up tracing quantum computing as of commit 972946a5298a
("future/QC: Remove quantum-computing section"). Remove it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 howto/howto.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 5fcc1e5e..3bdec595 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -119,7 +119,7 @@ Chapter~\ref{chp:Ease of Use} follows up with some ease-of-use advice.
 Finally, Chapter~\ref{chp:Conflicting Visions of the Future}
 looks at a few possible future directions, including
 shared-memory parallel system design, software and hardware transactional
-memory, functional programming for parallelism, and quantum computing.
+memory, and functional programming for parallelism.
 
 This chapter is followed by a number of appendices.
 The most popular of these appears to be
-- 
2.17.1


