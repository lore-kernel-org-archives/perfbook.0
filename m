Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hdDZylPAFDAPUL3f7mfWqjo5VWHiDVdRGqBal+JiI0c=;
 b=YEaDaOS0iTWxqjrxpoCgmYHW6bmUWeY/kHMGO6H3M//7KjwDv3xCfGW1RkNCxPA4CM
 Mtm8H/3dN0GeKJF9JKcA4KNth4hp+7iPHhrEwTCSpdSKCsAm4u6hzGuAgWEfIZMIkJYn
 dp9ehXDq7ew0Kh4SYES7L8uOuToFu17yGWRUikdzHiRu+MbWGLw8o6A54myInjFPGq7H
 q8T2dL+EOGc+MxTbpAWALkPQX2tX6FOM4rWAMqjcMrJf/hV3btthKfsk5JFBzypBtI1f
 wH27o1kmCQQGuGrdzSw7ZeJ36/uB0HqxQVoWvYo4psdCIzRDc71dA/Ia3hu/PMZw7wjr
 JZ5w==
Subject: [PATCH 2/9] fixsvgfonts: Fix typo
References: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <14792ea1-105d-6065-a386-1afcc632bd34@gmail.com>
Date: Sat, 12 May 2018 13:15:23 +0900
MIME-Version: 1.0
In-Reply-To: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ef1811c7c57cd685222732c5cb53d4f579e56a81 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 May 2018 00:36:59 +0900
Subject: [PATCH 2/9] fixsvgfonts: Fix typo

There was a typo in sed pattern as well as in header comment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/fixsvgfonts-urwps.sh | 4 ++--
 utilities/fixsvgfonts.sh       | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/utilities/fixsvgfonts-urwps.sh b/utilities/fixsvgfonts-urwps.sh
index ac55b4a..a917fea 100644
--- a/utilities/fixsvgfonts-urwps.sh
+++ b/utilities/fixsvgfonts-urwps.sh
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # fixsvgfonts-urwps.sh: Convert an .svg file to use embeddable fonts,
-#       taking from standard input and putting on standar output.
+#       taking from standard input and putting on standard output.
 #
 # Copyright (c) 2018 Akira Yokosawa

@@ -20,4 +20,4 @@ sed	-e 's+family:Helvetica+family:Nimbus Sans+g' \
 	-e 's+family="Nimbus Mono L+family="Nimbus Mono PS+g' \
 	-e 's+cation:Nimbus Mono L+cation:Nimbus Mono PS+g' \
 	-e 's+family:Standard Symbols L+family:Standard Symbols PS+g' \
-	-e 's+cation:Standard Symbosl L+cation:Standard Symbols PS+g'
+	-e 's+cation:Standard Symbols L+cation:Standard Symbols PS+g'
diff --git a/utilities/fixsvgfonts.sh b/utilities/fixsvgfonts.sh
index 812cbc2..287d3e2 100644
--- a/utilities/fixsvgfonts.sh
+++ b/utilities/fixsvgfonts.sh
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # fixsvgfonts.sh: Convert an .svg file to use embeddable fonts, taking from
-#	standard input and putting on standar output.
+#	standard input and putting on standard output.
 #
 # Copyright (c) 2018 Akira Yokosawa

-- 
2.7.4


