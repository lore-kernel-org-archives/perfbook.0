Return-Path: <SRS0=Pd6x=RG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gMH/9aXsKaABQG4F+mox7achwNQc3V57Nl898lWzFdY=;
        b=oNGQrASn8FLDtxRFXAr6LsdAKS6pzVmvYov9x8/CcAydj08qnn/zXKMB8c08m0RTNY
         oNkfO2PlnD2kMP15GOUjPVbHo06NUHAsvLTCwxSRTHCeqX+EVPbNAlWGPWtsvjN07bxe
         GpQC79hLpZngoU+DSYuKt6g3nAqPYJ0tYQ4oIgT5zHU1jug0yLJ/juqostXK0Qqw+zs+
         C9HflPeKaq916soGxSS4UAvbI/w+O3OL9IwzwKR1MfuG+wxtpaUhwwDIWfeHx7iBDKMx
         SB2pdKq1pPT0Nthg0GRJcHmlIKPJ+hDV/8+3o2AeUDs/lLjSXp4YmC/FH8hX20R7+xXp
         13gg==
Subject: [PATCH -perfbook 2/2] defer, future: Fix typos (traversal,
 indispensable)
References: <cd109ef0-2469-7045-d582-32a425cfb1d1@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <12dc4607-37fd-5909-0244-010fc6191abb@gmail.com>
Date: Tue, 21 Dec 2021 16:12:46 +0900
MIME-Version: 1.0
In-Reply-To: <cd109ef0-2469-7045-d582-32a425cfb1d1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex         | 2 +-
 defer/rcufundamental.tex | 2 +-
 future/formalregress.tex | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index a37a6f26..ee939341 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -440,7 +440,7 @@ Pointer publish &
 	\tco{RCU_POINTER_INITIALIZER()} &
 		Compile-time constant \\
 \midrule
-Pointer subscribe (traveral) &
+Pointer subscribe (traversal) &
 	\tco{rcu_access_pointer()} &
 		Simple instructions \\
 &
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 109221fd..f4c6f2a9 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -486,7 +486,7 @@ during the full traversal (B, C, and~D), and might or might not
 encounter data items that were present for only part of the
 traversal (A and~E)\@.
 Therefore, in this particular case, it is perfectly legitimate for
-the reader traveral to encounter all five elements.
+the reader traversal to encounter all five elements.
 If this outcome is problematic, another way to resolve this situation is
 through use of stronger synchronization mechanisms, such as reader-writer
 locking, or clever use of timestamps and versioning.
diff --git a/future/formalregress.tex b/future/formalregress.tex
index d5babe82..12d3e5d8 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -714,4 +714,4 @@ Just not for regression testing.
 However, this might well change.
 After all, formal verification tools made impressive strides in the 2010s.
 If that progress continues, formal verification might well become an
-indispensible tool in the parallel programmer's validation toolbox.
+indispensable tool in the parallel programmer's validation toolbox.
-- 
2.17.1


