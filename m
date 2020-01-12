Return-Path: <SRS0=UsGV=3B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x9CK7EEhK6UESRrPJCkrgJQIcCBLYmzNEwc1A7k6rKE=;
        b=powxRRTrOJOVOz7CM8I83HlLtq+gjvEj55T42i1nVV5oxYz1zibkw17SJGuGMD53oj
         IZ7MxNB3w2lFPewrk89e3+ryOBC4inRLJRTfvpX3G9GiA1+Gur9dD5nJMUceItBtyczp
         XapHnTkVIMSgH4+hNm2lkZpOtC7C3i/oY6J7M5day/2r/hePds2dOlZ1fm+QjhD48Rum
         VS0Y5UnJsDiMOQNUXd2Y6XT/kYuR9TicGeBr/mrWnjneXg+EMrh+R2zSrv+WFV1LXDFb
         ytwyyA9djHCHMywDH6hnshOLltlpvmKpt8TgFPnM4ERwOJYqhsbGQP6ULRGt/PYuqyNO
         m/Tg==
Subject: [PATCH 6/6] Reduce footnote width in 1c layout
References: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c522ab63-3cb6-61df-6f1b-f70bebfde613@gmail.com>
Date: Sun, 12 Jan 2020 13:13:35 +0900
MIME-Version: 1.0
In-Reply-To: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 72662b6c10b8d10e713ff7a28df43a4606d96ea0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 12 Jan 2020 00:13:58 +0900
Subject: [PATCH 6/6] Reduce footnote width in 1c layout

Textwidth of 1c layout is too wide for footnotesize font.
Reduce the width by increasing right-side margin used by
the "footmisc" package as is suggested in [1].

[1]: https://tex.stackexchange.com/questions/321264/

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index e8610a34..7799228d 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -119,7 +119,11 @@
 \newcommand{\IfToArxiv}[2]{\ifthenelse{\boolean{toarxiv}}{#1}{#2}}
 
 \IfTwoColumn{}{
-\setboolean{colorlinks}{true}
+  \setboolean{colorlinks}{true}
+  \renewcommand\footnotelayout{%
+    \advance\leftskip 0.0in
+    \advance\rightskip 0.7in
+  }
 }
 
 \IfColorLinks{
-- 
2.17.1


