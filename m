Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U59Ee080FnV6u5Glbw86CzVWBa4dEIVoXKqzLVeSA3c=;
 b=fDK1FMCoHuTEMkDn4csB7dsQrZmjC0NaJxc7cCfG0h4AaYF5A9wGHdAbfqKo51yWM0
 ow0lauo4l6moFkWdiWzwi2GGMLbEwJ8nB5/9GKqcMw9z3RdI0oW6ndg8S1EvjFNY7Xh1
 r83wsW1XTg/EwjEMeflV1mzeXhDXloYOrbvw6mOj+SHL8RCqCBVULAPLqAmIaNKH1hZI
 ESJotnVT6OYuXH+2AKKQ+1t0w1pRLbH8vmsM3XjgV6d9xlNWjaty6+myi+D8w80mzAl8
 PCz288x6+hRfYThNcR8QTfMuESFzWBqNmXG0XAl0TsyXJ6DdwUkhz2n7oB8gJiUiFxZ9
 VeiQ==
Subject: [PATCH 4/9] Makefile: Add 'latexpand' existence check
References: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <97f75bdd-46e1-98af-10fb-5f7e1c158038@gmail.com>
Date: Sat, 12 May 2018 13:18:04 +0900
MIME-Version: 1.0
In-Reply-To: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2888aa1bc01c4d87150c7f8cf5dcc9eb7ab47ac4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 May 2018 00:48:35 +0900
Subject: [PATCH 4/9] Makefile: Add 'latexpand' existence check

On distributions like Fedora, where texlive packages are
finely fragmented, 'latexpand' can be missing.

Also remove blank lines in this part of Makefile.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 2b2ce2e..336da79 100644
--- a/Makefile
+++ b/Makefile
@@ -54,13 +54,10 @@ PNGTARGETS_OF_SVG := $(SVG_LARGE_BITMAP:%.svg=%.png)
 TARGETS_OF_SVG :=  $(PDFTARGETS_OF_SVG) $(PNGTARGETS_OF_SVG)

 DOT := $(shell which dot 2>/dev/null)
-
 FIG2EPS := $(shell which fig2eps 2>/dev/null)
-
 A2PING := $(shell which a2ping 2>/dev/null)
-
 INKSCAPE := $(shell which inkscape 2>/dev/null)
-
+LATEXPAND := $(shell which latexpand 2>/dev/null)
 URWPS := $(shell fc-list | grep "Nimbus Mono PS" | wc -l)

 ifeq ($(URWPS),0)
@@ -107,6 +104,9 @@ autodate.tex: perfbook.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOUR
 	sh utilities/autodate.sh >autodate.tex

 perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(TARGETS_OF_SVG)
+ifndef LATEXPAND
+	$(error "--> $@: latexpand not found. Please install it.")
+endif
 	echo > qqz.tex
 	echo > contrib.tex
 	echo > origpub.tex
-- 
2.7.4


