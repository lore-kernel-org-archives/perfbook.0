Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=r+3x+ZzZ6cgTbi2HwiQGs2PEeXFTWB4C4I1ekWsI8KE=;
 b=PPhzDQk1WTDAFweJSdO+Jb6TUj0zqaae1Wq/mz4q2HaR7HmVI4O5dX7op4hCfAcroF
 JF42TumHHy0qLS+iP18Q0PVryBj3OjuklM+pOPIiOUWQvxznS+SrpD/GvL2y/no5R/jW
 a2Kx0MKboJWtNNBqefAXcj/RSCowW8WZ+CDgFVWu3FvERPw4/p7PcSG+/OuejLC8Rspf
 rxUFiqb8ckfm8cGjgaWG8In/AfGSRu8nW+DX3cFhzWQwbOSr5q2qsNtR2eSLX6LcXnQ0
 PYg0HJYEkKvm+RB0sAkoy2eAAo+X0pLGF9wLdbOjL3MQ5lm8eGLpzgIFDlqajqAADpcW
 4R3g==
Subject: [PATCH 03/13] rcuapi: Rewrite table 'RCU Wait-to-Finish APIs'
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6935eebc-5401-dba2-a355-f14d21a88c4c@gmail.com>
Date: Wed, 4 Jan 2017 10:20:41 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3081eb38520f7e9415758f40ec4a26bb17bffbc0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 31 Dec 2016 13:53:15 +0900
Subject: [PATCH 03/13] rcuapi: Rewrite table 'RCU Wait-to-Finish APIs'

By using \tco{}, protection by minipages is not necessary anymore.
Now, features of "tabulary" can be fully utilized. Parameters of
the environment are tweaked somewhat.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 67 +++++++++++++++++++++++---------------------------------
 1 file changed, 28 insertions(+), 39 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 830019e..8a678f6 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -18,8 +18,8 @@ presents concluding remarks.

 \begin{sidewaystable*}[htbp]
 \centering
-\scriptsize\tymin=1.4in
-\begin{tabulary}{7.8in}{L|L|L|L|L|L}
+\scriptsize\tymin=1.0in
+\begin{tabulary}{7.6in}{L|L|L|L|L|L}
 Attribute &
     RCU Classic &
 	RCU BH &
@@ -43,49 +43,38 @@ Availability &
 		    2.6.19 \\
 \hline
 Read-side primitives &
-    \begin{minipage}[t]{1.4in}{ \raggedright
-      \co{rcu_read_lock()}~! \\
-      \co{rcu_read_unlock()}~! }\end{minipage} &
-	\begin{minipage}[t]{1.4in}{ \raggedright
-	  \co{rcu_read_lock_bh()} \\
-	  \co{rcu_read_unlock_bh()} }\end{minipage} &
-	    \begin{minipage}[t]{1.4in}{ \raggedright
-	      \co{preempt_disable()} \\
-	      \co{preempt_enable()} \\
-	      (and friends) }\end{minipage} &
-	        \begin{minipage}[t]{1.4in}{ \raggedright
-		  \co{rcu_read_lock()} \\
-		  \co{rcu_read_unlock()} }\end{minipage} &
-		    \begin{minipage}[t]{1.4in}{ \raggedright
-		      \co{srcu_read_lock()} \\
-		      \co{srcu_read_unlock()} }\end{minipage} \\
+    \tco{rcu_read_lock()}~! \tco{rcu_read_unlock()}~! &
+	\tco{rcu_read_lock_bh()} \tco{rcu_read_unlock_bh()} &
+	    \tco{preempt_disable()} \tco{preempt_enable()} (and friends) &
+	        \tco{rcu_read_lock()} \tco{rcu_read_unlock()} &
+		    \tco{srcu_read_lock()} \tco{srcu_read_unlock()} \\
 \hline
 { Update-side primitives (synchronous) } &
-    { \co{synchronize_rcu()} \co{synchronize_net()} } &
-	\co{synchronize_rcu_bh()} &
-	    \co{synchronize_sched()} &
-	        { \co{synchronize_rcu()} \co{synchronize_net()} } &
-		    \co{synchronize_srcu()} \\
+    { \tco{synchronize_rcu()} \tco{synchronize_net()} } &
+	\tco{synchronize_rcu_bh()} &
+	    \tco{synchronize_sched()} &
+	        { \tco{synchronize_rcu()} \tco{synchronize_net()} } &
+		    \tco{synchronize_srcu()} \\
 \hline
 { Update-side primitives (asynchronous/callback) } &
-    \co{call_rcu()} ! &
-	\co{call_rcu_bh()} &
-	    \co{call_rcu_sched()} &
-	        \co{call_rcu()} &
-		    \co{call_srcu()} \\
+    \tco{call_rcu()} ! &
+	\tco{call_rcu_bh()} &
+	    \tco{call_rcu_sched()} &
+	        \tco{call_rcu()} &
+		    \tco{call_srcu()} \\
 \hline
 { Update-side primitives (wait for callbacks) } &
-    \co{rcu_barrier()} &
-	\co{rcu_barrier_bh()} &
-	    \co{rcu_barrier_sched()} &
-	        \co{rcu_barrier()} &
+    \tco{rcu_barrier()} &
+	\tco{rcu_barrier_bh()} &
+	    \tco{rcu_barrier_sched()} &
+	        \tco{rcu_barrier()} &
 		    N/A \\
 \hline
 Type-safe memory &
-    \co{SLAB_DESTROY_BY_RCU} &
+    \tco{SLAB_DESTROY_BY_RCU} &
 	&
 	    &
-	        \co{SLAB_DESTROY_BY_RCU} &
+	        \tco{SLAB_DESTROY_BY_RCU} &
 		    \\
 \hline
 Read side constraints &
@@ -93,12 +82,12 @@ Read side constraints &
 	No bottom-half (BH) enabling &
 	    No blocking &
 	        Only preemption and lock acquisition &
-		    No \co{synchronize_srcu()} with same \co{srcu_struct} \\
+		    No \tco{synchronize_srcu()} with same \tco{srcu_struct} \\
 \hline
 Read side overhead &
-    Preempt disable/enable (free on non-PREEMPT) &
+    Preempt disable/enable (free on non-\tco{PREEMPT}) &
 	BH disable/enable &
-	    Preempt disable/enable (free on non-PREEMPT) &
+	    Preempt disable/enable (free on non-\tco{PREEMPT}) &
 	        Simple instructions, irq disable/enable &
 		    Simple instructions, preempt disable/enable, memory barriers \\
 \hline
@@ -116,14 +105,14 @@ Grace-period latency &
 	        10s of milliseconds &
 		    10s of milliseconds \\
 \hline
-Non-\co{PREEMPT_RT} implementation &
+Non-\tco{PREEMPT_RT} implementation &
     RCU Classic &
 	RCU BH &
 	    RCU Classic &
 	        Preemptible RCU &
 		    SRCU \\
 \hline
-\co{PREEMPT_RT} implementation &
+\tco{PREEMPT_RT} implementation &
     Preemptible RCU &
 	Realtime RCU &
 	    Forced Schedule on all CPUs &
-- 
2.7.4


