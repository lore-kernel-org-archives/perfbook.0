Return-Path: <SRS0=XWF6=3W=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lW2LL6XA7DY8JXB2vUjV803t7aJgmWw9y8Ex5xask8k=;
        b=AcwBcQwp4ruciS2CcqRjZDa1FoK7Ogl9TmkiZH2wmd26loIHeZU4MdktZ3rqBL7MCn
         osRX31SRtNIRKHHNY+NfblnT/J2C7OqjdZjKTh4z1sKsz5Z5VJ3Fx929UK3JAWf2e936
         9czOjkGjVOaPFc2IM/soIhYS+17uVeJtWp84TLCaxF3nN5ft9nD3HrzmMZG4athk3zW5
         2VYaEOFTAGntS3e/XfzZqHnbIxWcYr1wUxP0hVQBa/LTUd2a/TKHZutttbSzy+T0jr1h
         5YT1YMc41PbFx5PoeRLC3iCfVF6Co+pTcYInj4B8IFTGgDRQbWXV5YIP2089UqUvXh40
         C/Zg==
Subject: [PATCH 2/2] Makefile: grep only .tex files in 'linelabel' and
 'lineref' search
References: <21d9e8af-cbf7-3d35-63a7-b9f195bd1a4f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <63c57945-17b3-753f-5714-eb3d207c5e8b@gmail.com>
Date: Sun, 2 Feb 2020 20:40:37 +0900
MIME-Version: 1.0
In-Reply-To: <21d9e8af-cbf7-3d35-63a7-b9f195bd1a4f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 41e44e4c0027784644cf740e8d8dcafe3afc9e14 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 2 Feb 2020 20:23:58 +0900
Subject: [PATCH 2/2] Makefile: grep only .tex files in 'linelabel' and 'lineref' search

For the checks added in commit 60c2079f2765 ("Makefile: Check
'linelabel' and 'lineref' used as environment"), it should be
sufficient to grep files listed in $(LATEXSOURCES) only.

Using this variable rather than the grep option "-R" will reduce
the cost of the checks.  We can also get rid of "patsubst" and
"filter-out" functions in the variable definitions.

Also reorder and rephrase error messages in case output of grep
gets long.

Add .c source file(s) under appendix/styleguide/ to the definition
of "LST_SOURCES" to improve coverage of dependencies as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index c1a51bae..efe1add1 100644
--- a/Makefile
+++ b/Makefile
@@ -11,7 +11,8 @@ LATEXSOURCES = \
 	*/*.tex \
 	*/*/*.tex
 
-LST_SOURCES := $(wildcard CodeSamples/formal/promela/*.lst)
+LST_SOURCES := $(wildcard CodeSamples/formal/promela/*.lst) \
+	$(wildcard appendix/styleguide/*.c)
 
 LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex
 
@@ -123,14 +124,13 @@ ifdef A2PING
   endif
 endif
 
-LINE_ENV_IGNORE := Makefile perfbook_flat.tex $(LATEXGENERATED))
 # following variables are intentionally defined using "="
-LINELABEL_ENV_BEGIN = $(patsubst ./%,%,$(shell grep -R -l -F '\begin{linelabel}' .))
-LINELABEL_ENV_END   = $(patsubst ./%,%,$(shell grep -R -l -F '\end{linelabel}' .))
-LINEREF_ENV_BEGIN   = $(patsubst ./%,%,$(shell grep -R -l -F '\begin{lineref}' .))
-LINEREF_ENV_END     = $(patsubst ./%,%,$(shell grep -R -l -F '\end{lineref}' .))
-LINELABEL_ENV = $(filter-out $(LINE_ENV_IGNORE),$(sort $(LINELABEL_ENV_BEGIN) $(LINELABEL_ENV_END)))
-LINEREF_ENV   = $(filter-out $(LINE_ENV_IGNORE),$(sort $(LINEREF_ENV_BEGIN) $(LINEREF_ENV_END)))
+LINELABEL_ENV_BEGIN = $(shell grep -l -F '\begin{linelabel}' $(LATEXSOURCES))
+LINELABEL_ENV_END   = $(shell grep -l -F '\end{linelabel}'   $(LATEXSOURCES))
+LINEREF_ENV_BEGIN   = $(shell grep -l -F '\begin{lineref}'   $(LATEXSOURCES))
+LINEREF_ENV_END     = $(shell grep -l -F '\end{lineref}'     $(LATEXSOURCES))
+LINELABEL_ENV = $(sort $(LINELABEL_ENV_BEGIN) $(LINELABEL_ENV_END))
+LINEREF_ENV   = $(sort $(LINEREF_ENV_BEGIN) $(LINEREF_ENV_END))
 
 OLD_EPIGRAPH := $(shell grep -c '2009/09/02' `kpsewhich epigraph.sty`)
 TEXLIVE_2015_DEBIAN := $(shell pdftex --version | grep -c 'TeX Live 2015/Debian')
@@ -210,18 +210,18 @@ ifndef LATEXPAND
 endif
 	@if [ ! -z "$(LINELABEL_ENV)" -a "$(LINELABEL_ENV)" != " " ]; then \
 		echo "'linelabel' used as environment in $(LINELABEL_ENV)." ; \
-		echo "Use 'fcvlabel' instead." ; \
 		echo "------" ; \
 		grep -n -B 2 -A 2 -F 'linelabel' $(LINELABEL_ENV) ; \
 		echo "------" ; \
+		echo "Substitute 'fcvlabel' for 'linelabel' in $(LINELABEL_ENV)." ; \
 		exit 1 ; \
 	fi
 	@if [ ! -z "$(LINEREF_ENV)" -a "$(LINEREF_ENV)" != " " ]; then \
 		echo "'lineref' used as environment in $(LINEREF_ENV)." ; \
-		echo "Use 'fcvref' instead." ; \
 		echo "------" ; \
 		grep -n -B 2 -A 2 -F 'lineref' $(LINEREF_ENV) ; \
 		echo "------" ; \
+		echo "Substitute 'fcvref' for 'lineref' in $(LINEREF_ENV)." ; \
 		exit 1 ; \
 	fi
 	echo > qqz.tex
-- 
2.17.1


