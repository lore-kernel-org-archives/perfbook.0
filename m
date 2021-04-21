Return-Path: <SRS0=nUow=JS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TNbAAXpf1i/sziKWBSftYi+PR+s1kOO0h+LxFsZFAzc=;
        b=bMyrNlrTXFjfDTUi3xC4zn7PCU89rnJvf97YRvbKdEpvNlKug7xofQtiS4tTpoo+cN
         m8eBI4Y8aQiNytfS8seG6CtK6Z4v0Mo4kSA3xT/t4Cya8DtfN4LefJCXFsEUAqhWav9F
         pX4v2gW/o1Fu59Q2nwjr70QMVwG+V8ZfVJGqS4RQcr4eOoDB8DsoZJ0Gvx3oXMhYqOzl
         7346ZKKm5NIbC0anh3BoZ3PSkuU1IPzNFEkI6fXM/bbUBRq0tpw5qHku0GMwUk4MUb0S
         gPQGArjI3WqbLSS5uLwLioPCJz0g+6DsOqHrBNGrg8vGSwmMYjI14rm9kwsv0b+Jk/c/
         JMKQ==
Subject: [PATCH -perfbook 4/4] index: Add index and acronym tags, take one
References: <5a17ce08-9c5d-5e87-6cae-793c6a49c147@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <820438ca-5ce7-70d0-d75b-a43fd9daef27@gmail.com>
Date: Thu, 22 Apr 2021 00:30:25 +0900
MIME-Version: 1.0
In-Reply-To: <5a17ce08-9c5d-5e87-6cae-793c6a49c147@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

List of indexed terms and acronyms:

o Amdahl's Law
o Associativity miss / Cache miss, associativity
o Atomic
o Atomic read-modify-write operation
o Bounded wait free / Wait free, bounded
o Cache associativity
o Cache coherence
o Cache-coherence protocol
o Cache geometry
o Cache line
o Capacity miss / Cache miss, capacity
o Clash free
o Code locking / Locking, code
o Communication miss / Cache miss, communication
o Concurrent
o Critical section
o Data locking / Locking, data
o Data race
o Deadlock
o Deadlock cycle
o Deadlock free
o Direct-mapped cache / Cache, direct-mapped
o Embarrassingly parallel
o Exclusive lock / Lock, exclusive
o Forward-progress guarantee
o Fully associative cache / Cache, fully associative
o Generality
o Humiliatingly parallel
o Inter-processor interrupt (IPI)
o Interrupt request (IRQ)
o Livelock
o Lock contention
o Lock free
o Locking
o MESI protocol
o Non-blocking synchronization (NBS)
o Non-maskable interrupt (NMI)
o Obstruction free
o Parallel
o Performance
o Pipelined CPU
o Plain access
o Productivity
o Quiescent state
o Read-side critical section / Critical section, read-side
o Reader-writer lock / Lock, reader-writer
o Reliability
o Starvation
o Starvation free
o Superscalar CPU
o Transactional lock elision (TLE)
o Unfairness
o Vector CPU
o Wait free
o Write miss / Cache miss, write

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex                   | 19 ++++++-----
 SMPdesign/beyond.tex                      |  4 +--
 SMPdesign/criteria.tex                    | 10 +++---
 SMPdesign/partexercises.tex               | 10 +++---
 advsync/advsync.tex                       | 32 +++++++++---------
 advsync/rt.tex                            |  8 ++---
 appendix/questions/after.tex              |  4 +--
 appendix/questions/concurrentparallel.tex |  2 +-
 appendix/questions/removelocking.tex      |  2 +-
 appendix/toyrcu/toyrcu.tex                |  8 ++---
 appendix/whymb/whymemorybarriers.tex      | 29 +++++++++-------
 count/count.tex                           | 12 +++----
 cpu/hwfreelunch.tex                       |  2 +-
 cpu/overheads.tex                         |  2 +-
 cpu/overview.tex                          |  6 ++--
 cpu/swdesign.tex                          |  2 +-
 datastruct/datastruct.tex                 |  4 +--
 debugging/debugging.tex                   |  2 +-
 defer/rcu.tex                             |  2 +-
 defer/rcufundamental.tex                  |  2 +-
 defer/rcuintro.tex                        |  4 +--
 defer/rcurelated.tex                      |  5 +--
 defer/rcuusage.tex                        |  6 ++--
 defer/seqlock.tex                         |  4 +--
 defer/whichtochoose.tex                   |  3 +-
 easy/easy.tex                             |  2 +-
 formal/dyntickrcu.tex                     |  6 ++--
 formal/spinhint.tex                       |  2 +-
 future/cpu.tex                            |  2 +-
 future/htm.tex                            | 17 +++++-----
 future/tm.tex                             | 12 +++----
 glossary.tex                              |  8 ++---
 intro/intro.tex                           | 23 ++++++-------
 locking/locking.tex                       | 40 +++++++++++------------
 memorder/memorder.tex                     | 27 +++++++--------
 perfbook-lt.tex                           |  1 +
 summary.tex                               |  4 +--
 together/seqlock.tex                      |  4 +--
 toolsoftrade/toolsoftrade.tex             | 24 +++++++-------
 39 files changed, 185 insertions(+), 171 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index d4c10a79..5cc566a9 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -166,7 +166,7 @@ int hash_search(struct hash_table *h, long key)
 \subsection{Code Locking}
 \label{sec:SMPdesign:Code Locking}
 
-Code locking is quite simple due to the fact that is uses only
+\IXh{Code}{locking} is quite simple due to the fact that is uses only
 global locks.\footnote{
 	If your program instead has locks in data structures,
 	or, in the case of Java, uses classes with synchronized
@@ -179,7 +179,7 @@ only a single shared resource, code locking will even give
 optimal performance.
 However, many of the larger and more complex programs
 require much of the execution to
-occur in critical sections, which in turn causes code locking
+occur in \IXpl{critical section}, which in turn causes code locking
 to sharply limits their scalability.
 
 Therefore, you should use code locking on programs that spend
@@ -233,7 +233,7 @@ int hash_search(struct hash_table *h, long key)
 \label{lst:SMPdesign:Code-Locking Hash Table Search}
 \end{listing}
 
-Unfortunately, code locking is particularly prone to ``lock contention'',
+Unfortunately, code locking is particularly prone to ``\IX{lock contention}'',
 where multiple CPUs need to acquire the lock concurrently.
 SMP programmers who have taken care of groups of small children
 (or groups of older people who are acting like children) will immediately
@@ -271,7 +271,7 @@ in the next section.
 
 Many data structures may be partitioned,
 with each partition of the data structure having its own lock.
-Then the critical sections for each part of the data structure
+Then the \IXpl{critical section} for each part of the data structure
 can execute in parallel,
 although only one instance of the critical section for a given
 part could be executing at a given time.
@@ -520,8 +520,8 @@ However, in situations where no sharing is required, data ownership
 achieves ideal performance, and with code that can be as simple
 as the sequential-program case shown in
 Listing~\ref{lst:SMPdesign:Sequential-Program Hash Table Search}.
-Such situations are often referred to as ``embarrassingly
-parallel'', and, in the best case, resemble the situation
+Such situations are often referred to as ``\IX{embarrassingly
+parallel}'', and, in the best case, resemble the situation
 previously shown in Figure~\ref{fig:SMPdesign:Data Locking}.
 
 % ./test_hash_null.exe 1000 0/100 1 1024 1
@@ -815,7 +815,7 @@ as depicted in Figure~\ref{fig:SMPdesign:Parallel-Fastpath Design Patterns}:
 \label{sec:SMPdesign:Reader/Writer Locking}
 
 If synchronization overhead is negligible (for example, if the program
-uses coarse-grained parallelism with large critical sections), and if
+uses coarse-grained parallelism with large \IXpl{critical section}), and if
 only a small fraction of the critical sections modify data, then allowing
 multiple readers to proceed in parallel can greatly increase scalability.
 Writers exclude both readers and each other.
@@ -971,7 +971,8 @@ for locking and its complexities and overheads.
 Unfortunately, this scheme fails when CPU~0 only allocates memory and
 CPU~1 only frees it, as happens in simple producer-consumer workloads.
 
-The other extreme, code locking, suffers from excessive lock contention
+The other extreme, \IXh{code}{locking}, suffers from excessive
+\IX{lock contention}
 and overhead~\cite{McKenney93}.
 
 \subsubsection{Parallel Fastpath for Resource Allocation}
@@ -1290,7 +1291,7 @@ so as to balance external and internal fragmentation, such as in
 the late-1980s BSD memory allocator~\cite{McKusick88}.
 Doing this would mean that the ``globalmem'' variable would need
 to be replicated on a per-size basis, and that the associated
-lock would similarly be replicated, resulting in data locking
+lock would similarly be replicated, resulting in \IXh{data}{locking}
 rather than the toy program's code locking.
 
 Second, production-quality systems must be able to repurpose memory,
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 03f4c394..e308f1d5 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -20,7 +20,7 @@ linear speedups, in other words, to ensure that the total amount of
 work required does not increase significantly as the number of CPUs
 or threads increases.
 A problem that can be solved via partitioning and/or replication,
-resulting in linear speedups, is \emph{embarrassingly parallel}.
+resulting in linear speedups, is \emph{\IX{embarrassingly parallel}}.
 But can we do better?
 
 To answer this question, let us examine the solution of
@@ -408,7 +408,7 @@ two times faster than SEQ\@.
 A forty-times speedup on two threads demands explanation.
 After all, this is not merely embarrassingly parallel, where partitionability
 means that adding threads does not increase the overall computational cost.
-It is instead \emph{humiliatingly parallel}: Adding threads
+It is instead \emph{\IX{humiliatingly parallel}}: Adding threads
 significantly reduces the overall computational cost, resulting in
 large algorithmic superlinear speedups.
 
diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
index cdbe678d..0e581f15 100644
--- a/SMPdesign/criteria.tex
+++ b/SMPdesign/criteria.tex
@@ -16,7 +16,7 @@ that convergence is not guaranteed in the lifetime of the universe.
 Besides, what exactly is the ``best possible parallel program''?
 After all, Section~\ref{sec:intro:Parallel Programming Goals}
 called out no fewer than three parallel-programming goals of
-performance, productivity, and generality,
+\IX{performance}, \IX{productivity}, and \IX{generality},
 and the best possible performance will likely come at a cost in
 terms of productivity and generality.
 We clearly need to be able to make higher-level choices at design
@@ -49,7 +49,7 @@ contention, overhead, read-to-write ratio, and complexity:
 	program than can be kept busy by that program,
 	the excess CPUs are prevented from doing
 	useful work by contention.
-	This may be lock contention, memory contention, or a host
+	This may be \IX{lock contention}, memory contention, or a host
 	of other performance killers.
 \item[Work-to-Synchronization Ratio:]  A uniprocessor,
 	single\-/threaded, non-preemptible, and non\-/interruptible\footnote{
@@ -64,7 +64,7 @@ contention, overhead, read-to-write ratio, and complexity:
 	work that the program is intended to accomplish.
 	Note that the important measure is the
 	relationship between the synchronization overhead
-	and the overhead of the code in the critical section, with larger
+	and the overhead of the code in the \IX{critical section}, with larger
 	critical sections able to tolerate greater synchronization overhead.
 	The work-to-synchronization ratio is related to
 	the notion of synchronization efficiency.
@@ -156,11 +156,11 @@ parallel program.
 	using data ownership (see \cref{chp:Data Ownership}),
 	using asymmetric primitives
 	(see Section~\ref{chp:Deferred Processing}),
-	or by using a coarse-grained design such as code locking.
+	or by using a coarse-grained design such as \IXh{code}{locking}.
 \item	If the critical sections have high overhead compared
 	to the primitives guarding them, the best way
 	to improve speedup is to increase parallelism
-	by moving to reader/writer locking, data locking, asymmetric,
+	by moving to reader/writer locking, \IXh{data}{locking}, asymmetric,
 	or data ownership.
 \item	If the critical sections have high overhead compared
 	to the primitives guarding them and the data structure
diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index bf3b992d..8a56663e 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -49,7 +49,7 @@ immediate right and left, but will not put a given fork down until sated.
 \end{figure*}
 
 The object is to construct an algorithm that, quite literally,
-prevents starvation.
+prevents \IX{starvation}.
 One starvation scenario would be if all of the philosophers picked up
 their leftmost forks simultaneously.
 Because none of them will put down their fork until after they finished
@@ -237,7 +237,7 @@ its own lock.
 This means that elements must occasionally be shuttled from one of
 the double-ended queues to the other, in which case both locks must
 be held.
-A simple lock hierarchy may be used to avoid deadlock, for example,
+A simple lock hierarchy may be used to avoid \IX{deadlock}, for example,
 always acquiring the left-hand lock before acquiring the right-hand lock.
 This will be much simpler than applying two locks to the same
 double-ended queue, as we can unconditionally left-enqueue elements
@@ -333,7 +333,7 @@ a left-dequeue operation would return element ``L$_{-2}$'' and leave
 the left-hand index referencing hash chain~2, which would then
 contain only a single element (``R$_2$'').
 In this state, a left-enqueue running concurrently with a right-enqueue
-would result in lock contention, but the probability of such contention
+would result in \IX{lock contention}, but the probability of such contention
 can be reduced to arbitrarily low levels by using a larger hash table.
 
 \begin{figure}
@@ -623,8 +623,8 @@ assist~\cite{DavidDice:2010:SCA:HTM:deque}.
 Nevertheless, the best we can hope for from such a scheme
 is 2x scalability, as at most two threads can be holding the
 dequeue's locks concurrently.
-This limitation also applies to algorithms based on non-blocking
-synchronization, such as the compare-and-swap-based dequeue algorithm of
+This limitation also applies to algorithms based on \IXacrl{nbs},
+such as the compare-and-swap-based dequeue algorithm of
 Michael~\cite{DBLP:conf/europar/Michael03}.\footnote{
 	This paper is interesting in that it showed that special
 	double-compare-and-swap (DCAS) instructions are not needed
diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 47f530a8..c6fd6490 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -30,7 +30,7 @@ Memory ordering is also quite important, but it warrants its own
 \cref{chp:Advanced Synchronization: Memory Ordering}.
 
 The second form of advanced synchronization provides the stronger
-forward-progress guarantees needed for parallel real-time computing,
+\IXpl{forward-progress guarantee} needed for parallel real-time computing,
 which is the topic of
 \cref{sec:advsync:Parallel Real-Time Computing}.
 
@@ -80,32 +80,34 @@ them, please re-read
 	  it's supposed to do.}
 	 {\emph{Robert A. Heinlein}}
 
-The term \emph{non-blocking synchronization} (NBS)~\cite{MauriceHerlihy90a}
+The term \IXacrfst{nbs}~\cite{MauriceHerlihy90a}
 describes seven classes of linearizable algorithms with differing
-\emph{forward-progress guarantees}~\cite{DanAlitarh2013PracticalProgress},
+\emph{\IXpl{forward-progress guarantee}}~\cite{DanAlitarh2013PracticalProgress},
 which are as follows:
 
 \begin{enumerate}
-\item	\emph{Bounded wait-free synchronization}: Every thread
-	will make progress within
+\item	\emph{\IXalth{Bounded wait-free}{bounded}{wait free} synchronization}:
+	Every thread will make progress within
 	a specific finite period of time~\cite{Herlihy91}.
 	This level is widely considered to be unachievable, which might be why
 	Alitarh et al.\ omitted it~\cite{DanAlitarh2013PracticalProgress}.
-\item	\emph{Wait-free synchronization}: Every thread will make progress
+\item	\emph{\IXalt{Wait-free}{wait free} synchronization}:
+	Every thread will make progress
 	in finite time~\cite{Herlihy93}.
-\item	\emph{Lock-free synchronization}: At least one thread will
+\item	\emph{\IXalt{Lock-free}{lock free} synchronization}:
+	At least one thread will
 	make progress in finite time~\cite{Herlihy93}.
-\item	\emph{Obstruction-free synchronization}: Every thread will
-	make progress in finite time in the absence of
+\item	\emph{\IXalt{Obstruction-free}{obstruction free} synchronization}:
+	Every thread will make progress in finite time in the absence of
 	contention~\cite{HerlihyLM03}.
-\item	\emph{Clash-free synchronization}: At least one thread will
-	make progress in finite time in the absence of
+\item	\emph{\IXalt{Clash-free}{clash free} synchronization}:
+	At least one thread will make progress in finite time in the absence of
 	contention~\cite{DanAlitarh2013PracticalProgress}.
-\item	\emph{Starvation-free synchronization}: Every thread will
-	make progress in finite time in the absence of
+\item	\emph{\IXalt{Starvation-free}{starvation free} synchronization}:
+	Every thread will make progress in finite time in the absence of
 	failures~\cite{DanAlitarh2013PracticalProgress}.
-\item	\emph{Deadlock-free synchronization}: At least one thread will
-	make progress in finite time in the absence of
+\item	\emph{\IXalt{Deadlock-free}{deadlock free} synchronization}:
+	At least one thread will make progress in finite time in the absence of
 	failures~\cite{DanAlitarh2013PracticalProgress}.
 \end{enumerate}
 
diff --git a/advsync/rt.tex b/advsync/rt.tex
index c041e33e..bb8465ff 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1053,7 +1053,7 @@ indefinitely, thus indefinitely degrading real-time latencies.
 
 One way of addressing this problem is the use of threaded interrupts shown in
 \cref{fig:advsync:Threaded Interrupt Handler}.
-Interrupt handlers run in the context of a preemptible \IRQ\ thread,
+Interrupt handlers run in the context of a preemptible \IXacr{irq} thread,
 which runs at a configurable priority.
 The device interrupt handler then runs for only a short time, just
 long enough to make the \IRQ\ thread aware of the new event.
@@ -1193,7 +1193,7 @@ the \rt\ developers looked more carefully at how the Linux kernel uses
 reader-writer spinlocks.
 They learned that time-critical code rarely uses those parts of the
 kernel that write-acquire reader-writer locks, so that the prospect
-of writer starvation was not a show-stopper.
+of writer \IX{starvation} was not a show-stopper.
 They therefore constructed a real-time reader-writer lock in which
 write-side acquisitions use priority inheritance among each other,
 but where read-side acquisitions take absolute priority over
@@ -1378,7 +1378,7 @@ In this approach, code updating groups of per-CPU variables must
 acquire the current CPU's spinlock, carry out the update, then
 release whichever lock is acquired, keeping in mind that a preemption
 might have resulted in a migration to some other CPU\@.
-However, this approach introduces both overhead and deadlocks.
+However, this approach introduces both overhead and \IXpl{deadlock}.
 
 Another alternative, which is used in the \rt\ patchset as of early 2021,
 is to convert preemption disabling to migration disabling.
@@ -1636,7 +1636,7 @@ briefly covers event-based applications.
 \label{sec:advsync:Real-Time Components}
 
 As in all areas of engineering, a robust set of components is essential
-to productivity and reliability.
+to \IX{productivity} and \IX{reliability}.
 This section is not a full catalog of real-time software components---such
 a catalog would fill multiple books---but rather a brief overview of the
 types of components available.
diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index 33d93b59..b641417d 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -185,10 +185,10 @@ seq    & \multicolumn{1}{c}{time (seconds)} & delta~  &  a &  b &  c \\
 	\end{enumerate}
 }\QuickQuizEnd
 
-In summary, if you acquire an exclusive lock, you {\em know} that
+In summary, if you acquire an \IXh{exclusive}{lock}, you {\em know} that
 anything you do while holding that lock will appear to happen after
 anything done by any prior holder of that lock, at least give or
-take transactional lock elision
+take \IXacrl{tle}
 (see Section~\ref{sec:future:Semantic Differences}).
 No need to worry about which CPU did or did not execute a memory
 barrier, no need to worry about the CPU or compiler reordering
diff --git a/appendix/questions/concurrentparallel.tex b/appendix/questions/concurrentparallel.tex
index 6652c3cf..b8bf8116 100644
--- a/appendix/questions/concurrentparallel.tex
+++ b/appendix/questions/concurrentparallel.tex
@@ -5,7 +5,7 @@
 \section{What is the Difference Between ``Concurrent'' and ``Parallel''?}
 \label{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
 
-From a classic computing perspective, ``concurrent'' and ``parallel''
+From a classic computing perspective, ``\IX{concurrent}'' and ``\IX{parallel}''
 are clearly synonyms.
 However, this has not stopped many people from drawing distinctions
 between the two, and it turns out that these distinctions can be
diff --git a/appendix/questions/removelocking.tex b/appendix/questions/removelocking.tex
index f87bdf41..dae8355a 100644
--- a/appendix/questions/removelocking.tex
+++ b/appendix/questions/removelocking.tex
@@ -31,7 +31,7 @@ on
 \cpageref{tab:future:Comparison of Locking (Plain and Augmented) and HTM}.
 }
 \Cref{sec:advsync:Non-Blocking Synchronization}
-looks more deeply at non-blocking synchronization, which is a popular
+looks more deeply at \IXacrl{nbs}, which is a popular
 lockless methodology.
 
 As a more general rule, a sound-bite approach to parallel programming
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 070fcfc4..8fd2aef0 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -65,7 +65,7 @@ with read-side overhead ranging from about 100~nanoseconds on a single \Power{5}
 CPU up to more than 17~\emph{microseconds} on a 64-CPU system.
 Worse yet,
 these same lock operations permit \co{rcu_read_lock()}
-to participate in deadlock cycles.
+to participate in \IXpl{deadlock cycle}.
 Furthermore, in absence of recursive locks,
 RCU read-side critical sections cannot be nested, and, finally,
 although concurrent RCU updates could in principle be satisfied by
@@ -297,7 +297,7 @@ In happy contrast to the per-thread lock-based implementation shown in
 \cref{sec:app:toyrcu:Per-Thread Lock-Based RCU},
 it also allows them to be nested.
 In addition, the \co{rcu_read_lock()} primitive cannot possibly
-participate in deadlock cycles, as it never spins nor blocks.
+participate in \IXpl{deadlock cycle}, as it never spins nor blocks.
 
 \QuickQuiz{
 	But what if you hold a lock across a call to
@@ -352,7 +352,7 @@ Finally, a large number of RCU readers with long read-side
 critical sections could prevent \co{synchronize_rcu()}
 from ever completing, as the global counter might
 never reach zero.
-This could result in starvation of RCU updates, which
+This could result in \IX{starvation} of RCU updates, which
 is of course unacceptable in production settings.
 
 \QuickQuiz{
@@ -1364,7 +1364,7 @@ overhead.
 \Cref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
 (\path{rcu_qs.h})
 shows the read-side primitives used to construct a user-level
-implementation of RCU based on quiescent states, with the data shown in
+implementation of RCU based on \IXpl{quiescent state}, with the data shown in
 \cref{lst:app:toyrcu:Data for Quiescent-State-Based RCU}.
 As can be seen from \clnrefrange{lock:b}{unlock:e} in the listing,
 the \co{rcu_read_lock()}
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 3116832c..7ec718bb 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -59,7 +59,7 @@ and can typically be accessed in a few cycles.\footnote{
 \end{figure}
 
 Data flows among the CPUs' caches and memory in fixed-length blocks
-called ``cache lines'', which are normally a power of two in size,
+called ``\IXpl{cache line}'', which are normally a power of two in size,
 ranging from 16 to 256 bytes.
 When a given data item is first accessed by a given CPU, it will
 be absent from that CPU's cache, meaning that a ``cache miss''
@@ -75,7 +75,8 @@ at full speed.
 After some time, the CPU's cache will fill, and subsequent
 misses will likely need to eject an item from the cache in order
 to make room for the newly fetched item.
-Such a cache miss is termed a ``capacity miss'', because it is caused
+Such a cache miss is termed a ``\IXalth{capacity miss}
+{capacity}{cache miss}'', because it is caused
 by the cache's limited capacity.
 However, most caches can be forced to eject an old item to make room
 for a new item even when they are not yet full.
@@ -93,8 +94,10 @@ In hardware parlance, this is a two-way set-associative cache, and
 is analogous to a software hash table with
 sixteen buckets, where each bucket's hash chain is limited to
 at most two elements.
-The size (32 cache lines in this case) and the associativity (two in
-this case) are collectively called the cache's ``geometry''.
+The size (32 cache lines in this case) and the
+\IXalt{associativity}{cache associativity} (two in
+this case) are collectively called the cache's
+``\IXalt{geometry}{cache geometry}''.
 Since this cache is implemented in hardware, the hash function is
 extremely simple: extract four bits from the memory address.
 
@@ -192,7 +195,8 @@ However, if the program were to access location 0x1233E00, which hashes
 to line 0xE, one of the existing lines must be ejected from the cache
 to make room for the new cache line.
 If this ejected line were accessed later, a cache miss would result.
-Such a cache miss is termed an ``associativity miss''.
+Such a cache miss is termed an ``\IXalth{associativity miss}
+{associativity}{cache miss}''.
 
 Thus far, we have been considering only cases where a CPU reads
 a data item.
@@ -203,14 +207,15 @@ cause it to be removed, or ``invalidated'', from other CPUs' caches.
 Once this invalidation has completed, the CPU may safely modify the
 data item.
 If the data item was present in this CPU's cache, but was read-only,
-this process is termed a ``write miss''.
+this process is termed a ``\IXalth{write miss}{write}{cache miss}''.
 Once a given CPU has completed invalidating a given data item from other
 CPUs' caches, that CPU may repeatedly write (and read) that data item.
 
 Later, if one of the other CPUs attempts to access the data item, it
 will incur a cache miss, this time because the first CPU invalidated
 the item in order to write to it.
-This type of cache miss is termed a ``communication miss'', since it
+This type of cache miss is termed a ``\IXalth{communication miss}
+{communication}{cache miss}'', since it
 is usually due to several CPUs using the data items to communicate
 (for example, a lock is a data item that is used to communicate among
 CPUs using a mutual-exclusion algorithm).
@@ -227,7 +232,7 @@ described in the next section.
 \section{Cache-Coherence Protocols}
 \label{sec:app:whymb:Cache-Coherence Protocols}
 
-Cache-coherency protocols manage cache-line states so as to prevent
+\IXpl{Cache-coherence protocol} manage cache-line states so as to prevent
 inconsistent or lost data.
 These protocols can be quite complex, with many tens
 of states,\footnote{
@@ -236,7 +241,7 @@ of states,\footnote{
 	and Sequent (now IBM) NUMA-Q, respectively.
 	Both diagrams are significantly simpler than real life.}
 but for our purposes we need only concern ourselves with the
-four-state MESI cache-coherence protocol.
+four-state \IXaltr{MESI cache-coherence protocol}{MESI protocol}.
 
 \subsection{MESI States}
 \label{sec:app:whymb:MESI States}
@@ -455,7 +460,7 @@ The transition arcs in this figure are as follows:
 	both sending the data to the requesting CPU and indicating
 	that it no longer has a local copy.
 \item	[Transition (d):]
-	The CPU does an atomic read-modify-write operation on a data item
+	The CPU does an \IX{atomic read-modify-write operation} on a data item
 	that was not present in its cache.
 	It transmits a ``read invalidate'', receiving the data via
 	a ``read response''.
@@ -539,7 +544,7 @@ The transition arcs in this figure are as follows:
 
 Let's now look at this from the perspective of a cache line's worth
 of data, initially residing in memory at address~0,
-as it travels through the various single-line direct-mapped caches
+as it travels through the various single-line \IXhpl{direct-mapped}{cache}
 in a four-CPU system.
 \Cref{tab:app:whymb:Cache Coherence Example}
 shows this flow of data, with the first column showing the sequence
@@ -1659,7 +1664,7 @@ future such problems:
 	By the time the system gets around to dumping the offending
 	input buffer, the DMA will most likely have completed.
 
-\item	Inter-processor interrupts (IPIs) that ignore cache coherence.
+\item	\IXAcrfpl{ipi} that ignore cache coherence.
 
 	This can be problematic if the IPI reaches its destination
 	before all of the cache lines in the corresponding message
diff --git a/count/count.tex b/count/count.tex
index 84e1a9a0..b89a566c 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -261,7 +261,7 @@ Although approximation does have a large place in computing, loss of
 \label{fig:count:Atomic Increment Scalability on x86}
 \end{figure}
 
-The straightforward way to count accurately is to use atomic operations,
+The straightforward way to count accurately is to use \IX{atomic} operations,
 as shown in
 Listing~\ref{lst:count:Just Count Atomically!} (\path{count_atomic.c}).
 \begin{fcvref}[ln:count:count_atomic:inc-read]
@@ -356,7 +356,7 @@ additional CPUs.
 For another perspective on global atomic increment, consider
 Figure~\ref{fig:count:Data Flow For Global Atomic Increment}.
 In order for each CPU to get a chance to increment a given
-global variable, the cache line containing that variable must
+global variable, the \IX{cache line} containing that variable must
 circulate among all the CPUs, as shown by the red arrows.
 Such circulation will take significant time, resulting in
 the poor performance seen in
@@ -1233,7 +1233,7 @@ of structures, while the threads doing most of the freeing have lots
 of credits that they cannot use.
 On the other hand, if freed structures are credited to the CPU that
 allocated them, it will be necessary for CPUs to manipulate each
-others' counters, which will require expensive atomic instructions
+others' counters, which will require expensive \IX{atomic} instructions
 or other means of communicating between threads.\footnote{
 	That said, if each structure will always be freed
 	by the same CPU (or thread) that allocated it, then
@@ -1279,7 +1279,7 @@ variables were both equal to 10, we do the following:
 
 Although this procedure still requires a global lock, that lock need only be
 acquired once for every five increment operations, greatly reducing
-that lock's level of contention.
+that lock's level of \IXalt{contention}{lock contention}.
 We can reduce this contention as low as we wish by increasing the
 value of \co{countermax}.
 However, the corresponding penalty for increasing the value of
@@ -1837,7 +1837,7 @@ we need a limit counter that can tell exactly when its limits are
 exceeded.
 One way of implementing such a limit counter is to
 cause threads that have reserved counts to give them up.
-One way to do this is to use atomic instructions.
+One way to do this is to use \IX{atomic} instructions.
 Of course, atomic instructions will slow down the fastpath, but on the
 other hand, it would be silly not to at least give them a try.
 
@@ -2891,7 +2891,7 @@ The per-thread-variable implementation (\path{count_end.c})
 is significantly faster on
 updates than the array-based implementation
 (\path{count_stat.c}), but is slower at reads on large numbers of core,
-and suffers severe lock contention when there are many parallel readers.
+and suffers severe \IX{lock contention} when there are many parallel readers.
 This contention can be addressed using the deferred-processing
 techniques introduced in
 Chapter~\ref{chp:Deferred Processing},
diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
index e93b2984..a2e85950 100644
--- a/cpu/hwfreelunch.tex
+++ b/cpu/hwfreelunch.tex
@@ -266,7 +266,7 @@ The purpose of these accelerators is to improve energy efficiency
 and thus extend battery life: special purpose hardware can often
 compute more efficiently than can a general-purpose CPU\@.
 This is another example of the principle called out in
-Section~\ref{sec:intro:Generality}: Generality is almost never free.
+Section~\ref{sec:intro:Generality}: \IX{Generality} is almost never free.
 
 Nevertheless, given the end of \IXaltr{Moore's-Law}{Moore's Law}-induced
 single-threaded performance increases, it seems safe to assume that
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index cec401b9..3505b4f4 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -31,7 +31,7 @@ interconnect allowing the pair of CPUs to communicate with each other.
 The system interconnect allows the four dies to communicate with each
 other and with main memory.
 
-Data moves through this system in units of ``cache lines'', which
+Data moves through this system in units of ``\IXpl{cache line}'', which
 are power-of-two fixed-size aligned blocks of memory, usually ranging
 from 32 to 256 bytes in size.
 When a CPU loads a variable from memory to one of its registers, it must
diff --git a/cpu/overview.tex b/cpu/overview.tex
index 2008fb33..95899b35 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -179,7 +179,7 @@ described in the following sections.
 \subsection{Atomic Operations}
 \label{sec:cpu:Atomic Operations}
 
-One such obstacle is atomic operations.
+One such obstacle is \IX{atomic} operations.
 The problem here is that the whole idea of an atomic operation conflicts with
 the piece-at-a-time assembly-line operation of a CPU pipeline.
 To hardware designers' credit, modern CPUs use a number of extremely clever
@@ -248,8 +248,8 @@ as described in the next section.
 Memory barriers will be considered in more detail in
 Chapter~\ref{chp:Advanced Synchronization: Memory Ordering} and
 Appendix~\ref{chp:app:whymb:Why Memory Barriers?}.
-In the meantime, consider the following simple lock-based critical
-section:
+In the meantime, consider the following simple lock-based \IX{critical
+section}:
 
 \begin{VerbatimN}
 spin_lock(&mylock);
diff --git a/cpu/swdesign.tex b/cpu/swdesign.tex
index 79abb8a8..c59a70eb 100644
--- a/cpu/swdesign.tex
+++ b/cpu/swdesign.tex
@@ -85,7 +85,7 @@ The lesson should be quite clear:
 parallel algorithms must be explicitly designed with these hardware
 properties firmly in mind.
 One approach is to run nearly independent threads.
-The less frequently the threads communicate, whether by atomic operations,
+The less frequently the threads communicate, whether by \IX{atomic} operations,
 locks, or explicit messages, the better the application's performance
 and scalability will be.
 This approach will be touched on in
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index fa9272df..26d5c556 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1233,7 +1233,7 @@ already-resized hash bucket and
 line~\lnref{fastret1} returns with the selected hash bucket's
 lock held (thus preventing a concurrent resize operation from distributing
 this bucket) and also within an RCU read-side critical section.
-Deadlock is avoided because the old table's locks are always acquired
+\IX{Deadlock} is avoided because the old table's locks are always acquired
 before those of the new table, and because the use of RCU prevents more
 than two versions from existing at a given time, thus preventing a
 deadlock cycle.
@@ -2047,7 +2047,7 @@ memory overhead.
 
 Modern computers typically move data between CPUs and main memory in
 fixed-sized blocks that range in size from 32 bytes to 256 bytes.
-These blocks are called \emph{cache lines}, and are extremely important
+These blocks are called \emph{\IXpl{cache line}}, and are extremely important
 to high performance and scalability, as was discussed in
 Section~\ref{sec:cpu:Overheads}.
 One timeworn way to kill both performance and scalability is to
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 15496a00..9d6e7c36 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -758,7 +758,7 @@ KCSAN has a significant false-positive rate, especially from the
 viewpoint of developers thinking in terms of C as assembly language
 with additional syntax.
 KCSAN therefore provides a \co{data_race()} construct to forgive
-known-benign data races, and also the \co{ASSERT_EXCLUSIVE_ACCESS()}
+known-benign \IXpl{data race}, and also the \co{ASSERT_EXCLUSIVE_ACCESS()}
 and \co{ASSERT_EXCLUSIVE_WRITER()} assertions to explicitly check
 for data races\cite{MarcoElver2020FearDataRaceDetector1,MarcoElver2020FearDataRaceDetector2}.
 
diff --git a/defer/rcu.tex b/defer/rcu.tex
index e7e603d9..979a5b28 100644
--- a/defer/rcu.tex
+++ b/defer/rcu.tex
@@ -19,7 +19,7 @@ Section~\ref{sec:defer:Hazard Pointers}
 uses implicit counters in the guise of per-thread lists of pointer.
 This avoids read-side contention, but requires readers to do stores and
 conditional branches, as well as either full memory barriers in read-side
-primitives or real-time-unfriendly inter-processor interrupts in
+primitives or real-time-unfriendly \IXacrlpl{ipi} in
 update-side primitives.\footnote{
 	In some important special cases, this extra work can be avoided
 	by using link counting as exemplified by the UnboundedQueue
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 44c482f6..0480b2d2 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -51,7 +51,7 @@ Unfortunately, as laid out in
 Section~\ref{sec:toolsoftrade:Shared-Variable Shenanigans}
 and reiterated in
 Section~\ref{sec:defer:Minimal Insertion and Deletion},
-it is unwise to use plain accesses for these publication and subscription
+it is unwise to use \IXplx{plain access}{es} for these publication and subscription
 operations.
 It is instead necessary to inform both the compiler and the CPU
 of the need for care, as can be seen from
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index b86d736a..944f095c 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -266,7 +266,7 @@ one CPU or thread at a time.
 This approach has the advantage of not degrading reader response times
 at all, let alone gravely.
 Furthermore, numerous applications already have states (termed
-\emph{quiescent states}) that can be
+\emph{\IXpl{quiescent state}}) that can be
 reached only after all pre-existing readers are done.
 In transaction-processing systems, the time between a pair of
 successive transactions might be a quiescent state.
@@ -298,7 +298,7 @@ spinning attempting to acquire a spinlock held by a blocked thread.
 The spinning threads will not relinquish their CPUs until they acquire
 the lock, but the thread holding the lock cannot possibly release it
 until one of the spinning threads relinquishes a CPU\@.
-This is a classic deadlock situation, and this deadlock is avoided
+This is a classic deadlock situation, and this \IX{deadlock} is avoided
 by forbidding blocking while holding a spinlock.
 
 Again, this same constraint is imposed on reader threads dereferencing
diff --git a/defer/rcurelated.tex b/defer/rcurelated.tex
index 6cf0b068..4c27ed8f 100644
--- a/defer/rcurelated.tex
+++ b/defer/rcurelated.tex
@@ -173,8 +173,9 @@ practical challenges for large read-side critical sections that
 span multiple functions.
 
 \ppl{Pedro}{Ramalhete} and \ppl{Andreia}{Correia}~\cite{PedroRmalhete2015PoorMansRCU}
-produced ``Poor Man's RCU'', which, despite using a pair of reader-writer
-locks, manages to provide lock-free forward-progress guarantees to
+produced ``Poor Man's RCU'', which, despite using a pair of
+\IXhpl{reader-writer}{lock}, manages to provide \IXalt{lock-free}{lock free}
+\IXpl{forward-progress guarantee} to
 readers~\cite{PaulEMcKenney2015ReadMostly}.
 
 \ppl{Maya}{Arbel} and \ppl{Adam}{Morrison}~\cite{Arbel:2015:PRR:2858788.2688518}
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index fb50e79d..6586b27f 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -930,8 +930,8 @@ but in practice, it is not yet clear whether this is a good tradeoff.)
 Of course, SRCU brings restrictions of its own, namely that the
 return value from \co{srcu_read_lock()} be passed into the
 corresponding \co{srcu_read_unlock()}, and that no SRCU primitives
-be invoked from hardware interrupt handlers or from non-maskable interrupt
-(NMI) handlers.
+be invoked from hardware interrupt handlers or from \IXacrf{nmi}
+handlers.
 The jury is still out as to how much of a problem is presented by
 these restrictions, and as to how they can best be handled.
 
@@ -1503,7 +1503,7 @@ In addition, as noted in
 Section~\ref{sec:defer:RCU Provides Type-Safe Memory},
 within the Linux kernel, the \co{SLAB_TYPESAFE_BY_RCU}
 slab-allocator flag provides type-safe memory to RCU readers, which can
-greatly simplify non-blocking synchronization and other lockless
+greatly simplify \IXacrl{nbs} and other lockless
 algorithms.
 
 In short, RCU is an API that includes a publish-subscribe mechanism for
diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index 35ae78dc..71f506a3 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -119,7 +119,7 @@ initializes a \co{seqlock_t}.
 
 \begin{fcvref}[ln:defer:seqlock:impl:read_seqbegin]
 \Clnrefrange{b}{e} show \co{read_seqbegin()}, which begins a sequence-lock
-read-side critical section.
+\IXh{read-side}{critical section}.
 Line~\lnref{fetch} takes a snapshot of the sequence counter, and
 line~\lnref{mb} orders
 this snapshot operation before the caller's critical section.
@@ -386,7 +386,7 @@ can also be overcome by combining other synchronization primitives
 with sequence locking.
 
 Sequence locks allow writers to defer readers, but not vice versa.
-This can result in unfairness and even starvation
+This can result in \IX{unfairness} and even \IX{starvation}
 in writer-heavy workloads.\footnote{
 	Dmitry Vyukov describes one way to reduce (but, sadly, not eliminate)
 	reader starvation:
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index ad66e12b..8f2921b4 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -318,7 +318,8 @@ be reduced by batching, so that each read-side operation covers more data.
 }\QuickQuizEnd
 
 The ``Reader Forward Progress Guarantee'' row shows that only RCU
-has a bounded wait-free forward-progress guarantee, which means that
+has a \IXalth{bounded wait-free}{bounded}{wait free}
+\IX{forward-progress guarantee}, which means that
 it can carry out a finite traversal by executing a bounded number of
 instructions.
 
diff --git a/easy/easy.tex b/easy/easy.tex
index eae0c6ab..50a616cc 100644
--- a/easy/easy.tex
+++ b/easy/easy.tex
@@ -174,7 +174,7 @@ Such shaving may seem counterproductive.
 After all, if an algorithm works, why shouldn't it be used?
 
 To see why at least some shaving is absolutely necessary, consider
-a locking design that avoids deadlock, but in perhaps the worst possible way.
+a locking design that avoids \IX{deadlock}, but in perhaps the worst possible way.
 This design uses a circular doubly linked list, which contains one
 element for each thread in the system along with a header element.
 When a new thread is spawned, the parent thread must insert a new
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index f1f7d65e..98bdaf95 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -120,7 +120,7 @@ A CPU exits dynticks-idle mode for the following three reasons:
 \item	To start running a task,
 \item	When entering the outermost of a possibly nested set of interrupt
 	handlers, and
-\item	When entering an NMI handler.
+\item	When entering an \IXacr{nmi} handler.
 \end{enumerate}
 
 Preemptible RCU's grace-period machinery samples the value of
@@ -1174,7 +1174,7 @@ This effort provided some lessons (re)learned:
 	is buggy.
 \item	{\bf Use of atomic instructions can simplify verification.}
 	Unfortunately, use of the \co{cmpxchg} atomic instruction
-	would also slow down the critical \IRQ\ fastpath, so they
+	would also slow down the critical \IXacr{irq} fastpath, so they
 	are not appropriate in this case.
 \item	{\bf The need for complex formal verification often indicates
 	a need to re-think your design.}
@@ -1263,7 +1263,7 @@ These variables are used as follows:
 
 If both \co{dynticks} and \co{dynticks_nmi} have taken on an even
 value during a given time interval, then the corresponding CPU has
-passed through a quiescent state during that interval.
+passed through a \IX{quiescent state} during that interval.
 
 \QuickQuiz{
 	But what happens if an NMI handler starts running before
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 6b99db72..305a7014 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -254,7 +254,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	The optimizations produced by \co{-DSAFETY} greatly speed things
 	up, so you should use it when you can.
 	An example situation where you cannot use \co{-DSAFETY} is
-	when checking for livelocks (AKA ``non-progress cycles'')
+	when checking for \IXpl{livelock} (AKA ``non-progress cycles'')
 	via \co{-DNP}.
 
 	The optional \co{-DCOLLAPSE} generates code for a state vector
diff --git a/future/cpu.tex b/future/cpu.tex
index e2fdff55..205bf248 100644
--- a/future/cpu.tex
+++ b/future/cpu.tex
@@ -83,7 +83,7 @@ As was said in 2004~\cite{PaulEdwardMcKenneyPhD}:
 	overhead, since memory barriers, cache thrashing, and contention
 	do not affect single-CPU systems.
 	In this scenario, RCU is useful only for niche applications, such
-	as interacting with NMIs.
+	as interacting with \IXacrpl{nmi}.
 	It is not clear that an operating system lacking RCU would see
 	the need to adopt it, although operating
 	systems that already implement RCU might continue to do so.
diff --git a/future/htm.tex b/future/htm.tex
index abc60baf..22e40c19 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -91,7 +91,7 @@ listed above.
 Most synchronization mechanisms are based on data structures that are
 operated on by atomic instructions.
 Because these atomic instructions normally operate by first causing
-the relevant cache line to be owned by the CPU that they are running on,
+the relevant \IX{cache line} to be owned by the CPU that they are running on,
 a subsequent execution
 of the same instance of that synchronization primitive on some other
 CPU will result in a cache miss.
@@ -226,7 +226,7 @@ However, hardware caches do not chain their buckets (which are normally
 called \emph{sets}), but rather
 provide a fixed number of cachelines per set.
 The number of elements provided for each set in a given cache
-is termed that cache's \emph{associativity}.
+is termed that cache's \emph{\IXalt{associativity}{cache associativity}}.
 
 Although cache associativity varies, the eight-way associativity of
 the level-0 cache on the laptop I am typing this on is not unusual.
@@ -251,11 +251,13 @@ write~\cite{RaviRajwar2012TSX}.
 \IXAcrmfst{utm}
 schemes~\cite{CScottAnanian2006,KevinEMoore2006}
 use DRAM as an extremely large victim cache, but integrating such schemes
-into a production-quality cache-coherence mechanism is still an unsolved
+into a production-quality
+IXalt{cache-coherence}{cache coherence} mechanism is still an unsolved
 problem.
 In addition, use of DRAM as a victim cache may have unfortunate
 performance and energy-efficiency consequences, particularly
-if the victim cache is to be fully associative.
+if the victim cache is to be
+\IXalth{fully associative}{fully associative}{cache}.
 Finally, the ``unbounded'' aspect of UTM assumes that all of DRAM
 could be used as a victim cache, while in reality
 the large but still fixed amount of DRAM assigned to a given CPU
@@ -425,7 +427,7 @@ given transaction, software must provide fallback code.
 This fallback code must use some other form of synchronization, for
 example, locking.
 If a lock-based fallback is ever used, then all the limitations of locking,
-including the possibility of deadlock, reappear.
+including the possibility of \IX{deadlock}, reappear.
 One can of course hope that the fallback isn't used often, which might
 allow simpler and less deadlock-prone locking designs to be used.
 But this raises the question of how the system transitions from using
@@ -507,11 +509,10 @@ and thus increasing the probability of failure.
 \label{sec:future:Semantic Differences}
 
 Although HTM can in many cases be used as a drop-in replacement for locking
-(hence the name transactional lock
-elision~\cite{DaveDice2008TransactLockElision}),
+(hence the name \IXacrfst{tle}~\cite{DaveDice2008TransactLockElision}),
 there are subtle differences in semantics.
 A particularly nasty example involving coordinated lock-based critical
-sections that results in deadlock or livelock when executed transactionally
+sections that results in deadlock or \IX{livelock} when executed transactionally
 was given by Blundell~\cite{Blundell2006TMdeadlock}, but a much simpler
 example is the empty critical section.
 
diff --git a/future/tm.tex b/future/tm.tex
index 0829d402..0755fafb 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -23,8 +23,8 @@ Not long after, Shavit and Touitou proposed a software-only implementation
 of transactional memory (STM) that was capable of running on commodity
 hardware, give or take memory-ordering issues~\cite{Shavit95}.
 This proposal languished for many years, perhaps due to the fact that
-the research community's attention was absorbed by non-blocking
-synchronization (see \cref{sec:advsync:Non-Blocking Synchronization}).
+the research community's attention was absorbed by \IXacrl{nbs}
+(see \cref{sec:advsync:Non-Blocking Synchronization}).
 
 But by the turn of the century, TM started receiving
 more attention~\cite{Martinez01a,Rajwar01a}, and by the middle of the
@@ -561,8 +561,8 @@ function within a transaction and (b)~what do you do about the unknowable
 nature of the code within this function?
 To be fair, item (b) poses some challenges for locking and userspace-RCU
 as well, at least in theory.
-For example, the dynamically linked function might introduce a deadlock
-for locking or might (erroneously) introduce a quiescent state into a
+For example, the dynamically linked function might introduce a \IX{deadlock}
+for locking or might (erroneously) introduce a \IX{quiescent state} into a
 userspace-RCU read-side critical section.
 The difference is that while the class of operations permitted in locking
 and userspace-RCU critical sections is well-understood, there appears
@@ -713,7 +713,7 @@ So how can transactions be debugged?
 \end{enumerate}
 
 There is some reason to believe that transactional memory will deliver
-productivity improvements compared to other synchronization mechanisms,
+\IX{productivity} improvements compared to other synchronization mechanisms,
 but it does seem quite possible that these improvements could easily
 be lost if traditional debugging techniques cannot be applied to
 transactions.
@@ -920,7 +920,7 @@ Some possibilities are as follows:
 \item	RCU readers that run concurrently with conflicting TM updates
 	get old (pre-transaction) values from any conflicting RCU loads.
 	This preserves RCU semantics and performance, and also prevents
-	RCU-update starvation.
+	RCU-update \IX{starvation}.
 	However, not all TM implementations can provide timely access
 	to old values of variables that have been tentatively updated
 	by an in-flight transaction.
diff --git a/glossary.tex b/glossary.tex
index 950c9460..98a27438 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -75,7 +75,7 @@
 	variables will appear to occur.
 	See Section~\ref{sec:memorder:Cache Coherence}
 	for more information.
-\item[\IX{Cache Coherence Protocol}:]
+\item[\IX{Cache-Coherence Protocol}:]
 	A communications protocol, normally implemented in hardware,
 	that enforces memory consistency and ordering, preventing
 	different CPUs from seeing inconsistent views of data held
@@ -385,7 +385,7 @@
 	Rate at which work is done, expressed as work per unit time.
 	If this work is fully serialized, then the performance will
 	be the reciprocal of the mean latency of the work items.
-\item[\IX{Pipelined CPU}:]
+\item[\IXr{Pipelined CPU}:]
 	A CPU with a pipeline, which is
 	an internal flow of instructions internal to the CPU that
 	is in some way similar to an assembly line, with many of
@@ -485,7 +485,7 @@
 	as well as its cache so as to ensure that the software sees
 	the memory operations performed by this CPU as if they
 	were carried out in program order.
-\item[\IX{Superscalar CPU}:]
+\item[\IXr{Superscalar CPU}:]
 	A scalar (non-vector) CPU capable of executing multiple instructions
 	concurrently.
 	This is a step up from a pipelined CPU that executes multiple
@@ -522,7 +522,7 @@
 \item[\IX{Unteachable}:]
 	A topic, concept, method, or mechanism that the teacher does
 	not understand well is therefore uncomfortable teaching.
-\item[\IX{Vector CPU}:]
+\item[\IXr{Vector CPU}:]
 	A CPU that can apply a single instruction to multiple items of
 	data concurrently.
 	In the 1960s through the 1980s, only supercomputers had vector
diff --git a/intro/intro.tex b/intro/intro.tex
index 9047c295..4f38f376 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -9,8 +9,9 @@
 
 Parallel programming has earned a reputation as one of the most
 difficult areas a hacker can tackle.
-Papers and textbooks warn of the perils of deadlock, livelock,
-race conditions, non-determinism, Amdahl's-Law limits to scaling,
+Papers and textbooks warn of the perils of \IX{deadlock}, \IX{livelock},
+\IXpl{race condition}, non-determinism,
+\IXaltr{Amdahl's-Law}{Amdahl's Law} limits to scaling,
 and excessive realtime latencies.
 And these perils are quite real; we authors have accumulated uncounted
 % 2020:
@@ -247,9 +248,9 @@ The three major goals of parallel programming (over and above those
 of sequential programming) are as follows:
 
 \begin{enumerate}
-\item	Performance.
-\item	Productivity.
-\item	Generality.
+\item	\IX{Performance}.
+\item	\IX{Productivity}.
+\item	\IX{Generality}.
 \end{enumerate}
 
 Unfortunately, given the current state of the art, it is possible to
@@ -434,7 +435,7 @@ sequential case when analyzing the performance of parallel algorithms.
 	you would be doing it by hand rather than using a computer!
 }\QuickQuizEnd
 
-Productivity has been becoming increasingly important in recent decades.
+\IX{Productivity} has been becoming increasingly important in recent decades.
 To see this, consider that the price of early computers was tens
 of millions of dollars at
 a time when engineering salaries were but a few thousand dollars a year.
@@ -534,7 +535,7 @@ Now, however, productivity is gaining the spotlight.
 \label{sec:intro:Generality}
 
 One way to justify the high cost of developing parallel software
-is to strive for maximal generality.
+is to strive for maximal \IX{generality}.
 All else being equal, the cost of a more-general software artifact
 can be spread over more users than that of a less-general one.
 In fact, this economic force explains much of the maniacal focus
@@ -734,7 +735,7 @@ In some cases, this approach can be easily extended to a cluster of
 machines.
 
 This approach may seem like cheating, and in fact some denigrate such
-programs as ``embarrassingly parallel''.
+programs as ``\IX{embarrassingly parallel}''.
 And in fact, this approach does have some potential disadvantages,
 including increased memory consumption, waste of CPU cycles recomputing
 common intermediate results, and increased copying of data.
@@ -1031,8 +1032,8 @@ provided by various parallel languages and environments,
 including message passing, locking, transactions,
 reference counting, explicit timing, shared atomic variables, and data
 ownership.
-Many traditional parallel-programming concerns such as deadlock,
-livelock, and transaction rollback stem from this coordination.
+Many traditional parallel-programming concerns such as \IX{deadlock},
+\IX{livelock}, and transaction rollback stem from this coordination.
 This framework can be elaborated to include comparisons
 of these synchronization mechanisms, for example locking vs.\@ transactional
 memory~\cite{McKenney2007PLOSTM}, but such elaboration is beyond the
@@ -1074,7 +1075,7 @@ partitioned over computer systems, mass-storage devices, NUMA nodes,
 CPU cores (or dies or hardware threads), pages, cache lines, instances
 of synchronization primitives, or critical sections of code.
 For example, partitioning over locking primitives is termed
-``data locking''~\cite{Beck85}.
+``\IXh{data}{locking}''~\cite{Beck85}.
 
 Resource partitioning is frequently application dependent.
 For example, numerical applications frequently partition matrices
diff --git a/locking/locking.tex b/locking/locking.tex
index 93fd21a6..5313f926 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -11,8 +11,8 @@
 	  quoting}}
 
 In recent concurrency research, locking often plays the role of villain.
-Locking stands accused of inciting deadlocks, convoying, starvation,
-unfairness, data races, and all manner of other concurrency sins.
+\IX{Locking} stands accused of inciting \IXpl{deadlock}, convoying, \IX{starvation},
+\IX{unfairness}, \IXpl{data race}, and all manner of other concurrency sins.
 Interestingly enough, the role of workhorse in production-quality
 shared-memory parallel software is also played by locking.
 This chapter will look into this dichotomy between villain and
@@ -99,13 +99,13 @@ more serious sins.
 Given that locking stands accused of deadlock and starvation,
 one important concern for shared-memory parallel developers is
 simply staying alive.
-The following sections therefore cover deadlock, livelock, starvation,
+The following sections therefore cover deadlock, \IX{livelock}, starvation,
 unfairness, and inefficiency.
 
 \subsection{Deadlock}
 \label{sec:locking:Deadlock}
 
-Deadlock occurs when each member of a group of threads is holding at
+\IX{Deadlock} occurs when each member of a group of threads is holding at
 least one lock while at the same time waiting on a lock held by a member
 of that same group.
 This happens even in groups containing a single thread when that thread
@@ -609,8 +609,8 @@ must release the locks and start over.
 
 	If the routing decision in \co{layer_1()} changes often enough,
 	the code will always retry, never making forward progress.
-	This is termed ``livelock'' if no thread makes any forward progress or
-	``starvation''
+	This is termed ``\IX{livelock}'' if no thread makes any
+	forward progress or ``\IX{starvation}''
 	if some threads make forward progress but others do not
 	(see Section~\ref{sec:locking:Livelock and Starvation}).
 }\QuickQuizEndE
@@ -839,7 +839,7 @@ Although conditional locking can be an effective deadlock-avoidance
 mechanism, it can be abused.
 Consider for example the beautifully symmetric example shown in
 Listing~\ref{lst:locking:Abusing Conditional Locking}.
-This example's beauty hides an ugly livelock.
+This example's beauty hides an ugly \IX{livelock}.
 To see this, consider the following sequence of events:
 
 \begin{listing}
@@ -921,7 +921,7 @@ retry:					\lnlbl[thr2:retry]
 	assuming that the global lock need not be acquired too often.
 }\QuickQuizEnd
 
-Livelock can be thought of as an extreme form of starvation where
+Livelock can be thought of as an extreme form of \IX{starvation} where
 a group of threads starves, rather than just one of them.\footnote{
 	Try not to get too hung up on the exact definitions of terms
 	like livelock, starvation, and unfairness.
@@ -1002,7 +1002,7 @@ even better high-contention results are obtained via queued
 locking~\cite{Anderson90}, which is discussed more in
 Section~\ref{sec:locking:Other Exclusive-Locking Implementations}.
 Of course, best of all is to use a good parallel design that avoids
-these problems by maintaining low lock contention.
+these problems by maintaining low \IX{lock contention}.
 
 \subsection{Unfairness}
 \label{sec:locking:Unfairness}
@@ -1014,7 +1014,7 @@ these problems by maintaining low lock contention.
 \label{fig:locking:System Architecture and Lock Unfairness}
 \end{figure}
 
-Unfairness can be thought of as a less-severe form of starvation,
+\IX{Unfairness} can be thought of as a less-severe form of starvation,
 where a subset of threads contending for a given lock are granted
 the lion's share of the acquisitions.
 This can happen on machines with shared caches or NUMA characteristics,
@@ -1072,7 +1072,7 @@ Too coarse a granularity will limit scalability, while too fine a
 granularity will result in excessive synchronization overhead.
 
 Acquiring a lock might be expensive, but once held, the CPU's caches
-are an effective performance booster, at least for large critical sections.
+are an effective performance booster, at least for large \IXpl{critical section}.
 In addition, once a lock is held, the data protected by that lock can
 be accessed by the lock holder without interference from other threads.
 
@@ -1115,7 +1115,7 @@ and scoped locking (Section~\ref{sec:locking:Scoped Locking}).
 \subsection{Exclusive Locks}
 \label{sec:locking:Exclusive Locks}
 
-Exclusive locks are what they say they are: only one thread may hold
+\IXhpl{Exclusive}{lock} are what they say they are: only one thread may hold
 the lock at a time.
 The holder of such a lock thus has exclusive access to all data protected
 by that lock, hence the name.
@@ -1314,7 +1314,7 @@ systems designed to avoid contention might not need fairness at all.
 \subsection{Reader-Writer Locks}
 \label{sec:locking:Reader-Writer Locks}
 
-Reader-writer locks~\cite{Courtois71}
+\IXhpl{Reader-writer}{lock}~\cite{Courtois71}
 permit any number of readers to hold the lock
 concurrently on the one hand or a single writer to hold the lock
 on the other.
@@ -1350,7 +1350,7 @@ and memory-barrier overhead---multiplied by the number of threads.
 In short, reader-writer locks can be quite useful in a number of
 situations, but each type of implementation does have its drawbacks.
 The canonical use case for reader-writer locking involves very long
-read-side critical sections, preferably measured in hundreds of microseconds
+\IXhpl{read-side}{critical section}, preferably measured in hundreds of microseconds
 or even milliseconds.
 
 As with exclusive locks, a reader-writer lock acquisition cannot complete
@@ -1823,7 +1823,7 @@ the atomic-exchange-based test-and-set lock presented in the previous
 section works well when contention is low and has the advantage
 of small memory footprint.
 It avoids giving the lock to threads that cannot use it, but as
-a result can suffer from unfairness or even starvation at high
+a result can suffer from \IX{unfairness} or even \IX{starvation} at high
 contention levels.
 
 In contrast, ticket lock~\cite{MellorCrummey91a}, which was once used
@@ -1852,7 +1852,7 @@ At low contention, this is not a problem: The corresponding cache line
 is very likely still local to and writeable by the thread holding
 the lock.
 In contrast, at high levels of contention, each thread attempting to
-acquire the lock will have a read-only copy of the cache line, and
+acquire the lock will have a read-only copy of the \IX{cache line}, and
 the lock holder will need to invalidate all such copies before it
 can carry out the update that releases the lock.
 In general, the more CPUs and threads there are, the greater the
@@ -2006,8 +2006,8 @@ the token-based mechanism, for example:
 This lock is unusual in that a given CPU cannot necessarily acquire it
 immediately, even if no other CPU is using it at the moment.
 Instead, the CPU must wait until the token comes around to it.
-This is useful in cases where CPUs need periodic access to the critical
-section, but can tolerate variances in token-circulation rate.
+This is useful in cases where CPUs need periodic access to the \IX{critical
+section}, but can tolerate variances in token-circulation rate.
 Gamsa et al.~\cite{Gamsa99} used it to implement a variant of
 read-copy update (see Section~\ref{sec:defer:Read-Copy Update (RCU)}),
 but it could also be used to protect periodic per-CPU operations such
@@ -2170,7 +2170,7 @@ Here are some ways to avoid acquiring locks in signal handlers even
 if complex data structures must be manipulated:
 
 \begin{enumerate}
-\item	Use simple data structures based on non-blocking synchronization,
+\item	Use simple data structures based on \IXacrl{nbs},
 	as will be discussed in
 	Section~\ref{sec:advsync:Simple NBS}.
 \item	If the data structures are too complex for reasonable use of
@@ -2459,7 +2459,7 @@ It is important to note that hardware transactional memory
 (discussed in
 Section~\ref{sec:future:Hardware Transactional Memory})
 cannot help here unless the hardware transactional memory implementation
-provides forward-progress guarantees, which few do.
+provides \IXpl{forward-progress guarantee}, which few do.
 Other alternatives that appear to be quite practical (if less heavily
 hyped) include the methods discussed in
 Sections~\ref{sec:locking:Conditional Locking},
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 898b946a..397fb101 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -297,7 +297,7 @@ As shown on row~4, after both read-invalidate operations complete,
 the two CPUs have traded cachelines, so that CPU~0's cache now contains
 \co{x0} and CPU~1's cache now contains \co{x1}.
 Once these two variables are in their new homes, each CPU can flush
-its store buffer into the corresponding cache line, leaving each
+its store buffer into the corresponding \IX{cache line}, leaving each
 variable with its final value as shown on row~5.
 
 \QuickQuiz{
@@ -481,7 +481,7 @@ memory-ordering instructions at all.
 		& a: & Provides specified ordering given intervening RMW atomic operation \\
 		& DR: & Dependent read (address dependency, \cref{sec:memorder:Address Dependencies}) \\
 		& DW: & Dependent write (address, data, or control dependency, \crefrange{sec:memorder:Address Dependencies}{sec:memorder:Control Dependencies}) \\
-		& RMW: & Atomic read-modify-write operation \\
+		& RMW: & \IX{Atomic read-modify-write operation} \\
 		& Self: & Orders self, as opposed to accesses both before
 			  and after \\
 		& SV: & Orders later accesses to the same variable \\
@@ -505,7 +505,8 @@ while other characters indicate that ordering is supplied only partially or
 conditionally.
 Blank cells indicate that no ordering is supplied.
 
-The ``Store'' row also covers the store portion of an atomic RMW operation.
+The ``Store'' row also covers the store portion of an
+\IXalt{atomic RMW operation}{atomic read-modify-write operation}.
 In addition, the ``Load'' row covers the load
 component of a successful value-returning \co{_relaxed()} RMW atomic
 operation, although the combined ``\co{_relaxed()} RMW operation''
@@ -1526,7 +1527,7 @@ multiple times, with ``single-variable SC'',\footnote{
 and just plain ``coherence''~\cite{JadeAlglave2011ppcmem}
 having seen use.
 Rather than further compound the confusion by inventing yet another term
-for this concept, this book uses ``cache coherence'' and ``coherence''
+for this concept, this book uses ``\IX{cache coherence}'' and ``coherence''
 interchangeably.
 
 \begin{listing}
@@ -1703,8 +1704,8 @@ The cartoonish diagram of a such a real system is shown in
 CPU~0 and CPU~1 share a store buffer, as do CPUs~2 and~3.
 This means that CPU~1 can load a value out of the store buffer, thus
 potentially immediately seeing a value stored by CPU~0.
-In contrast, CPUs~2 and~3 will have to wait for the corresponding cache
-line to carry this new value to them.
+In contrast, CPUs~2 and~3 will have to wait for the corresponding \IX{cache
+line} to carry this new value to them.
 
 \QuickQuiz{
 	Then who would even \emph{think} of designing a system with shared
@@ -2381,7 +2382,7 @@ instead enshrined in various standards.\footnote{
 It is worth summarizing this material in preparation for the following
 sections.
 
-Plain accesses, as in plain-access C-language assignment statements such
+\IXplx{Plain access}{es}, as in plain-access C-language assignment statements such
 as \qco{r1 = a} or \qco{b = 1} are subject to the
 shared-variable shenanigans described in
 \cref{sec:toolsoftrade:Shared-Variable Shenanigans}.
@@ -2436,7 +2437,7 @@ starting on
 }\QuickQuizEnd
 
 Please note that all of these shared-memory shenanigans can instead be
-avoided by avoiding data races on plain accesses, as described in
+avoided by avoiding \IXpl{data race} on plain accesses, as described in
 \cref{sec:toolsoftrade:Avoiding Data Races}.
 After all, if there are no data races, then each and every one of the
 compiler optimizations mentioned above is perfectly safe.
@@ -2705,7 +2706,7 @@ pointers:
 	an appropriate dependency.
 	For example, you have a pair of pointers, each carrying a
 	dependency, to data structures each containing a lock, and you
-	want to avoid deadlock by acquiring the locks in address order.
+	want to avoid \IX{deadlock} by acquiring the locks in address order.
 \item	The comparison is not-equal, and the compiler does not have
 	enough other information to deduce the value of the
 	pointer carrying the dependency.
@@ -4083,7 +4084,7 @@ on \clnrefrange{init:b}{init:e}.
 \Cref{fig:memorder:fig:memorder:Why smp-read-barrier-depends() is Required in Pre-v4.15 Linux Kernels}
 shows how this can happen on
 an aggressively parallel machine with partitioned caches, so that
-alternating cache lines are processed by the different partitions
+alternating \IXpl{cache line} are processed by the different partitions
 of the caches.
 For example, the load of \co{head.next} on \clnref{h:next} of
 \cref{lst:memorder:Insert and Lock-Free Search (No Ordering)}
@@ -4149,8 +4150,8 @@ which works safely and efficiently for all recent kernel versions.
 It is also possible to implement a software mechanism
 that could be used in place of \co{smp_store_release()} to force
 all reading CPUs to see the writing CPU's writes in order.
-This software barrier could be implemented by sending inter-processor
-interrupts (IPIs) to all other CPUs.
+This software barrier could be implemented by sending \IXacrfpl{ipi}
+to all other CPUs.
 Upon receipt of such an IPI, a CPU would execute a memory-barrier
 instruction, implementing a system-wide memory barrier similar to that
 provided by the Linux kernel's \co{sys_membarrier()} system call.
@@ -4249,7 +4250,7 @@ different set of memory-barrier instructions~\cite{ARMv7A:2010}:
 	The ``type'' of operations can be all operations or can be
 	restricted to only writes (similar to the Alpha \co{wmb}
 	and the \Power{} \co{eieio} instructions).
-	In addition, \ARM\ allows cache coherence to have one of three
+	In addition, \ARM\ allows \IX{cache coherence} to have one of three
 	scopes: single processor, a subset of the processors
 	(``inner'') and global (``outer'').
 \item	[\tco{DSB}] (data synchronization barrier) causes the specified
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 5dcf9f0e..80d7fb0c 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -188,6 +188,7 @@
 \newcommand{\IXr}[1]{\index{#1}\hlindex{#1}} % put as is into general index
 \newcommand{\IXpl}[1]{\ucindex{#1}\hlindex{#1s}} % put with first letter capitalized into general index for plural
 \newcommand{\IXplr}[1]{\index{#1}\hlindex{#1s}} % put as is into general index for plural
+\newcommand{\IXplx}[2]{\ucindex{#1}\hlindex{#1#2}} % put as is into general index for plural of exeptional form
 \newcommand{\IXalt}[2]{\ucindex{#2}\hlindex{#1}} % put alternative with first letter capitalized into general index
 \newcommand{\IXaltr}[2]{\index{#2}\hlindex{#1}} % put alternative as is into general index
 \newcommand{\IXh}[2]{\indexh{#1 #2}{#2}{#1}\hlindex{#1 #2}}
diff --git a/summary.tex b/summary.tex
index 99853e51..ef2f903e 100644
--- a/summary.tex
+++ b/summary.tex
@@ -86,8 +86,8 @@ And that goes at least double for concurrent code.
 where combining concurrency mechanisms with each other or with other
 design tricks can greatly ease parallel programmers' lives.
 \Cref{sec:advsync:Advanced Synchronization} looked at advanced
-synchronization methods, including lockless programming, non-blocking
-synchronization, and parallel real-time computing.
+synchronization methods, including lockless programming, IXacrl{nbs},
+and parallel real-time computing.
 \Cref{chp:Advanced Synchronization: Memory Ordering} dug into the
 critically important topic of memory ordering, presenting techniques
 and tools to help you not only solve memory-ordering problems, but
diff --git a/together/seqlock.tex b/together/seqlock.tex
index d65c3563..b65d7564 100644
--- a/together/seqlock.tex
+++ b/together/seqlock.tex
@@ -49,7 +49,7 @@ he does realize that this problem could well arise in other situations.
 One way to avoid this reader-starvation problem is to have the readers
 use the update-side primitives if there have been too many retries,
 but this can degrade both performance and scalability.
-Another way to avoid starvation is to have multiple sequence locks,
+Another way to avoid \IX{starvation} is to have multiple sequence locks,
 in Schr\"odinger's case, perhaps one per species.
 
 In addition, if the update-side primitives are used too frequently,
@@ -79,7 +79,7 @@ Another approach is to shard the data elements, and then have each update
 write-acquire all the sequence locks needed to cover the data elements
 affected by that update.
 Of course, these write acquisitions must be done carefully in order to
-avoid deadlock.
+avoid \IX{deadlock}.
 Readers would also need to read-acquire multiple sequence locks, but
 in the surprisingly common case where readers only look up one data
 element, only one sequence lock need be read-acquired.
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index e762d1f5..77a3790d 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -397,7 +397,7 @@ Note that this program carefully makes sure that only one of the threads
 stores a value to variable \co{x} at a time.
 Any situation in which one thread might be storing a value to a given
 variable while some other thread either loads from or stores to that
-same variable is termed a \emph{data race}.
+same variable is termed a \emph{\IX{data race}}.
 Because the C language makes no guarantee that the results of a data race
 will be in any way reasonable, we need some way of safely accessing
 and modifying data concurrently, such as the locking primitives discussed
@@ -739,10 +739,10 @@ at any given time, but multiple threads may read-hold a given
 \apipx{pthread_rwlock_t}, at least while there is no thread
 currently write-holding it.
 
-As you might expect, reader-writer locks are designed for read-mostly
+As you might expect, \IXhpl{reader-writer}{lock} are designed for read-mostly
 situations.
 In these situations, a reader-writer lock can provide greater scalability
-than can an exclusive lock because the exclusive lock is by definition
+than can an \IXh{exclusive}{lock} because the exclusive lock is by definition
 limited to a single thread holding the lock at any given time, while
 the reader-writer lock permits
 an arbitrarily large number of readers to concurrently hold the lock.
@@ -896,8 +896,8 @@ Given ideal hardware and software scalability, this value will always
 be 1.0.
 
 As can be seen in the figure, reader-writer locking scalability is
-decidedly non-ideal, especially for smaller sizes of critical
-sections.
+decidedly non-ideal, especially for smaller sizes of \IXpl{critical
+section}.
 To see why read-acquisition can be so slow, consider
 that all the acquiring threads must update the \co{pthread_rwlock_t}
 data structure.
@@ -973,7 +973,7 @@ Figure~\ref{fig:toolsoftrade:Reader-Writer Lock Scalability vs. Microseconds in
 shows that the overhead of reader-writer locking is most severe for the
 smallest critical sections, so it would be nice to have some other way
 of protecting tiny critical sections.
-One such way uses atomic operations.
+One such way uses \IX{atomic} operations.
 \begin{fcvref}[ln:toolsoftrade:rwlockscale:reader:reader]
 We have seen an atomic operation already, namely the
 \apig{__sync_fetch_and_add()} primitive on \clnref{atmc_inc} of
@@ -1107,7 +1107,7 @@ intrinsic \apialtg{__atomic_store_n(&x, v, __ATOMIC_RELAXED)}{__atomic_store_n()
 \subsection{Atomic Operations (C11)}
 \label{sec:toolsoftrade:Atomic Operations (C11)}
 
-The C11 standard added atomic operations,
+The C11 standard added \IX{atomic} operations,
 including loads (\apic{atomic_load()}),
 stores (\apic{atomic_store()}),
 memory barriers (\apic{atomic_thread_fence()} and
@@ -1139,7 +1139,7 @@ is vaguely similar to the Linux kernel's ``\apik{READ_ONCE()}''.\footnote{
 
 One restriction of the C11 atomics is that they apply only to special
 atomic types, which can be problematic.
-The \GNUC\ compiler therefore provides atomic intrinsics, including
+The \GNUC\ compiler therefore provides \IX{atomic} intrinsics, including
 \apig{__atomic_load()},
 \apig{__atomic_load_n()},
 \apig{__atomic_store()},
@@ -1557,7 +1557,7 @@ Of course, where practical, the primitives described in
 Section~\ref{sec:toolsoftrade:Atomic Operations (gcc Classic)}
 or (especially)
 Section~\ref{sec:toolsoftrade:Atomic Operations (C11)}
-should instead be used to avoid data races, that is, to ensure
+should instead be used to avoid \IXpl{data race}, that is, to ensure
 that if there are multiple concurrent accesses to a given
 variable, all of those accesses are loads.
 
@@ -1565,7 +1565,7 @@ variable, all of those accesses are loads.
 \label{sec:toolsoftrade:Shared-Variable Shenanigans}
 \OriginallyPublished{Section}{sec:toolsoftrade:Shared-Variable Shenanigans}{Shared-Variable Shenanigans}{Linux Weekly News}{JadeAlglave2019WhoAfraidCompiler}
 %
-Given code that does plain loads and stores,\footnote{
+Given code that does \IXalt{plain loads and stores}{plain access},\footnote{
 	That is, normal loads and stores instead of C11 atomics, inline
 	assembly, or volatile accesses.}
 the compiler is within
@@ -2440,7 +2440,7 @@ Chapter~\ref{chp:Counting}.
 \subsection{Atomic Operations}
 \label{sec:toolsoftrade:Atomic Operations}
 
-The Linux kernel provides a wide variety of atomic operations, but
+The Linux kernel provides a wide variety of \IX{atomic} operations, but
 those defined on type \apik{atomic_t} provide a good start.
 Normal non-tearing reads and stores are provided by
 \apik{atomic_read()} and \apik{atomic_set()}, respectively.
@@ -2637,7 +2637,7 @@ a number of ways of concurrently accessing shared variables.
 All else being equal, the C11 standard operations described in
 Section~\ref{sec:toolsoftrade:Atomic Operations (C11)}
 should be your first stop.
-If you need to access a given shared variable both with plain accesses
+If you need to access a given shared variable both with \IXplx{plain access}{es}
 and atomically, then the modern \GCC\ atomics described in
 Section~\ref{sec:toolsoftrade:Atomic Operations (Modern gcc)}
 might work well for you.
-- 
2.17.1


