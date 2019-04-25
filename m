Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HICw4PyJnuMY1hzDWOONblvDU2OYy3D+zLEEX/YCho4=;
        b=UYhBlTTOeChE7xWEoW+1Pk7qXZljYx46ueBCXX6EEh5E4ux7L7At0gX9cjby7Eqj9D
         WsZc3l0Q+XcIc/NvmtctZIG5+F3g5uvbTkLVI3fYkGgmJarVfOxwK57DpbcL6623Gy76
         dFB0QTU3ui7vYvYtE/UpM3Q5uEmQ4Xy2flTa6cHGfl0DBei98mwbbIM/XlI2ORlPf+dx
         Kll2LhxgDrKCnXGrvpa0TKrMhp2qj629edtSNbiy/w4mWQls9rfBworNs+v0gJs8gadQ
         0K51+lz+BsHpTO3CQ6EHYXNoIj0sFIu7VL5qZBVJS+SEn54pQAqLAB/qMMnlGs7jJ9lR
         56Tg==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH v2 1/3] rcu: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
Date: Thu, 25 Apr 2019 16:29:52 +0800
Message-Id: <1556180994-16131-2-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1556180994-16131-1-git-send-email-junchangwang@gmail.com>
References: <1556180994-16131-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/rcu.c | 2 +-
 CodeSamples/defer/rcu.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/defer/rcu.c b/CodeSamples/defer/rcu.c
index 4b868cc..66792e5 100644
--- a/CodeSamples/defer/rcu.c
+++ b/CodeSamples/defer/rcu.c
@@ -35,7 +35,7 @@ void synchronize_rcu(void)
 
 	/* Advance to a new grace-period number, enforce ordering. */
 
-	rcu_gp_ctr += 2;
+	WRITE_ONCE(rcu_gp_ctr, rcu_gp_ctr + 2);
 	smp_mb();
 
 	/*
diff --git a/CodeSamples/defer/rcu.h b/CodeSamples/defer/rcu.h
index f493f8b..b49ab14 100644
--- a/CodeSamples/defer/rcu.h
+++ b/CodeSamples/defer/rcu.h
@@ -41,7 +41,7 @@ static inline void rcu_read_lock(void)
 	 * periodic per-thread processing.)
 	 */
 
-	__get_thread_var(rcu_reader_gp) = rcu_gp_ctr + 1;
+	__get_thread_var(rcu_reader_gp) = READ_ONCE(rcu_gp_ctr) + 1;
 	smp_mb();
 }
 
@@ -55,7 +55,7 @@ static inline void rcu_read_unlock(void)
 	 */
 
 	smp_mb();
-	__get_thread_var(rcu_reader_gp) = rcu_gp_ctr;
+	__get_thread_var(rcu_reader_gp) = READ_ONCE(rcu_gp_ctr);
 }
 
 extern void synchronize_rcu(void);
-- 
2.7.4

