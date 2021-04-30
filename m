Return-Path: <SRS0=Nnbh=J3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7mt+e9UQ0kHbcTbod3Sfw6YK3Usjv4qiss3WA1xANkA=;
        b=a+Mjs55aMgYNb59ob58apPiYrSE9ZCz6RBv+e5b/9WbAjbDglXIV955PmfzuBAy872
         IwYqkPZMZe/sHXeA6Ihmy4oj8psKd7Lku71TbqFj89GGamMoZJ/Fvy0nrjnos+FV4l4+
         08tWr1f8FwwWJRizVYYGkeZB6QgZ1ssie7AIuhshJGtJprYqsxGM5TF0slXD5ivnXpRw
         vpyriiBpVqLpPEsWQBpmaPKBq8rfQZnMlVBuz4wHVcC22lYK2kQ8HyTVwzNIRjmmzzEl
         trGMKUAqTigYUms3tVSlLZGpZ/KeR3ZvoR5Bv51TyaOD2HmzR0AjxJPiWLdryO2HuYvl
         Uxog==
Subject: [PATCH -perfbook 3/4] locking: Fix typo
References: <9ccade63-dbc0-a089-b79d-3f1b619a6932@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <33e18495-0fa1-2da2-7900-460e49182b88@gmail.com>
Date: Fri, 30 Apr 2021 13:53:55 +0900
MIME-Version: 1.0
In-Reply-To: <9ccade63-dbc0-a089-b79d-3f1b619a6932@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This was lower-cased by a commit in 2016 and has survived since.

Fixes: 791af9cfcb0c ("locking: Use consistent expressions")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 locking/locking.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 406c5034..0d7666a9 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -381,7 +381,7 @@ In this case, we cannot construct a local locking hierarchy by
 releasing all locks before invoking unknown code.
 However, we can instead construct a layered locking hierarchy, as shown in
 Figure~\ref{fig:locking:Layered Locking Hierarchy for qsort()}.
-here, the \co{cmp()} function uses a new Lock~D that is acquired after
+Here, the \co{cmp()} function uses a new Lock~D that is acquired after
 all of Locks~A, B, and~C, avoiding deadlock.
 We therefore have three layers to the global deadlock hierarchy, the
 first containing Locks~A and~B, the second containing Lock~C, and
-- 
2.17.1


