Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D2T50jACcBEIMofbQ2aoKURWX2mhmYKVn+/jx8LWeEM=;
 b=G0HuRd+jUvPqDeslGmeYTx0WL9dekQyvG0BC4YypI36/ECrcZJTUAtaz8zejAkwkvO
 pZycRxYIXtA4Alyo0E2l2BLw/CeVAX6e7Wo6LGMJNY5DVv7MpZePe1bPIPuFFhQ4kHVc
 NEWjNINocBP7b8UE5CjQGOdlNsK2GcrfxCneLyv6SRcGX9RtbO0DJM5ptx+Jo2Hw8X8+
 2Ezi5YeIwyEhyZVO5WJix9k2DgKJb1GsCnnndgqpAIfdUf52hthFh1RuUjsg083hYW4a
 6gtky2FLzjdeIRl4x/hgHvF52GH8SNWcnLj9yjaPfbHjyOV8yULPHbFmehecSS63ariC
 my1w==
Subject: [PATCH 6/9] Makefile: Add check of version conflict of a2ping
References: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <07154a9e-b47e-c96a-1f99-d69d14dd8f94@gmail.com>
Date: Sat, 12 May 2018 13:20:45 +0900
MIME-Version: 1.0
In-Reply-To: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f68d749640b962e128548454de229b18f195b4b9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 May 2018 00:51:18 +0900
Subject: [PATCH 6/9] Makefile: Add check of version conflict of a2ping

This conflict is likely to be encountered by new readers.
Checking it in Makefile and output reference to FAQ-BUILD.txt
should be of help.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Makefile b/Makefile
index 336da79..a4875e2 100644
--- a/Makefile
+++ b/Makefile
@@ -70,6 +70,17 @@ endif

 STEELFONTID := $(shell fc-list | grep -i steel | grep -c Steel)

+ifdef A2PING
+A2PING_277P := $(shell a2ping --help 2>&1 | grep -c "2.77p,")
+ifeq ($(A2PING_277P),1)
+GS_VER := $(shell gs --version)
+A2PING_GSCNFL := $(shell env printf "%05.2f\n%05.2f\n" $(GS_VER) 9.22 | \
+	sort | head -1 | grep -c "09.22")
+else
+A2PING_GSCNFL := 0
+endif
+endif
+
 default = $(PERFBOOK_DEFAULT)

 ifeq ($(default),)
@@ -191,6 +202,9 @@ $(PDFTARGETS_OF_EPSORIG): %.pdf: %.eps
 ifndef A2PING
 	$(error "$< --> $@: a2ping not found. Please install it.")
 endif
+ifeq ($(A2PING_GSCNFL),1)
+	$(error "a2ping conflict detected. See #7 in FAQ-BUILD.txt.")
+endif
 	@a2ping --below --hires --bboxfrom=compute-gs $<i $@ > /dev/null 2>&1
 	@rm -f $<i

@@ -199,6 +213,9 @@ $(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
 ifndef A2PING
 	$(error "$< --> $@: a2ping not found. Please install it.")
 endif
+ifeq ($(A2PING_GSCNFL),1)
+	$(error "a2ping conflict detected. See #7 in FAQ-BUILD.txt.")
+endif
 	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1

 $(PDFTARGETS_OF_SVG): %.pdf: %.svg
-- 
2.7.4


