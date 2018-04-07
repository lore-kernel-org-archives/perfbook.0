Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=fpSHRUoMnTLZK5JbjUnaR7yesdSbhH5rAyu+FErRTDo=;
 b=Dm8jCC9WCPwR2hd0oaS3hffTsPGzwFNobRbilGnPzHHDaiDy0CpquutowLKRnF9zq/
 ZwyYsJTfKRkVRjchgmnwpCmdUDj+0Xpo68Xf60pAQuKW4JJiP2Cm5Md6IrCOEGZFYlj2
 g+3VXwdz80ENwippMyz8MSHSLVeO9WGO0cojIrVbCaH2f9rMI94ZPWUR7hYEnX3Od44e
 QxwwrnSU1vUuiIHw0QAp1J5UdweTFP/hvluCTElXrUFgduq56esft1AdpafE0X510Jsa
 IVO6O7r8FU3P36bfmi+zlFD2KUUGj7JnoUMyFtiW/9oPYOBf2oR3Csd+PD8g+Dywz8Ei
 lbuw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] future/formalregress: Fix staccato of 'been'
Message-ID: <b1a921af-ee58-8dfd-cda2-0523b89c66b0@gmail.com>
Date: Sun, 8 Apr 2018 00:23:05 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b4f82853b7425a54e5ac898b91660fff66e4190b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 7 Apr 2018 23:14:24 +0900
Subject: [PATCH] future/formalregress: Fix staccato of 'been'

Also remove redundant "v" in "v4.17".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

If you prefer "v4.17", "version" can be removed instead.

        Thanks, Akira
--
 future/formalregress.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/formalregress.tex b/future/formalregress.tex
index dd37ec8..8402da1 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -116,7 +116,7 @@ In contrast, one of the great strengths of PPCMEM and \co{herd}
 is their detailed modeling of various CPU families memory models,
 including x86, ARM, Power, and, in the case of \co{herd},
 even a Linux-kernel memory model~\cite{Alglave:2018:FSC:3173162.3177156},
-which has been been accepted into version v4.17 of
+which has been accepted into version 4.17 of
 the Linux kernel.

 The \co{cbmc} and Nidhugg tools provide some ability to select
-- 
2.7.4

