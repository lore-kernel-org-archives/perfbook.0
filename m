Return-Path: <SRS0=HPzZ=GI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Js4DNmVhKOBufs//FKW4ScmW6Uh56b6okQW7ZbgqrVQ=;
        b=ejjDD43jnI4ECtj46Ie+oOPFe3mwciiYwR5WTXeSYft3V4N2UTKNN4YvFxPQgB2OyG
         i+JgWxFBES+cjY+c6SCaAQyXlG5VEW0YjIv3xpQLCMSULqOAX2kXhxJTBgO2K7HpJ+OI
         prpGqUktMjVEB+ivcsPq+4HOc96px8RP5fRWRHJtdn7p2+S3SXvpgX+MHjdYHu8bLaVt
         3Rz/KoCJqhsrVh1MsGu+7vily67mpIrAs52+xc7JHjUO+eFl7Dz1Po3lVj3z2+bvQnRH
         awUNDlgFxXODztVRN+WMHV10SKe7n5CSAhFryiZmLNuQcyHe4/88WfeNGhfLjq8mLXUD
         li0g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] bib/RCU: Salvage URL of McKenney01f
Message-ID: <742e49a4-71d4-095f-1ce8-f0523d3d9cfb@gmail.com>
Date: Tue, 5 Jan 2021 20:44:27 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6c70e72f223c2af31aa91b4e2ba69e352f67b046 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 5 Jan 2021 20:28:09 +0900
Subject: [PATCH -perfbook] bib/RCU: Salvage URL of McKenney01f

Looks like the link to http://marc.theaimsgroup.com/ does not work.
Use the archive at https://lore.kernel.org/lkml/ instead.

The mail thread is not perfect, but it allows us to see the opinions
of people nearly two decades ago.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index cf490ec4..de75eb8f 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -322,8 +322,8 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni",
  month="October",
  year="2001",
  note="Available:
-\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=100259266316456&w=2}
-[Viewed June 23, 2004]",
+\url{https://lore.kernel.org/lkml/200110090155.f991tPt22329@eng4.beaverton.ibm.com/}
+[Viewed January 05, 2021]",
 }
 
 @unpublished{Spraul01,
-- 
2.17.1

