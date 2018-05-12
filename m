Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lwZMOF8g5mCfK5e9/XWhIDST9kNPoBZJcMkytraKZuM=;
 b=Tzf7kgGPB2+r5kCwzld7rCiilywbbOpu8UA6xPofKKuCMPu0XY51LzJQPW+OrcgLw5
 tG8rpn9C21+24XKbVPruGklOYj077cVTeY9rfA87yici4casflxrUP5g+zzQy5MoF6v4
 OVDedwUeGDLETXjwjK0vfsof90Jiu+Dvi2EeMFSFfj9tg5rSm3a+wpUnq6OFYKYUSH6r
 45XMJOcTEVkqlkS6rO3ha5RlPXfu0dMX7BPqoGU+WzwXx29LziQ/aDJTo4Y5RktUN5Lt
 XpM+ImhADdgg65lVJhp1N/LFmW6G4E+uUVAX2hBjjqFzMyVrvTw0kSmfMw4TyP3FWIMX
 ozhA==
Subject: [PATCH 8/9] Makefile: Move check of 'Steel City Comic' font from
 runlatex.sh
References: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bc06bec7-4691-c2bf-334f-1ecd4f6f6b2c@gmail.com>
Date: Sat, 12 May 2018 13:23:48 +0900
MIME-Version: 1.0
In-Reply-To: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 66fa50f1b811d1b2abb632ac60925bb0ae1e83c5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 May 2018 00:58:41 +0900
Subject: [PATCH 8/9] Makefile: Move check of 'Steel City Comic' font from runlatex.sh

This check can be done in Makefile before invoking inkscape.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile              | 4 ++++
 utilities/runlatex.sh | 8 --------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 42296fa..6a704d2 100644
--- a/Makefile
+++ b/Makefile
@@ -58,6 +58,7 @@ FIG2EPS := $(shell which fig2eps 2>/dev/null)
 A2PING := $(shell which a2ping 2>/dev/null)
 INKSCAPE := $(shell which inkscape 2>/dev/null)
 LATEXPAND := $(shell which latexpand 2>/dev/null)
+STEELFONT := $(shell fc-list | grep -c -i steel)
 URWPS := $(shell fc-list | grep "Nimbus Mono PS" | wc -l)

 ifeq ($(URWPS),0)
@@ -220,6 +221,9 @@ endif

 $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 	@echo "$< --> $@"
+ifeq ($(STEELFONT),0)
+	$(error "Steel City Comic" font not found. See #1 in FAQ.txt)
+endif
 ifndef INKSCAPE
 	$(error $< --> $@ inkscape not found. Please install it)
 endif
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 81800db..289364d 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -129,13 +129,5 @@ echo "'$basename.pdf' is ready."
 # to avoid redundant run of bibtex and pdflatex
 touch $basename.bbl
 touch $basename.pdf
-if ! strings cartoons/r-2014-Old-man-and-Brat.pdf | grep -q -i -e "Steel City Comic" -e "Test"
-then
-	echo "#######################################################################"
-	echo "## Steel City Comic font is not found in the resulting PDF!          ##"
-	echo "## Some speech balloons in the cartoons have been rendered awkwardly.##"
-	echo "## See item 1 in FAQ.txt and FAQ-BUILD.txt to fix the font issue.    ##"
-	echo "#######################################################################"
-fi
 sh utilities/mpostcheck.sh
 exit 0
-- 
2.7.4


