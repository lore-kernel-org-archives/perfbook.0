Return-Path: <SRS0=Gg+I=4C=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=A/GBBR8Z3Z3pkoEnmQMXyhu7rivjELMkWGyKBJztkAA=;
        b=LJ9aaaljvv6VqqJGAN7khcNpaIy0Po8G9tojXov2lYzyNIlCiR3B6PDW98PaXWzNEA
         sEvxsgEz/y6Yy/7AF9KRmhC8D2sA8k7v4+ZuzBMMXtyhqqWZEqCNFw9hryNJpr9DkYub
         95m367SPMkuL5k0j7ufY6mPKUaUhYRhCavZQ4w0C694eNGLJCRFLmVDN7J95ZV8gM9J0
         hDVsyu5nlIlR4SYCmga7SLkNbEew3QbSNdAvSVmkVaSyuav69hV073Lg7FwIOopwxMWH
         xUBRQGTyYap4pEYBtxtPMWMQb7p2uBpdcXRYB0X1ivySqMlC5nZLKx7LUcToSje/ubSq
         Sh8w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Makefile: Add check of \crefrange or \clnrefrange misuse
Message-ID: <d124a04e-8933-69c6-34b1-86057ff5567a@gmail.com>
Date: Sat, 15 Feb 2020 00:51:38 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c0b6af552c7d5ade1b721ba4d6bd3c42e0f913e1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 14 Feb 2020 22:42:04 +0900
Subject: [PATCH] Makefile: Add check of \crefrange and \clnrefrange misuse

To prevent typos simillar to the one fixed in commit b3b06a98bb7c
("datastruct.tex: fix some minor typos") to happen again,
add checks to detect the following patterns of misuses:

... \cref{label A}{label B} ...

... \cref{long label X}
{another long label Y}

In the formar case, counts of violating lines are presented in
the error message.
In the latter case, only the file name can be presented due
to the "-zo" option to enable multi-line pattern search.

Note: There can be false negatives in the check.
For example, it can't not detect:

... \cref{label E}% some comment
{label F}

, at the moment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Makefile b/Makefile
index ccc840be..cb9ef668 100644
--- a/Makefile
+++ b/Makefile
@@ -131,6 +131,11 @@ LINEREF_ENV_END     := $(shell grep -l -F '\end{lineref}'     $(LATEXSOURCES))
 LINELABEL_ENV := $(sort $(LINELABEL_ENV_BEGIN) $(LINELABEL_ENV_END))
 LINEREF_ENV   := $(sort $(LINEREF_ENV_BEGIN) $(LINEREF_ENV_END))
 
+CREFPTN    := '\\[Cc]ref{[^{]+}\s*{[^}]+}'
+CLNREFPTN  := '\\[Cc]lnref{[^{]+}\s*{[^}]+}'
+CREFPAIR   := $(shell grep -l -zo -E $(CREFPTN)   $(LATEXSOURCES))
+CLNREFPAIR := $(shell grep -l -zo -E $(CLNREFPTN) $(LATEXSOURCES))
+
 SOURCES_OF_SNIPPET_ALL := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
 SOURCES_OF_LITMUS      := $(shell grep -r -l -F '\begin[snippet]' CodeSamples)
 SOURCES_OF_LTMS        := $(patsubst %.litmus,%.ltms,$(SOURCES_OF_LITMUS))
@@ -202,6 +207,30 @@ endif
 		echo "Substitute 'fcvref' for 'lineref' in $(LINEREF_ENV)." ; \
 		exit 1 ; \
 	fi
+	@if [ ! -z "$(CREFPAIR)" -a "$(CREFPAIR)" != " " ]; then \
+		echo "------" ; \
+		if grep -q -E $(CREFPTN) $(CREFPAIR) ; then \
+			grep -n -B 2 -A 2 -E $(CREFPTN) $(CREFPAIR) ; \
+		else \
+			grep -zo -B 2 -A 2 -E $(CREFPTN) $(CREFPAIR) ; \
+			echo ; \
+		fi ; \
+		echo "------" ; \
+		echo "Need to use \[Cc]refrange in $(CREFPAIR)." ; \
+		exit 1 ; \
+	fi
+	@if [ ! -z "$(CLNREFPAIR)" -a "$(CLNREFPAIR)" != " " ]; then \
+		echo "------" ; \
+		if grep -q -E $(CLNREFPTN) $(CLNREFPAIR) ; then \
+			grep -n -B 2 -A 2 -E $(CLNREFPTN) $(CLNREFPAIR) ; \
+		else \
+			grep -zo -B 2 -A 2 -E $(CLNREFPTN) $(CLNREFPAIR) ; \
+			echo ; \
+		fi ; \
+		echo "------" ; \
+		echo "Need to use \[Cc]lnrefrange in $(CLNREFPAIR)." ; \
+		exit 1 ; \
+	fi
 	echo > qqz.tex
 	echo > contrib.tex
 	echo > origpub.tex
-- 
2.17.1

