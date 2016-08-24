Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ACaTqF2czqXK7ylzgD3BRTQ9krs5YflWcNWjhMTexRU=;
 b=ECbP1ARdtaaPGZd1HrxhR1ibT2lkV1V6Ev6dCoWTQMmcc2/sRd12SIhOGGNvX+n/S3
 XfPBENyTEG1pDVinJL6o/ksF7iOHAlzPPBgl/tPRPv7DHsCnnTaFpCmEgvc7wBVR+PVL
 1EW2KE5S9TpQ9btOHP5K6u4FEWHK/ZemXXMt6CVreJORXbbD7iNJX880gMPBDIhoMkn0
 W8mOVSiSYDer/UPKjU6+XI7fKf8CH+2Tp/96zpXWsEFp7ujwM42URhG/3h6utGBhBw9Q
 fqD+d9MDKtgsx1I12zmwlQZPqCPDQJv/eRrp36TwWPBHptkhOVYRY0vuvRpdS+66KaTp
 hWag==
Subject: [PATCH 1/3] treewide: Use nbsp after 'Lines' and 'lines'
References: <bd90da8b-ed06-e104-8a70-96b029ad666a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cac5dbf8-6588-c73e-072f-096c0b6ba6f6@gmail.com>
Date: Wed, 24 Aug 2016 23:09:43 +0900
MIME-Version: 1.0
In-Reply-To: <bd90da8b-ed06-e104-8a70-96b029ad666a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 862b7d5149cc29c5ddd29e3df14411b7130e0f89 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 14 Aug 2016 14:42:19 +0900
Subject: [PATCH 1/3] treewide: Use nbsp after 'Lines' and 'lines'

This commit is the result of applying a modified version
of "hyphen2endash.sh", whose substitution rules are:

sed -e 's/Lines \([0-9]\+\)-\([0-9]\+\)/Lines~\1-\2/g' \
    -e 's/lines \([0-9]\+\)-\([0-9]\+\)/lines~\1-\2/g' \
    -e 's/Line~\([0-9]\+\)-\([0-9]\+\)/Lines~\1-\2/g' \
    -e 's/Line \([0-9]\+\)-\([0-9]\+\)/Lines~\1-\2/g' \
    -e 's/line~\([0-9]\+\)-\([0-9]\+\)/lines~\1-\2/g' \
    -e 's/line \([0-9]\+\)-\([0-9]\+\)/lines~\1-\2/g' \
    -e 's/\/\* Lines~\([0-9]\+\)-\([0-9]\+\) \*\//\/\* Lines \1-\2 \*\//g'

3rd--6th rules fix typos such as "Line nn-mm".
The last rule is to preserve "Lines nn-mm" in comments within
code snippets.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/questions/after.tex         |  4 +--
 appendix/rcuimpl/rcutreewt.tex       |  8 +++---
 appendix/rcuimpl/srcu.tex            |  2 +-
 appendix/whymb/whymemorybarriers.tex |  2 +-
 datastruct/datastruct.tex            |  2 +-
 formal/dyntickrcu.tex                |  2 +-
 formal/spinhint.tex                  | 56 ++++++++++++++++++------------------
 toolsoftrade/toolsoftrade.tex        |  2 +-
 8 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index 25fea75..8f2767e 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -192,8 +192,8 @@ This lock must also be released after line 13 in
 Figure~\ref{fig:app:questions:After Producer Function} and
 after line 17 in
 Figure~\ref{fig:app:questions:After Consumer Function}.
-These locks cause the code segments in line 10-13 of
-Figure~\ref{fig:app:questions:After Producer Function} and in line 13-17 of
+These locks cause the code segments in lines~10-13 of
+Figure~\ref{fig:app:questions:After Producer Function} and in lines~13-17 of
 Figure~\ref{fig:app:questions:After Consumer Function} to {\em exclude}
 each other, in other words, to run atomically with respect to each other.
 This is represented in
diff --git a/appendix/rcuimpl/rcutreewt.tex b/appendix/rcuimpl/rcutreewt.tex
index 19e664b..bb7e0e3 100644
--- a/appendix/rcuimpl/rcutreewt.tex
+++ b/appendix/rcuimpl/rcutreewt.tex
@@ -1049,7 +1049,7 @@ line~11 invokes \co{cpu_needs_another_gp()} to see if the current
 CPU has callbacks that need another RCU grace period to elapse,
 line~13 checks to see if the current grace period has ended,
 line~15 checks to see if a new grace period has started,
-and, finally, lines 17-22 check to see if it is time to attempt
+and, finally, lines~17-22 check to see if it is time to attempt
 to force holdout CPUs to pass through a quiescent state.
 This latter check breaks down as follows: (1) lines~17-18 check to see
 if there is a grace period in progress, and, if so, lines~19-22
@@ -2003,7 +2003,7 @@ If so, lines~31-38 move them.
 Line~31 splices the list of callbacks onto the end of the running CPU's
 list.
 Lines~32-33 sets the running CPU's callback tail pointer to that of
-the CPU going offline, and then lines 34-36 initialize the going-offline
+the CPU going offline, and then lines~34-36 initialize the going-offline
 CPU's list to be empty.
 Line~37 adds the length of the going-offline CPU's callback list to
 that of the currently running CPU, and, finally, line 38 zeroes the
@@ -3754,7 +3754,7 @@ to record a quiescent state for any that are currently in dynticks-idle
 state (but not currently in an irq or NMI handler).
 Lines~41-42 serve to inform gcc that this branch of the switch statement
 is dead code for non-\co{CONFIG_NO_HZ} kernels.
-Lines 43-45 invoke \co{rcu_process_dyntick()} in order to invoke
+Lines~43-45 invoke \co{rcu_process_dyntick()} in order to invoke
 \co{dyntick_save_progress_counter()} for each CPU that has not yet
 passed through a quiescent state for the current grace period,
 exiting \co{force_quiescent_state()} if the grace period ends in
@@ -3906,7 +3906,7 @@ duration, with line~14 invoking \co{print_other_cpu_stall()} if so.
 Figure~\ref{fig:app:rcuimpl:rcutreewt:Code for print-cpu-stall}
 shows the code for \co{print_cpu_stall()}.

-Line~6-11 prints a console message and dumps the current CPU's stack,
+Lines~6-11 prints a console message and dumps the current CPU's stack,
 while lines~12-17 compute the time to the next CPU stall warning, should
 the grace period stretch on that much additional time.

diff --git a/appendix/rcuimpl/srcu.tex b/appendix/rcuimpl/srcu.tex
index 2bbd214..7c774c6 100644
--- a/appendix/rcuimpl/srcu.tex
+++ b/appendix/rcuimpl/srcu.tex
@@ -351,7 +351,7 @@ could be accomplished without a reboot.

 The \co{readside()} function overlaps an RCU and an SRCU read-side
 critical section, with the former running from lines~5-11 and the
-latter running from lines 10-13.
+latter running from lines~10-13.
 The RCU read-side critical section uses Pure
 %
 % RCU\IfInBook{ (see Section~\ref{sec:advsync:Pure RCU})}
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index c2110dc..2ee2db3 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1713,7 +1713,7 @@ code shown in
 Figure~\ref{fig:app:whymb:Insert and Lock-Free Search}.
 This \co{smp_wmb()} on line~9 of this figure
 guarantees that the element initialization
-in lines 6-8 is executed before the element is added to the
+in lines~6-8 is executed before the element is added to the
 list on line~10, so that the lock-free search will work correctly.
 That is, it makes this guarantee on all CPUs {\em except} Alpha.

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index b86527f..c963da5 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -275,7 +275,7 @@ arbitrary hash functions, with the key-comparison function passed in via
 \co{cmp()}, in a manner similar to \co{qsort()}.
 Line~11 maps from the hash value to a pointer to the corresponding
 hash bucket.
-Each pass through the loop spanning line~12-19 examines one element
+Each pass through the loop spanning lines~12-19 examines one element
 of the bucket's hash chain.
 Line~15 checks to see if the hash values match, and if not, line~16
 proceeds to the next element.
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index f64639c..2cd8310 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1215,7 +1215,7 @@ to model an interrupt handler:
 \end{verbatim}
 }

-The loop from line~7-48 models up to \co{MAX_DYNTICK_LOOP_IRQ}
+The loop from lines~7-48 models up to \co{MAX_DYNTICK_LOOP_IRQ}
 interrupts, with lines~8 and 9 forming the loop condition and line~45
 incrementing the control variable.
 Line~10 tells \co{dyntick_nohz()} that an interrupt handler
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 0970ad7..1e9df53 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -115,39 +115,39 @@ resulting from non-atomic increment.
 Line 1 defines the number of processes to run (we will vary this
 to see the effect on state space), line 3 defines the counter,
 and line 4 is used to implement the assertion that appears on
-lines 29-39.
+lines~29-39.

-Lines 6-13 define a process that increments the counter non-atomically.
+Lines~6-13 define a process that increments the counter non-atomically.
 The argument \co{me} is the process number, set by the initialization
 block later in the code.
 Because simple Promela statements are each assumed atomic, we must
-break the increment into the two statements on lines 10-11.
+break the increment into the two statements on lines~10-11.
 The assignment on line 12 marks the process's completion.
 Because the Spin system will fully search the state space, including
 all possible sequences of states, there is no need for the loop
 that would be used for conventional testing.

-Lines 15-40 are the initialization block, which is executed first.
-Lines 19-28 actually do the initialization, while lines 29-39
+Lines~15-40 are the initialization block, which is executed first.
+Lines~19-28 actually do the initialization, while lines~29-39
 perform the assertion.
 Both are atomic blocks in order to avoid unnecessarily increasing
 the state space: because they are not part of the algorithm proper,
 we lose no verification coverage by making them atomic.

-The do-od construct on lines 21-27 implements a Promela loop,
+The do-od construct on lines~21-27 implements a Promela loop,
 which can be thought of as a C {\tt for (;;)} loop containing a
 \co{switch} statement that allows expressions in case labels.
 The condition blocks (prefixed by {\tt ::})
 are scanned non-deterministically,
 though in this case only one of the conditions can possibly hold at a given
 time.
-The first block of the do-od from lines 22-25 initializes the i-th
+The first block of the do-od from lines~22-25 initializes the i-th
 incrementer's progress cell, runs the i-th incrementer's process, and
 then increments the variable \co{i}.
 The second block of the do-od on line 26 exits the loop once
 these processes have been started.

-The atomic block on lines 29-39 also contains a similar do-od
+The atomic block on lines~29-39 also contains a similar do-od
 loop that sums up the progress counters.
 The {\tt assert()} statement on line 38 verifies that if all processes
 have been completed, then all counts have been correctly recorded.
@@ -638,7 +638,7 @@ macros are provided in \path{lock.h}, which may be included from
 multiple Promela models, as shown in
 Figure~\ref{fig:analysis:Promela Code for Spinlock}.
 The \co{spin_lock()} macro contains an infinite do-od loop
-spanning lines 2-11,
+spanning lines~2-11,
 courtesy of the single guard expression of ``1'' on line 3.
 The body of this loop is a single atomic block that contains
 an if-fi statement.
@@ -729,17 +729,17 @@ The mutex itself is defined on line 5, an array to track the lock owner
 on line 6, and line 7 is used by assertion
 code to verify that only one process holds the lock.

-The locker process is on lines 9-18, and simply loops forever
+The locker process is on lines~9-18, and simply loops forever
 acquiring the lock on line 13, claiming it on line 14,
 unclaiming it on line 15, and releasing it on line 16.

-The init block on lines 20-44 initializes the current locker's
+The init block on lines~20-44 initializes the current locker's
 havelock array entry on line 26, starts the current locker on
 line 27, and advances to the next locker on line 28.
 Once all locker processes are spawned, the do-od loop
 moves to line 29, which checks the assertion.
 Lines 30 and 31 initialize the control variables,
-lines 32-40 atomically sum the havelock array entries,
+lines~32-40 atomically sum the havelock array entries,
 line 41 is the assertion, and line 42 exits the loop.

 We can run this model by placing the above two code fragments into
@@ -965,9 +965,9 @@ Finally, the \co{mutex} variable is used to serialize updaters' slowpaths.

 QRCU readers are modeled by the \co{qrcu_reader()} process shown in
 Figure~\ref{fig:analysis:QRCU Reader Process}.
-A do-od loop spans lines 5-16, with a single guard of ``1''
+A do-od loop spans lines~5-16, with a single guard of ``1''
 on line 6 that makes it an infinite loop.
-Line 7 captures the current value of the global index, and lines 8-15
+Line 7 captures the current value of the global index, and lines~8-15
 atomically increment it (and break from the infinite loop)
 if its value was non-zero (\co{atomic_inc_not_zero()}).
 Line 17 marks entry into the RCU read-side critical section, and
@@ -1004,10 +1004,10 @@ thereby exiting the RCU read-side critical section.
 The C-preprocessor macro shown in
 Figure~\ref{fig:analysis:QRCU Unordered Summation}
 sums the pair of counters so as to emulate weak memory ordering.
-Lines 2-13 fetch one of the counters, and line 14 fetches the other
+Lines~2-13 fetch one of the counters, and line 14 fetches the other
 of the pair and sums them.
 The atomic block consists of a single do-od statement.
-This do-od statement (spanning lines 3-12) is unusual in that
+This do-od statement (spanning lines~3-12) is unusual in that
 it contains two unconditional
 branches with guards on lines 4 and 8, which causes Promela to
 non-deterministically choose one of the two (but again, the full
@@ -1098,27 +1098,27 @@ With the \co{sum_unordered} macro in place, we can now proceed
 to the update-side process shown in
 Figure.
 The update-side process repeats indefinitely, with the corresponding
-do-od loop ranging over lines 7-57.
+do-od loop ranging over lines~7-57.
 Each pass through the loop first snapshots the global {\tt readerprogress}
-array into the local {\tt readerstart} array on lines 12-21.
+array into the local {\tt readerstart} array on lines~12-21.
 This snapshot will be used for the assertion on line 53.
-Line 23 invokes \co{sum_unordered}, and then lines 24-27
+Line 23 invokes \co{sum_unordered}, and then lines~24-27
 re-invoke \co{sum_unordered} if the fastpath is potentially
 usable.

-Lines 28-40 execute the slowpath code if need be, with
+Lines~28-40 execute the slowpath code if need be, with
 lines 30 and 38 acquiring and releasing the update-side lock,
-lines 31-33 flipping the index, and lines 34-37 waiting for
+lines~31-33 flipping the index, and lines~34-37 waiting for
 all pre-existing readers to complete.

-Lines 44-56 then compare the current values in the {\tt readerprogress}
+Lines~44-56 then compare the current values in the {\tt readerprogress}
 array to those collected in the {\tt readerstart} array,
 forcing an assertion failure should any readers that started before
 this update still be in progress.

 \QuickQuiz{}
-	Why are there atomic blocks at lines 12-21
-	and lines 44-56, when the operations within those atomic
+	Why are there atomic blocks at lines~12-21
+	and lines~44-56, when the operations within those atomic
 	blocks have no atomic implementation on any current
 	production microprocessor?
 \QuickQuizAnswer{
@@ -1130,7 +1130,7 @@ this update still be in progress.
 } \QuickQuizEnd

 \QuickQuiz{}
-	Is the re-summing of the counters on lines 24-27
+	Is the re-summing of the counters on lines~24-27
 	\emph{really} necessary?
 \QuickQuizAnswer{
 	Yes.  To see this, delete these lines and run the model.
@@ -1193,9 +1193,9 @@ this update still be in progress.

 All that remains is the initialization block shown in
 Figure~\ref{fig:analysis:QRCU Initialization Process}.
-This block simply initializes the counter pair on lines 5-6,
-spawns the reader processes on lines 7-14, and spawns the updater
-processes on lines 15-21.
+This block simply initializes the counter pair on lines~5-6,
+spawns the reader processes on lines~7-14, and spawns the updater
+processes on lines~15-21.
 This is all done within an atomic block to reduce state space.

 \subsubsection{Running the QRCU Example}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 394475d..130faaf 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -615,7 +615,7 @@ Lines~16-23 repeatedly check the value of \co{x}, printing the new value
 each time that it changes.
 Line~22 sleeps for one millisecond, which allows this demonstration
 to run nicely on a uniprocessor machine.
-Line~24-27 release the \co{pthread_mutex_t}, again checking for
+Lines~24-27 release the \co{pthread_mutex_t}, again checking for
 errors and exiting the program if any occur.
 Finally, line~28 returns \co{NULL}, again to match the function type
 required by \co{pthread_create()}.
-- 
1.9.1


