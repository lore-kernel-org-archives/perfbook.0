Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=JpgK/Xh0eQLMHQOmCsLR6t2J3PNofwtypRH/IDn+VB8=;
 b=Dh0xhZkWvf1C78RjE57HMkDgkPtcnyJEYrZaMwK+elCcdBLuF9kGinL59rJM0woRbO
 R3O3LuTDDnnHwCGNsvpKfIkOmiVhsall9sABYVniJzFryKgArCq5tJCk6Qj2T8SjErWt
 dqrJrKfLdKk9ouh4516yvpl7p8oa599bstEfYelCHzff/TWf1qjv55BL5Nj9zKJLNo2+
 a68NqmcOsilLIwKErAOIx73GWyPF5XcBwM/X4doPEXffJucy1dXiUF0Ym46QEvUy0+G9
 lytwigM+PPwVUdq6KdBrwM/64I4VhbRUlCCEh6R89/NlBtTDZ70GuGEeDKjceud9pFhX
 JXhw==
Subject: [RFT PATCH 3/5] Add short name targets in Makefile
References: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b499d9fb-888a-843e-9d2b-194386fcc6ca@gmail.com>
Date: Tue, 3 May 2016 07:59:39 +0900
MIME-Version: 1.0
In-Reply-To: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cc911005c633213f6496ea010c69d6fec1ddb1e4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Mon, 2 May 2016 19:29:03 +0900
Subject: [RFT PATCH 3/5] Add short name targets in Makefile

This commit adds short name targets "2c", "1c", and "hb" in
Makefile.

"2c" is added for consistency.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index eaf101e..662e2c2 100644
--- a/Makefile
+++ b/Makefile
@@ -66,9 +66,15 @@ SVGSOURCES = \
 	datastruct/*.svg \
 	rt/*.svg

-.PHONY: all clean distclean touchsvg neatfreak
+.PHONY: all clean distclean touchsvg neatfreak 1c 2c hb
 all: perfbook.pdf

+2c: perfbook.pdf
+
+1c: perfbook-1c.pdf
+
+hb: perfbook-hb.pdf
+
 perfbook.pdf: perfbook.bbl
 	sh utilities/runlatex.sh perfbook

-- 
1.9.1


