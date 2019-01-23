Return-Path: <akys@qa2.so-net.ne.jp>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qa2.so-net.ne.jp;
	s=sn2018; t=1548257286;
	bh=t/yhjpmFBYV90t5m9Z5FXaA9kl/NMfzSE1xy2R/45iw=;
	h=To:Cc:From:Subject:Date;
	b=GbRdMGuhq10pbC149xWTfoCaxUgfmtZ4wLz7k0/LxDPHOCFjKMFa+9ZHg0cJFmXdm
	 NEuAEoWOYqtnLyQxgSPHiY7Pw7PDgSafgGaxA3D8f2QfkaQDXeS/Jd7HnLNl5DCymr
	 fcCGPrded6yfeF+GIksYSLM2uqIbHQswXHC4ah1OKGZJeO+VewpLN5idKbyQkIRNCR
	 0N3GS6OTxVQnIpd6w2Z17Tw7UjFQZBCUyWuTLBr4Eo7G2OFa/s6wRREFq0oUSArsdM
	 9TkYU9qgxmM6c9RXRwkIsLhv7v79FiqHqQyP4gxYdpwHZBfivUxMo0NFmOjtOOfrxo
	 q5koeLs+3FjjA==
From: Akira Yokosawa <akys@qa2.so-net.ne.jp>
Subject: [PATCH] memorder: Make RCU litmus tests klitmus7 ready
Message-ID: <f1838444-907a-7c73-bf54-205c30708633@qa2.so-net.ne.jp>
Date: Thu, 24 Jan 2019 00:28:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 81058687119c2bac703bc669d826c8466c517cda Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 23 Jan 2019 21:35:28 +0900
Subject: [PATCH] memorder: Make RCU litmus tests klitmus7 ready

Use uintptr_t, which is available for kernel modules, instead of
intptr_t.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

You've added C-SB+o-rcusync-o+rl-o-o-rul to KLITMUS_READY in the
Makefile under CodeSamples/formal/herd in commit 74b1eae67cc7
("memorder: Start section on RCU detailed semantics.").
However, "make cross-klitmus; cd klitmus; make" ends up in errors
starting from:

CodeSamples/formal/herd/klitmus/litmus043.c:286:3: error: unknown type name 'intptr_t'
   intptr_t *x1;
   ^
[...]

IIUC, intptr_t is not available for kernel modules. Using uintptr_t
instead looks like a solution.

        Thanks, Akira
--
 .../formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus        |  8 ++++----
 .../formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus        |  8 ++++----
 .../formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus     |  8 ++++----
 CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus      |  8 ++++----
 ...+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus | 16 ++++++++--------
 .../formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus      |  8 ++++----
 .../formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus       |  8 ++++----
 .../formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus       |  8 ++++----
 .../herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus   | 12 ++++++------
 .../formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus       |  8 ++++----
 .../formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus       |  8 ++++----
 CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus |  8 ++++----
 12 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus b/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus
index f53ffac..ba0b479 100644
--- a/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus
@@ -3,18 +3,18 @@ C C-LB+o-rl-rul-o+o-rl-rul-o
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
-	intptr_t r1 = READ_ONCE(*x0);
+	uintptr_t r1 = READ_ONCE(*x0);
 	rcu_read_lock();
 	rcu_read_unlock();
 	WRITE_ONCE(*x1, 1);
 }
 
 
-P1(intptr_t *x0, intptr_t *x1)
+P1(uintptr_t *x0, uintptr_t *x1)
 {
-	intptr_t r1 = READ_ONCE(*x1);
+	uintptr_t r1 = READ_ONCE(*x1);
 	rcu_read_lock();
 	rcu_read_unlock();
 	WRITE_ONCE(*x0, 1);
diff --git a/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus
index 829e82d..8551eca 100644
--- a/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus
@@ -3,19 +3,19 @@ C C-LB+rl-o-o-rul+rl-o-o-rul
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
 	rcu_read_lock();
-	intptr_t r1 = READ_ONCE(*x0);
+	uintptr_t r1 = READ_ONCE(*x0);
 	WRITE_ONCE(*x1, 1);
 	rcu_read_unlock();
 }
 
 
-P1(intptr_t *x0, intptr_t *x1)
+P1(uintptr_t *x0, uintptr_t *x1)
 {
 	rcu_read_lock();
-	intptr_t r1 = READ_ONCE(*x1);
+	uintptr_t r1 = READ_ONCE(*x1);
 	WRITE_ONCE(*x0, 1);
 	rcu_read_unlock();
 }
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus
index 2422abe..1a9625e 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus
@@ -3,18 +3,18 @@ C C-SB+o-rcusync-o+i-rl-o-o-rul
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x0, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x1);
+	uintptr_t r2 = READ_ONCE(*x1);
 }
 
 
-P1(intptr_t *x0, intptr_t *x1)
+P1(uintptr_t *x0, uintptr_t *x1)
 {
 	rcu_read_lock();
-	intptr_t r2 = READ_ONCE(*x0);
+	uintptr_t r2 = READ_ONCE(*x0);
 	WRITE_ONCE(*x1, 2);
 	rcu_read_unlock();
 }
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus
index 4c471c4..8681c84 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus
@@ -3,18 +3,18 @@ C C-SB+o-rcusync-o+o-o
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x0, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x1);
+	uintptr_t r2 = READ_ONCE(*x1);
 }
 
 
-P1(intptr_t *x0, intptr_t *x1)
+P1(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x1, 2);
-	intptr_t r2 = READ_ONCE(*x0);
+	uintptr_t r2 = READ_ONCE(*x0);
 }
 
 //\end[snippet]
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
index 78eed5e..18595f4 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
@@ -3,36 +3,36 @@ C C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x0, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x1);
+	uintptr_t r2 = READ_ONCE(*x1);
 }
 
 
-P1(intptr_t *x1, intptr_t *x2)
+P1(uintptr_t *x1, uintptr_t *x2)
 {
 	WRITE_ONCE(*x1, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x2);
+	uintptr_t r2 = READ_ONCE(*x2);
 }
 
 
-P2(intptr_t *x2, intptr_t *x3)
+P2(uintptr_t *x2, uintptr_t *x3)
 {
 	rcu_read_lock();
 	WRITE_ONCE(*x2, 2);
-	intptr_t r2 = READ_ONCE(*x3);
+	uintptr_t r2 = READ_ONCE(*x3);
 	rcu_read_unlock();
 }
 
 
-P3(intptr_t *x0, intptr_t *x3)
+P3(uintptr_t *x0, uintptr_t *x3)
 {
 	rcu_read_lock();
 	WRITE_ONCE(*x3, 2);
-	intptr_t r2 = READ_ONCE(*x0);
+	uintptr_t r2 = READ_ONCE(*x0);
 	rcu_read_unlock();
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus
index e43188b..aa3a49f 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus
@@ -3,19 +3,19 @@ C C-SB+o-rcusync-o+o-rcusync-o
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x0, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x1);
+	uintptr_t r2 = READ_ONCE(*x1);
 }
 
 
-P1(intptr_t *x0, intptr_t *x1)
+P1(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x1, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x0);
+	uintptr_t r2 = READ_ONCE(*x0);
 }
 
 //\end[snippet]
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus
index a4e3aa9..503dcf8 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus
@@ -3,19 +3,19 @@ C C-SB+o-rcusync-o+o-rl-o-rul
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x0, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x1);
+	uintptr_t r2 = READ_ONCE(*x1);
 }
 
 
-P1(intptr_t *x0, intptr_t *x1)
+P1(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x1, 2);
 	rcu_read_lock();
-	intptr_t r2 = READ_ONCE(*x0);
+	uintptr_t r2 = READ_ONCE(*x0);
 	rcu_read_unlock();
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus
index 7998036..054e2e7 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus
@@ -3,20 +3,20 @@ C C-SB+o-rcusync-o+o-rl-rul-o
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x0, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x1);
+	uintptr_t r2 = READ_ONCE(*x1);
 }
 
 
-P1(intptr_t *x0, intptr_t *x1)
+P1(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x1, 2);
 	rcu_read_lock();
 	rcu_read_unlock();
-	intptr_t r2 = READ_ONCE(*x0);
+	uintptr_t r2 = READ_ONCE(*x0);
 }
 
 //\end[snippet]
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
index 4905ea5..8c87d42 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
@@ -3,28 +3,28 @@ C C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x0, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x1);
+	uintptr_t r2 = READ_ONCE(*x1);
 }
 
 
-P1(intptr_t *x1, intptr_t *x2)
+P1(uintptr_t *x1, uintptr_t *x2)
 {
 	rcu_read_lock();
 	WRITE_ONCE(*x1, 2);
-	intptr_t r2 = READ_ONCE(*x2);
+	uintptr_t r2 = READ_ONCE(*x2);
 	rcu_read_unlock();
 }
 
 
-P2(intptr_t *x2, intptr_t *x0)
+P2(uintptr_t *x2, uintptr_t *x0)
 {
 	rcu_read_lock();
 	WRITE_ONCE(*x2, 2);
-	intptr_t r2 = READ_ONCE(*x0);
+	uintptr_t r2 = READ_ONCE(*x0);
 	rcu_read_unlock();
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus
index 4be12dd..5190ddf 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus
@@ -3,19 +3,19 @@ C C-SB+o-rcusync-o+rl-o-o-rul
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x0, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x1);
+	uintptr_t r2 = READ_ONCE(*x1);
 }
 
 
-P1(intptr_t *x0, intptr_t *x1)
+P1(uintptr_t *x0, uintptr_t *x1)
 {
 	rcu_read_lock();
 	WRITE_ONCE(*x1, 2);
-	intptr_t r2 = READ_ONCE(*x0);
+	uintptr_t r2 = READ_ONCE(*x0);
 	rcu_read_unlock();
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus
index 356a61e..a39baf3 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus
@@ -3,20 +3,20 @@ C C-SB+o-rcusync-o+rl-o-rul-o
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x0, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x1);
+	uintptr_t r2 = READ_ONCE(*x1);
 }
 
 
-P1(intptr_t *x0, intptr_t *x1)
+P1(uintptr_t *x0, uintptr_t *x1)
 {
 	rcu_read_lock();
 	WRITE_ONCE(*x1, 2);
 	rcu_read_unlock();
-	intptr_t r2 = READ_ONCE(*x0);
+	uintptr_t r2 = READ_ONCE(*x0);
 }
 
 //\end[snippet]
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
index 356a61e..a39baf3 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
@@ -3,20 +3,20 @@ C C-SB+o-rcusync-o+rl-o-rul-o
 {
 }
 
-P0(intptr_t *x0, intptr_t *x1)
+P0(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x0, 2);
 	synchronize_rcu();
-	intptr_t r2 = READ_ONCE(*x1);
+	uintptr_t r2 = READ_ONCE(*x1);
 }
 
 
-P1(intptr_t *x0, intptr_t *x1)
+P1(uintptr_t *x0, uintptr_t *x1)
 {
 	rcu_read_lock();
 	WRITE_ONCE(*x1, 2);
 	rcu_read_unlock();
-	intptr_t r2 = READ_ONCE(*x0);
+	uintptr_t r2 = READ_ONCE(*x0);
 }
 
 //\end[snippet]
-- 
2.7.4

