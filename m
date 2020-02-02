Return-Path: <SRS0=XWF6=3W=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XTSRP6qjFzakPbAnayXpy053Ow9Tbg6pghzpnCGNnfc=;
        b=DoEd/S3QmxbDeWRFLzKEc3zC+hsSbvUP8bDl6V6cU5imKctqCeFZgcSkrVHvN4D3ha
         sqJrSC9AtQESk5jQ/UpbVKiPKSQfEF89oQJGEu9y4SiQM//XoyDnVB7dhbq08nXh7hyM
         s7ltRjdr1E/jMRn0/5HdfpdSv29Hup2qCgOz9l8XAsBlIriulbfvv9rzUpM3DC919tff
         ynoxC+rkVAweJvaQczCXPhNGyQjfyzcBzCsJ/V+JGapbe6MVR2dJCG8+hN/Us6eDPaPM
         sgYZi9iZvEXyt0nrb97ezubAc4ZJLgPfVswmw34LfSrVP8EUb/v9c7pu63k3RX6Y4xLK
         W7/A==
Subject: [PATCH v2 2/2] Makefile: grep only .tex files in 'linelabel' and
 'lineref' search
References: <21d9e8af-cbf7-3d35-63a7-b9f195bd1a4f@gmail.com>
 <63c57945-17b3-753f-5714-eb3d207c5e8b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fb2a33f4-8899-3b19-91cb-17867e2e6789@gmail.com>
Date: Sun, 2 Feb 2020 23:27:25 +0900
MIME-Version: 1.0
In-Reply-To: <63c57945-17b3-753f-5714-eb3d207c5e8b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5df79b2b5402c98547c481f3132ba87661731b1a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 2 Feb 2020 23:20:26 +0900
Subject: [PATCH v2 2/2] Makefile: grep only .tex files in 'linelabel' and 'lineref' search

For the checks added in commit 60c2079f2765 ("Makefile: Check
'linelabel' and 'lineref' used as environment"), it should be
sufficient to grep files listed in $(LATEXSOURCES) only.

Using this variable rather than the grep option "-R" will reduce
the cost of the checks.  We can also get rid of "patsubst" and
"filter-out" functions in the following macro definitions.
Furthermore, as the files in $(LATEXSOURCES) are not modified
during the build, we can use the operator ":=" there.

Also reorder and rephrase error messages in case output of grep
gets long.

Add .c source file(s) under appendix/styleguide/ to the definition
of "LST_SOURCES" to improve coverage of dependencies as well.

In the definitions of "SOURCES_OF_SNIPPET_ALL" and "SOURCES_OF_LITMUS",
replace the grep option "-R" (recursive option to follow symbolic
links) with the option "-r", which should be good enough.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

It turns out that we can speed up the startup of "make" further
by using the ":=" operator and the grep option "-r".

        Thanks, Akira
--
 Makefile | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index c1a51bae..6f8417f3 100644
--- a/Makefile
+++ b/Makefile
@@ -11,7 +11,8 @@ LATEXSOURCES = \
 	*/*.tex \
 	*/*/*.tex
 
-LST_SOURCES := $(wildcard CodeSamples/formal/promela/*.lst)
+LST_SOURCES := $(wildcard CodeSamples/formal/promela/*.lst) \
+	$(wildcard appendix/styleguide/*.c)
 
 LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex
 
@@ -123,14 +124,12 @@ ifdef A2PING
   endif
 endif
 
-LINE_ENV_IGNORE := Makefile perfbook_flat.tex $(LATEXGENERATED))
-# following variables are intentionally defined using "="
-LINELABEL_ENV_BEGIN = $(patsubst ./%,%,$(shell grep -R -l -F '\begin{linelabel}' .))
-LINELABEL_ENV_END   = $(patsubst ./%,%,$(shell grep -R -l -F '\end{linelabel}' .))
-LINEREF_ENV_BEGIN   = $(patsubst ./%,%,$(shell grep -R -l -F '\begin{lineref}' .))
-LINEREF_ENV_END     = $(patsubst ./%,%,$(shell grep -R -l -F '\end{lineref}' .))
-LINELABEL_ENV = $(filter-out $(LINE_ENV_IGNORE),$(sort $(LINELABEL_ENV_BEGIN) $(LINELABEL_ENV_END)))
-LINEREF_ENV   = $(filter-out $(LINE_ENV_IGNORE),$(sort $(LINEREF_ENV_BEGIN) $(LINEREF_ENV_END)))
+LINELABEL_ENV_BEGIN := $(shell grep -l -F '\begin{linelabel}' $(LATEXSOURCES))
+LINELABEL_ENV_END   := $(shell grep -l -F '\end{linelabel}'   $(LATEXSOURCES))
+LINEREF_ENV_BEGIN   := $(shell grep -l -F '\begin{lineref}'   $(LATEXSOURCES))
+LINEREF_ENV_END     := $(shell grep -l -F '\end{lineref}'     $(LATEXSOURCES))
+LINELABEL_ENV := $(sort $(LINELABEL_ENV_BEGIN) $(LINELABEL_ENV_END))
+LINEREF_ENV   := $(sort $(LINEREF_ENV_BEGIN) $(LINEREF_ENV_END))
 
 OLD_EPIGRAPH := $(shell grep -c '2009/09/02' `kpsewhich epigraph.sty`)
 TEXLIVE_2015_DEBIAN := $(shell pdftex --version | grep -c 'TeX Live 2015/Debian')
@@ -149,8 +148,8 @@ else
   SUGGEST_UPGRADE_EPIGRAPH := 0
 endif
 
-SOURCES_OF_SNIPPET_ALL := $(shell grep -R -l -F '\begin{snippet}' CodeSamples)
-SOURCES_OF_LITMUS      := $(shell grep -R -l -F '\begin[snippet]' CodeSamples)
+SOURCES_OF_SNIPPET_ALL := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
+SOURCES_OF_LITMUS      := $(shell grep -r -l -F '\begin[snippet]' CodeSamples)
 SOURCES_OF_LTMS        := $(patsubst %.litmus,%.ltms,$(SOURCES_OF_LITMUS))
 SOURCES_OF_SNIPPET     := $(filter-out $(SOURCES_OF_LTMS),$(SOURCES_OF_SNIPPET_ALL)) $(SOURCES_OF_LITMUS)
 GEN_SNIPPET_D  = utilities/gen_snippet_d.pl utilities/gen_snippet_d.sh
@@ -210,18 +209,18 @@ ifndef LATEXPAND
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


