Return-Path: <SRS0=dTYp=EU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YJEID5E3UnctNzSd7Tx7GWHKkeNqnD99RiOrjNYbFVA=;
        b=dusGwnXmLjX76KBztsLXz8XqUeCav3D/nQMAn8XWsb7+51lTQutbMZExJ9FCyefikf
         8/EiDyUKDnaxmOGvGclI8We/N6S8GZ0pgBXre0rLVgCdaDE8iOcnEW9Puo5zONAUSpi7
         Qjba4qJYRyfqTLsfn8uxV0dnn51PqbA6d7/2x5qPKieZO/fITPSvNQD6lshKVhyhhbaS
         Y42VPH2yKlCQki9wtiwrVGAFW8WkLP0PMndMcNWZvihyU/zTk6G8VDYY6BzoC4iCXcIj
         KXyOVOgDZNIYToh04o5z7AMblHOzYhS3dVLlQ+YWFUDDjwZ8/Bgj80o0FZuIF9hPZZBV
         FRTA==
Subject: [PATCH perfbook 2/2] CodeSamples/formal: Use '{}' for empty init
 blocks in litmus tests
References: <7e9cc3fb-12af-eb3c-2d81-74486dd9e061@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6f6867a5-e84e-521e-09c4-f50478ebda9f@gmail.com>
Date: Sat, 14 Nov 2020 13:56:22 +0900
MIME-Version: 1.0
In-Reply-To: <7e9cc3fb-12af-eb3c-2d81-74486dd9e061@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7bd6d1eccdfd70b6d0ff1c04a080875215173615 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 8 Nov 2020 08:18:51 +0900
Subject: [PATCH perfbook 2/2] CodeSamples/formal: Use '{}' for empty init blocks in litmus tests

Also remove or add empty lines for consistency.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus | 5 ++---
 CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus | 5 ++---
 CodeSamples/formal/herd/C-Lock1.litmus                    | 5 +++--
 CodeSamples/formal/herd/C-Lock2.litmus                    | 5 +++--
 .../C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus | 3 +--
 ...C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus | 3 +--
 .../C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus | 3 +--
 ...C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus | 3 +--
 .../C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus   | 3 +--
 .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus    | 3 +--
 .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus   | 3 +--
 .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus    | 3 +--
 .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus   | 3 +--
 .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus      | 3 +--
 .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus     | 3 +--
 .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus    | 3 +--
 .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus     | 3 +--
 .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus    | 3 +--
 .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u.litmus       | 3 +--
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus     | 3 +--
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus    | 3 +--
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus     | 3 +--
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus    | 3 +--
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus       | 3 +--
 .../formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus      | 5 ++---
 CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus       | 5 ++---
 ...B+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus | 7 ++-----
 .../formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus       | 5 ++---
 .../formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus        | 5 ++---
 .../formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus        | 5 ++---
 .../herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus    | 6 ++----
 .../formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus        | 5 ++---
 .../formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus        | 5 ++---
 CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus           | 5 ++---
 CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus   | 5 ++---
 CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus   | 5 ++---
 .../formal/litmus/C-LB+a-o+o-data-o+o-data-o.litmus       | 5 ++---
 CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus     | 5 ++---
 .../formal/litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus     | 4 ++--
 .../formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus        | 4 ++--
 CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o.litmus     | 4 ++--
 CodeSamples/formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus     | 4 ++--
 CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus             | 5 ++---
 CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus             | 5 ++---
 CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus        | 6 +++---
 CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus        | 5 ++---
 CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus         | 8 ++------
 CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus        | 7 ++-----
 CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus    | 4 ----
 CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus         | 7 +------
 CodeSamples/formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus     | 7 +------
 CodeSamples/formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus  | 4 ++--
 CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o.litmus       | 5 ++---
 CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus     | 4 ----
 CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o.litmus       | 5 ++---
 CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus             | 6 +++---
 .../formal/litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus    | 4 +---
 CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus | 4 ++--
 CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus          | 3 +--
 .../formal/litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus     | 4 ++--
 CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus  | 4 ++--
 .../formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus     | 4 ++--
 CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus  | 4 ++--
 CodeSamples/formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus   | 5 ++---
 CodeSamples/formal/litmus/C-cmpxchg.litmus                | 4 ++--
 65 files changed, 106 insertions(+), 177 deletions(-)

diff --git a/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus b/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus
index ba0b4799..bb2c94ef 100644
--- a/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus
@@ -1,7 +1,7 @@
 C C-LB+o-rl-rul-o+o-rl-rul-o
 //\begin[snippet][labelbase=ln:formal:C-LB+o-rl-rul-o+o-rl-rul-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 P0(uintptr_t *x0, uintptr_t *x1)
 {
@@ -11,7 +11,6 @@ P0(uintptr_t *x0, uintptr_t *x1)
 	WRITE_ONCE(*x1, 1);
 }
 
-
 P1(uintptr_t *x0, uintptr_t *x1)
 {
 	uintptr_t r1 = READ_ONCE(*x1);
diff --git a/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus
index 8551ecaa..7ac2a2ab 100644
--- a/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus
@@ -1,7 +1,7 @@
 C C-LB+rl-o-o-rul+rl-o-o-rul
 //\begin[snippet][labelbase=ln:formal:C-LB+rl-o-o-rul+rl-o-o-rul:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 P0(uintptr_t *x0, uintptr_t *x1)
 {
@@ -11,7 +11,6 @@ P0(uintptr_t *x0, uintptr_t *x1)
 	rcu_read_unlock();
 }
 
-
 P1(uintptr_t *x0, uintptr_t *x1)
 {
 	rcu_read_lock();
diff --git a/CodeSamples/formal/herd/C-Lock1.litmus b/CodeSamples/formal/herd/C-Lock1.litmus
index 5a1065d5..b66d83f4 100644
--- a/CodeSamples/formal/herd/C-Lock1.litmus
+++ b/CodeSamples/formal/herd/C-Lock1.litmus
@@ -1,7 +1,7 @@
 C Lock1
 //\begin[snippet][labelbase=ln:formal:C-Lock1:whole,commandchars=\\\[\]]
-{
-}
+
+{}
 
 P0(int *x, spinlock_t *sp)
 {
@@ -19,5 +19,6 @@ P1(int *x, spinlock_t *sp)
 	r1 = READ_ONCE(*x);
 	spin_unlock(sp);
 }
+
 //\end[snippet]
 exists (1:r1=1)
diff --git a/CodeSamples/formal/herd/C-Lock2.litmus b/CodeSamples/formal/herd/C-Lock2.litmus
index dc28b24e..00210cb9 100644
--- a/CodeSamples/formal/herd/C-Lock2.litmus
+++ b/CodeSamples/formal/herd/C-Lock2.litmus
@@ -1,7 +1,7 @@
 C Lock2
 //\begin[snippet][labelbase=ln:formal:C-Lock2:whole,commandchars=\\\[\]]
-{
-}
+
+{}
 
 P0(int *x, spinlock_t *sp1)
 {
@@ -19,5 +19,6 @@ P1(int *x, spinlock_t *sp2) // Buggy!
 	r1 = READ_ONCE(*x);
 	spin_unlock(sp2);
 }
+
 //\end[snippet]
 exists (1:r1=1)
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
index 7175ca89..f4ad486e 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
index 46fd9ad8..5ac9058b 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus
index 3fdddbb2..cb989ab1 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus
index a7f9ec55..d6dddac8 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus
index fc2117e2..e19d6cc6 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u
 
-{
-}
+{}
 
 P0(spinlock_t *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
index f087f9cb..6bf22c64 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
index d9712c85..d9887d6d 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus
index 22e8dd54..a075434c 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus
index 17e640dc..7c9bca43 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus
index 9208eaad..a1d4e965 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u
 
-{
-}
+{}
 
 P0(spinlock_t *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
index 19b70691..efe6925b 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
index c22f6a45..376bf88f 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus
index 98ded7ea..984a2c4d 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u-X
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus
index 5f376fa2..59064811 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u.litmus
index 90ea057f..7d5b881b 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u+l-o-o-u
 
-{
-}
+{}
 
 P0(spinlock_t *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
index 3e9e0236..456a3055 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
@@ -1,8 +1,7 @@
 C C-SB+l-o-o-u+l-o-o-u-C
 // \begin[snippet][labelbase=ln:future:formalregress:C-SB+l-o-o-u+l-o-o-u-C:whole,commandchars=\%\[\]]
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus
index 1e2dd5be..c0703a49 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u-CE
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus
index 30a7fe71..5d19c0c7 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u-X
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus
index 28a0f83b..3e9c461c 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u-XE
 
-{
-}
+{}
 
 P0(int *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus
index c16d8f95..8307b389 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus
@@ -1,7 +1,6 @@
 C C-SB+l-o-o-u+l-o-o-u
 
-{
-}
+{}
 
 P0(spinlock_t *sl, int *x0, int *x1)
 {
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus
index 1a9625e8..1a9de656 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus
@@ -1,7 +1,7 @@
 C C-SB+o-rcusync-o+i-rl-o-o-rul
 //\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+i-rl-o-o-rul:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 P0(uintptr_t *x0, uintptr_t *x1)
 {
@@ -10,7 +10,6 @@ P0(uintptr_t *x0, uintptr_t *x1)
 	uintptr_t r2 = READ_ONCE(*x1);
 }
 
-
 P1(uintptr_t *x0, uintptr_t *x1)
 {
 	rcu_read_lock();
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus
index 8681c847..8ae8db2c 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus
@@ -1,7 +1,7 @@
 C C-SB+o-rcusync-o+o-o
 //\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 P0(uintptr_t *x0, uintptr_t *x1)
 {
@@ -10,7 +10,6 @@ P0(uintptr_t *x0, uintptr_t *x1)
 	uintptr_t r2 = READ_ONCE(*x1);
 }
 
-
 P1(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x1, 2);
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
index 18595f4c..02bb51a7 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
@@ -1,7 +1,7 @@
 C C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul
 //\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 P0(uintptr_t *x0, uintptr_t *x1)
 {
@@ -10,7 +10,6 @@ P0(uintptr_t *x0, uintptr_t *x1)
 	uintptr_t r2 = READ_ONCE(*x1);
 }
 
-
 P1(uintptr_t *x1, uintptr_t *x2)
 {
 	WRITE_ONCE(*x1, 2);
@@ -18,7 +17,6 @@ P1(uintptr_t *x1, uintptr_t *x2)
 	uintptr_t r2 = READ_ONCE(*x2);
 }
 
-
 P2(uintptr_t *x2, uintptr_t *x3)
 {
 	rcu_read_lock();
@@ -27,7 +25,6 @@ P2(uintptr_t *x2, uintptr_t *x3)
 	rcu_read_unlock();
 }
 
-
 P3(uintptr_t *x0, uintptr_t *x3)
 {
 	rcu_read_lock();
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus
index aa3a49fa..f48bf45e 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus
@@ -1,7 +1,7 @@
 C C-SB+o-rcusync-o+o-rcusync-o
 //\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rcusync-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 P0(uintptr_t *x0, uintptr_t *x1)
 {
@@ -10,7 +10,6 @@ P0(uintptr_t *x0, uintptr_t *x1)
 	uintptr_t r2 = READ_ONCE(*x1);
 }
 
-
 P1(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x1, 2);
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus
index 503dcf80..0542443e 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus
@@ -1,7 +1,7 @@
 C C-SB+o-rcusync-o+o-rl-o-rul
 //\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rl-o-rul:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 P0(uintptr_t *x0, uintptr_t *x1)
 {
@@ -10,7 +10,6 @@ P0(uintptr_t *x0, uintptr_t *x1)
 	uintptr_t r2 = READ_ONCE(*x1);
 }
 
-
 P1(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x1, 2);
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus
index 054e2e7a..69413916 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus
@@ -1,7 +1,7 @@
 C C-SB+o-rcusync-o+o-rl-rul-o
 //\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rl-rul-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 P0(uintptr_t *x0, uintptr_t *x1)
 {
@@ -10,7 +10,6 @@ P0(uintptr_t *x0, uintptr_t *x1)
 	uintptr_t r2 = READ_ONCE(*x1);
 }
 
-
 P1(uintptr_t *x0, uintptr_t *x1)
 {
 	WRITE_ONCE(*x1, 2);
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
index 8c87d429..329a12f5 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
@@ -1,7 +1,7 @@
 C C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul
 //\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 P0(uintptr_t *x0, uintptr_t *x1)
 {
@@ -10,7 +10,6 @@ P0(uintptr_t *x0, uintptr_t *x1)
 	uintptr_t r2 = READ_ONCE(*x1);
 }
 
-
 P1(uintptr_t *x1, uintptr_t *x2)
 {
 	rcu_read_lock();
@@ -19,7 +18,6 @@ P1(uintptr_t *x1, uintptr_t *x2)
 	rcu_read_unlock();
 }
 
-
 P2(uintptr_t *x2, uintptr_t *x0)
 {
 	rcu_read_lock();
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus
index 5190ddf6..984d75a3 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus
@@ -1,7 +1,7 @@
 C C-SB+o-rcusync-o+rl-o-o-rul
 //\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-o-rul:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 P0(uintptr_t *x0, uintptr_t *x1)
 {
@@ -10,7 +10,6 @@ P0(uintptr_t *x0, uintptr_t *x1)
 	uintptr_t r2 = READ_ONCE(*x1);
 }
 
-
 P1(uintptr_t *x0, uintptr_t *x1)
 {
 	rcu_read_lock();
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus
index a39baf3a..10ce89a3 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus
@@ -1,7 +1,7 @@
 C C-SB+o-rcusync-o+rl-o-rul-o
 //\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-rul-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 P0(uintptr_t *x0, uintptr_t *x1)
 {
@@ -10,7 +10,6 @@ P0(uintptr_t *x0, uintptr_t *x1)
 	uintptr_t r2 = READ_ONCE(*x1);
 }
 
-
 P1(uintptr_t *x0, uintptr_t *x1)
 {
 	rcu_read_lock();
diff --git a/CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus b/CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus
index 1d75e5e6..43fd622c 100644
--- a/CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus
+++ b/CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus
@@ -1,7 +1,7 @@
 C C-2+2W+o-o+o-o
 //\begin[snippet][labelbase=ln:formal:C-2+2W+o-o+o-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -13,7 +13,6 @@ P0(int *x0, int *x1)
 	WRITE_ONCE(*x1, 2);
 }
 
-
 P1(int *x0, int *x1)
 {
 	WRITE_ONCE(*x1, 1);
diff --git a/CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus b/CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus
index 8d17a1d2..bea2b9a6 100644
--- a/CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus
+++ b/CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus
@@ -1,7 +1,7 @@
 C C-2+2W+o-wmb-o+o-wmb-o
 //\begin[snippet][labelbase=ln:formal:C-2+2W+o-wmb-o+o-wmb-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -14,7 +14,6 @@ P0(int *x0, int *x1)
 	WRITE_ONCE(*x1, 2);
 }
 
-
 P1(int *x0, int *x1)
 {
 	WRITE_ONCE(*x1, 1);
diff --git a/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus b/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
index 962d1cea..b8f9cba7 100644
--- a/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
+++ b/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
@@ -1,7 +1,7 @@
 C C-ISA2+o-r+a-r+a-r+a-o
 //\begin[snippet][labelbase=ln:formal:litmus:C-ISA2+o-r+a-r+a-r+a-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -13,7 +13,6 @@ P0(int *x0, int *x1)
 	smp_store_release(x1, 2);	//\lnlbl[P0:rel]
 }
 
-
 P1(int *x1, int *x2)
 {
 	int r2;
diff --git a/CodeSamples/formal/litmus/C-LB+a-o+o-data-o+o-data-o.litmus b/CodeSamples/formal/litmus/C-LB+a-o+o-data-o+o-data-o.litmus
index c8e2f130..16f01665 100644
--- a/CodeSamples/formal/litmus/C-LB+a-o+o-data-o+o-data-o.litmus
+++ b/CodeSamples/formal/litmus/C-LB+a-o+o-data-o+o-data-o.litmus
@@ -1,7 +1,7 @@
 C C-LB+a-o+o-data-o+o-data-o
 //\begin[snippet][labelbase=ln:formal:C-LB+a-o+o-data-o+o-data-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -15,7 +15,6 @@ P0(int *x0, int *x1)
 	WRITE_ONCE(*x1, 2);
 }
 
-
 P1(int *x1, int *x2)
 {
 	int r2;
diff --git a/CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus b/CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus
index c582dfd1..1012d225 100644
--- a/CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus
+++ b/CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus
@@ -1,7 +1,7 @@
 C C-LB+a-r+a-r+a-r+a-r
 //\begin[snippet][labelbase=ln:formal:C-LB+a-r+a-r+a-r+a-r:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -15,7 +15,6 @@ P0(int *x0, int *x1)
 	smp_store_release(x1, 2);
 }
 
-
 P1(int *x1, int *x2)
 {
 	int r2;
diff --git a/CodeSamples/formal/litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus b/CodeSamples/formal/litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus
index a026e2d9..dcceca18 100644
--- a/CodeSamples/formal/litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus
+++ b/CodeSamples/formal/litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus
@@ -1,6 +1,6 @@
 C C-LB+cmpxchg-ctrl-o+o-ctrl-o
-{
-}
+
+{}
 
 {
 #include "api.h"
diff --git a/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus b/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus
index e97b879a..280c3c33 100644
--- a/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus
+++ b/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus
@@ -1,6 +1,6 @@
 C C-LB+o-cge-o+o-cge-o+dstb
-{
-}
+
+{}
 
 {
 #include "api.h"
diff --git a/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o.litmus b/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o.litmus
index 14539b97..653fb485 100644
--- a/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o.litmus
+++ b/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o.litmus
@@ -1,6 +1,6 @@
 C C-LB+o-cge-o+o-cge-o
-{
-}
+
+{}
 
 {
 #include "api.h"
diff --git a/CodeSamples/formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus b/CodeSamples/formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus
index f8a7406c..5c41c972 100644
--- a/CodeSamples/formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus
+++ b/CodeSamples/formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus
@@ -1,7 +1,7 @@
 C C-LB+o-cgt-o+o-cgt-o
 //\begin[snippet][labelbase=ln:formal:C-LB+o-cgt-o+o-cgt-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
diff --git a/CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus b/CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus
index f40bb067..61da889d 100644
--- a/CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus
+++ b/CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus
@@ -1,7 +1,7 @@
 C C-LB+o-o+o-o
 //\begin[snippet][labelbase=ln:formal:C-LB+o-o+o-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -15,7 +15,6 @@ P0(int *x0, int *x1)
 	WRITE_ONCE(*x0, 2);
 }
 
-
 P1(int *x0, int *x1)
 {
 	int r2;
diff --git a/CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus b/CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus
index ac5faa81..d1f24f18 100644
--- a/CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus
+++ b/CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus
@@ -1,7 +1,7 @@
 C C-LB+o-r+a-o
 //\begin[snippet][labelbase=ln:formal:C-LB+o-r+a-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {					//\fcvexclude
 #include "api.h"			//\fcvexclude
@@ -15,7 +15,6 @@ P0(int *x0, int *x1)
 	smp_store_release(x0, 2);
 }
 
-
 P1(int *x0, int *x1)
 {
 	int r2;
diff --git a/CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus b/CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus
index 6eede7c4..7825a87f 100644
--- a/CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus
+++ b/CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus
@@ -1,7 +1,7 @@
 C C-LB+o-r+o-ctrl-o
 //\begin[snippet][labelbase=ln:formal:C-LB+o-r+o-ctrl-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -15,7 +15,6 @@ P0(int *x0, int *x1)
 	smp_store_release(x0, 2);
 }
 
-
 P1(int *x0, int *x1)
 {
 	int r2;
@@ -24,5 +23,6 @@ P1(int *x0, int *x1)
 	if (r2 >= 0)			//\lnlbl[if]
 		WRITE_ONCE(*x1, 2);	//\lnlbl[st]
 }
+
 //\end[snippet]
 exists (1:r2=2 /\ 0:r2=2)
diff --git a/CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus b/CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus
index 543256e2..cb3060ba 100644
--- a/CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus
+++ b/CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus
@@ -1,7 +1,7 @@
 C C-LB+o-r+o-data-o
 //\begin[snippet][labelbase=ln:formal:C-LB+o-r+o-data-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -15,7 +15,6 @@ P0(int *x0, int *x1)
 	smp_store_release(x0, 2);
 }
 
-
 P1(int *x0, int *x1)
 {
 	int r2;
diff --git a/CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus b/CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus
index 65da9ea2..dff95bf2 100644
--- a/CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus
+++ b/CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus
@@ -1,28 +1,24 @@
 C C-MP+o-o+o-rmb-o
 //\begin[snippet][labelbase=ln:formal:C-MP+o-o+o-rmb-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
 }				//\fcvexclude
 				//\fcvexclude
 P0(int* x0, int* x1) {
-
 	WRITE_ONCE(*x0, 2);
 	WRITE_ONCE(*x1, 2);
-
 }
 
 P1(int* x0, int* x1) {
-
 	int r2;
 	int r3;
 
 	r2 = READ_ONCE(*x1);
 	smp_rmb();
 	r3 = READ_ONCE(*x0);
-
 }
 
 //\end[snippet]
diff --git a/CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus b/CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus
index b08ad06b..28cb9e2a 100644
--- a/CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus
+++ b/CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus
@@ -1,17 +1,15 @@
 C C-MP+o-r+o-ctrl-o
 //\begin[snippet][labelbase=ln:formal:C-MP+o-r+o-ctrl-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
 }				//\fcvexclude
 				//\fcvexclude
 P0(int* x0, int* x1) {
-
 	WRITE_ONCE(*x0, 2);
 	smp_store_release(x1, 2);
-
 }
 
 P1(int* x0, int* x1) {
@@ -21,7 +19,6 @@ P1(int* x0, int* x1) {
 	r2 = READ_ONCE(*x1);			//\lnlbl[ld1]
 	if (r2 >= 0)
 		r3 = READ_ONCE(*x0);		//\lnlbl[ld2]
-
 }
 
 //\end[snippet]
diff --git a/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus
index 865943e5..bb62bd17 100644
--- a/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus
+++ b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus
@@ -11,21 +11,17 @@ x1=y;			(* \lnlbl[init:x1] *)
 }				//\fcvexclude
 				//\fcvexclude
 P0(int* x0, int** x1) {
-
 	WRITE_ONCE(*x0, 2);	//\lnlbl[P0:x0]
 	smp_wmb();		//\lnlbl[P0:wmb]
 	WRITE_ONCE(*x1, x0);	//\lnlbl[P0:x1]
-
 }
 
 P1(int** x1) {
-
 	int *r2;
 	int r3;
 
 	r2 = READ_ONCE(*x1);	//\lnlbl[P1:x1]
 	r3 = READ_ONCE(*r2);	//\lnlbl[P1:ref]
-
 }
 
 //\end[snippet]
diff --git a/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus
index 469ba780..6c566314 100644
--- a/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus
+++ b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus
@@ -1,29 +1,24 @@
 C C-MP+o-wmb-o+o-o
 //\begin[snippet][labelbase=ln:formal:C-MP+o-wmb-o+o-o:whole,commandchars=\@\[\]]
 
-{
-}
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
 }				//\fcvexclude
 				//\fcvexclude
 P0(int* x0, int* x1) {
-
 	WRITE_ONCE(*x0, 2);
 	smp_wmb();
 	WRITE_ONCE(*x1, 2);
-
 }
 
 P1(int* x0, int* x1) {
-
 	int r2;
 	int r3;
 
 	r2 = READ_ONCE(*x1);
 	r3 = READ_ONCE(*x0);
-
 }
 
 //\end[snippet]
diff --git a/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus
index 5b5bf45a..60d379d6 100644
--- a/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus
+++ b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus
@@ -1,30 +1,25 @@
 C C-MP+o-wmb-o+o-rmb-o
 //\begin[snippet][labelbase=ln:formal:C-MP+o-wmb-o+o-rmb-o:whole,commandchars=\@\[\]]
 
-{
-}
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
 }				//\fcvexclude
 				//\fcvexclude
 P0(int* x0, int* x1) {
-
 	WRITE_ONCE(*x0, 2);
 	smp_wmb();
 	WRITE_ONCE(*x1, 2);
-
 }
 
 P1(int* x0, int* x1) {
-
 	int r2;
 	int r3;
 
 	r2 = READ_ONCE(*x1);
 	smp_rmb();			//\lnlbl[rmb]
 	r3 = READ_ONCE(*x0);
-
 }
 
 //\end[snippet]
diff --git a/CodeSamples/formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus b/CodeSamples/formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus
index a84573a6..c48622a6 100644
--- a/CodeSamples/formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus
+++ b/CodeSamples/formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus
@@ -1,7 +1,7 @@
 C C-MP-OMCA+o-o-o+o-rmb-o
 //\begin[snippet][labelbase=ln:formal:C-MP-OMCA+o-o-o+o-rmb-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
diff --git a/CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o.litmus b/CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o.litmus
index 7e9a5bba..e4e15b01 100644
--- a/CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o.litmus
+++ b/CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o.litmus
@@ -1,7 +1,7 @@
 C C-R+o-wmb-o+o-mb-o
 //\begin[snippet][labelbase=ln:formal:C-R+o-wmb-o+o-mb-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -14,7 +14,6 @@ P0(int *x0, int *x1)
 	WRITE_ONCE(*x1, 1);
 }
 
-
 P1(int *x0, int *x1)
 {
 	int r2;
diff --git a/CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus b/CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus
index 11171cd5..3bbcc4f1 100644
--- a/CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus
+++ b/CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus
@@ -11,20 +11,16 @@ x1=y;
 }				//\fcvexclude
 				//\fcvexclude
 P0(int* x0, int** x1) {
-
 	WRITE_ONCE(*x0, 2);	//\lnlbl[P0:x0]
 	smp_wmb();
 	WRITE_ONCE(*x1, x0);
-
 }
 
 P1(int** x1) {
-
 	int *r2;
 
 	r2 = READ_ONCE(*x1);		//\lnlbl[P1:x1]
 	WRITE_ONCE(*r2, 3);		//\lnlbl[P1:r2]
-
 }
 
 //\end[snippet]
diff --git a/CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o.litmus b/CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o.litmus
index 0357306b..4922680c 100644
--- a/CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o.litmus
+++ b/CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o.litmus
@@ -1,7 +1,7 @@
 C C-SB+o-mb-o+o-mb-o
 //\begin[snippet][labelbase=ln:formal:C-SB+o-mb-o+o-mb-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -16,7 +16,6 @@ P0(int *x0, int *x1)
 	r2 = READ_ONCE(*x1);	//\lnlbl[P0:ld]
 }
 
-
 P1(int *x0, int *x1)
 {
 	int r2;
diff --git a/CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus b/CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus
index 85022aea..fabcb5d5 100644
--- a/CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus
+++ b/CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus
@@ -1,7 +1,7 @@
 C C-SB+o-o+o-o
 //\begin[snippet][labelbase=ln:formal:C-SB+o-o+o-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -15,7 +15,6 @@ P0(int *x0, int *x1)
 	r2 = READ_ONCE(*x1);	//\lnlbl[ld0]
 }
 
-
 P1(int *x0, int *x1)
 {
 	int r2;
@@ -23,5 +22,6 @@ P1(int *x0, int *x1)
 	WRITE_ONCE(*x1, 2);	//\lnlbl[st1]
 	r2 = READ_ONCE(*x0);	//\lnlbl[ld1]
 }
+
 //\end[snippet]
 exists (1:r2=0 /\ 0:r2=0)
diff --git a/CodeSamples/formal/litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus b/CodeSamples/formal/litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus
index e1502963..8076c0c6 100644
--- a/CodeSamples/formal/litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus
+++ b/CodeSamples/formal/litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus
@@ -1,7 +1,6 @@
 C C-SB-OMCA+o-o-rmb-o+o-o-rmb-o
 
-{
-}
+{}
 
 {
 #include "api.h"
@@ -18,7 +17,6 @@ P0(int *x0, int *x1)
 	r2 = READ_ONCE(*x1);
 }
 
-
 P1(int *x0, int *x1)
 {
 	int r1;
diff --git a/CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus b/CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus
index 88225dde..b0960253 100644
--- a/CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus
+++ b/CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus
@@ -1,7 +1,7 @@
 C C-WRC+o+o-data-o+o-rmb-o
 //\begin[snippet][labelbase=ln:formal:C-WRC+o+o-data-o+o-rmb-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
diff --git a/CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus b/CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus
index 4cd69b8f..a1f000b8 100644
--- a/CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus
+++ b/CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus
@@ -1,8 +1,7 @@
 C C-WRC+o+o-r+a-o
 //\begin[snippet][labelbase=ln:formal:C-WRC+o+o-r+a-o:whole,commandchars=\@\[\]]
 
-{
-}
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
diff --git a/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus b/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
index 015bcd0f..81c0a96a 100644
--- a/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
+++ b/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
@@ -1,6 +1,6 @@
 C C-WWC+o-cge-o+o-cge-o+o+dstb
-{
-}
+
+{}
 
 {
 #include "api.h"
diff --git a/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus b/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus
index 3fcd502c..1c15a01a 100644
--- a/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus
+++ b/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus
@@ -1,6 +1,6 @@
 C C-WWC+o-cge-o+o-cge-o+o
-{
-}
+
+{}
 
 {
 #include "api.h"
diff --git a/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus b/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
index 989d99fe..aada09f5 100644
--- a/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
+++ b/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
@@ -1,6 +1,6 @@
 C C-WWC+o-cgt-o+o-cgt-o+o+dstb
-{
-}
+
+{}
 
 {
 #include "api.h"
diff --git a/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus b/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus
index 9003fdce..1fd2db6f 100644
--- a/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus
+++ b/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus
@@ -1,7 +1,7 @@
 C C-WWC+o-cgt-o+o-cgt-o+o
 //\begin[snippet][labelbase=ln:formal:C-WWC+o-cgt-o+o-cgt-o+o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
diff --git a/CodeSamples/formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus b/CodeSamples/formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus
index dc89015d..db90e958 100644
--- a/CodeSamples/formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus
+++ b/CodeSamples/formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus
@@ -1,7 +1,7 @@
 C C-Z6.2+o-r+a-r+a-r+a-o
 //\begin[snippet][labelbase=ln:formal:C-Z6.2+o-r+a-r+a-r+a-o:whole,commandchars=\@\[\]]
-{
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
@@ -13,7 +13,6 @@ P0(int *x0, int *x1)
 	smp_store_release(x1, 2);
 }
 
-
 P1(int *x1, int *x2)
 {
 	int r2;
diff --git a/CodeSamples/formal/litmus/C-cmpxchg.litmus b/CodeSamples/formal/litmus/C-cmpxchg.litmus
index 9579d4a7..aba438bd 100644
--- a/CodeSamples/formal/litmus/C-cmpxchg.litmus
+++ b/CodeSamples/formal/litmus/C-cmpxchg.litmus
@@ -1,6 +1,6 @@
 C C-cmpxchg
-{
-}
+
+{}
 
 {
 #include "api.h"
-- 
2.17.1


