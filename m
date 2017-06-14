Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Pv2kcM4qRtvCnpgZPDLQVVuv+JaRxjLu+FR8EasyGU4=;
 b=mfR9nKUnDMRziIp+pbFQCl4uiS2DOvA4jncVscJOzE0Q6TlZa0XlZf5tpv/KStP1Q1
 XT1fsqszt+pUEb+lgj+K4IUoaUStpH4qhlvXzlKHFfvelVBpuT2sIdtqtvPImUV3xYes
 0oQ6KWcTpD01C016ABowrEj9oNLElx+IRhv41/9aUxne/IfONlo176VBkB0ClG98cxNK
 OG+2PcuoGXQgPfllPO6bNftQpKB/etUF54X/pZwpitxy94n+LvnJeDiNCQXQZ3PkBKv4
 rYTT2SJDVEVZ2xrxTp7csos0fFi2yGKCOY8/UAFXXwGkgMOXUpW5exoX9W05vsEUfCJ5
 rozw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 5/5] rcu_rcpls: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Date: Wed, 14 Jun 2017 23:45:04 +0800
Message-Id: <1497455104-14102-6-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
References: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/rcu_rcpls.c  |  6 +++---
 CodeSamples/defer/rcu_rcpls.h  |  2 +-
 CodeSamples/defer/rcutorture.h |  2 +-
 appendix/toyrcu/toyrcu.tex     | 14 +++++++-------
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/CodeSamples/defer/rcu_rcpls.c b/CodeSamples/defer/rcu_rcpls.c
index 8dbf624..3018ae9 100644
--- a/CodeSamples/defer/rcu_rcpls.c
+++ b/CodeSamples/defer/rcu_rcpls.c
@@ -28,7 +28,7 @@ static void flip_counter_and_wait(int ctr)
 	int i;
 	int t;

-	ACCESS_ONCE(rcu_idx) = ctr + 1;
+	WRITE_ONCE(rcu_idx, ctr + 1);
 	i = ctr & 0x1;
 	smp_mb();
 	for_each_thread(t) {
@@ -46,10 +46,10 @@ void synchronize_rcu(void)
 	int oldctr;

 	smp_mb();
-	oldctr = ACCESS_ONCE(rcu_idx);
+	oldctr = READ_ONCE(rcu_idx);
 	smp_mb();
 	spin_lock(&rcu_gp_lock);
-	ctr = ACCESS_ONCE(rcu_idx);
+	ctr = READ_ONCE(rcu_idx);
 	if (ctr - oldctr >= 3) {

 		/*
diff --git a/CodeSamples/defer/rcu_rcpls.h b/CodeSamples/defer/rcu_rcpls.h
index a9c7723..6825270 100644
--- a/CodeSamples/defer/rcu_rcpls.h
+++ b/CodeSamples/defer/rcu_rcpls.h
@@ -47,7 +47,7 @@ static void rcu_read_lock(void)

 	n = __get_thread_var(rcu_nesting);
 	if (n == 0) {
-		i = ACCESS_ONCE(rcu_idx) & 0x1;
+		i = READ_ONCE(rcu_idx) & 0x1;
 		__get_thread_var(rcu_read_idx) = i;
 		__get_thread_var(rcu_refcnt)[i]++;
 	}
diff --git a/CodeSamples/defer/rcutorture.h b/CodeSamples/defer/rcutorture.h
index c5bc87e..ca03df9 100644
--- a/CodeSamples/defer/rcutorture.h
+++ b/CodeSamples/defer/rcutorture.h
@@ -271,7 +271,7 @@ void *rcu_read_stress_test(void *arg)
 			n_mberror++;
 		rcu_read_lock_nest();
 		for (i = 0; i < 100; i++)
-			ACCESS_ONCE(garbage)++;
+			WRITE_ONCE(garbage, READ_ONCE(garbage) + 1);
 		rcu_read_unlock_nest();
 		pc = p->pipe_count;
 		rcu_read_unlock();
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index b4882c3..5e74afa 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1003,7 +1003,7 @@ concurrent RCU updates.
   5
   6   n = __get_thread_var(rcu_nesting);
   7   if (n == 0) {
-  8     i = ACCESS_ONCE(rcu_idx) & 0x1;
+  8     i = READ_ONCE(rcu_idx) & 0x1;
   9     __get_thread_var(rcu_read_idx) = i;
  10     __get_thread_var(rcu_refcnt)[i]++;
  11   }
@@ -1044,7 +1044,7 @@ so that line~8 of
 Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
 must mask off the low-order bit.
 We also switched from using \co{atomic_read()} and \co{atomic_set()}
-to using \co{ACCESS_ONCE()}.
+to using \co{READ_ONCE()}.
 The data is also quite similar, as shown in
 Figure~\ref{fig:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data},
 with \co{rcu_idx} now being a \co{long} instead of an
@@ -1058,7 +1058,7 @@ with \co{rcu_idx} now being a \co{long} instead of an
   3   int i;
   4   int t;
   5
-  6   ACCESS_ONCE(rcu_idx) = ctr + 1;
+  6   WRITE_ONCE(rcu_idx, ctr + 1);
   7   i = ctr & 0x1;
   8   smp_mb();
   9   for_each_thread(t) {
@@ -1075,10 +1075,10 @@ with \co{rcu_idx} now being a \co{long} instead of an
  20   int oldctr;
  21
  22   smp_mb();
- 23   oldctr = ACCESS_ONCE(rcu_idx);
+ 23   oldctr = READ_ONCE(rcu_idx);
  24   smp_mb();
  25   spin_lock(&rcu_gp_lock);
- 26   ctr = ACCESS_ONCE(rcu_idx);
+ 26   ctr = READ_ONCE(rcu_idx);
  27   if (ctr - oldctr >= 3) {
  28     spin_unlock(&rcu_gp_lock);
  29     smp_mb();
@@ -1106,7 +1106,7 @@ These are similar to those in
 Figure~\ref{fig:app:toyrcu:RCU Update Using Per-Thread Reference-Count Pair}.
 The differences in \co{flip_counter_and_wait()} include:
 \begin{enumerate}
-\item	Line~6 uses \co{ACCESS_ONCE()} instead of \co{atomic_set()},
+\item	Line~6 uses \co{WRITE_ONCE()} instead of \co{atomic_set()},
 	and increments rather than complementing.
 \item	A new line~7 masks the counter down to its bottom bit.
 \end{enumerate}
@@ -1116,7 +1116,7 @@ The changes to \co{synchronize_rcu()} are more pervasive:
 \item	There is a new \co{oldctr} local variable that captures
 	the pre-lock-acquisition value of \co{rcu_idx} on
 	line~23.
-\item	Line~26 uses \co{ACCESS_ONCE()} instead of \co{atomic_read()}.
+\item	Line~26 uses \co{READ_ONCE()} instead of \co{atomic_read()}.
 \item	Lines~27-30 check to see if at least three counter flips were
 	performed by other threads while the lock was being acquired,
 	and, if so, releases the lock, does a memory barrier, and returns.
-- 
2.7.4

