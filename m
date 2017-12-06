Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bhaFsiIMPVktQ+I8Iws9zxiJ7SfUiKGHGbhttpjai+8=;
 b=m4Do2tmq6G8nsY/VsYQrSJopHh4lhx8SJGuVE+ENL9UI4U9ZfFIwuEqRSroVbRqpdj
 iUURv6DGZgd1kVDyEzuldX8i0ERdT2rDZNauJidE7lHAF3XGvBuL3muxB4XqXYIRQYx+
 9uqbk/Qi7bpxyFRSHkHu7PPYnNQ+dTkOC/sjn3gqM5dP/AhlYXVSD+m2TDja8PqUQ4tx
 ad1Ygrw+DdGqe+QsCDV/x8j3ukFP1bCz+uIbSkW8WrNu33+l1u+4cq9NQOPH3iaamffl
 LVqZ2qjpRPldKyOlxelmlZpTZVEC4rTnG+Zi0PAh9VluMUIzPa/Vw/5zXNpaEBipl/t5
 4THw==
Subject: [PATCH 2/2] future: Add merged table of locking & HTM comparison
References: <49209cfd-5494-fc54-ba4b-f8389ba4aed7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5e9cf298-d792-7a08-bdb1-bc14b9447dbb@gmail.com>
Date: Thu, 7 Dec 2017 00:05:20 +0900
MIME-Version: 1.0
In-Reply-To: <49209cfd-5494-fc54-ba4b-f8389ba4aed7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d6497dadbc973d7d94591f48730c4c0ce1c129a8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 6 Dec 2017 23:38:41 +0900
Subject: [PATCH 2/2] future: Add merged table of locking & HTM comparison

Tables of HTMtable.tex and HTMtableRCU.tex can be merged into a single
large table in a "sidewaystable" environment.

To reduce the height of the table, font size of footnotesize is used in
addition to commands \setstretch{} and \resizebox{}.

The additional paragraph in the text citing the table is tentative
and need some rewording.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/HTMtableFull.tex | 148 ++++++++++++++++++++++++++++++++++++++++++++++++
 future/htm.tex          |   6 ++
 2 files changed, 154 insertions(+)
 create mode 100644 future/HTMtableFull.tex

diff --git a/future/HTMtableFull.tex b/future/HTMtableFull.tex
new file mode 100644
index 0000000..eb2886c
--- /dev/null
+++ b/future/HTMtableFull.tex
@@ -0,0 +1,148 @@
+% future/HTMtableFull.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
+
+\begin{sidewaystable*}[htbp]
+\input{future/HTMtableColor}
+\centering
+\caption{Comparison of Locking (Plain and Augmented) and HTM
+  (\colorbox{plus}{Advantage}, \colorbox{minus}{Disadvantage},
+  \colorbox{down}{Strong Disadvantage})}
+\label{tab:future:Comparison of Locking (Plain and Augmented) and HTM}
+\footnotesize
+\setstretch{0.95}
+%\renewcommand*{\arraystretch}{1.4}
+\setlength{\tabcolsep}{3pt}
+\resizebox{8in}{!}{
+\begin{tabularx}{8.5in}{p{.85in}cXcXcX}
+\toprule
+  &
+    & \multicolumn{1}{c}{Locking} &
+      & \multicolumn{1}{c}{Locking with Userspace RCU or Hazard Pointers} &
+        & \multicolumn{1}{c}{Hardware Transactional Memory} \\
+\midrule
+  Basic Idea &
+    & Allow only one thread at a time to access a given set of objects. &
+      & Allow only one thread at a time to access a given set of objects. &
+        & Cause a given operation over a set of objects to execute atomically. \\
+\midrule
+  Scope &
+    & \Pl Handles all operations. &
+      & \Pl Handles all operations. &
+        & \Pl Handles revocable operations. \\
+\addlinespace[4pt]
+  &
+    & &
+      & &
+        & \Mn Irrevocable operations force fallback (typically to locking). \\
+\midrule
+  Composability &
+    & \Dw Limited by deadlock. &
+      & \Pl Readers limited only by grace-period-wait operations. &
+        & \Dw Limited by irrevocable operations, transaction size, and deadlock.
+          (Assuming lock-based fallback code.) \\
+\addlinespace[4pt]
+  &
+    & &
+      & \Mn Updaters limited by deadlock. Readers reduce deadlock. &
+        & \\
+\midrule
+  Scalability \& Performance &
+    & \Mn Data must be partitionable to avoid lock contention. &
+      & \Mn Data must be partitionable to avoid lock contention among updaters. &
+        & \Mn Data must be partitionable to avoid conflicts. \\
+\addlinespace[4pt]
+  &
+    & &
+      & \Pl Partitioning not needed for readers. &
+        & \\
+\cmidrule{3-7}
+  &
+    & \Dw Partitioning must typically be fixed at design time. &
+      & \Dw Partitioning for updaters must typically be fixed at design time. &
+        & \Pl Dynamic adjustment of partitioning carried out automatically
+          down to cacheline boundaries. \\
+\addlinespace[4pt]
+  &
+    & &
+      & \Pl Partitioning not needed for readers. &
+        & \Mn Partitioning required for fallbacks (less important for rare
+          fallbacks). \\
+\cmidrule{3-7}
+  &
+    & \Dw Locking primitives typically result in expensive cache misses and
+      memory-barrier instructions.&
+      & \Dw Updater locking primitives typically result in expensive cache
+        misses and memory-barrier instructions. &
+        & \Mn Transactions begin/end instructions typically do not result in
+          cache misses, but do have memory-ordering consequences. \\
+\cmidrule{3-7}
+  &
+    & \Pl Contention effects are focused on acquisition and release, so that
+      the critical section runs at full speed. &
+      & \Pl Update-side contention effects are focused on acquisition and
+        release, so that the critical section runs at full speed. &
+        & \Mn Contention aborts conflicting transactions, even if they have been
+          running for a long time. \\
+\addlinespace[4pt]
+  &
+    & &
+      & \Pl Readers do not contend with updaters or with each other. &
+        & \\
+\cmidrule{3-7}
+  &
+    & &
+      & \Pl Read-side primitives are typically wait-free with low overhead.
+        (Lock-free for hazard pointers.) &
+        & \Mn Read-only transactions subject to conflicts and rollbacks. No
+          forward-progress guarantees other than those supplied by fallback
+          code. \\
+\cmidrule{3-7}
+  &
+    & \Pl Privatization operations are simple, intuitive, performant,
+      and scalable. &
+      & \Pl Privatization operations are simple, intuitive, performant,
+        and scalable when data is visible only to updaters. &
+        & \Mn Privatized data contributes to transaction size. \\
+\addlinespace[4pt]
+  &
+    & &
+      & \Mn Privatization operations are expensive (though still intuitive
+        and scalable) for reader-visible data. &
+        & \\
+\midrule
+  Hardware Support &
+    & \Pl Commodity hardware suffices. &
+      & \Pl Commodity hardware suffices. &
+        & \Mn New hardware required (and is starting to become available). \\
+\cmidrule{3-7}
+  &
+    & \Pl Performance is insensitive to cache-geometry details. &
+      & \Pl Performance is insensitive to cache-geometry details. &
+        & \Mn Performance depends critically on cache geometry. \\
+\midrule
+  Software Support &
+    & \Pl APIs exist, large body of code and experience, debuggers operate
+      naturally. &
+      & \Pl APIs exist, large body of code and experience, debuggers operate
+        naturally. &
+        & \Mn APIs emerging, little experience outside of DBMS, breakpoints
+              mid-transaction can be problematic. \\
+\midrule
+  Interaction With Other Mechanisms &
+    & \Pl Long experience of successful interaction. &
+      & \Pl Long experience of successful interaction. &
+        & \Dw Just beginning investigation of interaction. \\
+\midrule
+  Practical Apps &
+    & \Pl Yes. &
+      & \Pl Yes. &
+        & \Pl Yes. \\
+\midrule
+  Wide Applicability &
+    & \Pl Yes. &
+      & \Pl Yes. &
+        & \Mn Jury still out, but likely to win significant use. \\
+\bottomrule
+\end{tabularx}
+}
+\end{sidewaystable*}
diff --git a/future/htm.tex b/future/htm.tex
index 7c9f610..6667cd0 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -918,6 +918,12 @@ A summary of the differences between the two tables is as follows:
 	straightforward.
 \end{enumerate}

+\input{future/HTMtableFull}
+
+For those who want to see the comparison at one view,
+Table~\ref{tab:future:Comparison of Locking (Plain and Augmented) and HTM}
+shows the merged comparison.
+
 Of course, it is also possible to augment HTM,
 as discussed in the next section.

-- 
2.7.4


