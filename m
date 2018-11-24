Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=k34ju+Z191dGRNo/BMUqkchuIyRQDpyogHiLvgXHblM=;
        b=k/tDrTZPQUTD+QSZqoI+psExu81Fz41iGTeHeDfC+ocyjKXmZIwNxCg/U+JzA8YXFL
         i0WodYbHxpq4ZKkDYmRxUFH2gZVsiRBcEowUQ3MzzcOn8QUqkQJpy2o8fh/5ZdpDULEo
         FOvUJQxfgyugSXMoSEJTjjUDF4H2Fi1TMKVHq74mlGpJvX86Oz6LSXuNC8v1iyNXhQfc
         R7qYmQWm2JW5p8+RPB9EX/9+rfm4mhsOpQBjP0rlpXJW1+O8XIjfIyB5dISxWNZQnv6U
         T1MoSo406VxeRfjOSq9oYDklLofdHP1mJAzmT0/Nj4+YXAKtov4t0Mn+zZtc2vduWJhB
         hpWw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 1/3] route_hazptr: Add dependency to hazptr
Date: Sat, 24 Nov 2018 17:34:52 +0800
Message-Id: <1543052094-8306-2-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1543052094-8306-1-git-send-email-junchangwang@gmail.com>
References: <1543052094-8306-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Target route_hazptr depends on hazptr.c and hazptr.h. So add this dependency to Makefile.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
index 5a08c1f..270c151 100644
--- a/CodeSamples/defer/Makefile
+++ b/CodeSamples/defer/Makefile
@@ -123,7 +123,7 @@ rcu_sig: rcu_sig.c rcu_sig.h ../api.h rcutorture.h
 rcu_ts: rcu_ts.c rcu_ts.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu_ts -DTEST rcu_ts.c -lpthread
 
-route_hazptr: route_hazptr.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
+route_hazptr: route_hazptr.c hazptr.c hazptr.h ../api.h ../lib/random.h ../lib/random.c routetorture.h
 	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.c -lpthread
 
 route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
-- 
2.7.4

