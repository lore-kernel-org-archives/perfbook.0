Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=VkNxkcQu6riVliUiSJKKfvErwqkv1VudDns9G/L4rgg=;
 b=1BoTJBrdgsg3LEK7uhDNxDjwk/hdM/76ayl+UYFn3n2ufleqMnokSNBjXzbywIgFxn
 0eEGUHWl2HoGSQc2/wWkfAfSGmjXeftG233BMDhaipnJ8sGVUdF5Z6kETAVyhXczg5G0
 jW2YGjUVk8xZ5Ds6EQfPduwKIlPzu3413eiysCtY68IVIo0VJeC+HFVmZcOnxgl4oOfc
 tmdXfENPTGJO/hPXQc1ZskC6GHpVYgf/iffQeMMxL45VB9NcRpRnVayRyYDmDSDmCY12
 h4s1wkqnVvkOisrfALDnhzNuFv85JlcURKpVey/ZSHGdq/gXh9xv+q/tAB4VDaf/RP6z
 tMag==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] defer/rcuapi: Merge Tables 9.3 and 9.4
Message-ID: <fa1dcdab-7d30-3066-4286-74038c355735@gmail.com>
Date: Sun, 24 Jul 2016 11:39:54 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1e4c0d9ae90cf0f5dcd44a27651614119aebef62 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 24 Jul 2016 10:39:37 +0900
Subject: [PATCH] defer/rcuapi: Merge Tables 9.3 and 9.4

By using "sidewaystable" environment, Tables 9.3 and 9.4 can be
merged into a wider single table.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 112 ++++++++++++++++++++-----------------------------------
 perfbook.tex     |   1 +
 2 files changed, 41 insertions(+), 72 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 183bb8b..6f69115 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -16,159 +16,127 @@ presents concluding remarks.
 \subsubsection{RCU has a Family of Wait-to-Finish APIs}
 \label{sec:defer:RCU has a Family of Wait-to-Finish APIs}

-\begin{table*}[p]
+\begin{sidewaystable*}[htbp]
 \centering
-\scriptsize\tymin=1.1in
-\begin{tabulary}{5.9in}{L|L|L|L|L}
+\scriptsize\tymin=1.4in
+\begin{tabulary}{7.8in}{L|L|L|L|L|L}
 Attribute &
     RCU Classic &
 	RCU BH &
 	    RCU Sched &
-		Realtime RCU \\
+		Realtime RCU &
+		    SRCU \\
 \hline
 \hline
 Purpose &
     Original &
 	Prevent DDoS attacks &
 	    Wait for preempt-disable regions, hardirqs, \& NMIs &
-	        Realtime response \\
+	        Realtime response &
+		    Sleeping readers \\
 \hline
 Availability &
     2.5.43 &
 	2.6.9 &
 	    2.6.12 &
-	        2.6.26 \\
+		2.6.26 &
+		    2.6.19 \\
 \hline
 Read-side primitives &
-    \begin{minipage}[t]{1.0in}{ \raggedright
+    \begin{minipage}[t]{1.4in}{ \raggedright
       \co{rcu_read_lock()}~! \\
       \co{rcu_read_unlock()}~! }\end{minipage} &
-	\begin{minipage}[t]{1.0in}{ \raggedright
+	\begin{minipage}[t]{1.4in}{ \raggedright
 	  \co{rcu_read_lock_bh()} \\
 	  \co{rcu_read_unlock_bh()} }\end{minipage} &
-	    \begin{minipage}[t]{1.0in}{ \raggedright
+	    \begin{minipage}[t]{1.4in}{ \raggedright
 	      \co{preempt_disable()} \\
 	      \co{preempt_enable()} \\
 	      (and friends) }\end{minipage} &
-	        \begin{minipage}[t]{1.0in}{ \raggedright
+	        \begin{minipage}[t]{1.4in}{ \raggedright
 		  \co{rcu_read_lock()} \\
-		  \co{rcu_read_unlock()} }\end{minipage} \\
+		  \co{rcu_read_unlock()} }\end{minipage} &
+		    \begin{minipage}[t]{1.4in}{ \raggedright
+		      \co{srcu_read_lock()} \\
+		      \co{srcu_read_unlock()} }\end{minipage} \\
 \hline
 { Update-side primitives (synchronous) } &
     { \co{synchronize_rcu()} \co{synchronize_net()} } &
 	\co{synchronize_rcu_bh()} &
 	    \co{synchronize_sched()} &
-	        { \co{synchronize_rcu()} \co{synchronize_net()} } \\
+	        { \co{synchronize_rcu()} \co{synchronize_net()} } &
+		    \co{synchronize_srcu()} \\
 \hline
 { Update-side primitives (asynchronous/callback) } &
     \co{call_rcu()} ! &
 	\co{call_rcu_bh()} &
 	    \co{call_rcu_sched()} &
-	        \co{call_rcu()} \\
+	        \co{call_rcu()} &
+		    \co{call_srcu()} \\
 \hline
 { Update-side primitives (wait for callbacks) } &
     \co{rcu_barrier()} &
 	\co{rcu_barrier_bh()} &
 	    \co{rcu_barrier_sched()} &
-	        \co{rcu_barrier()} \\
+	        \co{rcu_barrier()} &
+		    N/A \\
 \hline
 Type-safe memory &
     \co{SLAB_DESTROY_BY_RCU} &
 	&
 	    &
-	        \co{SLAB_DESTROY_BY_RCU} \\
+	        \co{SLAB_DESTROY_BY_RCU} &
+		    \\
 \hline
 Read side constraints &
     No blocking &
 	No bottom-half (BH) enabling &
 	    No blocking &
-	        Only preemption and lock acquisition \\
+	        Only preemption and lock acquisition &
+		    No \co{synchronize_srcu()} wtih same \co{srcu_struct} \\
 \hline
 Read side overhead &
     Preempt disable/enable (free on non-PREEMPT) &
 	BH disable/enable &
 	    Preempt disable/enable (free on non-PREEMPT) &
-	        Simple instructions, irq disable/enable \\
+	        Simple instructions, irq disable/enable &
+		    Simple instructions, preempt disable/enable, memory barriers \\
 \hline
 Asynchronous update-side overhead &
     sub-microsecond &
 	sub-microsecond &
 	    sub-microsecond &
-	        sub-microsecond \\
+	        sub-microsecond &
+		    N/A \\
 \hline
 Grace-period latency &
     10s of milliseconds &
 	10s of milliseconds &
 	    10s of milliseconds &
-	        10s of milliseconds \\
+	        10s of milliseconds &
+		    10s of milliseconds \\
 \hline
 Non-\co{PREEMPT_RT} implementation &
     RCU Classic &
 	RCU BH &
 	    RCU Classic &
-	        Preemptible RCU \\
+	        Preemptible RCU &
+		    SRCU \\
 \hline
 \co{PREEMPT_RT} implementation &
     Preemptible RCU &
 	Realtime RCU &
 	    Forced Schedule on all CPUs &
-	        Realtime RCU \\
+	        Realtime RCU &
+		    SRCU \\
 \end{tabulary}
 \caption{RCU Wait-to-Finish APIs}
 \label{tab:defer:RCU Wait-to-Finish APIs}
-\end{table*}
-
-\begin{table*}[p]
-\centering
-\scriptsize\tymin=1.1in\tymax=1.5in
-\begin{tabulary}{4.5in}{L|L}
-Attribute &
-    SRCU \\
-\hline
-\hline
-Purpose &
-    Sleeping readers \\
-\hline
-Availability &
-    2.6.19 \\
-\hline
-Read-side primitives &
-    \begin{minipage}[t]{1.5in}{ \raggedright
-      \co{srcu_read_lock()} \\
-      \co{srcu_read_unlock()} }\end{minipage} \\
-\hline
-Update-side primitives (synchronous) &
-    \co{synchronize_srcu()} \\
-\hline
-Update-side primitives (asynchronous/callback) &
-    \co{call_srcu()} \\
-\hline
-Update-side primitives (wait for callbacks) &
-    N/A \\
-\hline
-Type-safe memory &
-    \\
-\hline
-Read side constraints &
-    No \co{synchronize_srcu()} wtih same \co{srcu_struct} \\
-\hline
-Read side overhead &
-    Simple instructions, preempt disable/enable, memory barriers \\
-\hline
-Asynchronous update-side overhead &
-    N/A \\
-\hline
-Grace-period latency &
-    10s of milliseconds \\
-\end{tabulary}
-\caption{Sleepable RCU Wait-to-Finish APIs}
-\label{tab:defer:Sleepable RCU Wait-to-Finish APIs}
-\end{table*}
+\end{sidewaystable*}

 The most straightforward answer to ``what is RCU'' is that RCU is
 an API used in the Linux kernel, as summarized by
-Tables~\ref{tab:defer:RCU Wait-to-Finish APIs} and
-\ref{tab:defer:Sleepable RCU Wait-to-Finish APIs},
+Table~\ref{tab:defer:RCU Wait-to-Finish APIs},
 which shows the wait-for-RCU-readers portions of the non-sleepable and
 sleepable APIs, respectively,
 and by
@@ -386,7 +354,7 @@ elsewhere~\cite{PaulEMcKenney2007PreemptibleRCU}.
 } \QuickQuizEnd

 The ``SRCU'' column in
-Table~\ref{tab:defer:Sleepable RCU Wait-to-Finish APIs}
+Table~\ref{tab:defer:RCU Wait-to-Finish APIs}
 displays a specialized RCU API that permits
 general sleeping in RCU read-side critical
 sections~\cite{PaulEMcKenney2006c}.
diff --git a/perfbook.tex b/perfbook.tex
index 493c05a..9216485 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -15,6 +15,7 @@
 \usepackage{subfigure}
 % \usepackage{breakurl}
 \usepackage{graphicx}
+\usepackage{rotating}
 \usepackage{enumerate}
 \usepackage{ifthen}
 \usepackage{xcolor}
-- 
1.9.1

