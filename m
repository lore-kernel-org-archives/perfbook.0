Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Wxe4N+RF+VCfaPuE7vA7WDCeEuBVHQX80uQpU9hDdVE=;
 b=grgEFBj0HS3KHDMZdsr/tWqpE5RzH1emQHSgiUg3tdnkkVpazz0TWBclhkeaCunT3X
 6AmDI3K41aIwcU1rputoJtQHCQrShmmbMVtSzzgTvV6u3tIy720TtyCjic+5gjxL5fOB
 WQ3Qs/93VOBt6pn8yljdnNA/vqATrr1ycPjirFUObla5tB5PlDzUiitykG9H8nARG3qg
 dhMY2+jmUQlHNvWgyCEgF4hAq2r2D06c+gQeT74fyb19ejrGokGcTujCbsFucf+F4+YX
 z7qz4UGeeoJURbLypcubxwNfwvKJQGWnJ/x7GFL5975mxZi6p98XDdLpz+17jQ6iZyza
 E+yQ==
Subject: [PATCH 1/3] Rewrite custom margins for hardcover
References: <fb8777a9-a5f2-ede7-69b6-8882f05cdb81@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2327aa67-0d5d-64fa-f8bc-3485bcd28e48@gmail.com>
Date: Wed, 5 Oct 2016 00:22:37 +0900
MIME-Version: 1.0
In-Reply-To: <fb8777a9-a5f2-ede7-69b6-8882f05cdb81@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 81a538c86b20d69ba711572d1627e4dc53ad9314 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 25 Sep 2016 08:22:58 +0900
Subject: [PATCH 1/3] Rewrite custom margins for hardcover

Instead of specifying absolute values for \topmargin and
\evensidemargin in \setlength commands, this commit uses
\addtolength commands and specifies "-0.25in" which corresponds
to the size reduction defined in the localized book.cls.
This change improves alignment of oddside and evenside pages
in double-side print.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/perfbook.tex b/perfbook.tex
index 1493d16..dd68c58 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -109,8 +109,8 @@
 }

 \IfHardCover{
-\setlength{\topmargin}{13pt}
-\setlength{\evensidemargin}{-4pt}
+\addtolength{\topmargin}{-0.25in}
+\addtolength{\evensidemargin}{-0.25in}
 }{}

 \setcounter{secnumdepth}{3}
-- 
2.7.4


