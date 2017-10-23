Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BlBPEg09Da31xNnRkksLrt9kpRreL3PUGvTWc0StcIc=;
 b=ssCGOOYPxUWQWnS9i0evyaGm6y9E9efCc8DxoL64qb4LU+9J8PAon/OHTO+jWVv1Ks
 7tDjvtaRXTr+ofJhx4BhUdMnEe+ZZvxCCrYVVojHpEuSPiJu69V6NFT5pC0LP1UpHQWn
 JQ0n74uWu+DIUtbJYMdwA1AAZyWO5Nh+BU6UVTSeXsnWzUBuFiA2TRj3/O4dL6TyXZJn
 IfUskNON7VAlEXI9v953zAVGbUzQ76oSubCJNS+uOFb9D0p10GBeXtK7EGRG1qXrwYZm
 RNj4Re9kqrcJYaWMFL8CFTfEyBmro0oE5zmcUi7696MZHqTsA+xDRh9pAdUN170yuujb
 TH9A==
Subject: [PATCH 2/3] defer/rcuapi: Update table layout
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
 <20171023022430.GJ3659@linux.vnet.ibm.com>
 <96ff162d-2670-3038-f9c8-c6921d4f374c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1e54c239-f1b3-8560-0da9-48051a35a59e@gmail.com>
Date: Tue, 24 Oct 2017 00:29:10 +0900
MIME-Version: 1.0
In-Reply-To: <96ff162d-2670-3038-f9c8-c6921d4f374c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 953186f749ee9052636fc52b04c2830a35c4de75 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 23 Oct 2017 23:15:10 +0900
Subject: [PATCH 2/3] defer/rcuapi: Update table layout

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 874b8b1..6da4676 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -17,112 +17,103 @@ presents concluding remarks.
 \label{sec:defer:RCU has a Family of Wait-to-Finish APIs}

 \begin{sidewaystable*}[htbp]
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.3}
 \centering
 \footnotesize
-\begin{tabularx}{7.9in}{>{\raggedright\arraybackslash}p{1.08in}|
-    >{\raggedright\arraybackslash}X|
-    >{\raggedright\arraybackslash}X|
-    >{\raggedright\arraybackslash}X|
-    >{\raggedright\arraybackslash}X|
+\begin{tabularx}{7.9in}{>{\raggedright\arraybackslash}p{1.08in}
+    >{\raggedright\arraybackslash}X
+    >{\raggedright\arraybackslash}X
+    >{\raggedright\arraybackslash}X
+    >{\raggedright\arraybackslash}X
     >{\raggedright\arraybackslash}p{1.22in}}
+\toprule
 Attribute &
     RCU Classic &
 	RCU BH &
 	    RCU Sched &
 		Realtime RCU &
 		    SRCU \\
-\hline
-\hline
+\midrule
 Purpose &
     Original &
 	Prevent DDoS attacks &
 	    Wait for preempt-disable regions, hardirqs, \& NMIs &
 	        Realtime response &
 		    Sleeping readers \\
-\hline
 Availability &
     2.5.43 &
 	2.6.9 &
 	    2.6.12 &
 		2.6.26 &
 		    2.6.19 \\
-\hline
 Read-side primitives &
     \tco{rcu_read_lock()}~! \tco{rcu_read_unlock()}~! &
 	\tco{rcu_read_lock_bh()} \tco{rcu_read_unlock_bh()} &
 	    \tco{preempt_disable()} \tco{preempt_enable()} (and friends) &
 	        \tco{rcu_read_lock()} \tco{rcu_read_unlock()} &
 		    \tco{srcu_read_lock()} \tco{srcu_read_unlock()} \\
-\hline
 { Update-side primitives (synchronous) } &
     { \tco{synchronize_rcu()} \tco{synchronize_net()} } &
 	\tco{synchronize_rcu_bh()} &
 	    \tco{synchronize_sched()} &
 	        { \tco{synchronize_rcu()} \tco{synchronize_net()} } &
 		    \tco{synchronize_srcu()} \\
-\hline
 { Update-side primitives (asynchronous/callback) } &
     \tco{call_rcu()} ! &
 	\tco{call_rcu_bh()} &
 	    \tco{call_rcu_sched()} &
 	        \tco{call_rcu()} &
 		    \tco{call_srcu()} \\
-\hline
 { Update-side primitives (wait for callbacks) } &
     \tco{rcu_barrier()} &
 	\tco{rcu_barrier_bh()} &
 	    \tco{rcu_barrier_sched()} &
 	        \tco{rcu_barrier()} &
 		    N/A \\
-\hline
 Type-safe memory &
     \tco{SLAB_DESTROY_BY_RCU} &
 	&
 	    &
 	        \tco{SLAB_DESTROY_BY_RCU} &
 		    \\
-\hline
 Read side constraints &
     No blocking &
 	No bottom-half (BH) enabling &
 	    No blocking &
 	        Only preemption and lock acquisition &
 		    No \tco{synchronize_srcu()} with same \tco{srcu_struct} \\
-\hline
 Read side overhead &
     Preempt disable/enable (free on non-\tco{PREEMPT}) &
 	BH disable/enable &
 	    Preempt disable/enable (free on non-\tco{PREEMPT}) &
 	        Simple instructions, \IRQ\ disable/enable &
 		    Simple instructions, preempt disable/enable, memory barriers \\
-\hline
 Asynchronous update-side overhead &
     sub-microsecond &
 	sub-microsecond &
 	    sub-microsecond &
 	        sub-microsecond &
 		    N/A \\
-\hline
 Grace-period latency &
     10s of milliseconds &
 	10s of milliseconds &
 	    10s of milliseconds &
 	        10s of milliseconds &
 		    10s of milliseconds \\
-\hline
 Non-\tco{PREEMPT_RT} implementation &
     RCU Classic &
 	RCU BH &
 	    RCU Classic &
 	        Preemptible RCU &
 		    SRCU \\
-\hline
 \tco{PREEMPT_RT} implementation &
     Preemptible RCU &
 	Realtime RCU &
 	    Forced Schedule on all CPUs &
 	        Realtime RCU &
 		    SRCU \\
+\bottomrule
 \end{tabularx}
 \caption{RCU Wait-to-Finish APIs}
 \label{tab:defer:RCU Wait-to-Finish APIs}
-- 
2.7.4


