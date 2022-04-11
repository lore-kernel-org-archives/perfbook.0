Return-Path: <SRS0=g3Xn=UV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q7687SdgtLj9hdaJNGkNOJRN3cSWZxjHhuINcX2iZKg=;
        b=AyT5J9wjxzRDGfKwv1DTP7JKdEmwp75ab3xfKx/GIsE7xJY6iVEz2jsAao5U9qSPbS
         V+5t+1rZ49acO9cpKCTNUh8as0LCjFnLJJvoQOqSkDLAnych4Qj/D5NaYlHnyr1Z3P4I
         3GdbfMci/mKNyH6vUi31QhOkTlSLuPxUh/rg4+vgXbUVE2R0+If+6Ajf9wn6IUVAQMVQ
         Iht3mkUCZ4oomavS8ZCEbX6nZlZqSSeLqiEN/llVkayfsIajeZIgqri7wfcjBxzXGcGb
         WCyJcUZ5v6GRVT+TwYvLOeCcukFO2RQxoomlgss5dxxUfQo36n57c/Fb0bmT91xB+HU6
         wI6Q==
Message-ID: <4a4d9e12-1e8e-a146-494f-eca9616831b0@gmail.com>
Date: Mon, 11 Apr 2022 16:56:50 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/7] Makefile: Let ebook-size builds graduate from
 'WIP'
Content-Language: en-US
References: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Now that ebook-size builds are mostly in good shape, let them
graduate from "WIP" by removing such markers in help texts.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ff8a6a26..fb899fa0 100644
--- a/Makefile
+++ b/Makefile
@@ -516,7 +516,7 @@ help-paper:
 	@echo "  perfbook-lt.pdf,   lt:   2c layout on letterpaper"
 	@echo "  perfbook-hb.pdf,   hb:   2c layout for hard cover book"
 	@echo "  perfbook-a4.pdf,   a4:   2c layout on a4paper"
-	@echo "  perfbook-eb.pdf,   eb:   1c layout for ebook reader (WIP)"
+	@echo "  perfbook-eb.pdf,   eb:   1c layout for ebook reader"
 
 help: help-official help-paper
 	@echo
@@ -533,7 +533,7 @@ help-prefixed:
 	@echo "Prefixed targets:"
 	@echo "  \"1c*\" such as \"1cnq\", \"1csf\", and \"1cix\" are for 1c-layout."
 	@echo "  \"ebnq\", \"ebsf\", \"ebsfnq\", \"ebix\", and \"ebdf\" are for ebook-size 1c-layout,"
-	@echo "     independent of PERFBOOK_PAPER. (WIP)"
+	@echo "     independent of PERFBOOK_PAPER."
 
 help-experimental:
 	@echo
-- 
2.25.1


