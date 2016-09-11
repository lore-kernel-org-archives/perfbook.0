Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=cU/JebSos/EXgvj6PDmFWAao02tEf//CIAdWbPcarI4=;
 b=L5/Yj+5/X+jaFluyVPy9LfbUdvTriKkd4vmwih1yx0+Ki4sSobqtNjAW7aKo7zF7I4
 MzQbmKAuNqvHWqBBRP+FhIBjqzGDZA572eS7QplqJqKuAwnECPmHwbJshq2QXwYL9NFu
 WBwdgL4rkszTdF+zDc9poq1m81ZAca1np78lJojtHs589NQ1BPszPzjSDigJyyqR3sFw
 SqchTaKTFz4VuGhJAi0os36Omc3jdZqB3tjiDJ7ffIvxsimu0huVQp5rif1C3OjJZk+x
 L6NyqXRviSb2Z87/nd1OrMrsyrCy3dfln0ErMnhRRg634XpUpZO4aPF4YAjGA/NFhEAo
 2eOA==
Subject: [RFC PATCH] toyrcu: Enclose 'verbbox' within 'figure'
References: <b76692c9-330c-2531-67dd-b7f445644227@gmail.com>
 <017bdee4-c318-f7f5-95bf-b213b4df86e5@gmail.com>
 <20160908111622.GM3663@linux.vnet.ibm.com>
 <ed8f9798-0ff5-7d96-ef30-b2157af7c4fd@gmail.com>
 <20160910162819.GV32751@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0e40a631-1b13-865a-412b-3e50b532308f@gmail.com>
Date: Sun, 11 Sep 2016 11:49:13 +0900
MIME-Version: 1.0
In-Reply-To: <20160910162819.GV32751@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1cbac7a606ed336367529414512d84005f92bf1f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 11 Sep 2016 11:33:33 +0900
Subject: [RFC PATCH] toyrcu: Enclose 'verbbox' within 'figure'

Bare "verbbox" environment just after a section heading causes
the "afterheading"-ness of the first paragraph.
By enclosing the "verbbox" by a "figure" environment, we can
avoid the side-effect.

This commit does the enclosing by moving \begin{figure} ahead of
\begin{verbbox}.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/toyrcu.tex | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/defer/toyrcu.tex b/defer/toyrcu.tex
index cd334ed..3b5a85c 100644
--- a/defer/toyrcu.tex
+++ b/defer/toyrcu.tex
@@ -33,6 +33,7 @@ provides a summary and a list of desirable RCU properties.
 \subsubsection{Lock-Based RCU}
 \label{defer:Lock-Based RCU}

+\begin{figure}[bp]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -52,7 +53,6 @@ provides a summary and a list of desirable RCU properties.
  15 }
 \end{verbbox}
 }
-\begin{figure}[bp]
 \centering
 \theverbbox
 \caption{Lock-Based RCU Implementation}
@@ -92,6 +92,7 @@ preventing grace-period sharing.
 	also be a deadlock in any other RCU implementation?
 \QuickQuizAnswer{
 %
+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void foo(void)
@@ -115,7 +116,6 @@ preventing grace-period sharing.
  19 }
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{Deadlock in Lock-Based RCU Implementation}
@@ -171,6 +171,7 @@ in the next section.
 \subsubsection{Per-Thread Lock-Based RCU}
 \label{defer:Per-Thread Lock-Based RCU}

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -194,7 +195,6 @@ in the next section.
  19 }
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{Per-Thread Lock-Based RCU Implementation}
@@ -291,6 +291,7 @@ the shortcomings of the lock-based implementation.
 \subsubsection{Simple Counter-Based RCU}
 \label{defer:Simple Counter-Based RCU}

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 atomic_t rcu_refcnt;
@@ -317,7 +318,6 @@ the shortcomings of the lock-based implementation.
  22 }
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{RCU Implementation Using Single Global Reference Counter}
@@ -437,6 +437,7 @@ scheme that is more favorable to writers.
 \subsubsection{Starvation-Free Counter-Based RCU}
 \label{defer:Starvation-Free Counter-Based RCU}

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -446,13 +447,13 @@ scheme that is more favorable to writers.
   5 DEFINE_PER_THREAD(int, rcu_read_idx);
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{RCU Global Reference-Count Pair Data}
 \label{fig:defer:RCU Global Reference-Count Pair Data}
 \end{figure}

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -485,7 +486,6 @@ scheme that is more favorable to writers.
  28 }
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{RCU Read-Side Using Global Reference-Count Pair}
@@ -579,6 +579,7 @@ the selected element of \co{rcu_refcnt}.
 Regardless of the nesting level, line~27 decrements this thread's
 instance of \co{rcu_nesting}.

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void synchronize_rcu(void)
@@ -604,7 +605,6 @@ instance of \co{rcu_nesting}.
  21 }
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{RCU Update Using Global Reference-Count Pair}
@@ -771,6 +771,7 @@ scheme that provides greatly improved read-side performance and scalability.
 \subsubsection{Scalable Counter-Based RCU}
 \label{defer:Scalable Counter-Based RCU}

+\begin{figure}[tb]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -780,13 +781,13 @@ scheme that provides greatly improved read-side performance and scalability.
   5 DEFINE_PER_THREAD(int, rcu_read_idx);
 \end{verbbox}
 }
-\begin{figure}[tb]
 \centering
 \theverbbox
 \caption{RCU Per-Thread Reference-Count Pair Data}
 \label{fig:defer:RCU Per-Thread Reference-Count Pair Data}
 \end{figure}

+\begin{figure}[tb]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -819,7 +820,6 @@ scheme that provides greatly improved read-side performance and scalability.
  28 }
 \end{verbbox}
 }
-\begin{figure}[tb]
 \centering
 \theverbbox
 \caption{RCU Read-Side Using Per-Thread Reference-Count Pair}
@@ -859,6 +859,7 @@ perform atomic operations.
 	But thankfully, it seems that no one runs Linux on 8-bit systems.
 } \QuickQuizEnd

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void flip_counter_and_wait(int i)
@@ -889,7 +890,6 @@ perform atomic operations.
  26 }
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{RCU Update Using Per-Thread Reference-Count Pair}
@@ -978,6 +978,7 @@ concurrent RCU updates.
 \subsubsection{Scalable Counter-Based RCU With Shared Grace Periods}
 \label{defer:Scalable Counter-Based RCU With Shared Grace Periods}

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -987,13 +988,13 @@ concurrent RCU updates.
   5 DEFINE_PER_THREAD(int, rcu_read_idx);
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data}
 \label{fig:defer:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data}
 \end{figure}

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -1026,7 +1027,6 @@ concurrent RCU updates.
  28 }
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
@@ -1051,6 +1051,7 @@ Figure~\ref{fig:defer:RCU Read-Side Using Per-Thread Reference-Count Pair and Sh
 with \co{rcu_idx} now being a \co{long} instead of an
 \co{atomic_t}.

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void flip_counter_and_wait(int ctr)
@@ -1092,7 +1093,6 @@ with \co{rcu_idx} now being a \co{long} instead of an
  37 }
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{RCU Shared Update Using Per-Thread Reference-Count Pair}
@@ -1204,6 +1204,7 @@ thread-local accesses to one, as is done in the next section.
 \subsubsection{RCU Based on Free-Running Counter}
 \label{defer:RCU Based on Free-Running Counter}

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -1212,13 +1213,13 @@ thread-local accesses to one, as is done in the next section.
   4 DEFINE_PER_THREAD(long, rcu_reader_gp_snap);
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{Data for Free-Running Counter Using RCU}
 \label{fig:defer:Data for Free-Running Counter Using RCU}
 \end{figure}

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 static void rcu_read_lock(void)
@@ -1255,7 +1256,6 @@ thread-local accesses to one, as is done in the next section.
 32 }
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{Free-Running Counter Using RCU}
@@ -1394,6 +1394,7 @@ variables.
 \subsubsection{Nestable RCU Based on Free-Running Counter}
 \label{defer:Nestable RCU Based on Free-Running Counter}

+\begin{figure}[tb]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -1404,13 +1405,13 @@ variables.
   6 DEFINE_PER_THREAD(long, rcu_reader_gp);
 \end{verbbox}
 }
-\begin{figure}[tb]
 \centering
 \theverbbox
 \caption{Data for Nestable RCU Using a Free-Running Counter}
 \label{fig:defer:Data for Nestable RCU Using a Free-Running Counter}
 \end{figure}

+\begin{figure}[tb]
 { \scriptsize
 \begin{verbbox}
  1 static void rcu_read_lock(void)
@@ -1456,7 +1457,6 @@ variables.
 41 }
 \end{verbbox}
 }
-\begin{figure}[tb]
 \centering
 \theverbbox
 \caption{Nestable RCU Using a Free-Running Counter}
@@ -1677,6 +1677,7 @@ overhead.
 \subsubsection{RCU Based on Quiescent States}
 \label{defer:RCU Based on Quiescent States}

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -1684,13 +1685,13 @@ overhead.
   3 DEFINE_PER_THREAD(long, rcu_reader_qs_gp);
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{Data for Quiescent-State-Based RCU}
 \label{fig:defer:Data for Quiescent-State-Based RCU}
 \end{figure}

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -1723,7 +1724,6 @@ overhead.
  28 }
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{Quiescent-State-Based RCU Read Side}
@@ -1830,6 +1830,7 @@ The \co{rcu_thread_online()} function simply invokes
 \co{rcu_quiescent_state()}, thus marking the end of the extended
 quiescent state.

+\begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void synchronize_rcu(void)
@@ -1852,7 +1853,6 @@ quiescent state.
  18 }
 \end{verbbox}
 }
-\begin{figure}[tbp]
 \centering
 \theverbbox
 \caption{RCU Update Side Using Quiescent States}
-- 
1.9.1

