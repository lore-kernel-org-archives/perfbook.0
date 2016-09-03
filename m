Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=EbnUXn2G4yqQn9rNbcDjCNri35zki+nqogVDccCRYAQ=;
 b=udqO8xw6PuXZ14CLXqHhOOBpg0a8LcKXQIsLH6f2+8y9hppM2D9wGVmWWlOh8Z6Jng
 1TSLAjNmoGadwwKrTASh7IcaOyqQ89GOz5t9oENAXXr2WWNsPZvcyL8CB4LorRc7IpKJ
 jbx8Ui56UnYJS9xJDAYATslSHjNSAwEZdg5HCcjOYvvm/DVvhYN8ZFBDPcoYVAJ5kbhU
 Yi2HJhcyeqY0u4mWz2HkcZvndb4P2lLBM30UlGz2YeTWmrWvj7JOgR+cMqRJCce711Jw
 +jF4arTT85cSa5BZFfF19Gon5iESiF3xZQeP0WVGKfXNYJyRGS8rD499XqzZhfsfu3ra
 6/9A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] More hyphenation of long compound word
Message-ID: <c343372d-8371-f8b3-eb40-1647c20cf7c8@gmail.com>
Date: Sun, 4 Sep 2016 00:21:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0ab1a7f060fe89570a189e481e11bd2f16f23a7e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 4 Sep 2016 00:12:28 +0900
Subject: [PATCH] More hyphenation of long compound word

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 locking/locking.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 48a3520..c5e45bf 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1068,7 +1068,7 @@ Even assuming perfect scalability, \emph{one hundred} CPUs would
 be required to keep up with a single CPU executing the same code
 without locking.

-This situation underscores the synchronization-granularity
+This situation underscores the synchronization\-/granularity
 tradeoff discussed in Section~\ref{sec:SMPdesign:Synchronization Granularity},
 especially Figure~\ref{fig:SMPdesign:Synchronization Efficiency}:
 Too coarse a granularity will limit scalability, while too fine a
-- 
1.9.1

