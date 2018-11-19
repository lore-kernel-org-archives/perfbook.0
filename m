Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0iwa8yHIevR5jak1XoK8qN5RuQSlpQWM8RgjLllD/mY=;
        b=EsmUCrwSVSilq5TmaWW1Qk3bFLs2J5DatQcsHV5LXTVVzEe9n3v1ATNLZa04Wjn52g
         PM6y+CoDh+svDBgcrBggt+Kx1gib++H2IhBSc7O9WmX77Y0gSqBJ6FNYgqqYjo7EcT7P
         wCPGeZWGvPv9LQ9F5KIzEuH5O17J/UMUe0S0kpP0lJ/rV/8o4bE9rSJTqKLqt5LQ3I/k
         Zv/xLzqEIdhD9RPX31Dm9H8jHQnqNU8LeuhNVCp8WTMPb4pxWqwaZbvFRcF1gzRXv8UB
         aP/BFiyqukv4UxtchkYdhiexjgqpUrIXkki4EA6yomohrb6yic1alJLMg5QpsaTdBxTN
         FEsA==
Subject: [PATCH 2/3] locking: Get rid of ACCESS_ONCE()
References: <54d29326-1695-4b98-48a7-ff9c1439f448@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5e2de0c9-342c-80b7-70ae-8e82a1281a58@gmail.com>
Date: Tue, 20 Nov 2018 00:19:42 +0900
MIME-Version: 1.0
In-Reply-To: <54d29326-1695-4b98-48a7-ff9c1439f448@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 99b7e15342fda1591838efc068d2624457afd5b0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 19 Nov 2018 23:02:09 +0900
Subject: [PATCH 2/3] locking: Get rid of ACCESS_ONCE()

Also add READ_ONCE() and WRITE_ONCE() to racy accesses in
xchglock.c.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/locking/xchglock.c | 10 +++++-----
 locking/locking.tex            | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/CodeSamples/locking/xchglock.c b/CodeSamples/locking/xchglock.c
index 5877920..a5e3403 100644
--- a/CodeSamples/locking/xchglock.c
+++ b/CodeSamples/locking/xchglock.c
@@ -28,7 +28,7 @@ typedef int xchglock_t;				//\lnlbl{typedef}
 void xchg_lock(xchglock_t *xp)			//\lnlbl{lock:b}
 {
 	while (xchg(xp, 1) == 1) {		//\lnlbl{lock:atmxchg}
-		while (*xp == 1)		//\lnlbl{lock:inner:b}
+		while (READ_ONCE(*xp) == 1)	//\lnlbl{lock:inner:b}
 			continue;		//\lnlbl{lock:inner:e}
 	}
 }						//\lnlbl{lock:e}
@@ -59,9 +59,9 @@ void *test_xchg_lock(void *arg)
 
 	run_on(me);
 	atomic_inc(&nthreadsrunning);
-	while (ACCESS_ONCE(goflag) == GOFLAG_INIT)
+	while (READ_ONCE(goflag) == GOFLAG_INIT)
 		poll(NULL, 0, 1);
-	while (ACCESS_ONCE(goflag) == GOFLAG_RUN) {
+	while (READ_ONCE(goflag) == GOFLAG_RUN) {
 		xchg_lock(&testlock);
 		if (owner != -1)
 			lockerr++;
@@ -86,11 +86,11 @@ int main(int argc, char *argv[])
 	smp_mb();
 	while (atomic_read(&nthreadsrunning) < nthreads)
 		poll(NULL, 0, 1);
-	goflag = GOFLAG_RUN;
+	WRITE_ONCE(goflag, GOFLAG_RUN);
 	smp_mb();
 	poll(NULL, 0, 10000);
 	smp_mb();
-	goflag = GOFLAG_STOP;
+	WRITE_ONCE(goflag, GOFLAG_STOP);
 	smp_mb();
 	wait_all_threads();
 	printf("lockacqs = %lu, lockerr = %lu\n", lockacqs, lockerr);
diff --git a/locking/locking.tex b/locking/locking.tex
index 92ed2f2..874fb3b 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1463,7 +1463,7 @@ void force_quiescent_state(struct rcu_node *rnp_leaf)
 	struct rcu_node *rnp_old = NULL;
 
 	for (; rnp != NULL; rnp = rnp->parent) {	\lnlbl[loop:b]
-		ret = (ACCESS_ONCE(gp_flags)) ||	\lnlbl[flag_set]
+		ret = (READ_ONCE(gp_flags)) ||		\lnlbl[flag_set]
 		       !raw_spin_trylock(&rnp->fqslock);\lnlbl[trylock]
 		if (rnp_old != NULL)			\lnlbl[non_NULL]
 			raw_spin_unlock(&rnp_old->fqslock);\lnlbl[rel1]
@@ -1471,11 +1471,11 @@ void force_quiescent_state(struct rcu_node *rnp_leaf)
 			return;				\lnlbl[return]
 		rnp_old = rnp;				\lnlbl[save]
 	}						\lnlbl[loop:e]
-	if (!ACCESS_ONCE(gp_flags)) {			\lnlbl[flag_not_set]
-		ACCESS_ONCE(gp_flags) = 1;		\lnlbl[set_flag]
+	if (!READ_ONCE(gp_flags)) {			\lnlbl[flag_not_set]
+		WRITE_ONCE(gp_flags, 1);		\lnlbl[set_flag]
 		do_force_quiescent_state();		\lnlbl[invoke]
 		schedule_timeout_interruptible(HZ / 10);\lnlbl[wait]
-		ACCESS_ONCE(gp_flags) = 0;		\lnlbl[clr_flag]
+		WRITE_ONCE(gp_flags, 0);		\lnlbl[clr_flag]
 	}
 	raw_spin_unlock(&rnp_old->fqslock);		\lnlbl[rel2]
 }
@@ -1649,7 +1649,7 @@ the lock, thus marking it as having been released.
 \QuickQuizAnswer{
 	This can be a legitimate implementation, but only if
 	this store is preceded by a memory barrier and makes use
-	of \co{ACCESS_ONCE()}.
+	of \co{WRITE_ONCE()}.
 	The memory barrier is not required when the \co{xchg()}
 	operation is used because this operation implies a
 	full memory barrier due to the fact that it returns
-- 
2.7.4


