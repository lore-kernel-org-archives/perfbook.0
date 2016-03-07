Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nAHlYt+O3pEKQcllB2pbKpOZELlk+JB/pu/2mF4cJpc=;
 b=HIBkW8RV3QiSMnW1veV9lQCaXIVXx0vbkPWXMhu9pni/gmgaUujK1ByNcAUrcehbuy
 li92NxyBtqmid+F2An58/vQYudOqW/QwUpvwHJ36wAjJ6ApTeWa5SS7SMhTx9VnBPyAx
 CHc2ELGwG5AZoa+jYyR118FkseTtjG6ZqT48ZdvU4ZKyv37sAF7C5B/9yy+fNsdR8aXX
 LZ9LQbuJUacqLMp8Nx1kXSJyKCNqsiWrC7W2uDhqmgConuQ66C3Yvs9F9cDI2uJNUL+f
 6ZXi7P3ftkvoYt/JeiLkO+C2jU2JPxQbQRuTFUFYhvRBAdbosm8AAIPvQvh/dkKyNdqa
 6rTg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] count: fix a word to fit in context
Date: Tue,  8 Mar 2016 08:42:32 +0900
Message-Id: <1457394152-32110-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1457394152-32110-1-git-send-email-sj38.park@gmail.com>
References: <1457394152-32110-1-git-send-email-sj38.park@gmail.com>
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

