Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=HmU0BkLQM5hCLsrfWTmgdO7AprFsjtZLmgKFLA4ouxI=;
 b=tLgN5b7DGxkrXBIFr50uQPkSSAs2VL2GrNi960r525yKEi9IawkzKtImFnYgzh68J/
 crkYNsF/ArSU1qxteEqeUt9pJZaNe7QKfs62a8nkYdS+kSeveTVgIYn8Gz3trd5c5Yv+
 2QdjhAQR09LwyUZf/OhB9h8qbpZCHf4CgsonSu+iF92gnDdUKFO46tu7e/doZrD1H9US
 v+dfRJi753JUen5cEEybUy54IoNsFxVlzPYO1s5MpPpFyMsQLnndj2JnK3WKzGDvH6zS
 jdoWVyR6q+TK7sGV6lVRUHEsVm8m2nuu/itCkODmOi212dHyxO63plS6n5mQZeswaUmZ
 gAvA==
Subject: [PATCH 3/3] qqz.sty: Tweak \vspace{} parameter
References: <04f10e4e-b325-c5a3-4076-3417a188ece2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a31022fb-40d0-f247-dcf1-ebe498fb2e4b@gmail.com>
Date: Mon, 9 Jan 2017 23:43:22 +0900
MIME-Version: 1.0
In-Reply-To: <04f10e4e-b325-c5a3-4076-3417a188ece2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6da1b01ee71e53c559a73e20686eabe67ba23935 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 9 Jan 2017 20:29:45 +0900
Subject: [PATCH 3/3] qqz.sty: Tweak \vspace{} parameter

Reduce \vspace{} parameters after black and white boxes in
Answers to Quick Quizzes for a denser layout.
Also add glue parameters to permit more flexible typeset.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 qqz.sty | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qqz.sty b/qqz.sty
index dda1c17..317e809 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -13,7 +13,7 @@
 %%
 %% Copyright (C) IBM Corporation, 2008
 %% Copyright (C) Paolo Bonzini, 2015
-%% Copyright (C) Akira Yokosawa, 2016
+%% Copyright (C) Akira Yokosawa, 2016, 2017
 %%
 %% Authors: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
 %%          Paolo Bonzini <pbonzini@redhat.com> # cross-link questions and answers
@@ -84,11 +84,11 @@

 \newcommand{\QuickA}[1]{%
 	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\rule{7pt}{7pt}}
-	\par\vspace{0.8\baselineskip}
+	\par\vspace{0.5\baselineskip plus .5ex minus .3ex}
 	\noindent\textbf{Answer:} \\ }

 \newcommand{\QuickE}{%
 	\hyperref[QQE.\QuickQuizAnswerChapter.\thequickquizctrC]{\ding{113}}
-	\vspace{1.5\baselineskip}
+	\vspace{1.0\baselineskip plus 2ex minus .5ex}
 }

-- 
2.7.4


