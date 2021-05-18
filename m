Return-Path: <SRS0=cX2R=KN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uqIWgNnNyvnNN5G7Dp+jDBIyJYZGUayVhQgTB0ZojY0=;
        b=jZT1YSJfWXc0983NwdJbOVZ5UDlq7qC6JqDNjpx5v9EV10Z6kVOmWYexmRCc8rpOdA
         vLvCr1ceN4eZVACVBzzXYNX0NNhgTAihM+n7ss+qww8eRGtlmRL3bVlcu0WMzLLnvpgg
         qw+qeOWaHSSig0WnMp7lRG/r1onj8GgFERIPGxHN1oG3vwX416gJd1+5AtGbb4WuEfie
         WvGE7wRYyk4oeqZSW008TwmQ56McWIhVJVsuvWEeFC6soKyuomRygqKN2dMH6ZWMv3oD
         oX1Nq+wLpZgyUb9BMbvUk8ITBJjXlWKIA1fxf77t0QeXKC0kLz0rsWg5hU/0pnNBltgq
         vSlw==
Subject: [PATCH -perfbook 8/8] easy, future, appendix: Employ \cref{} and its
 variants
References: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7e737d97-67ba-1aad-a29e-656c7845e1d3@gmail.com>
Date: Tue, 18 May 2021 21:25:40 +0900
MIME-Version: 1.0
In-Reply-To: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Note:

In toyrcu.tex, one "enumerate" list is converted to a "sequence"
list to allow \cref{} to print "step n".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 ack.tex                              | 40 ++++++++++++++--------------
 appendix/questions/after.tex         |  8 +++---
 appendix/questions/removelocking.tex |  2 +-
 appendix/toyrcu/toyrcu.tex           | 10 +++----
 appendix/whymb/whymemorybarriers.tex |  2 +-
 easy/easy.tex                        |  6 ++---
 future/cpu.tex                       | 10 +++----
 future/formalregress.tex             |  2 +-
 future/htm.tex                       |  2 +-
 future/tm.tex                        |  2 +-
 glossary.tex                         |  2 +-
 summary.tex                          |  2 +-
 12 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/ack.tex b/ack.tex
index ce64d325..5ca46498 100644
--- a/ack.tex
+++ b/ack.tex
@@ -17,7 +17,7 @@
 
 Akira Yokosawa is this book's \LaTeX\ advisor, which perhaps most
 notably includes the care and feeding of the style guide laid out
-in Appendix~\ref{chp:app:styleguide:Style Guide}.
+in \cref{chp:app:styleguide:Style Guide}.
 This work includes table layout, listings, fonts, rendering of math,
 acronyms, bibliography formatting, epigraphs, hyperlinks, paper size.
 Akira also perfected the cross-referencing of quick quizzes, allowing
@@ -35,27 +35,27 @@ hyperlinked line-number references) from the source files.
 \section{Reviewers}
 
 \begin{itemize}
-\item	Alan Stern (\Cref{chp:Advanced Synchronization: Memory Ordering}).
-\item	Andy Whitcroft (\Cref{sec:defer:RCU Fundamentals},
-	\Cref{sec:defer:RCU Linux-Kernel API}).
-\item	Artem Bityutskiy (\Cref{chp:Advanced Synchronization: Memory Ordering},
-	\Cref{chp:app:whymb:Why Memory Barriers?}).
-\item	Dave Keck (\Cref{chp:app:whymb:Why Memory Barriers?}).
+\item	Alan Stern (\cref{chp:Advanced Synchronization: Memory Ordering}).
+\item	Andy Whitcroft (\cref{sec:defer:RCU Fundamentals},
+	\cref{sec:defer:RCU Linux-Kernel API}).
+\item	Artem Bityutskiy (\cref{chp:Advanced Synchronization: Memory Ordering},
+	\cref{chp:app:whymb:Why Memory Barriers?}).
+\item	Dave Keck (\cref{chp:app:whymb:Why Memory Barriers?}).
 \item	David S. Horner
-	(\Cref{sec:formal:Promela Parable: dynticks and Preemptible RCU}).
-\item	Gautham Shenoy (\Cref{sec:defer:RCU Fundamentals},
-	\Cref{sec:defer:RCU Linux-Kernel API}).
-\item	``jarkao2'', AKA LWN guest \#41960 (\Cref{sec:defer:RCU Linux-Kernel API}).
-\item	Jonathan Walpole (\Cref{sec:defer:RCU Linux-Kernel API}).
-\item	Josh Triplett (\Cref{chp:Formal Verification}).
-\item	Michael Factor (\Cref{sec:future:Transactional Memory}).
-\item	Mike Fulton (\Cref{sec:defer:RCU Fundamentals}).
+	(\cref{sec:formal:Promela Parable: dynticks and Preemptible RCU}).
+\item	Gautham Shenoy (\cref{sec:defer:RCU Fundamentals},
+	\cref{sec:defer:RCU Linux-Kernel API}).
+\item	``jarkao2'', AKA LWN guest \#41960 (\cref{sec:defer:RCU Linux-Kernel API}).
+\item	Jonathan Walpole (\cref{sec:defer:RCU Linux-Kernel API}).
+\item	Josh Triplett (\cref{chp:Formal Verification}).
+\item	Michael Factor (\cref{sec:future:Transactional Memory}).
+\item	Mike Fulton (\cref{sec:defer:RCU Fundamentals}).
 \item	Peter Zijlstra
-	(\Cref{sec:defer:RCU Usage}). % Lanin and Shasha citation.
-\item	Richard Woodruff (\Cref{chp:app:whymb:Why Memory Barriers?}).
-\item	Suparna Bhattacharya (\Cref{chp:Formal Verification}).
+	(\cref{sec:defer:RCU Usage}). % Lanin and Shasha citation.
+\item	Richard Woodruff (\cref{chp:app:whymb:Why Memory Barriers?}).
+\item	Suparna Bhattacharya (\cref{chp:Formal Verification}).
 \item	Vara Prasad
-	(\Cref{sec:formal:Promela Parable: dynticks and Preemptible RCU}).
+	(\cref{sec:formal:Promela Parable: dynticks and Preemptible RCU}).
 \end{itemize}
 
 Reviewers whose feedback took the extremely welcome form of a patch
@@ -97,7 +97,7 @@ Tony Breeds.
 
 \ListContributions
 
-Figure~\ref{fig:defer:RCU Areas of Applicability} was adapted from
+\Cref{fig:defer:RCU Areas of Applicability} was adapted from
 \ppl{Fedor}{Pikus}'s ``When to use RCU'' slide~\cite{FedorPikus2017RCUthenWhat}.
 The discussion of mechanical reference counters in
 \cref{sec:defer:Reference Counting}
diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index b641417d..195179d9 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -92,16 +92,16 @@ instructions in that time.
 One possible reason is given by the following sequence of events:
 \begin{enumerate}
 \item	Consumer obtains timestamp
-	(\Cref{lst:app:questions:After Consumer Function},
+	(\cref{lst:app:questions:After Consumer Function},
 	\clnref{consumer:tod}).
 \item	Consumer is preempted.
 \item	An arbitrary amount of time passes.
 \item	Producer obtains timestamp
-	(\Cref{lst:app:questions:After Producer Function},
+	(\cref{lst:app:questions:After Producer Function},
 	\clnref{producer:tod}).
 \item	Consumer starts running again, and picks up the producer's
 	timestamp
-	(\Cref{lst:app:questions:After Consumer Function},
+	(\cref{lst:app:questions:After Consumer Function},
 	\clnref{consumer:prodtod}).
 \end{enumerate}
 
@@ -189,7 +189,7 @@ In summary, if you acquire an \IXh{exclusive}{lock}, you {\em know} that
 anything you do while holding that lock will appear to happen after
 anything done by any prior holder of that lock, at least give or
 take \IXacrl{tle}
-(see Section~\ref{sec:future:Semantic Differences}).
+(see \cref{sec:future:Semantic Differences}).
 No need to worry about which CPU did or did not execute a memory
 barrier, no need to worry about the CPU or compiler reordering
 operations---life is simple.
diff --git a/appendix/questions/removelocking.tex b/appendix/questions/removelocking.tex
index dae8355a..842ee28c 100644
--- a/appendix/questions/removelocking.tex
+++ b/appendix/questions/removelocking.tex
@@ -14,7 +14,7 @@ than its locked counterpart, a few of which are discussed in
 However, lockless algorithms are not guaranteed to perform and scale
 well, as shown by
 \cref{fig:count:Atomic Increment Scalability on x86} on
-page~\pageref{fig:count:Atomic Increment Scalability on x86}.
+\cpageref{fig:count:Atomic Increment Scalability on x86}.
 Furthermore, as a general rule, the more complex the algorithm,
 the greater the advantage of combining locking with selected
 lockless techniques, even with significant hardware support,
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index be77c045..9e5c01d5 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -161,7 +161,7 @@ in the next section.
 \section{Per-Thread Lock-Based RCU}
 \label{sec:app:toyrcu:Per-Thread Lock-Based RCU}
 
-\cref{lst:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
+\Cref{lst:app:toyrcu:Per-Thread Lock-Based RCU Implementation}
 (\path{rcu_lock_percpu.h} and \path{rcu_lock_percpu.c})
 shows an implementation based on one lock per thread.
 The \co{rcu_read_lock()} and \co{rcu_read_unlock()} functions
@@ -550,7 +550,7 @@ checking of \co{rcu_refcnt}.
 	\begin{fcvref}[ln:defer:rcu_rcpg]
 	Both flips are absolutely required.
 	To see this, consider the following sequence of events:
-	\begin{enumerate}
+	\begin{sequence}
 	\item	\Clnref{r:lock:cur:b} of \co{rcu_read_lock()} in
 		\cref{lst:app:toyrcu:RCU Read-Side Using Global Reference-Count Pair}
 		picks up \co{rcu_idx}, finding its value to be zero.
@@ -579,16 +579,16 @@ checking of \co{rcu_refcnt}.
 		\co{rcu_refcnt[0]}, not \co{rcu_refcnt[1]}!)
 		\label{sec:app:toyrcu:rcu_rcgp:RCU Grace Period Start}
 	\item	The grace period that started in
-		step~\ref{sec:app:toyrcu:rcu_rcgp:RCU Grace Period Start}
+		\cref{sec:app:toyrcu:rcu_rcgp:RCU Grace Period Start}
 		has been allowed to end, despite
 		the fact that the RCU read-side critical section
 		that started beforehand in
-		step~\ref{sec:app:toyrcu:rcu_rcgp:RCU Read Side Start}
+		\cref{sec:app:toyrcu:rcu_rcgp:RCU Read Side Start}
 		has not completed.
 		This violates RCU semantics, and could allow the update
 		to free a data element that the RCU read-side critical
 		section was still referencing.
-	\end{enumerate}
+	\end{sequence}
 
 	Exercise for the reader: What happens if \co{rcu_read_lock()}
 	is preempted for a very long time (hours!) just after
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index ea9fd14b..19fe4b4f 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -926,7 +926,7 @@ With this latter approach the sequence of operations might be as follows:
 \QuickQuiz{
 	After \cref{seq:app:whymb:Store buffers: All copies shared}
 	in \cref{sec:app:whymb:Store Buffers and Memory Barriers} on
-	page~\pageref{seq:app:whymb:Store buffers: All copies shared},
+	\cpageref{seq:app:whymb:Store buffers: All copies shared},
 	both CPUs might drop the cache line containing the new value of
 	``b''.
 	Wouldn't that cause this new value to be lost?
diff --git a/easy/easy.tex b/easy/easy.tex
index 1ac5b419..008db374 100644
--- a/easy/easy.tex
+++ b/easy/easy.tex
@@ -133,7 +133,7 @@ Linux kernel:
 	this point on the scale.
 	Many developers assume that this function has much
 	stronger ordering semantics than it actually possesses.
-	Chapter~\ref{chp:Advanced Synchronization: Memory Ordering} contains the
+	\Cref{chp:Advanced Synchronization: Memory Ordering} contains the
 	information needed to avoid this mistake, as does the
 	Linux-kernel source tree's \path{Documentation} and
 	\path{tools/memory-model} directories.
@@ -153,7 +153,7 @@ Linux kernel:
 	 {\emph{Alan J.~Perlis}}
 
 The set of useful programs resembles the Mandelbrot set
-(shown in Figure~\ref{fig:easy:Mandelbrot Set})
+(shown in \cref{fig:easy:Mandelbrot Set})
 in that it does
 not have a clear-cut smooth boundary---if it did, the halting problem
 would be solvable.
@@ -316,6 +316,6 @@ be worthwhile.
 
 Exceptions aside, we must continue to shave the software ``Mandelbrot
 set'' so that our programs remain maintainable, as shown in
-Figure~\ref{fig:easy:Shaving the Mandelbrot Set}.
+\cref{fig:easy:Shaving the Mandelbrot Set}.
 
 \QuickQuizAnswersChp{qqzeasy}
diff --git a/future/cpu.tex b/future/cpu.tex
index 205bf248..02d383da 100644
--- a/future/cpu.tex
+++ b/future/cpu.tex
@@ -53,15 +53,15 @@ With that in mind, consider the following scenarios:
 
 \begin{enumerate}
 \item	Uniprocessor \"Uber Alles
-	(\Cref{fig:future:Uniprocessor \"Uber Alles}),
+	(\cref{fig:future:Uniprocessor \"Uber Alles}),
 \item	Multithreaded Mania
-	(\Cref{fig:future:Multithreaded Mania}),
+	(\cref{fig:future:Multithreaded Mania}),
 \item	More of the Same
-	(\Cref{fig:future:More of the Same}), and
+	(\cref{fig:future:More of the Same}), and
 \item	Crash Dummies Slamming into the Memory Wall
-	(\Cref{fig:future:Crash Dummies Slamming into the Memory Wall}).
+	(\cref{fig:future:Crash Dummies Slamming into the Memory Wall}).
 \item	Astounding Accelerators
-	(\Cref{fig:future:Astounding Accelerators}).
+	(\cref{fig:future:Astounding Accelerators}).
 \end{enumerate}
 
 Each of these scenarios is covered in the following sections.
diff --git a/future/formalregress.tex b/future/formalregress.tex
index 91eee602..f7de68bd 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -254,7 +254,7 @@ is more than two orders of magnitude faster than emulation!
 
 \QuickQuiz{
 \begin{fcvref}[ln:future:formalregress:C-SB+l-o-o-u+l-o-o-u-C:whole]
-	Why bother with a separate \co{filter} command on line~\lnref{filter_} of
+	Why bother with a separate \co{filter} command on \clnref{filter_} of
 	\cref{lst:future:Emulating Locking with cmpxchg}
 	instead of just adding the condition to the \co{exists} clause?
 	And wouldn't it be simpler to use \co{xchg_acquire()} instead
diff --git a/future/htm.tex b/future/htm.tex
index 22e40c19..51ed3ca3 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -925,7 +925,7 @@ as discussed in the next section.
 Although it will likely be some time before HTM's area of applicability
 can be as crisply delineated as that shown for RCU in
 \cref{fig:defer:RCU Areas of Applicability} on
-page~\pageref{fig:defer:RCU Areas of Applicability}, that is no reason not to
+\cpageref{fig:defer:RCU Areas of Applicability}, that is no reason not to
 start moving in that direction.
 
 HTM seems best suited to update-heavy workloads involving relatively
diff --git a/future/tm.tex b/future/tm.tex
index 0755fafb..f9a4017a 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -994,7 +994,7 @@ internally~\cite{UCAM-CL-TR-579,KeirFraser2007withoutLocks,Gu:2019:PSE:3358807.3
 		needlessly throttle updates, as noted in their
 		Section~6.2.1.
 		See \cref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates}
-		on Page~\pageref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates}
+		\cpageref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates}
 		of this book to see that the venerable asynchronous
 		\co{call_rcu()} primitive enables RCU to perform and
 		scale quite well with large numbers of updaters.
diff --git a/glossary.tex b/glossary.tex
index 9c566369..60993be2 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -73,7 +73,7 @@
 	In contrast, the memory consistency model for a given machine
 	describes the order in which loads and stores to groups of
 	variables will appear to occur.
-	See Section~\ref{sec:memorder:Cache Coherence}
+	See \cref{sec:memorder:Cache Coherence}
 	for more information.
 \item[\IX{Cache-Coherence Protocol}:]
 	A communications protocol, normally implemented in hardware,
diff --git a/summary.tex b/summary.tex
index ef2f903e..63187998 100644
--- a/summary.tex
+++ b/summary.tex
@@ -92,7 +92,7 @@ and parallel real-time computing.
 critically important topic of memory ordering, presenting techniques
 and tools to help you not only solve memory-ordering problems, but
 also to avoid them completely.
-\cref{chp:Ease of Use} presented a brief overview of the surprisingly
+\Cref{chp:Ease of Use} presented a brief overview of the surprisingly
 important topic of ease of use.
 
 Last, but definitely not least, \cref{chp:Conflicting Visions of the Future}
-- 
2.17.1


