Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vb3K6EHBk52f8t3xhTnEUhZXEVmqk6UHDmEAry+oDIc=;
 b=eyTVfZcgjKDeMSyGWyPdRTlE4LbGTV2jns+R5JduwTyWCcK1ncs1CAXyoz7WjYM27x
 xFuwPGiywXHSzU3og2rgwjZ7qwqfctMXq+vekRbP9BMqDugBJqLR+VFifuSHCoD9P1Af
 1OdBXOqmLKgQblPca9sofOyttvu9O652LmaXIKhyha9u6don4iJWn8rO6c57mWRLsDxW
 LHwdbF22f3xePtcY2ThmjWn6Jfyuog0/D/HfDdjnEiN9B+N294Vhj3eawkPgO69tYVU9
 2YoDot33llr86sOF8LpfmdlzVSkTRTwIjDUuMuVXv7tzHHv8KUHFdrvXXDWXHy3w5rOq
 rNOQ==
Subject: [PATCH 1/9] Makefile: Add sed pattern to accommodate fontconfig
 2.13.0
References: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2906d431-ffa2-4767-858d-cf7cbe57351a@gmail.com>
Date: Sat, 12 May 2018 13:14:21 +0900
MIME-Version: 1.0
In-Reply-To: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9817247baeaab6781acda56214fc4c1d31aa676d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 May 2018 00:24:38 +0900
Subject: [PATCH 1/9] Makefile: Add sed pattern to accommodate fontconfig 2.13.0

It is observed that fontconfig 2.13.0 recognizes "Steel City Comic"
font just as "Test". Add sed patterns to convert the fontfamily
specifier in .svg files on-the-fly in such cases.

This issue is observed on Fedora 28.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index a208920..2b2ce2e 100644
--- a/Makefile
+++ b/Makefile
@@ -71,6 +71,8 @@ FIXSVGFONTS   = utilities/fixsvgfonts-urwps.sh
 FIXANEPSFONTS = utilities/fixanepsfonts-urwps.sh
 endif

+STEELFONTID := $(shell fc-list | grep -i steel | grep -c Steel)
+
 default = $(PERFBOOK_DEFAULT)

 ifeq ($(default),)
@@ -204,7 +206,11 @@ $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 ifndef INKSCAPE
 	$(error "$< --> $@: inkscape not found. Please install it.")
 endif
+ifeq ($(STEELFONTID),0)
+	@sh $(FIXSVGFONTS) < $< | sed -e 's/Steel City Comic/Test/g' > $<i
+else
 	@sh $(FIXSVGFONTS) < $< > $<i
+endif
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
 	@rm -f $<i

@@ -213,7 +219,11 @@ $(PNGTARGETS_OF_SVG): %.png: %.svg
 ifndef INKSCAPE
 	$(error "$< --> $@: inkscape not found. Please install it.")
 endif
+ifeq ($(STEELFONTID),0)
+	@sh $(FIXSVGFONTS) < $< | sed -e 's/Steel City Comic/Test/g' > $<i
+else
 	@sh $(FIXSVGFONTS) < $< > $<i
+endif
 	@inkscape --export-dpi=200 --export-png=$@ $<i > /dev/null 2>&1
 	@rm -f $<i

-- 
2.7.4


