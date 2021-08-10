Return-Path: <SRS0=Si6l=NB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0o+juLBpixH2/8mFNb5lekq9SkIxBgZgdJBMt0EqHVQ=;
        b=aIYVZEbgw0bKSlM9TnmGRbf3DZd5X0I/PyTPMy+WeBRk1W0NvqEcPbAf5nyN2Etf0+
         12vQvUzaLMgaC64a/70VUHFy1+cSEbf6du9r906Pgm1UxZEcEWzufjwzDaEQPZW/UKIg
         DAIGcIidfOrCTQcgH5df0Gpqz6X3sSukXtaEJKYde1erFToK3PzwuyfeSar20gEfSXIv
         KjoRKnx8vOAfakaML5etVTIjHfVz7TTi/ifn/RdUxgjlY1EYwFW0PGSYqZXPzy9lNjOs
         W0hK+Tjen/p0XinMh4tgHFHVcK6v7DpBCPL+nkGehtSlIdoaBCmrsQxrbvOLQ59+5M3B
         NISQ==
Subject: [PATCH 5/7] advsync: Break and capitalize after colon
References: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c85fe1f5-36ba-aa31-5642-a5b4298d88d1@gmail.com>
Date: Tue, 10 Aug 2021 13:45:33 +0900
MIME-Version: 1.0
In-Reply-To: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/advsync.tex | 31 +++++++++++--------
 advsync/rt.tex      | 72 ++++++++++++++++++++++++++-------------------
 2 files changed, 61 insertions(+), 42 deletions(-)

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 48a71b74..f8750250 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -217,7 +217,8 @@ Although mutual exclusion is required to dequeue a single element
 (so that dequeue is blocking), it is possible to carry out a non-blocking
 removal of the entire contents of the queue.
 What is not possible is to dequeue any given element in a non-blocking
-manner: The enqueuer might have failed between \clnref{tail,pred} of the
+manner:
+The enqueuer might have failed between \clnref{tail,pred} of the
 listing, so that the element in question is only partially enqueued.
 This results in a half-NBS algorithm where enqueues are NBS but
 dequeues are blocking.
@@ -304,8 +305,9 @@ Here is one way that this scenario might play out:
 
 Note that both pushes and the popall all ran successfully despite the
 reuse of \Node{A}'s memory.
-This is an unusual property: Most data structures require protection
-against what is often called the ABA problem.
+This is an unusual property:
+Most data structures require protection against what is often called
+the ABA problem.
 
 But this property holds only for algorithm written in assembly
 language.
@@ -374,9 +376,12 @@ largely orthogonal to those that form the basis of real-time programming:
 	unconditional.
 \item	Real-time forward-progress guarantees are often conditioned on
 	environmental constraints, for example, only being honored:
-	(1)~For the highest-priority tasks,
-	(2)~When each CPU spends at least a certain fraction of its time idle,
-	and (3)~When I/O rates are below some specified maximum.
+	\begin{enumerate*}[(1)]
+	\item For the highest-priority tasks,
+	\item When each CPU spends at least a certain fraction of its time idle,
+	and
+	\item When I/O rates are below some specified maximum.
+	\end{enumerate*}
 	In contrast, NBS's forward-progress
 	guarantees are often unconditional, although recent NBS work
 	accommodates conditional
@@ -542,15 +547,17 @@ constraint that is often respected in practice.
 Other sets of constraints can permit blocking algorithms to
 achieve deterministic real-time response.
 For example, given:
-(1)~Fair locks granted in FIFO order within a given priority level,
-(2)~Priority inversion avoidance (for example, priority
+\begin{enumerate*}[(1)]
+\item Fair locks granted in FIFO order within a given priority level,
+\item Priority inversion avoidance (for example, priority
 inheritance~\cite{Takada:1995:RSN:527074.828566,Cai-DongWang1996PrioInherLock}
 or priority ceiling),
-(3)~A bounded number of threads,
-(4)~Bounded critical section durations,
-(5)~Bounded load,
+\item A bounded number of threads,
+\item Bounded critical section durations,
+\item Bounded load,
 and
-(6)~Absence of fail-stop bugs,
+\item Absence of fail-stop bugs,
+\end{enumerate*}
 lock-based applications can provide deterministic
 response times~\cite{BjoernBrandenburgPhD,DipankarSarma2004OLSscalability}.
 This approach of course blurs the distinction between blocking and wait-free
diff --git a/advsync/rt.tex b/advsync/rt.tex
index 3e62b6cb..24ba2a66 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -103,7 +103,8 @@ But your adversary can always get a bigger hammer.
 \begin{figure}
 \centering
 \resizebox{3in}{!}{\includegraphics{cartoons/realtime-lifesupport-nobomb}}
-\caption{Real-Time Response: Hardware Matters}
+\caption{Real-Time Response:
+			     Hardware Matters}
 \ContributedBy{Figure}{fig:advsync:Real-Time Response: Hardware Matters}{Melissa Broussard}
 \end{figure}
 
@@ -133,7 +134,8 @@ it can alert the hospital staff.
 \begin{figure*}
 \centering
 \resizebox{\textwidth}{!}{\rotatebox{90}{\includegraphics{cartoons/realtime-lazy-crop}}}
-\caption{Real-Time Response: Notification Insufficient}
+\caption{Real-Time Response:
+			     Notification Insufficient}
 \ContributedBy{Figure}{fig:advsync:Real-Time Response: Notification Insufficient}{Melissa Broussard}
 \end{figure*}
 
@@ -250,8 +252,9 @@ number of heating and cooling systems can counter the effects of temperature.
 In extreme cases, triple modular redundancy can reduce the probability that
 a fault in one part of the system will result in incorrect behavior from
 the overall system.
-However, all of these methods have one thing in common:  Although they
-can reduce the probability of failure, they cannot reduce it to zero.
+However, all of these methods have one thing in common:
+Although they can reduce the probability of failure, they cannot reduce
+it to zero.
 
 These environmental challenges are often met via robust hardware, however,
 the workload and application constraints in the next two sections are
@@ -374,21 +377,23 @@ have a much higher probability of missing tight deadlines.
 Similarly, a read from a tightly coupled solid-state disk (SSD) could be
 expected to complete much more quickly than that same read to an old-style
 USB-connected rotating-rust disk drive.\footnote{
-	Important safety tip:  Worst-case response times from USB devices
-	can be extremely long.
+	Important safety tip:
+	Worst-case response times from USB devices can be extremely long.
 	Real-time systems should therefore take care to place any USB
 	devices well away from critical paths.}
 
 Some real-time applications pass through different phases of operation.
 For example, a real-time system controlling a plywood lathe that peels
 a thin sheet of wood (called ``veneer'') from a spinning log must:
-(1)~Load the log into the lathe,
-(2)~Position the log on the lathe's chucks so as to expose the largest
+\begin{enumerate*}[(1)]
+\item Load the log into the lathe,
+\item Position the log on the lathe's chucks so as to expose the largest
 cylinder contained within that log to the blade,
-(3)~Start spinning the log,
-(4)~Continuously vary the knife's position so as to peel the log into veneer,
-(5)~Remove the remaining core of the log that is too small to peel, and
-(6)~Wait for the next log.
+\item Start spinning the log,
+\item Continuously vary the knife's position so as to peel the log into veneer,
+\item Remove the remaining core of the log that is too small to peel, and
+\item Wait for the next log.
+\end{enumerate*}
 Each of these six phases of operation might well have its own set of
 deadlines and environmental constraints,
 for example, one would expect phase~4's deadlines to be much more severe
@@ -1075,8 +1080,8 @@ might starve the interrupt handler, for example, preventing networking
 code from running, in turn making it very difficult to debug the problem.
 Developers must therefore take great care when writing high-priority
 real-time code.
-This has been dubbed the \emph{Spiderman principle}: With great power
-comes great responsibility.
+This has been dubbed the \emph{Spiderman principle}:
+With great power comes great responsibility.
 
 \paragraph{Priority inheritance} is used to handle priority inversion,
 which can be caused by, among other things, locks acquired by
@@ -1177,12 +1182,15 @@ priority-inversion conundrum:
 	However, this approach clearly and severely limits read-side
 	scalability.
 	The Linux kernel's \rt\ patchset was long able to live with this
-	limitation for several reasons: (1)~Real-time systems have
-	traditionally been relatively small, (2)~Real-time systems
-	have generally focused on process control, thus being unaffected
-	by scalability limitations in the I/O subsystems, and
-	(3)~Many of the Linux kernel's reader-writer locks have been
+	limitation for several reasons:
+	\begin{enumerate*}[(1)]
+	\item Real-time systems have traditionally been relatively small,
+	\item Real-time systems have generally focused on process control,
+	thus being unaffected by scalability limitations in the
+	I/O subsystems, and
+	\item Many of the Linux kernel's reader-writer locks have been
 	converted to RCU\@.
+	\end{enumerate*}
 
 	However, the day came when it was absolutely necessary to
 	permit concurrent readers, as described in the text following
@@ -1267,12 +1275,14 @@ A preemptible RCU implementation was therefore added to the Linux kernel.
 This implementation avoids the need to individually track the state of
 each and every task in the kernel by keeping lists of tasks that have
 been preempted within their current RCU read-side critical sections.
-A grace period is permitted to end: (1)~Once all CPUs have completed any
-RCU read-side critical sections that were in effect before the start
-of the current grace period and
-(2)~Once all tasks that were preempted
+A grace period is permitted to end:
+\begin{enumerate*}[(1)]
+\item Once all CPUs have completed any RCU read-side critical sections
+that were in effect before the start of the current grace period and
+\item Once all tasks that were preempted
 while in one of those pre-existing critical sections have removed
 themselves from their lists.
+\end{enumerate*}
 A simplified version of this implementation is shown in
 \cref{lst:advsync:Preemptible Linux-Kernel RCU}.
 \begin{fcvref}[ln:advsync:Preemptible Linux-Kernel RCU]
@@ -1351,9 +1361,9 @@ callback invocation.
 \paragraph{Preemptible spinlocks}
 are an important part of the \rt\ patchset due to the long-duration
 spinlock-based critical sections in the Linux kernel.
-This functionality has not yet reached mainline: Although they are a
-conceptually simple substitution of sleeplocks for spinlocks, they have
-proven relatively controversial.
+This functionality has not yet reached mainline:
+Although they are a conceptually simple substitution of sleeplocks
+for spinlocks, they have proven relatively controversial.
 In addition the real-time functionality that is already in the mainline
 Linux kernel suffices for a great many use cases, which slowed the \rt\
 patchset's development rate in the early
@@ -1755,9 +1765,10 @@ reads sensor data, computes a control law, and writes control output.
 If the hardware registers providing sensor data and taking control
 output are mapped into the application's address space, this loop
 might be completely free of system calls.
-But beware of the Spiderman principle: With great power comes great
-responsibility, in this case the responsibility to avoid bricking the
-hardware by making inappropriate references to the hardware registers.
+But beware of the Spiderman principle:
+With great power comes great responsibility, in this case the
+responsibility to avoid bricking the hardware by making inappropriate
+references to the hardware registers.
 
 This arrangement is often run on bare metal, without the benefits of
 (or the interference from) an operating system.
@@ -1985,7 +1996,8 @@ on \clnrefrange{upd:b}{upd:e}.
 This example shows how RCU can provide deterministic read-side
 data-structure access to real-time programs.
 
-\subsection{Real Time vs.~Real Fast: How to Choose?}
+\subsection{Real Time vs.~Real Fast:
+				     How to Choose?}
 \label{sec:advsync:Real Time vs. Real Fast: How to Choose?}
 
 The choice between real-time and real-fast computing can be a difficult one.
-- 
2.17.1


