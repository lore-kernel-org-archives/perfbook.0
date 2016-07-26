Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40742 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1756066AbcGZPP3 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 26
 Jul 2016 11:15:29 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6QFEpuc147237
 for <perfbook@vger.kernel.org>; Tue, 26 Jul 2016 11:15:28 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 24e0gk0q91-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Tue,
 26 Jul 2016 11:15:28 -0400
Received: from localhost	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 26 Jul
 2016 09:15:27 -0600
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 C08C919D8045	for <perfbook@vger.kernel.org>; Tue, 26 Jul 2016 09:14:59 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6QFFQ8339518392	for <perfbook@vger.kernel.org>; Tue, 26 Jul 2016 15:15:26
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6QFFNkG010414	for <perfbook@vger.kernel.org>; Tue, 26 Jul 2016 11:15:24
 -0400
Date: Tue, 26 Jul 2016 08:15:24 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Use unspaced em dashes consistently
Reply-To: paulmck@linux.vnet.ibm.com
References: <0d4c9581-07cd-d515-75b0-a2165d6da011@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d4c9581-07cd-d515-75b0-a2165d6da011@gmail.com>
Message-Id: <20160726151524.GX7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jul 26, 2016 at 11:45:05PM +0900, Akira Yokosawa wrote:
> >From cbaeb197166e9c3916976906c9a315051a749a68 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 26 Jul 2016 23:40:32 +0900
> Subject: [PATCH] Use unspaced em dashes consistently
> 
> Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued, thank you!

							Thanx, Paul

> ---
>  SMPdesign/SMPdesign.tex              |  8 ++++----
>  advsync/memorybarriers.tex           | 10 +++++-----
>  advsync/rcu.tex                      |  4 ++--
>  appendix/primitives/primitives.tex   |  2 +-
>  appendix/questions/after.tex         |  2 +-
>  appendix/questions/questions.tex     |  2 +-
>  appendix/rcuimpl/rcupreempt.tex      |  2 +-
>  appendix/rcuimpl/srcu.tex            |  4 ++--
>  appendix/whymb/whymemorybarriers.tex | 10 +++++-----
>  count/count.tex                      |  6 +++---
>  cpu/overview.tex                     |  2 +-
>  defer/rcuapi.tex                     |  2 +-
>  defer/rcuusage.tex                   |  2 +-
>  easy/easy.tex                        |  2 +-
>  formal/spinhint.tex                  |  2 +-
>  glossary.tex                         |  4 ++--
>  intro/intro.tex                      |  2 +-
>  together/applyrcu.tex                |  2 +-
>  together/refcnt.tex                  |  2 +-
>  19 files changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> index 0f524b6..0a65c38 100644
> --- a/SMPdesign/SMPdesign.tex
> +++ b/SMPdesign/SMPdesign.tex
> @@ -343,7 +343,7 @@ in the form of an additional data structure, the \co{struct bucket}.
>  In contrast with the contentious situation
>  shown in Figure~\ref{fig:SMPdesign:Lock Contention},
>  data locking helps promote harmony, as illustrated by
> -Figure~\ref{fig:SMPdesign:Data Locking} --- and in parallel programs,
> +Figure~\ref{fig:SMPdesign:Data Locking}---and in parallel programs,
>  this \emph{almost} always translates into increased performance and
>  scalability.
>  For this reason, data locking was heavily used by Sequent in
> @@ -947,7 +947,7 @@ freeing in the common case and the need to efficiently distribute
>  memory in face of unfavorable allocation and freeing patterns.
> 
>  To see this tension, consider a straightforward application of
> -data ownership to this problem --- simply carve up memory so that
> +data ownership to this problem---simply carve up memory so that
>  each CPU owns its share.
>  For example, suppose that a system with two CPUs has two gigabytes
>  of memory (such as the one that I am typing on right now).
> @@ -1166,7 +1166,7 @@ the blocks in that group, with
>  the number of blocks in the group being the ``allocation run length''
>  displayed on the x-axis.
>  The y-axis shows the number of successful allocation/free pairs per
> -microsecond --- failed allocations are not counted.
> +microsecond---failed allocations are not counted.
>  The ``X''s are from a two-thread run, while the ``+''s are from a
>  single-threaded run.
> 
> @@ -1341,7 +1341,7 @@ Code locking can often be tolerated at this level, because this
>  level is so infrequently reached in well-designed systems~\cite{McKenney01e}.
> 
>  Despite this real-world design's greater complexity, the underlying
> -idea is the same --- repeated application of parallel fastpath,
> +idea is the same---repeated application of parallel fastpath,
>  as shown in
>  Table~\ref{fig:app:questions:Schematic of Real-World Parallel Allocator}.
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 7ddc9a9..97d294f 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -80,7 +80,7 @@ Isn't that why we have computers in the first place, to keep track of things?
>  Many people do indeed expect their computers to keep track of things,
>  but many also insist that they keep track of things quickly.
>  One difficulty that modern computer-system vendors face is that
> -the main memory cannot keep up with the CPU -- modern CPUs can execute
> +the main memory cannot keep up with the CPU---modern CPUs can execute
>  hundreds of instructions in the time required to fetch a single variable
>  from memory.
>  CPUs therefore sport increasingly large caches, as shown in
> @@ -188,7 +188,7 @@ actually running this code on real-world weakly-ordered hardware
>  (a 1.5GHz 16-CPU POWER 5 system) resulted in the assertion firing
>  16 times out of 10 million runs.
>  Clearly, anyone who produces code with explicit memory barriers
> -should do some extreme testing -- although a proof of correctness might
> +should do some extreme testing---although a proof of correctness might
>  be helpful, the strongly counter-intuitive nature of the behavior of
>  memory barriers should in turn strongly limit one's trust in such proofs.
>  The requirement for extreme testing should not be taken lightly, given
> @@ -325,7 +325,7 @@ CPU~4 believes that the value is ``4'' for almost 500ns.
>  	cache line makes its way to the CPU.
>  	Therefore, it is quite possible for each CPU to see a
>  	different value for a given variable at a single point
> -	in time --- and for main memory to hold yet another value.
> +	in time---and for main memory to hold yet another value.
>  	One of the reasons that memory barriers were invented was
>  	to allow software to deal gracefully with situations like
>  	this one.
> @@ -2090,7 +2090,7 @@ No such guarantee exists for the first load of
> 
>  Many CPUs speculate with loads: that is, they see that they will need to
>  load an item from memory, and they find a time where they're not using
> -the bus for any other loads, and then do the load in advance --- even though
> +the bus for any other loads, and then do the load in advance---even though
>  they haven't actually got to that point in the instruction execution
>  flow yet.
>  Later on, this potentially permits the actual load instruction to
> @@ -2484,7 +2484,7 @@ Although cache-coherence protocols guarantee that a given CPU sees its
>  own accesses in order, and that all CPUs agree on the order of modifications
>  to a single variable contained within a single cache line, there is no
>  guarantee that modifications to different variables will be seen in
> -the same order by all CPUs --- although some computer systems do make
> +the same order by all CPUs---although some computer systems do make
>  some such guarantees, portable software cannot rely on them.
> 
>  \begin{figure*}[htb]
> diff --git a/advsync/rcu.tex b/advsync/rcu.tex
> index 79df127..4b49cfc 100644
> --- a/advsync/rcu.tex
> +++ b/advsync/rcu.tex
> @@ -205,7 +205,7 @@ this list throughout the update process.
>  To update element~B, we first allocate a new element and copy element~B
>  to it, then update the copy to produce element~B'.
>  We then execute \co{list_replace_rcu()} so that element~A now
> -references the new element~B' --- however, element~B still references
> +references the new element~B'---however, element~B still references
>  element~C so that any pre-existing readers still referencing old element~B
>  are still able to advance to element~C.
>  New readers will find element~B'.
> @@ -218,7 +218,7 @@ now containing elements~A, B', and C.
> 
>  This procedure where \emph{readers} continue traversing the list
>  while a \emph{copy} operation is used to carry out an \emph{update}
> -is what gives RCU --- or read-copy update --- its name.
> +is what gives RCU---or read-copy update---its name.
> 
>  \begin{figure}[p]
>  \centering
> diff --git a/appendix/primitives/primitives.tex b/appendix/primitives/primitives.tex
> index b12ae89..e0ec93c 100644
> --- a/appendix/primitives/primitives.tex
> +++ b/appendix/primitives/primitives.tex
> @@ -380,7 +380,7 @@ init_per_thread(name, v)
>  	One approach would be to create an array indexed by
>  	\co{smp_thread_id()}, and another would be to use a hash
>  	table to map from \co{smp_thread_id()} to an array
> -	index --- which is in fact what this
> +	index---which is in fact what this
>  	set of APIs does in pthread environments.
> 
>  	Another approach would be for the parent to allocate a structure
> diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
> index 8af6a57..09f6276 100644
> --- a/appendix/questions/after.tex
> +++ b/appendix/questions/after.tex
> @@ -252,7 +252,7 @@ anything you do while holding that lock will appear to happen after
>  anything done by any prior holder of that lock.
>  No need to worry about which CPU did or did not execute a memory
>  barrier, no need to worry about the CPU or compiler reordering
> -operations -- life is simple.
> +operations---life is simple.
>  Of course, the fact that this locking prevents these two pieces of
>  code from running concurrently might limit the program's ability
>  to gain increased performance on multiprocessors, possibly resulting
> diff --git a/appendix/questions/questions.tex b/appendix/questions/questions.tex
> index 5f0bd3f..b921a38 100644
> --- a/appendix/questions/questions.tex
> +++ b/appendix/questions/questions.tex
> @@ -11,7 +11,7 @@ SMP programming.
>  Each section also shows how to {\em avoid} having to worry about
>  the corresponding question, which can be extremely important if
>  your goal is to simply get your SMP code working as quickly and
> -painlessly as possible --- which is an excellent goal, by the way!
> +painlessly as possible---which is an excellent goal, by the way!
> 
>  Although the answers to these questions are often quite a bit less
>  intuitive than they would be in a single-threaded setting,
> diff --git a/appendix/rcuimpl/rcupreempt.tex b/appendix/rcuimpl/rcupreempt.tex
> index 54681e3..fbb41b8 100644
> --- a/appendix/rcuimpl/rcupreempt.tex
> +++ b/appendix/rcuimpl/rcupreempt.tex
> @@ -1414,7 +1414,7 @@ a full grace period, and hence it is safe to do:
>  	would have had to precede the first ``Old counters zero [0]'' rather
>  	than the second one.
>  	This in turn would have meant that the read-side critical section
> -	would have been much shorter --- which would have been
> +	would have been much shorter---which would have been
>  	counter-productive,
>  	given that the point of this exercise was to identify the longest
>  	possible RCU read-side critical section.
> diff --git a/appendix/rcuimpl/srcu.tex b/appendix/rcuimpl/srcu.tex
> index 7a15e5c..2bbd214 100644
> --- a/appendix/rcuimpl/srcu.tex
> +++ b/appendix/rcuimpl/srcu.tex
> @@ -27,7 +27,7 @@ as fancifully depicted in
>  Figure~\ref{fig:app:rcuimpl:srcu:Sleeping While RCU Reading Considered Harmful},
>  with the most likely disaster being hangs due to memory exhaustion.
>  After all, any concurrency-control primitive that could result in
> -system hangs --- even when used correctly -- does not deserve to exist.
> +system hangs---even when used correctly---does not deserve to exist.
> 
>  However, the realtime kernels that require spinlock critical sections
>  be preemptible~\cite{IngoMolnar05a} also require that RCU read-side critical
> @@ -626,7 +626,7 @@ Figure~\ref{fig:app:rcuimpl:Update-Side Implementation}.
>  Line~5 takes a snapshot of the grace-period counter.
>  Line~6 acquires the mutex, and lines~7-10 check to see whether
>  at least two grace periods have elapsed since the snapshot,
> -and, if so, releases the lock and returns --- in this case, someone
> +and, if so, releases the lock and returns---in this case, someone
>  else has done our work for us.
>  Otherwise, line~11 guarantees that any other CPU that sees the
>  incremented value of the grace period counter in \co{srcu_read_lock()}
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index 9a1d1b1..0351407 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -33,7 +33,7 @@ Modern CPUs are much faster than are modern memory systems.
>  A 2006 CPU might be capable of executing ten instructions per nanosecond,
>  but will require many tens of nanoseconds to fetch a data item from
>  main memory.
> -This disparity in speed --- more than two orders of magnitude --- has
> +This disparity in speed---more than two orders of magnitude---has
>  resulted in the multi-megabyte caches found on modern CPUs.
>  These caches are associated with the CPUs as shown in
>  Figure~\ref{fig:app:whymb:Modern Computer System Cache Structure},
> @@ -630,7 +630,7 @@ write to it, CPU~0 must stall for an extended period of time.\footnote{
>  \label{fig:app:whymb:Writes See Unnecessary Stalls}
>  \end{figure}
> 
> -But there is no real reason to force CPU~0 to stall for so long --- after
> +But there is no real reason to force CPU~0 to stall for so long---after
>  all, regardless of what data happens to be in the cache line that CPU~1
>  sends it, CPU~0 is going to unconditionally overwrite it.
> 
> @@ -889,7 +889,7 @@ With this latter approach the sequence of operations might be as follows:
>  	state.
>  \item	Since the store to ``a'' was the only
>  	entry in the store buffer that was marked by the \co{smp_mb()},
> -	CPU~0 can also store the new value of ``b'' --- except for the
> +	CPU~0 can also store the new value of ``b''---except for the
>  	fact that the cache line containing ``b'' is now in ``shared''
>  	state.
>  \item	CPU~0 therefore sends an ``invalidate'' message to CPU~1.
> @@ -967,7 +967,7 @@ A CPU with an invalidate queue may acknowledge an invalidate message
>  as soon as it is placed in the queue, instead of having to wait until
>  the corresponding line is actually invalidated.
>  Of course, the CPU must refer to its invalidate queue when preparing
> -to transmit invalidation messages --- if an entry for the corresponding
> +to transmit invalidation messages---if an entry for the corresponding
>  cache line is in the invalidate queue, the CPU cannot immediately
>  transmit the invalidate message; it must instead wait until the
>  invalidate-queue entry has been processed.
> @@ -2415,7 +2415,7 @@ future such problems:
> 
>  \item	Device interrupts that ignore cache coherence.
> 
> -	This might sound innocent enough --- after all, interrupts
> +	This might sound innocent enough---after all, interrupts
>  	aren't memory references, are they?
>  	But imagine a CPU with a split cache, one bank of which is
>  	extremely busy, therefore holding onto the last cacheline
> diff --git a/count/count.tex b/count/count.tex
> index d7feed4..dbb3530 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -1129,7 +1129,7 @@ variables vanish when that thread exits.
>  	So why should user-space code need to do this???
>  \QuickQuizAnswer{
>  	Remember, the Linux kernel's per-CPU variables are always
> -	accessible, even if the corresponding CPU is offline --- even
> +	accessible, even if the corresponding CPU is offline---even
>  	if the corresponding CPU never existed and never will exist.
> 
>  { \scriptsize
> @@ -2467,7 +2467,7 @@ line~30 subtracts this thread's \co{countermax} from \co{globalreserve}.
>  	\co{gblcnt_mutex}.
>  	By that time, the caller of \co{flush_local_count()} will have
>  	finished making use of the counts, so there will be no problem
> -	with this other thread refilling --- assuming that the value
> +	with this other thread refilling---assuming that the value
>  	of \co{globalcount} is large enough to permit a refill.
>  } \QuickQuizEnd
> 
> @@ -2827,7 +2827,7 @@ line~33 sends the thread a signal.
>  	But the caller has acquired this lock, so it is not possible
>  	for the other thread to hold it, and therefore the other thread
>  	is not permitted to change its \co{countermax} variable.
> -	We can therefore safely access it --- but not change it.
> +	We can therefore safely access it---but not change it.
>  } \QuickQuizEnd
> 
>  \QuickQuiz{}
> diff --git a/cpu/overview.tex b/cpu/overview.tex
> index 49ca800..b92c42c 100644
> --- a/cpu/overview.tex
> +++ b/cpu/overview.tex
> @@ -114,7 +114,7 @@ a bit to help combat memory-access latencies,
>  these caches require highly predictable data-access patterns to
>  successfully hide those latencies.
>  Unfortunately, common operations such as traversing a linked list
> -have extremely unpredictable memory-access patterns --- after all,
> +have extremely unpredictable memory-access patterns---after all,
>  if the pattern was predictable, us software types would not bother
>  with the pointers, right?
>  Therefore, as shown in
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index ed2f5a0..4ca7cf0 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -565,7 +565,7 @@ Finally, the \co{list_splice_init_rcu()} primitive is similar
>  to its non-RCU counterpart, but incurs a full grace-period latency.
>  The purpose of this grace period is to allow RCU readers to finish
>  their traversal of the source list before completely disconnecting
> -it from the list header -- failure to do this could prevent such
> +it from the list header---failure to do this could prevent such
>  readers from ever terminating their traversal.
> 
>  \QuickQuiz{}
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index 51d492e..a8c0973 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -420,7 +420,7 @@ rcu_read_unlock();
>  	pre-existing RCU read-side critical sections complete, but
>  	is enclosed in an RCU read-side critical section that cannot
>  	complete until the \co{synchronize_rcu()} returns.
> -	The result is a classic self-deadlock--you get the same
> +	The result is a classic self-deadlock---you get the same
>  	effect when attempting to write-acquire a reader-writer lock
>  	while read-holding it.
> 
> diff --git a/easy/easy.tex b/easy/easy.tex
> index 05fb06c..3e4bb8a 100644
> --- a/easy/easy.tex
> +++ b/easy/easy.tex
> @@ -124,7 +124,7 @@ Linux kernel:
>  The set of useful programs resembles the Mandelbrot set
>  (shown in Figure~\ref{fig:easy:Mandelbrot Set})
>  in that it does
> -not have a clear-cut smooth boundary --- if it did, the halting problem
> +not have a clear-cut smooth boundary---if it did, the halting problem
>  would be solvable.
>  But we need APIs that real people can use, not ones that require a
>  Ph.D. dissertation be completed for each and every potential use.
> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
> index a5cc151..0970ad7 100644
> --- a/formal/spinhint.tex
> +++ b/formal/spinhint.tex
> @@ -472,7 +472,7 @@ C++, or Java.
>  	must be avoided like the plague because they cause the state
>  	space to explode.  On the other hand, there is no penalty for
>  	infinite loops in Promela as long as none of the variables
> -	monotonically increase or decrease -- Promela will figure out
> +	monotonically increase or decrease---Promela will figure out
>  	how many passes through the loop really matter, and automatically
>  	prune execution beyond that point.
>  \item	In C torture-test code, it is often wise to keep per-task control
> diff --git a/glossary.tex b/glossary.tex
> index b8ce6a3..9bfb3b3 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -76,7 +76,7 @@
>  	value, and columns of cache lines (``ways'') in which every
>  	cache line has a different hash value.
>  	The associativity of a given cache is its number of
> -	columns (hence the name ``way'' -- a two-way set-associative
> +	columns (hence the name ``way''---a two-way set-associative
>  	cache has two ``ways''), and the size of the cache is its
>  	number of rows multiplied by its number of columns.
>  \item[Cache Line:]
> @@ -385,7 +385,7 @@
>  	A scalar (non-vector) CPU capable of executing multiple instructions
>  	concurrently.
>  	This is a step up from a pipelined CPU that executes multiple
> -	instructions in an assembly-line fashion --- in a super-scalar
> +	instructions in an assembly-line fashion---in a super-scalar
>  	CPU, each stage of the pipeline would be capable of handling
>  	more than one instruction.
>  	For example, if the conditions were exactly right,
> diff --git a/intro/intro.tex b/intro/intro.tex
> index e8df596..89d2c7c 100644
> --- a/intro/intro.tex
> +++ b/intro/intro.tex
> @@ -159,7 +159,7 @@ as discussed in Section~\ref{sec:cpu:Hardware Free Lunch?}.
>  	This high cost of parallel systems meant that
>  	parallel programming was restricted to a privileged few who
>  	worked for an employer who either manufactured or could afford to
> -	purchase machines costing upwards of \$100,000 --- in 1991 dollars US.
> +	purchase machines costing upwards of \$100,000---in 1991 dollars US.
> 
>  	In contrast, in 2006, Paul finds himself typing these words on a
>  	dual-core x86 laptop.
> diff --git a/together/applyrcu.tex b/together/applyrcu.tex
> index 981cc50..7309fe2 100644
> --- a/together/applyrcu.tex
> +++ b/together/applyrcu.tex
> @@ -15,7 +15,7 @@ Section~\ref{sec:count:Per-Thread-Variable-Based Implementation}
>  described an implementation of statistical counters that provided
>  excellent
>  performance, roughly that of simple increment (as in the C \co{++}
> -operator), and linear scalability --- but only for incrementing
> +operator), and linear scalability---but only for incrementing
>  via \co{inc_count()}.
>  Unfortunately, threads needing to read out the value via \co{read_count()}
>  were required to acquire a global
> diff --git a/together/refcnt.tex b/together/refcnt.tex
> index d9ff656..9c88989 100644
> --- a/together/refcnt.tex
> +++ b/together/refcnt.tex
> @@ -151,7 +151,7 @@ other operations in addition to the reference count, but where
>  a reference to the object must be held after the lock is released.
>  Figure~\ref{fig:together:Simple Reference-Count API} shows a simple
>  API that might be used to implement simple non-atomic reference
> -counting -- although simple reference counting is almost always
> +counting---although simple reference counting is almost always
>  open-coded instead.
> 
>  { \scriptsize
> -- 
> 1.9.1
> 

