Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=o/0MefTVPQ1yoGvvVfQ3Piuegd9gNJs68eF5AAASkhA=;
 b=uBYqaHXiTYvE9bPrkje9jj3u2KFspSxISJZ9XOl1gbRETg6Rwo26kXfQ8qJCH1SN4P
 9pGilnlWo4NIPnJ7CUlGhDuIy1xnTbjeVzJnWbgu+fVmdnCiNaZ95oC+kXvzI0nQumZR
 XsUaE1h1WmUdF9GBnfO7mL2jnxtthcpPrwocYH9qC6xycymGLlQOrsnOgUJZA67aj12m
 EK7NYZAZGgcuS0+6mjXOqMkjJAL4BYTOfh3UyFswO2hWmNPLom2KakIAwn0hu0BXJCDW
 Pm9+gleHmgHGYkIvyS1OtFh3tNhwFS7tGtStr3nuUgeAtr4Cce9l6uA6xWeR/6Z+qvi8
 kydw==
Subject: [PATCH 1/7] bib/TM: Replace url with doi of DaveDice2006DISC
References: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1f5ca2c1-e4ac-3b3b-c5d0-d07b5441e297@gmail.com>
Date: Fri, 3 Feb 2017 23:05:52 +0900
MIME-Version: 1.0
In-Reply-To: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cd64c2129d38e0c6b569fdc76f7005702f741f31 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 Nov 2016 18:01:00 +0900
Subject: [PATCH 1/7] bib/TM: Replace url with doi of DaveDice2006DISC

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/TM.bib | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/bib/TM.bib b/bib/TM.bib
index 07b39e2..81d7ce2 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -330,9 +330,7 @@ Languages, Compilers, and Hardware Support for Transactional Computing}
 ,booktitle={Proc. International Symposium on Distributed Computing}
 ,year={2006}
 ,publisher={Springer Verlag}
-,note="Available:
-\url{http://www.springerlink.com/content/5688h5q0w72r54x0/}
-[Viewed March 10, 2008]"
+,doi={10.1007/11864219_14}
 }

 @inproceedings{Colvin2006LazyList
-- 
2.7.4


