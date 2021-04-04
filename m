Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UWDdJ7uGdF4T3FZCmE67/gapwUvIpfT5/Rrj/CF+VkQ=;
        b=jo5s9HG2CfRdBP53ywBMMmPN6finc0PUS24M6XSPJrf26HzAhX93Xq2EAsyrPWxfPY
         yhLoWblMM8NHzX9hTIpyNxz58LVHAg0ZdZxyJDk57UJ6znbWx5Gnb0JOlYkbLr6kHw3S
         M2oS2k6GhwgUvF3EnTBCAulFy4IEag40DCeI7KutCfRzrhkFeR9+EadnFyaBS7Z79iPW
         vzqxtIDXFW6EX9hPae/DNpz60gd7XQwHEsd0LZ7qm+G8bcN1yBhElJZf6yp1Zqjg9W/F
         vfOMANCWD+LutMT01BnqnEFp9ZizY8/c8SmKv+J4HLeog4q0feGZp0Q5KmkpNvQqrFax
         pJEQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2 2/4] howto: Add missed `~` for Paul's name
Date: Sun,  4 Apr 2021 12:05:01 +0200
Message-Id: <20210404100503.20978-3-sj38.park@gmail.com>
In-Reply-To: <20210404100503.20978-1-sj38.park@gmail.com>
References: <20210404100503.20978-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, akiyks@gmail.com, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In the latex source files, preferred way of Paul's name writing would be
`Paul E.~McKenney`.  This commit adds missed `~` in the name in howto
chapter.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 howto/howto.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 627ae776..2f07c8a7 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -187,7 +187,7 @@ of parallel programming.
 	Is that really the intent?
 }\QuickQuizAnswerM{
 	Indeed it is!
-	Many are questions that Paul E. McKenney would probably have
+	Many are questions that Paul E.~McKenney would probably have
 	asked if he was a novice student in a class covering this material.
 	It is worth noting that Paul was taught most of this material by
 	parallel hardware and software, not by professors.
-- 
2.17.1

