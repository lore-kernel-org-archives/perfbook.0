Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u1I2/sK6xyj3C1PvCXU7zdYuCiuZVImAqaDloTpBHjU=;
        b=bT9DRti1KvLct5YlRLO0i1Mr9QJGXnT4zsEQWZlGOTg53s5OpvDEMr3o0KUBhWrjhl
         oeXPR0yXSNywWkWhyA/URs6ed12kuhGffP6CdiGieOyyJ4MA+tVKUdL28edwZDM4K2/B
         oZTd0efIv3O/vT2n98U7/va42Aov1efGq9fX9qMdf0QPoBwDSZSd//izPeAytDruTkgw
         aCu7HlZyi9RQs1f6PeujIBkM5DqV4iCiJJ1BFYc2PDp0JsX42fSkjvQOmdZSeR2f1nFP
         1Vx6IM7QNjqXzoKJ5iBfrARVaTs9xPVY+wckLNf1+WpxBGZWHqCY+8VM7g2AohezMv58
         IcSg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 2/4] howto: Add missed `~` for Paul's name
Date: Sun,  4 Apr 2021 13:10:42 +0200
Message-Id: <20210404111044.27774-3-sj38.park@gmail.com>
In-Reply-To: <20210404111044.27774-1-sj38.park@gmail.com>
References: <20210404111044.27774-1-sj38.park@gmail.com>
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
index b60e3a9a..5bbf8c39 100644
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

