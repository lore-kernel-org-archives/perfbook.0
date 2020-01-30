Return-Path: <SRS0=aoJh=3T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t2wGeTcaDvWf0ZRpSX9RAZa3Y5YsROOjjFZXctW6fcE=;
        b=Ix/NQ9JQyQ+oi2iFY1/jpQ+mOcnCjZ68tdiTf4Jfk1RYXeR+YslN091kreglNOPhu4
         TpeatqaCqdo91fZtNISHKA5b6B18gqy/pe3522moMl7KPj1i3eyKrpHqUHXD6Q9xFHCd
         W9Rz8kocEwlfPlQv1BMR7J0zBPwgMNhHDuJ2oYe5FOAAv4ypvpx9V7bS5TAg5uN0sV3K
         WRfmlx3p6ZFNBLgq5p4gZ+0eoai9rFuDruLt80acMxbwTqI4SkgpLKcRWcHUfBVDvLzm
         t7ugKBRKdqAfcqZoUDCCeyx+zEsETh7Xd61N1Fopst5+XTn9EjIHK5OT4qVfLpZqKUuS
         WShA==
Subject: [PATCH 2/6] Makefile: Check 'linelabel' and 'lineref' used as
 environment
References: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <46fa158c-a20c-d9be-ad9c-ec28e6c4482b@gmail.com>
Date: Fri, 31 Jan 2020 07:35:00 +0900
MIME-Version: 1.0
In-Reply-To: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1701f75c55109e3d609a4a07b645610fccbff800 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 28 Jan 2020 00:36:27 +0900
Subject: [PATCH 2/6] Makefile: Check 'linelabel' and 'lineref' used as environment

Although linelabel and lineref are defined by lineno package,
pdflatex won't detect error if they are used as environments.
This commit adds checks to detect \begin{lineref}/\end{lineref}/
\begin{linelabel}/\end{lineref}.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Makefile b/Makefile
index 06226d63..3dbd5d53 100644
--- a/Makefile
+++ b/Makefile
@@ -119,6 +119,16 @@ ifdef A2PING
     endif
   endif
 endif
+
+LINE_ENV_IGNORE := Makefile perfbook_flat.tex $(LATEXGENERATED))
+# following variables are intentionally defined using "="
+LINELABEL_ENV_BEGIN = $(patsubst ./%,%,$(shell grep -R -l -F '\begin{linelabel}' .))
+LINELABEL_ENV_END   = $(patsubst ./%,%,$(shell grep -R -l -F '\end{linelabel}' .))
+LINEREF_ENV_BEGIN   = $(patsubst ./%,%,$(shell grep -R -l -F '\begin{lineref}' .))
+LINEREF_ENV_END     = $(patsubst ./%,%,$(shell grep -R -l -F '\end{lineref}' .))
+LINELABEL_ENV = $(filter-out $(LINE_ENV_IGNORE),$(sort $(LINELABEL_ENV_BEGIN) $(LINELABEL_ENV_END)))
+LINEREF_ENV   = $(filter-out $(LINE_ENV_IGNORE),$(sort $(LINEREF_ENV_BEGIN) $(LINEREF_ENV_END)))
+
 SOURCES_OF_SNIPPET_ALL := $(shell grep -R -l -F '\begin{snippet}' CodeSamples)
 SOURCES_OF_LITMUS      := $(shell grep -R -l -F '\begin[snippet]' CodeSamples)
 SOURCES_OF_LTMS        := $(patsubst %.litmus,%.ltms,$(SOURCES_OF_LITMUS))
@@ -174,6 +184,22 @@ perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVS
 ifndef LATEXPAND
 	$(error --> $@: latexpand not found. Please install it)
 endif
+	@if [ ! -z "$(LINELABEL_ENV)" -a "$(LINELABEL_ENV)" != " " ]; then \
+		echo "'linelabel' used as environment in $(LINELABEL_ENV)." ; \
+		echo "Use 'fcvlabel' instead." ; \
+		echo "------" ; \
+		grep -n -B 2 -A 2 -F 'linelabel' $(LINELABEL_ENV) ; \
+		echo "------" ; \
+		exit 1 ; \
+	fi
+	@if [ ! -z "$(LINEREF_ENV)" -a "$(LINEREF_ENV)" != " " ]; then \
+		echo "'lineref' used as environment in $(LINEREF_ENV)." ; \
+		echo "Use 'fcvref' instead." ; \
+		echo "------" ; \
+		grep -n -B 2 -A 2 -F 'lineref' $(LINEREF_ENV) ; \
+		echo "------" ; \
+		exit 1 ; \
+	fi
 	echo > qqz.tex
 	echo > contrib.tex
 	echo > origpub.tex
-- 
2.17.1


