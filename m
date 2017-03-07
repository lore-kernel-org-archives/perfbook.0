Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=YbjofGfwb4NRNyU41189VQU5IhQtR9QN1Ft8EFfl5LQ=;
 b=EdO9SnMscdq1gQZEbEMsPArNDK1QD63f6Me8HoXFaiPIeeJdEWrDkvVp6EAx4KW1ce
 cMOrN1z87A5QC7tr9y2fvJ6QyLW/Oy5e9y61SYs0QMT7wjomIQ3XYgv1NK/GkJFknL1c
 d6i6gVAebRmKnk0cCq4Atd+Abcn65Z8JTm945u/hByzh9QKgkyHwE3iOaDX5Dmje2rvi
 NAMWXrfuFHi7KrlcsA/mvZS5J+Tk/kQhq08pDe7CjWh1IGGE/qa+vfxahpHsh2ITQX9w
 uhsLQeCrUZUUZl6OreWXFcmqo/ngNNbolWKIkXWOQKGTouzK0ghB4ptJl+foB3/KrQ9d
 HmCQ==
Subject: [PATCH 2/3] treewide: Use \tco{} for api name in caption
References: <288315d7-4311-6734-b7d3-446deca6a727@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2fe9a229-4cef-3d32-b91e-a7b275933f40@gmail.com>
Date: Wed, 8 Mar 2017 00:02:24 +0900
MIME-Version: 1.0
In-Reply-To: <288315d7-4311-6734-b7d3-446deca6a727@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7c0c10ba897e0c2830a8cc965d8dde00fb018179 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 7 Mar 2017 21:05:40 +0900
Subject: [PATCH 2/3] treewide: Use \tco{} for api name in caption

In caption of Figure 4.5, "pthread_create()" was written as
{\tt pthread\_create()}.
"\tco{}" macro added in commit bf816541d234 ("Define \tco{} command
to be used in table") can be safely used inside \caption{}.
By using \tco{}, api names inside captions can be easily found by
searching them in latex sources.

This commit makes use of \tco{} in such cases treewide.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 2 +-
 debugging/debugging.tex              | 2 +-
 locking/locking.tex                  | 6 +++---
 together/refcnt.tex                  | 6 +++---
 toolsoftrade/toolsoftrade.tex        | 8 ++++----
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 7748c66..6e96af4 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1848,7 +1848,7 @@ or, again, if you think that I am just making all this up.\footnote{
 	\put(45,25){\makebox(120,20)[c]{Interconnect}}

 \end{picture}
-\caption{Why smp\_read\_barrier\_depends() is Required}
+\caption{Why \tco{smp_read_barrier_depends()} is Required}
 \label{fig:app:whymb:Why smp-read-barrier-depends() is Required}
 \end{figure}

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index adaa32f..86b1118 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2056,7 +2056,7 @@ Similarly, interrupt-based interference can be detected via the
 }
 \centering
 \theverbbox
-\caption{Using getrusage() to Detect Context Switches}
+\caption{Using \tco{getrusage()} to Detect Context Switches}
 \label{fig:count:Using getrusage() to Detect Context Switches}
 \end{figure}

diff --git a/locking/locking.tex b/locking/locking.tex
index 9cf945f..7b19e84 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -288,14 +288,14 @@ locks before invoking the comparison function.
 \begin{figure}[tb]
 \centering
 \resizebox{3in}{!}{\includegraphics{locking/NonLocalLockHierarchy}}
-\caption{Without Local Locking Hierarchy for qsort()}
+\caption{Without Local Locking Hierarchy for \tco{qsort()}}
 \label{fig:lock:Without Local Locking Hierarchy for qsort()}
 \end{figure}

 \begin{figure}[tb]
 \centering
 \resizebox{3in}{!}{\includegraphics{locking/LocalLockHierarchy}}
-\caption{Local Locking Hierarchy for qsort()}
+\caption{Local Locking Hierarchy for \tco{qsort()}}
 \label{fig:lock:Local Locking Hierarchy for qsort()}
 \end{figure}

@@ -342,7 +342,7 @@ improves modularity.
 \begin{figure}[tb]
 \centering
 \resizebox{3in}{!}{\includegraphics{locking/LayeredLockHierarchy}}
-\caption{Layered Locking Hierarchy for qsort()}
+\caption{Layered Locking Hierarchy for \tco{qsort()}}
 \label{fig:lock:Layered Locking Hierarchy for qsort()}
 \end{figure}

diff --git a/together/refcnt.tex b/together/refcnt.tex
index 267cd9f..e7884a4 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -281,7 +281,7 @@ RCU read-side critical sections.
 }
 \centering
 \theverbbox
-\caption{Linux Kernel kref API}
+\caption{Linux Kernel \tco{kref} API}
 \label{fig:together:Linux Kernel kref API}
 \end{figure}

@@ -383,7 +383,7 @@ shown in Figure~\ref{fig:together:Linux Kernel dst-clone API}.
 }
 \centering
 \theverbbox
-\caption{Linux Kernel dst\_clone API}
+\caption{Linux Kernel \tco{dst_clone} API}
 \label{fig:together:Linux Kernel dst-clone API}
 \end{figure}

@@ -493,7 +493,7 @@ Figure~\ref{fig:together:Linux Kernel fget/fput API}.
 }
 \centering
 \theverbbox
-\caption{Linux Kernel fget/fput API}
+\caption{Linux Kernel \tco{fget}/\tco{fput} API}
 \label{fig:together:Linux Kernel fget/fput API}
 \end{figure}

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 0d1bf8c..30e7067 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -206,7 +206,7 @@ subject~\cite{WRichardStevens1992,StewartWeiss2013UNIX}.
 }
 \centering
 \theverbbox
-\caption{Using the fork() Primitive}
+\caption{Using the \tco{fork()} Primitive}
 \label{fig:toolsoftrade:Using the fork() Primitive}
 \end{figure}

@@ -250,7 +250,7 @@ process ID of the child.
 }
 \centering
 \theverbbox
-\caption{Using the wait() Primitive}
+\caption{Using the \tco{wait()} Primitive}
 \label{fig:toolsoftrade:Using the wait() Primitive}
 \end{figure}

@@ -312,7 +312,7 @@ Otherwise, lines~11 and 12 print an error and exit.
 }
 \centering
 \theverbbox
-\caption{Processes Created Via fork() Do Not Share Memory}
+\caption{Processes Created Via \tco{fork()} Do Not Share Memory}
 \label{fig:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
 \end{figure}

@@ -418,7 +418,7 @@ is the argument that will be passed to \co{mythread}.
 }
 \centering
 \theverbbox
-\caption{Threads Created Via {\tt pthread\_create()} Share Memory}
+\caption{Threads Created Via \tco{pthread_create()} Share Memory}
 \label{fig:toolsoftrade:Threads Created Via pthread-create() Share Memory}
 \end{figure}

-- 
2.7.4


