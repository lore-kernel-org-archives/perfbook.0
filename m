Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231181AbhH3QMe (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 30 Aug 2021 12:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630339900;
        bh=7JK5IJuSfrxwyaJ8rIOc/TMyUjNH0rwiaA6HqOOZ5Bk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=pkaYPSbOVsDIf2UEGMjfqXIzZGQv+KL9UhQIT1f9KTH8G9/LaHZBolTrZohufsRLG
         x3rRRnwcNB19KbYHoENVZ5jOmj99iaZZRlBUFF7R5wIv9N0PCC3Ohwj5vQBiNLGdaE
         n10z1RxlCo/JlUUnMzgZdORMX5c3X6EmYF0Kpyp++XBLQj8gy376z+8ySkH22Lmy5d
         fjoHtavZ7/svAyC0/5d5rjwlhVdtNzRD53plg67lizEcUI24Dg16x6bJ4oCFbidkLh
         zPE6EhuzfnmctngWQn1d3jQGuIqdbRmAT+pS16Us8lOnyjpLIbctw11KVoEFSdynBS
         QIkDtJYj95/tg==
Date: Mon, 30 Aug 2021 09:11:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] index: Add index and acronym tags, take two
Message-ID: <20210830161140.GS4156@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <44e16109-fbfc-a4a0-f439-1c92433e25b6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44e16109-fbfc-a4a0-f439-1c92433e25b6@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Aug 30, 2021 at 11:24:24PM +0900, Akira Yokosawa wrote:
> Add index markers to terms listed below:
> 
>   o Amdarl's Law
>   o cbmc (acronym)
>   o efficiency
>     - energy
>   o false sharing
>   o fragmentation
>   o grace period
>   o hazard pointer
>   o hot spot
>   o invalidation
>   o latency
>     - cache-invalidation
>     - grace-priod
>     - message
>     - scheduling
>   o linearizable
>   o memory consistency
>     - process (process consistency)
>     - sequential (sequential consistency)
>     - weak (weak consistency)
>   o Nidhugg
>   o NUCA (acronym)
>   o NUMA (acronym)
>   o overhead
>   o performance
>   o race condition
>   o scalability
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> "Take one" was back in April:
> 
>     de25a117a9c6 ("index: Add index and acronym tags, take one")
> 
> "Take three" should follow in a month or so.

Nice!  Queued and pushed, thank you!  The comments on the various forms
of the IX command in perfbook-lt.tex are very helpful, by the way,
so thank you for that as well.

							Thanx, Paul

>         Thanks, Akira
> --
>  SMPdesign/SMPdesign.tex                   |  8 ++++----
>  SMPdesign/beyond.tex                      |  4 ++--
>  SMPdesign/criteria.tex                    |  4 ++--
>  SMPdesign/partexercises.tex               |  4 ++--
>  advsync/advsync.tex                       |  4 ++--
>  advsync/rt.tex                            |  6 +++---
>  appendix/questions/concurrentparallel.tex |  4 ++--
>  appendix/toyrcu/toyrcu.tex                |  6 +++---
>  appendix/whymb/whymemorybarriers.tex      |  8 ++++----
>  count/count.tex                           |  2 +-
>  cpu/overheads.tex                         | 10 +++++-----
>  cpu/overview.tex                          |  4 ++--
>  datastruct/datastruct.tex                 | 16 ++++++++--------
>  debugging/debugging.tex                   | 10 +++++-----
>  defer/hazptr.tex                          |  2 +-
>  defer/rcuapi.tex                          |  6 +++---
>  defer/rcufundamental.tex                  |  2 +-
>  defer/rcuintro.tex                        |  4 ++--
>  defer/rcurelated.tex                      |  8 ++++----
>  defer/whichtochoose.tex                   |  4 ++--
>  formal/axiomatic.tex                      |  2 +-
>  formal/dyntickrcu.tex                     |  2 +-
>  formal/formal.tex                         |  2 +-
>  formal/sat.tex                            |  4 ++--
>  formal/spinhint.tex                       | 12 ++++++------
>  formal/stateless.tex                      |  2 +-
>  future/cpu.tex                            |  6 +++---
>  future/formalregress.tex                  |  5 +++--
>  future/htm.tex                            |  4 ++--
>  future/tm.tex                             |  4 ++--
>  glossary.tex                              |  4 ++--
>  glsdict.tex                               |  1 +
>  intro/intro.tex                           |  6 +++---
>  locking/locking-existence.tex             |  2 +-
>  locking/locking.tex                       |  6 +++---
>  memorder/memorder.tex                     | 11 ++++++-----
>  together/applyrcu.tex                     |  2 +-
>  together/hazptr.tex                       |  2 +-
>  together/refcnt.tex                       |  2 +-
>  together/seqlock.tex                      |  3 ++-
>  40 files changed, 101 insertions(+), 97 deletions(-)
> 
> diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> index 6d53309f..3d58582d 100644
> --- a/SMPdesign/SMPdesign.tex
> +++ b/SMPdesign/SMPdesign.tex
> @@ -451,7 +451,7 @@ bucket from being freed during the time that its lock was being acquired.
>  		reference counter, or a global array of reference counters.
>  		These have strengths and limitations similar to those
>  		called out above for locks.
> -	\item	Use \emph{hazard pointers}~\cite{MagedMichael04a}, which
> +	\item	Use \emph{\IXpl{hazard pointer}}~\cite{MagedMichael04a}, which
>  		can be thought of as an inside-out reference count.
>  		Hazard-pointer-based algorithms maintain a per-thread list of
>  		pointers, so that the appearance of a given pointer on
> @@ -525,7 +525,7 @@ Data ownership might seem arcane, but it is used very frequently:
>  If there is significant sharing, communication between the threads
>  or CPUs can result in significant complexity and overhead.
>  Furthermore, if the most-heavily used data happens to be that owned
> -by a single CPU, that CPU will be a ``hot spot'', sometimes with
> +by a single CPU, that CPU will be a ``\IX{hot spot}'', sometimes with
>  results resembling that shown in \cref{fig:SMPdesign:Data and Skew}.
>  However, in situations where no sharing is required, data ownership
>  achieves ideal performance, and with code that can be as simple
> @@ -566,7 +566,7 @@ a mathematical synchronization\-/efficiency viewpoint.
>  Readers who are uninspired by mathematics might choose to skip
>  this section.
>  
> -The approach is to use a crude queueing model for the efficiency of
> +The approach is to use a crude queueing model for the \IX{efficiency} of
>  synchronization mechanism that operate on a single shared global
>  variable, based on an M/M/1 queue.
>  M/M/1 queuing models are based on an exponentially distributed
> @@ -1336,7 +1336,7 @@ First, real-world allocators are required to handle a wide range
>  of allocation sizes, as opposed to the single size shown in this
>  toy example.
>  One popular way to do this is to offer a fixed set of sizes, spaced
> -so as to balance external and internal fragmentation, such as in
> +so as to balance external and internal \IX{fragmentation}, such as in
>  the late-1980s BSD memory allocator~\cite{McKusick88}.
>  Doing this would mean that the ``globalmem'' variable would need
>  to be replicated on a per-size basis, and that the associated
> diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
> index f533ba0d..f628ff55 100644
> --- a/SMPdesign/beyond.tex
> +++ b/SMPdesign/beyond.tex
> @@ -526,13 +526,13 @@ Compiling all three algorithms with -O3 gives results similar to
>  (albeit faster than) those shown in
>  \cref{fig:SMPdesign:CDF of SEQ/PWQ and SEQ/PART Solution-Time Ratios},
>  except that PWQ provides almost no speedup compared
> -to SEQ, in keeping with Amdahl's Law~\cite{GeneAmdahl1967AmdahlsLaw}.
> +to SEQ, in keeping with \IXr{Amdahl's Law}~\cite{GeneAmdahl1967AmdahlsLaw}.
>  However, if the goal is to double performance compared to unoptimized
>  SEQ, as opposed to achieving optimality, compiler
>  optimizations are quite attractive.
>  
>  Cache alignment and padding often improves performance by reducing
> -false sharing.
> +\IX{false sharing}.
>  However, for these maze-solution algorithms, aligning and padding the
>  maze-cell array \emph{degrades} performance by up to 42\,\% for 1000x1000 mazes.
>  Cache locality is more important than avoiding
> diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
> index a3f9bc66..f73fc8aa 100644
> --- a/SMPdesign/criteria.tex
> +++ b/SMPdesign/criteria.tex
> @@ -58,7 +58,7 @@ contention, overhead, read-to-write ratio, and complexity:
>  	program would not need any synchronization primitives.
>  	Therefore, any time consumed by these primitives
>  	(including communication cache misses as well as
> -	message latency, locking primitives, atomic instructions,
> +	\IXh{message}{latency}, locking primitives, atomic instructions,
>  	and memory barriers)
>  	is overhead that does not contribute directly to the useful
>  	work that the program is intended to accomplish.
> @@ -129,7 +129,7 @@ parallel program.
>  \begin{enumerate}
>  \item	The less time a program spends in exclusive-lock critical sections,
>  	the greater the potential speedup.
> -	This is a consequence of Amdahl's Law~\cite{GeneAmdahl1967AmdahlsLaw}
> +	This is a consequence of \IXr{Amdahl's Law}~\cite{GeneAmdahl1967AmdahlsLaw}
>  	because only one CPU may execute within a given
>  	exclusive-lock critical section at a given time.
>  
> diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
> index cd609505..6f9622c1 100644
> --- a/SMPdesign/partexercises.tex
> +++ b/SMPdesign/partexercises.tex
> @@ -454,7 +454,7 @@ the left-hand index on \clnref{lidx}, the right-hand lock on \clnref{rlock}
>  the right-hand index on \clnref{ridx}, and, finally, the hashed array
>  of simple lock-based double-ended queues on \clnref{bkt}.
>  A high-performance implementation would of course use padding or special
> -alignment directives to avoid false sharing.
> +alignment directives to avoid \IX{false sharing}.
>  \end{fcvref}
>  
>  \begin{listing}
> @@ -780,7 +780,7 @@ In contrast, the double-ended
>  queue implementations are examples of ``vertical parallelism'' or
>  ``pipelining'', given that data moves from one thread to another.
>  The tighter coordination required for pipelining in turn requires
> -larger units of work to obtain a given level of efficiency.
> +larger units of work to obtain a given level of \IX{efficiency}.
>  
>  \QuickQuizSeries{%
>  \QuickQuizB{
> diff --git a/advsync/advsync.tex b/advsync/advsync.tex
> index f8750250..abbf353a 100644
> --- a/advsync/advsync.tex
> +++ b/advsync/advsync.tex
> @@ -81,7 +81,7 @@ them, please re-read
>  	 {\emph{Robert A. Heinlein}}
>  
>  The term \IXacrfst{nbs}~\cite{MauriceHerlihy90a}
> -describes seven classes of linearizable algorithms with differing
> +describes seven classes of \IX{linearizable} algorithms with differing
>  \emph{\IXpl{forward-progress guarantee}}~\cite{DanAlitarh2013PracticalProgress},
>  which are as follows:
>  
> @@ -364,7 +364,7 @@ largely orthogonal to those that form the basis of real-time programming:
>  \begin{enumerate}
>  \item	Real-time forward-progress guarantees usually have some
>  	definite time associated with them, for example,
> -	``scheduling latency must be less than 100 microseconds.''
> +	``\IXh{scheduling}{latency} must be less than 100 microseconds.''
>  	In contrast, the most popular forms of NBS only guarantees
>  	that progress will be made in finite time, with no definite
>  	bound.
> diff --git a/advsync/rt.tex b/advsync/rt.tex
> index 24ba2a66..b82153d9 100644
> --- a/advsync/rt.tex
> +++ b/advsync/rt.tex
> @@ -404,7 +404,7 @@ In any case, careful choices of hardware, drivers, and software
>  configuration would be required to support phase~4's more severe
>  requirements.
>  
> -A key advantage of this phase-by-phase approach is that the latency
> +A key advantage of this phase-by-phase approach is that the \IX{latency}
>  budgets can be broken down, so that the application's various components
>  can be developed independently, each with its own latency budget.
>  Of course, as with any other kind of budget, there will likely be the
> @@ -1275,7 +1275,7 @@ A preemptible RCU implementation was therefore added to the Linux kernel.
>  This implementation avoids the need to individually track the state of
>  each and every task in the kernel by keeping lists of tasks that have
>  been preempted within their current RCU read-side critical sections.
> -A grace period is permitted to end:
> +A \IX{grace period} is permitted to end:
>  \begin{enumerate*}[(1)]
>  \item Once all CPUs have completed any RCU read-side critical sections
>  that were in effect before the start of the current grace period and
> @@ -1895,7 +1895,7 @@ temperature, humidity, and barometric pressure.
>  The real-time response constraints on this program are so severe that
>  it is not permissible to spin or block, thus ruling out locking,
>  nor is it permissible to use a retry loop, thus ruling out sequence locks
> -and hazard pointers.
> +and \IXpl{hazard pointer}.
>  Fortunately, the temperature and pressure are normally controlled,
>  so that a default hard-coded set of data is usually sufficient.
>  
> diff --git a/appendix/questions/concurrentparallel.tex b/appendix/questions/concurrentparallel.tex
> index b8bf8116..0ffc1119 100644
> --- a/appendix/questions/concurrentparallel.tex
> +++ b/appendix/questions/concurrentparallel.tex
> @@ -50,8 +50,8 @@ One could argue that we should simply demand a reasonable level of
>  competence from the scheduler, so that we could simply ignore any
>  distinctions between parallelism and concurrency.
>  Although this is often a good strategy,
> -there are important situations where efficiency,
> -performance, and scalability concerns sharply limit the level
> +there are important situations where \IX{efficiency},
> +\IX{performance}, and \IX{scalability} concerns sharply limit the level
>  of competence that the scheduler can reasonably offer.
>  One important example is when the scheduler is implemented in
>  hardware, as it often is in SIMD units or GPGPUs.
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index b84755e3..0824fdd3 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex
> @@ -69,7 +69,7 @@ to participate in \IXpl{deadlock cycle}.
>  Furthermore, in absence of recursive locks,
>  RCU read-side critical sections cannot be nested, and, finally,
>  although concurrent RCU updates could in principle be satisfied by
> -a common grace period, this implementation serializes grace periods,
> +a common \IX{grace period}, this implementation serializes grace periods,
>  preventing grace-period sharing.
>  
>  \QuickQuizSeries{%
> @@ -435,7 +435,7 @@ New readers that arrive after the complement operation will increment
>  RCU read-side critical sections.
>  This means that the value of \co{rcu_refcnt[0]} will no longer be incremented,
>  and thus will be monotonically decreasing.\footnote{
> -	There is a race condition that this ``monotonically decreasing''
> +	There is a \IX{race condition} that this ``monotonically decreasing''
>  	statement ignores.
>  	This race condition will be dealt with by the code for
>  	\co{synchronize_rcu()}.
> @@ -1036,7 +1036,7 @@ all are either even (\clnref{even}) or are greater than the global
>  \co{rcu_gp_ctr} (\clnrefrange{gt1}{gt2}).
>  \Clnref{poll} blocks for a short period of time to wait for a
>  pre-existing RCU read-side critical section, but this can be replaced with
> -a spin-loop if grace-period latency is of the essence.
> +a spin-loop if \IXh{grace-period}{latency} is of the essence.
>  Finally, the memory barrier at \clnref{mb3} ensures that any subsequent
>  destruction will not be reordered into the preceding loop.
>  \end{fcvref}
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index 25d2c8f5..b49d5fe8 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -205,7 +205,7 @@ What happens when it does a write?
>  Because it is important that all CPUs agree on the value of a given
>  data item, before a given CPU writes to that data item, it must first
>  cause it to be removed, or ``invalidated'', from other CPUs' caches.
> -Once this invalidation has completed, the CPU may safely modify the
> +Once this \IX{invalidation} has completed, the CPU may safely modify the
>  data item.
>  If the data item was present in this CPU's cache, but was read-only,
>  this process is termed a ``\IXalth{write miss}{write}{cache miss}''.
> @@ -955,7 +955,7 @@ involve lots of complex steps in silicon.
>  Unfortunately, each store buffer must be relatively small, which means
>  that a CPU executing a modest sequence of stores can fill its store
>  buffer (for example, if all of them result in cache misses).
> -At that point, the CPU must once again wait for invalidations to complete
> +At that point, the CPU must once again wait for \IXpl{invalidation} to complete
>  in order to drain its store buffer before it can continue executing.
>  This same situation can arise immediately after a memory barrier, when
>  \emph{all} subsequent store instructions must wait for invalidations to
> @@ -1020,7 +1020,7 @@ as discussed in the next section.
>  
>  Let us suppose that CPUs queue invalidation requests, but respond to
>  them immediately.
> -This approach minimizes the cache-invalidation latency seen by CPUs
> +This approach minimizes the \IXh{cache-invalidation}{latency} seen by CPUs
>  doing stores, but can defeat memory barriers, as seen in the following
>  example.
>  
> @@ -1355,7 +1355,7 @@ constraints~\cite{PaulMcKenney2005i,PaulMcKenney2005j}:
>  	please keep this scenario in mind!
>  }\QuickQuizEnd
>  
> -Imagine a large non-uniform cache architecture (NUCA) system that,
> +Imagine a large \IXacrf{nuca} system that,
>  in order to provide fair allocation
>  of interconnect bandwidth to CPUs in a given node, provided per-CPU
>  queues in each node's interconnect interface, as shown in
> diff --git a/count/count.tex b/count/count.tex
> index 14ae9a36..a9a36b27 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -795,7 +795,7 @@ value of the counter and exiting threads.
>  	Finally, variable-length data structures such as linked
>  	lists can be used, as is done in the userspace RCU
>  	library~\cite{MathieuDesnoyers2009URCU,MathieuDesnoyers2012URCU}.
> -	This last approach can also reduce false sharing in some cases.
> +	This last approach can also reduce \IX{false sharing} in some cases.
>  }\QuickQuizEnd
>  
>  \begin{fcvref}[ln:count:count_end:whole:inc]
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index caedd9e9..84360256 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -9,7 +9,7 @@
>  	  low-level software in ignorance of the underlying hardware.}
>  	 {\emph{Unknown}}
>  
> -This section presents actual overheads of the obstacles to performance
> +This section presents actual \IXpl{overhead} of the obstacles to performance
>  listed out in the previous section.
>  However, it is first necessary to get a rough view of hardware system
>  architecture, which is the subject of the next section.
> @@ -472,7 +472,7 @@ InfiniBand or any number of proprietary interconnects, has a latency
>  of roughly five microseconds for an end-to-end round trip, during which
>  time more than \emph{ten thousand} instructions might have been executed.
>  Standards-based communications networks often require some sort of
> -protocol processing, which further increases the latency.
> +protocol processing, which further increases the \IX{latency}.
>  Of course, geographic distance also increases latency, with the
>  speed-of-light through optical fiber latency around the world coming to
>  roughly 195 \emph{milliseconds}, or more than 400 million clock
> @@ -528,7 +528,7 @@ accessing memory sequentially.
>  For example, given a 64-byte cacheline and software accessing 64-bit
>  variables, the first access will still be slow due to speed-of-light
>  delays (if nothing else), but the remaining seven can be quite fast.
> -However, this optimization has a dark side, namely false sharing,
> +However, this optimization has a dark side, namely \IX{false sharing},
>  which happens when different variables in the same cacheline are
>  being updated by different CPUs, resulting in a high cache-miss rate.
>  Software can use the alignment directives available in many compilers
> @@ -571,8 +571,8 @@ computing needs more than a bit of rework!
>  A fifth hardware optimization is large caches, allowing individual
>  CPUs to operate on larger datasets without incurring expensive cache
>  misses.
> -Although large caches can degrade energy efficiency and cache-miss
> -latency, the ever-growing cache sizes on production microprocessors
> +Although large caches can degrade \IXh{energy}{efficiency} and \IXh{cache-miss}
> +{latency}, the ever-growing cache sizes on production microprocessors
>  attests to the power of this optimization.
>  
>  A final hardware optimization is read-mostly replication, in which
> diff --git a/cpu/overview.tex b/cpu/overview.tex
> index c68b0756..4ee639b8 100644
> --- a/cpu/overview.tex
> +++ b/cpu/overview.tex
> @@ -141,7 +141,7 @@ from memory than it did to execute an instruction.
>  More recently, microprocessors might execute hundreds or even thousands
>  of instructions in the time required to access memory.
>  This disparity is due to the fact that \IXr{Moore's Law} has increased CPU
> -performance at a much greater rate than it has decreased memory latency,
> +performance at a much greater rate than it has decreased memory \IX{latency},
>  in part due to the rate at which memory sizes have grown.
>  For example, a typical 1970s minicomputer might have 4\,KB (yes, kilobytes,
>  not megabytes, let alone gigabytes or terabytes) of main memory, with
> @@ -277,7 +277,7 @@ memory barriers almost always reduce performance, as depicted in
>  \cref{fig:cpu:CPU Meets a Memory Barrier}.
>  
>  As with atomic operations, CPU designers have been working hard to
> -reduce memory-barrier overhead, and have made substantial progress.
> +reduce \IXh{memory-barrier}{overhead}, and have made substantial progress.
>  
>  \subsection{Cache Misses}
>  \label{sec:cpu:Cache Misses}
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index d703a741..317bec42 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -452,7 +452,7 @@ read-mostly cases where updates are rare, but could happen at any time.
>  \epigraph{Adapt the remedy to the disease.}{\emph{Chinese proverb}}
>  
>  Although partitioned data structures can offer excellent scalability,
> -NUMA effects can result in severe degradations of both performance and
> +\IXacr{numa} effects can result in severe degradations of both performance and
>  scalability.
>  In addition,
>  the need for read-side synchronization can degrade performance in
> @@ -460,7 +460,7 @@ read-mostly situations.
>  However, we can achieve both performance and scalability by using
>  RCU, which was introduced in
>  \cref{sec:defer:Read-Copy Update (RCU)}.
> -Similar results can be achieved using hazard pointers
> +Similar results can be achieved using \IXpl{hazard pointer}
>  (\path{hazptr.c})~\cite{MagedMichael04a}, which will be included in
>  the performance results shown in this
>  section~\cite{McKenney:2013:SDS:2483852.2483867}.
> @@ -557,7 +557,7 @@ forward pointer intact, so that \co{hashtab_lookup()} can traverse
>  to the newly deleted element's successor.
>  
>  Of course, after invoking \co{hashtab_del()}, the caller must wait for
> -an RCU grace period (e.g., by invoking \co{synchronize_rcu()}) before
> +an RCU \IX{grace period} (e.g., by invoking \co{synchronize_rcu()}) before
>  freeing or otherwise reusing the memory for the newly deleted element.
>  
>  \subsection{RCU-Protected Hash Table Validation}
> @@ -679,7 +679,7 @@ second hardware thread in each core.
>  The slope of the hazard-pointers trace also decreases at 224 CPUs, but
>  less dramatically,
>  because the second hardware thread is able to fill in the time
> -that the first hardware thread is stalled due to memory-barrier latency.
> +that the first hardware thread is stalled due to \IXh{memory-barrier}{latency}.
>  As we will see in later sections, this second-hardware-thread
>  advantage depends on the workload.
>  
> @@ -757,7 +757,7 @@ to about half again faster than that of either QSBR or RCU\@.
>  	on \cpageref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
>  	shows that varying hash-table size has almost
>  	no effect?
> -	Might the problem instead be something like false sharing?
> +	Might the problem instead be something like \IX{false sharing}?
>  }\QuickQuizAnswer{
>  	Excellent question!
>  
> @@ -889,7 +889,7 @@ throughput.
>  Of course, a great many applications have good load-spreading
>  properties, and for these applications sharding works
>  quite well.
> -However, sharding does not handle ``hot spots'' very well, with
> +However, sharding does not handle ``\IXpl{hot spot}'' very well, with
>  the hot spot exemplified by Schr\"odinger's cat being but one case
>  in point.
>  
> @@ -2185,7 +2185,7 @@ Furthermore, even if you were content to run only on Linux, such a
>  self-modifying installation poses validation challenges.
>  For example, systems with 32-byte cachelines might work well, but
>  performance might suffer on systems with 64-byte cachelines due
> -to false sharing.
> +to \IX{false sharing}.
>  
>  Fortunately, there are some rules of thumb that work reasonably well in
>  practice, which were gathered into a 1995
> @@ -2241,7 +2241,7 @@ An additional set of rules of thumb deal with locks:
>  	that they protect.
>  	This approach means that the cache miss that brings the
>  	lock to the current CPU also brings its data.
> -\item	Protect read-mostly data with hazard pointers, RCU, or, for
> +\item	Protect read-mostly data with \IXpl{hazard pointer}, RCU, or, for
>  	long-duration critical sections, reader-writer locks.
>  \end{enumerate}
>  
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index 10b3f801..0e205617 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -699,7 +699,7 @@ scripts to analyze the voluminous output.
>  But beware---scripts will only notice what you tell them to.
>  My rcutorture scripts are a case in point:
>  Early versions of those scripts were quite satisfied with a test run
> -in which RCU grace periods stalled indefinitely.
> +in which RCU \IXpl{grace period} stalled indefinitely.
>  This of course resulted in the scripts being modified to detect RCU
>  grace-period stalls, but this does not change the fact that the scripts
>  will only detect problems that I make them detect.
> @@ -1660,7 +1660,7 @@ of a bug appearing, which
>  is why extremely lightweight tracing and assertion mechanism are
>  so critically important.
>  
> -The term ``heisenbug'' was inspired by the \pplsur{Weiner}{Heisenberg}
> +The term ``\IX{heisenbug}'' was inspired by the \pplsur{Weiner}{Heisenberg}
>  \IX{Uncertainty Principle} from quantum physics, which states that
>  it is impossible to
>  exactly quantify a given particle's position and velocity at any given
> @@ -1707,7 +1707,7 @@ Adding \co{printf()} statements will likely greatly reduce or even
>  eliminate the lost counts.
>  However, converting the load-add-store sequence to a load-add-delay-store
>  sequence will greatly increase the incidence of lost counts (try it!).
> -Once you spot a bug involving a race condition, it is frequently possible
> +Once you spot a bug involving a \IX{race condition}, it is frequently possible
>  to create an anti-heisenbug by adding delay in this manner.
>  
>  Of course, this begs the question of how to find the race condition in
> @@ -2147,7 +2147,7 @@ Unfortunately, it is often impractical for the following reasons:
>  Creating a benchmark that approximates
>  the application can help overcome these obstacles.
>  A carefully constructed benchmark can help promote performance,
> -scalability, energy efficiency, and much else besides.
> +scalability, \IXh{energy}{efficiency}, and much else besides.
>  However, be careful to avoid investing too much into the benchmarking
>  effort.
>  It is after all important to invest at least a little into the
> @@ -2291,7 +2291,7 @@ The remainder of this section looks at ways of resolving this conflict.
>  	Benchmarks sensitive to memory bandwidth (such as those involving
>  	matrix arithmetic) should spread the running threads across the
>  	available cores and sockets to maximize memory parallelism.
> -	They should also spread the data across NUMA nodes, memory
> +	They should also spread the data across \IXplr{NUMA node}, memory
>  	controllers, and DRAM chips to the extent possible.
>  	In contrast, benchmarks sensitive to memory latency (including
>  	most poorly scaling applications) should instead maximize
> diff --git a/defer/hazptr.tex b/defer/hazptr.tex
> index 08e133dc..824a36ec 100644
> --- a/defer/hazptr.tex
> +++ b/defer/hazptr.tex
> @@ -13,7 +13,7 @@ inside out, that is, rather than incrementing an integer stored in the
>  data element, instead store a pointer to that data element in
>  per-CPU (or per-thread) lists.
>  Each element of these lists is called a
> -\emph{hazard pointer}~\cite{MagedMichael04a}.\footnote{
> +\emph{\IX{hazard pointer}}~\cite{MagedMichael04a}.\footnote{
>  	Also independently invented by others~\cite{HerlihyLM02}.}
>  The value of a given data element's ``virtual reference counter'' can
>  then be obtained by counting the number of hazard pointers referencing
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index 2d645280..95dd0e02 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -191,9 +191,9 @@ The corresponding synchronous update-side primitives,
>  \co{synchronize_rcu()} and \co{synchronize_rcu_expedited()}, along with
>  their synonym \co{synchronize_net()}, wait for any type of currently
>  executing RCU read-side critical sections to complete.
> -The length of this wait is known as a ``grace period'', and
> -\co{synchronize_rcu_expedited()} is designed to reduce grace-period
> -latency at the expense of increased CPU overhead and IPIs.
> +The length of this wait is known as a ``\IX{grace period}'', and
> +\co{synchronize_rcu_expedited()} is designed to reduce \IXh{grace-period}
> +{latency} at the expense of increased CPU overhead and IPIs.
>  The asynchronous update-side primitive, \co{call_rcu()},
>  invokes a specified function with a specified argument after a
>  subsequent grace period.
> diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> index 4ee37d87..32e78c3c 100644
> --- a/defer/rcufundamental.tex
> +++ b/defer/rcufundamental.tex
> @@ -538,7 +538,7 @@ microphones, headsets, cameras, mice, printers, and much else besides.
>  Furthermore, the large number of Linux-kernel RCU API uses shown in
>  \cref{fig:defer:RCU Usage in the Linux Kernel},
>  combined with the Linux kernel's heavy use of reference counting
> -and with increasing use of hazard pointers in other projects, demonstrates
> +and with increasing use of \IXpl{hazard pointer} in other projects, demonstrates
>  that tolerance for such inconsistencies is more common than one might
>  imagine.
>  
> diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
> index 519f1627..d87c18c1 100644
> --- a/defer/rcuintro.tex
> +++ b/defer/rcuintro.tex
> @@ -207,7 +207,7 @@ code, then the corresponding CPU or thread is within a quiescent state,
>  in turn signaling the completion of any reader that might have access
>  to the newly removed data element.
>  Once all CPU's or thread's PCs have been observed to be outside of any
> -reader, the grace period has completed.
> +reader, the \IX{grace period} has completed.
>  Please note that this approach poses some serious challenges, including
>  memory ordering, functions that are \emph{sometimes} invoked from readers,
>  and ever-exciting code-motion optimizations.
> @@ -592,7 +592,7 @@ of an object, respectively.
>  These mechanisms distribute the work among read and
>  update paths in such a way as to make read paths extremely fast, using
>  replication and weakening optimizations in a manner similar to
> -hazard pointers, but without the need for read-side retries.
> +\IXpl{hazard pointer}, but without the need for read-side retries.
>  In some cases, including \co{CONFIG_PREEMPT=n} Linux kernels,
>  RCU's read-side primitives have zero overhead.
>  
> diff --git a/defer/rcurelated.tex b/defer/rcurelated.tex
> index 710bc603..28f013d6 100644
> --- a/defer/rcurelated.tex
> +++ b/defer/rcurelated.tex
> @@ -106,7 +106,7 @@ the overhead of grace periods while holding locks.
>  approach~\cite{MayaArbel2014RCUtree} to an RCU-protected search tree that,
>  like Masstree, allows concurrent updates.
>  This paper includes a proof of correctness, including proof that all
> -operations on this tree are linearizable.
> +operations on this tree are \IX{linearizable}.
>  Unfortunately, this implementation achieves linearizability by incurring
>  the full latency of grace-period waits while holding locks, which degrades
>  scalability of update-only workloads.
> @@ -191,7 +191,7 @@ grace periods.
>  	period, or using something like \co{call_rcu()}
>  	instead of waiting for a grace period?
>  }\QuickQuizAnswer{
> -	The authors wished to support linearizable tree
> +	The authors wished to support \IX{linearizable} tree
>  	operations, so that concurrent additions to, deletions
>  	from, and searches of the tree would appear to execute
>  	in some globally agreed-upon order.
> @@ -242,7 +242,7 @@ HTM and RCU to search trees~\cite{Siakavaras2017CombiningHA,DimitriosSiakavaras2
>  graphs~\cite{ChristinaGiannoula2018HTM-RCU-graphcoloring},
>  and
>  \ppl{SeongJae}{Park} et al.~have used HTM and RCU to optimize high-contention
> -locking on NUMA systems.
> +locking on \IXacr{numa} systems.
>  
>  \ppl{Alex}{Kogan} et al.~applied RCU to the construction of range locking
>  for scalable address spaces~\cite{AlexKogan2020RCUrangelocks}.
> @@ -273,7 +273,7 @@ RCU~\cite{MathieuDesnoyers2009URCU,MathieuDesnoyers2012URCU}.
>  \ppl{Lihao}{Liang} (University of Oxford), \pplmdl{Paul E.}{McKenney} (IBM),
>  \ppl{Daniel}{Kroening}, and \ppl{Tom}{Melham}
>  (both also Oxford)~\cite{LihaoLiang2016VerifyTreeRCU}
> -used the \IX{C bounded model checker (CBMC)}~\cite{EdmundClarke2004CBMC}
> +used the \IXacrf{cbmc}~\cite{EdmundClarke2004CBMC}
>  to produce a mechanical proof of correctness of a significant portion
>  of Linux-kernel Tree RCU\@.
>  \ppl{Lance}{Roy}~\cite{LanceRoy2017CBMC-SRCU} used CBMC to produce a similar
> diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
> index e1b5233a..e3ce4540 100644
> --- a/defer/whichtochoose.tex
> +++ b/defer/whichtochoose.tex
> @@ -21,7 +21,7 @@ and where elements might be added to and removed from the structure
>  at any location and at any time.
>  \Cref{sec:defer:Which to Choose? (Production Use)}
>  then points out a few publicly visible production uses of
> -hazard pointers, sequence locking, and RCU\@.
> +\IXpl{hazard pointer}, sequence locking, and RCU\@.
>  This discussion should help you to make an informed choice between
>  these techniques.
>  
> @@ -378,7 +378,7 @@ of RCU and reference counters.
>  RCU is used for short-lived references, which means that RCU read-side
>  critical sections can be short.
>  These short RCU read-side critical sections in turn mean that the corresponding
> -RCU grace periods can also be short, which limits the memory footprint.
> +RCU \IXpl{grace period} can also be short, which limits the memory footprint.
>  For the few data elements that need longer-lived references, reference
>  counting is used.
>  This means that the complexity of reference-acquisition failure only
> diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
> index 175af54e..bf5b8263 100644
> --- a/formal/axiomatic.tex
> +++ b/formal/axiomatic.tex
> @@ -285,7 +285,7 @@ referencing \co{y}, which in turn is initialized to the value
>  \co{P0()} on \clnrefrange{P0start}{P0end}
>  removes element \co{y} from the list by replacing it with element \co{z}
>  (\clnref{assignnewtail}),
> -waits for a grace period (\clnref{sync}),
> +waits for a \IX{grace period} (\clnref{sync}),
>  and finally zeroes \co{y} to emulate \co{free()} (\clnref{free}).
>  \co{P1()} on \clnrefrange{P1start}{P1end}
>  executes within an RCU read-side critical section
> diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
> index 5113fd09..bee5b4da 100644
> --- a/formal/dyntickrcu.tex
> +++ b/formal/dyntickrcu.tex
> @@ -23,7 +23,7 @@ RCU implementations disable preemption across RCU read-side
>  critical sections, resulting in excessive real-time latencies.
>  
>  However, one disadvantage of the older \rt\ implementation
> -was that each grace period
> +was that each \IX{grace period}
>  requires work to be done on each CPU, even if that CPU is in a low-power
>  ``dynticks-idle'' state,
>  and thus incapable of executing RCU read-side critical sections.
> diff --git a/formal/formal.tex b/formal/formal.tex
> index ac897b9e..86828d4a 100644
> --- a/formal/formal.tex
> +++ b/formal/formal.tex
> @@ -10,7 +10,7 @@
>  \OriginallyPublished{Chapter}{chp:Formal Verification}{Formal Verification}{Linux Weekly News}{PaulEMcKenney2007QRCUspin,PaulEMcKenney2008dynticksRCU,PaulEMcKenney2011ppcmem}
>  
>  Parallel algorithms can be hard to write, and even harder to debug.
> -Testing, though essential, is insufficient, as fatal race conditions
> +Testing, though essential, is insufficient, as fatal \IXpl{race condition}
>  can have extremely low probabilities of occurrence.
>  Proofs of correctness can be valuable, but in the end are just as
>  prone to human error as is the original algorithm.
> diff --git a/formal/sat.tex b/formal/sat.tex
> index cc85e4fc..c17d5c71 100644
> --- a/formal/sat.tex
> +++ b/formal/sat.tex
> @@ -25,14 +25,14 @@ available~\cite{Kroening:2008:DPA:1391237}.
>  \begin{figure}
>  \centering
>  \resizebox{2in}{!}{\includegraphics{formal/cbmc}}
> -\caption{CBMC Processing Flow}
> +\caption{\IXacr{cbmc} Processing Flow}
>  \label{fig:formal:CBMC Processing Flow}
>  \end{figure}
>  
>  In addition, front-end programs for SAT solvers can automatically translate
>  C code into logic expressions, taking assertions into account and generating
>  assertions for error conditions such as array-bounds errors.
> -One example is the C bounded model checker, or \co{cbmc}, which is
> +One example is the \IXacrl{cbmc}, or \co{cbmc}, which is
>  available as part of many Linux distributions.
>  This tool is quite easy to use, with \co{cbmc test.c} sufficing to
>  validate \path{test.c}, resulting in the processing flow shown in
> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
> index c1fe2d40..52b19d33 100644
> --- a/formal/spinhint.tex
> +++ b/formal/spinhint.tex
> @@ -29,10 +29,10 @@ applies Promela to early versions of RCU's dyntick-idle implementation.
>  \subsection{Promela and Spin}
>  \label{sec:formal:Promela and Spin}
>  
> -Promela is a language designed to help verify protocols, but which
> +\IX{Promela} is a language designed to help verify protocols, but which
>  can also be used to verify small parallel algorithms.
>  You recode your algorithm and correctness constraints in the C-like
> -language Promela, and then use Spin to translate it into a C program
> +language Promela, and then use \IX{Spin} to translate it into a C program
>  that you can compile and run.
>  The resulting program carries out a full state-space search of your
>  algorithm, either verifying or finding counter-examples for
> @@ -66,7 +66,7 @@ more complex uses.
>  
>  \begin{fcvref}[ln:formal:promela:increment:whole]
>  \Cref{lst:formal:Promela Code for Non-Atomic Increment}
> -demonstrates the textbook race condition
> +demonstrates the textbook \IX{race condition}
>  resulting from non-atomic increment.
>  \Clnref{nprocs} defines the number of processes to run (we will vary this
>  to see the effect on state space), \clnref{count} defines the counter,
> @@ -1204,10 +1204,10 @@ clearly untrustworthy.
>  	specialized in some way.
>  	For example, Promela does not handle realistic memory models
>  	(though they can be programmed into
> -	Promela~\cite{Desnoyers:2013:MSM:2506164.2506174}),
> -	CBMC~\cite{EdmundClarke2004CBMC} does not detect probabilistic
> +	\IX{Promela}~\cite{Desnoyers:2013:MSM:2506164.2506174}),
> +	\IXacr{cbmc}~\cite{EdmundClarke2004CBMC} does not detect probabilistic
>  	hangs and deadlocks, and
> -	Nidhugg~\cite{CarlLeonardsson2014Nidhugg} does not detect
> +	\IX{Nidhugg}~\cite{CarlLeonardsson2014Nidhugg} does not detect
>  	bugs involving data nondeterminism.
>  	But this means that these tools cannot be trusted to find
>  	bugs that they are not designed to locate.
> diff --git a/formal/stateless.tex b/formal/stateless.tex
> index ef393a60..06c09c18 100644
> --- a/formal/stateless.tex
> +++ b/formal/stateless.tex
> @@ -23,7 +23,7 @@ of whether less-exact approaches might find bugs in larger programs.
>  \end{figure}
>  
>  Although the jury is still out on this question, stateless model
> -checkers such as Nidhugg~\cite{CarlLeonardsson2014Nidhugg} have in
> +checkers such as \IX{Nidhugg}~\cite{CarlLeonardsson2014Nidhugg} have in
>  some cases handled larger programs~\cite{SMC-TreeRCU}, and with
>  similar ease of use, as illustrated by
>  \cref{fig:formal:Nidhugg Processing Flow}.
> diff --git a/future/cpu.tex b/future/cpu.tex
> index 27b0d796..dd4b959f 100644
> --- a/future/cpu.tex
> +++ b/future/cpu.tex
> @@ -113,7 +113,7 @@ Also from 2004~\cite{PaulEdwardMcKenneyPhD}:
>  	multithreaded CPUs are now standard for many desktop and laptop
>  	computer systems.
>  	The most aggressively multithreaded CPUs share all levels of
> -	cache hierarchy, thereby eliminating CPU-to-CPU memory latency,
> +	cache hierarchy, thereby eliminating CPU-to-CPU \IXh{memory}{latency},
>  	in turn greatly reducing the performance penalty for traditional
>  	synchronization mechanisms.
>  	However, a multithreaded CPU would still incur overhead due to
> @@ -220,8 +220,8 @@ And one more quote from 2004~\cite{PaulEdwardMcKenneyPhD}:
>  	increasing memory-latency ratios
>  	put RCU at an increasing disadvantage compared to other synchronization
>  	mechanisms.
> -	Since Linux has been observed with over 1,600 callbacks per grace
> -	period under heavy load~\cite{Sarma04c},
> +	Since Linux has been observed with over 1,600 callbacks per \IX{grace
> +	period} under heavy load~\cite{Sarma04c},
>  	it seems safe to say that Linux falls into the former category.
>  \end{quote}
>  
> diff --git a/future/formalregress.tex b/future/formalregress.tex
> index 789e1636..d5babe82 100644
> --- a/future/formalregress.tex
> +++ b/future/formalregress.tex
> @@ -70,7 +70,8 @@ mechanism---by hand.
>  As with Promela and \co{spin}, both PPCMEM and \co{herd} are
>  extremely useful, but they are not well-suited for regression suites.
>  
> -In contrast, \co{cbmc} and Nidhugg can input C programs of reasonable
> +In contrast, \IXaltacr{\co{cbmc}}{cbmc} and \IX{Nidhugg} can input
> +C programs of reasonable
>  (though still quite limited) size, and if their capabilities continue
>  to grow, could well become excellent additions to regression suites.
>  The Coverity static-analysis tool also inputs C programs, and of very
> @@ -138,7 +139,7 @@ It is critically important that formal-verification tools correctly
>  model their environment.
>  One all-too-common omission is the memory model, where a great
>  many formal-verification tools, including Promela/spin, are
> -restricted to sequential consistency.
> +restricted to \IXalth{sequential consistency}{sequential}{memory consistency}.
>  The QRCU experience related in
>  \cref{sec:formal:Is QRCU Really Correct?}
>  is an important cautionary tale.
> diff --git a/future/htm.tex b/future/htm.tex
> index c42ba49e..bf78d5ea 100644
> --- a/future/htm.tex
> +++ b/future/htm.tex
> @@ -117,7 +117,7 @@ that lock.
>  	If the lock is in the same cacheline as some of the variables
>  	that it is protecting, then writes to those variables by one CPU
>  	will invalidate that cache line for all the other CPUs.
> -	These invalidations will
> +	These \IXpl{invalidation} will
>  	generate large numbers of conflicts and retries, perhaps even
>  	degrading performance and scalability compared to locking.
>  }\QuickQuizEnd
> @@ -864,7 +864,7 @@ In addition, this is not the whole story.
>  Locking is not normally used by itself, but is instead typically
>  augmented by other synchronization mechanisms,
>  including reference counting, atomic operations, non-blocking data structures,
> -hazard pointers~\cite{MagedMichael04a,HerlihyLM02},
> +\IXpl{hazard pointer}~\cite{MagedMichael04a,HerlihyLM02},
>  and RCU~\cite{McKenney98,McKenney01a,ThomasEHart2007a,PaulEMcKenney2012ELCbattery}.
>  The next section looks at how such augmentation changes the equation.
>  
> diff --git a/future/tm.tex b/future/tm.tex
> index a71fc140..ce071bc8 100644
> --- a/future/tm.tex
> +++ b/future/tm.tex
> @@ -86,7 +86,7 @@ storage.
>  \label{sec:future:I/O Operations}
>  
>  One can execute I/O operations within a lock-based critical section,
> -while holding a hazard pointer, within a sequence-locking read-side
> +while holding a \IX{hazard pointer}, within a sequence-locking read-side
>  critical section, and from within a userspace-RCU read-side critical
>  section, and even all at the same time, if need be.
>  What happens when you attempt to execute an I/O operation from within
> @@ -896,7 +896,7 @@ HTM and RCU to search trees~\cite{Siakavaras2017CombiningHA,DimitriosSiakavaras2
>  graphs~\cite{ChristinaGiannoula2018HTM-RCU-graphcoloring},
>  and
>  \ppl{SeongJae}{Park} et al.~have used HTM and RCU to optimize high-contention
> -locking on NUMA systems~\cite{SeongJaePark2020HTMRCUlock}.
> +locking on \IXacr{numa} systems~\cite{SeongJaePark2020HTMRCUlock}.
>  
>  It is important to note that RCU permits readers and updaters to run
>  concurrently, further permitting RCU readers to access data that is in
> diff --git a/glossary.tex b/glossary.tex
> index ee1471bd..c6266b15 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -402,7 +402,7 @@
>  	A source-code memory access that simply mentions the name of
>  	the object being accessed.
>  	(See ``Marked access''.)
> -\item[\IX{Process Consistency}:]
> +\item[\IXalth{Process Consistency}{process}{memory consistency}:]
>  	A memory-consistency model in which each CPU's stores appear to
>  	occur in program order, but in which different CPUs might see
>  	accesses from more than one CPU as occurring in different orders.
> @@ -477,7 +477,7 @@
>  \item[\IXh{Sequence}{Lock}:]
>  	A reader-writer synchronization mechanism in which readers
>  	retry their operations if a writer was present.
> -\item[\IX{Sequential Consistency}:]
> +\item[\IXalth{Sequential Consistency}{sequential}{memory consistency}:]
>  	A memory-consistency model where all memory references appear to occur
>  	in an order consistent with
>  	a single global order, and where each CPU's memory references
> diff --git a/glsdict.tex b/glsdict.tex
> index 434ab9f5..c861e09b 100644
> --- a/glsdict.tex
> +++ b/glsdict.tex
> @@ -209,6 +209,7 @@
>  \newcommand{\IXacrmfstpl}[1]{\glsuseri{#1}\acrmfstpl{#1}} % put index via acronym dictionary (first form, plural)
>  \newcommand{\IXAcrmfst}[1]{\glsuseri{#1}\Acrmfst{#1}} % put index via acronym dictionary (first form, upper case)
>  \newcommand{\IXAcrmfstpl}[1]{\glsuseri{#1}\Acrmfstpl{#1}} % put index via acronym dictionary (first form, upper case, plural)
> +\newcommand{\IXaltacr}[2]{\glsuseri{#2}\hlindex{#1}} % put index of acronym #2 to alternative string (#1)
>  
>  \newacronym{cas}{CAS}{compare and swap}
>  \newabbreviation{cas:m}{CAS}{compare-and-swap}
> diff --git a/intro/intro.tex b/intro/intro.tex
> index 93d78dd9..3fb567cf 100644
> --- a/intro/intro.tex
> +++ b/intro/intro.tex
> @@ -74,7 +74,7 @@ categories, including:
>  \item	The paucity of publicly accessible parallel code.
>  \item	The lack of a widely understood engineering discipline of
>  	parallel programming.
> -\item	The high overhead of communication relative to that of processing,
> +\item	The high \IX{overhead} of communication relative to that of processing,
>  	even in tightly coupled shared-memory computers.
>  \end{enumerate}
>  
> @@ -337,7 +337,7 @@ and you will probably get done much more quickly.
>  }\QuickQuizEnd
>  
>  Note that ``performance'' is interpreted broadly here,
> -including for example scalability (performance per CPU) and efficiency
> +including for example \IX{scalability} (performance per CPU) and \IX{efficiency}
>  (performance per watt).
>  
>  \begin{figure}
> @@ -1080,7 +1080,7 @@ parallelism, so much so that it is
>  usually wise to begin parallelization by partitioning your write-intensive
>  resources and replicating frequently accessed read-mostly resources.
>  The resource in question is most frequently data, which might be
> -partitioned over computer systems, mass-storage devices, NUMA nodes,
> +partitioned over computer systems, mass-storage devices, \IXplr{NUMA node},
>  CPU cores (or dies or hardware threads), pages, cache lines, instances
>  of synchronization primitives, or critical sections of code.
>  For example, partitioning over locking primitives is termed
> diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
> index feb18464..967c09d2 100644
> --- a/locking/locking-existence.tex
> +++ b/locking/locking-existence.tex
> @@ -95,7 +95,7 @@ One way of providing scalability that improves as the size of the
>  data structure increases is to place a lock in each element of the
>  structure.
>  Unfortunately, putting the lock that is to protect a data element
> -in the data element itself is subject to subtle race conditions,
> +in the data element itself is subject to subtle \IXpl{race condition},
>  as shown in
>  \cref{lst:locking:Per-Element Locking Without Existence Guarantees}.
>  
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 7ae9a115..18d52e36 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -1063,7 +1063,7 @@ these problems by maintaining low \IX{lock contention}.
>  \IX{Unfairness} can be thought of as a less-severe form of starvation,
>  where a subset of threads contending for a given lock are granted
>  the lion's share of the acquisitions.
> -This can happen on machines with shared caches or NUMA characteristics,
> +This can happen on machines with shared caches or \IXacr{numa} characteristics,
>  for example, as shown in
>  \cref{fig:locking:System Architecture and Lock Unfairness}.
>  If CPU~0 releases a lock that all the other CPUs are attempting
> @@ -1129,7 +1129,7 @@ be accessed by the lock holder without interference from other threads.
>  	as the lock itself, then attempts by other CPUs to acquire
>  	the lock will result in expensive cache misses on the part
>  	of the CPU holding the lock.
> -	This is a special case of false sharing, which can also occur
> +	This is a special case of \IX{false sharing}, which can also occur
>  	if a pair of variables protected by different locks happen
>  	to share a cache line.
>  	In contrast, if the lock is in a different cache line than
> @@ -1933,7 +1933,7 @@ starvation~\cite{McKenney02e,radovic03hierarchical,radovic02efficient,BenJackson
>  Many of these can be thought of as analogous to the elevator algorithms
>  traditionally used in scheduling disk I/O.
>  
> -Unfortunately, the same scheduling logic that improves the efficiency
> +Unfortunately, the same scheduling logic that improves the \IX{efficiency}
>  of queued locks at high contention also increases their overhead at
>  low contention.
>  Beng-Hong Lim and Anant Agarwal therefore combined a simple test-and-set
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 1d810b51..debfbcc3 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -788,7 +788,7 @@ down significantly on your users' systems.
>  Or on your future system.
>  
>  \paragraph{Ordering operations are not magic.}
> -When your program is failing due to some race condition, it is often
> +When your program is failing due to some \IX{race condition}, it is often
>  tempting to toss in a few memory-ordering operations in an attempt
>  to barrier your bugs out of existence.
>  A far better reaction is to use higher-level primitives in a carefully
> @@ -967,7 +967,7 @@ CPU~4 believes that the value is~``4'' for almost 500\,ns.
>  	CPUs~2 and~3 are a pair of hardware threads on the same
>  	core, sharing the same cache hierarchy, and therefore have
>  	very low communications latencies.
> -	This is a NUMA, or, more accurately, a NUCA effect.
> +	This is a \IXacr{numa}, or, more accurately, a \IXacr{nuca} effect.
>  
>  	This leads to the question of why CPUs~2 and~3 ever disagree
>  	at all.
> @@ -3299,7 +3299,7 @@ the fundamental property of RCU grace periods is this straightforward
>  two-part guarantee:
>  \begin{enumerate*}[(1)]
>  \item If any part of a given RCU read-side critical section precedes
> -the beginning of a given grace period, then the entirety of that
> +the beginning of a given \IX{grace period}, then the entirety of that
>  critical section precedes the end of that grace period.
>  \item If any part of a given RCU read-side critical section follows
>  the end of a given grace period, then the entirety of that
> @@ -4022,7 +4022,7 @@ architecture-specific code or synchronization primitives.
>  Besides, they say that a little knowledge is a very dangerous thing.
>  Just imagine the damage you could do with a lot of knowledge!
>  For those who wish to understand more about individual CPUs'
> -memory consistency models, the next sections describe those of a few
> +\IX{memory consistency} models, the next sections describe those of a few
>  popular and prominent CPUs.
>  Although there is no substitute for actually reading a given CPU's
>  documentation, these sections do give a good overview.
> @@ -4381,7 +4381,8 @@ defined its memory ordering with an executable formal model~\cite{ARMv8A:2017}.
>  \subsection{Itanium}
>  \label{sec:memorder:Itanium}
>  
> -Itanium offers a weak consistency model, so that in absence of explicit
> +Itanium offers a \IXalth{weak consistency}{weak}{memory consistency}
> +model, so that in absence of explicit
>  memory-barrier instructions or dependencies, Itanium is within its rights
>  to arbitrarily reorder memory references~\cite{IntelItanium02v2}.
>  Itanium has a memory-fence instruction named {\tt mf}, but also has
> diff --git a/together/applyrcu.tex b/together/applyrcu.tex
> index 975a10a6..a5a1c0b3 100644
> --- a/together/applyrcu.tex
> +++ b/together/applyrcu.tex
> @@ -309,7 +309,7 @@ Suppose we have an RCU-protected variable-length array, as shown in
>  \cref{lst:together:RCU-Protected Variable-Length Array}.
>  The length of the array \co{->a[]} can change dynamically, and at any
>  given time, its length is given by the field \co{->length}.
> -Of course, this introduces the following race condition:
> +Of course, this introduces the following \IX{race condition}:
>  
>  \begin{listing}
>  \begin{VerbatimL}[tabsize=8]
> diff --git a/together/hazptr.tex b/together/hazptr.tex
> index 2749fdb1..e8a6255a 100644
> --- a/together/hazptr.tex
> +++ b/together/hazptr.tex
> @@ -19,7 +19,7 @@ Suppose a reference count is becoming a performance or scalability
>  bottleneck.
>  What can you do?
>  
> -One approach is to instead use hazard pointers.
> +One approach is to instead use \IXpl{hazard pointer}.
>  
>  There are some differences, perhaps most notably that with
>  hazard pointers it is extremely expensive to determine when
> diff --git a/together/refcnt.tex b/together/refcnt.tex
> index b30acf5b..958fa383 100644
> --- a/together/refcnt.tex
> +++ b/together/refcnt.tex
> @@ -576,7 +576,7 @@ result was zero, \clnref{call} invokes the \co{call_rcu()} primitives
>  in order to free up the file structure (via the \co{file_free_rcu()}
>  function specified in \co{call_rcu()}'s second argument), but only after
>  all currently-executing RCU read-side critical sections complete, that
> -is, after an RCU grace period has elapsed.
> +is, after an RCU \IX{grace period} has elapsed.
>  
>  Once the grace period completes, the \co{file_free_rcu()} function
>  obtains a pointer to the file structure on \clnref{obtain}, and frees it
> diff --git a/together/seqlock.tex b/together/seqlock.tex
> index 4e95d65b..85b029ea 100644
> --- a/together/seqlock.tex
> +++ b/together/seqlock.tex
> @@ -132,7 +132,8 @@ notably in the dcache subsystem~\cite{NeilBrown2015RCUwalk}.
>  Note that it is likely that similar schemes also work with hazard
>  pointers.
>  
> -This approach provides sequential consistency to successful readers,
> +This approach provides \IXalth{sequential consistency}{sequential}
> +{memory consistency} to successful readers,
>  each of which will either see the effects of a given update or not,
>  with any partial updates resulting in a read-side retry.
>  Sequential consistency is an extremely strong guarantee, incurring equally
> -- 
> 2.17.1
> 
