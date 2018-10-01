Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ypcbDyGr1evgYGLZEU89fkl3UFYW+IzCbd48Dl/zpdY=;
        b=qQl040lvNgMH3hYizwNIsfEwkkIVScZdLjb8ltxh9T1e1HkIvfqlr1AmQ/0uuHYrqy
         hnF5kVBhElRyDxXsIXJ8emwM7GL9sDKwKXEYXndjFW5WSxEHUtSsbr+j4sbx/hYjckje
         1fKjftU8khLIik3ncsd7FyKcS8JJGf70DjjgOFswXpvtNvde/pZJMVgDY8zI64NU7zJe
         WLTExWlZrvk1M9ZhrcCVfKZPzjAOE/gKstToPMslM36h4QTOp+bGwQYTU8MS6DSbAegK
         Hw6yMmV7RkjM5wLmy9N9LASBqYSbVsX9QxAR4YPjcTMK0qptyFoeRvdYh4/l6DgEdLF3
         clTw==
Subject: [PATCH 1/5] CodeSamples: Exclude meta command lines in building api.h
References: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3dea9a9d-b68f-76e2-db24-5abc807ea500@gmail.com>
Date: Mon, 1 Oct 2018 22:50:27 +0900
MIME-Version: 1.0
In-Reply-To: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 242c3993ecce7faf3e4f9bdc586e9553f16c77ac Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 29 Sep 2018 20:01:46 +0900
Subject: [PATCH 1/5] CodeSamples: Exclude meta command lines in building api.h

api.h is built by concatenating several header files including
api-pthreads.h, which has meta commands for the new code snippet
scheme.

This commit adds "sed" scripts to prevent those meta commands
to appear in api.h.

The added pattern "begin{snippet}" in CodeSamples/Makefile
revealed a few issues in gen_snippet_d.pl and top level
Makefile.

Regex handling in gen_snippet_d.pl didn't work as I intended.
The pattern matched "begin{snippet}" (without leading "\").
Fix it by tweaking the patterns and properly using single quotes
around them.

In Makefile, $(shell ...) function uses /bin/sh by default.
By setting a variable "SHELL" in the Makefile, we can override
the default. On Ubuntu, "bash" and "dash" behaves slightly
different in the way the argument '\begin{snippet}' is passed
to grep.  For compatibility, we set /bin/bash to SHELL.

Also fix typo in the assignment to SOURCES_OF_LTMS. The typo
caused redundant runs of commands after a build is complete.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/Makefile       |  4 +++-
 Makefile                   |  4 +++-
 utilities/gen_snippet_d.pl | 16 ++++++++--------
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
index 6b2c3c9..036fc66 100644
--- a/CodeSamples/Makefile
+++ b/CodeSamples/Makefile
@@ -33,7 +33,9 @@ ifneq ($(strip $(target)),)
 	cat arch-$(target)/arch-$(target).h >> api.h
 	echo "" >> api.h
 endif
-	cat api-pthreads/api-pthreads.h >> api.h
+	cat api-pthreads/api-pthreads.h | \
+		sed '/begin{snippet}/d' | \
+		sed '/end{snippet}/d' >> api.h
 	echo "" >> api.h
 	cat api-pthreads/api-gcc.h >> api.h
 	echo "" >> api.h
diff --git a/Makefile b/Makefile
index 4810812..10d120d 100644
--- a/Makefile
+++ b/Makefile
@@ -1,3 +1,5 @@
+SHELL = /bin/bash
+
 LATEXSOURCES = \
 	perfbook.tex \
 	legal.tex \
@@ -83,7 +85,7 @@ endif
 
 SOURCES_OF_SNIPPET_ALL := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
 SOURCES_OF_LITMUS      := $(shell grep -r -l -F '\begin[snippet]' CodeSamples)
-SOURCES_OF_LTMS        := $(patsubst %.litmus,&.ltms,$(SOURCES_OF_LITMUS))
+SOURCES_OF_LTMS        := $(patsubst %.litmus,%.ltms,$(SOURCES_OF_LITMUS))
 SOURCES_OF_SNIPPET     := $(filter-out $(SOURCES_OF_LTMS),$(SOURCES_OF_SNIPPET_ALL)) $(SOURCES_OF_LITMUS)
 GEN_SNIPPET_D  = utilities/gen_snippet_d.pl utilities/gen_snippet_d.sh
 
diff --git a/utilities/gen_snippet_d.pl b/utilities/gen_snippet_d.pl
index d8e3bc7..8ba31b5 100755
--- a/utilities/gen_snippet_d.pl
+++ b/utilities/gen_snippet_d.pl
@@ -18,10 +18,10 @@ my $snippet_key;
 my $snippet_key_ltms;
 my $source;
 
-$snippet_key = '\\begin\{snippet\}' ;
-$snippet_key_ltms = '\\begin\[snippet\]' ;
-@fcvsources = `grep -l -r -F $snippet_key CodeSamples` ;
-@fcvsources_ltms = `grep -l -r -F $snippet_key_ltms CodeSamples` ;
+$snippet_key = '\begin{snippet}' ;
+$snippet_key_ltms = '\begin[snippet]' ;
+@fcvsources = `grep -l -r -F '$snippet_key' CodeSamples` ;
+@fcvsources_ltms = `grep -l -r -F '$snippet_key_ltms' CodeSamples` ;
 chomp @fcvsources ;
 chomp @fcvsources_ltms ;
 
@@ -35,7 +35,7 @@ foreach $source (@fcvsources) {
     if ($source =~ /\.ltms$/) {
 	next;
     }
-    @snippet_commands1 = `grep -F $snippet_key $source` ;
+    @snippet_commands1 = `grep -F '$snippet_key' $source` ;
     chomp @snippet_commands1 ;
     $source =~ m!(.*/[^/]+)/[^/]+! ;
     $subdir = $1 ;
@@ -51,7 +51,7 @@ foreach $source (@fcvsources_ltms) {
     my @snippet_commands1 ;
     my $subdir ;
     my $snippet ;
-    @snippet_commands1 = `grep -F $snippet_key_ltms $source` ;
+    @snippet_commands1 = `grep -F '$snippet_key_ltms' $source` ;
     chomp @snippet_commands1 ;
     $source =~ m!(.*/[^/]+)/[^/]+! ;
     $subdir = $1 ;
@@ -80,7 +80,7 @@ foreach $source (@fcvsources) {
     if ($source =~ /\.ltms$/) {
 	next;
     }
-    @snippet_commands2 = `grep -F $snippet_key $source` ;
+    @snippet_commands2 = `grep -F '$snippet_key' $source` ;
     chomp @snippet_commands2 ;
     $src_under_sub = $source ;
     $source =~ m!(.*/[^/]+)/[^/]+! ;
@@ -101,7 +101,7 @@ foreach $source (@fcvsources_ltms) {
     my $src_under_sub ;
     my $subdir ;
     my $snippet ;
-    @snippet_commands2 = `grep -F $snippet_key_ltms $source` ;
+    @snippet_commands2 = `grep -F '$snippet_key_ltms' $source` ;
     chomp @snippet_commands2 ;
     $src_under_sub = $source ;
     $source =~ m!(.*/[^/]+)/[^/]+! ;
-- 
2.7.4


