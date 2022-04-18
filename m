Return-Path: <SRS0=FK0K=U4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PjvyXEH9p0QeNTA9WDvRRj6QD4IfDusISsGz2jlfgbE=;
        b=i1LI7xvz91A76VPnLDTBKXR0bJDWdU9uZdZVFF6b9jxCFMnMFfD97pbA3KoyeYPtGi
         R4sEBt66/ZWcTtpXt7FGjo3kUHELz093DfZg1C16VUhqaJOylxhitAQi/FWk4ZWvfQhJ
         EMyJqXyrHRRz3ZiOkHEl4EFL43snsyxM2AzS9OY7n3MhzkvoXkmonUxmEFqwOBXDWUwy
         vevCBS83tbh8PhKRTsm0wYzvZi9XGWWdcpiKi513KbyEPZj5mMxJTpYJwUgtkgSdb/cf
         E1c6KgAkoFEvcTcjphHc7n9GZXQFRRJT8oZLba17mqA1e2qebBFv0KdU7aPNnLmnex6v
         YNUw==
Message-ID: <c435d3eb-3a19-5012-83f4-6d23b1cafc25@gmail.com>
Date: Mon, 18 Apr 2022 19:04:03 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/3] index: Add indexing tags to memory barrier
 related terms
Content-Language: en-US
References: <551bdf14-33c0-6876-6644-ff3494ad38f0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <551bdf14-33c0-6876-6644-ff3494ad38f0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

List of marked terms:

  - acquire load
  - release store
  - memory barrier
      full
      read
      write

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

If changes in toolsoftrade.tex and memorder.tex conflict badly with
your unpushed changes, I will respin.

        Thanks, Akira
--
 SMPdesign/criteria.tex               |  2 +-
 appendix/questions/after.tex         |  4 ++--
 appendix/toyrcu/toyrcu.tex           |  4 ++--
 appendix/whymb/whymemorybarriers.tex |  8 ++++----
 count/count.tex                      |  4 ++--
 cpu/overview.tex                     |  2 +-
 datastruct/datastruct.tex            |  2 +-
 defer/hazptr.tex                     |  2 +-
 defer/rcu.tex                        |  4 ++--
 defer/rcufundamental.tex             |  2 +-
 defer/whichtochoose.tex              |  3 ++-
 formal/spinhint.tex                  |  4 ++--
 future/cpu.tex                       |  2 +-
 locking/locking.tex                  |  2 +-
 memorder/memorder.tex                | 22 +++++++++++-----------
 together/refcnt.tex                  |  4 ++--
 toolsoftrade/toolsoftrade.tex        |  6 +++---
 17 files changed, 39 insertions(+), 38 deletions(-)

diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
index f73fc8aa..4834f7af 100644
--- a/SMPdesign/criteria.tex
+++ b/SMPdesign/criteria.tex
@@ -59,7 +59,7 @@ contention, overhead, read-to-write ratio, and complexity:
 	Therefore, any time consumed by these primitives
 	(including communication cache misses as well as
 	\IXh{message}{latency}, locking primitives, atomic instructions,
-	and memory barriers)
+	and \IXpl{memory barrier})
 	is overhead that does not contribute directly to the useful
 	work that the program is intended to accomplish.
 	Note that the important measure is the
diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index 36abbb6e..466ebabe 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -194,8 +194,8 @@ anything you do while holding that lock will appear to happen after
 anything done by any prior holder of that lock, at least give or
 take \IXacrl{tle}
 (see \cref{sec:future:Semantic Differences}).
-No need to worry about which CPU did or did not execute a memory
-barrier, no need to worry about the CPU or compiler reordering
+No need to worry about which CPU did or did not execute a \IX{memory
+barrier}, no need to worry about the CPU or compiler reordering
 operations---life is simple.
 Of course, the fact that this locking prevents these two pieces of
 code from running concurrently might limit the program's ability
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 2dbffbfc..d9196163 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -277,7 +277,7 @@ Similarly, \co{rcu_read_unlock()} executes a memory barrier to
 confine the RCU read-side critical section, then atomically
 decrements the counter.
 The \co{synchronize_rcu()} primitive spins waiting for the reference
-counter to reach zero, surrounded by memory barriers.
+counter to reach zero, surrounded by \IXpl{memory barrier}.
 The \co{poll()} on \clnref{sync:poll} merely provides pure delay, and from
 a pure RCU-semantics point of view could be omitted.
 Again, once \co{synchronize_rcu()} returns, all prior
@@ -981,7 +981,7 @@ straightforward.
 add the value one to the global free-running \co{rcu_gp_ctr}
 variable and stores the resulting odd-numbered value into the
 \co{rcu_reader_gp} per-thread variable.
-\Clnref{mb} executes a memory barrier to prevent the content of the
+\Clnref{mb} executes a \IX{memory barrier} to prevent the content of the
 subsequent RCU read-side critical section from ``leaking out''.
 \end{fcvref}
 
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 4af12749..aeaa4291 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -8,7 +8,7 @@
 	  Order in the court!}
 	 {\emph{Unknown}}
 
-So what possessed CPU designers to cause them to inflict memory barriers
+So what possessed CPU designers to cause them to inflict \IXBpl{memory barrier}
 on poor unsuspecting SMP software designers?
 
 In short, because reordering memory references allows much better performance,
@@ -1272,9 +1272,9 @@ with the store buffer.
 
 Many CPU architectures therefore provide weaker memory-barrier
 instructions that do only one or the other of these two.
-Roughly speaking, a ``read memory barrier'' marks only the invalidate
-queue (and snoops entries in the store buffer) and a ``write memory
-barrier'' marks only the store buffer, while a full-fledged memory
+Roughly speaking, a ``\IXBh{read}{memory barrier}'' marks only the invalidate
+queue (and snoops entries in the store buffer) and a ``\IXBh{write}{memory
+barrier}'' marks only the store buffer, while a full-fledged memory
 barrier does all of the above.
 
 The software-visible effect of these hardware mechanisms is that a read
diff --git a/count/count.tex b/count/count.tex
index d3263200..7e74d58f 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2417,8 +2417,8 @@ handler used in the theft process.
 \Clnref{check:REQ,return:n} check to see if
 the \co{theft} state is REQ, and, if not
 returns without change.
-\Clnref{mb:1} executes a memory barrier to ensure that the sampling of the
-theft variable happens before any change to that variable.
+\Clnref{mb:1} executes a \IX{memory barrier} to ensure that the sampling
+of the theft variable happens before any change to that variable.
 \Clnref{set:ACK} sets the \co{theft} state to ACK, and, if
 \clnref{check:fast} sees that
 this thread's fastpaths are not running, \clnref{set:READY} sets the \co{theft}
diff --git a/cpu/overview.tex b/cpu/overview.tex
index 4ee639b8..2858a141 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -246,7 +246,7 @@ as described in the next section.
 \subsection{Memory Barriers}
 \label{sec:cpu:Memory Barriers}
 
-Memory barriers will be considered in more detail in
+\IXpl{Memory barrier} will be considered in more detail in
 \cref{chp:Advanced Synchronization: Memory Ordering} and
 \cref{chp:app:whymb:Why Memory Barriers?}\@.
 In the meantime, consider the following simple lock-based \IX{critical
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 27f6b9a3..714795f7 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -668,7 +668,7 @@ Both show a change in slope at 224 CPUs, and this is due to hardware
 multithreading.
 At 32 and fewer CPUs, each thread has a core to itself.
 In this regime, RCU does better than does hazard pointers because the
-latter's read-side memory barriers result in dead time within the core.
+latter's read-side \IXpl{memory barrier} result in dead time within the core.
 In short, RCU is better able to utilize a core from a single hardware
 thread than is hazard pointers.
 
diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index cbb7c73e..84292466 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -148,7 +148,7 @@ maintains its own array, which is referenced by the per-thread variable
 \co{gplist}.
 If \clnref{check} determines that this thread has not yet allocated its
 \co{gplist}, \clnrefrange{alloc:b}{alloc:e} carry out the allocation.
-The memory barrier on \clnref{mb1} ensures that all threads see the
+The \IX{memory barrier} on \clnref{mb1} ensures that all threads see the
 removal of all objects by this thread before
 \clnrefrange{loop:b}{loop:e} scan
 all of the hazard pointers, accumulating non-NULL pointers into
diff --git a/defer/rcu.tex b/defer/rcu.tex
index 7909fce7..88e70873 100644
--- a/defer/rcu.tex
+++ b/defer/rcu.tex
@@ -18,8 +18,8 @@ The hazard pointers covered by
 \cref{sec:defer:Hazard Pointers}
 uses implicit counters in the guise of per-thread lists of pointer.
 This avoids read-side contention, but requires readers to do stores and
-conditional branches, as well as either full memory barriers in read-side
-primitives or real-time-unfriendly \IXacrlpl{ipi} in
+conditional branches, as well as either \IXhpl{full}{memory barrier}
+in read-side primitives or real-time-unfriendly \IXacrlpl{ipi} in
 update-side primitives.\footnote{
 	In some important special cases, this extra work can be avoided
 	by using link counting as exemplified by the UnboundedQueue
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index d7695a1c..87dfaa95 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -136,7 +136,7 @@ The coding restrictions are described in more detail in
 \cref{sec:memorder:Address- and Data-Dependency Difficulties},
 however, the common case of field selection (\qtco{->}) works quite well.
 Software that does not require the ultimate in read-side performance
-can instead use C11 acquire loads, which provide the needed ordering and
+can instead use C11 \IXpl{acquire load}, which provide the needed ordering and
 more, albeit at a cost.
 It is hoped that lighter-weight compiler support for \co{rcu_dereference()}
 will appear in due course.
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index e8eda251..b89e88a4 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -287,7 +287,8 @@ the read-side overhead of these techniques.
 The overhead of reference counting can be quite large, with
 contention among readers along with a fully ordered read-modify-write
 atomic operation required for each and every object traversed.
-Hazard pointers incur the overhead of a memory barrier for each data element
+Hazard pointers incur the overhead of a \IX{memory barrier}
+for each data element
 traversed, and sequence locks incur the overhead of a pair of memory barriers
 for each attempt to execute the critical section.
 The overhead of RCU implementations vary from nothing to that of a pair of
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 52b19d33..66d4c964 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -398,8 +398,8 @@ The following tricks can help you to abuse Promela safely:
 \begin{enumerate}
 \item	Memory reordering.
 	Suppose you have a pair of statements copying globals x and y
-	to locals r1 and r2, where ordering matters
-	(e.g., unprotected by locks), but where you have no memory barriers.
+	to locals r1 and r2, where ordering matters (e.g., unprotected
+	by locks), but where you have no \IXpl{memory barrier}.
 	This can be modeled in Promela as follows:
 
 \begin{VerbatimN}[samepage=true]
diff --git a/future/cpu.tex b/future/cpu.tex
index dd4b959f..183731b9 100644
--- a/future/cpu.tex
+++ b/future/cpu.tex
@@ -80,7 +80,7 @@ As was said in 2004~\cite{PaulEdwardMcKenneyPhD}:
 	Alles'', literally, uniprocessors above all else.
 
 	These uniprocessor systems would be subject only to instruction
-	overhead, since memory barriers, cache thrashing, and contention
+	overhead, since \IXpl{memory barrier}, cache thrashing, and contention
 	do not affect single-CPU systems.
 	In this scenario, RCU is useful only for niche applications, such
 	as interacting with \IXacrpl{nmi}.
diff --git a/locking/locking.tex b/locking/locking.tex
index e8477f6d..14690b19 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1099,7 +1099,7 @@ shuttle between CPUs~0 and~1, bypassing CPUs~2--7.
 \subsection{Inefficiency}
 \label{sec:locking:Inefficiency}
 
-Locks are implemented using atomic instructions and memory barriers,
+Locks are implemented using atomic instructions and \IXpl{memory barrier},
 and often involve cache misses.
 As we saw in \cref{chp:Hardware and its Habits},
 these instructions are quite expensive, roughly two
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index cb91de93..60dcbdaf 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -339,7 +339,7 @@ This is the subject of the next section.
 
 It turns out that there are compiler directives and synchronization
 primitives (such as locking and RCU) that are responsible for maintaining
-the illusion of ordering through use of \emph{memory barriers} (for
+the illusion of ordering through use of \emph{\IXBpl{memory barrier}} (for
 example, \co{smp_mb()} in the Linux kernel).
 These memory barriers can be explicit instructions, as they are on
 \ARM, \Power{}, Itanium, and Alpha, or they can be implied by other instructions,
@@ -361,7 +361,7 @@ ordering works, read on!
 The first stop on the journey is
 \cref{lst:memorder:Memory Ordering: Store-Buffering Litmus Test}
 (\path{C-SB+o-mb-o+o-mb-o.litmus}),
-which places an \co{smp_mb()} Linux-kernel full memory barrier between
+which places an \co{smp_mb()} Linux-kernel \IXh{full}{memory barrier} between
 the store and load in both \co{P0()} and \co{P1()}, but is otherwise
 identical to
 \cref{lst:memorder:Memory Misordering: Store-Buffering Litmus Test}.
@@ -609,7 +609,7 @@ are at most two threads involved.
 	reordered against later stores, which brings us to the remaining
 	rows in this table.
 
-	The \co{smp_mb()} row corresponds to the full memory barrier
+	The \co{smp_mb()} row corresponds to the \IXh{full}{memory barrier}
 	available on most platforms, with Itanium being the exception
 	that proves the rule.
 	However, even on Itanium, \co{smp_mb()} provides full ordering
@@ -1420,7 +1420,7 @@ concurrent code.
 is similar to
 \cref{lst:memorder:Enforcing Ordering of Load-Buffering Litmus Test},
 except that \co{P1()}'s ordering between \clnref{ld,st} is
-enforced not by an acquire load, but instead by a data dependency:
+enforced not by an \IX{acquire load}, but instead by a data dependency:
 The value loaded by \clnref{ld} is what \clnref{st} stores.
 The ordering provided by this data dependency is sufficient to prevent
 the \co{exists} clause from triggering.
@@ -2865,7 +2865,7 @@ break them.
 The rules and examples in this section are intended to help you
 prevent your compiler's ignorance from breaking your code.
 
-A load-load control dependency requires a full read memory barrier,
+A load-load control dependency requires a full \IXh{read}{memory barrier},
 not simply a data dependency barrier.
 Consider the following bit of code:
 
@@ -2955,7 +2955,7 @@ to~\co{y}, which means that the CPU is within its rights to reorder them:
 The conditional is absolutely required, and must be present in the
 assembly code even after all compiler optimizations have been applied.
 Therefore, if you need ordering in this example, you need explicit
-memory-ordering operations, for example, a release store:
+memory-ordering operations, for example, a \IX{release store}:
 
 \begin{VerbatimN}
 q = READ_ONCE(x);
@@ -3345,7 +3345,7 @@ This result indicates that the \co{exists} clause can be satisfied, that
 is, that the final value of both \co{P0()}'s and \co{P1()}'s \co{r1} variable
 can be zero.
 This means that neither \co{spin_lock()} nor \co{spin_unlock()}
-are required to act as a full memory barrier.
+are required to act as a \IXh{full}{memory barrier}.
 
 However, other environments might make other choices.
 For example, locking implementations that run only on the x86 CPU
@@ -4048,7 +4048,7 @@ end of \co{P0()}'s grace period, which in turn would prevent \co{P2()}'s
 read from \co{x0} from preceding \co{P0()}'s write, as depicted by the
 red dashed arrow in
 \cref{fig:memorder:Cycle for One RCU Grace Period; Two RCU Readers; and Memory Barrier}.
-In this case, RCU and the full memory barrier work together to forbid
+In this case, RCU and the \IXh{full}{memory barrier} work together to forbid
 the cycle, with RCU preserving ordering between \co{P0()} and both
 \co{P1()} and \co{P2()}, and with the \co{smp_mb()} preserving
 ordering between \co{P1()} and \co{P2()}.
@@ -4241,13 +4241,13 @@ Therefore,
 Linux provides a carefully chosen least-common-denominator
 set of memory-ordering primitives, which are as follows:
 \begin{description}
-\item	[\tco{smp_mb()}] (full memory barrier) that orders both loads and
+\item	[\tco{smp_mb()}] (\IXh{full}{memory barrier}) that orders both loads and
 	stores.
 	This means that loads and stores preceding the memory barrier
 	will be committed to memory before any loads and stores
 	following the memory barrier.
-\item	[\tco{smp_rmb()}] (read memory barrier) that orders only loads.
-\item	[\tco{smp_wmb()}] (write memory barrier) that orders only stores.
+\item	[\tco{smp_rmb()}] (\IXh{read}{memory barrier}) that orders only loads.
+\item	[\tco{smp_wmb()}] (\IXh{write}{memory barrier}) that orders only stores.
 \item	[\tco{smp_mb__before_atomic()}] that forces ordering of accesses
 	preceding the \co{smp_mb__before_atomic()} against accesses following
 	a later RMW atomic operation.
diff --git a/together/refcnt.tex b/together/refcnt.tex
index 1963ddd2..132ad53f 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -116,8 +116,8 @@ combinations of mechanisms, as shown in
 This table
 divides reference-counting mechanisms into the following broad categories:
 \begin{enumerate}
-\item	Simple counting with neither atomic operations, memory
-	barriers, nor alignment constraints (``$-$'').
+\item	Simple counting with neither atomic operations,
+	\IXpl{memory barrier}, nor alignment constraints (``$-$'').
 \item	Atomic counting without memory barriers (``A'').
 \item	Atomic counting, with memory barriers required only on release
 	(``AM'').
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index d6662f8c..dc24571a 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1054,7 +1054,7 @@ problems~\cite{MauriceHerlihy90a}.
 	See \cref{chp:Counting} for some stark counterexamples.
 }\QuickQuizEnd
 
-The \apig{__sync_synchronize()} primitive issues a ``memory barrier'',
+The \apig{__sync_synchronize()} primitive issues a ``\IX{memory barrier}'',
 which constrains both the compiler's and the CPU's ability to reorder
 operations, as discussed in
 \cref{chp:Advanced Synchronization: Memory Ordering}.
@@ -2447,8 +2447,8 @@ The Linux kernel provides a wide variety of \IX{atomic} operations, but
 those defined on type \apik{atomic_t} provide a good start.
 Normal non-tearing reads and stores are provided by
 \apik{atomic_read()} and \apik{atomic_set()}, respectively.
-Acquire load is provided by \apik{smp_load_acquire()} and release
-store by \apik{smp_store_release()}.
+\IX{Acquire load} is provided by \apik{smp_load_acquire()} and
+\IX{release store} by \apik{smp_store_release()}.
 
 Non-value-returning fetch-and-add operations are provided by
 \apik{atomic_add()}, \apik{atomic_sub()}, \apik{atomic_inc()}, and
-- 
2.25.1


