Return-Path: <SRS0=9QzB=AE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681381191; x=1683973191;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdBvOkXYZpyX9ylywCAJgIv0uGn13ElExpH1tFws/u4=;
        b=dl7TNyfuJzaVzntac2TzJ9UsDzJ68JGIaMqb+FeaOXcWqMswgzjk79dFQTgTnE+n1K
         Gqk2UQHZFbBXyLqReItERt72mbRYwedFjo4Hn56vW/Qg8clKhYUIvklMOelIwPvOgCiK
         Hd1BriwAfwgSS2hooA7ZAdiGOsEQFfUWrU3s1WyJc4KqK0eaA1d9LX9qdom1L4TV4agh
         9lOgMHdwU81iKDrs5Bs12Oslo41OqRqD5fA3qsOWSWjgimd4f3zAV+UkdZi9cWRmEeuC
         PIfDZNvzgTZT1XVeGkgF+IyOcsvoGSqlDUuyoDm3slFu0P01NWZyHFjlEAxV0pB0biSH
         ZY3A==
Message-ID: <7b762b1f-7a03-0e42-abf9-718fa85546ad@gmail.com>
Date: Thu, 13 Apr 2023 19:19:47 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] count: Correct grammar in QQz 5.50
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Make adverbial phrase look as such.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index ccc2e839e5ed..7b2fde109490 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2440,7 +2440,7 @@ the fastpath happens before this change of \co{theft} to READY\@.
 \end{listing}
 
 \QuickQuiz{
-	In \cref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}'s
+	In \cref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
 	doesn't \co{flush_local_count_sig()} need stronger memory barriers?
 }\QuickQuizAnswer{
 	No, that \co{smp_store_release()} suffices because this code

base-commit: b66ea50d370a6b028487d19e6857718d8e703f7c
-- 
2.25.1

