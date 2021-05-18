Return-Path: <SRS0=cX2R=KN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BAP9weXj5EkAQCUorhap5ey40jFoqlSifCVD6QU6qM0=;
        b=AvzUVJYwoIQTpfEJDsr/FsOwfHbZQhGosX3znFP5pCEZBk4efMCXMu6ZSd3UEYVKYt
         Y9mzJ1h4ThzsrIjlqszQWlFIl5HscR075BW4bMIoYRAc4RgPiMvBU9+0FepkZOldm+Hs
         x6L5KU3GWxigk1cDsmSeCfGvw7EhsyjxGn9c+eLE1oKNwRM7NAFUaRAse1MUIULhFKF6
         ZyO1mvkUKApsrWc54gjn4cJXRtMnnoMk0MlSh9y1Ni3N+tN+VDlgb8NiiASb6qt1oGUs
         0LC6wqkg5FI7r0u3uZcqic91z86iWn4Z9T7yU+uPR7aMrRmnyH39W8tYOPoKfKEuEVT2
         gD9A==
Subject: [PATCH -perfbook 6/8] formal: Employ \cref{} and its variants
References: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <af58922f-5fd0-b011-9d9a-3e137542efa4@gmail.com>
Date: Tue, 18 May 2021 21:23:15 +0900
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
 formal/axiomatic.tex  |  90 +++++++++++++++----------------
 formal/dyntickrcu.tex |   2 +-
 formal/formal.tex     |   6 +--
 formal/sat.tex        |   2 +-
 formal/spinhint.tex   | 122 +++++++++++++++++++++---------------------
 formal/stateless.tex  |   2 +-
 6 files changed, 112 insertions(+), 112 deletions(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index c7a22343..12bba26c 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -36,7 +36,7 @@ exists
 
 Although the PPCMEM tool can solve the famous ``independent reads of
 independent writes'' (IRIW) litmus test shown in
-Listing~\ref{lst:formal:IRIW Litmus Test}, doing so requires no less than
+\cref{lst:formal:IRIW Litmus Test}, doing so requires no less than
 fourteen CPU hours and generates no less than ten gigabytes of state space.
 That said, this situation is a great improvement over that before the advent
 of PPCMEM, where solving this problem required perusing volumes of
@@ -72,7 +72,7 @@ converts litmus tests to theorems that might be proven or disproven
 over this set of axioms.
 The resulting tool, called ``herd'',  conveniently takes as input the
 same litmus tests as PPCMEM, including the IRIW litmus test shown in
-Listing~\ref{lst:formal:IRIW Litmus Test}.
+\cref{lst:formal:IRIW Litmus Test}.
 
 \begin{listing}
 \begin{fcvlabel}[ln:formal:Expanded IRIW Litmus Test]
@@ -113,7 +113,7 @@ That said, the problem is exponential in nature, so we should expect
 herd to exhibit exponential slowdowns for larger problems.
 And this is exactly what happens, for example, if we add four more writes
 per writing CPU as shown in
-Listing~\ref{lst:formal:Expanded IRIW Litmus Test},
+\cref{lst:formal:Expanded IRIW Litmus Test},
 herd slows down by a factor of more than 50,000, requiring more than
 15 \emph{minutes} of CPU time.
 Adding threads also results in exponential
@@ -124,15 +124,15 @@ useful for checking key parallel algorithms, including the queued-lock
 handoff on x86 systems.
 The weaknesses of the herd tool are similar to those of PPCMEM, which
 were described in
-Section~\ref{sec:formal:PPCMEM Discussion}.
+\cref{sec:formal:PPCMEM Discussion}.
 There are some obscure (but very real) cases for which the PPCMEM and
 herd tools disagree, and as of 2021 many but not all of these disagreements
 was resolved.
 
 It would be helpful if the litmus tests could be written in C
-(as in Listing~\ref{lst:formal:Meaning of PPCMEM Litmus Test})
+(as in \cref{lst:formal:Meaning of PPCMEM Litmus Test})
 rather than assembly
-(as in Listing~\ref{lst:formal:PPCMEM Litmus Test}).
+(as in \cref{lst:formal:PPCMEM Litmus Test}).
 This is now possible, as will be described in the following sections.
 
 \subsection{Axiomatic Approaches and Locking}
@@ -141,7 +141,7 @@ This is now possible, as will be described in the following sections.
 Axiomatic approaches may also be applied to higher-level
 languages and also to higher-level synchronization primitives, as
 exemplified by the lock-based litmus test shown in
-Listing~\ref{lst:formal:Locking Example} (\path{C-Lock1.litmus}).
+\cref{lst:formal:Locking Example} (\path{C-Lock1.litmus}).
 This litmus test can be modeled by the Linux kernel memory model
 (LKMM)~\cite{Alglave:2018:FSC:3173162.3177156,LucMaranget2018lock.cat}.
 As expected, the \co{herd} tool's output features the string \co{Never},
@@ -149,8 +149,8 @@ correctly indicating that \co{P1()} cannot see \co{x} having a value
 of one.\footnote{
 	The output of the \co{herd} tool is compatible with that
 	of PPCMEM, so feel free to look at
-	Listings~\ref{lst:formal:PPCMEM Detects an Error}
-	and~\ref{lst:formal:PPCMEM on Repaired Litmus Test}
+	\cref{lst:formal:PPCMEM Detects an Error,%
+	lst:formal:PPCMEM on Repaired Litmus Test}
 	for examples showing the output format.}
 
 \begin{listing}
@@ -161,7 +161,7 @@ of one.\footnote{
 
 \QuickQuiz{
 	What do you have to do to run \co{herd} on litmus tests like
-	that shown in Listing~\ref{lst:formal:Locking Example}?
+	that shown in \cref{lst:formal:Locking Example}?
 }\QuickQuizAnswer{
 	Get version v4.17 (or later) of the Linux-kernel source code,
 	then follow the instructions in \path{tools/memory-model/README}
@@ -177,7 +177,7 @@ of one.\footnote{
 \end{listing}
 
 Of course, if \co{P0()} and \co{P1()} use different locks, as shown in
-Listing~\ref{lst:formal:Broken Locking Example} (\path{C-Lock2.litmus}),
+\cref{lst:formal:Broken Locking Example} (\path{C-Lock2.litmus}),
 then all bets are off.
 And in this case, the \co{herd} tool's output features the string
 \co{Sometimes}, correctly indicating that use of different locks allows
@@ -188,7 +188,7 @@ And in this case, the \co{herd} tool's output features the string
 	Why not simply emulate locking with atomic operations?
 }\QuickQuizAnswer{
 	In a word, performance, as can be seen in
-	Table~\ref{tab:formal:Locking: Modeling vs. Emulation Time (s)}.
+	\cref{tab:formal:Locking: Modeling vs. Emulation Time (s)}.
 	The first column shows the number of herd processes modeled.
 	The second column shows the herd runtime when modeling
 	\co{spin_lock()} and \co{spin_unlock()} directly in herd's
@@ -264,16 +264,16 @@ The next section looks at RCU\@.
 Axiomatic approaches can also analyze litmus tests involving
 RCU~\cite{Alglave:2018:FSC:3173162.3177156}.
 To that end,
-Listing~\ref{lst:formal:Canonical RCU Removal Litmus Test}
+\cref{lst:formal:Canonical RCU Removal Litmus Test}
 (\path{C-RCU-remove.litmus})
 shows a litmus test corresponding to the canonical RCU-mediated
 removal from a linked list.
 As with the locking litmus test, this RCU litmus test can be
 modeled by LKMM, with similar performance advantages compared
 to modeling emulations of RCU\@.
-Line~\lnref{head} shows \co{x} as the list head, initially
+\Clnref{head} shows \co{x} as the list head, initially
 referencing \co{y}, which in turn is initialized to the value
-\co{2} on line~\lnref{tail:1}.
+\co{2} on \clnref{tail:1}.
 
 \begin{listing}
 \input{CodeSamples/formal/herd/C-RCU-remove@whole.fcv}
@@ -283,23 +283,23 @@ referencing \co{y}, which in turn is initialized to the value
 
 \co{P0()} on \clnrefrange{P0start}{P0end}
 removes element \co{y} from the list by replacing it with element \co{z}
-(line~\lnref{assignnewtail}),
-waits for a grace period (line~\lnref{sync}),
-and finally zeroes \co{y} to emulate \co{free()} (line~\lnref{free}).
+(\clnref{assignnewtail}),
+waits for a grace period (\clnref{sync}),
+and finally zeroes \co{y} to emulate \co{free()} (\clnref{free}).
 \co{P1()} on \clnrefrange{P1start}{P1end}
 executes within an RCU read-side critical section
 (\clnrefrange{rl}{rul}),
-picking up the list head (line~\lnref{rderef}) and then
-loading the next element (line~\lnref{read}).
+picking up the list head (\clnref{rderef}) and then
+loading the next element (\clnref{read}).
 The next element should be non-zero, that is, not yet freed
-(line~\lnref{exists_}).
+(\clnref{exists_}).
 Several other variables are output for debugging purposes
-(line~\lnref{locations_}).
+(\clnref{locations_}).
 
 The output of the \co{herd} tool when running this litmus test features
 \co{Never}, indicating that \co{P0()} never accesses a freed element,
 as expected.
-Also as expected, removing line~\lnref{sync} results in \co{P0()}
+Also as expected, removing \clnref{sync} results in \co{P0()}
 accessing a freed element, as indicated by the \co{Sometimes} in
 the \co{herd} output.
 \end{fcvref}
@@ -313,7 +313,7 @@ the \co{herd} output.
 \begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 A litmus test for a more complex example proposed by
 \ppl{Roman}{Penyaev}~\cite{RomanPenyaev2018rrRCU} is shown in
-Listing~\ref{lst:formal:Complex RCU Litmus Test}
+\cref{lst:formal:Complex RCU Litmus Test}
 (\path{C-RomanPenyaev-list-rcu-rr.litmus}).
 In this example, readers (modeled by \co{P0()} on
 \clnrefrange{P0start}{P0end}) access a linked list
@@ -342,7 +342,7 @@ In the Linux kernel, this would be a doubly linked circular list,
 but \co{herd} is currently incapable of modeling such a beast.
 The strategy is instead to use a singly linked linear list that
 is long enough that the end is never reached.
-Line~\lnref{rrcache} defines variable \co{c}, which is used to
+\Clnref{rrcache} defines variable \co{c}, which is used to
 cache the list pointer between successive RCU read-side critical
 sections.
 
@@ -350,46 +350,46 @@ Again, \co{P0()} on \clnrefrange{P0start}{P0end} models readers.
 This process models a pair of successive readers traversing round-robin
 through the list, with the first reader on \clnrefrange{rl1}{rul1}
 and the second reader on \clnrefrange{rl2}{rul2}.
-Line~\lnref{rdcache} fetches the pointer cached in \co{c}, and if
-line~\lnref{rdckcache} sees that the pointer was \co{NULL},
-line~\lnref{rdinitcache} restarts at the beginning of the list.
-In either case, line~\lnref{rdnext} advances to the next list element,
-and line~\lnref{rdupdcache} stores a pointer to this element back into
+\Clnref{rdcache} fetches the pointer cached in \co{c}, and if
+\clnref{rdckcache} sees that the pointer was \co{NULL},
+\clnref{rdinitcache} restarts at the beginning of the list.
+In either case, \clnref{rdnext} advances to the next list element,
+and \clnref{rdupdcache} stores a pointer to this element back into
 variable \co{c}.
 \Clnrefrange{rl2}{rul2} repeat this process, but using
 registers \co{r3} and \co{r4} instead of \co{r1} and \co{r2}.
 As with
-Listing~\ref{lst:formal:Canonical RCU Removal Litmus Test},
+\cref{lst:formal:Canonical RCU Removal Litmus Test},
 this litmus test stores zero to emulate \co{free()}, so
-line~\lnref{exists_} checks for any of these four registers being
+\clnref{exists_} checks for any of these four registers being
 \co{NULL}, also known as zero.
 
 Because \co{P0()} leaks an RCU-protected pointer from its first
 RCU read-side critical section to its second, \co{P1()} must carry
 out its update (removing \co{x}) very carefully.
-Line~\lnref{updremove} removes \co{x} by linking \co{w} to \co{y}.
-Line~\lnref{updsync1} waits for readers, after which no subsequent reader
+\Clnref{updremove} removes \co{x} by linking \co{w} to \co{y}.
+\Clnref{updsync1} waits for readers, after which no subsequent reader
 has a path to \co{x} via the linked list.
-Line~\lnref{updrdcache} fetches \co{c}, and if line~\lnref{updckcache}
+\Clnref{updrdcache} fetches \co{c}, and if \clnref{updckcache}
 determines that \co{c} references the newly removed \co{x},
-line~\lnref{updinitcache} sets \co{c} to \co{NULL}
-and line~\lnref{updsync2} again waits for readers, after which no
+\clnref{updinitcache} sets \co{c} to \co{NULL}
+and \clnref{updsync2} again waits for readers, after which no
 subsequent reader can fetch \co{x} from \co{c}.
-In either case, line~\lnref{updfree} emulates \co{free()} by storing
+In either case, \clnref{updfree} emulates \co{free()} by storing
 zero to \co{x}.
 
 \QuickQuiz{
 	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
-	In Listing~\ref{lst:formal:Complex RCU Litmus Test},
+	In \cref{lst:formal:Complex RCU Litmus Test},
 	why couldn't a reader fetch \co{c} just before \co{P1()}
-	zeroed it on line~\lnref{updinitcache}, and then later
+	zeroed it on \clnref{updinitcache}, and then later
 	store this same value back into \co{c} just after it was
 	zeroed, thus defeating the zeroing operation?
 	\end{fcvref}
 }\QuickQuizAnswer{
 	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	Because the reader advances to the next element on
-	line~\lnref{rdnext}, thus avoiding storing a pointer to the
+	\clnref{rdnext}, thus avoiding storing a pointer to the
 	same element as was fetched.
 	\end{fcvref}
 }\QuickQuizEnd
@@ -405,9 +405,9 @@ in the \co{herd} output.
 \QuickQuizSeries{%
 \QuickQuizB{
 	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
-	In Listing~\ref{lst:formal:Complex RCU Litmus Test},
+	In \cref{lst:formal:Complex RCU Litmus Test},
 	why not have just one call to \co{synchronize_rcu()}
-	immediately before line~\lnref{updfree}?
+	immediately before \clnref{updfree}?
 	\end{fcvref}
 }\QuickQuizAnswerB{
 	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
@@ -418,8 +418,8 @@ in the \co{herd} output.
 %
 \QuickQuizE{
 	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
-	Also in Listing~\ref{lst:formal:Complex RCU Litmus Test},
-	can't line~\lnref{updfree} be \co{WRITE_ONCE()} instead
+	Also in \cref{lst:formal:Complex RCU Litmus Test},
+	can't \clnref{updfree} be \co{WRITE_ONCE()} instead
 	of \co{smp_store_release()}?
 	\end{fcvref}
 }\QuickQuizAnswerE{
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index ea534b10..f1494f20 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -503,7 +503,7 @@ re-entering dynticks-idle mode (for example, that same task blocking).
 	In fact, one must instead explicitly model lack of memory barriers,
 	for example, as shown in
 	\cref{lst:formal:QRCU Unordered Summation} on
-	page~\pageref{lst:formal:QRCU Unordered Summation}.
+	\cpageref{lst:formal:QRCU Unordered Summation}.
 }\QuickQuizEndB
 %
 \QuickQuizE{
diff --git a/formal/formal.tex b/formal/formal.tex
index d0ac6d4f..0f954861 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -174,7 +174,7 @@ The larger overarching software construct is of course validated by testing.
 
 	Perhaps someday formal verification will be used heavily for
 	validation, including for what is now known as regression testing.
-	Section~\ref{sec:future:Formal Regression Testing?} looks at
+	\Cref{sec:future:Formal Regression Testing?} looks at
 	what would be required to make this possibility a reality.
 }\QuickQuizEnd
 
@@ -203,10 +203,10 @@ formal-verification tools require your code to be hand-translated
 to a special-purpose language.
 For example, a complex implementation of the dynticks interface for
 preemptible RCU that was presented in
-Section~\ref{sec:formal:Promela Parable: dynticks and Preemptible RCU}
+\cref{sec:formal:Promela Parable: dynticks and Preemptible RCU}
 turned out to
 have a much simpler alternative implementation, as discussed in
-Section~\ref{sec:formal:Simplicity Avoids Formal Verification}.
+\cref{sec:formal:Simplicity Avoids Formal Verification}.
 All else being equal, a simpler implementation is much better than
 a proof of correctness for a complex implementation.
 
diff --git a/formal/sat.tex b/formal/sat.tex
index 85b67ed0..cc85e4fc 100644
--- a/formal/sat.tex
+++ b/formal/sat.tex
@@ -36,7 +36,7 @@ One example is the C bounded model checker, or \co{cbmc}, which is
 available as part of many Linux distributions.
 This tool is quite easy to use, with \co{cbmc test.c} sufficing to
 validate \path{test.c}, resulting in the processing flow shown in
-Figure~\ref{fig:formal:CBMC Processing Flow}.
+\cref{fig:formal:CBMC Processing Flow}.
 This ease of use is exceedingly important because it opens the door
 to formal verification being incorporated into regression-testing
 frameworks.
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index d05bab16..98784801 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -12,18 +12,18 @@ This section features the general-purpose Promela and Spin tools,
 which may be used to carry out a full
 state-space search of many types of multi-threaded code.
 They are used to verifying data communication protocols.
-Section~\ref{sec:formal:Promela and Spin}
+\Cref{sec:formal:Promela and Spin}
 introduces Promela and Spin, including a couple of warm-up exercises
 verifying both non-atomic and atomic increment.
-Section~\ref{sec:formal:How to Use Promela}
+\Cref{sec:formal:How to Use Promela}
 describes use of Promela, including example command lines and a
 comparison of Promela syntax to that of C\@.
-Section~\ref{sec:formal:Promela Example: Locking}
+\Cref{sec:formal:Promela Example: Locking}
 shows how Promela may be used to verify locking,
-\ref{sec:formal:Promela Example: QRCU}
+\cref{sec:formal:Promela Example: QRCU}
 uses Promela to verify an unusual implementation of RCU named ``QRCU'',
 and finally
-Section~\ref{sec:formal:Promela Parable: dynticks and Preemptible RCU}
+\cref{sec:formal:Promela Parable: dynticks and Preemptible RCU}
 applies Promela to early versions of RCU's dyntick-idle implementation.
 
 \subsection{Promela and Spin}
@@ -64,12 +64,12 @@ more complex uses.
 \label{sec:formal:Warm-Up: Non-Atomic Increment}
 
 \begin{fcvref}[ln:formal:promela:increment:whole]
-Listing~\ref{lst:formal:Promela Code for Non-Atomic Increment}
+\Cref{lst:formal:Promela Code for Non-Atomic Increment}
 demonstrates the textbook race condition
 resulting from non-atomic increment.
-Line~\lnref{nprocs} defines the number of processes to run (we will vary this
-to see the effect on state space), line~\lnref{count} defines the counter,
-and line~\lnref{prog} is used to implement the assertion that appears on
+\Clnref{nprocs} defines the number of processes to run (we will vary this
+to see the effect on state space), \clnref{count} defines the counter,
+and \clnref{prog} is used to implement the assertion that appears on
 \clnrefrange{assert:b}{assert:e}.
 
 \begin{listing}
@@ -85,7 +85,7 @@ block later in the code.
 Because simple Promela statements are each assumed atomic, we must
 break the increment into the two statements on
 \clnrefrange{incr:b}{incr:e}.
-The assignment on line~\lnref{setprog} marks the process's completion.
+The assignment on \clnref{setprog} marks the process's completion.
 Because the Spin system will fully search the state space, including
 all possible sequences of states, there is no need for the loop
 that would be used for conventional stress testing.
@@ -113,13 +113,13 @@ initializes the i-th
 incrementer's progress cell, runs the i-th incrementer's process, and
 then increments the variable \co{i}.
 The second block of the \co{do-od} on
-line~\lnref{block2} exits the loop once
+\clnref{block2} exits the loop once
 these processes have been started.
 
 The atomic block on \clnrefrange{assert:b}{assert:e} also contains
 a similar \co{do-od}
 loop that sums up the progress counters.
-The \co{assert()} statement on line~\lnref{assert} verifies that
+The \co{assert()} statement on \clnref{assert} verifies that
 if all processes
 have been completed, then all counts have been correctly recorded.
 \end{fcvref}
@@ -140,7 +140,7 @@ cc -DSAFETY -o pan pan.c    # Compile the model
 \end{listing}
 
 This will produce output as shown in
-Listing~\ref{lst:formal:Non-Atomic Increment Spin Output}.
+\cref{lst:formal:Non-Atomic Increment Spin Output}.
 The first line tells us that our assertion was violated (as expected
 given the non-atomic increment!).
 The second line that a \co{trail} file was written describing how the
@@ -167,7 +167,7 @@ spin -t -p increment.spin
 \end{listing*}
 
 This gives the output shown in
-Listing~\ref{lst:formal:Non-Atomic Increment Error Trail}.
+\cref{lst:formal:Non-Atomic Increment Error Trail}.
 As can be seen, the first portion of the init block created both
 incrementer processes, both of which first fetched the counter,
 then both incremented and stored it, losing a count.
@@ -178,13 +178,13 @@ The assertion then triggered, after which the global state is displayed.
 
 It is easy to fix this example by placing the body of the incrementer
 processes in an atomic block as shown in
-Listing~\ref{lst:formal:Promela Code for Atomic Increment}.
+\cref{lst:formal:Promela Code for Atomic Increment}.
 One could also have simply replaced the pair of statements with
 \co{counter = counter + 1}, because Promela statements are
 atomic.
 Either way, running this modified model gives us an error-free traversal
 of the state space, as shown in
-Listing~\ref{lst:formal:Atomic Increment Spin Output}.
+\cref{lst:formal:Atomic Increment Spin Output}.
 
 \begin{listing}
 \input{CodeSamples/formal/promela/atomicincrement@incrementer.fcv}
@@ -199,7 +199,7 @@ Listing~\ref{lst:formal:Atomic Increment Spin Output}.
 \label{lst:formal:Atomic Increment Spin Output}
 \end{listing}
 
-Table~\ref{tab:advsync:Memory Usage of Increment Model}
+\Cref{tab:advsync:Memory Usage of Increment Model}
 shows the number of states and memory consumed
 as a function of number of incrementers modeled
 (by redefining \co{NUMPROCS}):
@@ -422,14 +422,14 @@ fi
 	After all, they are not part of the algorithm.
 	One example of a complex assertion (to be discussed in more
 	detail later) is as shown in
-	Listing~\ref{lst:formal:Complex Promela Assertion}.
+	\cref{lst:formal:Complex Promela Assertion}.
 
 	There is no reason to evaluate this assertion
 	non-atomically, since it is not actually part of the algorithm.
 	Because each statement contributes to state, we can reduce
 	the number of useless states by enclosing it in an \co{atomic}
 	block as shown in
-	Listing~\ref{lst:formal:Atomic Block for Complex Promela Assertion}.
+	\cref{lst:formal:Atomic Block for Complex Promela Assertion}.
 
 \item	Promela does not provide functions.
 	You must instead use C preprocessor macros.
@@ -485,19 +485,19 @@ Since locks are generally useful, \co{spin_lock()} and
 \co{spin_unlock()}
 macros are provided in \path{lock.h}, which may be included from
 multiple Promela models, as shown in
-Listing~\ref{lst:formal:Promela Code for Spinlock}.
+\cref{lst:formal:Promela Code for Spinlock}.
 The \co{spin_lock()} macro contains an infinite \co{do-od} loop
 spanning \clnrefrange{dood:b}{dood:e},
-courtesy of the single guard expression of ``1'' on line~\lnref{one}.
+courtesy of the single guard expression of ``1'' on \clnref{one}.
 The body of this loop is a single atomic block that contains
 an \co{if-fi} statement.
 The \co{if-fi} construct is similar to the \co{do-od} construct, except
 that it takes a single pass rather than looping.
-If the lock is not held on line~\lnref{notheld}, then
-line~\lnref{acq} acquires it and
-line~\lnref{break} breaks out of the enclosing \co{do-od} loop (and also exits
+If the lock is not held on \clnref{notheld}, then
+\clnref{acq} acquires it and
+\clnref{break} breaks out of the enclosing \co{do-od} loop (and also exits
 the atomic block).
-On the other hand, if the lock is already held on line~\lnref{held},
+On the other hand, if the lock is already held on \clnref{held},
 we do nothing (\co{skip}), and fall out of the \co{if-fi} and the
 atomic block so as to take another pass through the outer
 loop, repeating until the lock is available.
@@ -530,36 +530,36 @@ weak memory ordering must be explicitly coded.
 
 \begin{fcvref}[ln:formal:promela:lock:spin]
 These macros are tested by the Promela code shown in
-Listing~\ref{lst:formal:Promela Code to Test Spinlocks}.
+\cref{lst:formal:Promela Code to Test Spinlocks}.
 This code is similar to that used to test the increments,
 with the number of locking processes defined by the \co{N_LOCKERS}
-macro definition on line~\lnref{nlockers}.
-The mutex itself is defined on line~\lnref{mutex},
+macro definition on \clnref{nlockers}.
+The mutex itself is defined on \clnref{mutex},
 an array to track the lock owner
-on line~\lnref{array}, and line~\lnref{sum} is used by assertion
+on \clnref{array}, and \clnref{sum} is used by assertion
 code to verify that only one process holds the lock.
 \end{fcvref}
 
 \begin{fcvref}[ln:formal:promela:lock:spin:locker]
 The locker process is on \clnrefrange{b}{e}, and simply loops forever
-acquiring the lock on line~\lnref{lock}, claiming it on line~\lnref{claim},
-unclaiming it on line~\lnref{unclaim}, and releasing it on line~\lnref{unlock}.
+acquiring the lock on \clnref{lock}, claiming it on \clnref{claim},
+unclaiming it on \clnref{unclaim}, and releasing it on \clnref{unlock}.
 \end{fcvref}
 
 \begin{fcvref}[ln:formal:promela:lock:spin:init]
 The init block on \clnrefrange{b}{e} initializes the current locker's
-havelock array entry on line~\lnref{array}, starts the current locker on
-line~\lnref{start}, and advances to the next locker on line~\lnref{next}.
+havelock array entry on \clnref{array}, starts the current locker on
+\clnref{start}, and advances to the next locker on \clnref{next}.
 Once all locker processes are spawned, the \co{do-od} loop
-moves to line~\lnref{chkassert}, which checks the assertion.
-Lines~\lnref{sum} and~\lnref{j} initialize the control variables,
+moves to \clnref{chkassert}, which checks the assertion.
+\Clnref{sum,j} initialize the control variables,
 \clnrefrange{atm:b}{atm:e} atomically sum the havelock array entries,
-line~\lnref{assert} is the assertion, and line~\lnref{break} exits the loop.
+\clnref{assert} is the assertion, and \clnref{break} exits the loop.
 \end{fcvref}
 
 We can run this model by placing the two code fragments of
-Listings~\ref{lst:formal:Promela Code for Spinlock}
-and~\ref{lst:formal:Promela Code to Test Spinlocks} into
+\cref{lst:formal:Promela Code for Spinlock,%
+lst:formal:Promela Code to Test Spinlocks} into
 files named \path{lock.h} and \path{lock.spin}, respectively, and then running
 the following commands:
 
@@ -577,7 +577,7 @@ cc -DSAFETY -o pan pan.c
 \end{listing}
 
 The output will look something like that shown in
-Listing~\ref{lst:formal:Output for Spinlock Test}.
+\cref{lst:formal:Output for Spinlock Test}.
 As expected, this run has no assertion failures (``errors: 0'').
 
 \QuickQuizSeries{%
@@ -676,7 +676,7 @@ but is unlikely to ever be included in the Linux kernel.
 \end{listing}
 
 Returning to the Promela code for QRCU, the global variables are as shown in
-Listing~\ref{lst:formal:QRCU Global Variables}.
+\cref{lst:formal:QRCU Global Variables}.
 This example uses locking and includes \path{lock.h}.
 Both the number of readers and writers can be varied using the
 two \co{#define} statements, giving us not one but two ways to create
@@ -706,19 +706,19 @@ Finally, the \co{mutex} variable is used to serialize updaters' slowpaths.
 
 \begin{fcvref}[ln:formal:promela:qrcu:reader]
 QRCU readers are modeled by the \co{qrcu_reader()} process shown in
-Listing~\ref{lst:formal:QRCU Reader Process}.
+\cref{lst:formal:QRCU Reader Process}.
 A \co{do-od} loop spans \clnrefrange{do}{od},
 with a single guard of ``1''
-on line~\lnref{one} that makes it an infinite loop.
-Line~\lnref{curidx} captures the current value of the global index,
+on \clnref{one} that makes it an infinite loop.
+\Clnref{curidx} captures the current value of the global index,
 and \clnrefrange{atm:b}{atm:e}
 atomically increment it (and break from the infinite loop)
 if its value was non-zero (\co{atomic_inc_not_zero()}).
-Line~\lnref{cs:entry} marks entry into the RCU read-side critical section, and
-line~\lnref{cs:exit} marks exit from this critical section,
+\Clnref{cs:entry} marks entry into the RCU read-side critical section, and
+\clnref{cs:exit} marks exit from this critical section,
 both lines for the benefit of
 the \co{assert()} statement that we shall encounter later.
-Line~\lnref{atm:dec} atomically decrements the same counter that we incremented,
+\Clnref{atm:dec} atomically decrements the same counter that we incremented,
 thereby exiting the RCU read-side critical section.
 \end{fcvref}
 
@@ -730,22 +730,22 @@ thereby exiting the RCU read-side critical section.
 
 \begin{fcvref}[ln:formal:promela:qrcu:sum_unordered]
 The C-preprocessor macro shown in
-Listing~\ref{lst:formal:QRCU Unordered Summation}
+\cref{lst:formal:QRCU Unordered Summation}
 sums the pair of counters so as to emulate weak memory ordering.
 \Clnrefrange{fetch:b}{fetch:e} fetch one of the counters,
-and line~\lnref{sum_other} fetches the other
+and \clnref{sum_other} fetches the other
 of the pair and sums them.
 The atomic block consists of a single \co{do-od} statement.
 This \co{do-od} statement (spanning \clnrefrange{do}{od}) is unusual in that
 it contains two unconditional
-branches with guards on lines~\lnref{g1} and~\lnref{g2}, which causes Promela to
+branches with guards on \clnref{g1,g2}, which causes Promela to
 non-deterministically choose one of the two (but again, the full
 state-space search causes Promela to eventually make all possible
 choices in each applicable situation).
 The first branch fetches the zero-th counter and sets \co{i} to 1 (so
-that line~\lnref{sum_other} will fetch the first counter), while the second
+that \clnref{sum_other} will fetch the first counter), while the second
 branch does the opposite, fetching the first counter and setting \co{i}
-to 0 (so that line~\lnref{sum_other} will fetch the second counter).
+to 0 (so that \clnref{sum_other} will fetch the second counter).
 \end{fcvref}
 
 \QuickQuiz{
@@ -764,20 +764,20 @@ to 0 (so that line~\lnref{sum_other} will fetch the second counter).
 \begin{fcvref}[ln:formal:promela:qrcu:updater]
 With the \co{sum_unordered} macro in place, we can now proceed
 to the update-side process shown in
-Listing~\ref{lst:formal:QRCU Updater Process}.
+\cref{lst:formal:QRCU Updater Process}.
 The update-side process repeats indefinitely, with the corresponding
 \co{do-od} loop ranging over \clnrefrange{do}{od}.
 Each pass through the loop first snapshots the global \co{readerprogress}
 array into the local \co{readerstart} array on
 \clnrefrange{atm1:b}{atm1:e}.
-This snapshot will be used for the assertion on line~\lnref{assert}.
-Line~\lnref{sum_unord} invokes \co{sum_unordered}, and then
+This snapshot will be used for the assertion on \clnref{assert}.
+\Clnref{sum_unord} invokes \co{sum_unordered}, and then
 \clnrefrange{reinvoke:b}{reinvoke:e}
 re-invoke \co{sum_unordered} if the fastpath is potentially
 usable.
 
 \Clnrefrange{slow:b}{slow:e} execute the slowpath code if need be, with
-lines~\lnref{acq} and~\lnref{rel} acquiring and releasing the update-side lock,
+\clnref{acq,rel} acquiring and releasing the update-side lock,
 \clnrefrange{flip_idx:b}{flip_idx:e} flipping the index, and
 \clnrefrange{wait:b}{wait:e} waiting for
 all pre-existing readers to complete.
@@ -849,7 +849,7 @@ this update still be in progress.
 
 \begin{fcvref}[ln:formal:promela:qrcu:init]
 All that remains is the initialization block shown in
-Listing~\ref{lst:formal:QRCU Initialization Process}.
+\cref{lst:formal:QRCU Initialization Process}.
 This block simply initializes the counter pair on
 \clnrefrange{i_ctr:b}{i_ctr:e},
 spawns the reader processes on
@@ -908,7 +908,7 @@ cc -DSAFETY [-DCOLLAPSE] -o pan pan.c
 \end{table}
 
 The output shows that this model passes all of the cases shown in
-Table~\ref{tab:advsync:Memory Usage of QRCU Model}.
+\cref{tab:advsync:Memory Usage of QRCU Model}.
 It would be nice to run three readers and three
 updaters, however, simple extrapolation indicates that this will
 require about half a terabyte of memory.
@@ -943,7 +943,7 @@ a long run due to incomplete search resulting from a too-tight
 depth limit.
 This run took a little more than 3~days on a \Power{9} server.
 The result is shown in
-Listing~\ref{lst:formal:spinhint:3 Readers 3 Updaters QRCU Spin Output with -DMA=96}.
+\cref{lst:formal:spinhint:3 Readers 3 Updaters QRCU Spin Output with -DMA=96}.
 This Spin run completed successfully with a total memory
 usage of only 6.5\,GB, which is almost two orders of magnitude
 lower than the \co{-DCOLLAPSE} usage of about half a terabyte.
@@ -973,7 +973,7 @@ lower than the \co{-DCOLLAPSE} usage of about half a terabyte.
 	runs with \co{-DCOLLAPSE} and with \co{-DMA=88}
 	(two readers and three updaters).
 	The diff of outputs from those runs is shown in
-	Listing~\ref{lst:formal:promela:Spin Output Diff of -DCOLLAPSE and -DMA=88}.
+	\cref{lst:formal:promela:Spin Output Diff of -DCOLLAPSE and -DMA=88}.
 	As you can see, they agree on the numbers of states
 	(stored and matched).
 }\QuickQuizEnd
@@ -1029,7 +1029,7 @@ lower than the \co{-DCOLLAPSE} usage of about half a terabyte.
 \label{tab:formal:promela:QRCU Spin Result Summary}
 \end{table*}
 
-For reference, Table~\ref{tab:formal:promela:QRCU Spin Result Summary}
+For reference, \cref{tab:formal:promela:QRCU Spin Result Summary}
 summarizes the Spin results with \co{-DCOLLAPSE} and \co{-DMA=N}
 compiler flags.
 The memory usage is obtained with minimal sufficient
@@ -1038,7 +1038,7 @@ Hashtable sizes for \co{-DCOLLAPSE} runs are tweaked by
 the \co{-wN} option of \co{./pan} to avoid using too much
 memory hashing small state spaces.
 Hence the memory usage is smaller than what is shown in
-Table~\ref{tab:advsync:Memory Usage of QRCU Model}, where the
+\cref{tab:advsync:Memory Usage of QRCU Model}, where the
 hashtable size starts from the default of \co{-w24}.
 The runtime is from a \Power{9} server, which shows that \co{-DMA=N}
 suffers up to about an order of magnitude higher CPU overhead
diff --git a/formal/stateless.tex b/formal/stateless.tex
index 0622a5d6..ef393a60 100644
--- a/formal/stateless.tex
+++ b/formal/stateless.tex
@@ -26,7 +26,7 @@ Although the jury is still out on this question, stateless model
 checkers such as Nidhugg~\cite{CarlLeonardsson2014Nidhugg} have in
 some cases handled larger programs~\cite{SMC-TreeRCU}, and with
 similar ease of use, as illustrated by
-Figure~\ref{fig:formal:Nidhugg Processing Flow}.
+\cref{fig:formal:Nidhugg Processing Flow}.
 In addition, Nidhugg was more than an order of magnitude faster than
 was \co{cbmc} for some Linux-kernel RCU verification scenarios.
 Of course, Nidhugg's speed and scalability advantages are tied to
-- 
2.17.1


