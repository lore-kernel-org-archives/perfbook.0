Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0sXLtGXsUACkGmQIqTnH1RYhhd9tpFyMPzK2mKe0uD0=;
        b=E7p8IZ6kQ3WGJgae2Qfdg2d+S7QrrahZzTQT1cVT3FP8GnmCpWjuNC7gHyCMDBlxq0
         rP/E1Cm88wv3YpU4ub4+fxSUiNn11GNAjDIJYyT5yTePn0zX1ZMc7jgPRjKvmqn/HnWO
         95/5adtxMBKx7XC2rA/VHHlkdV7Oz2geuQQYywoKr9sTAAfZ4Z89rphPUk597UKM3f3P
         fGj+UQx0wN+238YmTX/EYnSP9CDBlgEOk7pl+8D7P3bR1JuY9hcZT08vTAWE4x5vJG5j
         NJQ9OsUQSRSuoUJOjHh0pDLADFduPn8E/AQyiM4MLWOW4G/oYuYWHze1Tfd8C2+VW1/B
         J3Vg==
Subject: [PATCH 2/4] Set default fontfamily for snippets of 'fancyvrb'
References: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <58097d2b-3164-cb77-65f7-6000d59cf619@gmail.com>
Date: Wed, 13 Feb 2019 00:35:40 +0900
MIME-Version: 1.0
In-Reply-To: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 025355ead8a24d953771fc44066f20efa91e9897 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 12 Feb 2019 21:04:37 +0900
Subject: [PATCH 2/4] Set default fontfamily for snippets of 'fancyvrb'

Defaults of environments derived from "Verbatim" as well
as \VerbatimInput{} can be set globally by a "\fvset{}" macro.

\VerbatimImput{} was not covered by the old code.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/perfbook.tex b/perfbook.tex
index 9caeee8..edf18d5 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -131,10 +131,7 @@
 \AtBeginEnvironment{tabularx}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{minipage}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{listing}{\renewcommand{\ttdefault}{lmtt}}
-\AtBeginEnvironment{Verbatim}{\renewcommand{\ttdefault}{lmtt}}
-\AtBeginEnvironment{VerbatimL}{\renewcommand{\ttdefault}{lmtt}}
-\AtBeginEnvironment{VerbatimN}{\renewcommand{\ttdefault}{lmtt}}
-\AtBeginEnvironment{VerbatimU}{\renewcommand{\ttdefault}{lmtt}}
+\fvset{fontfamily=lmtt}
 }{}
 
 \IfTblCpTop{
-- 
2.7.4


