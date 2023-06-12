Return-Path: <SRS0=nTFx=CA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686562923; x=1689154923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Idm2IJi5F3crsduUsUXK/u9aklWCIV4dwEAO+8d/Dys=;
        b=VFfJGJfF1AYGpnSKJFQBMmfgX2fXFEPNuSUls09MrIAiMlf14TuTajdj/VAn3Iii19
         14H2/eOa0/3UMAZno+f/rk95oUfCaXj/lY7xoNkLAGJhKY9qFGLmRLeovu7tWhHL/ZqO
         TCTkXtcCYQK8enN2dppOIzJRGsA0uhMHmR2akYWXE2xI1gULqVHliGSmxkl7Rz98bHl+
         2m3Mh/OESLZyvcNulhbIJc2S44PcBnq6i2qu5YGdWWBIpU3e/uo6oeFe6LDSIrVOrs32
         W/Rx84cQSZKLvj95lLDFbw0zVboGWGOIVGVLl2CK2UJZyY5SnLJaDt51HFWar26xNiso
         nrcw==
Message-ID: <882ffa53-f280-da10-abf7-cf50618ccce7@gmail.com>
Date: Mon, 12 Jun 2023 18:41:59 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/2] fixsvgfonts.sh: Convert sans-serif into 'DejaVu
 Sans'
Content-Language: en-US
References: <4ab19efc-4940-c1f9-71cf-221cb048e86e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <4ab19efc-4940-c1f9-71cf-221cb048e86e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Depending on fontconfig setting of a build system, it chooses
one of available sans-serif font families for generic font in
SVG files while SVG --> PDF conversion by Inkscape.

utilities/fixsvgfonts{-urwps}.sh scripts explicitly converted it
into "Nimbus Sans", which is a clone of Helvetica.

"DejaVu Sans", which originated from "Bitstream Vera", is slightly
wider than Helvetica and it is the fallback of Paul's setting.

Update fixsvgfonts{-urwps}.sh so that the explicit conversion meets
Paul's expectation.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This change assumes "fc-match sans-serif" returns "DejaVu Sans"
under your setting.  The slight width mismatch causes texts you
centered inside boxes to be left shifted slightly.

If you don't see "DejaVu Sans" from the command above, what does
it say?

        Thanks, Akira
--
 utilities/fixsvgfonts-urwps.sh | 2 +-
 utilities/fixsvgfonts.sh       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/utilities/fixsvgfonts-urwps.sh b/utilities/fixsvgfonts-urwps.sh
index 21eb15349063..5af10514a4d8 100644
--- a/utilities/fixsvgfonts-urwps.sh
+++ b/utilities/fixsvgfonts-urwps.sh
@@ -8,7 +8,7 @@
 sed	-e 's+:Helvetica+:Nimbus Sans+g' \
 	-e 's+="Helvetica+="Nimbus Sans+g' \
 	-e 's+:Sans+:Nimbus Sans+g' \
-	-e 's+:sans-serif+:Nimbus Sans+g' \
+	-e 's+:sans-serif+:DejaVu Sans+g' \
 	-e 's+:Courier+:Nimbus Mono PS+g' \
 	-e 's+="Courier+="Nimbus Mono PS+g' \
 	-e 's+:monospace+:DejaVu Sans Mono+g' \
diff --git a/utilities/fixsvgfonts.sh b/utilities/fixsvgfonts.sh
index 1fa4fedb2829..d75becdeef81 100644
--- a/utilities/fixsvgfonts.sh
+++ b/utilities/fixsvgfonts.sh
@@ -8,7 +8,7 @@
 sed	-e 's+:Helvetica+:Nimbus Sans L+g' \
 	-e 's+="Helvetica+="Nimbus Sans L+g' \
 	-e 's+:Sans+:Nimbus Sans L+g' \
-	-e 's+:sans-serif+:Nimbus Sans L+g' \
+	-e 's+:sans-serif+:DejaVu Sans+g' \
 	-e 's+:Courier+:Nimbus Mono L+g' \
 	-e 's+="Courier+="Nimbus Mono L+g' \
 	-e 's+:monospace+:DejaVu Sans Mono+g' \
-- 
2.25.1


