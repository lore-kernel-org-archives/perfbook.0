Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:36534 "EHLO
 mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1755482AbcECPOy (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 3
 May 2016 11:14:54 -0400
Received: by mail-pa0-f67.google.com with SMTP id i5so1985649pag.3 for
 <perfbook@vger.kernel.org>; Tue, 03 May 2016 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=fqHwMqyOSneUYyyt0ttZ/5eIx8JKkmvU1f/sfBjraeQ=;
 b=G0YVfvbIJGSrqG77rUAXvKKibCdTcoZnWfYw6ajrdTzG4PtWye8As7r3vA/v0CjFZD
 CEm+IN5Yv0XBb2lUx2v3nrYuCjruS+m6ZbbfeeQtV52uxXAwtfDJiiNxN5Dx/Zqlq4L5
 zCO5mpJXDKnKFL9UrjxtY2cwVhMqTOhLp4cbnLwEBTiQWA6VGKN1+0mfDOmtTPPethIe
 +we3wPX1an1MkEdiUr6leRAzSrYLfqGQ99bQwuum3zLf48U63T/TVncEcagKR/NQcwmR
 d8fy10Xozk4Y+Kp/bT22bVIk+UdwCr/Mh9t3k/EFv7iGrf1Wr8ZwzPslOT7B90qrMGVU
 apNQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Makefile: Denote phony targets explicitly
Message-ID: <8c5ebd01-e036-0e4e-bb73-35095ce6d6eb@gmail.com>
Date: Wed, 4 May 2016 00:14:46 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From a79124b5e603b3961242e882910e713d7ce0149a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Wed, 4 May 2016 00:00:30 +0900
Subject: [PATCH] Makefile: Denote phony targets explicitly

By this change, even if a file having the same name is created
accidentally, behavior of the Makefile won't be affected any more.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 1b508b1..7653c80 100644
--- a/Makefile
+++ b/Makefile
@@ -167,6 +167,7 @@ BIBSOURCES = \
 	bib/swtools.bib \
 	bib/syncrefs.bib

+.PHONY: all extraction embedfonts clean distclean neatfreak
 all: perfbook.pdf

 perfbook.pdf: perfbook.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
-- 
1.9.1

