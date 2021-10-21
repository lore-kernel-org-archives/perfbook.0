Return-Path: <SRS0=M/4v=PJ=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Q3cI7/ABzUNVOXVAspuGHxS/mzrd6Bm+/wpHlAyAnM=;
        b=fdqgk9drglgQWR/vlOZzlYn2r10K+JtKxaL0/RodD9m4Pg41AUjxDRfrZNA3d6UmW0
         QlOfjwF9U5BINbzPTdk/iyfK8sJ+XglYr39iGQsKexPYOb9ASKHT21V2NcYCWTga/JDT
         0mwHqzBN+PuWaASQFRatTVilelATJOL+DGvh0yChod9SnkzEISvzhVCg+9xF0BynK16J
         ROBTMcwysrMDrDA881/VhvwIZnCJUh8moW6MZeUitY9A87qFV7FoUTpJs5PkMNx15j/m
         PhRrcOQe0ECWhYDWF4chMQl37bg55IgwtStYiZyGnSPwexf3I64ZAQcUh0gBmCD3o+5V
         J6iQ==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] memorder: fix a typo in answer to QQ 15.33
Date: Thu, 21 Oct 2021 15:32:51 +0800
Message-Id: <20211021073251.8821-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In answer to Quick Quiz 15.33, update() here should be updater().

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul,

In answer to Quick Quiz 15.33, update() here should be updater().
By the way, I tried to follow Akira's patch as an example to make a
good looking patch ;-)

   Thanks Zhouyi
--
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index debfbcc3..eae93f9e 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2830,7 +2830,7 @@ instead of the expected value 144.
 	not order later loads, only later stores.
 	If you really need ordering, you could place an \co{smp_rmb()}
 	between \clnref{equ,pc}.
-	Or better yet, have \co{update()}
+	Or better yet, have \co{updater()}
 	allocate two structures instead of reusing the structure.
 	For more information, see
 	\cref{sec:memorder:Control-Dependency Calamities}.
-- 
2.25.1

