Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1+YUSHDqtTpdHwKq3qZ0o/2sz/TBOQn982pvfyHGET4=;
        b=a4ovVgu+d8o8DeYMg9avPDn8/GoJbgGgUhatHJUo/T06chwlmN9p7MJoZiBiUJzjhE
         W2wXbRhxkc7OasKjVMHWDVfvpAK7lcaH1Is0ChqXPxkkL043wgcex/63SZkZp8pdvwsu
         5Yha4WeLvhm4liqcJIh4lRBK+RLSjfOV5lqcJfA4KkvNo/lwBq1yKDZEqCh9CX3Vpi+Q
         x9GWNIN7l9sBgierqqQt0OxuUxqwqx2Uj6J5J9tSDlOuExLEChuQ4hspdU3P0ZuY0oB+
         LSwKJLmApgYaUMDi5tTvs1ouYR00gDkPzwS1dAYH3DmH7+R97IW6zjAcdUheGywCf/mX
         e8Sw==
Subject: [PATCH 09/11] Make sure lmtt font is used in 'VerbatimL' and
 'Verbatim' env
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b57d2403-be10-a74b-b961-bf28083b536f@gmail.com>
Date: Tue, 25 Dec 2018 00:03:51 +0900
MIME-Version: 1.0
In-Reply-To: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6267c0822e5286667e3cc0dc873e79bafd4b4bb6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 23 Dec 2018 23:45:40 +0900
Subject: [PATCH 09/11] Make sure lmtt font is used in 'VerbatimL' and 'Verbatim' env

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/perfbook.tex b/perfbook.tex
index 6784771..ce85570 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -129,6 +129,8 @@
 \AtBeginEnvironment{tabularx}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{minipage}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{listing}{\renewcommand{\ttdefault}{lmtt}}
+\AtBeginEnvironment{Verbatim}{\renewcommand{\ttdefault}{lmtt}}
+\AtBeginEnvironment{VerbatimL}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{VerbatimN}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{VerbatimU}{\renewcommand{\ttdefault}{lmtt}}
 }{}
-- 
2.7.4


