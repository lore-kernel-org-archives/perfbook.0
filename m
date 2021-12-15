Return-Path: <SRS0=f53t=RA=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AX7PvTHSJGknmp2b0wn9/HKaJ65C2DXjzB6yKtqULlI=;
        b=ELYsFYY0M/LE3yx2T59xGXkhbcoc1B/nR7ncJmVBMhrMoeq97UoOH0A15ByeQa41Zr
         TdMi+YRY36bSbI6eiG8ik/8zqvZHbxJg3pc9eSl8iiFrzt9DZk/KT9WOQTKGXzJETlb2
         yA1KALmXVynaGkh28+fDzIsSNci1lVileSm8gUE3SvlMYKQ92QatsjkPUaHJHULYKHj8
         42oD0ZQI2CwCkpT1CuIr4In+y5cB1ZShBb6OP1Sfx5NJLTmf8sIFJPETw+bJOjLi89Dt
         meXUdz87f8JwQZLcG2HGlcm+Lk2c96rbVTK+4ToXoiFu8RfVpb9xsTaY04fCobwhVJUZ
         pwYA==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] glossary: remove duplicated "of"
Date: Wed, 15 Dec 2021 11:32:55 +0800
Message-Id: <20211215033255.15998-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Remove duplicated "of" from the description of keyword "Efficiency".

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul,

I think there is a duplicated "of" in the description of keyword "Efficiency", so
I remove it.

Thanks
Zhouyi
--
 glossary.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/glossary.tex b/glossary.tex
index c6266b15..7e633673 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -189,7 +189,7 @@
 	A cache with only one way, so that it may hold only one cache
 	line with a given hash value.
 \item[\IX{Efficiency}:]
-	A measure of effectiveness normally expressed as a ratio of
+	A measure of effectiveness normally expressed as a ratio 
 	of some metric actually achieved to some maximum value.
 	The maximum value might be a theoretical maximum, but in
 	parallel programming is often based on the corresponding
-- 
2.25.1

