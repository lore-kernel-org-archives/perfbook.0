Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=XE5ectZ5goWrNidB4x4rPiHRBL6M+/CZppT6dt6wKX0=;
        b=sTIYcIk6clWyYo1lfmKX45W8yWJb5WlZNPIZovS65tl/IfER/m49jKz7xt6RbxwSsv
         TiG2eIGLrCm8kZGAP+plQ+Jg5/RKLoFw+C/3hrO/xU7FS2WxV8K6O55T+tH3291nF9Dy
         RWhNphNRUFMq3PeXKi329P8gW7A4cWgVXyHTG6+ckROvv4lNT0NRf0ETg2/gRS55bX1S
         Z0Kq1PueA2qqV9zcjahrXFRHgDaFhzkHGT1QXo1W2ynx47RcJPLVChzgA/fgwPGBBelM
         twPP5OC063dG9Jl4Bx71B1QL7HjJA1kkIEINqPqOhuaR2V8/7PGgGNgdyMxtv/Qe8GO3
         Ginw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] defer: Use \slash to permit line break behind '/'
Message-ID: <c65d597e-9191-573e-af15-1fb695b5b472@gmail.com>
Date: Thu, 17 Jan 2019 07:33:14 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8d305759c347fa6d1a786adfa2b0199a136d29df Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 17 Jan 2019 07:17:18 +0900
Subject: [PATCH] defer: Use \slash to permit line break behind '/'

These captions were hyphenated in a strange way in 2c layout
as show below:

                                  ... Ad-
    d/Delete ...

By this change, they are broken behind the '/' character:

                                  ... Add/
    Delete ...

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/hazptr.tex  | 2 +-
 defer/refcnt.tex  | 2 +-
 defer/seqlock.tex | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 98ba002..fe319ea 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -188,7 +188,7 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/route_hazptr@add_del.fcv}
-\caption{Hazard-Pointer Pre-BSD Routing Table Add/Delete}
+\caption{Hazard-Pointer Pre-BSD Routing Table Add\slash Delete}
 \label{lst:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete}
 \end{listing}
 
diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index 79b5f18..f385389 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -13,7 +13,7 @@
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/route_refcnt@add_del.fcv}
-\caption{Reference-Counted Pre-BSD Routing Table Add/Delete (BUGGY!!!)}
+\caption{Reference-Counted Pre-BSD Routing Table Add\slash Delete (BUGGY!!!)}
 \label{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
 \end{listing}
 
diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index 3eabf31..abb9f37 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -270,7 +270,7 @@ increment of the sequence number on line~\lnref{inc}, then releases the lock.
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/route_seqlock@add_del.fcv}
-\caption{Sequence-Locked Pre-BSD Routing Table Add/Delete (BUGGY!!!)}
+\caption{Sequence-Locked Pre-BSD Routing Table Add\slash Delete (BUGGY!!!)}
 \label{lst:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete}
 \end{listing}
 
-- 
2.7.4

