Return-Path: <SRS0=4wRT=KD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ej1Bb4rZQH+JSsoG7it4TrDc670FWyIRnXRCpYqsmeY=;
        b=ge5XuKOmL8wDI7G55xpcic1xyDykiUdMkWP2ChxndUgUFVjWsyVE4i41+skW9xCARL
         0DxkLfcTPcba49/ujyNdJrMypnpW5g3a10iQYdCYxldMGnSjB9NzPlyWq+j4O6iBrgjF
         KfJ4jdTK8g3RGc10m6U15Mf6f5ZVAWhqre5J19DxKVjj6gHwmAesDgNEcFszXw/mR/eo
         9M+UobCPlZ6cmDxFF+tunxsHumnLd9dUtd1Ezh0Z9B6s12JBgBpMr1BWmDDqHIJPSKPS
         L3jbgMfqd1jq2F8MM5SJ/23k1qsyq+kUHvB0rzMd6TmMo01zV4DZSac28LRKLBiJDHmK
         DSIA==
Subject: [PATCH -perfbook 3/4] locking: Employ \cref{} and its variants
References: <d66be1a7-9ef3-bf69-de15-2a684894bc12@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5495aab0-0d49-9d3e-7af4-6a46002e184c@gmail.com>
Date: Sat, 8 May 2021 16:09:21 +0900
MIME-Version: 1.0
In-Reply-To: <d66be1a7-9ef3-bf69-de15-2a684894bc12@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also fix in indent by white spaces in a Quick Quiz.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 locking/locking-existence.tex |  22 +--
 locking/locking.tex           | 268 +++++++++++++++++-----------------
 2 files changed, 143 insertions(+), 147 deletions(-)

diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index e866a511..86aeace7 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -97,14 +97,14 @@ structure.
 Unfortunately, putting the lock that is to protect a data element
 in the data element itself is subject to subtle race conditions,
 as shown in
-Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}.
+\cref{lst:locking:Per-Element Locking Without Existence Guarantees}.
 
 \QuickQuiz{
 	\begin{fcvref}[ln:locking:Per-Element Locking Without Existence Guarantees]
 	What if the element we need to delete is not the first element
-	of the list on line~\lnref{chk_first} of
-	Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}?
-        \end{fcvref}
+	of the list on \clnref{chk_first} of
+	\cref{lst:locking:Per-Element Locking Without Existence Guarantees}?
+	\end{fcvref}
 }\QuickQuizAnswer{
 	This is a very simple hash table with no chaining, so the only
 	element in a given bucket is the first element.
@@ -117,10 +117,10 @@ Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}.
 To see one of these race conditions, consider the following sequence
 of events:
 \begin{enumerate}
-\item	Thread~0 invokes \co{delete(0)}, and reaches line~\lnref{acq} of
+\item	Thread~0 invokes \co{delete(0)}, and reaches \clnref{acq} of
 	the listing, acquiring the lock.
 \item	Thread~1 concurrently invokes \co{delete(0)}, reaching
-	line~\lnref{acq}, but spins on the lock because Thread~0 holds it.
+	\clnref{acq}, but spins on the lock because Thread~0 holds it.
 \item	Thread~0 executes \clnrefrange{NULL}{return1}, removing the element from
 	the hashtable, releasing the lock, and then freeing the
 	element.
@@ -134,7 +134,7 @@ of events:
 \end{enumerate}
 Because there is no existence guarantee, the identity of the
 data element can change while a thread is attempting to acquire
-that element's lock on line~\lnref{acq}!
+that element's lock on \clnref{acq}!
 \end{fcvref}
 
 \begin{listing}
@@ -168,9 +168,9 @@ int delete(int key)
 \begin{fcvref}[ln:locking:Per-Element Locking With Lock-Based Existence Guarantees]
 One way to fix this example is to use a hashed set of global locks, so
 that each hash bucket has its own lock, as shown in
-Listing~\ref{lst:locking:Per-Element Locking With Lock-Based Existence Guarantees}.
-This approach allows acquiring the proper lock (on line~\lnref{acq}) before
-gaining a pointer to the data element (on line~\lnref{getp}).
+\cref{lst:locking:Per-Element Locking With Lock-Based Existence Guarantees}.
+This approach allows acquiring the proper lock (on \clnref{acq}) before
+gaining a pointer to the data element (on \clnref{getp}).
 Although this approach works quite well for elements contained in a
 single partitionable data structure such as the hash table shown in the
 listing, it can be problematic if a given data element can be a member
@@ -180,6 +180,6 @@ Not only can these problems be solved, but the solutions also form
 the basis of lock-based software transactional memory
 implementations~\cite{Shavit95,DaveDice2006DISC}.
 However,
-Chapter~\ref{chp:Deferred Processing}
+\cref{chp:Deferred Processing}
 describes simpler---and faster---ways of providing existence guarantees.
 \end{fcvref}
diff --git a/locking/locking.tex b/locking/locking.tex
index 0d7666a9..bd678846 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -17,8 +17,8 @@ Interestingly enough, the role of workhorse in production-quality
 shared-memory parallel software is also played by locking.
 This chapter will look into this dichotomy between villain and
 hero, as fancifully depicted in
-Figures~\ref{fig:locking:Locking: Villain or Slob?}
-and~\ref{fig:locking:Locking: Workhorse or Hero?}.
+\cref{fig:locking:Locking: Villain or Slob?,%
+fig:locking:Locking: Workhorse or Hero?}.
 
 There are a number of reasons behind this Jekyll-and-Hyde dichotomy:
 
@@ -31,7 +31,7 @@ There are a number of reasons behind this Jekyll-and-Hyde dichotomy:
 		lockdep facility~\cite{JonathanCorbet2006lockdep}.
 	\item	Locking-friendly data structures, such as
 		arrays, hash tables, and radix trees, which will
-		be covered in Chapter~\ref{chp:Data Structures}.
+		be covered in \cref{chp:Data Structures}.
 	\end{enumerate}
 \item	Some of locking's sins are problems only at high levels of
 	contention, levels reached only by poorly designed programs.
@@ -39,17 +39,17 @@ There are a number of reasons behind this Jekyll-and-Hyde dichotomy:
 	mechanisms in concert with locking.
 	These other mechanisms include
 	statistical counters
-	(see Chapter~\ref{chp:Counting}),
+	(see \cref{chp:Counting}),
 	reference counters
-	(see Section~\ref{sec:defer:Reference Counting}),
+	(see \cref{sec:defer:Reference Counting}),
 	hazard pointers
-	(see Section~\ref{sec:defer:Hazard Pointers}),
+	(see \cref{sec:defer:Hazard Pointers}),
 	sequence-locking readers
-	(see Section~\ref{sec:defer:Sequence Locks}),
+	(see \cref{sec:defer:Sequence Locks}),
 	RCU
-	(see Section~\ref{sec:defer:Read-Copy Update (RCU)}),
+	(see \cref{sec:defer:Read-Copy Update (RCU)}),
 	and simple non-blocking data structures
-	(see Section~\ref{sec:advsync:Non-Blocking Synchronization}).
+	(see \cref{sec:advsync:Non-Blocking Synchronization}).
 \item	Until quite recently, almost all large shared-memory parallel
 	programs were developed in secret, so that it was not easy
 	to learn of these pragmatic solutions.
@@ -59,7 +59,7 @@ There are a number of reasons behind this Jekyll-and-Hyde dichotomy:
 	works well can be expected to have a much more positive
 	opinion of locking than those who have worked on artifacts
 	for which locking works poorly, as will be discussed in
-	Section~\ref{sec:locking:Locking: Hero or Villain?}.
+	\cref{sec:locking:Locking: Hero or Villain?}.
 \item	All good stories need a villain, and locking has a long and
 	honorable history serving as a research-paper whipping boy.
 \end{enumerate}
@@ -127,14 +127,14 @@ it is in turn waiting on.
 
 We can create a directed-graph representation of a deadlock scenario
 with nodes for threads and locks, as shown in
-Figure~\ref{fig:locking:Deadlock Cycle}.
+\cref{fig:locking:Deadlock Cycle}.
 An arrow from a lock to a thread indicates that the thread holds
 the lock, for example, Thread~B holds Locks~2 and~4.
 An arrow from a thread to a lock indicates that the thread is waiting
 on the lock, for example, Thread~B is waiting on Lock~3.
 
 A deadlock scenario will always contain at least one deadlock cycle.
-In Figure~\ref{fig:locking:Deadlock Cycle}, this cycle is
+In \cref{fig:locking:Deadlock Cycle}, this cycle is
 Thread~B, Lock~3, Thread~C, Lock~4, and back to Thread~B.
 
 \QuickQuiz{
@@ -181,21 +181,21 @@ complex, hazardous, and error-prone.
 
 Therefore, kernels and applications should instead avoid deadlocks.
 Deadlock-avoidance strategies include locking hierarchies
-(Section~\ref{sec:locking:Locking Hierarchies}),
+(\cref{sec:locking:Locking Hierarchies}),
 local locking hierarchies
-(Section~\ref{sec:locking:Local Locking Hierarchies}),
+(\cref{sec:locking:Local Locking Hierarchies}),
 layered locking hierarchies
-(Section~\ref{sec:locking:Layered Locking Hierarchies}),
+(\cref{sec:locking:Layered Locking Hierarchies}),
 strategies for dealing with APIs containing pointers to locks
-(Section~\ref{sec:locking:Locking Hierarchies and Pointers to Locks}),
+(\cref{sec:locking:Locking Hierarchies and Pointers to Locks}),
 conditional locking
-(Section~\ref{sec:locking:Conditional Locking}),
+(\cref{sec:locking:Conditional Locking}),
 acquiring all needed locks first
-(Section~\ref{sec:locking:Acquire Needed Locks First}),
+(\cref{sec:locking:Acquire Needed Locks First}),
 single-lock-at-a-time designs
-(Section~\ref{sec:locking:Single-Lock-at-a-Time Designs}),
+(\cref{sec:locking:Single-Lock-at-a-Time Designs}),
 and strategies for signal/interrupt handlers
-(Section~\ref{sec:locking:Signal/Interrupt Handlers}).
+(\cref{sec:locking:Signal/Interrupt Handlers}).
 Although there is no deadlock-avoidance strategy that works perfectly
 for all situations, there is a good selection of tools to choose from.
 
@@ -204,7 +204,7 @@ for all situations, there is a good selection of tools to choose from.
 
 Locking hierarchies order the locks and prohibit acquiring locks out
 of order.
-In Figure~\ref{fig:locking:Deadlock Cycle},
+In \cref{fig:locking:Deadlock Cycle},
 we might order the locks numerically, thus forbidding a thread
 from acquiring a given lock if it already holds a lock
 with the same or a higher number.
@@ -296,10 +296,10 @@ function acquires any of the caller's locks, thus avoiding deadlock.
 	with other \co{qsort()} threads?
 }\QuickQuizAnswer{
 	By privatizing the data elements being compared
-	(as discussed in Chapter~\ref{chp:Data Ownership})
+	(as discussed in \cref{chp:Data Ownership})
 	or through use of deferral mechanisms such as
 	reference counting (as discussed in
-	Chapter~\ref{chp:Deferred Processing}).
+	\cref{chp:Deferred Processing}).
 	Or through use of layered locking hierarchies, as described
 	in \cref{sec:locking:Layered Locking Hierarchies}.
 
@@ -329,8 +329,8 @@ function acquires any of the caller's locks, thus avoiding deadlock.
 \end{figure}
 
 To see the benefits of local locking hierarchies, compare
-Figures~\ref{fig:locking:Without qsort() Local Locking Hierarchy} and
-\ref{fig:locking:Local Locking Hierarchy for qsort()}.
+\cref{fig:locking:Without qsort() Local Locking Hierarchy,%
+fig:locking:Local Locking Hierarchy for qsort()}.
 In both figures, application functions \co{foo()} and \co{bar()}
 invoke \co{qsort()} while holding Locks~A and~B, respectively.
 Because this is a parallel implementation of \co{qsort()}, it acquires
@@ -343,7 +343,7 @@ locks.
 
 Now, if \co{qsort()} holds Lock~C while calling \co{cmp()} in violation
 of the golden release-all-locks rule above, as shown in
-Figure~\ref{fig:locking:Without qsort() Local Locking Hierarchy},
+\cref{fig:locking:Without qsort() Local Locking Hierarchy},
 deadlock can occur.
 To see this, suppose that one thread invokes \co{foo()} while a second
 thread concurrently invokes \co{bar()}.
@@ -358,7 +358,7 @@ Lock~B, resulting in deadlock.
 In contrast, if \co{qsort()} releases Lock~C before invoking the
 comparison function, which is unknown code from \co{qsort()}'s perspective,
 then deadlock is avoided as shown in
-Figure~\ref{fig:locking:Local Locking Hierarchy for qsort()}.
+\cref{fig:locking:Local Locking Hierarchy for qsort()}.
 
 If each module releases all locks before invoking unknown code, then
 deadlock is avoided if each module separately avoids deadlock.
@@ -380,7 +380,7 @@ all of its locks before invoking the comparison function.
 In this case, we cannot construct a local locking hierarchy by
 releasing all locks before invoking unknown code.
 However, we can instead construct a layered locking hierarchy, as shown in
-Figure~\ref{fig:locking:Layered Locking Hierarchy for qsort()}.
+\cref{fig:locking:Layered Locking Hierarchy for qsort()}.
 Here, the \co{cmp()} function uses a new Lock~D that is acquired after
 all of Locks~A, B, and~C, avoiding deadlock.
 We therefore have three layers to the global deadlock hierarchy, the
@@ -404,7 +404,7 @@ at design time, before any code has been generated!
 
 For another example where releasing all locks before invoking unknown
 code is impractical, imagine an iterator over a linked list, as shown in
-Listing~\ref{lst:locking:Concurrent List Iterator} (\path{locked_list.c}).
+\cref{lst:locking:Concurrent List Iterator} (\path{locked_list.c}).
 The \co{list_start()} function acquires a lock on the list and returns
 the first element (if there is one), and
 \co{list_next()} either returns a pointer to the next element in the list
@@ -418,17 +418,17 @@ been reached.
 \end{listing}
 
 \begin{fcvref}[ln:locking:locked_list:list_print:ints]
-Listing~\ref{lst:locking:Concurrent List Iterator Usage} shows how
+\Cref{lst:locking:Concurrent List Iterator Usage} shows how
 this list iterator may be used.
 \Clnrefrange{b}{e} define the \co{list_ints} element
 containing a single integer,
 \end{fcvref}
 \begin{fcvref}[ln:locking:locked_list:list_print:print]
 and \clnrefrange{b}{e} show how to iterate over the list.
-Line~\lnref{start} locks the list and fetches a pointer to the first element,
-line~\lnref{entry} provides a pointer to our enclosing \co{list_ints} structure,
-line~\lnref{print} prints the corresponding integer, and
-line~\lnref{next} moves to the next element.
+\Clnref{start} locks the list and fetches a pointer to the first element,
+\clnref{entry} provides a pointer to our enclosing \co{list_ints} structure,
+\clnref{print} prints the corresponding integer, and
+\clnref{next} moves to the next element.
 This is quite simple, and hides all of the locking.
 \end{fcvref}
 
@@ -450,7 +450,7 @@ need to avoid deadlock is an important reason why parallel programming
 is perceived by some to be so difficult.
 
 Some alternatives to highly layered locking hierarchies are covered in
-Chapter~\ref{chp:Deferred Processing}.
+\cref{chp:Deferred Processing}.
 
 \subsubsection{Locking Hierarchies and Pointers to Locks}
 \label{sec:locking:Locking Hierarchies and Pointers to Locks}
@@ -507,12 +507,12 @@ In the networking case, it might be necessary to hold the locks from
 both layers when passing a packet from one layer to another.
 Given that packets travel both up and down the protocol stack, this
 is an excellent recipe for deadlock, as illustrated in
-Listing~\ref{lst:locking:Protocol Layering and Deadlock}.
+\cref{lst:locking:Protocol Layering and Deadlock}.
 \begin{fcvref}[ln:locking:Protocol Layering and Deadlock]
 Here, a packet moving down the stack towards the wire must acquire
 the next layer's lock out of order.
 Given that packets moving up the stack away from the wire are acquiring
-the locks in order, the lock acquisition in line~\lnref{acq} of the listing
+the locks in order, the lock acquisition in \clnref{acq} of the listing
 can result in deadlock.
 \end{fcvref}
 
@@ -535,9 +535,9 @@ spin_unlock(&nextlayer->lock1);
 One way to avoid deadlocks in this case is to impose a locking hierarchy,
 but when it is necessary to acquire a lock out of order, acquire it
 conditionally, as shown in
-Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}.
+\cref{lst:locking:Avoiding Deadlock Via Conditional Locking}.
 \begin{fcvref}[ln:locking:Avoiding Deadlock Via Conditional Locking]
-Instead of unconditionally acquiring the layer-1 lock, line~\lnref{trylock}
+Instead of unconditionally acquiring the layer-1 lock, \clnref{trylock}
 conditionally acquires the lock using the \co{spin_trylock()} primitive.
 This primitive acquires the lock immediately if the lock is available
 (returning non-zero), and otherwise returns zero without acquiring the lock.
@@ -568,10 +568,10 @@ retry:
 \label{lst:locking:Avoiding Deadlock Via Conditional Locking}
 \end{listing}
 
-If \co{spin_trylock()} was successful, line~\lnref{l1_proc} does the needed
+If \co{spin_trylock()} was successful, \clnref{l1_proc} does the needed
 layer-1 processing.
-Otherwise, line~\lnref{rel2} releases the lock, and
-lines~\lnref{acq1} and~\lnref{acq2} acquire them in
+Otherwise, \clnref{rel2} releases the lock, and
+\clnref{acq1,acq2} acquire them in
 the correct order.
 Unfortunately, there might be multiple networking devices on
 the system (e.g., Ethernet and WiFi), so that the \co{layer_1()}
@@ -579,15 +579,15 @@ function must make a routing decision.
 This decision might change at any time, especially if the system
 is mobile.\footnote{
 	And, in contrast to the 1900s, mobility is the common case.}
-Therefore, line~\lnref{recheck} must recheck the decision, and if it has changed,
+Therefore, \clnref{recheck} must recheck the decision, and if it has changed,
 must release the locks and start over.
 \end{fcvref}
 
 \QuickQuizSeries{%
 \QuickQuizB{
 	Can the transformation from
-	Listing~\ref{lst:locking:Protocol Layering and Deadlock} to
-	Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}
+	\cref{lst:locking:Protocol Layering and Deadlock} to
+	\cref{lst:locking:Avoiding Deadlock Via Conditional Locking}
 	be applied universally?
 }\QuickQuizAnswerB{
 	Absolutely not!
@@ -602,7 +602,7 @@ must release the locks and start over.
 %
 \QuickQuizE{
 	But the complexity in
-	Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}
+	\cref{lst:locking:Avoiding Deadlock Via Conditional Locking}
 	is well worthwhile given that it avoids deadlock, right?
 }\QuickQuizAnswerE{
 	Maybe.
@@ -612,7 +612,7 @@ must release the locks and start over.
 	This is termed ``\IX{livelock}'' if no thread makes any
 	forward progress or ``\IX{starvation}''
 	if some threads make forward progress but others do not
-	(see Section~\ref{sec:locking:Livelock and Starvation}).
+	(see \cref{sec:locking:Livelock and Starvation}).
 }\QuickQuizEndE
 }
 
@@ -631,11 +631,11 @@ Only once all needed locks are held will any processing be carried out.
 
 However, this procedure can result in \emph{livelock}, which will
 be discussed in
-Section~\ref{sec:locking:Livelock and Starvation}.
+\cref{sec:locking:Livelock and Starvation}.
 
 \QuickQuiz{
 	When using the ``acquire needed locks first'' approach described in
-	Section~\ref{sec:locking:Acquire Needed Locks First},
+	\cref{sec:locking:Acquire Needed Locks First},
 	how can livelock be avoided?
 }\QuickQuizAnswer{
 	Provide an additional global lock.
@@ -677,9 +677,9 @@ However, there must be some mechanism to ensure that the needed data
 structures remain in existence during the time that neither lock is
 held.
 One such mechanism is discussed in
-Section~\ref{sec:locking:Lock-Based Existence Guarantees}
+\cref{sec:locking:Lock-Based Existence Guarantees}
 and several others are presented in
-Chapter~\ref{chp:Deferred Processing}.
+\cref{chp:Deferred Processing}.
 
 \subsubsection{Signal/Interrupt Handlers}
 \label{sec:locking:Signal/Interrupt Handlers}
@@ -799,7 +799,7 @@ tool, but there are jobs better addressed with other tools.
 		Then associate a lock with each group.
 		This is an example of a single-lock-at-a-time
 		design, which discussed in
-		Section~\ref{sec:locking:Single-Lock-at-a-Time Designs}.
+		\cref{sec:locking:Single-Lock-at-a-Time Designs}.
 	\item	Partition the objects into groups such that threads
 		can all operate on objects in the groups in some
 		groupwise ordering.
@@ -808,7 +808,7 @@ tool, but there are jobs better addressed with other tools.
 	\item	Impose an arbitrarily selected hierarchy on the locks,
 		and then use conditional locking if it is necessary
 		to acquire a lock out of order, as was discussed in
-		Section~\ref{sec:locking:Conditional Locking}.
+		\cref{sec:locking:Conditional Locking}.
 	\item	Before carrying out a given group of operations, predict
 		which locks will be acquired, and attempt to acquire them
 		before actually carrying out any updates.
@@ -816,7 +816,7 @@ tool, but there are jobs better addressed with other tools.
 		all the locks and retry with an updated prediction
 		that includes the benefit of experience.
 		This approach was discussed in
-		Section~\ref{sec:locking:Acquire Needed Locks First}.
+		\cref{sec:locking:Acquire Needed Locks First}.
 	\item	Use transactional memory.
 		This approach has a number of advantages and disadvantages
 		which will be discussed in
@@ -838,7 +838,7 @@ quite useful in many settings.
 Although conditional locking can be an effective deadlock-avoidance
 mechanism, it can be abused.
 Consider for example the beautifully symmetric example shown in
-Listing~\ref{lst:locking:Abusing Conditional Locking}.
+\cref{lst:locking:Abusing Conditional Locking}.
 This example's beauty hides an ugly \IX{livelock}.
 To see this, consider the following sequence of events:
 
@@ -880,28 +880,28 @@ retry:					\lnlbl[thr2:retry]
 
 \begin{fcvref}[ln:locking:Abusing Conditional Locking]
 \begin{enumerate}
-\item	Thread~1 acquires \co{lock1} on line~\lnref{thr1:acq1}, then invokes
+\item	Thread~1 acquires \co{lock1} on \clnref{thr1:acq1}, then invokes
 	\co{do_one_thing()}.
-\item	Thread~2 acquires \co{lock2} on line~\lnref{thr2:acq2}, then invokes
+\item	Thread~2 acquires \co{lock2} on \clnref{thr2:acq2}, then invokes
 	\co{do_a_third_thing()}.
-\item	Thread~1 attempts to acquire \co{lock2} on line~\lnref{thr1:try2},
+\item	Thread~1 attempts to acquire \co{lock2} on \clnref{thr1:try2},
 	but fails because Thread~2 holds it.
-\item	Thread~2 attempts to acquire \co{lock1} on line~\lnref{thr2:try1},
+\item	Thread~2 attempts to acquire \co{lock1} on \clnref{thr2:try1},
 	but fails because Thread~1 holds it.
-\item	Thread~1 releases \co{lock1} on line~\lnref{thr1:rel1},
-	then jumps to \co{retry} at line~\lnref{thr1:retry}.
-\item	Thread~2 releases \co{lock2} on line~\lnref{thr2:rel2},
-	and jumps to \co{retry} at line~\lnref{thr2:retry}.
+\item	Thread~1 releases \co{lock1} on \clnref{thr1:rel1},
+	then jumps to \co{retry} at \clnref{thr1:retry}.
+\item	Thread~2 releases \co{lock2} on \clnref{thr2:rel2},
+	and jumps to \co{retry} at \clnref{thr2:retry}.
 \item	The livelock dance repeats from the beginning.
 \end{enumerate}
 \end{fcvref}
 
 \QuickQuiz{
 	How can the livelock shown in
-	Listing~\ref{lst:locking:Abusing Conditional Locking}
+	\cref{lst:locking:Abusing Conditional Locking}
 	be avoided?
 }\QuickQuizAnswer{
-	Listing~\ref{lst:locking:Avoiding Deadlock Via Conditional Locking}
+	\Cref{lst:locking:Avoiding Deadlock Via Conditional Locking}
 	provides some good hints.
 	In many cases, livelocks are a hint that you should revisit your
 	locking design.
@@ -910,10 +910,10 @@ retry:					\lnlbl[thr2:retry]
 
 	That said, one good-and-sufficient approach due to Doug Lea
 	is to use conditional locking as described in
-	Section~\ref{sec:locking:Conditional Locking}, but combine this
+	\cref{sec:locking:Conditional Locking}, but combine this
 	with acquiring all needed locks first, before modifying shared
 	data, as described in
-	Section~\ref{sec:locking:Acquire Needed Locks First}.
+	\cref{sec:locking:Acquire Needed Locks First}.
 	If a given critical section retries too many times,
 	unconditionally acquire
 	a global lock, then unconditionally acquire all the needed locks.
@@ -978,11 +978,11 @@ In the case of locking, simple exponential backoff can often address
 livelock and starvation.
 The idea is to introduce exponentially increasing delays before each
 retry, as shown in
-Listing~\ref{lst:locking:Conditional Locking and Exponential Backoff}.
+\cref{lst:locking:Conditional Locking and Exponential Backoff}.
 
 \QuickQuiz{
 	What problems can you spot in the code in
-	Listing~\ref{lst:locking:Conditional Locking and Exponential Backoff}?
+	\cref{lst:locking:Conditional Locking and Exponential Backoff}?
 }\QuickQuizAnswer{
 	Here are a couple:
 	\begin{enumerate}
@@ -1000,7 +1000,7 @@ Listing~\ref{lst:locking:Conditional Locking and Exponential Backoff}.
 For better results, backoffs should be bounded, and
 even better high-contention results are obtained via queued
 locking~\cite{Anderson90}, which is discussed more in
-Section~\ref{sec:locking:Other Exclusive-Locking Implementations}.
+\cref{sec:locking:Other Exclusive-Locking Implementations}.
 Of course, best of all is to use a good parallel design that avoids
 these problems by maintaining low \IX{lock contention}.
 
@@ -1019,7 +1019,7 @@ where a subset of threads contending for a given lock are granted
 the lion's share of the acquisitions.
 This can happen on machines with shared caches or NUMA characteristics,
 for example, as shown in
-Figure~\ref{fig:locking:System Architecture and Lock Unfairness}.
+\cref{fig:locking:System Architecture and Lock Unfairness}.
 If CPU~0 releases a lock that all the other CPUs are attempting
 to acquire, the interconnect shared between CPUs~0 and~1 means that
 CPU~1 will have an advantage over CPUs~2--7.
@@ -1055,7 +1055,7 @@ shuttle between CPUs~0 and~1, bypassing CPUs~2--7.
 
 Locks are implemented using atomic instructions and memory barriers,
 and often involve cache misses.
-As we saw in Chapter~\ref{chp:Hardware and its Habits},
+As we saw in \cref{chp:Hardware and its Habits},
 these instructions are quite expensive, roughly two
 orders of magnitude greater overhead than simple instructions.
 This can be a serious problem for locking: If you protect a single
@@ -1066,8 +1066,8 @@ be required to keep up with a single CPU executing the same code
 without locking.
 
 This situation underscores the synchronization\-/granularity
-tradeoff discussed in Section~\ref{sec:SMPdesign:Synchronization Granularity},
-especially Figure~\ref{fig:SMPdesign:Synchronization Efficiency}:
+tradeoff discussed in \cref{sec:SMPdesign:Synchronization Granularity},
+especially \cref{fig:SMPdesign:Synchronization Efficiency}:
 Too coarse a granularity will limit scalability, while too fine a
 granularity will result in excessive synchronization overhead.
 
@@ -1107,10 +1107,10 @@ be accessed by the lock holder without interference from other threads.
 There are a surprising number of types of locks, more than this
 short chapter can possibly do justice to.
 The following sections discuss
-exclusive locks (Section~\ref{sec:locking:Exclusive Locks}),
-reader-writer locks (Section~\ref{sec:locking:Reader-Writer Locks}),
-multi-role locks (Section~\ref{sec:locking:Beyond Reader-Writer Locks}),
-and scoped locking (Section~\ref{sec:locking:Scoped Locking}).
+exclusive locks (\cref{sec:locking:Exclusive Locks}),
+reader-writer locks (\cref{sec:locking:Reader-Writer Locks}),
+multi-role locks (\cref{sec:locking:Beyond Reader-Writer Locks}),
+and scoped locking (\cref{sec:locking:Scoped Locking}).
 
 \subsection{Exclusive Locks}
 \label{sec:locking:Exclusive Locks}
@@ -1123,7 +1123,7 @@ by that lock, hence the name.
 Of course, this all assumes that this lock is held across all accesses
 to data purportedly protected by the lock.
 Although there are some tools that can help (see for example
-Section~\ref{sec:formal:Axiomatic Approaches and Locking}),
+\cref{sec:formal:Axiomatic Approaches and Locking}),
 the ultimate responsibility for ensuring that the lock is always acquired
 when needed rests with the developer.
 
@@ -1154,7 +1154,7 @@ when needed rests with the developer.
 	for ``big reader lock''.
 	This use case is a way of approximating the semantics of read-copy
 	update (RCU), which is discussed in
-	Section~\ref{sec:defer:Read-Copy Update (RCU)}.
+	\cref{sec:defer:Read-Copy Update (RCU)}.
 	And in fact this Linux-kernel use case has been replaced
 	with RCU\@.
 
@@ -1441,7 +1441,7 @@ locks permit an arbitrary number of read-holders (but only one write-holder).
 There is a very large number of possible admission policies, one of
 which is that of the VAX/VMS distributed lock
 manager (DLM)~\cite{Snaman87}, which is shown in
-Table~\ref{tab:locking:VAX/VMS Distributed Lock Manager Policy}.
+\cref{tab:locking:VAX/VMS Distributed Lock Manager Policy}.
 Blank cells indicate compatible modes, while cells containing ``X''
 indicate incompatible modes.
 
@@ -1573,7 +1573,7 @@ with explicit lock acquisition and release primitives.
 
 Example strict-RAII-unfriendly data structures from Linux-kernel RCU
 are shown in
-Figure~\ref{fig:locking:Locking Hierarchy}.
+\cref{fig:locking:Locking Hierarchy}.
 Here, each CPU is assigned a leaf \co{rcu_node} structure, and each
 \co{rcu_node} structure has a pointer to its parent (named, oddly
 enough, \co{->parent}), up to the root \co{rcu_node} structure,
@@ -1628,7 +1628,7 @@ void force_quiescent_state(struct rcu_node *rnp_leaf)
 \end{listing}
 
 Simplified code to implement this is shown in
-Listing~\ref{lst:locking:Conditional Locking to Reduce Contention}.
+\cref{lst:locking:Conditional Locking to Reduce Contention}.
 The purpose of this function is to mediate between CPUs who have concurrently
 detected a need to invoke the \co{do_force_quiescent_state()} function.
 At any given time, it only makes sense for one instance of
@@ -1640,34 +1640,34 @@ painlessly as possible) give up and leave.
 \begin{fcvref}[ln:locking:Conditional Locking to Reduce Contention]
 To this end, each pass through the loop spanning \clnrefrange{loop:b}{loop:e} attempts
 to advance up one level in the \co{rcu_node} hierarchy.
-If the \co{gp_flags} variable is already set (line~\lnref{flag_set}) or if the attempt
+If the \co{gp_flags} variable is already set (\clnref{flag_set}) or if the attempt
 to acquire the current \co{rcu_node} structure's \co{->fqslock} is
-unsuccessful (line~\lnref{trylock}), then local variable \co{ret} is set to 1.
-If line~\lnref{non_NULL} sees that local variable \co{rnp_old} is non-\co{NULL},
+unsuccessful (\clnref{trylock}), then local variable \co{ret} is set to 1.
+If \clnref{non_NULL} sees that local variable \co{rnp_old} is non-\co{NULL},
 meaning that we hold \co{rnp_old}'s \co{->fqs_lock},
-line~\lnref{rel1} releases this lock (but only after the attempt has been made
+\clnref{rel1} releases this lock (but only after the attempt has been made
 to acquire the parent \co{rcu_node} structure's \co{->fqslock}).
-If line~\lnref{giveup} sees that either line~\lnref{flag_set} or~\lnref{trylock}
+If \clnref{giveup} sees that either \clnref{flag_set} or~\lnref{trylock}
 saw a reason to give up,
-line~\lnref{return} returns to the caller.
+\clnref{return} returns to the caller.
 Otherwise, we must have acquired the current \co{rcu_node} structure's
-\co{->fqslock}, so line~\lnref{save} saves a pointer to this structure in local
+\co{->fqslock}, so \clnref{save} saves a pointer to this structure in local
 variable \co{rnp_old} in preparation for the next pass through the loop.
 
-If control reaches line~\lnref{flag_not_set}, we won the tournament, and now holds the
+If control reaches \clnref{flag_not_set}, we won the tournament, and now holds the
 root \co{rcu_node} structure's \co{->fqslock}.
-If line~\lnref{flag_not_set} still sees that the global variable \co{gp_flags} is zero,
-line~\lnref{set_flag} sets \co{gp_flags} to one, line~\lnref{invoke} invokes
+If \clnref{flag_not_set} still sees that the global variable \co{gp_flags} is zero,
+\clnref{set_flag} sets \co{gp_flags} to one, \clnref{invoke} invokes
 \co{do_force_quiescent_state()},
-and line~\lnref{clr_flag} resets \co{gp_flags} back to zero.
-Either way, line~\lnref{rel2} releases the root \co{rcu_node} structure's
+and \clnref{clr_flag} resets \co{gp_flags} back to zero.
+Either way, \clnref{rel2} releases the root \co{rcu_node} structure's
 \co{->fqslock}.
 \end{fcvref}
 
 \QuickQuizSeries{%
 \QuickQuizB{
 	The code in
-	Listing~\ref{lst:locking:Conditional Locking to Reduce Contention}
+	\cref{lst:locking:Conditional Locking to Reduce Contention}
 	is ridiculously complicated!
 	Why not conditionally acquire a single global lock?
 }\QuickQuizAnswerB{
@@ -1675,14 +1675,14 @@ Either way, line~\lnref{rel2} releases the root \co{rcu_node} structure's
 	but only for relatively small numbers of CPUs.
 	To see why it is problematic in systems with many hundreds of
 	CPUs, look at
-	Figure~\ref{fig:count:Atomic Increment Scalability on x86}.
+	\cref{fig:count:Atomic Increment Scalability on x86}.
 }\QuickQuizEndB
 %
 \QuickQuizE{
 	\begin{fcvref}[ln:locking:Conditional Locking to Reduce Contention]
 	Wait a minute!
-	If we ``win'' the tournament on line~\lnref{flag_not_set} of
-	Listing~\ref{lst:locking:Conditional Locking to Reduce Contention},
+	If we ``win'' the tournament on \clnref{flag_not_set} of
+	\cref{lst:locking:Conditional Locking to Reduce Contention},
 	we get to do all the work of \co{do_force_quiescent_state()}.
 	Exactly how is that a win, really?
         \end{fcvref}
@@ -1726,11 +1726,11 @@ environments.
 
 \begin{fcvref}[ln:locking:xchglock:lock_unlock]
 This section reviews the implementation shown in
-listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}.
+\cref{lst:locking:Sample Lock Based on Atomic Exchange}.
 The data structure for this lock is just an \co{int}, as shown on
-line~\lnref{typedef}, but could be any integral type.
+\clnref{typedef}, but could be any integral type.
 The initial value of this lock is zero, meaning ``unlocked'',
-as shown on line~\lnref{initval}.
+as shown on \clnref{initval}.
 \end{fcvref}
 
 \begin{listing}
@@ -1743,8 +1743,8 @@ as shown on line~\lnref{initval}.
 	\begin{fcvref}[ln:locking:xchglock:lock_unlock]
 	Why not rely on the C language's default initialization of
 	zero instead of using the explicit initializer shown on
-	line~\lnref{initval} of
-	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
+	\clnref{initval} of
+	\cref{lst:locking:Sample Lock Based on Atomic Exchange}?
 	\end{fcvref}
 }\QuickQuizAnswer{
 	Because this default initialization does not apply to locks
@@ -1766,9 +1766,9 @@ makes another attempt to acquire the lock.
 \QuickQuiz{
 	\begin{fcvref}[ln:locking:xchglock:lock_unlock:lock]
 	Why bother with the inner loop on \clnrefrange{inner:b}{inner:e} of
-	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
+	\cref{lst:locking:Sample Lock Based on Atomic Exchange}?
 	Why not simply repeatedly do the atomic exchange operation
-	on line~\lnref{atmxchg}?
+	on \clnref{atmxchg}?
 	\end{fcvref}
 }\QuickQuizAnswer{
 	\begin{fcvref}[ln:locking:xchglock:lock_unlock:lock]
@@ -1788,14 +1788,14 @@ makes another attempt to acquire the lock.
 \begin{fcvref}[ln:locking:xchglock:lock_unlock:unlock]
 Lock release is carried out by the \co{xchg_unlock()} function
 shown on \clnrefrange{b}{e}.
-Line~\lnref{atmxchg} atomically exchanges the value zero (``unlocked'') into
+\Clnref{atmxchg} atomically exchanges the value zero (``unlocked'') into
 the lock, thus marking it as having been released.
 \end{fcvref}
 
 \QuickQuiz{
 	\begin{fcvref}[ln:locking:xchglock:lock_unlock:unlock]
-	Why not simply store zero into the lock word on line~\lnref{atmxchg} of
-	Listing~\ref{lst:locking:Sample Lock Based on Atomic Exchange}?
+	Why not simply store zero into the lock word on \clnref{atmxchg} of
+	\cref{lst:locking:Sample Lock Based on Atomic Exchange}?
 	\end{fcvref}
 }\QuickQuizAnswer{
 	This can be a legitimate implementation, but only if
@@ -2010,7 +2010,7 @@ Instead, the CPU must wait until the token comes around to it.
 This is useful in cases where CPUs need periodic access to the \IX{critical
 section}, but can tolerate variances in token-circulation rate.
 Gamsa et al.~\cite{Gamsa99} used it to implement a variant of
-read-copy update (see Section~\ref{sec:defer:Read-Copy Update (RCU)}),
+read-copy update (see \cref{sec:defer:Read-Copy Update (RCU)}),
 but it could also be used to protect periodic per-CPU operations such
 as flushing per-CPU caches used by memory allocators~\cite{McKenney93},
 garbage-collecting per-CPU data structures, or flushing per-CPU
@@ -2061,7 +2061,7 @@ viewpoints.
 When writing an entire application (or entire kernel), developers have
 full control of the design, including the synchronization design.
 Assuming that the design makes good use of partitioning, as discussed in
-Chapter~\ref{cha:Partitioning and Synchronization Design}, locking
+\cref{cha:Partitioning and Synchronization Design}, locking
 can be an extremely effective synchronization mechanism, as demonstrated
 by the heavy use of locking in production-quality parallel software.
 
@@ -2096,14 +2096,14 @@ Library designers therefore have less control and must exercise more
 care when laying out their synchronization design.
 
 Deadlock is of course of particular concern, and the techniques discussed
-in Section~\ref{sec:locking:Deadlock} need to be applied.
+in \cref{sec:locking:Deadlock} need to be applied.
 One popular deadlock-avoidance strategy is therefore to ensure that
 the library's locks are independent subtrees of the enclosing program's
 locking hierarchy.
 However, this can be harder than it looks.
 
 One complication was discussed in
-Section~\ref{sec:locking:Local Locking Hierarchies}, namely
+\cref{sec:locking:Local Locking Hierarchies}, namely
 when library functions call into application code, with \co{qsort()}'s
 comparison-function argument being a case in point.
 Another complication is the interaction with signal handlers.
@@ -2140,12 +2140,12 @@ If a library function avoids callbacks and the application as a whole
 avoids signals, then any locks acquired by that library function will
 be leaves of the locking-hierarchy tree.
 This arrangement avoids deadlock, as discussed in
-Section~\ref{sec:locking:Locking Hierarchies}.
+\cref{sec:locking:Locking Hierarchies}.
 Although this strategy works extremely well where it applies,
 there are some applications that must use signal handlers,
 and there are some library functions (such as the \co{qsort()} function
 discussed in
-Section~\ref{sec:locking:Local Locking Hierarchies})
+\cref{sec:locking:Local Locking Hierarchies})
 that require callbacks.
 
 The strategy described in the next section can often be used in these cases.
@@ -2173,7 +2173,7 @@ if complex data structures must be manipulated:
 \begin{enumerate}
 \item	Use simple data structures based on \IXacrl{nbs},
 	as will be discussed in
-	Section~\ref{sec:advsync:Simple NBS}.
+	\cref{sec:advsync:Simple NBS}.
 \item	If the data structures are too complex for reasonable use of
 	non-blocking synchronization, create a queue that allows
 	non-blocking enqueue operations.
@@ -2206,7 +2206,7 @@ The application then acquires and releases locks as needed, so
 that the library need not be aware of parallelism at all.
 Instead, the application controls the parallelism, so that locking
 can work very well, as was discussed in
-Section~\ref{sec:locking:Locking For Applications: Hero!}.
+\cref{sec:locking:Locking For Applications: Hero!}.
 
 However, this strategy fails if the
 library implements a data structure that requires internal
@@ -2236,7 +2236,7 @@ can work better.
 
 That said, passing explicit pointers to locks to external APIs must
 be very carefully considered, as discussed in
-Section~\ref{sec:locking:Locking Hierarchies and Pointers to Locks}.
+\cref{sec:locking:Locking Hierarchies and Pointers to Locks}.
 Although this practice is sometimes the right thing to do, you should do
 yourself a favor by looking into alternative designs first.
 
@@ -2244,7 +2244,7 @@ yourself a favor by looking into alternative designs first.
 \label{sec:locking:Explicitly Avoid Callback Deadlocks}
 
 The basic rule behind this strategy was discussed in
-Section~\ref{sec:locking:Local Locking Hierarchies}: ``Release all
+\cref{sec:locking:Local Locking Hierarchies}: ``Release all
 locks before invoking unknown code.''
 This is usually the best approach because it allows the application to
 ignore the library's locking hierarchy: the library remains a leaf or
@@ -2252,7 +2252,7 @@ isolated subtree of the application's overall locking hierarchy.
 
 In cases where it is not possible to release all locks before invoking
 unknown code, the layered locking hierarchies described in
-Section~\ref{sec:locking:Layered Locking Hierarchies} can work well.
+\cref{sec:locking:Layered Locking Hierarchies} can work well.
 For example, if the unknown code is a signal handler, this implies that
 the library function block signals across all lock acquisitions, which
 can be complex and slow.
@@ -2378,13 +2378,13 @@ So why not?
 
 One reason is that exact counters do not perform or scale well on
 multicore systems, as was
-seen in Chapter~\ref{chp:Counting}.
+seen in \cref{chp:Counting}.
 As a result, the parallelized implementation of the hash table will not
 perform or scale well.
 
 So what can be done about this?
 One approach is to return an approximate count, using one of the algorithms
-from Chapter~\ref{chp:Counting}.
+from \cref{chp:Counting}.
 Another approach is to drop the element count altogether.
 
 Either way, it will be necessary to inspect uses of the hash table to see
@@ -2437,9 +2437,9 @@ or her own poor (though understandable) API design choices.
 \subsubsection{Deadlock-Prone Callbacks}
 \label{sec:locking:Deadlock-Prone Callbacks}
 
-Sections~\ref{sec:locking:Local Locking Hierarchies},
-\ref{sec:locking:Layered Locking Hierarchies},
-and~\ref{sec:locking:Locking For Parallel Libraries: Just Another Tool}
+\Cref{sec:locking:Local Locking Hierarchies,%
+sec:locking:Layered Locking Hierarchies,%
+sec:locking:Locking For Parallel Libraries: Just Another Tool}
 described how undisciplined use of callbacks can result in locking
 woes.
 These sections also described how to design your library function to
@@ -2454,20 +2454,18 @@ it may be wise to again add a parallel-friendly API to the library in
 order to allow existing users to convert their code incrementally.
 Alternatively, some advocate use of transactional memory in these cases.
 While the jury is still out on transactional memory,
-Section~\ref{sec:future:Transactional Memory} discusses its strengths and
+\cref{sec:future:Transactional Memory} discusses its strengths and
 weaknesses.
 It is important to note that hardware transactional memory
 (discussed in
-Section~\ref{sec:future:Hardware Transactional Memory})
+\cref{sec:future:Hardware Transactional Memory})
 cannot help here unless the hardware transactional memory implementation
 provides \IXpl{forward-progress guarantee}, which few do.
 Other alternatives that appear to be quite practical (if less heavily
 hyped) include the methods discussed in
-Sections~\ref{sec:locking:Conditional Locking},
-and~\ref{sec:locking:Acquire Needed Locks First},
+\cref{sec:locking:Conditional Locking,sec:locking:Acquire Needed Locks First},
 as well as those that will be discussed in
-Chapters~\ref{chp:Data Ownership}
-and~\ref{chp:Deferred Processing}.
+\cref{chp:Data Ownership,chp:Deferred Processing}.
 
 \subsubsection{Object-Oriented Spaghetti Code}
 \label{sec:locking:Object-Oriented Spaghetti Code}
@@ -2487,16 +2485,14 @@ case, such things are much easier to say than to do.
 If you are tasked with parallelizing such a beast, you can reduce the
 number of opportunities to curse locking by using the techniques
 described in
-Sections~\ref{sec:locking:Conditional Locking},
-and~\ref{sec:locking:Acquire Needed Locks First},
+\cref{sec:locking:Conditional Locking,sec:locking:Acquire Needed Locks First},
 as well as those that will be discussed in
-Chapters~\ref{chp:Data Ownership}
-and~\ref{chp:Deferred Processing}.
+\cref{chp:Data Ownership,chp:Deferred Processing}.
 This situation appears to be the use case that inspired transactional
 memory, so it might be worth a try as well.
 That said, the choice of synchronization mechanism should be made in
 light of the hardware habits discussed in
-Chapter~\ref{chp:Hardware and its Habits}.
+\cref{chp:Hardware and its Habits}.
 After all, if the overhead of the synchronization mechanism is orders of
 magnitude more than that of the operations being protected, the results
 are not going to be pretty.
-- 
2.17.1


