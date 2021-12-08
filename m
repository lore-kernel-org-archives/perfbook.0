Return-Path: <SRS0=4u0W=QZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=simFRrF+H+6MFKR53OLwxAnKsFO37UnXr6v+LWsJ6oE=;
        b=AwZfqWIMy5a9bIPnSNSdUty9bOhsehPSHRFrDsBuLisAfiFW7WPdFEdPB6SdZ0RK2o
         LanPiG5S0X2XnROgluJOgs/vUUlki6wa0Z2LJvAVkRfX74rYbHQcDRNC52sTva7/+v9v
         A0Ns+KynA1/FWJycXY67XarkgRCKr4vgBrqXSMxKVLWggOqSM/kvGRQSTz5jLaFZ2YkT
         A3t2vHjdwJ/lugpD6J0ej4q+dQcC4EAd1cxtGyHnQVGfCW1X2fbuTT323wbt4qnYqoAH
         gCwLC4d8Xa3I6QqBxZacEXCblKsTYI+FwQaJFqoK/dz50IuhNgS2Q5tBK5npSmqmkNnw
         i0Jg==
Subject: [PATCH -perfbook 4/4] treewide: Address potential widowing of
 headings
References: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <13279469-e638-f3d8-4753-12f830fb67f6@gmail.com>
Date: Wed, 8 Dec 2021 16:52:35 +0900
MIME-Version: 1.0
In-Reply-To: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fix potential page/column break patterns flagged by the updated
cleverefcheck.pl.

 o Move code snippets away from section headings.
 o Add leading phrases to enumerate lists in QQAs.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/questions/after.tex  |  4 ++++
 datastruct/datastruct.tex     | 14 +++++++-------
 defer/refcnt.tex              | 24 ++++++++++++------------
 formal/axiomatic.tex          | 22 +++++++++++-----------
 locking/locking-existence.tex |  9 +++++----
 memorder/memorder.tex         |  6 +++---
 6 files changed, 42 insertions(+), 37 deletions(-)

diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index bd7c46b5..b78bc684 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -38,6 +38,8 @@ e.g., where time has appeared to go backwards.
 	What SMP coding errors can you see in these examples?
 	See \path{time.c} for full code.
 }\QuickQuizAnswer{
+	Here are errors you'd find:
+
 	\begin{enumerate}
 	\item	Missing barrier() or volatile on tight loops.
 	\item	Missing memory barriers on update side.
@@ -173,6 +175,8 @@ seq    & \multicolumn{1}{c}{time (seconds)} & delta~  &  a &  b &  c \\
 	consumer reads?
 	See \path{timelocked.c} for full code.
 }\QuickQuizAnswer{
+	Here are possible scenarios:
+
 	\begin{enumerate}
 	\item	The consumer might be preempted for long time periods.
 	\item	A long-running interrupt might delay the consumer.
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index ba429dfc..7186b611 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1067,13 +1067,6 @@ or all of the above.
 	  You can't cross a chasm in two small steps.}
 	 {\emph{David Lloyd George}}
 
-\begin{figure}
-\centering
-\resizebox{3in}{!}{\includegraphics{cartoons/2014_Hash-table-hydra}}
-\caption{Partitioning Problems}
-\ContributedBy{Figure}{fig:datastruct:Partitioning Problems}{Melissa Broussard}
-\end{figure}
-
 Fixed-size hash tables are perfectly partitionable, but resizable hash
 tables pose partitioning challenges when growing or shrinking, as
 fancifully depicted in
@@ -1081,6 +1074,13 @@ fancifully depicted in
 However, it turns out that it is possible to construct high-performance
 scalable RCU-protected hash tables, as described in the following sections.
 
+\begin{figure}
+\centering
+\resizebox{3in}{!}{\includegraphics{cartoons/2014_Hash-table-hydra}}
+\caption{Partitioning Problems}
+\ContributedBy{Figure}{fig:datastruct:Partitioning Problems}{Melissa Broussard}
+\end{figure}
+
 \subsection{Resizable Hash Table Design}
 \label{sec:datastruct:Resizable Hash Table Design}
 
diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index 80d69e71..14e2def6 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -7,18 +7,6 @@
 %
 \epigraph{I am never letting you go!}{Unknown}
 
-\begin{listing}
-\input{CodeSamples/defer/route_refcnt@lookup.fcv}
-\caption{Reference-Counted Pre-BSD Routing Table Lookup (BUGGY!!!)}
-\label{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup}
-\end{listing}
-
-\begin{listing}
-\input{CodeSamples/defer/route_refcnt@add_del.fcv}
-\caption{Reference-Counted Pre-BSD Routing Table Add\slash Delete (BUGGY!!!)}
-\label{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
-\end{listing}
-
 Reference counting tracks the number of references to a given object in
 order to prevent that object from being prematurely freed.
 As such, it has a long and honorable history of use dating back to
@@ -35,6 +23,18 @@ on while that worker is inside.
 Reference counting is thus an excellent time-honored candidate for a
 concurrent implementation of Pre-BSD routing.
 
+\begin{listing}
+\input{CodeSamples/defer/route_refcnt@lookup.fcv}
+\caption{Reference-Counted Pre-BSD Routing Table Lookup (BUGGY!!!)}
+\label{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup}
+\end{listing}
+
+\begin{listing}
+\input{CodeSamples/defer/route_refcnt@add_del.fcv}
+\caption{Reference-Counted Pre-BSD Routing Table Add\slash Delete (BUGGY!!!)}
+\label{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
+\end{listing}
+
 To that end,
 \cref{lst:defer:Reference-Counted Pre-BSD Routing Table Lookup}
 shows data structures and the \co{route_lookup()} function and
diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index bf5b8263..9e3c0b69 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -9,6 +9,17 @@
 \epigraph{Theory helps us to bear our ignorance of facts.}
 	{\emph{George Santayana}}
 
+Although the PPCMEM tool can solve the famous ``independent reads of
+independent writes'' (IRIW) litmus test shown in
+\cref{lst:formal:IRIW Litmus Test}, doing so requires no less than
+fourteen CPU hours and generates no less than ten gigabytes of state space.
+That said, this situation is a great improvement over that before the advent
+of PPCMEM, where solving this problem required perusing volumes of
+reference manuals, attempting proofs, discussing with experts, and
+being unsure of the final answer.
+Although fourteen hours can seem like a long time, it is much shorter
+than weeks or even months.
+
 \begin{listing}
 \begin{fcvlabel}[ln:formal:IRIW Litmus Test]
 \begin{VerbatimL}[commandchars=\%\@\$]
@@ -34,17 +45,6 @@ exists
 \label{lst:formal:IRIW Litmus Test}
 \end{listing}
 
-Although the PPCMEM tool can solve the famous ``independent reads of
-independent writes'' (IRIW) litmus test shown in
-\cref{lst:formal:IRIW Litmus Test}, doing so requires no less than
-fourteen CPU hours and generates no less than ten gigabytes of state space.
-That said, this situation is a great improvement over that before the advent
-of PPCMEM, where solving this problem required perusing volumes of
-reference manuals, attempting proofs, discussing with experts, and
-being unsure of the final answer.
-Although fourteen hours can seem like a long time, it is much shorter
-than weeks or even months.
-
 However, the time required is a bit surprising given the simplicity
 of the litmus test, which has two threads storing to two separate variables
 and two other threads loading from these two variables in opposite
diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 7058e852..38e432a2 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -7,6 +7,11 @@
 %
 \epigraph{Existence precedes and rules essence.}{\emph{Jean-Paul Sartre}}
 
+A key challenge in parallel programming is to provide
+\emph{existence guarantees}~\cite{Gamsa99},
+so that attempts to access a given object can rely on that object
+being in existence throughout a given access attempt.
+
 \begin{listing}
 \begin{fcvlabel}[ln:locking:Per-Element Locking Without Existence Guarantees]
 \begin{VerbatimL}[commandchars=\\\@\$]
@@ -31,10 +36,6 @@ int delete(int key)
 \label{lst:locking:Per-Element Locking Without Existence Guarantees}
 \end{listing}
 
-A key challenge in parallel programming is to provide
-\emph{existence guarantees}~\cite{Gamsa99},
-so that attempts to access a given object can rely on that object
-being in existence throughout a given access attempt.
 In some cases, existence guarantees are implicit:
 
 \begin{enumerate}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 6ba634e9..cd828b0a 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1967,13 +1967,13 @@ This means that the \co{exists} clause on \clnref{exists} really can trigger.
 	But it is not necessary to worry about propagation unless
 	there are at least three threads in the litmus test, right?
 }\QuickQuizAnswer{
+	Wrong.
+
 \begin{listing}
 \input{CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o@whole.fcv}
 \caption{R Litmus Test With Write Memory Barrier (No Ordering)}
 \label{lst:memorder:R Litmus Test With Write Memory Barrier (No Ordering)}
-\end{listing}%
-%
-	Wrong.
+\end{listing}
 
 	\begin{fcvref}[ln:formal:C-R+o-wmb-o+o-mb-o:whole]
 	\Cref{lst:memorder:R Litmus Test With Write Memory Barrier (No Ordering)}
-- 
2.17.1


