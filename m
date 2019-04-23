Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XYK3P8OOdWDPGjqHraT7kWawaAb07POoQr6Wh7O6gFA=;
        b=BD16OXRRo6XB5iijK4tVgp4B4hMsH36PkKuQlVswg6zBR0K8AkHRAZbXme0gdwHu6O
         6HrTCU/X32pbYw1wvNR59dPsgR61Zp8NeiN1ZzEultt3sTRH+pthPWstX0k8GCCO7d/Y
         C/1hDX9q3yMuErVk0FBwCkLq8CKD9C9M42PRYuXgSJuJg3RzCuSBJ3lcKaBv4Dj6HZT5
         JhQpBBlVS2l2LlCdj5TsjUhHMmdNPpm3WQNllyAowoJ68/tfvjQ8NZalKeyqWLo+rvK2
         KoGLQuobsvJynM9qfUr/jqNtMp1+xAQZ0uIx8D4QNuEahTrdpE/BhdEwsxN0KREJG0qx
         YS8g==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 2/4] rcu_nest: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
Date: Tue, 23 Apr 2019 21:57:03 +0800
Message-Id: <1556027825-21106-3-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1556027825-21106-1-git-send-email-junchangwang@gmail.com>
References: <1556027825-21106-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Replace the plain accesses and the use of ACCESS_ONCE() with
READ_ONCE()/WRITE_ONCE(). And then update the tex file accordingly.

Remove the goto statement in rcu_read_lock() because it seems this goto
logic has been discarded. If we should keep this code snippet, could you
please let me know the goal of this code snippet? Then we should update
the tex file accordingly.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/rcu_nest.c | 5 +++--
 CodeSamples/defer/rcu_nest.h | 8 +-------
 appendix/toyrcu/toyrcu.tex   | 8 ++++----
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/CodeSamples/defer/rcu_nest.c b/CodeSamples/defer/rcu_nest.c
index 64e4087..845be6f 100644
--- a/CodeSamples/defer/rcu_nest.c
+++ b/CodeSamples/defer/rcu_nest.c
@@ -35,7 +35,7 @@ void synchronize_rcu(void)
 
 	/* Advance to a new grace-period number, enforce ordering. */
 
-	rcu_gp_ctr += RCU_GP_CTR_BOTTOM_BIT;
+	WRITE_ONCE(rcu_gp_ctr, READ_ONCE(rcu_gp_ctr) + RCU_GP_CTR_BOTTOM_BIT);
 	smp_mb();
 
 	/*
@@ -45,7 +45,8 @@ void synchronize_rcu(void)
 
 	for_each_thread(t) {
 		while (rcu_gp_ongoing(t) &&
-		       ((per_thread(rcu_reader_gp, t) - rcu_gp_ctr) < 0)) {
+		       ((per_thread(rcu_reader_gp, t) -
+			 READ_ONCE(rcu_gp_ctr)) < 0)) {
 			/*@@@ poll(NULL, 0, 10); */
 			barrier();
 		}
diff --git a/CodeSamples/defer/rcu_nest.h b/CodeSamples/defer/rcu_nest.h
index bcc4cde..7bb99bc 100644
--- a/CodeSamples/defer/rcu_nest.h
+++ b/CodeSamples/defer/rcu_nest.h
@@ -49,18 +49,12 @@ static void rcu_read_lock(void)
 	 */
 
 	rrgp = &__get_thread_var(rcu_reader_gp);
-retry:
 	tmp = *rrgp;
 	if ((tmp & RCU_GP_CTR_NEST_MASK) == 0)
-		tmp = rcu_gp_ctr;
+		tmp = READ_ONCE(rcu_gp_ctr);
 	tmp++;
 	*rrgp = tmp;
 	smp_mb();
-	if (((tmp & RCU_GP_CTR_NEST_MASK) == 1) &&
-	    ((rcu_gp_ctr - tmp) > (RCU_GP_CTR_NEST_MASK << 8)) != 0) {
-		(*rrgp)--;
-		goto retry;
-	}
 }
 
 static void rcu_read_unlock(void)
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index d9a7055..39126d2 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1420,7 +1420,7 @@ variables.
  6   rrgp = &__get_thread_var(rcu_reader_gp);
  7   tmp = *rrgp;
  8   if ((tmp & RCU_GP_CTR_NEST_MASK) == 0)
- 9     tmp = ACCESS_ONCE(rcu_gp_ctr);
+ 9     tmp = READ_ONCE(rcu_gp_ctr);
 10   tmp++;
 11   *rrgp = tmp;
 12   smp_mb();
@@ -1440,13 +1440,13 @@ variables.
 26 
 27   smp_mb();
 28   spin_lock(&rcu_gp_lock);
-29   ACCESS_ONCE(rcu_gp_ctr) +=
-30     RCU_GP_CTR_BOTTOM_BIT;
+29   WRITE_ONCE(rcu_gp_ctr, READ_ONCE(rcu_gp_ctr) +
+30                           RCU_GP_CTR_BOTTOM_BIT);
 31   smp_mb();
 32   for_each_thread(t) {
 33     while (rcu_gp_ongoing(t) &&
 34            ((per_thread(rcu_reader_gp, t) -
-35              rcu_gp_ctr) < 0)) {
+35              READ_ONCE(rcu_gp_ctr)) < 0)) {
 36       poll(NULL, 0, 10);
 37     }
 38   }
-- 
2.7.4

