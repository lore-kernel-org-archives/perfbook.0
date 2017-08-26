Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=kVZIOCRFz9bsBHcz08B1Nyh0HhQwldPXGejy8KorjiI=;
 b=CuC7L7BYmLvUHVaxD/HjctpMLMWkLr8MiRC2gIZAL1nIigTtfCZDIIwuKznyan5vCQ
 +sbV6IbumcmA4VUgknraCM2Ke6IdJnK2tu34QKXUYjPcssJz/oFdKgQPUqJlH+oUdtsO
 12dTZQJ/qWJWi67WzXMUDfw/pNjPf2q9L2B076ngK2xMh9Du/1qhTRzqhy4dPzV/E96c
 zUuF7Bn1Sd/qJ3F9Rn6rOnjpFhK75oSvEkx8Vd61EfXBbwQUSPNHc4cN2tdsWxOKzrsy
 ljfrcYymjc7nqUm9xZSSST7Vd75EPU0FAoWSCGNsotw2fwRt4IbnBWagmH6LvZcfjLX+
 cdcw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Adjust epigraph style
Message-ID: <f084b0ef-0b12-1cfd-b057-f4f79ed3b75e@gmail.com>
Date: Sat, 26 Aug 2017 12:01:17 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a7cccce3ad3d4c93d20d7c5cb05de931f5e67733 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 26 Aug 2017 11:57:45 +0900
Subject: [PATCH] memorder: Adjust epigraph style

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index bde5a45..c571e49 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4,7 +4,7 @@
 \OriginallyPublished{Chapter}{chp:memorder:Memory Ordering}{Linux Kernel Memory Barriers}{kernel.org}{Howells2009membartxt}
 \OriginallyPublished{Chapter}{chp:memorder:Memory Ordering}{A formal kernel memory-ordering model}{Linux Weekly News}{JadeAlglave2017LWN-LKMM-1,JadeAlglave2017LWN-LKMM-2}
 %
-\epigraph{The art of progress is to preserve order amid change and to preserve change amid order.}{Alfred North Whitehead}
+\Epigraph{The art of progress is to preserve order amid change and to preserve change amid order.}{\emph{Alfred North Whitehead}}

 Causality and sequencing are deeply intuitive, and hackers often
 tend to have a much stronger grasp of these concepts than does
-- 
2.7.4

