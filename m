Return-Path: <SRS0=Gg+I=4C=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=smNvoP9WOvLAUlD5AxH8YlS7PQN6woegiNZ7lP6nhec=;
        b=rHOHkuG8JEQx8FVL6kWiZrJK6ZNYzERORH5Z9QGibml1Nt9zgk+nFiCgR1wgZFW9ZC
         eefi57uNzlNti7cYkgrZ25pSEP0X5wyxlSMi27TpksLEFLbjP4Q2e3WWRWogUI2+4prO
         yLPIi912u2axt/9kyhkOf+oUV8cDb5aFaaeSytTY+UTuRtPZfjFRlLunEV9jJBuv0ekM
         pNW6P5RmWB3hOo7trc7jQ6p9NZKB8Jxg5N5B4xdBXhzW63VO7l+rmrDjFB8/9MgOaMXo
         iEqZsmOUtRMuyrinCsgjtBzAIdmCjeW3MypK3BUgp1g+hLFa0991tQLvpgz6AD56P46e
         LJWw==
Subject: [PATCH v2] Makefile: Add check of \crefrange and \clnrefrange misuse
References: <d124a04e-8933-69c6-34b1-86057ff5567a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <74810782-6250-d9fb-1243-4e1183851517@gmail.com>
Date: Sat, 15 Feb 2020 08:49:26 +0900
MIME-Version: 1.0
In-Reply-To: <d124a04e-8933-69c6-34b1-86057ff5567a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f445ac887a125bbff303b80921f981ea0704c748 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 15 Feb 2020 08:36:53 +0900
Subject: [PATCH v2] Makefile: Add check of \crefrange and \clnrefrange misuse

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
Hi Paul,

This one uses a regex to cover both \cref and \clnref pattern.

        Thanks, Akira
--
 Makefile | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Makefile b/Makefile
index ccc840be..7d1ec630 100644
--- a/Makefile
+++ b/Makefile
@@ -131,6 +131,9 @@ LINEREF_ENV_END     := $(shell grep -l -F '\end{lineref}'     $(LATEXSOURCES))
 LINELABEL_ENV := $(sort $(LINELABEL_ENV_BEGIN) $(LINELABEL_ENV_END))
 LINEREF_ENV   := $(sort $(LINEREF_ENV_BEGIN) $(LINEREF_ENV_END))
 
+CREFPTN    := '\\[Cc](ln)?ref{[^{]+}\s*{[^}]+}'
+CREFPAIR   := $(shell grep -l -zo -E $(CREFPTN)   $(LATEXSOURCES))
+
 SOURCES_OF_SNIPPET_ALL := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
 SOURCES_OF_LITMUS      := $(shell grep -r -l -F '\begin[snippet]' CodeSamples)
 SOURCES_OF_LTMS        := $(patsubst %.litmus,%.ltms,$(SOURCES_OF_LITMUS))
@@ -202,6 +205,18 @@ endif
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
+		echo "Need to use \[Cc]refrange or \[Cc]lnrefrangein $(CREFPAIR)." ; \
+		exit 1 ; \
+	fi
 	echo > qqz.tex
 	echo > contrib.tex
 	echo > origpub.tex
-- 
2.17.1


