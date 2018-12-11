Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dkevqERb6XF1pa/kctpCuHVFvccS8W5qL4t8/kdS6iA=;
        b=L9HZ92CN7O5yUa/jbvvuFlfcZXB4tyWPDUmFlquzJCBpwjxBcfaK2EuPLfyGQfOh0n
         I17vUOom7BriHwJCg+ozo6LAGFlAboo2Z4hORgzdarVHv+USI+oz2ET6q/kXiJfiC2xb
         PP/a2OARjQn828uj62AmTwtJiMcwbBzz6QT0f9drefml4uCgVBo45UaFRyPVxVKFldRZ
         WueDaVoifFmY4KVH3kGXX4WSmkwiYN982WPOXtu4Xihh7/C44Cbv3GWjAhQus2p/rUuu
         Ux0Ty15uPrSAKvJ2Mi/zWxqHtV63IxkPfvIZs5TuRyZMfsyOnxgotxKeZhhVF1FHgdvF
         Tamw==
Subject: [PATCH 2/4] CodeSamples/formal/litmus/api.h: Fix definition of
 cmpxchg()
References: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0cce337e-fd36-4a39-9852-fb9ee1837e4d@gmail.com>
Date: Wed, 12 Dec 2018 00:42:00 +0900
MIME-Version: 1.0
In-Reply-To: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>, Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From 2796715f236d5c152f6e559422e072b705e3d237 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 11 Dec 2018 20:49:16 +0900
Subject: [PATCH 2/4] CodeSamples/formal/litmus/api.h: Fix definition of cmpxchg()

Output of C-cmpxchg.litmus by litmus7 on PPC (old definition):
----------------------------------------------------
Test C-cmpxchg Allowed
Histogram (4 states)
2789  :>0:r1=0; 1:r1=0; x=0;
50452053:>0:r1=0; 1:r1=0; x=1;
36003 *>0:r1=1; 1:r1=0; x=1;
49509155:>0:r1=1; 1:r1=0; x=2;
Ok

Witnesses
Positive: 36003, Negative: 99963997
Condition exists (0:r1=1 /\ not (x=2)) is validated
Hash=3f625d680407ff822fb56f1a80834291
Observation C-cmpxchg Sometimes 36003 99963997
Time C-cmpxchg 43.37
----------------------------------------------------

Output of C-cmpxchg.litmus by litmus7 on PPC (new definition):
----------------------------------------------------
Test C-cmpxchg Allowed
Histogram (2 states)
50766497:>0:r1=0; 1:r1=0; x=1;
49233503:>0:r1=1; 1:r1=0; x=2;
No

Witnesses
Positive: 0, Negative: 100000000
Condition exists (0:r1=1 /\ not (x=2)) is NOT validated
Hash=3f625d680407ff822fb56f1a80834291
Observation C-cmpxchg Never 0 100000000
Time C-cmpxchg 35.20
----------------------------------------------------

herd7 says:
----------------------------------------------------
Test C-cmpxchg Allowed
States 2
0:r1=0; 1:r1=0; x=1;
0:r1=1; 1:r1=0; x=2;
No
Witnesses
Positive: 0 Negative: 2
Condition exists (0:r1=1 /\ not (x=2))
Observation C-cmpxchg Never 0 2
Time C-cmpxchg 0.01
Hash=1720691890ea69e35615997626680d6f
----------------------------------------------------

klitmus7 on PPC says:
----------------------------------------------------
Test C-cmpxchg Allowed
Histogram (2 states)
2019624 :>0:r1=0; 1:r1=0; x=1;
1980376 :>0:r1=1; 1:r1=0; x=2;
No

Witnesses
Positive: 0, Negative: 4000000
Condition exists (0:r1=1 /\ not (x=2)) is NOT validated
Hash=1720691890ea69e35615997626680d6f
Observation C-cmpxchg Never 0 4000000
Time C-cmpxchg 0.76
----------------------------------------------------

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/litmus/api.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/formal/litmus/api.h b/CodeSamples/formal/litmus/api.h
index 8bf0ba6..bb1e1c2 100644
--- a/CodeSamples/formal/litmus/api.h
+++ b/CodeSamples/formal/litmus/api.h
@@ -16,7 +16,7 @@
 #define smp_load_acquire(x) __atomic_load_n(x, __ATOMIC_ACQUIRE)
 #define cmpxchg(x, o, n) ({ \
 	typeof(o) __old = (o); \
-	__atomic_compare_exchange_n((x), &__old, (n), 1, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
+	__atomic_compare_exchange_n((x), &__old, (n), 0, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
 	__old; \
 })
 #endif
-- 
2.7.4


