Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bySAql+0O7dr1bBylfwWqkUoNpAe4MMP7dWjqu+/ScA=;
        b=YAMOcc3IzYorvSOUspjr17KJ3stOKoyzfaoQYTdCx9AuSYHLtnDTTdAUYxOsyaaS9X
         WJI7tOuS5rh5VecAnp1UxATQGrCc1kJSg3N48pBqVByMYoHQrw1rRi4mLYjfjx4g7sEs
         ZXNxH+xj7u4SOBDFm0thAbIusv2CGRv7nEItE381u1iiflUvMRINpunRqw1TTgRaLYiF
         bGgqJ+c5kD8ndKyZ2pi23ZSX1dGqI3feD8wssnUqnIuwSScC4qheCbFtZcAD5g3ETakF
         avA0+S9dD33dof6dDpaYBTXjmdTAra4stZ9pGxt0nM+5Ez+sElgEXwMYoon0JbgxVySq
         EO9w==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/7] count: Use '\lnref' consistently
Date: Tue, 20 Nov 2018 09:00:53 +0900
Message-Id: <20181120000057.389-3-sj38.park@gmail.com>
In-Reply-To: <20181120000057.389-1-sj38.park@gmail.com>
References: <20181120000057.389-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 count/count.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 0f35042..c465634 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2456,8 +2456,9 @@ line~\lnref{signal} sends the thread a signal.
 \QuickQuizAnswer{
 	There is no need for an additional check.
 	The caller of \co{flush_local_count()} has already invoked
-	\co{globalize_count()}, so the check on line~28 will have
-	succeeded, skipping the later \co{pthread_kill()}.
+	\co{globalize_count()}, so the check on
+	line~\ref{ln:count:count_lim_sig:migration:flush:checkmax}
+	will have succeeded, skipping the later \co{pthread_kill()}.
 } \QuickQuizEnd
 
 \QuickQuiz{}
-- 
2.10.0

