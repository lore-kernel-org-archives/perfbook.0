Return-Path: <SRS0=AAzi=3V=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=0DeEAxBdJ1ZL2CoJVIGSQRZ606k8ErvB8thge7IFTv4=;
        b=b+A5W+z0HE6HnxyAdQgFTK8zyZ14CpFvzoP6gqEnFFIDb9EpASALDQnkN/T3kDWVvl
         Yej0vvqhKO5C3MuswMOXUXf0ZlXU8XaMqeUTJTL6tlZ/SBrvCGcbHhNVLgAwrlyeXAGB
         x7pOBohqguXH7aQHrPpnM5snZ79QPCCFnTSVimRIsR5/W9a79++p9r9VrSjWsH1KxLcL
         Ga0EQXx7uy5z2hkZjSm7dYLqvWMnhAYKrzP6n/xKQroTSLLPTnOePCjGrPmZ+A6wf1Z0
         mzPxk7QnyXQGdzp3JeGFdXqodqaVcWu4J6K0CNOAEX8xfyPRqB9TvfipkdPaAGIKOJjN
         gQxQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Makefile: Add command line for Inkscape 1.0
Message-ID: <fc83a817-5da8-2141-da08-73b55aebaaea@gmail.com>
Date: Sun, 2 Feb 2020 08:25:11 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d29a7d4775aa9e8b148f17ea66d94b5ce661a00f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 1 Feb 2020 22:19:52 +0900
Subject: [PATCH] Makefile: Add command line for Inkscape 1.0

Inkscape 1.0 (now in beta) has changed command-line options [1].
The option "--export-pdf" is no longer available in 1.0.
Add a conditional command line with the right option of
"--export-file".

Tested with inkscape-1.0-0.beta.fc31.4.x86_64.rpm on Fedora 31.

[1]: https://wiki.inkscape.org/wiki/index.php?title=Using_the_Command_Line#Deprecations_and_Replacements

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index d39ab571..c1a51bae 100644
--- a/Makefile
+++ b/Makefile
@@ -63,6 +63,9 @@ DOT := $(shell which dot 2>/dev/null)
 FIG2EPS := $(shell which fig2eps 2>/dev/null)
 A2PING := $(shell which a2ping 2>/dev/null)
 INKSCAPE := $(shell which inkscape 2>/dev/null)
+ifdef INKSCAPE
+  INKSCAPE_ONE := $(shell inkscape --version | grep -c "Inkscape 1")
+endif
 LATEXPAND := $(shell which latexpand 2>/dev/null)
 QPDF := $(shell which qpdf 2>/dev/null)
 
@@ -359,7 +362,11 @@ endif
 ifeq ($(NEEDMDSYMBOL),1)
 	$(error Font package 'mdsymbol' not found. See #9 in FAQ-BUILD.txt)
 endif
+ifeq ($(INKSCAPE_ONE),0)
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
+else
+	@inkscape --export-file=$@ $<i > /dev/null 2>&1
+endif
 	@rm -f $<i
 ifeq ($(chkpagegroup),on)
 ifndef QPDF
-- 
2.17.1

