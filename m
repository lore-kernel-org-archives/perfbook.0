Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=d2V4SQ6eV8jde3iOv/BEP9Axl7/eKxJLAK0RHI9IQ+4=;
 b=UxmgyPzwcltKfqGtJYIVISR5EnQHgBU38v25kdghDsal9Cq6mSpAS75zGPUmyTje5E
 mdls0cinAo1cpJUwLwxBUvGTgP2vNO1XWu2EVXsDP/RLrnY+dEN+jQdwLmkK7N18al48
 68GqpAhJggEpB2iL0I/xt4nQbqEd9riibcnGoRE5n1DbRUc03VR7rjMN1vjtBtTpo6Dk
 u2lt+8MEfLX6BGtE09e6zsxN6HJ6PM2ScmSCP0Zh2wqUEIqnn2UFSDlYmb+AuzTrE336
 0CvSxPua0D2BAbadrbXGEB7O9slpXxQc9GbjgLx1iqvEOpdgvNk0ZSQBmt/mroqQQYjN
 Ffhg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] rt: Add reference to 'CPU Isolation' Figure
Message-ID: <696869d9-ec61-486c-1ec9-410d24db040b@gmail.com>
Date: Wed, 21 Sep 2016 23:35:54 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 477cba521e27c927375b393ce5547ec824f0a05c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 21 Sep 2016 23:27:13 +0900
Subject: [PATCH] rt: Add reference to 'CPU Isolation' Figure

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 rt/rt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rt/rt.tex b/rt/rt.tex
index e73ba0a..88693d1 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -780,7 +780,7 @@ Section~\ref{sec:rt:Event-Driven Real-Time Support}.

 A final approach is simply to get everything out of the way of the
 real-time process, clearing all other processing off of any CPUs that
-this process needs.
+this process needs, as shown in Figure~\ref{fig:rt:CPU Isolation}.
 This was implemented in the 3.10 Linux kernel via the \co{CONFIG_NO_HZ_FULL}
 Kconfig parameter~\cite{FredericWeisbecker2013nohz}.
 % Need to fweisbec citation's URL. @@@
-- 
1.9.1

