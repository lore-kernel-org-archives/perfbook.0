Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Qk7B0z3iu3IZZaW+fQ4e+Uk1kjUucb0/TZGnEqIcO4s=;
        b=fQksY4/h+8EAWb1WD9aAWxrlyM+hlKAdcLWM1T+rdzUMM1DBjOU5WCvwvZFi51UI6l
         ISSIAvioO+cqOFYZoobIxxVIpXSvTa+/6ODp3e47Macz60w0Xaw1rzCYYAgOV7n9Ruf/
         //QDqK9mhdCXKnabPxSPF7j5kbqkt6eE8jbrqG8U55X5YfrhTAUf3cG7h0wUEV67KNbw
         UJSbA9BsCf76CLeXUvGzm6DngKC4QBOsfAJsntJTKYwITp76LKEtEBQVO1k/J4F3loAb
         Ex4RcdTbESugFlIhmqff/izGk+qQgW7qkGkzk1oDHUdLiB/8ubr3swNSGojIrY84VMmj
         955w==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 3/4] rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared variable rcu_gp_ctr
Date: Tue, 23 Apr 2019 21:57:04 +0800
Message-Id: <1556027825-21106-4-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1556027825-21106-1-git-send-email-junchangwang@gmail.com>
References: <1556027825-21106-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Replace the plain accesses and the use of ACCESS_ONCE() with
READ_ONCE()/WRITE_ONCE(). And then update the tex file accordingly.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/rcu_qs.c |  5 +++--
 CodeSamples/defer/rcu_qs.h |  4 ++--
 appendix/toyrcu/toyrcu.tex | 10 +++++-----
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/CodeSamples/defer/rcu_qs.c b/CodeSamples/defer/rcu_qs.c
index 27e45f7..dc17162 100644
--- a/CodeSamples/defer/rcu_qs.c
+++ b/CodeSamples/defer/rcu_qs.c
@@ -41,7 +41,7 @@ void synchronize_rcu(void)
 
 	/* Advance to a new grace-period number, enforce ordering. */
 
-	rcu_gp_ctr += 2;
+	WRITE_ONCE(rcu_gp_ctr, READ_ONCE(rcu_gp_ctr) + 2);
 	smp_mb();
 
 	/*
@@ -51,7 +51,8 @@ void synchronize_rcu(void)
 
 	for_each_thread(t) {
 		while (rcu_gp_ongoing(t) &&
-		       ((per_thread(rcu_reader_qs_gp, t) - rcu_gp_ctr) < 0)) {
+		       ((per_thread(rcu_reader_qs_gp, t) -
+			 READ_ONCE(rcu_gp_ctr)) < 0)) {
 			/* @@@ poll(NULL, 0, 10); */
 			barrier();
 		}
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
 
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 39126d2..c25d205 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1704,7 +1704,7 @@ overhead.
  10 {
  11   smp_mb();
  12   __get_thread_var(rcu_reader_qs_gp) =
- 13     ACCESS_ONCE(rcu_gp_ctr) + 1;
+ 13     READ_ONCE(rcu_gp_ctr) + 1;
  14   smp_mb();
  15 }
  16
@@ -1712,7 +1712,7 @@ overhead.
  18 {
  19   smp_mb();
  20   __get_thread_var(rcu_reader_qs_gp) =
- 21     ACCESS_ONCE(rcu_gp_ctr);
+ 21     READ_ONCE(rcu_gp_ctr);
  22   smp_mb();
  23 }
  24
@@ -1764,7 +1764,7 @@ to prevent any code prior to the quiescent state (including possible
 RCU read-side critical sections) from being reordered
 into the quiescent state.
 Lines~12-13 pick up a copy of the global \co{rcu_gp_ctr}, using
-\co{ACCESS_ONCE()} to ensure that the compiler does not employ any
+\co{READ_ONCE()} to ensure that the compiler does not employ any
 optimizations that would result in \co{rcu_gp_ctr} being fetched
 more than once,
 and then adds one to the value fetched and stores it into
@@ -1837,12 +1837,12 @@ quiescent state.
   4
   5   smp_mb();
   6   spin_lock(&rcu_gp_lock);
-  7   rcu_gp_ctr += 2;
+  7   WRITE_ONCE(rcu_gp_ctr, READ_ONCE(rcu_gp_ctr) + 2);
   8   smp_mb();
   9   for_each_thread(t) {
  10     while (rcu_gp_ongoing(t) &&
  11            ((per_thread(rcu_reader_qs_gp, t) -
- 12              rcu_gp_ctr) < 0)) {
+ 12              READ_ONCE(rcu_gp_ctr)) < 0)) {
  13       poll(NULL, 0, 10);
  14     }
  15   }
-- 
2.7.4

