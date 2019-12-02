Return-Path: <SRS0=7eUo=ZY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jv5zkmnkWZnLPQGegcNRrlRPLJ+iZ8Rd9kgZO+HfUGk=;
        b=VokxLd9eV03KBFR4A3sTb+EsKvgAGnieEIoRj8JV9ps+04d36qxO0CihyTSJHLmvaP
         fle6UhOl1CwUCXLw/O+KFdPMP1e1pO2ilPTChafTa2e2lKdMistddRq18J1TyyNsrAdF
         fw+0XmISNoTVdd1GAhwCGHqdNOOnQ9R/qNKOP/5tpExueXcw7yp+St740Jfd5gyWrjne
         NmaiObtQSwS8EvI/TPTpRT6P3Kbh2nnJPgVIaGrIZDn5eouz5e5HPMGsOSoZ4+0DG3Cr
         ENhag22t7vIvsN/Iw0ue1yP6Nj+vOHj+i51QvrY07vTnOU5NOkGQjNwVzXzGc1YdS+Vl
         l75A==
Subject: [PATCH 1/6] Makefile: Add compatibility check of Ghostscript and
 a2ping (9.50 vs 2.84p)
References: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b2b9ff46-dd45-1980-f7b6-20fa91600f38@gmail.com>
Date: Tue, 3 Dec 2019 00:15:56 +0900
MIME-Version: 1.0
In-Reply-To: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b7b414dc76b7852a77410d1812afbb79b76ca67d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 27 Nov 2019 00:38:12 +0900
Subject: [PATCH 1/6] Makefile: Add compatibility check of Ghostscript and a2ping (9.50 vs 2.84p)

Ghostscript 9.50 changed the default behavior regarding SAFER mode.
Prior to 9.50, -dNOSAFER was assumed by default.  9.50 has made
-dSAFER the default. To override this change, a2ping 2.84p now
explicitly adds the option -dNOSAFER when it invokes "gs" internally.

Add the compatibility check of a2ping and Ghostscript in Makefile
and update FAQ-BUILD.txt accordingly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt |  8 +++++---
 Makefile      | 23 ++++++++++++++++-------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index af304095..c9683f03 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -94,14 +94,16 @@
 	A.	a2ping 2.77p has become incompatible with up-to-date
 		Ghostscript on most Linux distributions since September
 		2018 due to security fixes backported from Ghostscript
-		9.22 and later. A compatible a2ping (2.83p) is available
-		at:
+		9.22 and later. a2ping 2.83p has lost compatibility with
+		Ghostscript 9.50 due to a change in default behavior.
+		A compatible a2ping (2.84p) is available at:
+
 			https://www.ctan.org/pkg/a2ping
 
 		Copy "a2ping.pl" as "a2ping" into a directory which
 		precedes /usr/bin in your PATH setting.
 
-		a2ping 2.83p is included in TeX Live 2018 or later.
+		a2ping 2.84p should be available in TeX Live 2020 or later.
 
 8.	When I try to build perfbook, it hangs after printing a line
 	reading "pdflatex 1".  How can I fix this?
diff --git a/Makefile b/Makefile
index a4069523..7f2af1b1 100644
--- a/Makefile
+++ b/Makefile
@@ -96,14 +96,23 @@ endif
 STEELFONTID := $(shell fc-list | grep -i steel | grep -c Steel)
 
 ifdef A2PING
-A2PING_277P := $(shell a2ping --help 2>&1 | grep -c "2.77p,")
-ifeq ($(A2PING_277P),1)
-A2PING_GSCNFL := 1
-else
-A2PING_GSCNFL := 0
-endif
+  GS_950_OR_LATER := $(shell gs --version | grep -c -E "9\.[5-9].?")
+  A2PING_277P := $(shell a2ping --help 2>&1 | grep -c "2.77p,")
+  A2PING_283P := $(shell a2ping --help 2>&1 | grep -c "2.83p,")
+  ifeq ($(A2PING_277P),1)
+    A2PING_GSCNFL := 1
+  else
+    ifeq ($(A2PING_283P),1)
+      ifeq ($(GS_950_OR_LATER),1)
+        A2PING_GSCNFL := 1
+      else
+        A2PING_GSCNFL := 0
+      endif
+    else
+      A2PING_GSCNFL := 0
+    endif
+  endif
 endif
-
 SOURCES_OF_SNIPPET_ALL := $(shell grep -R -l -F '\begin{snippet}' CodeSamples)
 SOURCES_OF_LITMUS      := $(shell grep -R -l -F '\begin[snippet]' CodeSamples)
 SOURCES_OF_LTMS        := $(patsubst %.litmus,%.ltms,$(SOURCES_OF_LITMUS))
-- 
2.17.1


