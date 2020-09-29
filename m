Return-Path: <SRS0=tDn8=DG=gmail.com=junchang2020@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=vsIVZIZnHn3jRliLAeQtxD7Mqf2HRE4KmLHVTVrukAA=;
        b=jDwz4HRtBf7ICvtXwIjQ405k5tK3obgWQrgKVnmuhd8reKaUbUJo2mxrIGAFawGWG7
         vnHmpfu1UBPe/8+gGy3iPu2gS1s7yoIs46GKmUW191+XvNeKFVEXTP1erMnMZWLNTmI/
         X8iHGm5YUKZIYn2pB99IiSrlDkEEWhxUsAPJFbGno+VaUI7HRpIUoOSe5kewFVFM/Q3P
         DeXz+DgyLouKunPoTxddeGT0sLbwMhBa7y9PeACNfp1LFbBoqUJyEdq12XkaZtxPDpiD
         kKaFuRDugEzD5pX3rFOrIGVetHp75a2rcVkUX0jj2wazPHA+vMlZxA5XB+DyI9sQh+J8
         /RtQ==
Date: Tue, 29 Sep 2020 16:40:06 +0800
From: Junchang Wang <junchang2020@gmail.com>
Subject: [PATCH] api-gcc.h: fix typos in the functions atomic_add_*
Message-ID: <20200929084006.GA31703@HongKong.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

The typo in atomic_add_return() incurs tricky bugs. For example, the current
atomic_dec_return() is indeed an atomic_add_return(). A similar typo appears
in the function atomic_add_negative().

Signed-off-by: Junchang Wang <junchang2020@gmail.com>
---
 CodeSamples/api-pthreads/api-gcc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthreads/api-gcc.h
index fbbedf2..9ad8a68 100644
--- a/CodeSamples/api-pthreads/api-gcc.h
+++ b/CodeSamples/api-pthreads/api-gcc.h
@@ -140,7 +140,7 @@ static __inline__ int atomic_inc_and_test(atomic_t *v)
  */
 static __inline__ int atomic_add_negative(int i, atomic_t *v)
 {
-	return __atomic_add_fetch(&v->counter, 1, __ATOMIC_SEQ_CST) < 0;
+	return __atomic_add_fetch(&v->counter, i, __ATOMIC_SEQ_CST) < 0;
 }
 
 /**
@@ -152,7 +152,7 @@ static __inline__ int atomic_add_negative(int i, atomic_t *v)
  */
 static __inline__ int atomic_add_return(int i, atomic_t *v)
 {
-	return __atomic_add_fetch(&v->counter, 1, __ATOMIC_SEQ_CST);
+	return __atomic_add_fetch(&v->counter, i, __ATOMIC_SEQ_CST);
 }
 
 static __inline__ int atomic_sub_return(int i, atomic_t *v)
-- 
2.7.4

