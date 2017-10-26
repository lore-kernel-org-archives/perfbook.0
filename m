Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MhnXe/9+6OFWYFkck4TcSUta7UmYE7NIK0c42PkhikQ=;
 b=ByuCc4Y8TYKP9chpWKK33RWrOYkrXdFEiNLXd2uv0G88XoI1ZRwhOuqJqlzPjtvPNy
 297Xw2j24QoXyWMiOwA3QRULs8Iwe2ZA5ux+T7Xg84tvePCkGMCqOQOCvcc7aqhy/cpg
 91NByB6XtpzescqSHCzfzxgGbygUR73v93bjVfWl0fgSIruDmvO6cxXSwf9+HHZBOlNm
 P5LiAeLb6MiQruZQwipchouygVFCdgRoOrsNU48VNodL7LfA01pkQN504K3xZqjEiGdy
 GMH881lEJe0CvDAquw9rNqpn+lt1YxQ1C2j/OeodK4xgdUSjua9AsN7IqNb0aCfRWfLV
 Kjnw==
Subject: [PATCH 5/5] Tweak figure size
References: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1fb0b064-7f33-d40a-cb07-9b29ebe69482@gmail.com>
Date: Fri, 27 Oct 2017 07:57:08 +0900
MIME-Version: 1.0
In-Reply-To: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 263fa8f220207903d6c41bddb773b113b65dd98f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Oct 2017 00:18:32 +0900
Subject: [PATCH 5/5] Tweak figure size

Some of the figures are rendered too large or too small.
This commit tweaks argmuents of \resizebox{} macros to make those
figures look consistent in their sizes.

Two figures in advsync/rt.tex was too small with the column width
of 2c layout. They are converted to "figure*" environments with
larger widths.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex     | 14 +++++++-------
 advsync/rt.tex              | 12 ++++++------
 appendix/questions/time.tex |  2 +-
 count/count.tex             |  4 ++--
 defer/rcufundamental.tex    |  2 +-
 future/QC.tex               |  2 +-
 future/cpu.tex              |  4 ++--
 future/tm.tex               |  4 ++--
 intro/intro.tex             |  2 +-
 memorder/memorder.tex       |  2 +-
 10 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 56eac22..656adda 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -45,7 +45,7 @@ takes a brief look beyond partitioning.

 \begin{figure}[tb]
 \centering
-\includegraphics{SMPdesign/LockGranularity}
+\resizebox{1.2in}{!}{\includegraphics{SMPdesign/LockGranularity}}
 \caption{Design Patterns and Lock Granularity}
 \label{fig:SMPdesign:Design Patterns and Lock Granularity}
 \end{figure}
@@ -268,7 +268,7 @@ in the next section.

 \begin{figure}[tbh]
 \centering
-\resizebox{3in}{!}{\includegraphics{cartoons/r-2014-Data-one-fighting}}
+\resizebox{2.5in}{!}{\includegraphics{cartoons/r-2014-Data-one-fighting}}
 \caption{Lock Contention}
 \ContributedBy{Figure}{fig:SMPdesign:Lock Contention}{Melissa Broussard}
 \end{figure}
@@ -352,7 +352,7 @@ systems~\cite{Beck85,Inman85,Garg90,Dove90,McKenney92b,McKenney92a,McKenney93}.

 \begin{figure}[tbh]
 \centering
-\resizebox{3in}{!}{\includegraphics{cartoons/r-2014-Data-many-happy}}
+\resizebox{2.4in}{!}{\includegraphics{cartoons/r-2014-Data-many-happy}}
 \caption{Data Locking}
 \ContributedBy{Figure}{fig:SMPdesign:Data Locking}{Melissa Broussard}
 \end{figure}
@@ -387,7 +387,7 @@ shown in Figure~\ref{fig:SMPdesign:Data and Skew}.

 \begin{figure}[tbh]
 \centering
-\resizebox{3in}{!}{\includegraphics{cartoons/r-2014-Data-many-fighting}}
+\resizebox{\twocolumnwidth}{!}{\includegraphics{cartoons/r-2014-Data-many-fighting}}
 \caption{Data Locking and Skew}
 \ContributedBy{Figure}{fig:SMPdesign:Data and Skew}{Melissa Broussard}
 \end{figure}
@@ -772,8 +772,8 @@ as depicted in Figure~\ref{fig:SMPdesign:Parallel-Fastpath Design Patterns}:

 \begin{figure}[tbp]
 \centering
-% \resizebox{3in}{!}{\includegraphics{SMPdesign/ParallelFastpath}}
-\includegraphics{SMPdesign/ParallelFastpath}
+\resizebox{2.3in}{!}{\includegraphics{SMPdesign/ParallelFastpath}}
+% \includegraphics{SMPdesign/ParallelFastpath}
 \caption{Parallel-Fastpath Design Patterns}
 \label{fig:SMPdesign:Parallel-Fastpath Design Patterns}
 \end{figure}
@@ -1045,7 +1045,7 @@ smaller than the number of non-\co{NULL} pointers.

 \begin{figure}[tbp]
 \centering
-\resizebox{3in}{!}{\includegraphics{SMPdesign/AllocatorPool}}
+\resizebox{2.6in}{!}{\includegraphics{SMPdesign/AllocatorPool}}
 \caption{Allocator Pool Schematic}
 \label{fig:SMPdesign:Allocator Pool Schematic}
 \end{figure}
diff --git a/advsync/rt.tex b/advsync/rt.tex
index 8740e93..ac8cf1a 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -971,12 +971,12 @@ In short, the Linux kernel's -rt patchset uses timer wheels for
 error-handling timeouts and a tree for timer events, providing each
 category the required quality of service.

-\begin{figure}[tb]
+\begin{figure*}[tb]
 \centering
-\resizebox{3.0in}{!}{\includegraphics{advsync/irq}}
+\resizebox{1.4\twocolumnwidth}{!}{\includegraphics{advsync/irq}}
 \caption{Non-Threaded Interrupt Handler}
 \label{fig:advsync:Non-Threaded Interrupt Handler}
-\end{figure}
+\end{figure*}

 \paragraph{Threaded interrupts}
 are used to address a significant source of degraded real-time latencies,
@@ -991,12 +991,12 @@ Worse yet are devices that can deliver new events to a still-running
 interrupt handler, as such an interrupt handler might well run
 indefinitely, thus indefinitely degrading real-time latencies.

-\begin{figure}[tb]
+\begin{figure*}[tb]
 \centering
-\resizebox{3.0in}{!}{\includegraphics{advsync/threaded-irq}}
+\resizebox{1.4\twocolumnwidth}{!}{\includegraphics{advsync/threaded-irq}}
 \caption{Threaded Interrupt Handler}
 \label{fig:advsync:Threaded Interrupt Handler}
-\end{figure}
+\end{figure*}

 One way of addressing this problem is the use of threaded interrupts shown in
 Figure~\ref{fig:advsync:Threaded Interrupt Handler}.
diff --git a/appendix/questions/time.tex b/appendix/questions/time.tex
index 137375e..1bbb052 100644
--- a/appendix/questions/time.tex
+++ b/appendix/questions/time.tex
@@ -6,7 +6,7 @@

 \begin{figure}[htb]
 \centering
-\resizebox{3in}{!}{\includegraphics{cartoons/r-2014-What-time-is-it}}
+\resizebox{2.6in}{!}{\includegraphics{cartoons/r-2014-What-time-is-it}}
 \caption{What Time Is It?}
 \ContributedBy{Figure}{fig:app:questions:What Time Is It?}{Melissa Broussard}
 \end{figure}
diff --git a/count/count.tex b/count/count.tex
index 9a4835d..900c384 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -353,7 +353,7 @@ decidedly non-ideal, and gets worse as you add CPUs.

 \begin{figure}[tb]
 \centering
-\resizebox{3in}{!}{\includegraphics{cartoons/r-2014-One-one-thousand}}
+\resizebox{3.2in}{!}{\includegraphics{cartoons/r-2014-One-one-thousand}}
 \caption{Waiting to Count}
 \ContributedBy{Figure}{fig:count:Waiting to Count}{Melissa Broussard}
 \end{figure}
@@ -1408,7 +1408,7 @@ Section~\ref{sec:SMPdesign:Parallel Fastpath}.

 \begin{figure}[tb]
 \centering
-\resizebox{3in}{!}{\includegraphics{count/count_lim}}
+\resizebox{2.5in}{!}{\includegraphics{count/count_lim}}
 \caption{Simple Limit Counter Variable Relationships}
 \label{fig:count:Simple Limit Counter Variable Relationships}
 \end{figure}
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 9b0ffa7..ef3e4d4 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -215,7 +215,7 @@ absolutely no code.

 \begin{figure}[tb]
 \centering
-\resizebox{3in}{!}{\includegraphics{defer/Linux_list_abbr}}
+\resizebox{1.8in}{!}{\includegraphics{defer/Linux_list_abbr}}
 \caption{Linux Linked List Abbreviated}
 \label{fig:defer:Linux Linked List Abbreviated}
 \end{figure}
diff --git a/future/QC.tex b/future/QC.tex
index f470de5..70245f9 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -286,7 +286,7 @@ challenges from mathematicians.

 \begin{figure}[tb]
 \centering
-\resizebox{2.5in}{!}{\includegraphics{future/Bloch_Sphere}}
+\resizebox{2.2in}{!}{\includegraphics{future/Bloch_Sphere}}
 \caption{Qubit as Bloch Sphere}
 \label{fig:future:Qubit as Bloch Sphere}
 \end{figure}
diff --git a/future/cpu.tex b/future/cpu.tex
index 31cbc18..977140f 100644
--- a/future/cpu.tex
+++ b/future/cpu.tex
@@ -22,14 +22,14 @@ With that in mind, consider the following scenarios:

 \begin{figure}[tb]
 \centering
-\resizebox{3in}{!}{\includegraphics{cartoons/r-2014-CPU-Future-Multithreaded-Mania}}
+\resizebox{2.6in}{!}{\includegraphics{cartoons/r-2014-CPU-Future-Multithreaded-Mania}}
 \caption{Multithreaded Mania}
 \ContributedBy{Figure}{fig:future:Multithreaded Mania}{Melissa Broussard}
 \end{figure}

 \begin{figure}[tb]
 \centering
-\resizebox{3in}{!}{\includegraphics{cartoons/r-2014-CPU-Future-More-of-the-Same}}
+\resizebox{2.5in}{!}{\includegraphics{cartoons/r-2014-CPU-Future-More-of-the-Same}}
 \caption{More of the Same}
 \ContributedBy{Figure}{fig:future:More of the Same}{Melissa Broussard}
 \end{figure}
diff --git a/future/tm.tex b/future/tm.tex
index 8420331..c6c1291 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -1027,7 +1027,7 @@ And vice versa.

 \begin{figure}[tb]
 \centering
-\resizebox{3in}{!}{\includegraphics{cartoons/TM-the-reality-conflict}}
+\resizebox{2.7in}{!}{\includegraphics{cartoons/TM-the-reality-conflict}}
 \caption{The STM Reality: Conflicts}
 \ContributedBy{Figure}{fig:future:The STM Reality: Conflicts}{Melissa Broussard}
 \end{figure}
@@ -1041,7 +1041,7 @@ And vice versa.

 \begin{figure}[tb]
 \centering
-\resizebox{3in}{!}{\includegraphics{cartoons/TM-the-reality-realtime}}
+\resizebox{2.7in}{!}{\includegraphics{cartoons/TM-the-reality-realtime}}
 \caption{The STM Reality: Realtime Response}
 \ContributedBy{Figure}{fig:future:The STM Reality: Realtime Response}{Melissa Broussard}
 \end{figure}
diff --git a/intro/intro.tex b/intro/intro.tex
index 293a02f..12a2b20 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -562,7 +562,7 @@ programming environments:

 \begin{figure}[tb]
 \centering
-\resizebox{3in}{!}{\includegraphics{intro/PPGrelation}}
+\resizebox{2in}{!}{\includegraphics{intro/PPGrelation}}
 \caption{Software Layers and Performance, Productivity, and Generality}
 \label{fig:intro:Software Layers and Performance, Productivity, and Generality}
 \end{figure}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 7fa190a..f0e65ee 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -205,7 +205,7 @@ residing in other CPUs' caches.

 \begin{figure}[htb]
 \centering
-\resizebox{3in}{!}{\includegraphics{cartoons/r-2014-Out-of-order}}
+\resizebox{2.4in}{!}{\includegraphics{cartoons/r-2014-Out-of-order}}
 \caption{CPUs Can Do Things Out of Order}
 \ContributedBy{Figure}{fig:memorder:CPUs Can Do Things Out of Order}{Melissa Broussard}
 \end{figure}
-- 
2.7.4


