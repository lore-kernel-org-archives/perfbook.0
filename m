Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=hCrS+GUJ/GQIexImKbSiGwoYbsFgy+JQCAC3Ktt38qY=;
 b=YviFnBS9xt4UvrdE0MVVhljByOmvbQ6TR0iEbcq7FDKLcKmIEj0s7XmRjGTVUqPoBK
 h/h/e8E0ThFrySE3sycci6USqiLWoaECn5K0dFAoYo7BhY0tEvajpdubCXjiAYyTVSAi
 rb/89jAYtUNK0IIITxVPHb/cRq9aIrA6BdZH6HqLR3H+AX0KiQ8Dmdd+18NPWQlPJcQH
 3q9pUo65gVIjhRy4r/vY6Xz4ucNAnYCeEzof7elT4r+19u8pvKkV++Eu+yjRqP4XinQy
 Gp549J4LMpYl3hIrjZJRFM5v8vMYELzXh/p1e/RpxEhNA1SUXZvkWhglG1Y4UwGG+mEt
 Fklg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync/memorybarriers: Followup fix of quotation marks
Message-ID: <e39454aa-08ff-3800-f290-06aad8b662ee@gmail.com>
Date: Fri, 23 Dec 2016 20:35:24 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7ad42793dc172ad9d416062f54ea0f68872a52b8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 23 Dec 2016 20:26:19 +0900
Subject: [PATCH] advsync/memorybarriers: Followup fix of quotation marks

This commit fixes remaining literal double quotation marks.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index e35e04c..4ecee71 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2136,7 +2136,7 @@ The following list of rules summarizes the lessons of this section:
 	either by preceding both of them with \co{smp_mb()} or by using
 	\co{smp_store_release()} to carry out the stores.
 	Please note that it is \emph{not} sufficient to use \co{barrier()}
-	at beginning of each leg of the "if" statement because, as shown
+	at beginning of each leg of the ``\co{if}'' statement because, as shown
 	by the example above, optimizing compilers can destroy the control
 	dependency while respecting the letter of the \co{barrier()} law.

-- 
2.7.4

