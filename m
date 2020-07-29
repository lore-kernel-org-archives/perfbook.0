Return-Path: <SRS0=SbQd=BI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DotRv6B7eaPHLxbF1jYeevBuKOotkWqHUJ/2Gd8glOU=;
        b=iNHddOfFsYTde68FSBFxFPNzFaHFRS6bB7n4gu84Upkj4wnWn5etJdWh4/Q6E0ud5W
         hABOUlJxTaGSEW2iSJbvcjYgOqJxUA++CxgBGeCdR0kO9DjjCNRDWJinLl2aP7fr8ZdO
         rYfMLeBgRHVaPc31I35R/1rOQeinh+CWa6S2CxFWCA6oGMSd8aEgkaTKSJBEff35Oz5l
         LUhM/DhNjB+ca02d+hHR4HmW0SAE2AwXf9ROFkYpQZGLpgjOrm4UIB7ri6e5/Kz8WEoh
         dmIzWsIRbKhoFKkXUfS7kHNWrqe1WH1CftaGiMFFvG00DdFqDubMNedLiVR529TpNAkh
         rFbw==
Subject: [PATCH 1/5] Makefile: Fix typo in CREFPTN
References: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d93f0d47-a6d9-6f89-4ec3-97f5d628701f@gmail.com>
Date: Thu, 30 Jul 2020 00:13:40 +0900
MIME-Version: 1.0
In-Reply-To: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ad129055142dfaa6a816d541c767c1cd86c0cf73 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 27 Jul 2020 16:10:26 +0900
Subject: [PATCH 1/5] Makefile: Fix typo in CREFPTN

This regular expression is supposed to catch a pattern of
\cref{ref:a} {ref:b}, which will result in something like:

    Section 1.2 ref:b ...

Due to a typo in the expression, it catches

    ... { ... \cref{ref:a} ... } { ... }

, which is a false positive.

Fixing the pattern to "[^}]+}" will avoid the false positive.

Fixes: 962cbb73ce0c ("Makefile: Add check of \crefrange and \clnrefrange misuse")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 802d638e..4e2b65ab 100644
--- a/Makefile
+++ b/Makefile
@@ -135,7 +135,7 @@ LINEREF_ENV_END     := $(shell grep -l -F '\end{lineref}'     $(LATEXSOURCES))
 LINELABEL_ENV := $(sort $(LINELABEL_ENV_BEGIN) $(LINELABEL_ENV_END))
 LINEREF_ENV   := $(sort $(LINEREF_ENV_BEGIN) $(LINEREF_ENV_END))
 
-CREFPTN    := '\\[Cc](ln)?ref{[^{]+}\s*{[^}]+}'
+CREFPTN    := '\\[Cc](ln)?ref{[^}]+}\s*{[^}]+}'
 CREFPAIR   := $(shell grep -l -zo -E $(CREFPTN)   $(LATEXSOURCES))
 
 SOURCES_OF_SNIPPET_ALL := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
-- 
2.17.1


