Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d2briWJQyzpbnJOU2zyz6FV6dOJyKiI9gOCQYl16wRk=;
 b=kxEihbbo8KIbySRiB9+OeNbAYd8oCX0KhfJHRTbIzMVK1D+z64WTtDcacIQkPdcJaI
 QgvYs4zdsxLaofZsBuMkEsXEhKgski8ly8n/JQ1OmqvBms42d2+h6U+iiInS7UZqP4XX
 a3Faj+GA1BeE8V3+L7rMZgWR7Q7UzC5Y0wWX6sLsiIjuDtzUE8NUjQu4r/4WRfZ77Nyb
 8gd/tCZTcC38tmRTGvxxJq1s2++evs8iRya8xfuhv6f68axhtfrT3GOicxH7GSLtsGJ1
 R6WK0XX0mw+KZ0Nmab21bdbkajQiDuOgLlvRWyTEtXGeaVzow3DZES5BdsI7qOKU2Qzc
 ursw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/3] locking: Fix a typo, 'a another'
Date: Tue, 17 Jul 2018 09:34:22 +0900
Message-Id: <20180717003422.27190-3-sj38.park@gmail.com>
In-Reply-To: <20180717003422.27190-1-sj38.park@gmail.com>
References: <20180717003422.27190-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 locking/locking.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 49d3e5e..7e93bdb 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -724,7 +724,7 @@ outside of a signal handler without blocking signals.

 	Therefore, it is illegal to acquire a lock that is acquired outside
 	of a signal handler without blocking signals while holding
-	a another lock that is acquired within a signal handler.
+	another lock that is acquired within a signal handler.
 } \QuickQuizEnd

 If a lock is acquired by the handlers for several signals, then each
-- 
2.10.0

