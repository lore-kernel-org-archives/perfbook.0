Return-Path: <SRS0=7ZAc=SC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o2Vjca6QMJrdH9o3IXmXYrQEb7M6cs5rt9aBxmpPZ5U=;
        b=a/+WHbeb5bZ5agSGvnlM34mfpzB667tX3tCjzv4gWeSgVPyrUR6vSRuD6w1ceKd8IO
         fflrLaY0P8+T9mgwTqbU6sBRlvss5e53VZPQhPoziFeH6fj3ovSqTPkFvsvBZqxuhqW+
         satzWGG9SRlWt+d1Zyo6s425kXrkMeLJwXLiSKZQx3AO0u5bIjbaZV0ujQDLVNqMSooo
         JiwmkHPMni9w3TolTFA6DOKwf1ZZkNDeQUkaYE2h7eYUBOCTutXHzIY+IVSJidjaeQ6d
         AXg1ssXDUOp/wgfyQf+L/GnQOwm8QVtADsy/mVdtC02FJhX22A2GexjSm3A1/lqx97BG
         QSaA==
Subject: [PATCH -perfbook 5/6] index, glossary: Underline page numbers in
 Glossary
References: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6353937a-0f94-b8dd-b3b4-1716aa9ec27e@gmail.com>
Date: Tue, 18 Jan 2022 19:57:02 +0900
MIME-Version: 1.0
In-Reply-To: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 glossary.tex                   | 176 ++++++++++++++++-----------------
 glsdict.tex                    |   6 +-
 perfbook-lt.tex                |  21 +++-
 utilities/adjustindexformat.pl |   9 ++
 4 files changed, 122 insertions(+), 90 deletions(-)

diff --git a/glossary.tex b/glossary.tex
index 06d45ee6..370239fb 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -9,7 +9,7 @@
 	        David~Levary~et~al.}}
 
 \begin{description}
-\item[\IXalt{Associativity}{Cache associativity}:]
+\item[\IXGalt{Associativity}{Cache associativity}:]
 	The number of cache lines that can be held simultaneously in
 	a given cache, when all of these cache lines hash identically
 	in that cache.
@@ -24,31 +24,31 @@
 	fully associative caches are normally quite limited in size.
 	The associativity of the large caches found on modern microprocessors
 	typically range from two-way to eight-way.
-\item[\IXalth{Associativity Miss}{associativity}{cache miss}:]
+\item[\IXGalth{Associativity Miss}{associativity}{cache miss}:]
 	A cache miss incurred because the corresponding CPU has recently
 	accessed more data hashing to a given set of the cache than will
 	fit in that set.
 	Fully associative caches are not subject to associativity misses
 	(or, equivalently, in fully associative caches, associativity
 	and capacity misses are identical).
-\item[\IX{Atomic}:]
+\item[\IXG{Atomic}:]
 	An operation is considered ``atomic'' if it is not possible to
 	observe any intermediate state.
 	For example, on most CPUs, a store to a properly aligned pointer
 	is atomic, because other CPUs will see either the old value or
 	the new value, but are guaranteed not to see some mixed value
 	containing some pieces of the new and old values.
-\item[\IX{Atomic Read-Modify-Write Operation}:]
+\item[\IXG{Atomic Read-Modify-Write Operation}:]
 	An atomic operation that both reads and writes memory is
 	considered an atomic read-modify-write operation, or atomic RMW
 	operation for short.
 	Although the value written usually depends on the value read,
 	\co{atomic_xchg()} is the exception that proves this rule.
-\item[\IXh{Bounded}{Wait Free}:]
+\item[\IXGh{Bounded}{Wait Free}:]
 	A forward-progress guarantee in which every thread makes
 	progress within a specific finite period of time, the specific
 	time being the bound.
-\item[\IX{Cache}:]
+\item[\IXG{Cache}:]
 	In modern computer systems, CPUs have caches in which to hold
 	frequently used data.
 	These caches can be thought of as hardware hash tables with very
@@ -60,7 +60,7 @@
 	These data items are normally called ``cache lines'', which
 	can be thought of a fixed-length blocks of data that circulate
 	among the CPUs and memory.
-\item[\IX{Cache Coherence}:]
+\item[\IXG{Cache Coherence}:]
 	A property of most modern SMP machines where all CPUs will
 	observe a sequence of values for a given variable that is
 	consistent with at least one global order of values for
@@ -75,12 +75,12 @@
 	variables will appear to occur.
 	See \cref{sec:memorder:Cache Coherence}
 	for more information.
-\item[\IX{Cache-Coherence Protocol}:]
+\item[\IXG{Cache-Coherence Protocol}:]
 	A communications protocol, normally implemented in hardware,
 	that enforces memory consistency and ordering, preventing
 	different CPUs from seeing inconsistent views of data held
 	in their caches.
-\item[\IX{Cache Geometry}:]
+\item[\IXG{Cache Geometry}:]
 	The size and associativity of a cache is termed its geometry.
 	Each cache may be thought of as a two-dimensional array,
 	with rows of cache lines (``sets'') that have the same hash
@@ -90,7 +90,7 @@
 	columns (hence the name ``way''---a two-way set-associative
 	cache has two ``ways''), and the size of the cache is its
 	number of rows multiplied by its number of columns.
-\item[\IX{Cache Line}:]
+\item[\IXG{Cache Line}:]
 	(1) The unit of data that circulates among the CPUs and memory,
 	usually a moderate power of two in size.
 	Typical cache-line sizes range from 16 to 256 bytes. \\
@@ -101,7 +101,7 @@
 	on a cache-line boundary.
 	For example, the address of the first word of a cache line
 	in memory will end in 0x00 on systems with 256-byte cache lines.
-\item[\IX{Cache Miss}:]
+\item[\IXG{Cache Miss}:]
 	A cache miss occurs when data needed by the CPU is not in
 	that CPU's cache.
 	The data might be missing because of a number of reasons,
@@ -125,14 +125,14 @@
 	currently read-only, possibly due to that line being replicated
 	in other CPUs' caches.
 	\end{enumerate*}
-\item[\IXalth{Capacity Miss}{capacity}{cache miss}:]
+\item[\IXGalth{Capacity Miss}{capacity}{cache miss}:]
 	A cache miss incurred because the corresponding CPU has recently
 	accessed more data than will fit into the cache.
-\item[\IX{Clash Free}:]
+\item[\IXG{Clash Free}:]
 	A forward-progress guarantee in which, in the absence of
 	contention, at least one thread makes progress within a finite
 	period of time.
-\item[\IXalth{Code Locking}{code}{locking}:]
+\item[\IXGalth{Code Locking}{code}{locking}:]
 	A simple locking design in which a ``global lock'' is used to protect
 	a set of critical sections, so that access by a given thread
 	to that set is
@@ -144,16 +144,16 @@
 	scalability (in fact, will typically \emph{decrease} scalability
 	by increasing ``lock contention'').
 	Contrast with ``data locking''.
-\item[\IXalth{Communication Miss}{communication}{cache miss}:]
+\item[\IXGalth{Communication Miss}{communication}{cache miss}:]
 	A cache miss incurred because some other CPU has written to
 	the cache line since the last time this CPU accessed it.
-\item[\IX{Concurrent}:]
+\item[\IXG{Concurrent}:]
 	In this book, a synonym of parallel.
 	Please see \cref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
 	on \cpageref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
 	for a discussion of the recent distinction between these two
 	terms.
-\item[\IX{Critical Section}:]
+\item[\IXG{Critical Section}:]
 	A section of code guarded by some synchronization mechanism,
 	so that its execution constrained by that primitive.
 	For example, if a set of critical sections are guarded by
@@ -162,7 +162,7 @@
 	If a thread is executing in one such critical section,
 	any other threads must wait until the first thread completes
 	before executing any of the critical sections in the set.
-\item[\IXh{Data}{Locking}:]
+\item[\IXGh{Data}{Locking}:]
 	A scalable locking design in which each instance of a given
 	data structure has its own lock.
 	If each thread is using a different instance of the
@@ -172,7 +172,7 @@
 	increasing numbers of CPUs as the number of instances of
 	data grows.
 	Contrast with ``code locking''.
-\item[\IX{Data Race}:]
+\item[\IXG{Data Race}:]
 	A race condition in which several CPUs or threads access
 	a variable concurrently, and in which at least one of those
 	accesses is a store and at least one of those accesses
@@ -181,25 +181,25 @@
 	often indicates the presence of bugs, the absence of data races
 	in no way implies the absence of bugs.
 	(See ``Plain access''.)
-\item[\IX{Deadlock Free}:]
+\item[\IXG{Deadlock Free}:]
 	A forward-progress guarantee in which, in the absence of
 	failures, at least one thread makes progress within a finite
 	period of time.
-\item[\IXh{Direct-Mapped}{Cache}:]
+\item[\IXGh{Direct-Mapped}{Cache}:]
 	A cache with only one way, so that it may hold only one cache
 	line with a given hash value.
-\item[\IX{Efficiency}:]
+\item[\IXG{Efficiency}:]
 	A measure of effectiveness normally expressed as a ratio
 	of some metric actually achieved to some maximum value.
 	The maximum value might be a theoretical maximum, but in
 	parallel programming is often based on the corresponding
 	measured single-threaded metric.
-\item[\IX{Embarrassingly Parallel}:]
+\item[\IXG{Embarrassingly Parallel}:]
 	A problem or algorithm where adding threads does not significantly
 	increase the overall cost of the computation, resulting in
 	linear speedups as threads are added (assuming sufficient
 	CPUs are available).
-\item[\IX{Existence Guarantee}:]
+\item[\IXG{Existence Guarantee}:]
 	An existence guarantee is provided by a synchronization mechanism
 	that prevents a given dynamically allocated object from being
 	freed for the duration of that guarantee.
@@ -207,11 +207,11 @@
 	of RCU read-side critical sections.
 	A similar but strictly weaker guarantee is provided by
 	type-safe memory.
-\item[\IXh{Exclusive}{Lock}:]
+\item[\IXGh{Exclusive}{Lock}:]
 	An exclusive lock is a mutual-exclusion mechanism that
 	permits only one thread at a time into the
 	set of critical sections guarded by that lock.
-\item[\IX{False Sharing}:]
+\item[\IXG{False Sharing}:]
 	If two CPUs each frequently write to one of a pair of data items,
 	but the pair of data items are located in the same cache line,
 	this cache line will be repeatedly invalidated, ``ping-ponging''
@@ -221,7 +221,7 @@
 	community).
 	False sharing can dramatically reduce both performance and
 	scalability.
-\item[\IX{Fragmentation}:]
+\item[\IXG{Fragmentation}:]
 	A memory pool that has a large amount of unused memory, but
 	not laid out to permit satisfying a relatively small request
 	is said to be fragmented.
@@ -230,11 +230,11 @@
 	while internal fragmentation occurs when specific requests or
 	types of requests have been allotted more memory than they
 	actually requested.
-\item[\IXh{Fully Associative}{Cache}:]
+\item[\IXGh{Fully Associative}{Cache}:]
 	A fully associative cache contains only
 	one set, so that it can hold any subset of
 	memory that fits within its capacity.
-\item[\IX{Grace Period}:]
+\item[\IXG{Grace Period}:]
 	A grace period is any contiguous time interval such that
 	any RCU read-side critical section that began before the
 	start of that interval has
@@ -245,51 +245,51 @@
 	Since RCU read-side critical sections by definition cannot
 	contain quiescent states, these two definitions are almost
 	always interchangeable.
-\item[\IX{Hazard Pointer}:]
+\item[\IXG{Hazard Pointer}:]
 	A scalable counterpart to a reference counter in which an
 	object's reference count is represented implicitly by a count
 	of the number of special hazard pointers referencing that object.
-\item[\IX{Heisenbug}:]
+\item[\IXG{Heisenbug}:]
 	A timing-sensitive bug that disappears from sight when you
 	add print statements or tracing in an attempt to track it
 	down.
-\item[\IX{Hot Spot}:]
+\item[\IXG{Hot Spot}:]
 	Data structure that is very heavily used, resulting in high
 	levels of contention on the corresponding lock.
 	One example of this situation would be a hash table with
 	a poorly chosen hash function.
-\item[\IX{Humiliatingly Parallel}:]
+\item[\IXG{Humiliatingly Parallel}:]
 	A problem or algorithm where adding threads significantly
 	\emph{decreases} the overall cost of the computation, resulting in
 	large superlinear speedups as threads are added (assuming sufficient
 	CPUs are available).
-\item[\IX{Immutable}:]
+\item[\IXG{Immutable}:]
 	In this book, a synonym for read-mostly.
-\item[\IX{Invalidation}:]
+\item[\IXG{Invalidation}:]
 	When a CPU wishes to write to a data item, it must first ensure
 	that this data item is not present in any other CPUs' cache.
 	If necessary, the item is removed from the other CPUs' caches
 	via ``invalidation'' messages from the writing CPUs to any
 	CPUs having a copy in their caches.
-\item[IPI:]\glsuseri{ipi}
+\item[IPI:]\glsuseriii{ipi}
 	Inter-processor interrupt, which is an
 	interrupt sent from one CPU to another.
 	IPIs are used heavily in the Linux kernel, for example, within
 	the scheduler to alert CPUs that a high-priority process is now
 	runnable.
-\item[IRQ:]\glsuseri{irq}
+\item[IRQ:]\glsuseriii{irq}
 	Interrupt request, often used as an abbreviation for ``interrupt''
 	within the Linux kernel community, as in ``irq handler''.
-\item[\IX{Latency}:]
+\item[\IXG{Latency}:]
 	The wall-clock time required for a given operation to complete.
-\item[\IX{Linearizable}:]
+\item[\IXG{Linearizable}:]
 	A sequence of operations is ``linearizable'' if there is at
 	least one global ordering of the sequence that is consistent
 	with the observations of all CPUs and/or threads.
 	Linearizability is much prized by many researchers, but less
 	useful in practice than one might
 	expect~\cite{AndreasHaas2012FIFOisnt}.
-\item[\IX{Lock}:]
+\item[\IXG{Lock}:]
 	A software abstraction that can be used to guard critical sections,
 	as such, an example of a ``mutual exclusion mechanism''.
 	An ``exclusive lock'' permits only one thread at a time into the
@@ -301,15 +301,15 @@
 	a given reader-writer lock's critical sections will prevent
 	any reader from entering any of that lock's critical sections
 	and vice versa.)
-\item[\IX{Lock Contention}:]
+\item[\IXG{Lock Contention}:]
 	A lock is said to be suffering contention when it is being
 	used so heavily that there is often a CPU waiting on it.
 	Reducing lock contention is often a concern when designing
 	parallel algorithms and when implementing parallel programs.
-\item[\IX{Lock Free}:]
+\item[\IXG{Lock Free}:]
 	A forward-progress guarantee in which at least one thread makes
 	progress within a finite period of time.
-\item[\IX{Marked Access}:]
+\item[\IXG{Marked Access}:]
 	A source-code memory access that uses a special function or
 	macro, such as \co{READ_ONCE()}, \co{WRITE_ONCE()},
 	\co{atomic_inc()}, and so on, in order to protect that access
@@ -321,18 +321,18 @@
 	WRITE_ONCE(a, READ_ONCE(b) + READ_ONCE(c));
 	a = b + c;
 	\end{VerbatimN}
-\item[\IX{Memory}:]
+\item[\IXG{Memory}:]
 	From the viewpoint of memory models, the main memory,
 	caches, and store buffers in which values might be stored.
 	However, this term is often used to denote the main memory
 	itself, excluding caches and store buffers.
-\item[\IX{Memory Consistency}:]
+\item[\IXG{Memory Consistency}:]
 	A set of properties that impose constraints on the order in
 	which accesses to groups of variables appear to occur.
 	Memory consistency models range from sequential consistency,
 	a very constraining model popular in academic circles, through
 	process consistency, release consistency, and weak consistency.
-\item[\IXaltr{MESI Protocol}{MESI protocol}:]
+\item[\IXGaltr{MESI Protocol}{MESI protocol}:]
 	The
 	cache-coherence protocol featuring
 	modified, exclusive, shared, and invalid (MESI) states,
@@ -351,24 +351,24 @@
 	An invalid cache line contains no value, instead representing
 	``empty space'' in the cache into which data from memory might
 	be loaded.
-\item[\IX{Mutual-Exclusion Mechanism}:]
+\item[\IXG{Mutual-Exclusion Mechanism}:]
 	A software abstraction that regulates threads' access to
 	``critical sections'' and corresponding data.
-\item[NMI:]\glsuseri{nmi}
+\item[NMI:]\glsuseriii{nmi}
 	Non-maskable interrupt.
 	As the name indicates, this is an extremely high-priority
 	interrupt that cannot be masked.
 	These are used for hardware-specific purposes such as profiling.
 	The advantage of using NMIs for profiling is that it allows you
 	to profile code that runs with interrupts disabled.
-\item[NUCA:]\glsuseri{nuca}
+\item[NUCA:]\glsuseriii{nuca}
 	Non-uniform cache architecture, where groups of CPUs share
 	caches and/or store buffers.
 	CPUs in a group can therefore exchange cache lines with each
 	other much more quickly than they can with CPUs in other groups.
 	Systems comprised of CPUs with hardware threads will generally
 	have a NUCA architecture.
-\item[NUMA:]\glsuseri{numa}
+\item[NUMA:]\glsuseriii{numa}
 	Non-uniform memory architecture, where memory is split into
 	banks and each such bank is ``close'' to a group of CPUs,
 	the group being termed a ``NUMA node''.
@@ -376,29 +376,29 @@
 	each group of four CPUs had a bank of memory nearby.
 	The CPUs in a given group can access their memory much
 	more quickly than another group's memory.
-\item[\IXaltr{NUMA Node}{NUMA node}:]
+\item[\IXGaltr{NUMA Node}{NUMA node}:]
 	A group of closely placed CPUs and associated memory within
 	a larger NUMA machines.
-\item[\IX{Obstruction Free}:]
+\item[\IXG{Obstruction Free}:]
 	A forward-progress guarantee in which, in the absence of
 	contention, every thread makes progress within a finite
 	period of time.
-\item[\IX{Overhead}:]
+\item[\IXG{Overhead}:]
 	Operations that must be executed, but which do not contribute
 	directly to the work that must be accomplished.
 	For example, lock acquisition and release is normally considered
 	to be overhead, and specifically to be synchronization overhead.
-\item[\IX{Parallel}:]
+\item[\IXG{Parallel}:]
 	In this book, a synonym of concurrent.
 	Please see \cref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
 	on \cpageref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
 	for a discussion of the recent distinction between these two
 	terms.
-\item[\IX{Performance}:]
+\item[\IXG{Performance}:]
 	Rate at which work is done, expressed as work per unit time.
 	If this work is fully serialized, then the performance will
 	be the reciprocal of the mean latency of the work items.
-\item[\IXr{Pipelined CPU}:]
+\item[\IXGr{Pipelined CPU}:]
 	A CPU with a pipeline, which is
 	an internal flow of instructions internal to the CPU that
 	is in some way similar to an assembly line, with many of
@@ -406,15 +406,15 @@
 	In the 1960s through the early 1980s, pipelined CPUs were the
 	province of supercomputers, but started appearing in microprocessors
 	(such as the 80486) in the late 1980s.
-\item[\IX{Plain Access}:]
+\item[\IXG{Plain Access}:]
 	A source-code memory access that simply mentions the name of
 	the object being accessed.
 	(See ``Marked access''.)
-\item[\IXalth{Process Consistency}{process}{memory consistency}:]
+\item[\IXGalth{Process Consistency}{process}{memory consistency}:]
 	A memory-consistency model in which each CPU's stores appear to
 	occur in program order, but in which different CPUs might see
 	accesses from more than one CPU as occurring in different orders.
-\item[\IX{Program Order}:]
+\item[\IXG{Program Order}:]
 	The order in which a given thread's instructions
 	would be executed by a now-mythical ``in-order'' CPU that
 	completely executed each instruction before proceeding to
@@ -425,20 +425,20 @@
 	\IXaltr{Moore's-Law}{Moore's Law}-driven increases in CPU clock frequency.
 	Some claim that these beasts will roam the earth once again,
 	others vehemently disagree.)
-\item[\IX{Quiescent State}:]
+\item[\IXG{Quiescent State}:]
 	In RCU, a point in the code where there can be no references held
 	to RCU-protected data structures, which is normally any point
 	outside of an RCU read-side critical section.
 	Any interval of time during which all threads pass through at
 	least one quiescent state each is termed a ``grace period''.
-\item[\IXaltr{RCU-Protected Data}{RCU-protected data}:]
+\item[\IXGaltr{RCU-Protected Data}{RCU-protected data}:]
 	A block of dynamically allocated memory whose freeing will be
 	deferred such that an RCU grace period will elapse between the
 	time that there were no longer any RCU-reader-accessible pointers
 	to that block and the time that that block is freed.
 	This ensures that no RCU readers will have access to that block at
 	the time that it is freed.
-\item[\IXaltr{RCU-Protected Pointer}{RCU-protected pointer}:]
+\item[\IXGaltr{RCU-Protected Pointer}{RCU-protected pointer}:]
 	A pointer to RCU-protected data.
 	Such pointers must be handled carefully, for example, any reader
 	that intends to dereference an RCU-protected pointer must
@@ -447,7 +447,7 @@
 	to store to that pointer.
 	More information is provided in
 	\cref{sec:memorder:Address- and Data-Dependency Difficulties}.
-\item[Read-Copy Update (RCU):]\glsuseri{rcu}
+\item[Read-Copy Update (RCU):]\glsuseriii{rcu}
 	A synchronization mechanism that can be thought of as a replacement
 	for reader-writer locking or reference counting.
 	RCU provides extremely low-overhead access for readers, while
@@ -459,14 +459,14 @@
 	RCU is thus best-suited for read-mostly situations where
 	stale data can either be tolerated (as in routing tables)
 	or avoided (as in the Linux kernel's System V IPC implementation).
-\item[\IX{Read Only}:]
+\item[\IXG{Read Only}:]
 	Read-only data is, as the name implies, never updated except
 	by beginning-of-time initialization.
 	In this book, a synonym for immutable.
-\item[\IX{Read Mostly}:]
+\item[\IXG{Read Mostly}:]
 	Read-mostly data is (again, as the name implies) rarely updated.
 	However, it might be updated at any time.
-\item[\IXh{Read-Side}{Critical Section}:]
+\item[\IXGh{Read-Side}{Critical Section}:]
 	A section of code guarded by read-acquisition of
 	some reader-writer synchronization mechanism.
 	For example, if one set of critical sections are guarded by
@@ -478,7 +478,7 @@
 	Any number of threads may concurrently execute the read-side
 	critical sections, but only if no thread is executing one of
 	the write-side critical sections.
-\item[\IXh{Reader-Writer}{Lock}:]
+\item[\IXGh{Reader-Writer}{Lock}:]
 	A reader-writer lock is a mutual-exclusion mechanism that
 	permits any number of reading
 	threads, or but one writing thread, into the set of critical
@@ -489,44 +489,44 @@
 	wait for the writer to release the lock.
 	A key concern for reader-writer locks is ``fairness'':
 	Can an unending stream of readers starve a writer or vice versa?
-\item[\IX{Real Time}:]
+\item[\IXG{Real Time}:]
 	A situation in which getting the correct result is not sufficient,
 	but where this result must also be obtained within a given amount
 	of time.
-\item[\IX{Reference Count}:]
+\item[\IXG{Reference Count}:]
 	A counter that tracks the number of users of a given object or
 	entity.
 	Reference counters provide existence guarantees and are sometimes
 	used to implement garbage collectors.
-\item[\IX{Scalability}:]
+\item[\IXG{Scalability}:]
 	A measure of how effectively a given system is able to utilize
 	additional resources.
 	For parallel computing, the additional resources are usually
 	additional CPUs.
-\item[\IXh{Sequence}{Lock}:]
+\item[\IXGh{Sequence}{Lock}:]
 	A reader-writer synchronization mechanism in which readers
 	retry their operations if a writer was present.
-\item[\IXalth{Sequential Consistency}{sequential}{memory consistency}:]
+\item[\IXGalth{Sequential Consistency}{sequential}{memory consistency}:]
 	A memory-consistency model where all memory references appear to occur
 	in an order consistent with
 	a single global order, and where each CPU's memory references
 	appear to all CPUs to occur in program order.
-\item[\IX{Starvation Free}:]
+\item[\IXG{Starvation Free}:]
 	A forward-progress guarantee in which, in the absence of
 	failures, every thread makes progress within a finite
 	period of time.
-\item[\IX{Store Buffer}:]
+\item[\IXG{Store Buffer}:]
 	A small set of internal registers used by a given CPU
 	to record pending stores
 	while the corresponding cache lines are making their
 	way to that CPU\@.
 	Also called ``store queue''.
-\item[\IX{Store Forwarding}:]
+\item[\IXG{Store Forwarding}:]
 	An arrangement where a given CPU refers to its store buffer
 	as well as its cache so as to ensure that the software sees
 	the memory operations performed by this CPU as if they
 	were carried out in program order.
-\item[\IXr{Superscalar CPU}:]
+\item[\IXGr{Superscalar CPU}:]
 	A scalar (non-vector) CPU capable of executing multiple instructions
 	concurrently.
 	This is a step up from a pipelined CPU that executes multiple
@@ -538,29 +538,29 @@
 	execute two (and sometimes three) instructions per clock cycle.
 	Thus, a 200\,MHz Pentium Pro CPU could ``retire'', or complete the
 	execution of, up to 400 million instructions per second.
-\item[\IX{Synchronization}:]
+\item[\IXG{Synchronization}:]
 	Means for avoiding destructive interactions among CPUs or threads.
 	Synchronization mechanisms include atomic RMW operations, memory
 	barriers, locking, reference counting, hazard pointers, sequence
 	locking, RCU, non-blocking synchronization, and transactional
 	memory.
-\item[\IX{Teachable}:]
+\item[\IXG{Teachable}:]
 	A topic, concept, method, or mechanism that teachers believe that
 	they understand completely and are therefore comfortable teaching.
-\item[\IX{Throughput}:]
+\item[\IXG{Throughput}:]
 	A performance metric featuring work items completed per unit time.
-\item[Transactional Lock Elision (TLE):]\glsuseri{tle}
+\item[Transactional Lock Elision (TLE):]\glsuseriii{tle}
 	The use of transactional memory to emulate locking.
 	Synchronization is instead carried out by conflicting accesses
 	to the data to be protected by the lock.
 	In some cases, this can increase performance because TLE
 	avoids contention on the lock
 	word~\cite{MartinPohlack2011HTM2TLE,Kleen:2014:SEL:2566590.2576793,PascalFelber2016rwlockElision,SeongJaePark2020HTMRCUlock}.
-\item[Transactional Memory (TM):]\glsuseri{tm}
+\item[Transactional Memory (TM):]\glsuseriii{tm}
 	A synchronization mechanism that gathers groups of memory
 	accesses so as to execute them atomically from the viewpoint
 	of transactions on other CPUs or threads.
-\item[\IX{Type-Safe Memory}:]
+\item[\IXG{Type-Safe Memory}:]
 	Type-safe memory~\cite{Cheriton96a} is provided by a
 	synchronization mechanism that prevents a given dynamically
 	allocated object from changing to an incompatible type.
@@ -571,26 +571,26 @@
 	marked with the \co{SLAB_TYPESAFE_BY_RCU} flag.
 	The strictly stronger existence guarantee also prevents freeing
 	of the protected object.
-\item[\IX{Unteachable}:]
+\item[\IXG{Unteachable}:]
 	A topic, concept, method, or mechanism that the teacher does
 	not understand well is therefore uncomfortable teaching.
-\item[\IXr{Vector CPU}:]
+\item[\IXGr{Vector CPU}:]
 	A CPU that can apply a single instruction to multiple items of
 	data concurrently.
 	In the 1960s through the 1980s, only supercomputers had vector
 	capabilities, but the advent of MMX in x86 CPUs and VMX in
 	PowerPC CPUs brought vector processing to the masses.
-\item[\IX{Wait Free}:]
+\item[\IXG{Wait Free}:]
 	A forward-progress guarantee in which every thread makes
 	progress within a finite period of time.
-\item[\IXalth{Write Miss}{write}{cache miss}:]
+\item[\IXGalth{Write Miss}{write}{cache miss}:]
 	A cache miss incurred because the corresponding CPU attempted
 	to write to a cache line that is read-only, most likely due
 	to its being replicated in other CPUs' caches.
-\item[\IX{Write Mostly}:]
+\item[\IXG{Write Mostly}:]
 	Write-mostly data is (yet again, as the name implies) frequently
 	updated.
-\item[\IXh{Write-Side}{Critical Section}:]
+\item[\IXGh{Write-Side}{Critical Section}:]
 	A section of code guarded by write-acquisition of
 	some reader-writer synchronization mechanism.
 	For example, if one set of critical sections are guarded by
diff --git a/glsdict.tex b/glsdict.tex
index 3dafda06..194f364d 100644
--- a/glsdict.tex
+++ b/glsdict.tex
@@ -15,7 +15,9 @@
     user1={\protect\index{\the\glslongtok\space(\the\glsshorttok)%
       @\makefirstuc{\the\glslongtok}\space(\the\glsshorttok)}},%
     user2={\protect\index{\the\glslongtok\space(\the\glsshorttok)%
-      @\makefirstuc{\the\glslongtok}\space[\the\glsshorttok]}}%
+      @\makefirstuc{\the\glslongtok}\space[\the\glsshorttok]}},%
+    user3={\protect\index{\the\glslongtok\space(\the\glsshorttok)%
+      @\makefirstuc{\the\glslongtok}\space<\the\glsshorttok>}}%
   }%
   \renewcommand*{\GlsXtrPostNewAbbreviation}{%
     \glshasattribute{\the\glslabeltok}{regular}%
@@ -181,6 +183,7 @@
 
 \newcommand{\IXacr}[1]{\glsuseri{#1}\acr{#1}} % put index via acronym dictionary
 \newcommand{\IXBacr}[1]{\glsuserii{#1}\acr{#1}} % put index via acronym dictionary
+\newcommand{\IXGacr}[1]{\glsuseriii{#1}\acr{#1}} % put index via acronym dictionary
 \newcommand{\IXacrpl}[1]{\glsuseri{#1}\acrpl{#1}} % put index via acronym dictionary (plural)
 \newcommand{\IXAcr}[1]{\glsuseri{#1}\Acr{#1}} % put index via acronym dictionary (upper case)
 \newcommand{\IXAcrpl}[1]{\glsuseri{#1}\Acrpl{#1}} % put index via acronym dictionary (upper case, plural)
@@ -194,6 +197,7 @@
 \newcommand{\IXAcrfpl}[1]{\glsuseri{#1}\Acrfpl{#1}} % put index via acronym dictionary (full form, upper case, plural)
 \newcommand{\IXacrfst}[1]{\glsuseri{#1}\acrfst{#1}} % put index via acronym dictionary (first form)
 \newcommand{\IXBacrfst}[1]{\glsuserii{#1}\acrfst{#1}} % put index via acronym dictionary (first form)
+\newcommand{\IXGacrfst}[1]{\glsuseriii{#1}\acrfst{#1}} % put index via acronym dictionary (first form)
 \newcommand{\IXacrfstpl}[1]{\glsuseri{#1}\acrfstpl{#1}} % put index via acronym dictionary (first form, plural)
 \newcommand{\IXAcrfst}[1]{\glsuseri{#1}\Acrfst{#1}} % put index via acronym dictionary (first form, upper case)
 \newcommand{\IXAcrfstpl}[1]{\glsuseri{#1}\Acrfstpl{#1}} % put index via acronym dictionary (first form, upper case, plural)
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 188a300d..a5bb32c5 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -233,6 +233,24 @@
 \newcommand{\IXBalth}[3]{\indexh{#1|BF}{#3|BF}{#2}\hlindex{#1}}
 \newcommand{\IXBalthr}[3]{\indexhr{#1|BF}{#3|BF}{#2}\hlindex{#1}}
 \newcommand{\IXBalthmr}[3]{\indexhmr{#1|BF}{#3|BF}{#2}\hlindex{#1}}
+% page number for Glossary items or the likes
+\newcommand{\GL}[1]{\underline{#1}}
+\newcommand{\IXG}[1]{\ucindex{#1|GL}\hlindex{#1}} % put with first letter capitalized into general index
+\newcommand{\IXGr}[1]{\index{#1|GL}\hlindex{#1}} % put as is into general index
+\newcommand{\IXGpl}[1]{\ucindex{#1|GL}\hlindex{#1s}} % put with first letter capitalized into general index for plural
+\newcommand{\IXGplr}[1]{\index{#1|GL}\hlindex{#1s}} % put as is into general index for plural
+\newcommand{\IXGplx}[2]{\ucindex{#1|GL}\hlindex{#1#2}} % put as is into general index for plural of exeptional form
+\newcommand{\IXGalt}[2]{\ucindex{#2|GL}\hlindex{#1}} % put alternative with first letter capitalized into general index
+\newcommand{\IXGaltr}[2]{\index{#2|GL}\hlindex{#1}} % put alternative as is into general index
+\newcommand{\IXGh}[2]{\indexh{#1 #2|GL}{#2|GL}{#1}\hlindex{#1 #2}}
+\newcommand{\IXGhpl}[2]{\indexh{#1 #2|GL}{#2|GL}{#1}\hlindex{#1 #2s}}
+\newcommand{\IXGhr}[2]{\indexhr{#1 #2|GL}{#2|GL}{#1}\hlindex{#1 #2}}
+\newcommand{\IXGhrpl}[2]{\indexhr{#1 #2|GL}{#2|GL}{#1}\hlindex{#1 #2s}}
+\newcommand{\IXGhmr}[2]{\indexhmr{#1 #2|GL}{#2|GL}{#1}\hlindex{#1 #2}}
+\newcommand{\IXGhmrpl}[2]{\indexhmr{#1 #2|GL}{#2|GL}{#1}\hlindex{#1 #2s}}
+\newcommand{\IXGalth}[3]{\indexh{#1|GL}{#3|GL}{#2}\hlindex{#1}}
+\newcommand{\IXGalthr}[3]{\indexhr{#1|GL}{#3|GL}{#2}\hlindex{#1}}
+\newcommand{\IXGalthmr}[3]{\indexhmr{#1|GL}{#3|GL}{#2}\hlindex{#1}}
 %
 \newcommand{\apic}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{c}}}
 \newcommand{\apig}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{g}}}
@@ -665,7 +683,8 @@
 \printglossary[type=\acronymtype]
 \phantomsection
 \setindexprenote{\footnotesize Note on page number styles:
-  \textbf{Bold} indicates fair amount of discussion.}
+  \BF{Bold} indicates fair amount of discussion,
+  \GL{underline} indicates a definition in glossary or elsewhere.}
 \printindex
 \phantomsection
 \setindexprenote{\footnotesize (c):~Cxx standard, (g):~GCC extension,
diff --git a/utilities/adjustindexformat.pl b/utilities/adjustindexformat.pl
index 6cdc8c8f..584b3232 100755
--- a/utilities/adjustindexformat.pl
+++ b/utilities/adjustindexformat.pl
@@ -12,6 +12,12 @@
 # +\indexentry{read-copy update (RCU)@\makefirstuc {read-copy update} (RCU)|hyperindexformat{\BF}}{306}
 # -\indexentry{critical section|hyperindexformat{\bf@\makefirstuc {critical section|bf}!RCU read-side}}{325}
 # +\indexentry{critical section@\makefirstuc {critical section}!RCU read-side|hyperindexformat{\BF}}{325}
+# -\indexentry{cache associativity|hyperindexformat{\gl@\makefirstuc {cache associativity|gl}}}{1222}
+# +\indexentry{cache associativity@\makefirstuc {cache associativity}|hyperindexformat{\GL}}{1222}
+# -\indexentry{wait free|hyperindexformat{\gl@\makefirstuc {wait free|gl}!bounded}}{1223}
+# +\indexentry{wait free@\makefirstuc {wait free}!bounded|hyperindexformat{\GL}}{1223}
+# -\indexentry{interrupt request (IRQ)@\makefirstuc {interrupt request} <IRQ>|hyperpage}{1228}
+# +\indexentry{interrupt request (IRQ)@\makefirstuc {interrupt request} (IRQ)|hyperindexformat{\GL}}{1228}
 #
 # Copyright (C) Akira Yokosawa, 2022
 #
@@ -29,5 +35,8 @@ while($line = <$fh>) {
     $line =~ s/\{([^\|]+)(\|hyperindexformat)\{\\bf(@\\makefirstuc )\{.+\}\}\}/\{$1$3\{$1\}$2\{\\BF\}\}/ ;
     $line =~ s/\{([^\|]+)(\|hyperindexformat)\{\\bf(@\\makefirstuc )\{.+\}!([^\}]+)\}\}/\{$1$3\{$1}!$4$2\{\\BF\}\}/ ;
     $line =~ s/(\\makefirstuc )\{([^\)]+)\} \[([^\]]+)\]\|hyperpage\}/$1\{$2\} \($3\)|hyperindexformat\{\\BF\}\}/ ;
+    $line =~ s/\{([^\|]+)(\|hyperindexformat)\{\\gl(@\\makefirstuc )\{.+\}\}\}/\{$1$3\{$1\}$2\{\\GL\}\}/ ;
+    $line =~ s/\{([^\|]+)(\|hyperindexformat)\{\\gl(@\\makefirstuc )\{.+\}!([^\}]+)\}\}/\{$1$3\{$1}!$4$2\{\\GL\}\}/ ;
+    $line =~ s/(\\makefirstuc )\{([^\)]+)\} \<([^\]]+)\>\|hyperpage\}/$1\{$2\} \($3\)|hyperindexformat\{\\GL\}\}/ ;
     print $line ;
 }
-- 
2.17.1


