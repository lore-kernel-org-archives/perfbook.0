Return-Path: <SRS0=UsGV=3B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eQpQnQQ5XQdras9sB0MOkHoP5VdsQemFmXu9iXZf/5U=;
        b=Sj8MAZ+7i3pLp4DCydLbZv+d7ojz9ZD8ND5kX3gl6hxrWPZOw54fIV2jB+6Ao5TyJV
         EXfbWi0KraZWWuiDokDVSAAYkhDR7udFLgiD73rHZa8AJo3+7azQAzg62Ui0coJj8cIa
         sc8FD6B6sWPVCPYKKeJA8r6qZUnUVCgdn2f1fuHp5dHL7UIqTR+ugfNvivwV/czn4qPo
         2NMaR7Rzcr3CPxDtBLLuZAhoJvW6hbAZ1kNy1m+ApmgtdIRbcvxQhBvcJ8valaRyNm5X
         TExbOi4S4WWvPi1lS/wA2n57dE8aNRRKGnq2a1m3ApEzHpmdTxEDdjK8Lby1ohsd/lih
         UJCg==
Subject: [PATCH 2/6] Prevent section heading from orphaned
References: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7eddd596-e139-2cf1-d1d8-c5d75983c00e@gmail.com>
Date: Sun, 12 Jan 2020 13:06:32 +0900
MIME-Version: 1.0
In-Reply-To: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a13120c31bf160a5996c06d66f5e23ed9f1939f0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 6 Jan 2020 17:34:16 +0900
Subject: [PATCH 2/6] Prevent section heading from orphaned

Putting "\NoIndentAfterThis" where source of floats comes just below
section headings has a failure mode of possible orphaned heading
(heading at the bottom of a page/column). E.g.:

    Section 10.2.2's heading in perfbook-1c.pdf (before this update)

Moving such source of floats to next to the first paragraph of the
section is the right way mentioned in Section 4.7 of [1].

Exception to this rule is at or near the beginning of a chapter,
where a float object has no chance to cause an actual page break.

This commit therefore moves such floats and removes \NoIndentAfterThis.
Some of the floats not at the beginning of a section are also moved
to avoid congestion of floats.

[1]: https://www.latex-project.org/publications/2014-FMi-TUB-tb111mitt-float-placement.pdf

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/beyond.tex       |  13 ++-
 appendix/toyrcu/toyrcu.tex | 167 +++++++++++++++----------------
 count/count.tex            |  86 ++++++++--------
 datastruct/datastruct.tex  |  77 +++++++--------
 defer/rcuapi.tex           |  32 +++---
 defer/rcuusage.tex         |  15 ++-
 formal/axiomatic.tex       |  24 ++---
 formal/dyntickrcu.tex      | 194 ++++++++++++++++++-------------------
 formal/ppcmem.tex          |  14 +--
 formal/spinhint.tex        |  59 ++++++-----
 locking/locking.tex        |  79 ++++++++-------
 memorder/memorder.tex      |  60 ++++++------
 together/applyrcu.tex      |  48 ++++-----
 13 files changed, 423 insertions(+), 445 deletions(-)

diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 6a74e613..cb0008c2 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -57,7 +57,12 @@ presents future directions and concluding remarks.
 
 \subsection{Work-Queue Parallel Maze Solver}
 \label{sec:SMPdesign:Work-Queue Parallel Maze Solver}
-\NoIndentAfterThis
+
+PWQ is based on SEQ, which is shown in
+Listing~\ref{lst:SMPdesign:SEQ Pseudocode}
+(pseudocode for \path{maze_seq.c}).
+The maze is represented by a 2D array of cells and
+a linear-array-based work queue named \co{->visited}.
 
 \begin{listing}[tbp]
 \begin{linelabel}[ln:SMPdesign:SEQ Pseudocode]
@@ -90,12 +95,6 @@ int maze_solve(maze *mp, cell sc, cell ec)
 \label{lst:SMPdesign:SEQ Pseudocode}
 \end{listing}
 
-PWQ is based on SEQ, which is shown in
-Listing~\ref{lst:SMPdesign:SEQ Pseudocode}
-(pseudocode for \path{maze_seq.c}).
-The maze is represented by a 2D array of cells and
-a linear-array-based work queue named \co{->visited}.
-
 \begin{lineref}[ln:SMPdesign:SEQ Pseudocode]
 Line~\lnref{initcell} visits the initial cell, and each iteration of the loop spanning
 \clnrefrange{loop:b}{loop:e} traverses passages headed by one cell.
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 92bd5ae7..07801b57 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -157,13 +157,6 @@ in the next section.
 \section{Per-Thread Lock-Based RCU}
 \label{sec:app:toyrcu:Per-Thread Lock-Based RCU}
 
-\begin{listing}[tbp]
-\input{CodeSamples/defer/rcu_lock_percpu@lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
-\input{CodeSamples/defer/rcu_lock_percpu@sync.fcv}\fvset{firstnumber=auto}
-\caption{Per-Thread Lock-Based RCU Implementation}
-\label{lst:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
-\end{listing}
-
 \cref{lst:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
 (\path{rcu_lock_percpu.h} and \path{rcu_lock_percpu.c})
 shows an implementation based on one lock per thread.
@@ -175,6 +168,13 @@ Therefore, all RCU read-side critical sections running
 when \co{synchronize_rcu()} starts must have completed before
 \co{synchronize_rcu()} can return.
 
+\begin{listing}[tbp]
+\input{CodeSamples/defer/rcu_lock_percpu@lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
+\input{CodeSamples/defer/rcu_lock_percpu@sync.fcv}\fvset{firstnumber=auto}
+\caption{Per-Thread Lock-Based RCU Implementation}
+\label{lst:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
+\end{listing}
+
 This implementation does have the virtue of permitting concurrent
 RCU readers, and does avoid the deadlock condition that can arise
 with a single global lock.
@@ -256,13 +256,6 @@ the shortcomings of the lock-based implementation.
 \section{Simple Counter-Based RCU}
 \label{sec:app:toyrcu:Simple Counter-Based RCU}
 
-\begin{listing}[tbp]
-\input{CodeSamples/defer/rcu_rcg@lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
-\input{CodeSamples/defer/rcu_rcg@sync.fcv}\fvset{firstnumber=auto}
-\caption{RCU Implementation Using Single Global Reference Counter}
-\label{lst:app:toyrcu:RCU Implementation Using Single Global Reference Counter}
-\end{listing}
-
 A slightly more sophisticated RCU implementation is shown in
 \cref{lst:app:toyrcu:RCU Implementation Using Single Global Reference Counter}
 (\path{rcu_rcg.h} and \path{rcu_rcg.c}).
@@ -284,6 +277,13 @@ Again, once \co{synchronize_rcu()} returns, all prior
 RCU read-side critical sections are guaranteed to have completed.
 \end{lineref}
 
+\begin{listing}[tbp]
+\input{CodeSamples/defer/rcu_rcg@lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
+\input{CodeSamples/defer/rcu_rcg@sync.fcv}\fvset{firstnumber=auto}
+\caption{RCU Implementation Using Single Global Reference Counter}
+\label{lst:app:toyrcu:RCU Implementation Using Single Global Reference Counter}
+\end{listing}
+
 In happy contrast to the lock-based implementation shown in
 \cref{sec:app:toyrcu:Lock-Based RCU}, this implementation
 allows parallel execution of RCU read-side critical sections.
@@ -378,18 +378,6 @@ scheme that is more favorable to writers.
 \section{Starvation-Free Counter-Based RCU}
 \label{sec:app:toyrcu:Starvation-Free Counter-Based RCU}
 
-\begin{listing}[tbp]
-\input{CodeSamples/defer/rcu_rcpg@define.fcv}
-\caption{RCU Global Reference-Count Pair Data}
-\label{lst:app:toyrcu:RCU Global Reference-Count Pair Data}
-\end{listing}
-
-\begin{listing}[tbp]
-\input{CodeSamples/defer/rcu_rcpg@r.fcv}
-\caption{RCU Read-Side Using Global Reference-Count Pair}
-\label{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
-\end{listing}
-
 \Cref{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
 (\path{rcu_rcpg.h})
 shows the read-side primitives of an RCU implementation that uses a pair
@@ -402,6 +390,18 @@ and a global lock (\co{rcu_gp_lock}),
 which are themselves shown in
 \cref{lst:app:toyrcu:RCU Global Reference-Count Pair Data}.
 
+\begin{listing}[tbp]
+\input{CodeSamples/defer/rcu_rcpg@define.fcv}
+\caption{RCU Global Reference-Count Pair Data}
+\label{lst:app:toyrcu:RCU Global Reference-Count Pair Data}
+\end{listing}
+
+\begin{listing}[tbp]
+\input{CodeSamples/defer/rcu_rcpg@r.fcv}
+\caption{RCU Read-Side Using Global Reference-Count Pair}
+\label{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
+\end{listing}
+
 \paragraph{Design}
 
 It is the two-element \co{rcu_refcnt[]} array that provides the freedom
@@ -659,18 +659,6 @@ scheme that provides greatly improved read-side performance and scalability.
 \section{Scalable Counter-Based RCU}
 \label{sec:app:toyrcu:Scalable Counter-Based RCU}
 
-\begin{listing}[tb]
-\input{CodeSamples/defer/rcu_rcpl@define.fcv}
-\caption{RCU Per-Thread Reference-Count Pair Data}
-\label{lst:app:toyrcu:RCU Per-Thread Reference-Count Pair Data}
-\end{listing}
-
-\begin{listing}[tb]
-\input{CodeSamples/defer/rcu_rcpl@r.fcv}
-\caption{RCU Read-Side Using Per-Thread Reference-Count Pair}
-\label{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair}
-\end{listing}
-
 \Cref{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair}
 (\path{rcu_rcpl.h})
 shows the read-side primitives of an RCU implementation that uses per-thread
@@ -686,6 +674,18 @@ One benefit of per-thread \co{rcu_refcnt[]} array is that the
 \co{rcu_read_lock()} and \co{rcu_read_unlock()} primitives no longer
 perform atomic operations.
 
+\begin{listing}[tb]
+\input{CodeSamples/defer/rcu_rcpl@define.fcv}
+\caption{RCU Per-Thread Reference-Count Pair Data}
+\label{lst:app:toyrcu:RCU Per-Thread Reference-Count Pair Data}
+\end{listing}
+
+\begin{listing}[tb]
+\input{CodeSamples/defer/rcu_rcpl@r.fcv}
+\caption{RCU Read-Side Using Per-Thread Reference-Count Pair}
+\label{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair}
+\end{listing}
+
 \QuickQuiz{}
 	Come off it!
 	We can see the \co{atomic_read()} primitive in
@@ -798,18 +798,6 @@ concurrent RCU updates.
 \section{Scalable Counter-Based RCU With Shared Grace Periods}
 \label{sec:app:toyrcu:Scalable Counter-Based RCU With Shared Grace Periods}
 
-\begin{listing}[tbp]
-\input{CodeSamples/defer/rcu_rcpls@define.fcv}
-\caption{RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data}
-\label{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data}
-\end{listing}
-
-\begin{listing}[tbp]
-\input{CodeSamples/defer/rcu_rcpls@r.fcv}
-\caption{RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
-\label{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
-\end{listing}
-
 \Cref{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
 (\path{rcu_rcpls.h})
 shows the read-side primitives for an RCU implementation using per-thread
@@ -831,9 +819,15 @@ with \co{rcu_idx} now being a \co{long} instead of an
 \end{lineref}
 
 \begin{listing}[tbp]
-\input{CodeSamples/defer/rcu_rcpls@u.fcv}
-\caption{RCU Shared Update Using Per-Thread Reference-Count Pair}
-\label{lst:app:toyrcu:RCU Shared Update Using Per-Thread Reference-Count Pair}
+\input{CodeSamples/defer/rcu_rcpls@define.fcv}
+\caption{RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data}
+\label{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update Data}
+\end{listing}
+
+\begin{listing}[tbp]
+\input{CodeSamples/defer/rcu_rcpls@r.fcv}
+\caption{RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
+\label{lst:app:toyrcu:RCU Read-Side Using Per-Thread Reference-Count Pair and Shared Update}
 \end{listing}
 
 \Cref{lst:app:toyrcu:RCU Shared Update Using Per-Thread Reference-Count Pair}
@@ -851,6 +845,12 @@ The differences in \co{flip_counter_and_wait()} include:
 \end{enumerate}
 \end{lineref}
 
+\begin{listing}[tbp]
+\input{CodeSamples/defer/rcu_rcpls@u.fcv}
+\caption{RCU Shared Update Using Per-Thread Reference-Count Pair}
+\label{lst:app:toyrcu:RCU Shared Update Using Per-Thread Reference-Count Pair}
+\end{listing}
+
 \begin{lineref}[ln:defer:rcu_rcpls:u:sync]
 The changes to \co{synchronize_rcu()} are more pervasive:
 \begin{enumerate}
@@ -945,6 +945,12 @@ thread-local accesses to one, as is done in the next section.
 \section{RCU Based on Free-Running Counter}
 \label{sec:app:toyrcu:RCU Based on Free-Running Counter}
 
+\Cref{lst:app:toyrcu:Free-Running Counter Using RCU}
+(\path{rcu.h} and \path{rcu.c})
+shows an RCU implementation based on a single global free-running counter
+that takes on only even-numbered values, with data shown in
+\cref{lst:app:toyrcu:Data for Free-Running Counter Using RCU}.
+
 \begin{listing}[tbp]
 \input{CodeSamples/defer/rcu@define.fcv}
 \caption{Data for Free-Running Counter Using RCU}
@@ -958,11 +964,6 @@ thread-local accesses to one, as is done in the next section.
 \label{lst:app:toyrcu:Free-Running Counter Using RCU}
 \end{listing}
 
-\Cref{lst:app:toyrcu:Free-Running Counter Using RCU}
-(\path{rcu.h} and \path{rcu.c})
-shows an RCU implementation based on a single global free-running counter
-that takes on only even-numbered values, with data shown in
-\cref{lst:app:toyrcu:Data for Free-Running Counter Using RCU}.
 The resulting \co{rcu_read_lock()} implementation is extremely
 straightforward.
 \begin{lineref}[ln:defer:rcu:read_lock_unlock:lock]
@@ -1109,19 +1110,6 @@ variables.
 \section{Nestable RCU Based on Free-Running Counter}
 \label{sec:app:toyrcu:Nestable RCU Based on Free-Running Counter}
 
-\begin{listing}[tb]
-\input{CodeSamples/defer/rcu_nest@define.fcv}
-\caption{Data for Nestable RCU Using a Free-Running Counter}
-\label{lst:app:toyrcu:Data for Nestable RCU Using a Free-Running Counter}
-\end{listing}
-
-\begin{listing}[tb]
-\input{CodeSamples/defer/rcu_nest@read_lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
-\input{CodeSamples/defer/rcu_nest@synchronize.fcv}\fvset{firstnumber=auto}
-\caption{Nestable RCU Using a Free-Running Counter}
-\label{lst:app:toyrcu:Nestable RCU Using a Free-Running Counter}
-\end{listing}
-
 \Cref{lst:app:toyrcu:Nestable RCU Using a Free-Running Counter}
 (\path{rcu_nest.h} and \path{rcu_nest.c})
 shows an RCU implementation based on a single global free-running counter,
@@ -1148,6 +1136,19 @@ reserves seven bits, for a maximum RCU read-side critical-section
 nesting depth of 127, which should be well in excess of that needed
 by most applications.
 
+\begin{listing}[tb]
+\input{CodeSamples/defer/rcu_nest@define.fcv}
+\caption{Data for Nestable RCU Using a Free-Running Counter}
+\label{lst:app:toyrcu:Data for Nestable RCU Using a Free-Running Counter}
+\end{listing}
+
+\begin{listing}[tb]
+\input{CodeSamples/defer/rcu_nest@read_lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
+\input{CodeSamples/defer/rcu_nest@synchronize.fcv}\fvset{firstnumber=auto}
+\caption{Nestable RCU Using a Free-Running Counter}
+\label{lst:app:toyrcu:Nestable RCU Using a Free-Running Counter}
+\end{listing}
+
 \begin{lineref}[ln:defer:rcu_nest:read_lock_unlock:lock]
 The resulting \co{rcu_read_lock()} implementation is still reasonably
 straightforward.
@@ -1349,18 +1350,6 @@ overhead.
 \section{RCU Based on Quiescent States}
 \label{sec:app:toyrcu:RCU Based on Quiescent States}
 
-\begin{listing}[tbp]
-\input{CodeSamples/defer/rcu_qs@define.fcv}
-\caption{Data for Quiescent-State-Based RCU}
-\label{lst:app:toyrcu:Data for Quiescent-State-Based RCU}
-\end{listing}
-
-\begin{listing}[tbp]
-\input{CodeSamples/defer/rcu_qs@read_lock_unlock.fcv}
-\caption{Quiescent-State-Based RCU Read Side}
-\label{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
-\end{listing}
-
 \begin{lineref}[ln:defer:rcu_qs:read_lock_unlock]
 \Cref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
 (\path{rcu_qs.h})
@@ -1398,6 +1387,18 @@ It is illegal to invoke \co{rcu_quiescent_state()}, \co{rcu_thread_offline()},
 or \co{rcu_thread_online()} from an RCU read-side critical section.
 \end{lineref}
 
+\begin{listing}[tbp]
+\input{CodeSamples/defer/rcu_qs@define.fcv}
+\caption{Data for Quiescent-State-Based RCU}
+\label{lst:app:toyrcu:Data for Quiescent-State-Based RCU}
+\end{listing}
+
+\begin{listing}[tbp]
+\input{CodeSamples/defer/rcu_qs@read_lock_unlock.fcv}
+\caption{Quiescent-State-Based RCU Read Side}
+\label{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
+\end{listing}
+
 \begin{lineref}[ln:defer:rcu_qs:read_lock_unlock:qs]
 In \co{rcu_quiescent_state()}, \clnref{mb1} executes a memory barrier
 to prevent any code prior to the quiescent state (including possible
diff --git a/count/count.tex b/count/count.tex
index 67d74bc5..7cd8eceb 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -929,13 +929,6 @@ comes at the cost of the additional thread running \co{eventual()}.
 
 \subsection{Per-Thread-Variable-Based Implementation}
 \label{sec:count:Per-Thread-Variable-Based Implementation}
-\NoIndentAfterThis
-
-\begin{listing}[tb]
-\input{CodeSamples/count/count_end@whole.fcv}
-\caption{Per-Thread Statistical Counters}
-\label{lst:count:Per-Thread Statistical Counters}
-\end{listing}
 
 Fortunately, \GCC\ provides an \co{__thread} storage class that provides
 per-thread storage.
@@ -946,6 +939,12 @@ a statistical counter that not only scales, but that also incurs little
 or no performance penalty to incrementers compared to simple non-atomic
 increment.
 
+\begin{listing}[tb]
+\input{CodeSamples/count/count_end@whole.fcv}
+\caption{Per-Thread Statistical Counters}
+\label{lst:count:Per-Thread Statistical Counters}
+\end{listing}
+
 \begin{lineref}[ln:count:count_end:whole]
 \Clnrefrange{var:b}{var:e} define needed variables:
 \co{counter} is the per-thread counter
@@ -1316,20 +1315,6 @@ Section~\ref{sec:SMPdesign:Parallel Fastpath}.
 
 \subsection{Simple Limit Counter Implementation}
 \label{sec:count:Simple Limit Counter Implementation}
-\NoIndentAfterThis
-
-\begin{listing}[tbp]
-\input{CodeSamples/count/count_lim@variable.fcv}
-\caption{Simple Limit Counter Variables}
-\label{lst:count:Simple Limit Counter Variables}
-\end{listing}
-
-\begin{figure}[tb]
-\centering
-\resizebox{2.5in}{!}{\includegraphics{count/count_lim}}
-\caption{Simple Limit Counter Variable Relationships}
-\label{fig:count:Simple Limit Counter Variable Relationships}
-\end{figure}
 
 \begin{lineref}[ln:count:count_lim:variable]
 Listing~\ref{lst:count:Simple Limit Counter Variables}
@@ -1359,6 +1344,19 @@ Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}:
 	that thread's \co{countermax}.
 \end{enumerate}
 
+\begin{listing}[tbp]
+\input{CodeSamples/count/count_lim@variable.fcv}
+\caption{Simple Limit Counter Variables}
+\label{lst:count:Simple Limit Counter Variables}
+\end{listing}
+
+\begin{figure}[tb]
+\centering
+\resizebox{2.5in}{!}{\includegraphics{count/count_lim}}
+\caption{Simple Limit Counter Variable Relationships}
+\label{fig:count:Simple Limit Counter Variable Relationships}
+\end{figure}
+
 Each element of the \co{counterp[]} array references the corresponding
 thread's \co{counter} variable, and, finally, the \co{gblcnt_mutex}
 spinlock guards all of the global variables, in other words, no thread
@@ -1375,7 +1373,6 @@ Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}
 shows the \co{add_count()}, \co{sub_count()}, and \co{read_count()}
 functions (\path{count_lim.c}).
 
-
 \QuickQuiz{}
 	Why does
 	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}
@@ -1766,19 +1763,6 @@ This task is undertaken in the next section.
 
 \subsection{Approximate Limit Counter Implementation}
 \label{sec:count:Approximate Limit Counter Implementation}
-\NoIndentAfterThis
-
-\begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_app@variable.fcv}
-\caption{Approximate Limit Counter Variables}
-\label{lst:count:Approximate Limit Counter Variables}
-\end{listing}
-
-\begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_app@balance.fcv}
-\caption{Approximate Limit Counter Balancing}
-\label{lst:count:Approximate Limit Counter Balancing}
-\end{listing}
 
 Because this implementation (\path{count_lim_app.c}) is quite similar to
 that in the previous section
@@ -1792,6 +1776,18 @@ Listing~\ref{lst:count:Simple Limit Counter Variables},
 with the addition of \co{MAX_COUNTERMAX}, which sets the maximum
 permissible value of the per-thread \co{countermax} variable.
 
+\begin{listing}[tbp]
+\input{CodeSamples/count/count_lim_app@variable.fcv}
+\caption{Approximate Limit Counter Variables}
+\label{lst:count:Approximate Limit Counter Variables}
+\end{listing}
+
+\begin{listing}[tbp]
+\input{CodeSamples/count/count_lim_app@balance.fcv}
+\caption{Approximate Limit Counter Balancing}
+\label{lst:count:Approximate Limit Counter Balancing}
+\end{listing}
+
 \begin{lineref}[ln:count:count_lim_app:balance]
 Similarly,
 Listing~\ref{lst:count:Approximate Limit Counter Balancing}
@@ -2352,15 +2348,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
 
 \subsection{Signal-Theft Limit Counter Implementation}
 \label{sec:count:Signal-Theft Limit Counter Implementation}
-%\NoIndentAfterThis % @@@ Does not work as expected. @@@
-
-\begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_sig@data.fcv}
-\caption{Signal-Theft Limit Counter Data}
-\label{lst:count:Signal-Theft Limit Counter Data}
-\end{listing}
 
-\noindent% @@@ \NoIndentAfterThis above has side-effect @@@
 \begin{lineref}[ln:count:count_lim_sig:data]
 Listing~\ref{lst:count:Signal-Theft Limit Counter Data}
 (\path{count_lim_sig.c})
@@ -2377,9 +2365,9 @@ and \co{theft} variables, respectively.
 \end{lineref}
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_sig@migration.fcv}
-\caption{Signal-Theft Limit Counter Value-Migration Functions}
-\label{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
+\input{CodeSamples/count/count_lim_sig@data.fcv}
+\caption{Signal-Theft Limit Counter Data}
+\label{lst:count:Signal-Theft Limit Counter Data}
 \end{listing}
 
 \begin{lineref}[ln:count:count_lim_sig:migration:globalize]
@@ -2405,6 +2393,12 @@ this thread's fastpaths are not running, line~\lnref{set:READY} sets the \co{the
 state to READY.
 \end{lineref}
 
+\begin{listing}[tbp]
+\input{CodeSamples/count/count_lim_sig@migration.fcv}
+\caption{Signal-Theft Limit Counter Value-Migration Functions}
+\label{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
+\end{listing}
+
 \QuickQuiz{}
 	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
 	function \co{flush_local_count_sig()}, why are there
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 6aa982eb..04998ee3 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -149,20 +149,6 @@ offers excellent scalability.
 
 \subsection{Hash-Table Implementation}
 \label{sec:datastruct:Hash-Table Implementation}
-\NoIndentAfterThis
-
-\begin{listing}[tb]
-\input{CodeSamples/datastruct/hash/hash_bkt@struct.fcv}
-\caption{Hash-Table Data Structures}
-\label{lst:datastruct:Hash-Table Data Structures}
-\end{listing}
-
-\begin{figure}[tb]
-\centering
-\resizebox{3in}{!}{\includegraphics{datastruct/hashdiagram}}
-\caption{Hash-Table Data-Structure Diagram}
-\label{fig:datastruct:Hash-Table Data-Structure Diagram}
-\end{figure}
 
 \begin{lineref}[ln:datastruct:hash_bkt:struct]
 Listing~\ref{lst:datastruct:Hash-Table Data Structures}
@@ -192,16 +178,23 @@ being placed in the hash table, and this larger structure might contain
 a complex key.
 \end{lineref}
 
+\begin{listing}[tb]
+\input{CodeSamples/datastruct/hash/hash_bkt@struct.fcv}
+\caption{Hash-Table Data Structures}
+\label{lst:datastruct:Hash-Table Data Structures}
+\end{listing}
+
+\begin{figure}[tb]
+\centering
+\resizebox{3in}{!}{\includegraphics{datastruct/hashdiagram}}
+\caption{Hash-Table Data-Structure Diagram}
+\label{fig:datastruct:Hash-Table Data-Structure Diagram}
+\end{figure}
+
 The diagram shown in
 Figure~\ref{fig:datastruct:Hash-Table Data-Structure Diagram}
 has bucket~0 with two elements and bucket~2 with one.
 
-\begin{listing}[tb]
-\input{CodeSamples/datastruct/hash/hash_bkt@map_lock.fcv}
-\caption{Hash-Table Mapping and Locking}
-\label{lst:datastruct:Hash-Table Mapping and Locking}
-\end{listing}
-
 \begin{lineref}[ln:datastruct:hash_bkt:map_lock:map]
 Listing~\ref{lst:datastruct:Hash-Table Mapping and Locking}
 shows mapping and locking functions.
@@ -215,9 +208,9 @@ corresponding to the specified hash value.
 \end{lineref}
 
 \begin{listing}[tb]
-\input{CodeSamples/datastruct/hash/hash_bkt@lookup.fcv}
-\caption{Hash-Table Lookup}
-\label{lst:datastruct:Hash-Table Lookup}
+\input{CodeSamples/datastruct/hash/hash_bkt@map_lock.fcv}
+\caption{Hash-Table Mapping and Locking}
+\label{lst:datastruct:Hash-Table Mapping and Locking}
 \end{listing}
 
 \begin{lineref}[ln:datastruct:hash_bkt:lookup]
@@ -241,6 +234,12 @@ line~\lnref{return} returns a pointer to the matching element.
 If no element matches, line~\lnref{ret_NULL} returns \co{NULL}.
 \end{lineref}
 
+\begin{listing}[tb]
+\input{CodeSamples/datastruct/hash/hash_bkt@lookup.fcv}
+\caption{Hash-Table Lookup}
+\label{lst:datastruct:Hash-Table Lookup}
+\end{listing}
+
 \QuickQuiz{}
 	\begin{lineref}[ln:datastruct:hash_bkt:lookup]
 	But isn't the double comparison on
@@ -482,13 +481,6 @@ section~\cite{McKenney:2013:SDS:2483852.2483867}.
 
 \subsection{RCU-Protected Hash Table Implementation}
 \label{sec:datastruct:RCU-Protected Hash Table Implementation}
-\NoIndentAfterThis
-
-\begin{listing}[tb]
-\input{CodeSamples/datastruct/hash/hash_bkt_rcu@lock_unlock.fcv}
-\caption{RCU-Protected Hash-Table Read-Side Concurrency Control}
-\label{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}
-\end{listing}
 
 For an RCU-protected hash table with per-bucket locking,
 updaters use locking exactly as described in
@@ -505,9 +497,9 @@ shown in
 Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}.
 
 \begin{listing}[tb]
-\input{CodeSamples/datastruct/hash/hash_bkt_rcu@lookup.fcv}
-\caption{RCU-Protected Hash-Table Lookup}
-\label{lst:datastruct:RCU-Protected Hash-Table Lookup}
+\input{CodeSamples/datastruct/hash/hash_bkt_rcu@lock_unlock.fcv}
+\caption{RCU-Protected Hash-Table Read-Side Concurrency Control}
+\label{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}
 \end{listing}
 
 Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Lookup}
@@ -531,6 +523,12 @@ RCU read-side critical section, for example, the caller must invoke
 \co{hashtab_lock_lookup()} before invoking \co{hashtab_lookup()}
 (and of course invoke \co{hashtab_unlock_lookup()} some time afterwards).
 
+\begin{listing}[tb]
+\input{CodeSamples/datastruct/hash/hash_bkt_rcu@lookup.fcv}
+\caption{RCU-Protected Hash-Table Lookup}
+\label{lst:datastruct:RCU-Protected Hash-Table Lookup}
+\end{listing}
+
 \QuickQuiz{}
 	But if elements in a hash table can be deleted concurrently
 	with lookups, doesn't that mean that a lookup could return
@@ -893,13 +891,6 @@ which is the subject of the next section.
 
 \subsection{Resizable Hash Table Implementation}
 \label{sec:datastruct:Resizable Hash Table Implementation}
-\NoIndentAfterThis
-
-\begin{listing}[tb]
-\input{CodeSamples/datastruct/hash/hash_resize@data.fcv}
-\caption{Resizable Hash-Table Data Structures}
-\label{lst:datastruct:Resizable Hash-Table Data Structures}
-\end{listing}
 
 \begin{lineref}[ln:datastruct:hash_resize:data]
 Resizing is accomplished by the classic approach of inserting a level
@@ -917,6 +908,12 @@ from both performance and scalability viewpoints.
 However, because resize operations should be relatively infrequent,
 we should be able to make good use of RCU.
 
+\begin{listing}[tb]
+\input{CodeSamples/datastruct/hash/hash_resize@data.fcv}
+\caption{Resizable Hash-Table Data Structures}
+\label{lst:datastruct:Resizable Hash-Table Data Structures}
+\end{listing}
+
 The \co{ht} structure represents a specific size of the hash table,
 as specified by the \co{->ht_nbuckets} field on line~\lnref{ht:nbuckets}.
 The size is stored in the same structure containing the array of
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 9065a1a1..12bfd9b6 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -26,7 +26,22 @@ presents concluding remarks.
 \subsubsection{RCU has a Family of Wait-to-Finish APIs}
 \label{sec:defer:RCU has a Family of Wait-to-Finish APIs}
 
-\begin{table*}[htbp]
+The most straightforward answer to ``what is RCU'' is that RCU is
+an API.
+For example, the RCU implementation used in the Linux kernel is
+summarized by
+Table~\ref{tab:defer:RCU Wait-to-Finish APIs},
+which shows the wait-for-readers portions of the RCU, ``sleepable'' RCU
+(SRCU), Tasks RCU, and generic APIs, respectively,
+and by
+Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
+which shows the publish-subscribe portions of the
+API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
+	This citation covers v4.20 and later.
+	Documetation for earlier versions of the Linux-kernel RCU API may
+	be found elsewhere~\cite{PaulEMcKenney2008WhatIsRCUAPI,PaulEMcKenney2014RCUAPI}.}
+
+\begin{table*}[tbp]
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.3}
 \centering
@@ -101,21 +116,6 @@ presents concluding remarks.
 \end{tabularx}
 \end{table*}
 
-The most straightforward answer to ``what is RCU'' is that RCU is
-an API.
-For example, the RCU implementation used in the Linux kernel is
-summarized by
-Table~\ref{tab:defer:RCU Wait-to-Finish APIs},
-which shows the wait-for-readers portions of the RCU, ``sleepable'' RCU
-(SRCU), Tasks RCU, and generic APIs, respectively,
-and by
-Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
-which shows the publish-subscribe portions of the
-API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
-	This citation covers v4.20 and later.
-	Documetation for earlier versions of the Linux-kernel RCU API may
-	be found elsewhere~\cite{PaulEMcKenney2008WhatIsRCUAPI,PaulEMcKenney2014RCUAPI}.}
-
 If you are new to RCU, you might consider focusing on just one
 of the columns in
 Table~\ref{tab:defer:RCU Wait-to-Finish APIs},
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 34ae77d0..8082a26c 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -44,7 +44,13 @@ Section~\ref{sec:defer:RCU Usage Summary} provides a summary.
 
 \subsubsection{RCU for Pre-BSD Routing}
 \label{sec:defer:RCU for Pre-BSD Routing}
-\NoIndentAfterThis
+
+Listings~\ref{lst:defer:RCU Pre-BSD Routing Table Lookup}
+and~\ref{lst:defer:RCU Pre-BSD Routing Table Add/Delete}
+show code for an RCU-protected Pre-BSD routing table
+(\path{route_rcu.c}).
+The former shows data structures and \co{route_lookup()},
+and the latter shows \co{route_add()} and \co{route_del()}.
 
 \begin{listing}[tbp]
 \input{CodeSamples/defer/route_rcu@lookup.fcv}
@@ -58,13 +64,6 @@ Section~\ref{sec:defer:RCU Usage Summary} provides a summary.
 \label{lst:defer:RCU Pre-BSD Routing Table Add/Delete}
 \end{listing}
 
-Listings~\ref{lst:defer:RCU Pre-BSD Routing Table Lookup}
-and~\ref{lst:defer:RCU Pre-BSD Routing Table Add/Delete}
-show code for an RCU-protected Pre-BSD routing table
-(\path{route_rcu.c}).
-The former shows data structures and \co{route_lookup()},
-and the latter shows \co{route_add()} and \co{route_del()}.
-
 \begin{lineref}[ln:defer:route_rcu:lookup]
 In Listing~\ref{lst:defer:RCU Pre-BSD Routing Table Lookup},
 line~\lnref{rh} adds the \co{->rh} field used by RCU reclamation,
diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 9d7bb772..368e257f 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -139,12 +139,6 @@ This is now possible, as will be described in the following sections.
 \subsection{Axiomatic Approaches and Locking}
 \label{sec:formal:Axiomatic Approaches and Locking}
 
-\begin{listing}[tb]
-\input{CodeSamples/formal/herd/C-Lock1@whole.fcv}
-\caption{Locking Example}
-\label{lst:formal:Locking Example}
-\end{listing}
-
 Axiomatic approaches may also be applied to higher-level
 languages and also to higher-level synchronization primitives, as
 exemplified by the lock-based litmus test shown in
@@ -160,6 +154,12 @@ of one.\footnote{
 	and~\ref{lst:formal:PPCMEM on Repaired Litmus Test}
 	for examples showing the output format.}
 
+\begin{listing}[tb]
+\input{CodeSamples/formal/herd/C-Lock1@whole.fcv}
+\caption{Locking Example}
+\label{lst:formal:Locking Example}
+\end{listing}
+
 \QuickQuiz{}
 	What do you have to do to run \co{herd} on litmus tests like
 	that shown in Listing~\ref{lst:formal:Locking Example}?
@@ -254,12 +254,6 @@ The next section looks at RCU.
 \subsection{Axiomatic Approaches and RCU}
 \label{sec:formal:Axiomatic Approaches and RCU}
 
-\begin{listing}[tb]
-\input{CodeSamples/formal/herd/C-RCU-remove@whole.fcv}
-\caption{Canonical RCU Removal Litmus Test}
-\label{lst:formal:Canonical RCU Removal Litmus Test}
-\end{listing}
-
 \begin{lineref}[ln:formal:C-RCU-remove:whole]
 Axiomatic approaches can also analyze litmus tests involving
 RCU~\cite{Alglave:2018:FSC:3173162.3177156}.
@@ -275,6 +269,12 @@ Line~\lnref{head} shows \co{x} as the list head, initially
 referencing \co{y}, which in turn is initialized to the value
 \co{2} on line~\lnref{tail:1}.
 
+\begin{listing}[tb]
+\input{CodeSamples/formal/herd/C-RCU-remove@whole.fcv}
+\caption{Canonical RCU Removal Litmus Test}
+\label{lst:formal:Canonical RCU Removal Litmus Test}
+\end{listing}
+
 \co{P0()} on \clnrefrange{P0start}{P0end}
 removes element \co{y} from the list by replacing it with element \co{z}
 (line~\lnref{assignnewtail}),
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index bc2e7ee8..41ca46e9 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -321,19 +321,19 @@ preemptible RCU's grace-period machinery.
 \subsubsection{Grace-Period Interface}
 \label{sec:formal:Grace-Period Interface}
 
-\begin{figure}[htb]
-\centering
-\resizebox{3in}{!}{\includegraphics{formal/RCUpreemptStates}}
-\caption{Preemptible RCU State Machine}
-\label{fig:formal:Preemptible RCU State Machine}
-\end{figure}
-
 Of the four preemptible RCU grace-period states shown in
 \cref{fig:formal:Preemptible RCU State Machine},
 only the \co{rcu_try_flip_waitack_state}
 and \co{rcu_try_flip_waitmb_state} states need to wait
 for other CPUs to respond.
 
+\begin{figure}[tb]
+\centering
+\resizebox{3in}{!}{\includegraphics{formal/RCUpreemptStates}}
+\caption{Preemptible RCU State Machine}
+\label{fig:formal:Preemptible RCU State Machine}
+\end{figure}
+
 Of course, if a given CPU is in dynticks-idle state, we shouldn't
 wait for it.
 Therefore, just before entering one of these two states,
@@ -1193,7 +1193,13 @@ development cycle~\cite{PaulEMcKenney2008commit:64db4cfff99c}.
 
 \subsubsection{State Variables for Simplified Dynticks Interface}
 \label{sec:formal:State Variables for Simplified Dynticks Interface}
-\NoIndentAfterThis
+
+\Cref{lst:formal:Variables for Simple Dynticks Interface}
+shows the new per-CPU state variables.
+These variables are grouped into structs to allow multiple independent
+RCU implementations (e.g., \co{rcu} and \co{rcu_bh}) to conveniently
+and efficiently share dynticks state.
+In what follows, they can be thought of as independent per-CPU variables.
 
 \begin{listing}[tbp]
 \begin{VerbatimL}
@@ -1214,13 +1220,6 @@ struct rcu_data {
 \label{lst:formal:Variables for Simple Dynticks Interface}
 \end{listing}
 
-\Cref{lst:formal:Variables for Simple Dynticks Interface}
-shows the new per-CPU state variables.
-These variables are grouped into structs to allow multiple independent
-RCU implementations (e.g., \co{rcu} and \co{rcu_bh}) to conveniently
-and efficiently share dynticks state.
-In what follows, they can be thought of as independent per-CPU variables.
-
 The \co{dynticks_nesting}, \co{dynticks}, and \co{dynticks_snap} variables
 are for the \IRQ\ code paths, and the \co{dynticks_nmi} and
 \co{dynticks_nmi_snap} variables are for the NMI code paths, although
@@ -1276,7 +1275,11 @@ passed through a quiescent state during that interval.
 
 \subsubsection{Entering and Leaving Dynticks-Idle Mode}
 \label{sec:formal:Entering and Leaving Dynticks-Idle Mode}
-\NoIndentAfterThis
+
+\Cref{lst:formal:Entering and Exiting Dynticks-Idle Mode}
+shows the \co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
+which enter and exit dynticks-idle mode, also known as ``nohz'' mode.
+These two functions are invoked from process context.
 
 \begin{listing}[tbp]
 \begin{linelabel}[ln:formal:Entering and Exiting Dynticks-Idle Mode]
@@ -1314,11 +1317,6 @@ void rcu_exit_nohz(void)
 \label{lst:formal:Entering and Exiting Dynticks-Idle Mode}
 \end{listing}
 
-\Cref{lst:formal:Entering and Exiting Dynticks-Idle Mode}
-shows the \co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
-which enter and exit dynticks-idle mode, also known as ``nohz'' mode.
-These two functions are invoked from process context.
-
 \begin{lineref}[ln:formal:Entering and Exiting Dynticks-Idle Mode]
 \Clnref{mb} ensures that any prior memory accesses (which might
 include accesses from RCU read-side critical sections) are seen
@@ -1339,7 +1337,23 @@ the opposite \co{dynticks} polarity.
 
 \subsubsection{NMIs From Dynticks-Idle Mode}
 \label{sec:formal:NMIs From Dynticks-Idle Mode}
-\NoIndentAfterThis
+
+\begin{lineref}[ln:formal:NMIs From Dynticks-Idle Mode]
+\Cref{lst:formal:NMIs From Dynticks-Idle Mode}
+shows the \co{rcu_nmi_enter()} and \co{rcu_nmi_exit()} functions,
+which inform RCU of NMI entry and exit, respectively, from dynticks-idle
+mode.
+However, if the NMI arrives during an \IRQ\ handler, then RCU will already
+be on the lookout for RCU read-side critical sections from this CPU,
+so \clnref{chk_ext1,ret1} of \co{rcu_nmi_enter()} and \clnref{chk_ext2,ret2}
+of \co{rcu_nmi_exit()} silently return if \co{dynticks} is odd.
+Otherwise, the two functions increment \co{dynticks_nmi}, with
+\co{rcu_nmi_enter()} leaving it with an odd value and \co{rcu_nmi_exit()}
+leaving it with an even value.
+Both functions execute memory barriers between this increment
+and possible RCU read-side critical sections on \clnref{mb1,mb2},
+respectively.
+\end{lineref}
 
 \begin{listing}[tbp]
 \begin{linelabel}[ln:formal:NMIs From Dynticks-Idle Mode]
@@ -1373,26 +1387,23 @@ void rcu_nmi_exit(void)
 \label{lst:formal:NMIs From Dynticks-Idle Mode}
 \end{listing}
 
-\begin{lineref}[ln:formal:NMIs From Dynticks-Idle Mode]
-\Cref{lst:formal:NMIs From Dynticks-Idle Mode}
-shows the \co{rcu_nmi_enter()} and \co{rcu_nmi_exit()} functions,
-which inform RCU of NMI entry and exit, respectively, from dynticks-idle
-mode.
-However, if the NMI arrives during an \IRQ\ handler, then RCU will already
-be on the lookout for RCU read-side critical sections from this CPU,
-so \clnref{chk_ext1,ret1} of \co{rcu_nmi_enter()} and \clnref{chk_ext2,ret2}
-of \co{rcu_nmi_exit()} silently return if \co{dynticks} is odd.
-Otherwise, the two functions increment \co{dynticks_nmi}, with
-\co{rcu_nmi_enter()} leaving it with an odd value and \co{rcu_nmi_exit()}
-leaving it with an even value.
-Both functions execute memory barriers between this increment
-and possible RCU read-side critical sections on \clnref{mb1,mb2},
-respectively.
-\end{lineref}
-
 \subsubsection{Interrupts From Dynticks-Idle Mode}
 \label{sec:formal:Interrupts From Dynticks-Idle Mode}
-\NoIndentAfterThis
+
+\begin{lineref}[ln:formal:Interrupts From Dynticks-Idle Mode]
+\Cref{lst:formal:Interrupts From Dynticks-Idle Mode}
+shows \co{rcu_irq_enter()} and \co{rcu_irq_exit()}, which
+inform RCU of entry to and exit from, respectively, \IRQ\ context.
+\Clnref{inc_nst} of \co{rcu_irq_enter()} increments \co{dynticks_nesting},
+and if this variable was already non-zero, \clnref{ret1} silently returns.
+Otherwise, \clnref{inc_dynt1} increments \co{dynticks},
+which will then have
+an odd value, consistent with the fact that this CPU can now
+execute RCU read-side critical sections.
+\Clnref{mb1} therefore executes a memory barrier to ensure that
+the increment of \co{dynticks} is seen before any
+RCU read-side critical sections that the subsequent \IRQ\ handler
+might execute.
 
 \begin{listing}[tbp]
 \begin{linelabel}[ln:formal:Interrupts From Dynticks-Idle Mode]
@@ -1429,21 +1440,6 @@ void rcu_irq_exit(void)
 \label{lst:formal:Interrupts From Dynticks-Idle Mode}
 \end{listing}
 
-\begin{lineref}[ln:formal:Interrupts From Dynticks-Idle Mode]
-\Cref{lst:formal:Interrupts From Dynticks-Idle Mode}
-shows \co{rcu_irq_enter()} and \co{rcu_irq_exit()}, which
-inform RCU of entry to and exit from, respectively, \IRQ\ context.
-\Clnref{inc_nst} of \co{rcu_irq_enter()} increments \co{dynticks_nesting},
-and if this variable was already non-zero, \clnref{ret1} silently returns.
-Otherwise, \clnref{inc_dynt1} increments \co{dynticks},
-which will then have
-an odd value, consistent with the fact that this CPU can now
-execute RCU read-side critical sections.
-\Clnref{mb1} therefore executes a memory barrier to ensure that
-the increment of \co{dynticks} is seen before any
-RCU read-side critical sections that the subsequent \IRQ\ handler
-might execute.
-
 \Clnref{dec_nst} of \co{rcu_irq_exit()} decrements
 \co{dynticks_nesting}, and
 if the result is non-zero, \clnref{ret2} silently returns.
@@ -1461,7 +1457,25 @@ a reschedule API if so.
 
 \subsubsection{Checking For Dynticks Quiescent States}
 \label{sec:formal:Checking For Dynticks Quiescent States}
-%\NoIndentAfterThis % @@@ This doesn't work as expected @@@
+
+\begin{lineref}[ln:formal:Saving Dyntick Progress Counters]
+\Cref{lst:formal:Saving Dyntick Progress Counters}
+shows \co{dyntick_save_progress_counter()}, which takes a snapshot
+of the specified CPU's \co{dynticks} and \co{dynticks_nmi}
+counters.
+\Clnref{snap,snapn} snapshot these two variables to locals, \clnref{mb}
+executes a memory barrier to pair with the memory barriers in the functions in
+\cref{lst:formal:Entering and Exiting Dynticks-Idle Mode,%
+lst:formal:NMIs From Dynticks-Idle Mode,%
+lst:formal:Interrupts From Dynticks-Idle Mode}.
+\Clnref{rec_snap,rec_snapn} record the snapshots for later calls to
+\co{rcu_implicit_dynticks_qs()},
+and \clnref{chk_prgs} checks to see if the CPU is in dynticks-idle mode with
+neither \IRQ s nor NMIs in progress (in other words, both snapshots
+have even values), hence in an extended quiescent state.
+If so, \clnref{cnt:b,cnt:e} count this event, and \clnref{ret} returns
+true if the CPU was in a quiescent state.
+\end{lineref}
 
 \begin{listing}[tbp]
 \begin{linelabel}[ln:formal:Saving Dyntick Progress Counters]
@@ -1489,24 +1503,33 @@ dyntick_save_progress_counter(struct rcu_data *rdp)
 \label{lst:formal:Saving Dyntick Progress Counters}
 \end{listing}
 
-\noindent% @@@ \NoIndentAfterThis commented out above has side effect. @@@
-\begin{lineref}[ln:formal:Saving Dyntick Progress Counters]
-\Cref{lst:formal:Saving Dyntick Progress Counters}
-shows \co{dyntick_save_progress_counter()}, which takes a snapshot
-of the specified CPU's \co{dynticks} and \co{dynticks_nmi}
-counters.
-\Clnref{snap,snapn} snapshot these two variables to locals, \clnref{mb}
-executes a memory barrier to pair with the memory barriers in the functions in
+\begin{lineref}[ln:formal:Checking Dyntick Progress Counters]
+\Cref{lst:formal:Checking Dyntick Progress Counters}
+shows \co{rcu_implicit_dynticks_qs()}, which is called to check
+whether a CPU has entered dyntick-idle mode subsequent to a call
+to \co{dynticks_save_progress_counter()}.
+\Clnref{curr,currn} take new snapshots of the corresponding CPU's
+\co{dynticks} and \co{dynticks_nmi} variables, while
+\clnref{snap,snapn} retrieve the snapshots saved earlier by
+\co{dynticks_save_progress_counter()}.
+\Clnref{mb} then
+executes a memory barrier to pair with the memory barriers in
+the functions in
 \cref{lst:formal:Entering and Exiting Dynticks-Idle Mode,%
 lst:formal:NMIs From Dynticks-Idle Mode,%
 lst:formal:Interrupts From Dynticks-Idle Mode}.
-\Clnref{rec_snap,rec_snapn} record the snapshots for later calls to
-\co{rcu_implicit_dynticks_qs()},
-and \clnref{chk_prgs} checks to see if the CPU is in dynticks-idle mode with
-neither \IRQ s nor NMIs in progress (in other words, both snapshots
-have even values), hence in an extended quiescent state.
-If so, \clnref{cnt:b,cnt:e} count this event, and \clnref{ret} returns
-true if the CPU was in a quiescent state.
+\Clnrefrange{chk_q:b}{chk_q:e}
+then check to see if the CPU is either currently in
+a quiescent state (\co{curr} and \co{curr_nmi} having even values) or
+has passed through a quiescent state since the last call to
+\co{dynticks_save_progress_counter()} (the values of
+\co{dynticks} and \co{dynticks_nmi} having changed).
+If these checks confirm that the CPU has passed through a dyntick-idle
+quiescent state, then \clnref{cnt} counts that fact and
+\clnref{ret_1} returns an indication of this fact.
+Either way, \clnref{chk_race}
+checks for race conditions that can result in RCU
+waiting for a CPU that is offline.
 \end{lineref}
 
 \begin{listing}[tbp]
@@ -1538,35 +1561,6 @@ rcu_implicit_dynticks_qs(struct rcu_data *rdp)
 \label{lst:formal:Checking Dyntick Progress Counters}
 \end{listing}
 
-\begin{lineref}[ln:formal:Checking Dyntick Progress Counters]
-\Cref{lst:formal:Checking Dyntick Progress Counters}
-shows \co{rcu_implicit_dynticks_qs()}, which is called to check
-whether a CPU has entered dyntick-idle mode subsequent to a call
-to \co{dynticks_save_progress_counter()}.
-\Clnref{curr,currn} take new snapshots of the corresponding CPU's
-\co{dynticks} and \co{dynticks_nmi} variables, while
-\clnref{snap,snapn} retrieve the snapshots saved earlier by
-\co{dynticks_save_progress_counter()}.
-\Clnref{mb} then
-executes a memory barrier to pair with the memory barriers in
-the functions in
-\cref{lst:formal:Entering and Exiting Dynticks-Idle Mode,%
-lst:formal:NMIs From Dynticks-Idle Mode,%
-lst:formal:Interrupts From Dynticks-Idle Mode}.
-\Clnrefrange{chk_q:b}{chk_q:e}
-then check to see if the CPU is either currently in
-a quiescent state (\co{curr} and \co{curr_nmi} having even values) or
-has passed through a quiescent state since the last call to
-\co{dynticks_save_progress_counter()} (the values of
-\co{dynticks} and \co{dynticks_nmi} having changed).
-If these checks confirm that the CPU has passed through a dyntick-idle
-quiescent state, then \clnref{cnt} counts that fact and
-\clnref{ret_1} returns an indication of this fact.
-Either way, \clnref{chk_race}
-checks for race conditions that can result in RCU
-waiting for a CPU that is offline.
-\end{lineref}
-
 \QuickQuiz{}
 	This is still pretty complicated.
 	Why not just have a \co{cpumask_t} that has a bit set for
diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 2e9264fc..722bc4d1 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -58,6 +58,13 @@ discusses the implications.
 \subsection{Anatomy of a Litmus Test}
 \label{sec:formal:Anatomy of a Litmus Test}
 
+An example PowerPC litmus test for PPCMEM is shown in
+\cref{lst:formal:PPCMEM Litmus Test}.
+The ARM interface works exactly the same way, but with ARM instructions
+substituted for the Power instructions and with the initial ``PPC''
+replaced by ``ARM''. You can select the ARM interface by clicking on
+``Change to ARM Model'' at the web page called out above.
+
 \begin{listing}[tbp]
 \begin{linelabel}[ln:formal:PPCMEM Litmus Test]
 \begin{VerbatimL}[commandchars=\@\[\]]
@@ -87,13 +94,6 @@ exists						@lnlbl[assert:b]
 \label{lst:formal:PPCMEM Litmus Test}
 \end{listing}
 
-An example PowerPC litmus test for PPCMEM is shown in
-\cref{lst:formal:PPCMEM Litmus Test}.
-The ARM interface works exactly the same way, but with ARM instructions
-substituted for the Power instructions and with the initial ``PPC''
-replaced by ``ARM''. You can select the ARM interface by clicking on
-``Change to ARM Model'' at the web page called out above.
-
 \begin{lineref}[ln:formal:PPCMEM Litmus Test]
 In the example, \clnref{type} identifies the type of system (``ARM'' or
 ``PPC'') and contains the title for the model. \Clnref{altname}
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index cc555dce..1828ea3f 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -62,13 +62,6 @@ more complex uses.
 
 \subsubsection{Promela Warm-Up: Non-Atomic Increment}
 \label{sec:formal:Promela Warm-Up: Non-Atomic Increment}
-\NoIndentAfterThis
-
-\begin{listing}[tbp]
-\input{CodeSamples/formal/promela/increment@whole.fcv}
-\caption{Promela Code for Non-Atomic Increment}
-\label{lst:formal:Promela Code for Non-Atomic Increment}
-\end{listing}
 
 \begin{lineref}[ln:formal:promela:increment:whole]
 Listing~\ref{lst:formal:Promela Code for Non-Atomic Increment}
@@ -79,6 +72,12 @@ to see the effect on state space), line~\lnref{count} defines the counter,
 and line~\lnref{prog} is used to implement the assertion that appears on
 \clnrefrange{assert:b}{assert:e}.
 
+\begin{listing}[tbp]
+\input{CodeSamples/formal/promela/increment@whole.fcv}
+\caption{Promela Code for Non-Atomic Increment}
+\label{lst:formal:Promela Code for Non-Atomic Increment}
+\end{listing}
+
 \Clnrefrange{proc:b}{proc:e} define a process that increments
 the counter non-atomically.
 The argument \co{me} is the process number, set by the initialization
@@ -175,30 +174,34 @@ The assertion then triggered, after which the global state is displayed.
 
 \subsubsection{Promela Warm-Up: Atomic Increment}
 \label{sec:formal:Promela Warm-Up: Atomic Increment}
-\NoIndentAfterThis
 
-\begin{listing}[htbp]
+It is easy to fix this example by placing the body of the incrementer
+processes in an atomic block as shown in
+Listing~\ref{lst:formal:Promela Code for Atomic Increment}.
+One could also have simply replaced the pair of statements with
+\co{counter = counter + 1}, because Promela statements are
+atomic.
+Either way, running this modified model gives us an error-free traversal
+of the state space, as shown in
+Listing~\ref{lst:formal:Atomic Increment Spin Output}.
+
+\begin{listing}[tbp]
 \input{CodeSamples/formal/promela/atomicincrement@incrementer.fcv}
 \caption{Promela Code for Atomic Increment}
 \label{lst:formal:Promela Code for Atomic Increment}
 \end{listing}
 
-\begin{listing}[htbp]
+\begin{listing}[tbp]
 \VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/atomicincrement.spin.lst}
 \vspace*{-9pt}
 \caption{Atomic Increment Spin Output}
 \label{lst:formal:Atomic Increment Spin Output}
 \end{listing}
 
-It is easy to fix this example by placing the body of the incrementer
-processes in an atomic block as shown in
-Listing~\ref{lst:formal:Promela Code for Atomic Increment}.
-One could also have simply replaced the pair of statements with
-\co{counter = counter + 1}, because Promela statements are
-atomic.
-Either way, running this modified model gives us an error-free traversal
-of the state space, as shown in
-Listing~\ref{lst:formal:Atomic Increment Spin Output}.
+Table~\ref{tab:advsync:Memory Usage of Increment Model}
+shows the number of states and memory consumed
+as a function of number of incrementers modeled
+(by redefining \co{NUMPROCS}):
 
 \begin{table}
 \rowcolors{1}{}{lightgray}
@@ -224,11 +227,6 @@ Listing~\ref{lst:formal:Atomic Increment Spin Output}.
 \label{tab:advsync:Memory Usage of Increment Model}
 \end{table}
 
-Table~\ref{tab:advsync:Memory Usage of Increment Model}
-shows the number of states and memory consumed
-as a function of number of incrementers modeled
-(by redefining \co{NUMPROCS}):
-
 Running unnecessarily large models is thus subtly discouraged, although
 882\,MB is well within the limits of modern desktop and laptop machines.
 
@@ -467,13 +465,6 @@ Now we are ready for more complex examples.
 
 \subsection{Promela Example: Locking}
 \label{sec:formal:Promela Example: Locking}
-\NoIndentAfterThis
-
-\begin{listing}[tbp]
-\input{CodeSamples/formal/promela/lock@whole.fcv}
-\caption{Promela Code for Spinlock}
-\label{lst:formal:Promela Code for Spinlock}
-\end{listing}
 
 \begin{lineref}[ln:formal:promela:lock:whole]
 Since locks are generally useful, \co{spin_lock()} and
@@ -498,6 +489,12 @@ atomic block so as to take another pass through the outer
 loop, repeating until the lock is available.
 \end{lineref}
 
+\begin{listing}[tbp]
+\input{CodeSamples/formal/promela/lock@whole.fcv}
+\caption{Promela Code for Spinlock}
+\label{lst:formal:Promela Code for Spinlock}
+\end{listing}
+
 The \co{spin_unlock()} macro simply marks the lock as no
 longer held.
 
diff --git a/locking/locking.tex b/locking/locking.tex
index 624890a2..25dc6378 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -486,7 +486,22 @@ this is unlikely.
 
 \subsubsection{Conditional Locking}
 \label{sec:locking:Conditional Locking}
-\NoIndentAfterThis
+
+But suppose that there is no reasonable locking hierarchy.
+This can happen in real life, for example, in layered network protocol stacks
+where packets flow in both directions.
+In the networking case, it might be necessary to hold the locks from
+both layers when passing a packet from one layer to another.
+Given that packets travel both up and down the protocol stack, this
+is an excellent recipe for deadlock, as illustrated in
+Listing~\ref{lst:locking:Protocol Layering and Deadlock}.
+\begin{lineref}[ln:locking:Protocol Layering and Deadlock]
+Here, a packet moving down the stack towards the wire must acquire
+the next layer's lock out of order.
+Given that packets moving up the stack away from the wire are acquiring
+the locks in order, the lock acquisition in line~\lnref{acq} of the listing
+can result in deadlock.
+\end{lineref}
 
 \begin{listing}[tbp]
 \begin{linelabel}[ln:locking:Protocol Layering and Deadlock]
@@ -504,21 +519,15 @@ spin_unlock(&nextlayer->lock1);
 \label{lst:locking:Protocol Layering and Deadlock}
 \end{listing}
 
-But suppose that there is no reasonable locking hierarchy.
-This can happen in real life, for example, in layered network protocol stacks
-where packets flow in both directions.
-In the networking case, it might be necessary to hold the locks from
-both layers when passing a packet from one layer to another.
-Given that packets travel both up and down the protocol stack, this
-is an excellent recipe for deadlock, as illustrated in
-Listing~\ref{lst:locking:Protocol Layering and Deadlock}.
-\begin{lineref}[ln:locking:Protocol Layering and Deadlock]
-Here, a packet moving down the stack towards the wire must acquire
-the next layer's lock out of order.
-Given that packets moving up the stack away from the wire are acquiring
-the locks in order, the lock acquisition in line~\lnref{acq} of the listing
-can result in deadlock.
-\end{lineref}
+One way to avoid deadlocks in this case is to impose a locking hierarchy,
+but when it is necessary to acquire a lock out of order, acquire it
+conditionally, as shown in
+Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}.
+\begin{lineref}[ln:locking:Avoiding Deadlock Via Conditional Locking]
+Instead of unconditionally acquiring the layer-1 lock, line~\lnref{trylock}
+conditionally acquires the lock using the \co{spin_trylock()} primitive.
+This primitive acquires the lock immediately if the lock is available
+(returning non-zero), and otherwise returns zero without acquiring the lock.
 
 \begin{listing}[tbp]
 \begin{linelabel}[ln:locking:Avoiding Deadlock Via Conditional Locking]
@@ -546,16 +555,6 @@ retry:
 \label{lst:locking:Avoiding Deadlock Via Conditional Locking}
 \end{listing}
 
-One way to avoid deadlocks in this case is to impose a locking hierarchy,
-but when it is necessary to acquire a lock out of order, acquire it
-conditionally, as shown in
-Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}.
-\begin{lineref}[ln:locking:Avoiding Deadlock Via Conditional Locking]
-Instead of unconditionally acquiring the layer-1 lock, line~\lnref{trylock}
-conditionally acquires the lock using the \co{spin_trylock()} primitive.
-This primitive acquires the lock immediately if the lock is available
-(returning non-zero), and otherwise returns zero without acquiring the lock.
-
 If \co{spin_trylock()} was successful, line~\lnref{l1_proc} does the needed
 layer-1 processing.
 Otherwise, line~\lnref{rel2} releases the lock, and
@@ -818,7 +817,13 @@ quite useful in many settings.
 
 \subsection{Livelock and Starvation}
 \label{sec:locking:Livelock and Starvation}
-\NoIndentAfterThis
+
+Although conditional locking can be an effective deadlock-avoidance
+mechanism, it can be abused.
+Consider for example the beautifully symmetric example shown in
+Listing~\ref{lst:locking:Abusing Conditional Locking}.
+This example's beauty hides an ugly livelock.
+To see this, consider the following sequence of events:
 
 \begin{listing}[tbp]
 \begin{linelabel}[ln:locking:Abusing Conditional Locking]
@@ -856,13 +861,6 @@ retry:					\lnlbl[thr2:retry]
 \label{lst:locking:Abusing Conditional Locking}
 \end{listing}
 
-Although conditional locking can be an effective deadlock-avoidance
-mechanism, it can be abused.
-Consider for example the beautifully symmetric example shown in
-Listing~\ref{lst:locking:Abusing Conditional Locking}.
-This example's beauty hides an ugly livelock.
-To see this, consider the following sequence of events:
-
 \begin{lineref}[ln:locking:Abusing Conditional Locking]
 \begin{enumerate}
 \item	Thread~1 acquires \co{lock1} on line~\lnref{thr1:acq1}, then invokes
@@ -1680,13 +1678,6 @@ environments.
 
 \subsection{Sample Exclusive-Locking Implementation Based on Atomic Exchange}
 \label{sec:locking:Sample Exclusive-Locking Implementation Based on Atomic Exchange}
-\NoIndentAfterThis
-
-\begin{listing}[tbp]
-\input{CodeSamples/locking/xchglock@lock_unlock.fcv}
-\caption{Sample Lock Based on Atomic Exchange}
-\label{lst:locking:Sample Lock Based on Atomic Exchange}
-\end{listing}
 
 \begin{lineref}[ln:locking:xchglock:lock_unlock]
 This section reviews the implementation shown in
@@ -1697,6 +1688,12 @@ The initial value of this lock is zero, meaning ``unlocked'',
 as shown on line~\lnref{initval}.
 \end{lineref}
 
+\begin{listing}[tbp]
+\input{CodeSamples/locking/xchglock@lock_unlock.fcv}
+\caption{Sample Lock Based on Atomic Exchange}
+\label{lst:locking:Sample Lock Based on Atomic Exchange}
+\end{listing}
+
 \QuickQuiz{}
 	\begin{lineref}[ln:locking:xchglock:lock_unlock]
 	Why not rely on the C language's default initialization of
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index b2d3e194..034413b5 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1904,12 +1904,6 @@ Cumulativity nevertheless has limits, which are examined in the next section.
 \subsubsection{Propagation}
 \label{sec:memorder:Propagation}
 
-\begin{listing}[tbp]
-\input{CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o@whole.fcv}
-\caption{W+RWC Litmus Test With Release (No Ordering)}
-\label{lst:memorder:W+RWC Litmus Test With Release (No Ordering)}
-\end{listing}
-
 \begin{lineref}[ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole]
 \Cref{lst:memorder:W+RWC Litmus Test With Release (No Ordering)}
 (\path{C-W+RWC+o-r+a-o+o-mb-o.litmus})
@@ -1923,6 +1917,12 @@ load (\clnref{P1:ld}) and \co{P2()}'s store (\clnref{P2:st}).
 This means that the \co{exists} clause on \clnref{exists} really can trigger.
 \end{lineref}
 
+\begin{listing}[tbp]
+\input{CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o@whole.fcv}
+\caption{W+RWC Litmus Test With Release (No Ordering)}
+\label{lst:memorder:W+RWC Litmus Test With Release (No Ordering)}
+\end{listing}
+
 \QuickQuiz{}
 	But it is not necessary to worry about propagation unless
 	there are at least three threads in the litmus test, right?
@@ -2170,12 +2170,6 @@ memory accesses is covered in the next section.
 \subsubsection{Release-Acquire Chains}
 \label{sec:memorder:Release-Acquire Chains}
 
-\begin{listing}[tbp]
-\input{CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r@whole.fcv}
-\caption{Long LB Release-Acquire Chain}
-\label{lst:memorder:Long LB Release-Acquire Chain}
-\end{listing}
-
 A minimal release-acquire chain was shown in
 \cref{lst:memorder:Enforcing Ordering of Load-Buffering Litmus Test},
 but these chains can be much longer, as shown in
@@ -2186,9 +2180,9 @@ from the passage of time, so that no matter how many threads are
 involved, the corresponding \co{exists} clause cannot trigger.
 
 \begin{listing}[tbp]
-\input{CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o@whole.fcv}
-\caption{Long ISA2 Release-Acquire Chain}
-\label{lst:memorder:Long ISA2 Release-Acquire Chain}
+\input{CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r@whole.fcv}
+\caption{Long LB Release-Acquire Chain}
+\label{lst:memorder:Long LB Release-Acquire Chain}
 \end{listing}
 
 Although release-acquire chains are inherently store-to-load creatures,
@@ -2216,6 +2210,12 @@ Because \co{P3()}'s \co{READ_ONCE()} cannot be both before and after
 be true:
 \end{lineref}
 
+\begin{listing}[tbp]
+\input{CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o@whole.fcv}
+\caption{Long ISA2 Release-Acquire Chain}
+\label{lst:memorder:Long ISA2 Release-Acquire Chain}
+\end{listing}
+
 \begin{enumerate}
 \item	\co{P3()}'s \co{READ_ONCE()} came after \co{P0()}'s
 	\co{WRITE_ONCE()}, so that the \co{READ_ONCE()} returned
@@ -3306,12 +3306,6 @@ These questions are addressed in the following sections.
 \subsubsection{RCU Read-Side Ordering}
 \label{sec:memorder:RCU Read-Side Ordering}
 
-\begin{listing}[tb]
-\input{CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul@whole.fcv}
-\caption{RCU Readers Provide No Lock-Like Ordering}
-\label{lst:memorder:RCU Readers Provide No Lock-Like Ordering}
-\end{listing}
-
 On their own, RCU's read-side primitives \co{rcu_read_lock()} and
 \co{rcu_read_unlock()} provide no ordering whatsoever.
 In particular, despite their names, they do not act like locks, as can
@@ -3323,9 +3317,9 @@ test's cycle is allowed: Both instances of the \co{r1} register can
 have final values of 1.
 
 \begin{listing}[tb]
-\input{CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o@whole.fcv}
-\caption{RCU Readers Provide No Barrier-Like Ordering}
-\label{lst:memorder:RCU Readers Provide No Barrier-Like Ordering}
+\input{CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul@whole.fcv}
+\caption{RCU Readers Provide No Lock-Like Ordering}
+\label{lst:memorder:RCU Readers Provide No Lock-Like Ordering}
 \end{listing}
 
 Nor do these primitives have barrier-like ordering properties,
@@ -3335,6 +3329,12 @@ at least not unless there is a grace period in the mix, as can be seen in
 This litmus test's cycle is allowed, as can be verified by running
 \co{herd} on this litmus test.
 
+\begin{listing}[tb]
+\input{CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o@whole.fcv}
+\caption{RCU Readers Provide No Barrier-Like Ordering}
+\label{lst:memorder:RCU Readers Provide No Barrier-Like Ordering}
+\end{listing}
+
 Of course, lack of ordering in both these litmus tests should be absolutely
 no surprise, given that both \co{rcu_read_lock()} and \co{rcu_read_unlock()}
 are no-ops in the QSBR implementation of RCU.
@@ -3342,12 +3342,6 @@ are no-ops in the QSBR implementation of RCU.
 \subsubsection{RCU Update-Side Ordering}
 \label{sec:memorder:RCU Update-Side Ordering}
 
-\begin{listing}[tb]
-\input{CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o@whole.fcv}
-\caption{RCU Updaters Provide Full Ordering}
-\label{lst:memorder:RCU Updaters Provide Full Ordering}
-\end{listing}
-
 In contrast with RCU readers, the RCU updater-side functions
 \co{synchronize_rcu()} and \co{synchronize_rcu_expedited()}
 provide memory ordering at least as strong as \co{smp_mb()},
@@ -3358,6 +3352,12 @@ This test's cycle is prohibited, just as would be the case with
 This should be no surprise given the information presented in
 \cref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}.
 
+\begin{listing}[tb]
+\input{CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o@whole.fcv}
+\caption{RCU Updaters Provide Full Ordering}
+\label{lst:memorder:RCU Updaters Provide Full Ordering}
+\end{listing}
+
 \subsubsection{RCU Readers: Before and After}
 \label{sec:memorder:RCU Readers: Before and After}
 
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 2a2bdf75..24f611c7 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -114,12 +114,6 @@ held constant, ensuring that \co{read_count()} sees consistent data.
 
 \subsubsection{Implementation}
 
-\begin{listing}[bp]
-\input{CodeSamples/count/count_end_rcu@whole.fcv}
-\caption{RCU and Per-Thread Statistical Counters}
-\label{lst:together:RCU and Per-Thread Statistical Counters}
-\end{listing}
-
 \begin{lineref}[ln:count:count_end_rcu:whole]
 \Clnrefrange{struct:b}{struct:e} of
 \cref{lst:together:RCU and Per-Thread Statistical Counters}
@@ -131,6 +125,12 @@ This structure allows a given execution of \co{read_count()}
 to see a total that is consistent with the indicated set of running
 threads.
 
+\begin{listing}[bp]
+\input{CodeSamples/count/count_end_rcu@whole.fcv}
+\caption{RCU and Per-Thread Statistical Counters}
+\label{lst:together:RCU and Per-Thread Statistical Counters}
+\end{listing}
+
 \Clnrefrange{perthread:b}{perthread:e}
 contain the definition of the per-thread \co{counter}
 variable, the global pointer \co{countarrayp} referencing
@@ -329,6 +329,12 @@ tradeoff.
 \subsection{Array and Length}
 \label{sec:together:Array and Length}
 
+Suppose we have an RCU-protected variable-length array, as shown in
+\cref{lst:together:RCU-Protected Variable-Length Array}.
+The length of the array \co{->a[]} can change dynamically, and at any
+given time, its length is given by the field \co{->length}.
+Of course, this introduces the following race condition:
+
 \begin{listing}[tbp]
 \begin{VerbatimL}[tabsize=8]
 struct foo {
@@ -340,12 +346,6 @@ struct foo {
 \label{lst:together:RCU-Protected Variable-Length Array}
 \end{listing}
 
-Suppose we have an RCU-protected variable-length array, as shown in
-\cref{lst:together:RCU-Protected Variable-Length Array}.
-The length of the array \co{->a[]} can change dynamically, and at any
-given time, its length is given by the field \co{->length}.
-Of course, this introduces the following race condition:
-
 \begin{enumerate}
 \item	The array is initially 16 characters long, and thus \co{->length}
 	is equal to 16.
@@ -412,6 +412,18 @@ A more general version of this approach is presented in the next section.
 \subsection{Correlated Fields}
 \label{sec:together:Correlated Fields}
 
+Suppose that each of Sch\"odinger's animals is represented by the
+data element shown in
+\cref{lst:together:Uncorrelated Measurement Fields}.
+The \co{meas_1}, \co{meas_2}, and \co{meas_3} fields are a set
+of correlated measurements that are updated periodically.
+It is critically important that readers see these three values from
+a single measurement update: If a reader sees an old value of
+\co{meas_1} but new values of \co{meas_2} and \co{meas_3}, that
+reader will become fatally confused.
+How can we guarantee that readers will see coordinated sets of these
+three values?
+
 \begin{listing}[tbp]
 \begin{VerbatimL}[tabsize=8]
 struct animal {
@@ -427,18 +439,6 @@ struct animal {
 \label{lst:together:Uncorrelated Measurement Fields}
 \end{listing}
 
-Suppose that each of Sch\"odinger's animals is represented by the
-data element shown in
-\cref{lst:together:Uncorrelated Measurement Fields}.
-The \co{meas_1}, \co{meas_2}, and \co{meas_3} fields are a set
-of correlated measurements that are updated periodically.
-It is critically important that readers see these three values from
-a single measurement update: If a reader sees an old value of
-\co{meas_1} but new values of \co{meas_2} and \co{meas_3}, that
-reader will become fatally confused.
-How can we guarantee that readers will see coordinated sets of these
-three values?
-
 One approach would be to allocate a new \co{animal} structure,
 copy the old structure into the new structure, update the new
 structure's \co{meas_1}, \co{meas_2}, and \co{meas_3} fields,
-- 
2.17.1


