Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nAHlYt+O3pEKQcllB2pbKpOZELlk+JB/pu/2mF4cJpc=;
 b=yPqRhYVlrwmQl8W78xUeH52CMj4g0lnHnwfaiKz3zri574tcr7sZrz6NFUoJJ/Zv0p
 Dr1rrhKdJfZOyRIP32u/aT99sqZL0zl9P2g7PwYhPHt8DTRDexHUz5OGq1OjW274znu0
 HLvN0lE4/Y67YRXOp+4NhOsczjr2PM5g7SmQ6vSV1BMzkT1l+72Wu8EjCKF1F6ge7uw7
 LeFGbO2ZZCx+r4+amL9nHTqKWNuHnm5OChbDg0Un2juN32Nog1PvurvOPiqvNjufU1Vw
 ODA29l29Bm6VRrqwgbG91ZySrWncDCMAS9v4ll49LW8E+/ltzs423rTDR3QF3KyeKAdB
 J3qg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] count: fix a word to fit in context
Date: Tue,  8 Mar 2016 09:13:39 +0900
Message-Id: <1457396019-32324-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1457396019-32324-1-git-send-email-sj38.park@gmail.com>
References: 
 <CAEjAshoJF=eb42=h0EAd47_x7u1hL80ZekU8qDcpDPYLjv8i-Q@mail.gmail.com>
 <1457396019-32324-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A word of quick quiz in `Parallel Counting Performance` subsection does
not fit with its context.  It says ``'count_stat.c' row of Table
'Statistical Counter Performance on Power-6' shows that the _update_
side scales linearly with the number of threads.''.  However, the table
shows read performance under 1 core and 32 cores, not update performance
under different number of cores.  Also, the context says about read-side
performance, not update-side performance.  This commit fix the word to
fit in the context by changing the word to _read_-side performance.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index 8f69a10..3a3ca80 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -3297,7 +3297,7 @@ courtesy of eventual consistency.
 \QuickQuiz{}
 	On the \url{count_stat.c} row of
 	Table~\ref{tab:count:Statistical Counter Performance on Power-6},
-	we see that the update side scales linearly with the number of
+	we see that the read-side scales linearly with the number of
 	threads.
 	How is that possible given that the more threads there are,
 	the more per-thread counters must be summed up?
-- 
1.9.1

