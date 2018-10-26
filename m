Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=aV+DR2n8VEDOI4+E1Qcv3YPjUnamgmHkzYLbDFQqqHw=;
        b=mIDUr38LLdUlRrJYRtXckzJSd2xPA5i1KY+DN+JTQDBYU+3tsHA/TTan6YMLTYjbxc
         3Rj/KkuiAaVH5fk5JOtwJ0ICpnLQ/P2wka/B+2nNgqqiO3ZiveLaQuO3svUeJ6AXSgWD
         9m0xp7jVYeHlOdn4mM7EJClyXtB9v9+shX0tycm5Wt6IS3y+E8cwJ2KTTJxji6Pgu5Lq
         7zFnQUTd6SC5ndicRpScH5PhU4GvoBrHB25DosZPwlsUhfa+bxm2hviNS4UPhMvIyTvk
         4q/F9N5/S1aZtmRIntfCsUVS5gyZHBqdcyE2y/WRTwbyHo6ExpYon6E0W7bvEV1p0PhT
         wPuA==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] atomic_cmpxchg: Handle spurious failure of __atomic_compare_exchange_n in Power8 and ARMv8
Date: Sat, 27 Oct 2018 00:03:25 +0800
Message-Id: <1540569805-7066-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com, akiyks@gmail.com, perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

If the 4th parameter (field *weak*) of __atomic_compare_exchange_n is set, it
may refuse to perform the CAS operation and return a failure, even if the value
of field *old* is equal to the content of the specified memory location. This
happens in architectures where LL/SC is used to emulate CAS primitive (e.g., PPC
and ARM).

This patch returns the *old* value if __atomic_compare_exchange_n has been
successfully performed; otherwise, *old*+1 is returned, which forces the caller
to retry the CAS loop.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
Signed-off-by: kira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/api-pthreads/api-gcc.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthreads/api-gcc.h
index 1dd26ca..3afe340 100644
--- a/CodeSamples/api-pthreads/api-gcc.h
+++ b/CodeSamples/api-pthreads/api-gcc.h
@@ -168,9 +168,8 @@ struct __xchg_dummy {
 ({ \
 	typeof(*ptr) _____actual = (o); \
 	\
-	(void)__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
-					  __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
-	_____actual; \
+	__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
+			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
 })
 
 static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
-- 
2.7.4

