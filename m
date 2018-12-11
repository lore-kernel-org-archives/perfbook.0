Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Io4l0azmpd9S5zdDUnEDP4dz8wrcgtASHWVUGXibZac=;
        b=iTQCrx2Md+Lr2EphId2yzB47Bcy4N6NLKyRvOqcSCug04fh37VD1E6zBpD1AEoxizU
         R/e3Vqdvkmr53pY30MvQpAUZ4cU0mepZ7Sfjc5oNqy0XGO2ARBqyvbBVZD7B+jRsiL6y
         1x8/HnKmkaVjTXEznVlEIUJX8quJAX4I+hRiZjQv7l9GVUMykxXGelu//0TjHG4+KjDG
         Zv7gekoBjigLqLhNvJ+YAdsdCVfQLatooq14ZsRMCyHzegfW7l6KrcOHHc7dbpQn5mwu
         PKW4ou8tCaM30+X6O8YdP9Soa+lXT4979l4LMQUuLG5WmzEC70QFdjaNNg1DzCahU1EO
         F0xQ==
Subject: [PATCH 3/4] CodeSamples: Fix definition of cmpxchg() in api-gcc.h
References: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <98448fa1-c391-fdfe-22fa-803dacd72749@gmail.com>
Date: Wed, 12 Dec 2018 00:42:48 +0900
MIME-Version: 1.0
In-Reply-To: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>, Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From 7e7c3a20d08831cd64b77a4e8d8f693b4725ef89 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 11 Dec 2018 21:37:11 +0900
Subject: [PATCH 3/4] CodeSamples: Fix definition of cmpxchg() in api-gcc.h

Do the same change as CodeSamples/formal/litmus/api.h.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/api-pthreads/api-gcc.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthreads/api-gcc.h
index 3afe340..b66f4b9 100644
--- a/CodeSamples/api-pthreads/api-gcc.h
+++ b/CodeSamples/api-pthreads/api-gcc.h
@@ -168,8 +168,9 @@ struct __xchg_dummy {
 ({ \
 	typeof(*ptr) _____actual = (o); \
 	\
-	__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
-			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
+	__atomic_compare_exchange_n((ptr), (void *)&_____actual, (n), 0, \
+			__ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
+	_____actual; \
 })
 
 static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
-- 
2.7.4


