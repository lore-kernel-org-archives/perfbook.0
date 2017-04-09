Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=ShrZsw87dvoH3q1GsmnVUE0i3ln6zrUSscvniemKJy8=;
 b=s2kYd4XCSxFkfGxHrXta1bPDW7OiUxaYNtoyiY/LvJC/NhiAOMa3fgGI7EGz96j0gG
 mEUDw7azkjBg/jUDcpzxpD838UUkx0x02O86PW2XB6CuDBh+LntJ+o9QLTeurD+mRF0p
 ej8W+9B/2fM04Iwxmcm5idUs4iB22t+2LRKzpYVPG2taAe1Eu4fbl/XTxtAUF2BsFZJn
 B9A5Wyhr+m4gDpbLJ0I4rMVi6+HvL0teBP52PTsvnCimi/EUpFSGFe0xCLYDGJXAOPNx
 +ElGBsuXSpPtjZC7RQzUzxJsHbthOyhwM8Q5Fr+AAnkVmQ7C1FrS3w3ZL8X3UTcNzbYT
 BfZA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] toolsoftrade: Typo fix and context adjustment
Message-ID: <b9d8dcca-eeec-dab7-e7c4-535187f15c1c@gmail.com>
Date: Sun, 9 Apr 2017 20:02:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 80b39e5d9acfec943c28d41077494be696d4ac60 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 9 Apr 2017 18:54:40 +0900
Subject: [PATCH] toolsoftrade: Typo fix and context adjustment

There are three primitives introduced here now: barrier(),
READ_ONCE(), and WRITE_ONCE().

Fixes: 7945ae1a06c5 ("Further editing to Tools of Trade")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index c225bee..483d287 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1247,8 +1247,8 @@ avoids optimizing away a given memory read, in which case the
 \co{READ_ONCE()} primitive may be used, as it was on line~17 of
 Figure~\ref{fig:toolsoftrade:Demonstration of Exclusive Locks}.
 Similarly, the \co{WRITE_ONCE()} primitive may be used to prevent the
-compiler from optimizing a way a given memory write.
-These last two primitives are not provided directly by gcc,
+compiler from optimizing away a given memory write.
+These last three primitives are not provided directly by gcc,
 but may be implemented straightforwardly as follows:

 \vspace{5pt}
-- 
2.7.4

