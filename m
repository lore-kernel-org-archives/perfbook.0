Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37430 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbfDWN6D (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 23 Apr 2019 09:58:03 -0400
Received: by mail-pl1-f193.google.com with SMTP id w23so7593499ply.4
        for <perfbook@vger.kernel.org>; Tue, 23 Apr 2019 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qQb5x9UU5FGdx2ImYB0O4YkD4fySoxVZTd0Ld3ijRfw=;
        b=M0vUhpUhhIR3MBxDZz9csW/6EUmRYeNKpM9fZ0MRKv3kb5E768bghh7/vKxmMeTgx8
         dH2jT7TVMYMTfj2TDD3Q8OTgGLv40LKVi8n8LtxK8+DI1+9So2XUFKK7FcJN30oBrmCc
         8JvvxJhVclNaNA9xMT9qfIGSXBYssvLrDc6Vc9u5IuKGWRHcCTj2WrdSYColoTTdj29i
         Epm64MAm3mkN0Nwi6uFGDxQVe8u61lHEsf/NDDtxFvkk/dfw7IufZHEymNplX9PATVmv
         jNqn/+8mcGb8OQjFWQyVXal0dR7y0jLgnCQKZQ+EFK7EmHGh8JDDnmr2+QcWjEkQv3+H
         Rqig==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 1/4] rcu: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_reader_gp
Date: Tue, 23 Apr 2019 21:57:02 +0800
Message-Id: <1556027825-21106-2-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1556027825-21106-1-git-send-email-junchangwang@gmail.com>
References: <1556027825-21106-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>

Replace the plain accesses and the use of ACCESS_ONCE() with
READ_ONCE()/WRITE_ONCE(). And then update the tex file accordingly.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/rcu.c    | 5 +++--
 CodeSamples/defer/rcu.h    | 5 +++--
 appendix/toyrcu/toyrcu.tex | 8 ++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/CodeSamples/defer/rcu.c b/CodeSamples/defer/rcu.c
index 4b868cc..e4fddbc 100644
--- a/CodeSamples/defer/rcu.c
+++ b/CodeSamples/defer/rcu.c
@@ -35,7 +35,7 @@ void synchronize_rcu(void)
 
 	/* Advance to a new grace-period number, enforce ordering. */
 
-	rcu_gp_ctr += 2;
+	WRITE_ONCE(rcu_gp_ctr, READ_ONCE(rcu_gp_ctr) + 2);
 	smp_mb();
 
 	/*
@@ -45,7 +45,8 @@ void synchronize_rcu(void)
 
 	for_each_thread(t) {
 		while ((per_thread(rcu_reader_gp, t) & 0x1) &&
-		       ((per_thread(rcu_reader_gp, t) - rcu_gp_ctr) < 0)) {
+		       ((per_thread(rcu_reader_gp, t) -
+			 READ_ONCE(rcu_gp_ctr)) < 0)) {
 			/*@@@ poll(NULL, 0, 10); */
 			barrier();
 		}
diff --git a/CodeSamples/defer/rcu.h b/CodeSamples/defer/rcu.h
index f493f8b..534709e 100644
--- a/CodeSamples/defer/rcu.h
+++ b/CodeSamples/defer/rcu.h
@@ -41,7 +41,8 @@ static inline void rcu_read_lock(void)
 	 * periodic per-thread processing.)
 	 */
 
-	__get_thread_var(rcu_reader_gp) = rcu_gp_ctr + 1;
+	__get_thread_var(rcu_reader_gp) =
+		READ_ONCE(rcu_gp_ctr) + 1;
 	smp_mb();
 }
 
@@ -55,7 +56,7 @@ static inline void rcu_read_unlock(void)
 	 */
 
 	smp_mb();
-	__get_thread_var(rcu_reader_gp) = rcu_gp_ctr;
+	__get_thread_var(rcu_reader_gp) = READ_ONCE(rcu_gp_ctr);
 }
 
 extern void synchronize_rcu(void);
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index c0a45a8..d9a7055 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1223,7 +1223,7 @@ thread-local accesses to one, as is done in the next section.
  1 static void rcu_read_lock(void)
  2 {
  3   __get_thread_var(rcu_reader_gp) =
- 4     ACCESS_ONCE(rcu_gp_ctr) + 1;
+ 4     READ_ONCE(rcu_gp_ctr) + 1;
  5   smp_mb();
  6 }
  7 
@@ -1231,7 +1231,7 @@ thread-local accesses to one, as is done in the next section.
  9 {
 10   smp_mb();
 11   __get_thread_var(rcu_reader_gp) =
-12     ACCESS_ONCE(rcu_gp_ctr);
+12     READ_ONCE(rcu_gp_ctr);
 13 }
 14 
 15 void synchronize_rcu(void)
@@ -1240,12 +1240,12 @@ thread-local accesses to one, as is done in the next section.
 18 
 19   smp_mb();
 20   spin_lock(&rcu_gp_lock);
-21   ACCESS_ONCE(rcu_gp_ctr) += 2;
+21   WRITE_ONCE(rcu_gp_ctr, READ_ONCE(rcu_gp_ctr) + 2);
 22   smp_mb();
 23   for_each_thread(t) {
 24     while ((per_thread(rcu_reader_gp, t) & 0x1) &&
 25             ((per_thread(rcu_reader_gp, t) -
-26               ACCESS_ONCE(rcu_gp_ctr)) < 0)) {
+26               READ_ONCE(rcu_gp_ctr)) < 0)) {
 27       poll(NULL, 0, 10);
 28     }
 29   }
-- 
2.7.4

