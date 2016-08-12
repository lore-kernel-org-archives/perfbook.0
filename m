Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=wIzTi5WXwTOdrkUF9BQtG+tRFTLJ28iu9g32JYU62wo=;
 b=vFtYR1tJXXo5q3533+i59RxHj8w8cMnmyHCrlg3iojR93oN+4hXowi5kp02hQENbF/
 bCAHoO53CArpt2CZKDHmNjUxJNTsbe0qfcEr1NkOhPz3WDsOh1Y+iIH8s5UbFjAilWk6
 2gQxbzGn17xT2HgVZuCIZ/cl5COldh5Yp4OXm8AwlsDa2bFoO3L02zRh9I9ct6+ePl4l
 g+OuoDagMj1CiO04JTaWaUqHtHH0L1MBrIlB1nXK95ZoEhFjdn14kLxeZ/mlKtDH708E
 DTadnzVZ+ZU4T0Dr/IsZb44bTSa6WdjHwoUGP8g4+DQiuFbQgQMDH0HNHxtNOodMzpwZ
 roNQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Some more hyphenation of compound words
Message-ID: <fde6fc31-0847-2395-0e7d-ecefcdb50444@gmail.com>
Date: Fri, 12 Aug 2016 18:12:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9761c723cb8a53b257878fd4fff0b042d0ccebbb Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 10 Aug 2016 20:30:56 +0900
Subject: [PATCH] Some more hyphenation of compound words

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/criteria.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
index a84f301..f2f4602 100644
--- a/SMPdesign/criteria.tex
+++ b/SMPdesign/criteria.tex
@@ -48,7 +48,7 @@ contention, overhead, read-to-write ratio, and complexity:
 	This may be lock contention, memory contention, or a host
 	of other performance killers.
 \item[Work-to-Synchronization Ratio:]  A uniprocessor,
-	single-threaded, non-preemptible, and non-interruptible\footnote{
+	single\-/threaded, non-preemptible, and non\-/interruptible\footnote{
 		Either by masking interrupts or by being oblivious to them.}
 	version of a given parallel
 	program would not need any synchronization primitives.
-- 
1.9.1

