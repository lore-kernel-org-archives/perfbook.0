Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e39.co.us.ibm.com ([32.97.110.160]:52342 "EHLO
 e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751086AbbEYDpI (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 24 May 2015
 23:45:08 -0400
Received: from /spool/local	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 24 May
 2015 21:45:08 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 89D1E3E4003F	for <perfbook@vger.kernel.org>; Sun, 24
 May 2015 21:45:04 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t4P3ipPa44499006	for <perfbook@vger.kernel.org>; Sun, 24 May 2015 20:44:51
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t4P3j3Bv014550	for <perfbook@vger.kernel.org>; Sun, 24 May 2015 21:45:04
 -0600
Date: Sun, 24 May 2015 20:45:01 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Typos and grammatical fixes
Message-ID: <20150525034501.GG5989@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1432484549-5816-1-git-send-email-dave.willmer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1432484549-5816-1-git-send-email-dave.willmer@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Dave Willmer <dave.willmer@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, May 24, 2015 at 05:22:29PM +0100, Dave Willmer wrote:
> From: Dave <dave.willmer@gmail.com>
> 
> Signed-off-by: Dave <dave.willmer@gmail.com>

Very nice, queued!

I dropped the hunks removing the blanks at the ends of the empty lines
of the code samples because my current set of code-conversion scripts
rely on them.  I also took the liberty of rewording a few changes.

Please see below for the resulting patch, and please let me know if
I messed anything up.

							Thanx, Paul

------------------------------------------------------------------------

commit 93f8cc9d8de717f2446d4f179ec41bb48c6f84f0
Author: Dave <dave.willmer@gmail.com>
Date:   Sun May 24 17:22:29 2015 +0100

    Typos and grammatical fixes
    
    Signed-off-by: Dave <dave.willmer@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index dd567b33e3ad..e21fe63f99da 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -56,7 +56,7 @@ basis of real-time programming:
 \item	Real-time forward-progress guarantees usually have some
 	definite time associated with them, for example,
 	``scheduling latency must be less than 100 microseconds.''
-	In contrast, NBS only
+	In contrast, NBS only guarantees
 	that progress will be made in finite time, with no definite
 	bound.
 \item	Real-time forward-progress guarantees are sometimes
@@ -71,7 +71,7 @@ basis of real-time programming:
 	a certain fraction of its time idle, or when I/O rates are
 	below some specified maximum.
 	In contrast, NBS's forward-progress
-	guarantees are usually unconditional.\footnote{	
+	guarantees are usually unconditional.\footnote{
 		As we will see below, some recent NBS work relaxes
 		this guarantee.}
 \item	Real-time forward-progress guarantees usually apply only
@@ -111,7 +111,7 @@ as follows:
 \end{enumerate}

 NBS classes~1 and~2 were first formulated in the early 1990s,
-class~3 was first fomrulated in the early 2000s,
+class~3 was first formulated in the early 2000s,
 and class~4 was first formulated in 2013.
 The final two classes have seen informal use for a great many decades,
 but were reformulated in 2013.
diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 2d1654281a92..99e074d89325 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -82,7 +82,7 @@ Many people do indeed expect their computers to keep track of things,
 but many also insist that they keep track of things quickly.
 One difficulty that modern computer-system vendors face is that
 the main memory cannot keep up with the CPU -- modern CPUs can execute
-hundreds of instructions in time required to fetch a single variable
+hundreds of instructions in the time required to fetch a single variable
 from memory.
 CPUs therefore sport increasingly large caches, as shown in
 Figure~\ref{fig:advsync:Modern Computer System Cache Structure}.
@@ -248,12 +248,12 @@ Figure~\ref{fig:advsync:Software Logic Analyzer}.
 This code fragment is executed in parallel by several CPUs.
 Line~1 sets a shared variable to the current CPU's ID, line~2
 initializes several variables from a \co{gettb()} function that
-delivers the value of fine-grained hardware ``timebase'' counter that is
+delivers the value of a fine-grained hardware ``timebase'' counter that is
 synchronized among all CPUs (not available from all CPU architectures,
 unfortunately!), and the loop from lines~3-8 records the length of
 time that the variable retains the value that this CPU assigned to it.
 Of course, one of the CPUs will ``win'', and would thus never exit
-the loop if not for the check on lines~7-8.
+the loop if not for the check on lines~6-8.

 \QuickQuiz{}
 	What assumption is the code fragment
@@ -790,7 +790,7 @@ these combinations in order to fully understand how this works.
 	But suppose that in combination~1 from
 	Table~\ref{tab:advsync:Memory-Barrier Combinations},
 	CPU~1's load from A returns the value that CPU~2 stored
-	to A.  Then we know that CPU~1's load from B returned 
+	to A.  Then we know that CPU~1's load from B returned
 	either the same value as CPU~2's load from A or some later value.

 \QuickQuiz{}
@@ -830,7 +830,7 @@ The following properties must then hold true:
 		On any given run, however, all CPUs and threads must
 		have a consistent view of the order of critical sections
 		for a given exclusive lock.}
-\item	Suppose a given variable has not yet been stored to in a
+\item	Suppose a given variable has not yet been stored in a
 	critical section that is currently executing.
 	Then any load from a given variable performed in that critical section
 	must see the last store to that variable from the last previous
@@ -868,7 +868,7 @@ assert(b == 2);
 	If the CPU is not required to see all of its loads and
 	stores in order, then the {\tt b=1+a} might well see an
 	old version of the variable ``a''.
-	
+
 	This is why it is so very important that each CPU or thread
 	see all of its own loads and stores in program order.
 } \QuickQuizEnd
@@ -903,7 +903,7 @@ spin_unlock(&mylock);
 	that they were first, they would all see {\tt p==NULL}, and
 	they would all allocate memory.
 	All but one of those allocations would be leaked.
-	
+
 	This is why it is so very important that all the critical sections
 	for a given exclusive lock appear to execute in some well-defined
 	order.
@@ -911,7 +911,7 @@ spin_unlock(&mylock);

 Suppose that the third property did not hold.
 Then the counter shown in the following code might well count backwards.
-This third property is crucial, as it cannot be strictly with
+This third property is crucial, as it cannot be strictly true with
 pairwise memory barriers.

 \vspace{5pt}
@@ -938,7 +938,7 @@ spin_unlock(&mylock);
 	to see the most recent store to this variable, it might well see
 	the original value of zero, and therefore set the counter to
 	one, which would be going backwards.
-	
+
 	This is why it is so very important that loads from a given variable
 	in a given critical
 	section see the last store from the last prior critical section to
@@ -1833,7 +1833,7 @@ versa:
 \subsubsection{Examples of Memory Barrier Pairings}
 \label{sec:advsync:Examples of Memory Barrier Pairings}

-Firstly, write barriers act as a partial orderings on store operations.
+Firstly, write barriers act as partial orderings on store operations.
 Consider the following sequence of events:

 \vspace{5pt}
@@ -1866,7 +1866,7 @@ Figure~\ref{fig:advsync:Write Barrier Ordering Semantics}.
 \ContributedBy{Figure}{fig:advsync:Write Barrier Ordering Semantics}{David Howells}
 \end{figure*}

-Secondly, data dependency barriers act as a partial orderings on data-dependent
+Secondly, data dependency barriers act as partial orderings on data-dependent
 loads.  Consider the following sequence of events with initial values
 {\tt \{B = 7, X = 9, Y = 8, C = \&Y\}}:

diff --git a/appendix/primitives/primitives.tex b/appendix/primitives/primitives.tex
index a3cd2712add7..d7fb4710d976 100644
--- a/appendix/primitives/primitives.tex
+++ b/appendix/primitives/primitives.tex
@@ -172,7 +172,7 @@ The \co{wait_all_threads()}
 primitive waits for completion of all currently running threads.
 It is the caller's responsibility to synchronize with thread creation
 and deletion if required.
-However, this primitive is normally used to clean up and the end of
+However, this primitive is normally used to clean up at the end of
 a run, so such synchronization is normally not needed.

 \subsection{Example Usage}
@@ -347,7 +347,7 @@ Figure~\ref{fig:intro:Per-Thread-Variable API}
 shows the per-thread-variable API.
 This API provides the per-thread equivalent of global variables.
 Although this API is, strictly speaking, not necessary, it can
-greatly simply coding.
+greatly simplify coding.

 \begin{figure}[htbp]
 { \scriptsize
diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index 89a8c17976f7..7ff26620d321 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -155,7 +155,7 @@ Why is time going backwards?
 The number in parentheses is the difference in microseconds, with
 a large number exceeding 10 microseconds, and one exceeding even
 100 microseconds!
-Please note that this CPU can potentially execute about more than 100,000
+Please note that this CPU can potentially execute more than 100,000
 instructions in that time.

 One possible reason is given by the following sequence of events:
diff --git a/appendix/questions/concurrentparallel.tex b/appendix/questions/concurrentparallel.tex
index 5d0c8ea5b348..ce2228056062 100644
--- a/appendix/questions/concurrentparallel.tex
+++ b/appendix/questions/concurrentparallel.tex
@@ -52,7 +52,7 @@ there are important situations where efficiency,
 performance, and scalability concerns sharply limit the level
 of competence that the scheduler can reasonably offer.
 One important example is when the scheduler is implemented in
-hardware, as it often is SIMD units or GPGPUs.
+hardware, as it often is in SIMD units or GPGPUs.
 Another example is a workload where the units of work are quite
 short, so that even a software-based scheduler must make hard choices
 between subtlety on the one hand and efficiency on the other.
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 00263f057bcd..41668b42f654 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1565,7 +1565,7 @@ The benefit of this extremely weak memory model is that Alpha can use
 simpler cache hardware, which in turn permitted higher clock frequency
 in Alpha's heyday.

-The last column indicates whether a given CPU has a incoherent
+The last column indicates whether a given CPU has an incoherent
 instruction cache and pipeline.
 Such CPUs require special instructions be executed for self-modifying
 code.
@@ -2371,7 +2371,7 @@ future such problems:
 	can result in corrupting the data input!

 \item	External busses that fail to transmit cache-coherence data.
-	
+
 	This is an even more painful variant of the above problem,
 	but causes groups of devices---and even memory itself---to
 	fail to respect cache coherence.
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index c20c2420bf47..7a81b8b135d9 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -69,7 +69,7 @@ Those interested in Schr\"odinger's animals can query them, however,
 Schr\"odinger has noted extremely high rates of queries for his cat,
 so much so that he suspects that his mice might be using the database
 to check up on their nemesis.
-This means that Sch\"odinger's application must be able to support a
+This means that Schr\"odinger's application must be able to support a
 high rate of queries to a single data element.

 Please keep this application in mind as various data structures are presented.
@@ -174,7 +174,7 @@ The \co{hashtab} structure (lines~11-14 in
 Figure~\ref{fig:datastruct:Hash-Table Data Structures})
 contains four \co{ht_bucket} structures (lines~6-9 in
 Figure~\ref{fig:datastruct:Hash-Table Data Structures}),
-with the \co{->bt_nbuckets} field controlling the number of buckets.
+with the \co{->ht_nbuckets} field controlling the number of buckets.
 Each such bucket contains a list header \co{->htb_head} and
 a lock \co{->htb_lock}.
 The list headers chain \co{ht_elem} structures
@@ -517,7 +517,7 @@ read-mostly cases where updates are rare, but could happen at any time.
 \label{sec:datastruct:Read-Mostly Data Structures}

 Although partitioned data structures can offer excellent scalability,
-NUMA effects can result in severe degradations of both performance and 
+NUMA effects can result in severe degradations of both performance and
 scalability.
 In addition,
 the need for readers to exclude writers can degrade performance in
@@ -722,7 +722,7 @@ thread than is hazard pointers.

 This situation changes above 32 CPUs.
 Because RCU is using more than half of each core's resources from a
-single hardware thread, RCU gains relatively litte benefit from the
+single hardware thread, RCU gains relatively little benefit from the
 second hardware thread in each core.
 The slope of hazard pointers's trace also decreases at 32 CPUs, but
 less dramatically,
@@ -809,7 +809,7 @@ Of course, all three of these implementations fare much better than does
 global locking.

 Of course, it is quite possible that the differences in lookup performance
-is affected by the differences in update rates.
+are affected by the differences in update rates.
 One way to check this is to artificially throttle the update rates of
 per-bucket locking and hazard pointers to match that of RCU.
 Doing so does not significantly improve the lookup performace of
@@ -1273,7 +1273,7 @@ section.
 	The code in
 	Figures~\ref{fig:datastruct:Resizable Hash-Table Bucket Selection}
 	and~\ref{fig:datastruct:Resizable Hash-Table Update-Side Concurrency Control}
-	compute the hash and execute the bucket-selection logic twice for
+	computes the hash and executes the bucket-selection logic twice for
 	updates!
 	Why this blatant inefficiency?
 \QuickQuizAnswer{
@@ -1288,7 +1288,7 @@ The \co{hashtab_unlock_mod()} function releases the lock acquired by
 \co{hashtab_lock_mod()}.
 Line~28 picks up the current hash table, and then line~29 invokes
 \co{ht_get_bucket()} in order to gain a reference to the bucket that
-corresponds to the key---and of course this bucket might well in a
+corresponds to the key---and of course this bucket might well be in a
 new hash table.
 Line~30 releases the bucket's lock and finally line~31 exits the
 RCU read-side critical section.
@@ -1296,7 +1296,7 @@ RCU read-side critical section.
 \QuickQuiz{}
 	Suppose that one thread is inserting an element into the
 	new hash table during a resize operation.
-	What prevents this insertion to be lost due to a subsequent
+	What prevents this insertion from being lost due to a subsequent
 	resize operation completing before the insertion does?
 \QuickQuizAnswer{
 	The second resize operation will not be able to move beyond
@@ -1308,7 +1308,7 @@ RCU read-side critical section.
 	RCU read-side critical section.
 	As we will see when we examine the \co{hashtab_resize()}
 	function, this means that the first resize operation will
-	use 
+	use
 	\co{synchronize_rcu()} to wait for the insertion's read-side
 	critical section to complete.
 } \QuickQuizEnd
@@ -1890,7 +1890,7 @@ cases it does give up some performance.

 The following sections touch on specialization, memory conservation,
 and hardware considerations.
-Please do not mistakes these short sections for a definitive treatise
+Please do not mistake these short sections for a definitive treatise
 on this subject.
 Whole books have been written on optimizing to a specific CPU, let
 alone to the set of CPU families in common use today.
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 6fde3d1b0116..0efc84b98793 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -44,7 +44,7 @@ Section~\ref{sec:debugging:Probability and Heisenbugs}
 gives an overview of the use of probability for validating parallel software.
 Because performance and scalability are first-class requirements
 for parallel programming,
-Section~\ref{sec:debugging:Performance Estimation} which covers these
+Section~\ref{sec:debugging:Performance Estimation} covers these
 topics.
 Finally,
 Section~\ref{sec:debugging:Summary}
@@ -188,7 +188,7 @@ The next section examines this conundrum.
 \label{sec:debugging:Required Mindset}

 When carrying out any validation effort, you should keep the following
-defintions in mind:
+definitions in mind:

 \begin{enumerate}
 \item	The only bug-free programs are trivial programs.
@@ -498,7 +498,7 @@ be prepared to develop and run your own test suite.
 Test development is an underappreciated and very valuable skill, so be
 sure to take full advantage of any existing test suites available to
 you.
-Important as test development is, we will leave further discussion of
+Important as test development is, we will leave further discussion of it
 to books dedicated to that topic.
 The following sections therefore discuss locating bugs in your code given that
 you already have a good test suite.
@@ -643,11 +643,11 @@ into C compilers.
 There are nevertheless lint-like tools under development and in use to
 this day.

-The sparse static analyzer~\cite{JonathanCorbet2004sparse} 
+The sparse static analyzer~\cite{JonathanCorbet2004sparse}
 looks for higher-level issues in the Linux kernel, including:

 \begin{enumerate}
-\item	Misuse of pointers to use-space structures.
+\item	Misuse of pointers to user-space structures.
 \item	Assignments from too-long constants.
 \item	Empty \co{switch} statements.
 \item	Mismatched lock acquisition and release primitives.
@@ -929,7 +929,7 @@ Now the question is just how much testing is required in order to be
 certain that
 you actually fixed the bug, as opposed to just reducing the probability
 of it occurring on the one hand, having fixed only one of several
-related bugs on the other and, or made some ineffectual unrelated
+related bugs on the other hand, or made some ineffectual unrelated
 change on yet a third hand.
 In short, what is the answer to the eternal question posed by
 Figure~\ref{fig:cpu:Passed-the-stress-test}?
@@ -1074,7 +1074,7 @@ to run the test to cause the probability of failure to rise above 99\%?''
 After all, if we were to run the test enough times that the probability
 of seeing at least one failure becomes 99\%, if there are no failures,
 there is only 1\% probability of this being due to dumb luck.
-And if we plug $f=0.1$ into 
+And if we plug $f=0.1$ into
 Equation~\ref{eq:debugging:Binomial Failure Rate} and vary $n$,
 we find that 43 runs gives us a 98.92\% chance of at least one test failing
 given the original 10\% per-test failure rate,
@@ -1565,7 +1565,7 @@ the first place.
 This is a bit of a dark art, but there are a number of things you can
 do to find them.

-On approach is to recognize that race conditions often end up corrupting
+One approach is to recognize that race conditions often end up corrupting
 some of the data involved in the race.
 It is therefore good practice to double-check the synchronization of
 any corrupted data.
@@ -1833,7 +1833,7 @@ much a bug as is incorrectness.
 \QuickQuiz{}
 	That is ridiculous!!!
 	After all, isn't getting the correct answer later than one would like
-	\emph{has} better than getting an incorrect answer???
+	better than getting an incorrect answer???
 \QuickQuizAnswer{
 	This question fails to consider the option of choosing not to
 	compute the answer at all, and in doing so, also fails to consider
@@ -2014,7 +2014,7 @@ to creep in, including:
 	measurement period.
 \item	Some types of interference, for example, random memory errors,
 	are so rare that they can be dealt with by running a number
-	of sets of interations of the test.
+	of sets of iterations of the test.
 	If the level of interference was statistically significant,
 	any performance outliers could be rejected statistically.
 \item	Any iteration of the test might be interfered with by other
@@ -2166,7 +2166,7 @@ describes statistics-based rejection.

 Many systems, including Linux, provide means for determining after the
 fact whether some forms of interference have occurred.
-For example, if your test encountered process-based interference, a
+For example, if your test encountered process-based interference,
 a context switch must have occurred during the test.
 On Linux-based systems, this context switch will be visible in
 \co{/proc/<PID>/sched} in the \co{nr_switches} field.
@@ -2248,7 +2248,7 @@ beginning of the sorted list, and use these to estimate a typical
 inter-element delta, which in turn may be multiplied by the number of
 elements in the list to obtain an upper bound on permissible values.
 The algorithm then repeatedly considers the next element of the list.
-If it is falls below the upper bound, and if the distance between
+If it falls below the upper bound, and if the distance between
 the next element and the previous element is not too much greater than
 the average inter-element distance for the portion of the list accepted
 thus far, then the next element is accepted and the process repeats.
@@ -2343,7 +2343,7 @@ This script takes three optional arguments as follows:
 	This defaults to 0.01, which is equivalent to 1\%.
 \item	\co{--trendbreak}: Ratio of inter-element spacing constituting
 	a break in the trend of the data.
-	Fr example, if the average spacing in the data accepted so far
+	For example, if the average spacing in the data accepted so far
 	is 1.5, then if the trend-break ratio is 2.0, then if the next
 	data value differs from the last one by more than 3.0, this
 	constitutes a break in the trend.
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index eed973c29582..aa354abdff50 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -481,7 +481,7 @@ The Linux kernel currently has a surprising number of RCU APIs and
 implementations.
 There is some hope of reducing this number, evidenced by the fact
 that a given build of the Linux kernel currently has at most
-three implementations behind four APIs (given that RCU Classic
+four implementations behind three APIs (given that RCU Classic
 and Realtime RCU share the same API).
 However, careful inspection and analysis will be required, just as
 would be required in order to eliminate one of the many locking APIs.
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 0b4a51ccca85..03d6e120eafe 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -160,7 +160,7 @@ Figure~\ref{fig:defer:Waiting for Pre-Existing Readers},
 with time advancing from the top of the figure to the bottom.

 Although production-quality implementations of this approach can be
-quite complex, a toy implementatoin is exceedingly simple:
+quite complex, a toy implementation is exceedingly simple:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
diff --git a/defer/toyrcu.tex b/defer/toyrcu.tex
index c9ba9e98d012..3f098c63e026 100644
--- a/defer/toyrcu.tex
+++ b/defer/toyrcu.tex
@@ -1142,7 +1142,7 @@ As with the implementation described in
 Section~\ref{defer:Simple Counter-Based RCU},
 the read-side primitives scale extremely well, incurring roughly
 115~nanoseconds of overhead regardless of the number of CPUs.
-The \co{synchronize_rcu()} primitives is still expensive,
+The \co{synchronize_rcu()} primitive is still expensive,
 ranging from about one microsecond up to about 16~microseconds.
 This is nevertheless much cheaper than the roughly 200~microseconds
 incurred by the implementation in
@@ -1905,7 +1905,7 @@ not only of RCU itself, but also of the requirements of enclosing
 software environments and applications.
 Those wishing an even deeper understanding are invited to read
 descriptions of production-quality RCU
-implmentations~\cite{MathieuDesnoyers2012URCU,PaulEMcKenney2007PreemptibleRCU,PaulEMcKenney2008HierarchicalRCU,PaulEMcKenney2009BloatwatchRCU}.
+implementations~\cite{MathieuDesnoyers2012URCU,PaulEMcKenney2007PreemptibleRCU,PaulEMcKenney2008HierarchicalRCU,PaulEMcKenney2009BloatwatchRCU}.

 The preceding sections listed some desirable properties of the
 various RCU primitives.
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index c7aaf5d72abb..11cb4e2e3f55 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -93,7 +93,7 @@ traversed.
 Hazard pointers incur the overhead of a memory barrier for each data element
 traversed, and sequence locks incur the overhead of a pair of memory barriers
 for each attempt to execute the critical section.
-The overhead of RCU implemntations vary from nothing to that of a pair of
+The overhead of RCU implementations vary from nothing to that of a pair of
 memory barriers for each read-side critical section, thus providing RCU
 with the best performance, particularly for read-side critical sections
 that traverse many data elements.
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 56b93efc99b7..abbd8754fbac 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -365,7 +365,7 @@ The \co{rcu_try_flip_waitack_state()} state invokes

 Lines~7 and 8 pick up current and snapshot versions of
 \co{dynticks_progress_counter}, respectively.
-The memory barrier on line~ensures that the counter checks
+The memory barrier on line~9 ensures that the counter checks
 in the later \co{rcu_try_flip_waitzero_state} follow
 the fetches of these counters.
 Lines~10 and 11 return zero (meaning no communication with the
@@ -1222,7 +1222,7 @@ incrementing the control variable.
 Line~10 tells \co{dyntick_nohz()} that an interrupt handler
 is running, and line~45 tells \co{dyntick_nohz()} that this
 handler has completed.
-Line~49 is used for liveness verification, much as is the corresponding
+Line~49 is used for liveness verification, just like the corresponding
 line of \co{dyntick_nohz()}.

 \QuickQuiz{}
@@ -1319,7 +1319,7 @@ results in a correct verification with roughly half a million
 states, passing without errors.
 However, this version of the model does not handle nested
 interrupts.
-This topic is taken up in the nest section.
+This topic is taken up in the next section.

 \subsubsection{Validating Nested Interrupt Handlers}
 \label{sec:formal:Validating Nested Interrupt Handlers}
@@ -1434,7 +1434,7 @@ This model (\url{dyntickRCU-irq-ssl.spin})
 results in a correct verification with a bit more than half a million
 states, passing without errors.
 However, this version of the model does not handle NMIs,
-which are taken up in the nest section.
+which are taken up in the next section.

 \subsubsection{Validating NMI Handlers}
 \label{sec:formal:Validating NMI Handlers}
@@ -2026,7 +2026,7 @@ the opposite \co{dynticks} polarity.
 \end{figure}

 Figure~\ref{fig:formal:NMIs From Dynticks-Idle Mode}
-show the \co{rcu_nmi_enter()} and \co{rcu_nmi_exit()} functions,
+shows the \co{rcu_nmi_enter()} and \co{rcu_nmi_exit()} functions,
 which inform RCU of NMI entry and exit, respectively, from dynticks-idle
 mode.
 However, if the NMI arrives during an irq handler, then RCU will already
@@ -2101,7 +2101,7 @@ the fact that no RCU read-side critical sections may appear in
 dynticks-idle mode.
 Lines~23-25 check to see if the prior irq handlers enqueued any
 RCU callbacks, forcing this CPU out of dynticks-idle mode via
-an reschedule IPI if so.
+a reschedule API if so.

 \subsubsection{Checking For Dynticks Quiescent States}
 \label{sec:formal:Checking For Dynticks Quiescent States}
@@ -2145,7 +2145,7 @@ Figures~\ref{fig:formal:Entering and Exiting Dynticks-Idle Mode},
 \ref{fig:formal:Interrupts From Dynticks-Idle Mode}.
 Lines~11 and 12 record the snapshots for later calls to
 \co{rcu_implicit_dynticks_qs},
-and lines~13 and~14 checks to see if the CPU is in dynticks-idle mode with
+and lines~13 and~14 check to see if the CPU is in dynticks-idle mode with
 neither irqs nor NMIs in progress (in other words, both snapshots
 have even values), hence in an extended quiescent state.
 If so, lines~15 and 16 count this event, and line~17 returns
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index f08fda354725..f5cbc2afe5e9 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -130,7 +130,7 @@ Lines 19-28 actually do the initialization, while lines 29-39
 perform the assertion.
 Both are atomic blocks in order to avoid unnecessarily increasing
 the state space: because they are not part of the algorithm proper,
-we loose no verification coverage by making them atomic.
+we lose no verification coverage by making them atomic.

 The do-od construct on lines 21-27 implements a Promela loop,
 which can be thought of as a C {\tt for (;;)} loop containing a
@@ -389,7 +389,7 @@ Given a source file \url{qrcu.spin}, one can use the following commands:
 	liveness, fairness, or forward-progress checks, you may need
 	to compile without \co{-DSAFETY}.  If you leave off \co{-DSAFETY}
 	when you could have used it, the program will let you know.
-	
+
 	The optimizations produced by \co{-DSAFETY} greatly speed things
 	up, so you should use it when you can.
 	An example situation where you cannot use \co{-DSAFETY} is
@@ -461,7 +461,7 @@ C++, or Java.
 	progress and terminate the loop.  In Promela, loop counters
 	must be avoided like the plague because they cause the state
 	space to explode.  On the other hand, there is no penalty for
-	infinite loops in Promela as long as the none of the variables
+	infinite loops in Promela as long as none of the variables
 	monotonically increase or decrease -- Promela will figure out
 	how many passes through the loop really matter, and automatically
 	prune execution beyond that point.
@@ -855,7 +855,7 @@ qrcu_read_unlock(&my_qrcu_struct, idx);
 	but, like SRCU's \co{synchronize_srcu()}, QRCU's
 	\co{synchronize_qrcu()} need wait only for those read-side
 	critical sections that are using the same \co{qrcu_struct}.
-	
+
 	For example, \co{synchronize_qrcu(&your_qrcu_struct)}
 	would \emph{not} need to wait on the earlier QRCU read-side
 	critical section.
@@ -895,7 +895,7 @@ two \co{#define} statements, giving us not one but two ways to create
 combinatorial explosion.
 The \co{idx} variable controls which of the two elements of the \co{ctr}
 array will be used by readers, and the \co{readerprogress} variable
-allows to assertion to determine when all the readers are finished
+allows an assertion to determine when all the readers are finished
 (since a QRCU update cannot be permitted to complete until all
 pre-existing readers have completed their QRCU read-side critical
 sections).
diff --git a/future/future.tex b/future/future.tex
index e431fa7318a1..65eb681c40c3 100644
--- a/future/future.tex
+++ b/future/future.tex
@@ -54,7 +54,7 @@ I list but three:
 	Note that Haskell's \emph{monads} were invented to deal with
 	single-threaded global state, and that multi-threaded access to
 	global state requires additional violence to the functional model.
-\item	Multithreaded procedural languages often use synchonization
+\item	Multithreaded procedural languages often use synchronization
 	primitives such as locks, atomic operations, and transactions,
 	which inflict added violence upon the functional model.
 \item	Procedural languages can \emph{alias} function arguments,
diff --git a/future/htm.tex b/future/htm.tex
index 09b5deef8d58..5512b95912d9 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -95,9 +95,9 @@ HTM's advantage is greatest in cases where a lock data structure is
 placed in a separate cache line, in which case, converting a given
 critical section to an HTM transaction can reduce that critical section's
 overhead by a full cache miss.
-This savings can be quite significant for the common case of short
+These savings can be quite significant for the common case of short
 critical sections, at least for those situations where the elided lock
-does not share a cache line with a oft-written variable protected by
+does not share a cache line with an oft-written variable protected by
 that lock.

 \QuickQuiz{}
@@ -265,7 +265,7 @@ For example, suppose that transactions~A and~B are defined as follows:
 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \begin{verbatim}
-Trasaction A        Transaction B
+Transaction A       Transaction B

 x = 1;              y = 2;
 y = 3;              x = 4;
@@ -452,7 +452,7 @@ short-duration transactions could be guaranteed to eventually succeed.
 This would permit a transaction to be unconditionally retried, in the
 same way that compare-and-swap (CAS) and load-linked/store-conditional
 (LL/SC) operations are unconditionally retried in code that uses these
-instructions to implement atomic operation.
+instructions to implement atomic operations.

 Unfortunately, most currently available HTM implementation refuse to
 make any
@@ -886,7 +886,7 @@ Table~\ref{tab:future:Comparison of Locking and HTM}
 results in the updated comparison between augmented locking and HTM
 shown in
 Table~\ref{tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}.
-A summary of the differnces between the two tables is as follows:
+A summary of the differences between the two tables is as follows:

 \begin{enumerate}
 \item	Use of non-blocking read-side mechanisms alleviates deadlock issues.
@@ -914,7 +914,7 @@ page~\pageref{fig:defer:RCU Areas of Applicability}, that is no reason not to
 start moving in that direction.

 HTM seems best suited to update-heavy workloads involving relatively
-small changes to disparate portions of a relatively large in-memory
+small changes to disparate portions of relatively large in-memory
 data structures running on large multiprocessors,
 as this meets the size restrictions of current HTM implementations while
 minimizing the probability of conflicts and attendant aborts and
@@ -943,7 +943,7 @@ Nevertheless, it is quite possible that a steady stream of RCU or
 hazard-pointer readers might starve updaters due to a corresponding
 steady stream of conflicts.
 This vulnerability could be eliminated (perhaps at significant
-hardware cost and complexity) by giving extra-tranactional
+hardware cost and complexity) by giving extra-transactional
 reads the pre-transaction copy of the memory location being loaded.

 The fact that HTM transactions must have fallbacks might in some cases
@@ -988,7 +988,7 @@ interrupt frequency, and scheduler implementation.
 Cache size and associativity was discussed in
 Section~\ref{sec:future:Transaction-Size Limitations},
 along with some research intended to work around current limitations.
-However, we HTM forward-progress guarantees would
+However, HTM forward-progress guarantees would
 come with size limits, large though these limits might one day be.
 So why don't current HTM implementations provide forward-progress
 guarantees for small transactions, for example, limited to the
diff --git a/future/tm.tex b/future/tm.tex
index 3e42e740c2cb..f3142f382635 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -196,7 +196,7 @@ Here are some options available to TM:
 	multiple nested transactions).
 	Alternatively, enlist the compiler to enforce RPC-free
 	transactions.
-	This approach does works, but will require TM to
+	This approach does work, but will require TM to
 	interact with other synchronization primitives.
 \item	Permit only one special
 	irrevocable transaction~\cite{SpearMichaelScott2008InevitableSTM}
@@ -333,7 +333,7 @@ How could a similar persistent functionality be provided for TM?
 	Unfortunately, this does not handle network communication,
 	nor does it handle I/O to devices that do not provide snapshot
 	capabilities, for example, memory sticks.
-\item	Build a time machine. 
+\item	Build a time machine.
 \end{enumerate}

 Of course, the fact that it is called transactional \emph{memory}
@@ -416,7 +416,7 @@ What might TM do about thread spawning within a transaction?
 	participating in the transaction?
 	The answers to these questions are reasonably straightforward
 	in the case of locking.
-	The answers for TM are left as an exercise for the reader. 
+	The answers for TM are left as an exercise for the reader.
 \end{enumerate}

 Given that parallel execution of transactions is commonplace in the
@@ -484,10 +484,10 @@ from within a transaction?
 	This approach has some advantages over aborting the transaction
 	at runtime, but again requires non-TM synchronization primitives
 	for use in conjunction with \co{exec()}.
-\item	Treat the transaction in a manner similar to non-persistent	
+\item	Treat the transaction in a manner similar to non-persistent
 	Locking primitives, so that the transaction survives if exec()
 	fails, and silently commits if the \co{exec()} succeeds.
-	The case were some of the variables affected by the transaction
+	The case where some of the variables affected by the transaction
 	reside in \co{mmap()}ed memory (and thus could survive a successful
 	\co{exec()} system call) is left as an exercise for the reader.
 \item	Abort the transaction (and the \co{exec()} system call) if the
@@ -542,7 +542,7 @@ Options for part (a), the actual loading of the code, include the following:
 	already present, and the transaction can thus be expected to
 	proceed normally.
 \item	Disallow dynamic linking and loading of functions from within
-	transactions. 
+	transactions.
 \end{enumerate}

 Options for part (b), the inability to detect TM-unfriendly operations
@@ -572,7 +572,7 @@ in a not-yet-loaded function, possibilities include the following:
 	That said, the standardization effort is already in
 	progress~\cite{Ali-Reza-Adl-Tabatabai2009CppTM}.
 \item	As above, disallow dynamic linking and loading of functions from
-	within transactions. 
+	within transactions.
 \end{enumerate}

 I/O operations are of course a known weakness of TM, and dynamic linking
@@ -702,7 +702,7 @@ quite well, at least as long as the usual well-known software-engineering
 techniques are employed to avoid deadlock.
 It is not unusual to acquire locks from within RCU read-side critical
 sections, which eases deadlock concerns because RCU read-side primitives
-cannot participated in lock-based deadlock cycles.
+cannot participate in lock-based deadlock cycles.
 But happens when you attempt to acquire a lock from within a transaction?

 In theory, the answer is trivial: simply manipulate the data structure
@@ -738,10 +738,10 @@ the occasional transaction.
 	done by the TxLinux~\cite{ChistopherJRossbach2007a} group.
 	This approach seems sound, but leaves the locking design
 	constraints (such as the need to avoid deadlock) firmly in place.
-\item	Strive to reduce the overhead imposed on locking primitives. 
+\item	Strive to reduce the overhead imposed on locking primitives.
 \end{enumerate}

-The fact that there could possibly a problem interfacing TM and locking
+The fact that there could possibly be a problem interfacing TM and locking
 came as a surprise to many, which underscores the need to try out new
 mechanisms and primitives in real-world production software.
 Fortunately, the advent of open source means that a huge quantity of
@@ -755,7 +755,7 @@ other locks, which just works, at least as long as the usual well-known
 software-engineering techniques are employed to avoid deadlock.
 Read-acquiring reader-writer locks from within RCU read-side critical
 sections also works, and doing so eases deadlock concerns because RCU
-read-side primitives cannot participated in lock-based deadlock cycles.
+read-side primitives cannot participate in lock-based deadlock cycles.
 But what happens when you attempt to read-acquire a reader-writer lock
 from within a transaction?

@@ -899,7 +899,7 @@ Some possibilities are as follows:
 	to be atomic, the ordering of the accesses within the transaction
 	is not supposed to matter.
 \item	Prohibit use of TM in RCU updates.
-	This is guaranteed to work, but seems a bit restrictive. 
+	This is guaranteed to work, but seems a bit restrictive.
 \end{enumerate}

 It seems likely that additional approaches will be uncovered, especially
diff --git a/locking/locking.tex b/locking/locking.tex
index 9feeaf077a7d..993e27fda126 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -653,7 +653,7 @@ Once all needed locks have been acquired, the transaction enters the
 second phase, where locks are released, but not acquired.
 This locking approach allows databases to provide serializability
 guarantees for their transactions, in other words, to guarantee
-that all of values see and produced by the transactions are consistent
+that all values seen and produced by the transactions are consistent
 with some global ordering of all the transactions.
 Many such systems rely on the ability to abort transactions, although
 this can be simplified by avoiding making any changes to shared data
@@ -982,7 +982,7 @@ Figure~\ref{fig:locking:Conditional Locking and Exponential Backoff}.
 		required to execute the critical section, which will
 		normally be in the microsecond or millisecond range.
 	\item	The code does not check for overflow.
-		On the other hand, this bug is nullified 
+		On the other hand, this bug is nullified
 		by the previous bug: 32 bits worth of seconds is
 		more than 50 years.
 	\end{enumerate}
@@ -1450,7 +1450,7 @@ However, RAII locking also has a dark side.
 RAII makes it quite difficult to encapsulate lock acquisition and release,
 for example, in iterators.
 In many iterator implementations, you would like to acquire the lock in
-the interator's ``start'' function and release it in the iterator's ``stop''
+the iterator's ``start'' function and release it in the iterator's ``stop''
 function.
 RAII locking instead requires that the lock acquisition and release take
 place in the same level of scoping, making such encapsulation difficult or
@@ -1949,7 +1949,7 @@ synchronization design on locking, such software also almost always
 makes use of other synchronization mechanisms, including
 special counting algorithms (Chapter~\ref{chp:Counting}),
 data ownership (Chapter~\ref{chp:Data Ownership}),
-reference counting (Section~\ref{sec:defer:Reference Counting}), 
+reference counting (Section~\ref{sec:defer:Reference Counting}),
 sequence locking (Section~\ref{sec:defer:Sequence Locks}), and
 read-copy update (Section~\ref{sec:defer:Read-Copy Update (RCU)}).
 In addition, practitioners use tools for deadlock
@@ -2106,7 +2106,7 @@ by deciding where the locks should be acquired and released.

 In particular, this strategy allows the lock acquisition and release
 functions to block signals as needed without the library code needing to
-be concerned with of which signals need to be blocked by which locks.
+be concerned with which signals need to be blocked by which locks.
 The separation of concerns used by this strategy can be quite effective,
 but in some cases the strategies laid out in the following sections
 can work better.
@@ -2212,7 +2212,7 @@ but not as easy as constructing a parallel application.
 With the advent of readily available low-cost multicore systems,
 a common task is parallelizing an existing library that was designed
 with only single-threaded use in mind.
-This all-to-common disregard for parallelism can result in a library
+This all-too-common disregard for parallelism can result in a library
 API that is severely flawed from a parallel-programming viewpoint.
 Candidate flaws include:

diff --git a/qqz.tex b/qqz.tex
index d09e484cbafe..c30a4e216140 100644
--- a/qqz.tex
+++ b/qqz.tex
@@ -3134,7 +3134,7 @@ ret = ~ret & tmp;
 		required to execute the critical section, which will
 		normally be in the microsecond or millisecond range.
 	\item	The code does not check for overflow.
-		On the other hand, this bug is nullified 
+		On the other hand, this bug is nullified
 		by the previous bug: 32 bits worth of seconds is
 		more than 50 years.
 	\end{enumerate}
@@ -5377,7 +5377,7 @@ srcu_read_unlock(&srcucb, idx);
 	The code in
 	Figures~\ref{fig:datastruct:Resizable Hash-Table Bucket Selection}
 	and~\ref{fig:datastruct:Resizable Hash-Table Update-Side Concurrency Control}
-	compute the hash and execute the bucket-selection logic twice for
+	computes the hash and executes the bucket-selection logic twice for
 	updates!
 	Why this blatant inefficiency?
 \QuickA{}
@@ -5390,7 +5390,7 @@ srcu_read_unlock(&srcucb, idx);
 \QuickQ{}
 	Suppose that one thread is inserting an element into the
 	new hash table during a resize operation.
-	What prevents this insertion to be lost due to a subsequent
+	What prevents this insertion from being lost due to a subsequent
 	resize operation completing before the insertion does?
 \QuickA{}
 	The second resize operation will not be able to move beyond
@@ -5402,7 +5402,7 @@ srcu_read_unlock(&srcucb, idx);
 	RCU read-side critical section.
 	As we will see when we examine the \co{hashtab_resize()}
 	function, this means that the first resize operation will
-	use 
+	use
 	\co{synchronize_rcu()} to wait for the insertion's read-side
 	critical section to complete.

@@ -5846,7 +5846,7 @@ srcu_read_unlock(&srcucb, idx);
 \QuickQ{}
 	That is ridiculous!!!
 	After all, isn't getting the correct answer later than one would like
-	\emph{has} better than getting an incorrect answer???
+	better than getting an incorrect answer???
 \QuickA{}
 	This question fails to consider the option of choosing not to
 	compute the answer at all, and in doing so, also fails to consider
@@ -6685,7 +6685,7 @@ srcu_read_unlock(&srcucb, idx);
 	If the CPU is not required to see all of its loads and
 	stores in order, then the {\tt b=1+a} might well see an
 	old version of the variable ``a''.
-	
+
 	This is why it is so very important that each CPU or thread
 	see all of its own loads and stores in program order.

@@ -6703,7 +6703,7 @@ srcu_read_unlock(&srcucb, idx);
 	that they were first, they would all see {\tt p==NULL}, and
 	they would all allocate memory.
 	All but one of those allocations would be leaked.
-	
+
 	This is why it is so very important that all the critical sections
 	for a given exclusive lock appear to execute in some well-defined
 	order.
@@ -6720,7 +6720,7 @@ srcu_read_unlock(&srcucb, idx);
 	to see the most recent store to this variable, it might well see
 	the original value of zero, and therefore set the counter to
 	one, which would be going backwards.
-	
+
 	This is why it is so very important that loads from a given variable
 	in a given critical
 	section see the last store from the last prior critical section to
diff --git a/rt/rt.tex b/rt/rt.tex
index 538a34af8d2f..daf943c30151 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -37,7 +37,7 @@ said to be a soft real-time application:
 ``My application computes million-point fourier transforms in half a
 picosecond.''
 ``No way!!!
-The clock cycle on this system is more the \emph{three hundred} picoseconds!''
+The clock cycle on this system is more than \emph{three hundred} picoseconds!''
 ``Ah, but it is a \emph{soft} real-time application!''
 If the term ``soft real time'' is to be of any use whatesoever, some limits
 are clearly required.
@@ -218,8 +218,8 @@ that portion of the outside world that is to be monitored or controlled.
 	stop operating.
 } \QuickQuizEnd

-A number of systems intended to operate in environments with impressive
-levels shock and vibration, for example, engine control systems.
+A number of systems are intended to operate in environments with impressive
+levels of shock and vibration, for example, engine control systems.
 More strenuous requirements may be found when we move away from
 continuous vibrations to intermittent shocks.
 For example, during my undergraduate studies, I encountered an old Athena
@@ -240,7 +240,7 @@ the effects of low-energy electromagnetic radiation, error-correction
 coding can reduce the effects of high-energy radiation, various potting
 and sealing techniques can reduce the effect of air quality, and any
 number of heating and cooling systems can counter the effects of temperature.
-In extreme cases, triple modulo redundancy can reduce the probability that
+In extreme cases, triple modular redundancy can reduce the probability that
 a fault in one part of the system will result in incorrect behavior from
 the overall system.
 However, all of these methods have one thing in common:  Although they
@@ -292,7 +292,7 @@ real-time systems.
 } \QuickQuizEnd

 Of course, maintaining sufficiently low utilization requires great
-discipline throughout the design and implmeentation.
+discipline throughout the design and implementation.
 There is nothing quite like a little feature creep to destroy deadlines.

 \subsubsection{Application Constraints}
@@ -368,7 +368,7 @@ cylinder contained in the log to the blade,
 (4)~Continuously vary the knife's position so as to peel the log into veneer,
 (5)~Remove the remaining core of the log that is too small to peel, and
 (6)~Wait for the next log.
-Each of these five phases of operation might well have its own set of
+Each of these six phases of operation might well have its own set of
 deadlines and environmental constraints,
 for example, one would expect phase~4's deadlines to be much more severe
 than those of phase 6, milliseconds instead of seconds.
@@ -437,7 +437,7 @@ large advances are required.
 	systems~\cite{JadeAlglave2011ppcmem,Alglave:2013:SVW:2450268.2450306}.
 } \QuickQuizEnd

-In addition to latency requirement for the real-time portions of the
+In addition to latency requirements for the real-time portions of the
 application, there will likely be performance and scalability requirements
 for the non-real-time portions of the application.
 These additional requirements reflect the fact that ultimate real-time
@@ -456,7 +456,7 @@ the sound-bite-based approach to real-time computing.
 \label{sec:rt:Who Needs Real-Time Computing?}

 It is possible to argue that all computing is in fact real-time computing.
-For one moderately extreme example, when purchase a birthday gift online,
+For one moderately extreme example, when you purchase a birthday gift online,
 you would like the gift to arrive before the recipient's birthday.
 And in fact even turn-of-the-millenium web services observed sub-second
 response constraints~\cite{KristofferBohmann2001a}, and requirements have
@@ -694,13 +694,13 @@ utility thread running on Linux, there are invariably rough edges.
 In addition, the RTOS must interface to both the hardware and to
 the Linux kernel, thus requiring significant maintenance with
 changes in both hardware and kernel.
-Furthermore, each such RTOSes often has its own system-call interface
+Furthermore, each such RTOS often has its own system-call interface
 and set of system libraries, which can balkanize both ecosystems and
 developers.
 In fact, these problems seem to be what drove the combination of
 RTOSes with Linux, as this approach allowed access to the full real-time
 capabilities of the RTOS, while allowing the application's non-real-time
-code full access Linux's rich and vibrant open-source ecosystem.
+code full access to Linux's rich and vibrant open-source ecosystem.

 \begin{figure*}[p]
 \begin{center}
@@ -746,7 +746,7 @@ This of course greatly improves real-time response latency, but
 preemption is still disabled
 within RCU read-side critical sections,
 spinlock critical sections,
-interrupt handlers, 
+interrupt handlers,
 interrupt-disabled code regions, and
 preempt-disabled code regions, as indicated by the red boxes in the
 left-most diagram in the middle row of the figure.
@@ -791,7 +791,7 @@ If configured properly, a non-trivial undertaking, \co{CONFIG_NO_HZ_FULL}
 offers real-time threads levels of performance nearly rivaling that of
 bare-metal systems.

-Some has of course been much debate over which of these approaches
+There has of course been much debate over which of these approaches
 is best for real-time systems, and this debate has been going on for
 quite some
 time~\cite{JonCorbet2004RealTimeLinuxPart1,JonCorbet2004RealTimeLinuxPart2}.
@@ -917,7 +917,7 @@ that timeouts cannot be set for finer than one-millisecond granularities.
 On the other hand,
 Figure~\ref{fig:rt:Timer Wheel at 100kHz}
 shows timer processing taking place every ten microseconds, which
-provides acceptably find timer granularity for most (but not all!)
+provides acceptably fine timer granularity for most (but not all!)
 workloads, but which processes timers so frequently that the system
 might well not have time to do anything else.

@@ -952,7 +952,7 @@ is good and sufficient.
 Another key observation is that error-handling timeouts are normally
 cancelled very early, often before they can be cascaded.
 A final observation is that systems commonly have many more error-handling
-timeouts than they do timer events, so that an $O(\log n)$ 
+timeouts than they do timer events, so that an $O(\log n)$
 data structure should provide acceptable performance for timer events.

 In short, the Linux kernel's -rt patchset uses timer wheels for
@@ -973,7 +973,7 @@ namely long-running interrupt handlers,
 as shown in
 Figure~\ref{fig:rt:Non-Threaded Interrupt Handler}.
 These latencies can be especially problematic for devices that can
-deliver large number of events with a single interrupt, which means
+deliver a large number of events with a single interrupt, which means
 that the interrupt handler will run for an extended period of time
 processing all of these events.
 Worse yet are devices that can deliver new events to a still-running
@@ -1089,9 +1089,9 @@ priority-inversion conundrum:
 \item	Only allow one read-acquisition of a given reader-writer lock
 	at a time.  (This is the approach traditionally taken by
 	the Linux kernel's -rt patchset.)
-\item	Only allow $N$ read-acquisitions of a given reader-writer lcok
+\item	Only allow $N$ read-acquisitions of a given reader-writer lock
 	at a time, where $N$ is the number of CPUs.
-\item	Only allow $N$ read-acquisitions of a given reader-writer lcok
+\item	Only allow $N$ read-acquisitions of a given reader-writer lock
 	at a time, where $N$ is a number specified somehow by the
 	developer.
 	There is a good chance that the Linux kernel's -rt patchset
@@ -1255,8 +1255,8 @@ boosting of large numbers of readers.
 \paragraph{Preemptible spinlocks}
 are an important part of the -rt patchset due to the long-duration
 spinlock-based critical sections in the Linux kernel.
-This functionality has not yet reached mainline: Although they is a conceptually
-simple substitution of sleeplocks for spinlocks, they has proven relatively
+This functionality has not yet reached mainline: Although they are a conceptually
+simple substitution of sleeplocks for spinlocks, they have proven relatively
 controversial.\footnote{
 	In addition, development of the -rt patchset has slowed in recent
 	years, perhaps because the real-time functionality that is already
@@ -1342,7 +1342,7 @@ Specific per-kthread advice may be found in the Linux kernel source
 A third source of OS jitter in the Linux kernel for CPU-bound threads
 running at real-time priority is the scheduler itself.
 This is an intentional debugging feature, designed to ensure that
-important non-realtime work is allotted at least 50 milliseoncds
+important non-realtime work is allotted at least 50 milliseconds
 out of each second, even if there is an infinite-loop bug in
 your real-time application.
 However, when you are running a polling-loop-style real-time application,
@@ -1430,7 +1430,7 @@ housekeeping CPUs to handle the housekeeping load imposed by the
 rest of the system, which requires careful benchmarking and tuning.

 Of course, there is no free lunch, and \co{NO_HZ_FULL} is no exception.
-As noted earlier, 
+As noted earlier,
 \co{NO_HZ_FULL} makes kernel/user transitions more expensive due to the
 need for delta process accounting and the need to inform kernel subsystems
 (such as RCU) of the transitions.
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 55062e3efe0e..94e4d13efa6a 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -330,7 +330,7 @@ lock.
 This section shows how RCU may be used to avoid this overhead.

 The code for performing an I/O is quite similar to the original, with
-an RCU read-side critical section be substituted for the reader-writer
+a RCU read-side critical section being substituted for the reader-writer
 lock read-side critical section in the original:

 \vspace{5pt}
diff --git a/together/count.tex b/together/count.tex
index 009239c242a5..892133d019b0 100644
--- a/together/count.tex
+++ b/together/count.tex
@@ -8,7 +8,7 @@ This section outlines possible solutions to some counter conundrums.
 \subsection{Counting Updates}
 \label{sec:together:Counting Updates}

-Suppose that Sch\"odinger (see
+Suppose that Schr\"odinger (see
 Section~\ref{sec:datastruct:Motivating Application})
 wants to count the number of updates for each animal,
 and that these updates are synchronized using a per-data-element lock.
@@ -23,7 +23,7 @@ protection of that element's lock!
 \subsection{Counting Lookups}
 \label{sec:together:Counting Lookups}

-Suppose that Sch\"odinger also wants to count the number of lookups for
+Suppose that Schr\"odinger also wants to count the number of lookups for
 each animal, where lookups are protected by RCU.
 How can this counting best be done?

diff --git a/together/hash.tex b/together/hash.tex
index 9c7f1b7caeda..60acdb10d6b4 100644
--- a/together/hash.tex
+++ b/together/hash.tex
@@ -14,7 +14,7 @@ This situation is analogous to that in
 Section~\ref{sec:together:Correlated Fields}:
 We have a hash table where we need correlated views of two or more of
 the elements.
-These elements are updated together, and we do not want so see an old
+These elements are updated together, and we do not want to see an old
 version of the first element along with new versions of the other
 elements.
 For example, Schr\"odinger decided to add his extended family to his
@@ -24,7 +24,7 @@ happen instantaneously, he is also a traditionalist.
 As such, he absolutely does not want his database ever to show that the
 bride is now married, but the groom is not, and vice versa.
 In other words, Schr\"odinger wants to be able to carry out a
-wedlock-consistent tranversal of his database.
+wedlock-consistent traversal of his database.

 One approach is to use sequence locks
 (see Section~\ref{sec:defer:Sequence Locks}),
@@ -40,7 +40,7 @@ This approach works quite well when the number of correlated elements is
 small, the time to read these elements is short, and the update rate is
 low.
 Otherwise, updates might happen so quickly that readers might never complete.
-Although Schr\"odinger does not expect that even is least-sane relatives
+Although Schr\"odinger does not expect that even his least-sane relatives
 will marry and divorce quickly enough for this to be a problem,
 he does realize that this problem could well arise in other situations.
 One way to avoid this reader-starvation problem is to have the readers
@@ -74,7 +74,7 @@ interested reader.
 Suppose that a statistical scan of all elements in a hash table is
 required.
 For example, Schr\"odinger might wish to compute the average
-length-to-weight ratio over all of his animals.\footnote{	
+length-to-weight ratio over all of his animals.\footnote{
 	Why would such a quantity be useful?
 	Beats me!
 	But group statistics in general are often useful.}

