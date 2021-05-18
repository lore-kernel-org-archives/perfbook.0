Return-Path: <SRS0=cX2R=KN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4jHkkgLH5jWpGlra11ezF1DRMQ62EIz/PgzvhQPYeGQ=;
        b=oEcHAeEGckhEg+XCe+vOQ8PS1GpN0ouyTzvMjruE3wV7pgNRS0FPYJiuRTkqj+EBrL
         KEEAMUmaDFO84Wu6gtEwI6h4Akx6x3kSFABYzuwO5t9g8K4ipgSXy+BFREQj20qYvsXh
         6Lj51IxwWLp59JLOnA7HmNyDT3PFpQu6AXNi910tdW7QPF44z8m7ybOnKxzoBlGFFKKK
         aQlDluWcDj4+I2Q5V4hS2XaF2T4EawtukfDG9htFWdYBk92tdrvwJ++++ftbh1QK+5dH
         UmfghRxE6MCISvsoz7ugQ2ESh2tTHOytzAkLfwHR0Zr69gjDDK/5hOKy7HfbaIM0XZnY
         vRiQ==
Subject: [PATCH -perfbook 7/8] together, advsync, memorder: Employ \cref{} and
 its variants
References: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a8ccfdac-0f73-0881-bc67-852aa10a3026@gmail.com>
Date: Tue, 18 May 2021 21:24:13 +0900
MIME-Version: 1.0
In-Reply-To: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/advsync.tex   |  2 +-
 advsync/rt.tex        |  4 ++--
 memorder/memorder.tex | 24 ++++++++++++------------
 together/applyrcu.tex |  4 ++--
 together/refcnt.tex   |  4 ++--
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index c6fd6490..48a71b74 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -247,7 +247,7 @@ saw his first computer, which had but one CPU\@.
 \Clnrefrange{struct:b}{struct:e} show the \co{node_t} structure,
 which contains an arbitrary value and a pointer to the next structure
 on the stack and
-\Clnref{top} shows the top-of-stack pointer.
+\clnref{top} shows the top-of-stack pointer.
 
 The \co{list_push()} function spans \clnrefrange{push:b}{push:e}.
 \Clnref{push:alloc} allocates a new node and
diff --git a/advsync/rt.tex b/advsync/rt.tex
index e939a029..62fcf123 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -835,7 +835,7 @@ As usual, the answer seems to be ``It depends,'' as discussed in the
 following sections.
 \Cref{sec:advsync:Event-Driven Real-Time Support}
 considers event-driven real-time systems, and
-\Cref{sec:advsync:Polling-Loop Real-Time Support}
+\cref{sec:advsync:Polling-Loop Real-Time Support}
 considers real-time systems that use a CPU-bound polling loop.
 
 \subsubsection{Event-Driven Real-Time Support}
@@ -1297,7 +1297,7 @@ has become zero, in other words, if this corresponds to the outermost
 If so, \clnref{bar2} prevents the compiler from reordering this nesting
 update with \clnref{chks}'s check for special handling.
 If special handling is required, then the call to
-\co{rcu_read_unlock_special()} on \lnref{unls} carries it out.
+\co{rcu_read_unlock_special()} on \clnref{unls} carries it out.
 
 There are several types of special handling that can be required, but
 we will focus on that required when the RCU read-side critical section
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 8c9be547..e9ad119d 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -774,7 +774,7 @@ Adding ordering usually slows things down.
 Of course, there are situations where adding instructions speeds things
 up, as was shown by
 \cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR} on
-page~\pageref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR},
+\cpageref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR},
 but careful benchmarking is required in such cases.
 And even then, it is quite possible that although you sped things up
 a little bit on \emph{your} system, you might well have slowed things
@@ -1537,7 +1537,7 @@ interchangeably.
 \end{listing}
 
 \begin{fcvref}[ln:formal:C-CCIRIW+o+o+o-o+o-o:whole]
-\cref{lst:memorder:Cache-Coherent IRIW Litmus Test}
+\Cref{lst:memorder:Cache-Coherent IRIW Litmus Test}
 (\path{C-CCIRIW+o+o+o-o+o-o.litmus})
 shows a litmus test that tests for cache coherence,
 where ``IRIW'' stands
@@ -1889,7 +1889,7 @@ Dependencies do not provide cumulativity,
 which is why the ``C'' column is blank for the \co{READ_ONCE()} row
 of \cref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}
 on
-page~\pageref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}.
+\cpageref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}.
 However, as indicated by the ``C'' in their ``C'' column,
 release operations do provide cumulativity.
 Therefore,
@@ -2090,7 +2090,7 @@ same variable is not necessarily the store that started last.
 This should not come as a surprise to anyone who carefully examined
 \cref{fig:memorder:A Variable With More Simultaneous Values}
 on
-page~\pageref{fig:memorder:A Variable With More Simultaneous Values}.
+\cpageref{fig:memorder:A Variable With More Simultaneous Values}.
 
 \begin{listing}
 \input{CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o@whole.fcv}
@@ -2168,7 +2168,7 @@ Of course, just the passage of time by itself is not enough, as
 was seen in
 \cref{lst:memorder:Load-Buffering Litmus Test (No Ordering)}
 on
-page~\pageref{lst:memorder:Load-Buffering Litmus Test (No Ordering)},
+\cpageref{lst:memorder:Load-Buffering Litmus Test (No Ordering)},
 which has nothing but store-to-load links and, because it provides
 absolutely no ordering, still can trigger its \co{exists} clause.
 However, as long as each thread provides even the weakest possible
@@ -2208,7 +2208,7 @@ next section.
 A minimal release-acquire chain was shown in
 \cref{lst:memorder:Enforcing Ordering of Load-Buffering Litmus Test}
 on
-page~\pageref{lst:memorder:Enforcing Ordering of Load-Buffering Litmus Test},
+\cpageref{lst:memorder:Enforcing Ordering of Load-Buffering Litmus Test},
 but these chains can be much longer, as shown in
 \cref{lst:memorder:Long LB Release-Acquire Chain}
 (\path{C-LB+a-r+a-r+a-r+a-r.litmus}).
@@ -2227,7 +2227,7 @@ it turns out that they can tolerate one load-to-store step, despite
 such steps being counter-temporal, as shown in
 \cref{fig:memorder:Load-to-Store is Counter-Temporal}
 on
-page~\pageref{fig:memorder:Load-to-Store is Counter-Temporal}.
+\cpageref{fig:memorder:Load-to-Store is Counter-Temporal}.
 For example,
 \cref{lst:memorder:Long ISA2 Release-Acquire Chain}
 (\path{C-ISA2+o-r+a-r+a-r+a-o.litmus})
@@ -2450,7 +2450,7 @@ In short, use of \co{READ_ONCE()}, \co{WRITE_ONCE()}, \co{barrier()},
 \co{volatile}, and other primitives called out in
 \cref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}
 on
-page~\pageref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}
+\cpageref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}
 are valuable tools in preventing the compiler from
 optimizing your parallel algorithm out of existence.
 Compilers are starting to provide other mechanisms for avoiding
@@ -2571,7 +2571,7 @@ if (p == &reserve_int) {
 	For example, if \co{a} and \co{b} are equal, \co{cp+a-b}
 	is an identity function, including preserving the dependency.
 \item	Comparisons can break dependencies.
-	\cref{lst:memorder:Breakable Dependencies With Comparisons}
+	\Cref{lst:memorder:Breakable Dependencies With Comparisons}
 	shows how this can happen.
 	Here global pointer \co{gp} points to a dynamically allocated
 	integer, but if memory is low, it might instead point to
@@ -3299,7 +3299,7 @@ RCU callback invocation in the lower left.\footnote{
 	For more detail, please see
 	\crefrange{fig:defer:RCU Reader and Later Grace Period}{fig:defer:RCU Reader Within Grace Period}
 	starting on
-	page~\pageref{fig:defer:RCU Reader and Later Grace Period}.}
+	\cpageref{fig:defer:RCU Reader and Later Grace Period}.}
 
 \begin{figure}
 \centering
@@ -4469,7 +4469,7 @@ void synchronize_rcu(void)
 		(Recall that \clnref{if,store} have been reordered by the
 		compiler to follow \clnref{acqmutex}).
 	\item	CPU~0 invokes \co{update_counter_and_wait()} from
-		\lnref{call1}.
+		\clnref{call1}.
 	\item	CPU~0 invokes \co{rcu_gp_ongoing()} on itself at
 		\clnref{call2}, and \clnref{load} sees that CPU~0 is
 		in a quiescent state.
@@ -4479,7 +4479,7 @@ void synchronize_rcu(void)
 		already holds the lock, CPU~1 blocks waiting for this
 		lock to become available.
 		Because the compiler reordered \clnref{if,store} to follow
-		\lnref{acqmutex}, CPU~1 does not clear its own counter,
+		\clnref{acqmutex}, CPU~1 does not clear its own counter,
 		despite having been online.
 	\item	CPU~0 invokes \co{rcu_gp_ongoing()} on CPU~1 at
 		\clnref{call2}, and \clnref{load} sees that CPU~1 is
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 8173ae12..4f4de79f 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -28,7 +28,7 @@ were required to acquire a global
 lock, and thus incurred high overhead and suffered poor scalability.
 The code for the lock-based implementation is shown in
 \cref{lst:count:Per-Thread Statistical Counters} on
-Page~\pageref{lst:count:Per-Thread Statistical Counters}.
+\cpageref{lst:count:Per-Thread Statistical Counters}.
 
 \QuickQuiz{
 	Why on earth did we need that global lock in the first place?
@@ -198,7 +198,7 @@ references.
 
 \QuickQuiz{
 	Wow!
-	\cref{lst:together:RCU and Per-Thread Statistical Counters}
+	\Cref{lst:together:RCU and Per-Thread Statistical Counters}
 	contains 70 lines of code, compared to only 42 in
 	\cref{lst:count:Per-Thread Statistical Counters}.
 	Is this extra complexity really worth it?
diff --git a/together/refcnt.tex b/together/refcnt.tex
index ae8644e4..19ca6bb4 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -158,7 +158,7 @@ atomic counting with check and release memory barrier (``CAM'') is described in
 \cref{sec:together:Atomic Counting With Check and Release Memory Barrier}.
 Use of hazard pointers is described in
 \cref{sec:defer:Hazard Pointers}
-on page~\ref{sec:defer:Hazard Pointers}
+on \cpageref{sec:defer:Hazard Pointers}
 and in
 \cref{sec:together:Hazard-Pointer Helpers}.
 
@@ -175,7 +175,7 @@ of compiler optimizations.
 This is the method of choice when the lock is required to protect
 other operations in addition to the reference count, but where
 a reference to the object must be held after the lock is released.
-\cref{lst:together:Simple Reference-Count API} shows a simple
+\Cref{lst:together:Simple Reference-Count API} shows a simple
 API that might be used to implement simple non-atomic reference
 counting---although simple reference counting is almost always
 open-coded instead.
-- 
2.17.1


