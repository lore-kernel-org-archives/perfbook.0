Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JLGkEAOdHAdkHMp8tUwPPDmIBeod0oEPVqFsqc240LY=;
        b=Qy6hpaOKvYWGEedSQ2nqoquonNYBAYiHYAXXly19wSZLOWoZOWr8yr+aBa27ah4ebm
         Iy2Xsl5oJdJF3N/jJYHFWvdsc/3sQ52DNADnMp8+7VGf5jeGplmF5BzPaqPlsLVbWZMJ
         EFoYwD0Vl9FtBg7XDwELYxYMTpdi370mHUf1y6TcrTzrVejdC5bKLPSO81Eo/O4EgPpV
         s6R0w0qKTUULLEg3fhTUzXpv2+6qnvcQauFzcTkdaA3+HmC55YiIGeHoex6qLRlJBYZ8
         a8S07/+Wi0+s+9BetyQaaJER/j92wYOqF6ciM5K9JI14oS1LtU01LsH3mAj3CxpGMaLN
         8jqQ==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH v2 3/3] rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared variable rcu_gp_ctr
Date: Thu, 25 Apr 2019 16:29:54 +0800
Message-Id: <1556180994-16131-4-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1556180994-16131-1-git-send-email-junchangwang@gmail.com>
References: <1556180994-16131-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/rcu_qs.c | 2 +-
 CodeSamples/defer/rcu_qs.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/defer/rcu_qs.c b/CodeSamples/defer/rcu_qs.c
index 27e45f7..f3d0cd6 100644
--- a/CodeSamples/defer/rcu_qs.c
+++ b/CodeSamples/defer/rcu_qs.c
@@ -41,7 +41,7 @@ void synchronize_rcu(void)
 
 	/* Advance to a new grace-period number, enforce ordering. */
 
-	rcu_gp_ctr += 2;
+	WRITE_ONCE(rcu_gp_ctr, rcu_gp_ctr + 2);
 	smp_mb();
 
 	/*
diff --git a/CodeSamples/defer/rcu_qs.h b/CodeSamples/defer/rcu_qs.h
index 3bb45a4..d8be43e 100644
--- a/CodeSamples/defer/rcu_qs.h
+++ b/CodeSamples/defer/rcu_qs.h
@@ -59,14 +59,14 @@ static void rcu_read_unlock(void)
 static void rcu_quiescent_state(void)
 {
 	smp_mb();
-	__get_thread_var(rcu_reader_qs_gp) = ACCESS_ONCE(rcu_gp_ctr) + 1;
+	__get_thread_var(rcu_reader_qs_gp) = READ_ONCE(rcu_gp_ctr) + 1;
 	smp_mb();
 }
 
 static void rcu_thread_offline(void)
 {
 	smp_mb();
-	__get_thread_var(rcu_reader_qs_gp) = ACCESS_ONCE(rcu_gp_ctr);
+	__get_thread_var(rcu_reader_qs_gp) = READ_ONCE(rcu_gp_ctr);
 	smp_mb();
 }
 
-- 
2.7.4

