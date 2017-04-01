Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=QbYO039Jr9F+0jqb5xBl2swPOAb+N+zDcHAnjJgWSp8=;
 b=jS10F5L+lJ9/080gQsnSlxsWqpP+aY0t1ATgYnJrimIHHjIsRT2OW8Fw+TYhTiKuPw
 9qH0dKsetuZ/lUVU0/VSyCZIZ027yTf2hsIG+xUHIKKHERVf3Cmi/cyZiGZYQP807m+I
 YhrBy4dklKDUw+hymKWX8FHcVGOSVZEj1rUhLQwNBMfM5AtL+JxHD048d7kLPWZTlvcm
 1kLwa26oGWx41IpY5Y+ohwBtj+yYfibjQV6flJyS5PWDa1LUNGl2sWTi3oDF3GcTHvUH
 jOs7/2aKwFP8wNx0XCo8WD8qhTfPY/sb6eufZCRGE5gU2XKOp/XZN8rDGhbE6nf0MkOs
 PfnA==
Subject: [RFC PATCH 08/12] advsync: Properly use nbsp
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c9924ab0-4400-c8f6-57d6-d5bd6f7f00db@gmail.com>
Date: Sat, 1 Apr 2017 11:19:47 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From eb80c7c23661824d63bb8e97c951dce03e158769 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 26 Mar 2017 16:39:51 +0900
Subject: [RFC PATCH 08/12] advsync: Properly use nbsp

These nbsps prevent undesirable line breaks such as

                                   ... variable
    ------------ page/column break ------------
    A ...

That "A" might give a wrong impression as if it were an indefinite
article.

Single letter variable names and short numbers at the beginning of
a line should be avoided in the same sense we prevent line breaks
between "Figure" and "\ref{}".

This commit also adds nbsps in lists of initial values as was done in
commit 09f380606ca7 ("advsync: Properly use nbsp in initial values").

Some short conditionals are enclosed in \nbco{} to avoid line
breaks.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 336 ++++++++++++++++++++++-----------------------
 1 file changed, 168 insertions(+), 168 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 64d78f4..173d7ad 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -32,13 +32,13 @@ in shared memory.
 For example, the litmus test in
 Table~\ref{tab:advsync:Memory Misordering: Dekker}
 appears to guarantee that the assertion never fires.
-After all, if \co{r1 != 1}, we might hope that Thread~1's load from \co{y}
-must have happened before Thread~2's store to \co{y}, which might raise
-further hopes that Thread~2's load from \co{x} must happen after
-Thread~1's store to \co{x}, so that \co{r2 == 1}, as required by the
+After all, if \nbco{r1 != 1}, we might hope that Thread~1's load from~\co{y}
+must have happened before Thread~2's store to~\co{y}, which might raise
+further hopes that Thread~2's load from~\co{x} must happen after
+Thread~1's store to~\co{x}, so that \nbco{r2 == 1}, as required by the
 assertion.
 The example is symmetric, so similar hopeful reasoning might lead
-us to hope that \co{r2 != 1} guarantees that \co{r1 == 1}.
+us to hope that \nbco{r2 != 1} guarantees that \nbco{r1 == 1}.
 Unfortunately, the lack of memory barriers in
 Table~\ref{tab:advsync:Memory Misordering: Dekker}
 dashes these hopes.
@@ -138,7 +138,7 @@ Memory ordering and memory barriers can be extremely counter-intuitive.
 For example, consider the functions shown in
 Figure~\ref{fig:advsync:Parallel Hardware is Non-Causal}
 executing in parallel
-where variables A, B, and C are initially zero:
+where variables~A, B, and~C are initially zero:

 \begin{figure}[htbp]
 { \scriptsize
@@ -173,10 +173,10 @@ where variables A, B, and C are initially zero:
 \label{fig:advsync:Parallel Hardware is Non-Causal}
 \end{figure}

-Intuitively, \co{thread0()} assigns to B after it assigns to A,
-\co{thread1()} waits until \co{thread0()} has assigned to B before
-assigning to C, and \co{thread2()} waits until \co{thread1()} has
-assigned to C before referencing A.
+Intuitively, \co{thread0()} assigns to~B after it assigns to~A,
+\co{thread1()} waits until \co{thread0()} has assigned to~B before
+assigning to~C, and \co{thread2()} waits until \co{thread1()} has
+assigned to~C before referencing~A.
 Therefore, again intuitively, the assertion on line~21 cannot possibly
 fire.

@@ -185,7 +185,7 @@ and utterly incorrect.
 Please note that this is \emph{not} a theoretical assertion:
 actually running this code on real-world weakly-ordered hardware
 (a 1.5GHz 16-CPU POWER 5 system) resulted in the assertion firing
-16 times out of 10 million runs.
+16~times out of 10~million runs.
 Clearly, anyone who produces code with explicit memory barriers
 should do some extreme testing---although a proof of correctness might
 be helpful, the strongly counter-intuitive nature of the behavior of
@@ -201,8 +201,8 @@ greatly \emph{increase} the probability of failure in this run.
 	\emph{possibly} fail?
 \QuickQuizAnswer{
 	The key point is that the intuitive analysis missed is that
-	there is nothing preventing the assignment to C from overtaking
-	the assignment to A as both race to reach {\tt thread2()}.
+	there is nothing preventing the assignment to~C from overtaking
+	the assignment to~A as both race to reach \co{thread2()}.
 	This is explained in the remainder of this section.
 } \QuickQuizEnd

@@ -309,11 +309,11 @@ with the black regions to the left indicating the time before the
 corresponding CPU's first measurement.
 During the first 5ns, only CPU~3 has an opinion about the value of the
 variable.
-During the next 10ns, CPUs~2 and 3 disagree on the value of the variable,
-but thereafter agree that the value is ``2'', which is in fact
+During the next 10ns, CPUs~2 and~3 disagree on the value of the variable,
+but thereafter agree that the value is~``2'', which is in fact
 the final agreed-upon value.
-However, CPU~1 believes that the value is ``1'' for almost 300ns, and
-CPU~4 believes that the value is ``4'' for almost 500ns.
+However, CPU~1 believes that the value is~``1'' for almost 300ns, and
+CPU~4 believes that the value is~``4'' for almost 500ns.

 \QuickQuiz{}
 	How could CPUs possibly have different views of the
@@ -331,15 +331,15 @@ CPU~4 believes that the value is ``4'' for almost 500ns.
 } \QuickQuizEnd

 \QuickQuiz{}
-	Why do CPUs~2 and 3 come to agreement so quickly, when it
-	takes so long for CPUs~1 and 4 to come to the party?
+	Why do CPUs~2 and~3 come to agreement so quickly, when it
+	takes so long for CPUs~1 and~4 to come to the party?
 \QuickQuizAnswer{
-	CPUs~2 and 3 are a pair of hardware threads on the same
+	CPUs~2 and~3 are a pair of hardware threads on the same
 	core, sharing the same cache hierarchy, and therefore have
 	very low communications latencies.
 	This is a NUMA, or, more accurately, a NUCA effect.

-	This leads to the question of why CPUs~2 and 3 ever disagree
+	This leads to the question of why CPUs~2 and~3 ever disagree
 	at all.
 	One possible reason is that they each might have a small amount
 	of private cache in addition to a larger shared cache.
@@ -350,17 +350,17 @@ CPU~4 believes that the value is ``4'' for almost 500ns.

 And if you think that the situation with four CPUs was intriguing, consider
 Figure~\ref{fig:advsync:A Variable With More Simultaneous Values},
-which shows the same situation, but with 15 CPUs each assigning their
-number to a single shared variable at time $t=0$. Both diagrams in the
+which shows the same situation, but with 15~CPUs each assigning their
+number to a single shared variable at time~$t=0$. Both diagrams in the
 figure are drawn in the same way as 
 Figure~\ref{fig:advsync:A Variable With Multiple Simultaneous Values}.
 The only difference is that the unit of horizontal axis is timebase ticks,
-with each tick lasting about 5.3 nanoseconds.
+with each tick lasting about 5.3~nanoseconds.
 The entire sequence therefore lasts a bit longer than the events recorded in
 Figure~\ref{fig:advsync:A Variable With Multiple Simultaneous Values},
 consistent with the increase in number of CPUs.
 The upper diagram shows the overall picture, while the lower one shows
-the zoom-up of first 50 timebase ticks.
+the zoom-up of first 50~timebase ticks.

 Again, CPU~0 coordinates the test, so does not record any values.

@@ -371,10 +371,10 @@ Again, CPU~0 coordinates the test, so does not record any values.
 \ContributedBy{Figure}{fig:advsync:A Variable With More Simultaneous Values}{Akira Yokosawa}
 \end{figure*}

-All CPUs eventually agree on the final value of 9, but not before
-the values 15 and 12 take early leads.
+All CPUs eventually agree on the final value of~9, but not before
+the values~15 and~12 take early leads.
 Note that there are fourteen different opinions on the variable's value
-at time 21 indicated by the vertical line in the lower diagram.
+at time~21 indicated by the vertical line in the lower diagram.
 Note also that all CPUs see sequences whose orderings are consistent with
 the directed graph shown in
 Figure~\ref{fig:advsync:Possible Global Orders With More Simultaneous Values}.
@@ -468,7 +468,7 @@ and
 CPU~4 sees the sequence {\tt \{4,2\}}.
 This is consistent with the global sequence {\tt \{3,1,4,2\}},
 but also with all five of the other sequences of these four numbers that end
-in ``2''.
+in~``2''.
 Thus, there will be agreement on the sequence of values taken on
 by a single variable, but there might be ambiguity.

@@ -477,7 +477,7 @@ In contrast, had the CPUs used atomic operations (such as the Linux kernel's
 unique values, their observations would
 be guaranteed to determine a single globally consistent sequence of values.
 One of the \co{atomic_inc_return()} invocations would happen first,
-and would change the value from 0 to 1, the second from 1 to 2, and
+and would change the value from~0 to~1, the second from~1 to~2, and
 so on.
 The CPUs could compare notes afterwards and come to agreement on the
 exact ordering of the sequence of \co{atomic_inc_return()} invocations.
@@ -500,7 +500,7 @@ commercially available computer systems.

 Pair-wise memory barriers provide conditional ordering semantics.
 For example, in the following set of operations, CPU~1's access to
-A does not unconditionally precede its access to B from the viewpoint
+A does not unconditionally precede its access to~B from the viewpoint
 of an external logic analyzer
 \IfInBook{(see Appendix~\ref{chp:app:whymb:Why Memory Barriers?}
 	  for examples).
@@ -508,9 +508,9 @@ of an external logic analyzer
 	 {(the system is only to act \emph{as if} the accesses
 	  are in order; it is not necessarily required to actually
 	  force them to be in order).}
-However, if CPU~2's access to B sees the result of CPU~1's access
-to B, then CPU~2's access to A is guaranteed to see the result of
-CPU~1's access to A.
+However, if CPU~2's access to~B sees the result of CPU~1's access
+to~B, then CPU~2's access to~A is guaranteed to see the result of
+CPU~1's access to~A.
 Although some CPU families' memory barriers do in fact provide stronger,
 unconditional ordering guarantees, portable code may rely only
 on this weaker if-then conditional ordering guarantee.
@@ -608,7 +608,7 @@ pairings that portable software may depend on.
 	In this pairing, one CPU executes a pair of loads separated
 	by a memory barrier, while a second CPU executes a pair
 	of stores also separated by a memory barrier, as follows
-	(both A and B are initially equal to zero):
+	(both~A and~B are initially equal to zero):

 	\vspace{5pt}
 	\begin{minipage}[t]{\columnwidth}
@@ -635,12 +635,12 @@ pairings that portable software may depend on.
 	\co{X==1}.

 	On the other hand, if \co{Y==0}, the memory-barrier condition
-	does not hold, and so in this case, X could be either 0 or 1.
+	does not hold, and so in this case, X~could be either~0 or~1.

 \paragraph{Pairing 2.}
 	In this pairing, each CPU executes a load followed by a
 	memory barrier followed by a store, as follows
-	(both A and B are initially equal to zero):
+	(both~A and~B are initially equal to zero):

 	\vspace{5pt}
 	\begin{minipage}[t]{\columnwidth}
@@ -667,7 +667,7 @@ pairings that portable software may depend on.
 	so that \co{Y==0}.

 	On the other hand, if \co{X==0}, the memory-barrier condition
-	does not hold, and so in this case, Y could be either 0 or 1.
+	does not hold, and so in this case, Y~could be either~0 or~1.

 	The two CPUs' code sequences are symmetric, so if \co{Y==1}
 	after both CPUs have finished executing these code sequences,
@@ -677,7 +677,7 @@ pairings that portable software may depend on.
 	In this pairing, one CPU executes a load followed by a
 	memory barrier followed by a store, while the other CPU
 	executes a pair of stores separated by a memory barrier,
-	as follows (both A and B are initially equal to zero):
+	as follows (both~A and~B are initially equal to zero):

 	\vspace{5pt}
 	\begin{minipage}[t]{\columnwidth}
@@ -701,11 +701,11 @@ pairings that portable software may depend on.
 	Due to the pairwise nature of memory barriers, CPU~1's
 	store following its memory barrier must therefore see
 	the results of CPU~2's store preceding its memory barrier.
-	This means that CPU~1's store to B will overwrite CPU~2's
-	store to B, resulting in \co{B==1}.
+	This means that CPU~1's store to~B will overwrite CPU~2's
+	store to~B, resulting in \co{B==1}.

 	On the other hand, if \co{X==0}, the memory-barrier condition
-	does not hold, and so in this case, B could be either 1 or 2.
+	does not hold, and so in this case, B~could be either~1 or~2.

 \subsubsection{Pair-Wise Memory Barriers: Semi-Portable Combinations}

@@ -733,7 +733,7 @@ keep in mind that they used to be a \emph{lot} harder on some systems!
 	one of the loads will see the value stored by the other thread
 	in the ears-to-mouths scenario?
 \QuickQuizAnswer{
-	The scenario is as follows, with A and B both initially zero:
+	The scenario is as follows, with~A and~B both initially zero:

 	CPU~0: A=1; \co{smp_mb()}; r1=B;

@@ -742,12 +742,12 @@ keep in mind that they used to be a \emph{lot} harder on some systems!
 	If neither of the loads see the corresponding store, when both
 	CPUs finish, both \co{r1} and \co{r2} will be equal to zero.
 	Let's suppose that \co{r1} is equal to zero.
-	Then we know that CPU~0's load from B happened before CPU~1's
-	store to B: After all, we would have had \co{r1} equal to one
+	Then we know that CPU~0's load from~B happened before CPU~1's
+	store to~B: After all, we would have had \co{r1} equal to one
 	otherwise.
-	But given that CPU~0's load from B happened before CPU~1's store
-	to B, memory-barrier pairing guarantees that CPU~0's store to A
-	happens before CPU~1's load from A, which in turn guarantees that
+	But given that CPU~0's load from~B happened before CPU~1's store
+	to~B, memory-barrier pairing guarantees that CPU~0's store to~A
+	happens before CPU~1's load from~A, which in turn guarantees that
 	\co{r2} will be equal to one, not zero.

 	Therefore, at least one of \co{r1} and \co{r2} must be nonzero,
@@ -777,8 +777,8 @@ keep in mind that they used to be a \emph{lot} harder on some systems!
 	Unfortunately, although this conclusion is correct on
 	21\textsuperscript{st}-century systems, it does not necessarily hold
 	on all antique 20\textsuperscript{th}-century systems.
-	Suppose that the cache line containing A is initially owned
-	by CPU~2, and that containing B is initially owned by CPU~1.
+	Suppose that the cache line containing~A is initially owned
+	by CPU~2, and that containing~B is initially owned by CPU~1.
 	Then, in systems that have invalidation queues and store
 	buffers, it is possible for the first assignments to ``pass
 	in the night'', so that the second assignments actually
@@ -812,10 +812,10 @@ these combinations in order to fully understand how this works.
 	(ignoring MMIO registers for the moment),
 	it is not possible for one of the loads to see the
 	results of the other load.
-	However, if we know that CPU~2's load from B returned a
-	newer value than CPU~1's load from B, then we also know
-	that CPU~2's load from A returned either the same value
-	as CPU~1's load from A or some later value.
+	However, if we know that CPU~2's load from~B returned a
+	newer value than CPU~1's load from~B, then we also know
+	that CPU~2's load from~A returned either the same value
+	as CPU~1's load from~A or some later value.

 \paragraph{Mouth to Mouth, Ear to Ear.}
 	One of the variables is only loaded from, and the other
@@ -826,12 +826,12 @@ these combinations in order to fully understand how this works.
 	provided by the memory barrier.

 	However, it is possible to determine which store happened
-	last, but this requires an additional load from B.
-	If this additional load from B is executed after both
+	last, but this requires an additional load from~B.
+	If this additional load from~B is executed after both
 	CPUs~1 and~2 complete, and if it turns out that CPU~2's
-	store to B happened last, then we know
-	that CPU~2's load from A returned either the same value
-	as CPU~1's load from A or some later value.
+	store to~B happened last, then we know
+	that CPU~2's load from~A returned either the same value
+	as CPU~1's load from~A or some later value.

 \paragraph{Only One Store.}
 	Because there is only one store, only one of the variables
@@ -843,28 +843,28 @@ these combinations in order to fully understand how this works.
 	At least not straightforwardly.
 	But suppose that in combination~1 from
 	Table~\ref{tab:advsync:Memory-Barrier Combinations},
-	CPU~1's load from A returns the value that CPU~2 stored
-	to A.  Then we know that CPU~1's load from B returned
-	either the same value as CPU~2's load from A or some later value.
+	CPU~1's load from~A returns the value that CPU~2 stored
+	to~A.  Then we know that CPU~1's load from~B returned
+	either the same value as CPU~2's load from~A or some later value.

 \QuickQuiz{}
 	How can the other ``Only one store'' entries in
 	Table~\ref{tab:advsync:Memory-Barrier Combinations}
 	be used?
 \QuickQuizAnswer{
-	For combination~2, if CPU~1's load from B sees a value prior
-	to CPU~2's store to B, then we know that CPU~2's load from A
-	will return the same value as CPU~1's load from A, or some later
+	For combination~2, if CPU~1's load from~B sees a value prior
+	to CPU~2's store to~B, then we know that CPU~2's load from~A
+	will return the same value as CPU~1's load from~A, or some later
 	value.

-	For combination~4, if CPU~2's load from B sees the value from
-	CPU~1's store to B, then we know that CPU~2's load from A
-	will return the same value as CPU~1's load from A, or some later
+	For combination~4, if CPU~2's load from~B sees the value from
+	CPU~1's store to~B, then we know that CPU~2's load from~A
+	will return the same value as CPU~1's load from~A, or some later
 	value.

-	For combination~8, if CPU~2's load from A sees CPU~1's store
-	to A, then we know that CPU~1's load from B will return the same
-	value as CPU~2's load from A, or some later value.
+	For combination~8, if CPU~2's load from~A sees CPU~1's store
+	to~A, then we know that CPU~1's load from~B will return the same
+	value as CPU~2's load from~A, or some later value.
 } \QuickQuizEnd

 \subsubsection{Semantics Sufficient to Implement Locking}
@@ -921,7 +921,7 @@ assert(b == 2);
 \QuickQuizAnswer{
 	If the CPU is not required to see all of its loads and
 	stores in order, then the {\tt b=1+a} might well see an
-	old version of the variable ``a''.
+	old version of the variable~``a''.

 	This is why it is so very important that each CPU or thread
 	see all of its own loads and stores in program order.
@@ -1090,28 +1090,28 @@ a few simple rules:
 		for example, if a given CPU never loaded or stored
 		the shared variable, then it can have no opinion about
 		that variable's value.}
-\item	If one CPU does ordered stores to variables A and B,\footnote{
-		For example, by executing the store to A, a
-		memory barrier, and then the store to B.}
-	and if a second CPU does ordered loads from B and A,\footnote{
-		For example, by executing the load from B, a
-		memory barrier, and then the load from A.}
-	then if the second CPU's load from B gives the value stored
-	by the first CPU, then the second CPU's load from A must
+\item	If one CPU does ordered stores to variables~A and~B,\footnote{
+		For example, by executing the store to~A, a
+		memory barrier, and then the store to~B.}
+	and if a second CPU does ordered loads from~B and~A,\footnote{
+		For example, by executing the load from~B, a
+		memory barrier, and then the load from~A.}
+	then if the second CPU's load from~B gives the value stored
+	by the first CPU, then the second CPU's load from~A must
 	give the value stored by the first CPU.
-\item	If one CPU does a load from A ordered before a store to B,
-	and if a second CPU does a load from B ordered before a store to A,
-	and if the second CPU's load from B gives the value stored by
-	the first CPU, then the first CPU's load from A must \emph{not}
+\item	If one CPU does a load from~A ordered before a store to~B,
+	and if a second CPU does a load from~B ordered before a store to~A,
+	and if the second CPU's load from~B gives the value stored by
+	the first CPU, then the first CPU's load from~A must \emph{not}
 	give the value stored by the second CPU.
-\item	If one CPU does a load from A ordered before a store to B,
-	and if a second CPU does a store to B ordered before a
-	store to A, and if the first CPU's load from A gives
+\item	If one CPU does a load from~A ordered before a store to~B,
+	and if a second CPU does a store to~B ordered before a
+	store to~A, and if the first CPU's load from~A gives
 	the value stored by the second CPU, then the first CPU's
-	store to B must happen after the second CPU's store to B,
+	store to~B must happen after the second CPU's store to~B,
 	hence the value stored by the first CPU persists.\footnote{
 		Or, for the more competitively oriented, the first
-		CPU's store to B ``wins''.}
+		CPU's store to~B ``wins''.}
 \end{enumerate}

 The next section takes a more operational view of these rules.
@@ -1142,7 +1142,7 @@ interface between the CPU and rest of the system (the dotted lines).


 For example, consider the following sequence of events given the
-initial values {\tt \{A = 1, B = 2\}}:
+initial values {\tt \{A~=~1, B~=~2\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -1199,7 +1199,7 @@ perceived by the loads made by another CPU in the same order as the stores were
 committed.

 As a further example, consider this sequence of events given the
-initial values {\tt \{A = 1, B = 2, C = 3, P = \&A, Q = \&C\}}:
+initial values {\tt \{A~=~1, B~=~2, C~=~3, P~=~\&A, Q~=~\&C\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -1215,8 +1215,8 @@ initial values {\tt \{A = 1, B = 2, C = 3, P = \&A, Q = \&C\}}:
 \vspace{5pt}

 There is an obvious data dependency here,
-as the value loaded into \co{D} depends on
-the address retrieved from \co{P} by CPU~2.
+as the value loaded into~\co{D} depends on
+the address retrieved from~\co{P} by CPU~2.
 At the end of the sequence, any of the
 following results are possible:

@@ -1232,8 +1232,8 @@ following results are possible:
 \end{minipage}
 \vspace{5pt}

-Note that CPU~2 will never try and load C into D because the CPU will load P
-into Q before issuing the load of *Q.
+Note that CPU~2 will never try and load~C into~D because the CPU will load~P
+into~Q before issuing the load of~*Q.

 \subsection{Device Operations}
 \label{sec:advsync:Device Operations}
@@ -1241,8 +1241,8 @@ into Q before issuing the load of *Q.
 Some devices present their control interfaces as collections of memory
 locations, but the order in which the control registers are accessed is very
 important.  For instance, imagine an Ethernet card with a set of internal
-registers that are accessed through an address port register (A) and a data
-port register (D).  To read internal register 5, the following code might then
+registers that are accessed through an address port register~(A) and a data
+port register~(D).  To read internal register~5, the following code might then
 be used:

 \vspace{5pt}
@@ -1594,7 +1594,7 @@ Section~\ref{sec:advsync:Device Operations}).

 \QuickQuiz{}
 	What effect does the following sequence have on the
-	order of stores to variables ``a'' and ``b''?
+	order of stores to variables~``a'' and~``b''?

 	\vspace{5pt}
 	\begin{minipage}[t]{\columnwidth}
@@ -1607,9 +1607,9 @@ Section~\ref{sec:advsync:Device Operations}).
 	\end{minipage}
 \QuickQuizAnswer{
 	Absolutely none.  This barrier {\em would} ensure that the
-	assignments to ``a'' and ``b'' happened before any subsequent
+	assignments to~``a'' and~``b'' happened before any subsequent
 	assignments, but it does nothing to enforce any order of
-	assignments to ``a'' and ``b'' themselves.
+	assignments to~``a'' and~``b'' themselves.
 } \QuickQuizEnd

 \subsubsection{What May Not Be Assumed About Memory Barriers?}
@@ -1652,7 +1652,7 @@ of the confines of a given architecture:
 The usage requirements of data dependency barriers are a little subtle, and
 it's not always obvious that they're needed.  To illustrate, consider the
 following sequence of events, with initial values
-{\tt \{A = 1, B = 2, C = 3, P = \&A, Q = \&C\}}:
+{\tt \{A~=~1, B~=~2, C~=~3, P~=~\&A, Q~=~\&C\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -1671,8 +1671,8 @@ following sequence of events, with initial values
 \vspace{5pt}

 There's a clear data dependency here, and it would seem intuitively
-obvious that by the end of the sequence, \co{Q} must be either \co{&A}
-or \co{&B}, and that:
+obvious that by the end of the sequence, \co{Q}~must be either~\co{&A}
+or~\co{&B}, and that:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -1686,8 +1686,8 @@ or \co{&B}, and that:
 \vspace{5pt}

 Counter-intuitive though it might be, it is quite possible that
-CPU~2's perception of \co{P} might be updated \emph{before} its perception
-of \co{B}, thus leading to the following situation:
+CPU~2's perception of~\co{P} might be updated \emph{before} its perception
+of~\co{B}, thus leading to the following situation:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -1705,7 +1705,7 @@ Alpha).

 To deal with this, a data dependency barrier must be inserted between the
 address load and the data load (again with initial values of
-{\tt \{A = 1, B = 2, C = 3, P = \&A, Q = \&C\}}):
+{\tt \{A~=~1, B~=~2, C~=~3, P~=~\&A, Q~=~\&C\}}):

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -1731,17 +1731,17 @@ Note that this extremely counterintuitive situation arises most easily on
 machines with split caches, so that, for example, one cache bank processes
 even-numbered cache lines and the other bank processes odd-numbered cache
 lines.
-The pointer \co{P} might be stored in an odd-numbered cache line, and the
-variable \co{B} might be stored in an even-numbered cache line.  Then, if the
+The pointer~\co{P} might be stored in an odd-numbered cache line, and the
+variable~\co{B} might be stored in an even-numbered cache line.  Then, if the
 even-numbered bank of the reading CPU's cache is extremely busy while the
 odd-numbered bank is idle, one can see the new value of the
-pointer \co{P} (which is \co{&B}),
-but the old value of the variable \co{B} (which is 2).
+pointer~\co{P} (which is~\co{&B}),
+but the old value of the variable~\co{B} (which is~2).

 Another example of where data dependency barriers might by required is where a
 number is read from memory and then used to calculate the index for an array
 access with initial values
-{\tt \{M[0] = 1, M[1] = 2, M[3] = 3, P = 0, Q = 3\}}:
+{\tt \{M[0]~=~1, M[1]~=~2, M[3]~=~3, P~=~0, Q~=~3\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -1799,7 +1799,7 @@ Consider the following bit of code:
 This will not have the desired effect because there is no actual data
 dependency, but rather a control dependency that the CPU may short-circuit
 by attempting to predict the outcome in advance, so that other CPUs see
-the load from \co{y} as having happened before the load from \co{x}.
+the load from~\co{y} as having happened before the load from~\co{x}.
 In such a case what's actually required is:

 \vspace{5pt}
@@ -1834,13 +1834,13 @@ Control dependencies pair normally with other types of barriers.
 That said, please note that neither \co{READ_ONCE()} nor \co{WRITE_ONCE()}
 are optional!
 Without the \co{READ_ONCE()}, the compiler might combine the load
-from \co{x} with other loads from \co{x}.
-Without the \co{WRITE_ONCE()}, the compiler might combine the store to
-\co{y} with other stores to \co{y}.
+from~\co{x} with other loads from~\co{x}.
+Without the \co{WRITE_ONCE()}, the compiler might combine the store
+to~\co{y} with other stores to~\co{y}.
 Either can result in highly counterintuitive effects on ordering.

 Worse yet, if the compiler is able to prove (say) that the value of
-variable \co{x} is always non-zero, it would be well within its rights
+variable~\co{x} is always non-zero, it would be well within its rights
 to optimize the original example by eliminating the ``\co{if}'' statement
 as follows:

@@ -1894,8 +1894,8 @@ optimization levels:
 \end{minipage}
 \vspace{5pt}

-Now there is no conditional between the load from \co{x} and the store to
-\co{y}, which means that the CPU is within its rights to reorder them:
+Now there is no conditional between the load from~\co{x} and the store
+to~\co{y}, which means that the CPU is within its rights to reorder them:
 The conditional is absolutely required, and must be present in the
 assembly code even after all compiler optimizations have been applied.
 Therefore, if you need ordering in this example, you need explicit
@@ -1918,9 +1918,9 @@ memory barriers, for example, a release store:
 \vspace{5pt}

 The initial \co{READ_ONCE()} is still required to prevent the compiler from
-proving the value of \co{x}.
+proving the value of~\co{x}.

-In addition, you need to be careful what you do with the local variable
+In addition, you need to be careful what you do with the local variable~%
 \co{q},
 otherwise the compiler might be able to guess the value and again remove
 the needed conditional.
@@ -1942,7 +1942,7 @@ For example:
 \end{minipage}
 \vspace{5pt}

-If \co{MAX} is defined to be 1, then the compiler knows that \co{(q\%MAX)} is
+If \co{MAX} is defined to be~1, then the compiler knows that \co{(q\%MAX)} is
 equal to zero, in which case the compiler is within its rights to
 transform the above code into the following:

@@ -1958,7 +1958,7 @@ transform the above code into the following:
 \vspace{5pt}

 Given this transformation, the CPU is not required to respect the ordering
-between the load from variable \co{x} and the store to variable \co{y}.
+between the load from variable~\co{x} and the store to variable~\co{y}.
 It is tempting to add a \co{barrier()} to constrain the compiler,
 but this does not help.
 The conditional is gone, and the barrier won't bring it back.
@@ -1982,7 +1982,7 @@ that \co{MAX} is greater than one, perhaps as follows:
 \end{minipage}
 \vspace{5pt}

-Please note once again that the stores to \co{y} differ.
+Please note once again that the stores to~\co{y} differ.
 If they were identical, as noted earlier, the compiler could pull this
 store outside of the ``\co{if}'' statement.

@@ -2042,9 +2042,9 @@ not necessarily apply to code following the if-statement:

 It is tempting to argue that there in fact is ordering because the
 compiler cannot reorder volatile accesses and also cannot reorder
-the writes to \co{y} with the condition.
+the writes to~\co{y} with the condition.
 Unfortunately for this line
-of reasoning, the compiler might compile the two writes to \co{y} as
+of reasoning, the compiler might compile the two writes to~\co{y} as
 conditional-move instructions, as in this fanciful pseudo-assembly
 language:

@@ -2063,7 +2063,7 @@ language:
 \vspace{5pt}

 A weakly ordered CPU would have no dependency of any sort between the load
-from \co{x} and the store to \co{z}.
+from~\co{x} and the store to~\co{z}.
 The control dependencies would extend
 only to the pair of cmov instructions and the store depending on them.
 In short, control dependencies apply only to the stores in the ``\co{then}''
@@ -2071,8 +2071,8 @@ and ``\co{else}'' of the ``\co{if}'' in question (including functions
 invoked by those two clauses), not to code following that ``\co{if}''.

 Finally, control dependencies do \emph{not} provide transitivity.
-This is demonstrated by two related examples, with the initial values of
-\co{x} and \co{y} both being zero:
+This is demonstrated by two related examples, with the initial values
+of~\co{x} and~\co{y} both being zero:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -2114,7 +2114,7 @@ not), then adding the following CPU would guarantee a related assertion:
 But because control dependencies do \emph{not} provide transitivity, the above
 assertion can fail after the combined three-CPU example completes.
 If you need the three-CPU example to provide ordering, you will need
-\co{smp_mb()} between the loads and stores in the CPU 0 and CPU 1 code
+\co{smp_mb()} between the loads and stores in the CPU~0 and CPU~1 code
 fragments, that is, just before or just after the ``\co{if}'' statements.
 Furthermore, the original two-CPU example is very fragile and should be avoided.

@@ -2270,7 +2270,7 @@ Figure~\ref{fig:advsync:Write Barrier Ordering Semantics}.

 Secondly, data dependency barriers act as partial orderings on data-dependent
 loads.  Consider the following sequence of events with initial values
-{\tt \{B = 7, X = 9, Y = 8, C = \&Y\}}:
+{\tt \{B~=~7, X~=~9, Y~=~8, C~=~\&Y\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -2300,13 +2300,13 @@ shown in Figure~\ref{fig:advsync:Data Dependency Barrier Omitted}.
 \ContributedBy{Figure}{fig:advsync:Data Dependency Barrier Omitted}{David Howells}
 \end{figure*}

-In the above example, CPU~2 perceives that \co{B} is 7,
-despite the load of \co{*C}
-(which would be \co{B}) coming after the \co{LOAD} of \co{C}.
+In the above example, CPU~2 perceives that \co{B} is~7,
+despite the load of~\co{*C}
+(which would be~\co{B}) coming after the \co{LOAD} of~\co{C}.

-If, however, a data dependency barrier were to be placed between the load of
-\co{C} and the load of \co{*C} (i.e.: \co{B}) on CPU~2, again with initial
-values of {\tt \{B = 7, X = 9, Y = 8, C = \&Y\}}:
+If, however, a data dependency barrier were to be placed between the load
+of~\co{C} and the load of~\co{*C} (i.e.:~\co{B}) on CPU~2, again with initial
+values of {\tt \{B~=~7, X~=~9, Y~=~8, C~=~\&Y\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -2338,7 +2338,7 @@ Figure~\ref{fig:advsync:Data Dependency Barrier Supplied}.

 And thirdly, a read barrier acts as a partial order on loads.  Consider the
 following sequence of events, with initial values
-{\tt \{A = 0, B = 9\}}:
+{\tt \{A~=~0, B~=~9\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -2367,9 +2367,9 @@ shown in Figure~\ref{fig:advsync:Read Barrier Needed}.
 \ContributedBy{Figure}{fig:advsync:Read Barrier Needed}{David Howells}
 \end{figure*}

-If, however, a read barrier were to be placed between the load of \co{B}
-and the load of \co{A} on CPU~2, again with initial values of
-{\tt \{A = 0, B = 9\}}:
+If, however, a read barrier were to be placed between the load of~\co{B}
+and the load of~\co{A} on CPU~2, again with initial values of
+{\tt \{A~=~0, B~=~9\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -2400,9 +2400,9 @@ Figure~\ref{fig:advsync:Read Barrier Supplied}.
 \end{figure*}

 To illustrate this more completely, consider what could happen if the code
-contained a load of \co{A} either side of the read barrier, once again
+contained a load of~\co{A} either side of the read barrier, once again
 with the same initial values of
-{\tt \{A = 0, B = 9\}}:
+{\tt \{A~=~0, B~=~9\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -2422,8 +2422,8 @@ with the same initial values of
 \end{minipage}
 \vspace{5pt}

-Even though the two loads of \co{A}
-both occur after the load of \co{B}, they may both
+Even though the two loads of~\co{A}
+both occur after the load of~\co{B}, they may both
 come up with different values, as shown in
 Figure~\ref{fig:advsync:Read Barrier Supplied, Double Load}.

@@ -2434,7 +2434,7 @@ Figure~\ref{fig:advsync:Read Barrier Supplied, Double Load}.
 \ContributedBy{Figure}{fig:advsync:Read Barrier Supplied, Double Load}{David Howells}
 \end{figure*}

-Of course, it may well be that CPU~1's update to \co{A} becomes perceptible
+Of course, it may well be that CPU~1's update to~\co{A} becomes perceptible
 to CPU~2 before the read barrier completes, as shown in
 Figure~\ref{fig:advsync:Read Barrier Supplied, Take Two}.

@@ -2445,11 +2445,11 @@ Figure~\ref{fig:advsync:Read Barrier Supplied, Take Two}.
 \ContributedBy{Figure}{fig:advsync:Read Barrier Supplied, Take Two}{David Howells}
 \end{figure*}

-The guarantee is that the second load will always come up with \co{A == 1}
+The guarantee is that the second load will always come up with \nbco{A == 1}
 if the
-load of \co{B} came up with \co{B == 2}.
-No such guarantee exists for the first load of
-\co{A}; that may come up with either \co{A == 0} or \co{A == 1}.
+load of~\co{B} came up with \nbco{B == 2}.
+No such guarantee exists for the first load
+of~\co{A}; that may come up with either \nbco{A == 0} or \nbco{A == 1}.

 \subsubsection{Read Memory Barriers vs. Load Speculation}
 \label{sec:advsync:Read Memory Barriers vs. Load Speculation}
@@ -2484,7 +2484,7 @@ For example, consider the following:

 On some CPUs, divide instructions can take a long time to complete,
 which means that CPU~2's bus might go idle during that time.
-CPU~2 might therefore speculatively load \co{A} before the divides
+CPU~2 might therefore speculatively load~\co{A} before the divides
 complete.
 In the (hopefully) unlikely event of an exception from one of the dividees,
 this speculative load will have been wasted, but in the (again, hopefully)
@@ -2523,9 +2523,9 @@ dependent on the type of barrier used.  If there was no change made to the
 speculated memory location, then the speculated value will just be used,
 as shown in
 Figure~\ref{fig:advsync:Speculative Loads and Barrier}.
-On the other hand, if there was an update or invalidation to \co{A}
+On the other hand, if there was an update or invalidation to~\co{A}
 from some other CPU, then the speculation will be cancelled and the
-value of \co{A} will be reloaded,
+value of~\co{A} will be reloaded,
 as shown in Figure~\ref{fig:advsync:Speculative Loads Cancelled by Barrier}.

 \begin{figure*}[htbp]
@@ -2899,8 +2899,8 @@ operations concurrently:
 	Given that operations grouped in curly braces are executed
 	concurrently, which of the rows of
 	Table~\ref{tab:advsync:Lock-Based Critical Sections}
-	are legitimate reorderings of the assignments to variables
-	``A'' through ``F'' and the ACQUIRE/RELEASE operations?
+	are legitimate reorderings of the assignments to variables~``A''
+	through~`F'' and the ACQUIRE/RELEASE operations?
 	(The order in the code is {\tt *A, *B, ACQUIRE, *C, *D, RELEASE, *E, *F}.)
 	Why or why not?
 \QuickQuizAnswer{
@@ -2908,18 +2908,18 @@ operations concurrently:
 	\item	Legitimate, executed in order.
 	\item	Legitimate, the lock acquisition was executed concurrently
 		with the last assignment preceding the critical section.
-	\item	Illegitimate, the assignment to ``F'' must follow the ACQUIRE
+	\item	Illegitimate, the assignment to~``F'' must follow the ACQUIRE
 		operation.
 	\item	Illegitimate, the ACQUIRE must complete before any operation in
 		the critical section.  However, the RELEASE may legitimately
 		be executed concurrently with subsequent operations.
-	\item	Legitimate, the assignment to ``A'' precedes the RELEASE,
+	\item	Legitimate, the assignment to~``A'' precedes the RELEASE,
 		as required, and all other operations are in order.
-	\item	Illegitimate, the assignment to ``C'' must follow the ACQUIRE.
-	\item	Illegitimate, the assignment to ``D'' must precede the RELEASE.
+	\item	Illegitimate, the assignment to~``C'' must follow the ACQUIRE.
+	\item	Illegitimate, the assignment to~``D'' must precede the RELEASE.
 	\item	Legitimate, all assignments are ordered with respect to the
 		ACQUIRE and RELEASE operations.
-	\item	Illegitimate, the assignment to ``A'' must precede the RELEASE.
+	\item	Illegitimate, the assignment to~``A'' must precede the RELEASE.
 	\end{enumerate}
 } \QuickQuizEnd

@@ -2928,7 +2928,7 @@ Code containing multiple locks still sees ordering constraints from
 those locks, but one must be careful to keep track of which lock is which.
 For example, consider the code shown in
 Table~\ref{tab:advsync:Ordering With Multiple Locks}, which uses
-a pair of locks named ``M'' and ``Q''.
+a pair of locks named~``M'' and~``Q''.

 \begin{table}[htbp]
 \scriptsize\centering{\tt
@@ -2947,7 +2947,7 @@ a pair of locks named ``M'' and ``Q''.
 \end{table}

 In this example, there are no guarantees as to what order the
-assignments to variables ``A'' through ``H'' will appear in, other
+assignments to variables~``A'' through~``H'' will appear in, other
 than the constraints imposed by the locks themselves, as
 described in the previous section.

@@ -2986,11 +2986,11 @@ Table~\ref{tab:advsync:Ordering With Multiple CPUs on One Lock}?
 \label{tab:advsync:Ordering With Multiple CPUs on One Lock}
 \end{table}

-In this case, either CPU~1 acquires M before CPU~2 does, or vice versa.
-In the first case, the assignments to A, B, and C must precede
-those to F, G, and H.
+In this case, either CPU~1 acquires~M before CPU~2 does, or vice versa.
+In the first case, the assignments to~A, B, and~C must precede
+those to~F, G, and~H.
 On the other hand, if CPU~2 acquires the lock first, then the
-assignments to E, F, and G must precede those to B, C, and D.
+assignments to~E, F, and~G must precede those to~B, C, and~D.

 \subsection{The Effects of the CPU Cache}
 \label{sec:advsync:The Effects of the CPU Cache}
@@ -3046,9 +3046,9 @@ Figure~\ref{fig:advsync:Split Caches}, in which each CPU has a split
 cache.
 This system has the following properties:
 \begin{enumerate}
-\item	An odd-numbered cache line may be in cache A, cache C,
+\item	An odd-numbered cache line may be in cache~A, cache~C,
 	in memory, or some combination of the above.
-\item	An even-numbered cache line may be in cache B, cache D,
+\item	An even-numbered cache line may be in cache~B, cache~D,
 	in memory, or some combination of the above.
 \item	While the CPU core is interrogating one of its caches,\footnote{
 		But note that in ``superscalar'' systems, the CPU
@@ -3067,7 +3067,7 @@ This system has the following properties:
 	stores to cache lines affected by entries in those queues.
 \end{enumerate}

-In short, if cache A is busy, but cache B is idle, then CPU~1's
+In short, if cache~A is busy, but cache~B is idle, then CPU~1's
 stores to odd-numbered cache lines may be delayed compared to
 CPU~2's stores to even-numbered cache lines.
 In not-so-extreme cases, CPU~2 may see CPU~1's operations out
-- 
2.7.4


