Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CkQTArRj++sZfv6/WcaV+o2AhZItMHPzdE8L16LzUQQ=;
        b=bDQxxS0DZ8IKIM3uu9wVUBnLl9azghnNqd594SJUO/Jh9j9p95pIvmxVJfuihXfd+s
         xMvUB9XHqpH3qLCNtpfO4q56r4KxQhgUBW2PTpMZCm7yvPg5p95gyBWpnJxuRTyD57BY
         poZL8f0gkiEuFy8gH9/U27bk2YJ51mpAw5J+Z2tlx8evBRjrxaCWeLij1htd4A5lukxn
         Lik5gw7BJWt5z7shKhho6s0zNKqmlIyN1DwJq1CX7Q8WIgslXOLMCIqdaJFu7ZbTvAxf
         6cyHdD6a7XDkq/5LYyhoe+R+hx7x883PltdGXNOqoLFCJVRKVcdehFjNW6BdfUievRBy
         UO2A==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/5] toolsoftrade: Polish an ambiguous sentence
Date: Fri, 26 Apr 2019 09:57:00 +0900
Message-Id: <20190426005704.10952-2-sj38.park@gmail.com>
In-Reply-To: <20190426005704.10952-1-sj38.park@gmail.com>
References: <20190426005704.10952-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A sentence calls a 'signal or interrupt handler' as 'interrupt handler'.
This commit modifies the sentence to call it just a handler to minimize
any confusion.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 4e0764d..1cf118b 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2365,8 +2365,8 @@ for other accesses to that same variable:
 	All other code must use \co{READ_ONCE()} and \co{WRITE_ONCE()}.
 \item	A shared variable is only accessed by a given CPU or thread
 	and by a signal or interrupt handler running in that CPU's
-	or thread's context, and the interrupt handler always restores
-	the values of any variables that it has written before return.
+	or thread's context, and the handler always restores the values of any
+	variables that it has written before return.
 	The handler can use plain loads and stores, as can any code
 	that has prevented the handler from being invoked, that is,
 	code that has blocked signals and/or interrupts.
-- 
2.10.0

