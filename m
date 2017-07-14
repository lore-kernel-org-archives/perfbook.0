Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=SBPLxtFYZ3ZdYGyXepeUwtSsjg8x9fxyLowYi3A6lkw=;
 b=Jj/CDY85LAkKTZTac7KqDMjRIFlO8k3OznwO/58NTKHDA+r+pHPbmdd7q+g4EVLRXX
 qqhHnxxCF4rKJW8mocuTuEgscGgdDhnce8tuWNyXp3xVg3nnlBBtwIiPSP7PK8E7OFGS
 TWB0sLvIC5HZsxe9DaZZUnem8ZXNqxyt0rwW/sstykcrmvUzTInjRahfuFnFJj1i+wcy
 FKGBZ+EKKv7bexF7FKcdJ/oX8ww0F2dWWmI9hgRP24ssO1wiDz3f6OaoUQqofwVPX7zD
 0GbEbKQxZaRszLYzTpd1okJQ1LJ9EY4hRujPGVArf12qOZnku19Ur0Nbp80Et9HbQ/bv
 K4fg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Fix control-dependency no-transitivity example
Message-ID: <165340ca-3acd-a8be-43ad-ccf64582aa21@gmail.com>
Date: Fri, 14 Jul 2017 23:34:45 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8740c546fbb6988c2fcf4a88c4314df972d0b9b7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 14 Jul 2017 22:48:37 +0900
Subject: [PATCH] advsync: Fix control-dependency no-transitivity example

The corresponding assert condition in memory-barriers.txt was
fixed in commit 5646f7acc95f ("memory-barriers: Fix control-
ordering no-transitivity example") of Linux kernel repository.
Somehow it was imported to perfbook in a wrong form and has
survived since.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index c9c975c..25a90b2 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -3036,9 +3036,9 @@ not), then adding the following CPU would guarantee a related assertion:
 \begin{tabular}{l}
 	\nf{CPU 2} \\
 	\hline
-	\tco{WRITE_ONCE(y, 1);} \\
+	\tco{WRITE_ONCE(x, 2);} \\
 	\multicolumn{1}{l}{~} \\
-	\multicolumn{1}{l}{\tco{assert(!(r1 == 1 && r2 == 1 && x == 1));}} \\
+	\multicolumn{1}{l}{\tco{assert(!(r1 == 2 && r2 == 1 && x == 2));}} \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
-- 
2.7.4

