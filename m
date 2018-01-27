Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DQyTIrH4II4dvzcqBF+5mKCO63E5znHwaTjLsni3YJs=;
 b=LshiLQ9hb+Q6JJjlvwY/sUKr3D1fm1XHLiUkz8iwqJsBViESfIYExFX847KfEK4mmu
 EQAsOrmRrMsvuZit68TPgGZR6YVvr1Df4KSGK37QgGOhFxd7coNtOkP3rAGMwFFMkh6s
 4V8l5p74Cyj9i9E4OMikEfSncyaNLGX+Iu0Dqz6ZvvZhDID6FPHFyB1tv/r1cPnCJWuu
 4bHV7tv8w8/u0k2T4+/0iRnDRXoDYG2x6e8n9dLr2GNWL/c6csipFNL/G5YNmK3kOqAM
 kfTKb653pdqSm3mliS9JUsv6ETNOAJ621l7wmUgWvEyltiS9h3FfUazwVwPr+Qx+rB2k
 Ce8g==
Subject: [PATCH 2/4] Fix pattern order in fixfonts.sh
References: <46894f44-5b60-886f-2321-67c1b9b51c97@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9018de50-1b54-74c6-522d-5e3fee3e60e2@gmail.com>
Date: Sat, 27 Jan 2018 18:57:05 +0900
MIME-Version: 1.0
In-Reply-To: <46894f44-5b60-886f-2321-67c1b9b51c97@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f66a34666ba8ebe75e17cbcca67afc3d4b80d093 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 27 Jan 2018 12:47:49 +0900
Subject: [PATCH 2/4] Fix pattern order in fixfonts.sh

Longer matching patters should come first.
Also add several patterns for Helvetica Narrow fonts.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/fixfonts.sh | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/utilities/fixfonts.sh b/utilities/fixfonts.sh
index f348dc9..646c68b 100644
--- a/utilities/fixfonts.sh
+++ b/utilities/fixfonts.sh
@@ -16,17 +16,33 @@
 # http://www.gnu.org/licenses/gpl-2.0.html.
 #
 # Copyright (c) 2011 Paul E. McKenney, IBM Corporation.
+# Copyright (c) 2018 Akira Yokosawa

-sed	-e 's+Times-Roman+NimbusSanL-Regu+g' \
+sed	-e 's+Times-Roman-BoldItalic+NimbusSanL-BoldItal+g' \
+	-e 's+Times-Roman-Italic+NimbusSanL-ReguItal+g' \
+	-e 's+Times-Roman-Bold+NimbusSanL-Bold+g' \
+	-e 's+Times-Roman+NimbusSanL-Regu+g' \
 	-e 's+Times+NimbusSanL-Regu+g' \
 	-e 's+Helvetica-BoldOblique+NimbusSanL-BoldItal+g' \
 	-e 's+Helvetica-Oblique+NimbusSanL-ReguItal+g' \
-	-e 's+Helvetica-Bold+NimbusSanL-Bold+g' \
 	-e 's+Helvetica-Bold-iso+NimbusSanL-Bold+g' \
-	-e 's+Helvetica+NimbusSanL-Regu+g' \
+	-e 's+Helvetica-Bold+NimbusSanL-Bold+g' \
+	-e 's+Helvetica-Narrow-BoldOblique-iso+NimbusSanL-BoldCondItal+g' \
+	-e 's+Helvetica-Narrow-BoldOblique+NimbusSanL-BoldCondItal+g' \
+	-e 's+Helvetica-Narrow-Oblique-iso+NimbusSanL-ReguCondItal+g' \
+	-e 's+Helvetica-Narrow-Oblique+NimbusSanL-ReguCondItal+g' \
+	-e 's+Helvetica-Narrow-Bold-iso+NimbusSanL-BoldCond+g' \
+	-e 's+Helvetica-Narrow-Bold+NimbusSanL-BoldCond+g' \
+	-e 's+Helvetica-Narrow-iso+NimbusSanL-ReguCond+g' \
+	-e 's+Helvetica-Narrow+NimbusSanL-ReguCond+g' \
 	-e 's+Helvetica-iso+NimbusSanL-Regu+g' \
+	-e 's+Helvetica+NimbusSanL-Regu+g' \
 	-e 's+Symbol+StandardSymL+g' \
-	-e 's+Courier+NimbusMonL-Regu+g' \
-	-e 's+Courier-Bold+NimbusMonL-Bold+g' \
+	-e 's+Courier-BoldOblique+NimbusMonL-BoldObli+g' \
 	-e 's+Courier-Oblique+NimbusMonL-ReguObli+g' \
-	-e 's+Courier-BoldOblique+NimbusMonL-BoldObli+g'
+	-e 's+Courier-Bold+NimbusMonL-Bold+g' \
+	-e 's+Courier+NimbusMonL-Regu+g' \
+	-e 's+NimbusSanL-Regu-Italic+NimbusSanL-ReguItal+g' \
+	-e 's+NimbusSanL-Regu-BoldItalic+NimbusSanL-BoldItal+g' \
+	-e 's+NimbusSanL-Regu-Bold+NimbusSanL-Bold+g' \
+	-e 's+StardardSymL-+Symbol-+g'
-- 
2.7.4


