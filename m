Return-Path: <SRS0=J7Fr=4S=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=272xUIvddqfOBzDqV6LB4QjmDEXx/y6LpBlZbVrsUR0=;
        b=tsANdXiyEIcfHJjqJwGzUCBzjweJq7NGNTowsUH4YdngXpz2sUWpW60XVv0TFt//aB
         xxu1633kqyOIcAu2tdRSTqXtfDBdBd1fhVTFrpcEgrwXtO7dqNTczhIiw45AJsFjMZo8
         q5UTzVhtv6488LPLArvMDmaSFpSrGkYUTFY47d8lhhZqMvGCc20ph7HP38o6wKGxuBo4
         vDggTzdxVb/EwXwfgKEwoVLhN0hsFzIjv20nnwInK1WPEdv2yf20YH6IEij6SYl5Z5yL
         fFvyxZbcepZxjWhFiLvLq0URgUJFL+8jpbCWHFDuE36/f6TOK2Dk7Jc6J1qT85nyk0/+
         QOfg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] qqz.sty: Permit column/page break in front of Quick Quiz
 heading
Message-ID: <90c17ed1-2a89-d270-c7ca-3668ef52d3dd@gmail.com>
Date: Mon, 2 Mar 2020 00:02:01 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2c4fd06827d075a04c157d150cf036db1615f268 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 1 Mar 2020 21:47:45 +0900
Subject: [PATCH] qqz.sty: Permit column/page break in front of Quick Quiz heading

It turned out that the definition of \QuickQuiz needs an explicit
hint (\goodbreak) for LaTeX to be able to break column/page in front
of it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 qqz.sty | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qqz.sty b/qqz.sty
index eda6dc31..4dd411f6 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -34,7 +34,7 @@
 	}
 \newcommand{\QuickQuiz}[1]{
 	\refstepcounter{quickquizctr}
-	\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}}
+	\goodbreak\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}}
 \newcommand{\QuickQuizAnswer}[1]{%
 	\refstepcounter{quickquizctrE}%
 	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
-- 
2.17.1

