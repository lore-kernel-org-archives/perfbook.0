Return-Path: <SRS0=vYjJ=AN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682142540; x=1684734540;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/jKtEZtj5SCJL7XN7oxXpYjVmoawTIBD83L7hEke2w=;
        b=AERmtMZnqFr4FmmQq3KLzjY2uhE9ABWpoU9Hty4u4GOknZXcbVrYiTP8IAr3mUacul
         HNV8hC05Huke3Fvg60dwMm0xOdY0jzpgG6/R/nP0B4ROjki4dYs5m3UDCiCbUlyB47TK
         +xpIRNwj8mQLnkHFPMsz0AIjK/Kr2pqHTaDyK/zIrqQSyCxzQ5Si6MadcjejCsx6J50A
         3KdOBls+eN59GfGvYpkLU1aMq/IIVHUhoJPeo2JfIJ3JQEw6/9lgYMKqSPUGYggaNXIy
         0AqfxNMg30gQrCAjOexKzCDLrkBTVI7PM/GI8D6ytiTxUVpknxp+2xwXCWmRvf2qkNG+
         l/4g==
Message-ID: <23dea7ea-6dda-bfdc-c0b5-50e0e841677b@gmail.com>
Date: Sat, 22 Apr 2023 14:48:55 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] memorder: Move \FloatBarrier to section end
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This \FloatBarrier is supposed to prevent floats of Section 15.2
from appearing in Section 15.3.

Move it to the end of Section 15.2

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 8c12f319a7c2..7d6153a1a67e 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2493,8 +2493,6 @@ In short, properly constructed release-acquire chains form a peaceful
 island of intuitive bliss surrounded by a strongly counter-intuitive
 sea of more complex memory-ordering constraints.
 
-\FloatBarrier
-
 \subsection{A Counter-Intuitive Case Study}
 \label{sec:memorder:A Counter-Intuitive Case Study}
 
@@ -2724,6 +2722,8 @@ Or perhaps more accurately, destroy some counter-productive intuitions.
 % @@@ Exercises?
 % @@@ Hardware details from Appendix?
 
+\FloatBarrier
+
 \section{Compile-Time Consternation}
 \label{sec:memorder:Compile-Time Consternation}
 %

base-commit: 7ac62b96acc23e612c1bb88389bc31b04215e402
-- 
2.25.1

