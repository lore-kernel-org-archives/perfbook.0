Return-Path: <SRS0=kQd0=JB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=VwvDeAQ9PcEryBK2h0CyidpwnMLQtTZgRZscVHXSjc8=;
        b=u7im2KVqR0zR1n1X82VEqGJwNHmG3xLAmQRokaMzBDgago1FD3j41Tgj64TtvYf7fU
         pOnsPkJpv/7Wp0ohs46FuEd6XRWiIB0BmEzKql7ea0j7dqqL8pRpUhoRr8kRYgkSerB7
         H4WTjDUFgv5kzBZp5HiDvpvULcFIeLdDdZ752zNTIPwev1HKmK99yV8/sUDx2ywZXTD4
         1h4wQlUOkJp7/5eDBSOwlbK4NJAdQPcGLZHuNNuqcSqk5uMY0gejLIN1cFaZMmzasBAQ
         UHrsrtc6miRyrNehlvw2c3rE88aXRD0zDd/j98JSMdhpwIeUN7U3zbeM28aeFsa0b2th
         KF+Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] treewide: Mark non-end-of-sentence full-stop of 'vs.' as such
Message-ID: <1e5b1f2b-eb94-78a9-e882-387d94897f1c@gmail.com>
Date: Mon, 5 Apr 2021 07:46:09 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Note:
    Label strings can't have any of ".\ ", ".~", or ".\@".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex       |  2 +-
 SMPdesign/beyond.tex          |  6 +++---
 advsync/rt.tex                |  2 +-
 datastruct/datastruct.tex     |  2 +-
 defer/rcuusage.tex            | 12 ++++++------
 formal/axiomatic.tex          |  2 +-
 future/cpu.tex                |  4 ++--
 intro/intro.tex               |  2 +-
 toolsoftrade/toolsoftrade.tex |  2 +-
 9 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 7d0acd52..0250ffc6 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -102,7 +102,7 @@ handle the communications load.
 \begin{figure}[tbp]
 \centering
 \resizebox{3in}{!}{\includegraphics{SMPdesign/CPUvsEnet}}
-\caption{Ethernet Bandwidth vs. Intel x86 CPU Performance}
+\caption{Ethernet Bandwidth vs.\@ Intel x86 CPU Performance}
 \label{fig:SMPdesign:Ethernet Bandwidth vs. Intel x86 CPU Performance}
 \end{figure}
 
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index b4248dc0..ef0cd702 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -543,14 +543,14 @@ on one thread being within about 30\,\% of PART on two threads
 \begin{figure}[tb]
 \centering
 \resizebox{2.2in}{!}{\includegraphics{SMPdesign/500-ms_seqO3VfgO3_partO3-median}}
-\caption{Varying Maze Size vs. SEQ}
+\caption{Varying Maze Size vs.\@ SEQ}
 \label{fig:SMPdesign:Varying Maze Size vs. SEQ}
 \end{figure}
 
 \begin{figure}[tb]
 \centering
 \resizebox{2.2in}{!}{\includegraphics{SMPdesign/500-ms_2seqO3VfgO3_partO3-median}}
-\caption{Varying Maze Size vs. COPART}
+\caption{Varying Maze Size vs.\@ COPART}
 \label{fig:SMPdesign:Varying Maze Size vs. COPART}
 \end{figure}
 
@@ -575,7 +575,7 @@ were generated using -O3.
 \begin{figure}[tb]
 \centering
 \resizebox{2.2in}{!}{\includegraphics{SMPdesign/1000-ms_2seqO3VfgO3_partO3-mean}}
-\caption{Mean Speedup vs. Number of Threads, 1000x1000 Maze}
+\caption{Mean Speedup vs.\@ Number of Threads, 1000x1000 Maze}
 \label{fig:SMPdesign:Mean Speedup vs. Number of Threads, 1000x1000 Maze}
 \end{figure}
 
diff --git a/advsync/rt.tex b/advsync/rt.tex
index 94469f0c..f5e8e685 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1975,7 +1975,7 @@ on \clnrefrange{upd:b}{upd:e}.
 This example shows how RCU can provide deterministic read-side
 data-structure access to real-time programs.
 
-\subsection{Real Time vs. Real Fast: How to Choose?}
+\subsection{Real Time vs.\@ Real Fast: How to Choose?}
 \label{sec:advsync:Real Time vs. Real Fast: How to Choose?}
 
 The choice between real-time and real-fast computing can be a difficult one.
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 682a895b..dfc06658 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1511,7 +1511,7 @@ the old hash table, and finally line~\lnref{ret_success} returns success.
 \begin{figure}[tb]
 \centering
 \resizebox{2.7in}{!}{\includegraphics{datastruct/perftestresize}}
-\caption{Overhead of Resizing Hash Tables Between 262,144 and 524,288 Buckets vs. Total Number of Elements}
+\caption{Overhead of Resizing Hash Tables Between 262,144 and 524,288 Buckets vs.\@ Total Number of Elements}
 \label{fig:datastruct:Overhead of Resizing Hash Tables Between 262,144 and 524,288 Buckets vs. Total Number of Elements}
 \end{figure}
 % Data from CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index a61e0421..0f8f84ea 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -553,7 +553,7 @@ locking to RCU non-trivial.
 \begin{figure}[tb]
 \centering
 \resizebox{3in}{!}{\includegraphics{defer/rwlockRCUupdate}}
-\caption{Response Time of RCU vs. Reader-Writer Locking}
+\caption{Response Time of RCU vs.\@ Reader-Writer Locking}
 \label{fig:defer:Response Time of RCU vs. Reader-Writer Locking}
 \end{figure}
 
@@ -637,7 +637,7 @@ harmless, including use of the asynchronous interfaces where available
 is a major reason for the rule of thumb that RCU be used in read-mostly
 situations.
 
-\paragraph{Code: Reader-Writer Locking vs. RCU Code}
+\paragraph{Code: Reader-Writer Locking vs.\@ RCU Code}
 
 In the best case, the conversion from reader-writer locking to RCU
 is quite simple, as shown in
@@ -742,7 +742,7 @@ More-elaborate cases of replacing reader-writer locking with RCU
 may be found
 elsewhere~\cite{NeilBrown2015PathnameLookup,NeilBrown2015RCUwalk}.
 
-\paragraph{Semantics: Reader-Writer Locking vs. RCU Semantics}
+\paragraph{Semantics: Reader-Writer Locking vs.\@ RCU Semantics}
 
 Reader-writer locking semantics can be roughly and informally summarized
 by the following three temporal constraints:
@@ -854,14 +854,14 @@ Section~\ref{sec:together:Refurbish Reference Counting}.
 \begin{figure}[tb]
 \centering
 \resizebox{2.5in}{!}{\includegraphics{defer/refcntRCUperf}}
-\caption{Performance of RCU vs. Reference Counting}
+\caption{Performance of RCU vs.\@ Reference Counting}
 \label{fig:defer:Performance of RCU vs. Reference Counting}
 \end{figure}
 
 \begin{figure}[tb]
 \centering
 \resizebox{2.5in}{!}{\includegraphics{defer/refRCUperfPREEMPT}}
-\caption{Performance of Preemptible RCU vs. Reference Counting}
+\caption{Performance of Preemptible RCU vs.\@ Reference Counting}
 \label{fig:defer:Performance of Preemptible RCU vs. Reference Counting}
 \end{figure}
 
@@ -880,7 +880,7 @@ one CPU up to about three orders of magnitude at 192~CPUs.
 \begin{figure}[tb]
 \centering
 \resizebox{2.5in}{!}{\includegraphics{defer/refRCUperfwt}}
-\caption{Response Time of RCU vs. Reference Counting, 192 CPUs}
+\caption{Response Time of RCU vs.\@ Reference Counting, 192 CPUs}
 \label{fig:defer:Response Time of RCU vs. Reference Counting}
 \end{figure}
 
diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 663863d7..ecef2785 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -228,7 +228,7 @@ And in this case, the \co{herd} tool's output features the string
 	5 & 4.905 \\
 	\bottomrule
 \end{tabular}
-\caption{Locking: Modeling vs. Emulation Time (s)}
+\caption{Locking: Modeling vs.\@ Emulation Time (s)}
 \label{tab:formal:Locking: Modeling vs. Emulation Time (s)}
 \end{table}
 
diff --git a/future/cpu.tex b/future/cpu.tex
index 9552a0b4..1633a4a6 100644
--- a/future/cpu.tex
+++ b/future/cpu.tex
@@ -185,7 +185,7 @@ Servers seem to be choosing the former, while embedded systems on a chip
 \epsfxsize=3in
 \epsfbox{future/be-lb-n4-rf-all}
 % from Ph.D. thesis: an/plots/be-lb-n4-rf-all.eps
-\caption{Breakevens vs. $r$, $\lambda$ Large, Four CPUs}
+\caption{Breakevens vs.\@ $r$, $\lambda$ Large, Four CPUs}
 \label{fig:future:Breakevens vs. r; lambda Large; Four CPUs}
 \end{figure}
 
@@ -194,7 +194,7 @@ Servers seem to be choosing the former, while embedded systems on a chip
 \epsfxsize=3in
 \epsfbox{future/be-lw-n4-rf-all}
 % from Ph.D. thesis: an/plots/be-lw-n4-rf-all.eps
-\caption{Breakevens vs. $r$, $\lambda$ Small, Four CPUs}
+\caption{Breakevens vs.\@ $r$, $\lambda$ Small, Four CPUs}
 \label{fig:future:Breakevens vs. r; Worst-Case lambda; Four CPUs}
 \end{figure}
 
diff --git a/intro/intro.tex b/intro/intro.tex
index b2a03f83..4d772a25 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -1034,7 +1034,7 @@ ownership.
 Many traditional parallel-programming concerns such as deadlock,
 livelock, and transaction rollback stem from this coordination.
 This framework can be elaborated to include comparisons
-of these synchronization mechanisms, for example locking vs. transactional
+of these synchronization mechanisms, for example locking vs.\@ transactional
 memory~\cite{McKenney2007PLOSTM}, but such elaboration is beyond the
 scope of this section.
 (See
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index bf34d2ca..67b0a371 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -874,7 +874,7 @@ Line~\lnref{mov_cnt} moves the lock-acquisition count to this thread's element o
 \begin{figure}[tb]
 \centering
 \resizebox{3in}{!}{\includegraphics{CodeSamples/toolsoftrade/rwlockscale}}
-\caption{Reader-Writer Lock Scalability vs. Microseconds in Critical Section on 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10GHz}
+\caption{Reader-Writer Lock Scalability vs.\@ Microseconds in Critical Section on 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10GHz}
 \label{fig:toolsoftrade:Reader-Writer Lock Scalability vs. Microseconds in Critical Section}
 \end{figure}
 
-- 
2.17.1

