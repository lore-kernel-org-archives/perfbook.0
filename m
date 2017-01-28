Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=syffIjdbPm67augZpHIxvxTEZCBK8c+SjK7tdx/ofaU=;
 b=G7hotKUaGaL27xPpmG16zMRqu+KYtJgPajjqScN9RddFqPTYeqTzKjUaxqe5ByHqRM
 IWYBx3FNUFRYyHZXf+mzu4jriN9Qn68TnoXoKXrDznnTd3YFOW6llR5AJ3jm/MMm5aj5
 /K/83GGaVy08794tUjWk+AHa/frpdUFMGCoeagSDx7x83Qv6dZcbIoQVjkPJNX6d5ZGQ
 yCIqggFSYVGHXkysuE5B9bi5zZ5tXQFrm8pPu97RV91AE+QI3W9Youtf14HsHUhh7ix7
 2270LaQ2yULX1BqB5u2qyD5Qgn9frt7ZzokGpb0ut9Rk13Y2vJ71GhVy+TBpePrEcqS5
 zTSg==
Subject: [PATCH 4/4] Use math mode minus signs for dashes in tables
References: <07d5345b-53d6-243c-8ba4-84b865552852@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b30e80bd-aa0c-5618-2129-4d54518bc76c@gmail.com>
Date: Sat, 28 Jan 2017 20:13:40 +0900
MIME-Version: 1.0
In-Reply-To: <07d5345b-53d6-243c-8ba4-84b865552852@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 11f5734bf4b31fbb51cd6ec603d680a8b3f4f99c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 5 Jan 2017 20:50:58 +0900
Subject: [PATCH 4/4] Use math mode minus signs for dashes in tables

By using math mode minus, \makebox{} surrounding ``-'' can be
removed.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 20 ++++++++++----------
 together/refcnt.tex                  |  8 ++++----
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 70e1d30..007d673 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -570,24 +570,24 @@ Finally, CPU~1 reads the cache line at address~8, which uses a
 	\cline{4-7}
 	Sequence \# & CPU \# & Operation & 0 & 1 & 2 & 3 & 0 & 8 \\
 	\hline
-%	Seq CPU Operation	--------- CPU --------    - Memory -
-%				   0     1     2     3	    0   8
+%	Seq CPU Operation	------------- CPU -------------   - Memory -
+%				   0	   1	   2	   3	    0   8
 	\hline
-	0 &   & Initial State	& -/I & -/I & -/I & -/I   & V & V \\
+	0 &   & Initial State	& $-$/I & $-$/I & $-$/I & $-$/I   & V & V \\
 	\hline
-	1 & 0 & Load		& 0/S & -/I & -/I & -/I   & V & V \\
+	1 & 0 & Load		& 0/S &   $-$/I & $-$/I & $-$/I   & V & V \\
 	\hline
-	2 & 3 & Load		& 0/S & -/I & -/I & 0/S   & V & V \\
+	2 & 3 & Load		& 0/S &   $-$/I & $-$/I & 0/S     & V & V \\
 	\hline
-	3 & 0 & Invalidation	& 8/S & -/I & -/I & 0/S   & V & V \\
+	3 & 0 & Invalidation	& 8/S &   $-$/I & $-$/I & 0/S     & V & V \\
 	\hline
-	4 & 2 & RMW		& 8/S & -/I & 0/E & -/I   & V & V \\
+	4 & 2 & RMW		& 8/S &   $-$/I & 0/E &   $-$/I   & V & V \\
 	\hline
-	5 & 2 & Store		& 8/S & -/I & 0/M & -/I   & I & V \\
+	5 & 2 & Store		& 8/S &   $-$/I & 0/M &   $-$/I   & I & V \\
 	\hline
-	6 & 1 & Atomic Inc	& 8/S & 0/M & -/I & -/I   & I & V \\
+	6 & 1 & Atomic Inc	& 8/S &   0/M &   $-$/I & $-$/I   & I & V \\
 	\hline
-	7 & 1 & Writeback	& 8/S & 8/S & -/I & -/I   & V & V \\
+	7 & 1 & Writeback	& 8/S &   8/S &   $-$/I & $-$/I   & V & V \\
 \end{tabular}
 \caption{Cache Coherence Example}
 \label{tab:app:whymb:Cache Coherence Example}
diff --git a/together/refcnt.tex b/together/refcnt.tex
index cf23ba7..267cd9f 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -74,7 +74,7 @@ locking, and RCU.
 	Synchronization & Locking & Counting  & RCU \\
 	\hline
 	\hline
-	Locking		& -	  & CAM	      & CA  \\
+	Locking		& $-$	  & CAM	      & CA  \\
 	\hline
 	Reference	& A	  & AM	      & A   \\
 	Counting	&  	  &   	      &     \\
@@ -94,7 +94,7 @@ This table
 divides reference-counting mechanisms into the following broad categories:
 \begin{enumerate}
 \item	Simple counting with neither atomic operations, memory
-	barriers, nor alignment constraints \makebox{(``-'')}.
+	barriers, nor alignment constraints (``$-$'').
 \item	Atomic counting without memory barriers (``A'').
 \item	Atomic counting, with memory barriers required only on release
 	(``AM'').
@@ -116,7 +116,7 @@ contain memory barriers, and all checked acquisition operations also
 contain memory barriers.
 Therefore, cases ``CA'' and ``MCA'' are equivalent to ``CAM'', so that
 there are sections below for only the first four cases:
-\makebox{``-''}, ``A'', ``AM'', and ``CAM''.
+``$-$'', ``A'', ``AM'', and ``CAM''.
 The Linux primitives that support reference counting are presented in
 Section~\ref{sec:together:Linux Primitives Supporting Reference Counting}.
 Later sections cite optimizations that can improve performance
@@ -126,7 +126,7 @@ reference count need be checked for zero only very rarely.
 \subsection{Implementation of Reference-Counting Categories}
 \label{sec:together:Implementation of Reference-Counting Categories}

-Simple counting protected by locking (\makebox{``-''}) is described in
+Simple counting protected by locking (``$-$'') is described in
 Section~\ref{sec:together:Simple Counting},
 atomic counting with no memory barriers (``A'') is described in
 Section~\ref{sec:together:Atomic Counting},
-- 
2.7.4


