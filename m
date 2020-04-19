Return-Path: <SRS0=96tr=6D=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=rttVY4Tw1cl0eiJVtyGNpemgTpzvG3oFgolXxuOXD8E=;
        b=sOGN8yCpSDpYSfqEOhBwfqdvSidC4xuPMaEmF+zZvwtVkTB4tFeogjfE4guCLz3Khs
         pa8R79IkUMPcMD6rL4WuPLZ0h2XqizOqs+CtYae9hHQi7XVR6LH7wk/L1fv+Lwx9Vz5B
         RTQixhcIpeFEdJT0Q5p3/IXrvhTGoOqgj8M3KSC6S4DdYOvkE6/h7S1kilSTxEMQrX43
         +i/PXdI7Wd9/0yahhbkojblO7pWB5j8007/K2n9Jgou8iIQc0W4nv/2eKuNMx5+tR41L
         wWK+TIfkSMwalPGOVxAbqXiY6B6VH9Hl9ajlrVJoaq3Qj1GICXddSH3IDOcgfqc+AAdu
         VWDg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Update output option for Inkscape 1.0
Message-ID: <f6427c58-7766-aabd-4b0c-49c71e19c3ed@gmail.com>
Date: Mon, 20 Apr 2020 00:17:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 07acec1a052399df5e38773111ab9bcf4153e826 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 19 Apr 2020 23:43:09 +0900
Subject: [PATCH] Update output option for Inkscape 1.0

Inkscape 1.0-rc1 now undergoing public test has renamed the option
"--export-file=" to "--export-filename=".

This change is not reflected in the wiki page at [1] yet.

"inkscape --help" says that the short option "-o output_file" is
common to beta and rc1 versions. So this commit uses the short option
instead.  Also redirect pango version emitted to stderr by
rc1's "inkscape --version".

[1]: https://wiki.inkscape.org/wiki/index.php?title=Using_the_Command_Line#Deprecations_and_Replacements

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e24c5729..5fb252eb 100644
--- a/Makefile
+++ b/Makefile
@@ -69,7 +69,7 @@ FIG2EPS := $(shell which fig2eps 2>/dev/null)
 A2PING := $(shell which a2ping 2>/dev/null)
 INKSCAPE := $(shell which inkscape 2>/dev/null)
 ifdef INKSCAPE
-  INKSCAPE_ONE := $(shell inkscape --version | grep -c "Inkscape 1")
+  INKSCAPE_ONE := $(shell inkscape --version 2>/dev/null | grep -c "Inkscape 1")
 endif
 LATEXPAND := $(shell which latexpand 2>/dev/null)
 QPDF := $(shell which qpdf 2>/dev/null)
@@ -402,7 +402,7 @@ endif
 ifeq ($(INKSCAPE_ONE),0)
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
 else
-	@inkscape --export-file=$@ $<i > /dev/null 2>&1
+	@inkscape -o $@ $<i > /dev/null 2>&1
 endif
 	@rm -f $<i
 ifeq ($(chkpagegroup),on)
-- 
2.17.1

