Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WPsIYMvb9ST2p48OHkq7qxQ494MBKhlYLByPUUoodeo=;
 b=ZqCkICyKDsdH9IpYh+vwvmczpsk9UCAzxNz9ley+eF2CiA8Ri+caPQinyYDhFUWpyw
 O8TiQ6drs4CJ3yrYqE+lGpE0j+OBZBWF0lYA6AC0fC/q7H2VwPzUqAUYY6RKbXi3wdlp
 9uISeU87GwNw8bLghOcF2KQYuh+FxVhfD02xoXZrYyGSAsdaiKaCx3gw+DAGYBNNYx8w
 I+4r4KbdoDylcRGTza802ixiVZ3vNtqwWbmUruGD76KIcKI3nbuZcZqiq6FQqPC3FXpO
 d60YPl+LUofVPuL2LF84cmWDzVRJMvT/svn0PZ/XEiJGUjrZkcW+ZdOz2a6Vz0URYP3W
 A5AQ==
Subject: [PATCH v2 1/2] future: Update Locking and HTM comparison tables
References: <49209cfd-5494-fc54-ba4b-f8389ba4aed7@gmail.com>
 <96abd2d1-8383-fef6-549b-3e156b9c571b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f2e09b9e-1106-afff-19e6-e744ec40eeec@gmail.com>
Date: Thu, 7 Dec 2017 07:20:55 +0900
MIME-Version: 1.0
In-Reply-To: <96abd2d1-8383-fef6-549b-3e156b9c571b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 54dfd3f357164a1d170943284e3ed2486d8841e2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 6 Dec 2017 23:38:01 +0900
Subject: [PATCH v2 1/2] future: Update Locking and HTM comparison tables

By using background colors to indicate Advantage/Disadvantage,
these tables can be simplified. As with other tables, rules of
"booktabs" are used. Skips between rows are controlled by using
\midrule, \cmidrule, and \addlinespace.

In order to put HTMtableRCU.tex within a size of A4 paper,
baseline skip is slightly reduced locally by \setstretch command
(provided by "setspace" package) and the overall table is further
reduced by \resizebox.

Background colors are defined in a separate file HTMtableColor.tex
for ease of color tuning. Colors used at the moment are chosen
so that they can be distinguished when printed in grayscale.
Color names "plus", "minus", "down" reflect the symbols used
before this change.

To place gaps between columns, extra columns are added and
\tabcolsep is narrowed.

Also fix a couple of typo (partionable -> partitionable,
partioning -> partitioning, privitization -> privatization).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex |   6 -
 future/HTMtable.tex                | 201 ++++++++++++++---------------
 future/HTMtableColor.tex           |   9 ++
 future/HTMtableRCU.tex             | 254 +++++++++++++++++--------------------
 perfbook.tex                       |   1 +
 5 files changed, 216 insertions(+), 255 deletions(-)
 create mode 100644 future/HTMtableColor.tex

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 11f539b..0337fbb 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -797,12 +797,6 @@ IBM~Q	& $0.015$
 \label{tab:app:styleguide:Refrigeration Power Consumption}
 \end{table}

-Most tables in the text have been converted to this format.
-Tables~\ref{tab:future:Comparison of Locking and HTM}
-and~\ref{tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}
-are the exceptions. They are complex and require an alternative
-approach.\footnote{Any suggestion is welcome!!!}
-
 \subsubsection{Position of Caption}
 \label{sec:app:styleguide:Position of Caption}

diff --git a/future/HTMtable.tex b/future/HTMtable.tex
index d317f94..31d4802 100644
--- a/future/HTMtable.tex
+++ b/future/HTMtable.tex
@@ -4,114 +4,97 @@
 \begin{table*}[p]
 \centering
 % \scriptsize
-\small\OneColumnHSpace{-.8in}
-\begin{tabular}{p{1.0in}||c|p{2.0in}||c|p{2.0in}}
-& \multicolumn{2}{c||}{Locking} & \multicolumn{2}{c}{Hardware Transactional Memory} \\
-\hline
-\hline
-Basic Idea
-	& \multicolumn{2}{p{2.2in}||}{
-	  Allow only one thread at a time to access a given set of objects.}
-		& \multicolumn{2}{p{2.2in}}{
-		  Cause a given operation over a set of objects to execute
-		  atomically.} \\
-\hline
-\hline
-Scope
-	& $+$
-	& Handles all operations.
-		& $+$
-		& Handles revocable operations. \\
-\cline{4-5}
-	& &
-		& $-$
-		& Irrevocable operations force fallback (typically
-		  to locking). \\
-\hline
-Composability
-	& $\Downarrow$
-	& Limited by deadlock.
-		& $\Downarrow$
-		& Limited by irrevocable operations, transaction size,
-		  and deadlock (assuming lock-based fallback code). \\
-\hline
-Scalability \& Performance
-	& $-$
-	& Data must be partitionable to avoid lock contention.
-		& $-$
-		& Data must be partionable to avoid conflicts. \\
-\cline{2-5}
-	& $\Downarrow$
-	& Partioning must typically be fixed at design time.
-		& $+$
-		& Dynamic adjustment of partitioning carried out
-		  automatically down to cacheline boundaries. \\
-\cline{4-5}
-	&
-	&
-		& $-$
-		& Partitioning required for fallbacks (less important
-		  for rare fallbacks). \\
-\cline{2-5}
-	& $\Downarrow$
-	& Locking primitives typically result in expensive cache misses
-	  and memory-barrier instructions.
-		& $-$
-		& Transactions begin/end instructions typically do not
-		  result in cache misses, but do have memory-ordering
-		  consequences. \\
-\cline{2-5}
-	& $+$
-	& Contention effects are focused on acquisition and release, so
-	  that the critical section runs at full speed.
-		& $-$
-		& Contention aborts conflicting transactions, even
-		  if they have been running for a long time. \\
-\cline{2-5}
-	& $+$
-	& Privatization operations are simple, intuitive, performant,
-	  and scalable.
-		& $-$
-		& Privatized data contributes to transaction size. \\
-\hline
-Hardware Support
-	& $+$
-	& Commodity hardware suffices.
-		& $-$
-		& New hardware required (and is starting to become
-		  available). \\
-\cline{2-5}
-	& $+$
-	& Performance is insensitive to cache-geometry details.
-		& $-$
-		& Performance depends critically on cache geometry. \\
-\hline
-Software Support
-	& $+$
-	& APIs exist, large body of code and experience, debuggers operate
-	  naturally.
-		& $-$
-		& APIs emerging, little experience outside of DBMS,
-		  breakpoints mid-transaction can be problematic. \\
-\hline
-Interaction With Other Mechanisms
-	& $+$
-	& Long experience of successful interaction.
-		& $\Downarrow$
-		& Just beginning investigation of interaction. \\
-\hline
-Practical Apps
-	& $+$
-	& Yes.
-		& $+$
-		& Yes. \\
-\hline
-Wide Applicability
-	& $+$
-	& Yes.
-		& $-$
-		& Jury still out, but likely to win significant use. \\
-\end{tabular}
-\caption{Comparison of Locking and HTM (``$+$'' is Advantage, ``$-$'' is Disadvantage, ``$\Downarrow$'' is Strong Disadvantage)}
+\small
+\input{future/HTMtableColor}
+\setlength{\tabcolsep}{4pt}\OneColumnHSpace{-.9in}
+\begin{tabularx}{6.5in}{p{0.95in}cXcX}
+\toprule
+  &
+    & \multicolumn{1}{c}{Locking} &
+      & \multicolumn{1}{c}{Hardware Transactional Memory} \\
+\midrule
+  Basic Idea &
+    & Allow only one thread at a time to access a given set of objects. &
+      & Cause a given operation over a set of objects to execute atomically. \\
+\midrule
+  Scope &
+    & \Pl Handles all operations. &
+      & \Pl Handles revocable operations. \\
+\addlinespace[4pt]
+  &
+    & &
+      & \Mn Irrevocable operations force fallback (typically to locking). \\
+\midrule
+  Composability &
+    & \Dw Limited by deadlock. &
+      & \Dw Limited by irrevocable operations, transaction size,
+        and deadlock (assuming lock-based fallback code). \\
+\midrule
+  Scalability \& Performance &
+    & \Mn Data must be partitionable to avoid lock contention. &
+      & \Mn Data must be partitionable to avoid conflicts. \\
+\cmidrule{3-5}
+  &
+    & \Dw Partioning must typically be fixed at design time. &
+      & \Pl Dynamic adjustment of partitioning carried out automatically down
+        to cacheline boundaries. \\
+\addlinespace[4pt]
+  &
+    & &
+      & \Mn Partitioning required for fallbacks (less important for rare
+        fallbacks). \\
+\cmidrule{3-5}
+  &
+    & \Dw Locking primitives typically result in expensive cache misses
+      and memory-barrier instructions. &
+      & \Mn Transactions begin/end instructions typically do not result in cache
+        misses, but do have memory-ordering consequences. \\
+\cmidrule{3-5}
+  &
+    & \Pl Contention effects are focused on acquisition and release, so
+      that the critical section runs at full speed. &
+      & \Mn Contention aborts conflicting transactions, even if they have been
+        running for a long time. \\
+\cmidrule{3-5}
+  &
+    & \Pl Privatization operations are simple, intuitive, performant,
+      and scalable. &
+      & \Mn Privatized data contributes to transaction size. \\
+\midrule
+  Hardware Support &
+    & \Pl Commodity hardware suffices. &
+      & \Mn New hardware required (and is starting to become available). \\
+\cmidrule{3-5}
+  &
+    & \Pl Performance is insensitive to cache-geometry details. &
+      & \Mn Performance depends critically on cache geometry. \\
+\midrule
+  Software Support &
+    & \Pl APIs exist, large body of code and experience, debuggers operate
+      naturally. &
+      & \Mn APIs emerging, little experience outside of DBMS, breakpoints
+        mid-transaction can be problematic. \\
+\midrule
+  Interaction With Other Mechanisms &
+    & \Pl Long experience of successful interaction. &
+      & \Dw Just beginning investigation of interaction. \\
+\midrule
+  Practical Apps &
+    & \Pl Yes. &
+      & \Pl Yes. \\
+\midrule
+  Wide Applicability &
+    & \Pl Yes. &
+      & \Mn Jury still out, but likely to win significant use. \\
+\bottomrule
+\end{tabularx}
+\IfTwoColumn{
+\caption{Comparison of Locking and HTM (\colorbox{plus}{Advantage},
+  \colorbox{minus}{Disadvantage}, \colorbox{down}{Strong Disadvantage})}
+}{
+\caption{Comparison of Locking and HTM (\colorbox{plus}{Advantage},
+  \colorbox{minus}{Disadvantage},
+  \colorbox{down}{Strong} \colorbox{down}{Disadvantage})}
+}
 \label{tab:future:Comparison of Locking and HTM}
 \end{table*}
diff --git a/future/HTMtableColor.tex b/future/HTMtableColor.tex
new file mode 100644
index 0000000..94a7c2f
--- /dev/null
+++ b/future/HTMtableColor.tex
@@ -0,0 +1,9 @@
+% future/HTMtableColor.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
+
+\definecolor{plus}{cmyk}{0.1,0,0,0}
+\definecolor{minus}{cmyk}{0,0.05,0.2,0.05}
+\definecolor{down}{cmyk}{0,0.15,0.15,0.1}
+\newcommand{\Pl}{\cellcolor{plus}}
+\newcommand{\Mn}{\cellcolor{minus}}
+\newcommand{\Dw}{\cellcolor{down}}
diff --git a/future/HTMtableRCU.tex b/future/HTMtableRCU.tex
index 4c51fa3..2d25502 100644
--- a/future/HTMtableRCU.tex
+++ b/future/HTMtableRCU.tex
@@ -3,145 +3,119 @@

 \begin{table*}[p]
 \centering
-\small\OneColumnHSpace{-.8in}
-%\raggedright
-\begin{tabular}{p{1.0in}||c|p{2.0in}||c|p{2.0in}}
-& \multicolumn{2}{c||}{Locking with Userspace RCU or Hazard Pointers} & \multicolumn{2}{c}{Hardware Transactional Memory} \\
-\hline
-\hline
-Basic Idea
-	& \multicolumn{2}{p{2.2in}||}{
-	  Allow only one thread at a time to access a given set of objects.}
-		& \multicolumn{2}{p{2.2in}}{
-		  Cause a given operation over a set of objects to execute
-		  atomically.} \\
-\hline
-\hline
-Scope
-	& $+$
-	& Handles all operations.
-		& $+$
-		& Handles revocable operations. \\
-\cline{4-5}
-	& &
-		& $-$
-		& Irrevocable operations force fallback (typically
-		  to locking). \\
-\hline
-Composability
-	& $+$
-	& Readers limited only by grace-period-wait operations.
-		& $\Downarrow$
-		& Limited by irrevocable operations, transaction size,
-		  and deadlock. \\
-\cline{2-3}
-	& $-$
-	& Updaters limited by deadlock.  Readers reduce deadlock.
-		&
-		& (Assuming lock-based fallback code.) \\
-\hline
-Scalability \& Performance
-	& $-$
-	& Data must be partitionable to avoid lock contention among
-	  updaters.
-		& $-$
-		& Data must be partionable to avoid conflicts. \\
-\cline{2-3}
-	& $+$
-	& Partitioning not needed for readers.
-		&
-		& \\
-\cline{2-5}
-	& $\Downarrow$
-	& Partioning for updaters must typically be fixed at design time.
-		& $+$
-		& Dynamic adjustment of partitioning carried out
-		  automatically down to cacheline boundaries. \\
-\cline{2-5}
-	& $+$
-	& Partitioning not needed for readers.
-		& $-$
-		& Partitioning required for fallbacks (less important
-		  for rare fallbacks). \\
-\cline{2-5}
-	& $\Downarrow$
-	& Updater locking primitives typically result in expensive cache
-	  misses and memory-barrier instructions.
-		& $-$
-		& Transactions begin/end instructions typically do not
-		  result in cache misses, but do have memory-ordering
-		  consequences. \\
-\cline{2-5}
-	& $+$
-	& Update-side contention effects are focused on acquisition and
-	  release, so that the critical section runs at full speed.
-		& $-$
-		& Contention aborts conflicting transactions, even
-		  if they have been running for a long time. \\
-\cline{2-3}
-	& $+$
-	& Readers do not contend with updaters or with each other.
-		&
-		& \\
-\cline{2-5}
-	& $+$
-	& Read-side primitives are typically wait-free with low
-	  overhead.  (Lock-free for hazard pointers.)
-		& $-$
-		& Read-only transactions subject to conflicts and rollbacks.
-		  No forward-progress guarantees other than those supplied
-		  by fallback code. \\
-\cline{2-5}
-	& $+$
-	& Privatization operations are simple, intuitive, performant,
-	  and scalable when data is visible only to updaters.
-		& $-$
-		& Privatized data contributes to transaction size. \\
-\cline{2-3}
-	& $-$
-	& Privitization operations are expensive (though still intuitive
-	  and scalable) for reader-visible data.
-		&
-		& \\
-\hline
-Hardware Support
-	& $+$
-	& Commodity hardware suffices.
-		& $-$
-		& New hardware required (and is starting to become
-		  available). \\
-\cline{2-5}
-	& $+$
-	& Performance is insensitive to cache-geometry details.
-		& $-$
-		& Performance depends critically on cache geometry. \\
-\hline
-Software Support
-	& $+$
-	& APIs exist, large body of code and experience, debuggers operate
-	  naturally.
-		& $-$
-		& APIs emerging, little experience outside of DBMS,
-		  breakpoints mid-transaction can be problematic. \\
-\hline
-Interaction With Other Mechanisms
-	& $+$
-	& Long experience of successful interaction.
-		& $\Downarrow$
-		& Just beginning investigation of interaction. \\
-\hline
-Practical Apps
-	& $+$
-	& Yes.
-		& $+$
-		& Yes. \\
-\hline
-Wide Applicability
-	& $+$
-	& Yes.
-		& $-$
-		& Jury still out, but likely to win significant use. \\
-\end{tabular}
-\caption{Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM (``$+$'' is Advantage, ``$-$'' is Disadvantage, ``$\Downarrow$'' is Strong Disadvantage)}
+\small
+\input{future/HTMtableColor}
+\setstretch{0.95}
+\setlength{\tabcolsep}{4pt}\OneColumnHSpace{-.9in}
+\resizebox{6.5in}{!}{
+\begin{tabularx}{6.8in}{p{0.95in}cXcX}
+\toprule
+  &
+    & \multicolumn{1}{c}{Locking with Userspace RCU or Hazard Pointers} &
+      & \multicolumn{1}{c}{Hardware Transactional Memory} \\
+\midrule
+  Basic Idea &
+    & Allow only one thread at a time to access a given set of objects. &
+      & Cause a given operation over a set of objects to execute atomically. \\
+\midrule
+  Scope &
+    & \Pl Handles all operations. &
+      & \Pl Handles revocable operations. \\
+\addlinespace[4pt]
+  &
+    & &
+      & \Mn Irrevocable operations force fallback (typically to locking). \\
+\midrule
+  Composability &
+    & \Pl Readers limited only by grace-period-wait operations. &
+      & \Dw Limited by irrevocable operations, transaction size, and deadlock.
+        (Assuming lock-based fallback code.)\\
+\addlinespace[4pt]
+  &
+    & \Mn Updaters limited by deadlock.  Readers reduce deadlock. &
+      & \\
+\midrule
+  Scalability \& Performance &
+    & \Mn Data must be partitionable to avoid lock contention among updaters. &
+      & \Mn Data must be partitionable to avoid conflicts. \\
+\addlinespace[4pt]
+  &
+    & \Pl Partitioning not needed for readers. &
+      & \\
+\cmidrule{3-5}
+  &
+    & \Dw Partitioning for updaters must typically be fixed at design time. &
+      & \Pl Dynamic adjustment of partitioning carried out automatically down
+        to cacheline boundaries. \\
+\cmidrule{3-5}
+  &
+    & \Pl Partitioning not needed for readers. &
+      & \Mn Partitioning required for fallbacks (less important for rare
+        fallbacks). \\
+\cmidrule{3-5}
+  &
+    & \Dw Updater locking primitives typically result in expensive cache misses
+      and memory-barrier instructions. &
+      & \Mn Transactions begin/end instructions typically do not result in
+        cache misses, but do have memory-ordering consequences. \\
+\cmidrule{3-5}
+  &
+    & \Pl Update-side contention effects are focused on acquisition and release,
+      so that the critical section runs at full speed. &
+      & \Mn Contention aborts conflicting transactions, even if they have been
+        running for a long time. \\
+\addlinespace[4pt]
+  &
+    & \Pl Readers do not contend with updaters or with each other. &
+      & \\
+\cmidrule{3-5}
+  &
+    & \Pl Read-side primitives are typically wait-free with low overhead.
+      (Lock-free for hazard pointers.) &
+      & \Mn Read-only transactions subject to conflicts and rollbacks.
+        No forward-progress guarantees other than those supplied by fallback
+        code. \\
+\cmidrule{3-5}
+  &
+    & \Pl Privatization operations are simple, intuitive, performant, and
+      scalable when data is visible only to updaters. &
+      & \Mn Privatized data contributes to transaction size. \\
+\addlinespace[4pt]
+  &
+    & \Mn Privatization operations are expensive (though still intuitive
+      and scalable) for reader-visible data. &
+      & \\
+\midrule
+  Hardware Support &
+    & \Pl Commodity hardware suffices. &
+      & \Mn New hardware required (and is starting to become available). \\
+\cmidrule{3-5}
+  &
+    & \Pl Performance is insensitive to cache-geometry details. &
+      & \Mn Performance depends critically on cache geometry. \\
+\midrule
+  Software Support &
+    & \Pl APIs exist, large body of code and experience, debuggers operate
+      naturally. &
+      & \Mn APIs emerging, little experience outside of DBMS, breakpoints
+        mid-transaction can be problematic. \\
+\midrule
+  Interaction With Other Mechanisms &
+    & \Pl Long experience of successful interaction. &
+      & \Dw Just beginning investigation of interaction. \\
+\midrule
+  Practical Apps &
+    & \Pl Yes. &
+      & \Pl Yes. \\
+\midrule
+  Wide Applicability &
+    & \Pl Yes. &
+      & \Mn Jury still out, but likely to win significant use. \\
+\bottomrule
+\end{tabularx}
+}
+\caption{Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM
+  (\colorbox{plus}{Advantage}, \colorbox{minus}{Disadvantage},
+  \colorbox{down}{Strong Disadvantage})}
 \label{tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}
 \end{table*}
diff --git a/perfbook.tex b/perfbook.tex
index 32f0e6d..e4bba02 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -31,6 +31,7 @@
 % \usepackage{breakurl}
 \usepackage{graphicx}
 \usepackage{rotating}
+\usepackage{setspace}
 \usepackage{enumitem}
 \setlist[description]{style=unboxed}
 %\usepackage{enumerate}
-- 
2.7.4


