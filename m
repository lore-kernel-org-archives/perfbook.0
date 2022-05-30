Return-Path: <SRS0=93Lp=WG=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=kdt1/m0bJzHoM5bE9Ti5WDwtOPt/RcfTX9RJzBQp3RQ=;
        b=C0nALFg8XU/885JDqeHx1ZWxwc2Y2d9UBPSpa9xtBrI9APohhYae1dXUWV0xtSGqd5
         11mV344JyFx4jpz3xVkifylJFWpmG6B2gbHg1/cE8ubZ2GOiySM6LeQuGFNatU7s2iL6
         e5pfeNoG0ASdnfu7vhLRY3hCOBius01oNKrtHCBWRK+BPMalAqoU3j2wWcI+/zuBrzAc
         DUNzKhAO8c28MgjVsKunYENKOU+vAJ1NjYcKI3z31a0TradtvBULdRu59Ym5drk1QlXt
         oxGM5C6HBt4IeM3DCsDlOh5VY74AfOi05iS1tZvwlq9k/ZV1AMN+ykCJRqD4peA2wyws
         K1kA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] locking: Consistently append parentheses to pthread_cond_wait()
Date: Mon, 30 May 2022 09:12:36 -0700
Message-Id: <20220530161236.6397-1-sj38.park@gmail.com>
To: perfbook@vger.kernel.org, paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Some of 'pthread_cond_wait()' mentions have '()' suffix, which indicates
it's a function, but some mentions don't.  This commit adds the suffix
to all mentions to be consistent.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 locking/locking.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 14690b19..4ad5e4c4 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -528,8 +528,8 @@ prevents hangs due to lost wakeups.
 
 	Consider a program that acquires \co{mutex_a}, and then
 	\co{mutex_b}, in that order, and then passes \co{mutex_a}
-	to \co{pthread_cond_wait}.
-	Now, \co{pthread_cond_wait} will release \co{mutex_a}, but
+	to \co{pthread_cond_wait()}.
+	Now, \co{pthread_cond_wait()} will release \co{mutex_a}, but
 	will re-acquire it before returning.
 	If some other thread acquires \co{mutex_a} in the meantime
 	and then blocks on \co{mutex_b}, the program will deadlock.
-- 
2.17.1

