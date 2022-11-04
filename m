Return-Path: <SRS0=+LmH=3E=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0yr7hAcaJpDTgx/KI/i8fxH9Ee+T+4hJ3UQPYWANl8=;
        b=T4UNQ5iE6fcVwgxMYs6yKUJcwhB7mDEcT/BKVJ0Jo1UQHBZRNFChIQgQrizIQCgJ6F
         UFbcgNgOr/ySNrdESL+g+H9m4KCaQ9fkMPvCIPw+qaHl8O2aSqB/r09Ho1rZ7siCoWYt
         VY6L2h4dq24tJszOJlNgKmu7HZjBMfG/8dDrt2pXhGovt+VUPzZt3xWCHi/3hC1o+6Od
         oa/+NSwJy/rPu+81JTpnGD68nDhI0V3Qi8QBN+RcrMz9TGLEov3x+Dx7mK/6ODbp0Zey
         4satw15VEWPALPnseCTTF47y5oruyr6Wa5LmJ0ufwcQ/H8vkxyjANWtq5k+xMi8yGE4l
         LuhA==
Message-ID: <73f50953-6605-bda9-e37d-589550ba7c3d@gmail.com>
Date: Fri, 4 Nov 2022 09:20:44 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] cpu: Add end-of-sentence markers
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Silence complaints from "make punctcheck".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overview.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cpu/overview.tex b/cpu/overview.tex
index feaef5f3589b..c3302669b1a5 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -298,8 +298,8 @@ Welcome to modern thermal throttling.
 
 If you reduced the number of clock cycles by making more effective
 use of the CPU's functional units, you will have increased the
-power consumed by that CPU.
-This will in turn increase the amount of heat dissipated by that CPU.
+power consumed by that CPU\@.
+This will in turn increase the amount of heat dissipated by that CPU\@.
 If this heat dissipation exceeds the cooling system's capacity, the
 system will thermally throttle that CPU, for example, by reducing
 its clock frequency, as fancifully depicted by the snow penguin in

base-commit: 06ef1f7ba437647df5913fdfc89276da4e0bf9c1
-- 
2.25.1

