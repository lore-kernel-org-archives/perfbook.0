Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qC40UX8p8rHQSwjo26xUAKfdY+eA1SXk1wcK094lXQU=;
        b=glyToJVXg8Ju7zOn1PRAwRhL5tLDkxvu3UjaduCtZaVRgElWr3je5im7h/47tr6BDy
         1N0XQpr9nS9Ao7bklUtCi+HLaAg5mzSqxeNjayp81DoQDjMp3Cg2I1BlbD15c8Vh1DpI
         1c4bgQazoOUhDVWSfDKNuNXCgw7wRmZkTVljJ0J309Jcz3JvmVxgiL8hm/ALd4Ba86gw
         0ArNCq5BKDdjL90QHBsO5Ch817wFVB3NEzmkPIcZmyfNRDoYfd7UYT6MbMmWs6SYIryM
         KA46sHqDzf3uWHVL3Q6H0nBSn27Rt9IoyBpelS9ouEPs2+Bwe8Uh3hTYYoZZ6qeN9TEP
         0dTQ==
Subject: [PATCH 2/2] formal/spinhint: Substitute ':formal:' for ':analysis:'
 in labels
References: <5a8f5e9f-7bea-2f4a-5189-39ce378b7a12@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4b018c90-e7d4-7510-0807-4c5b14a44471@gmail.com>
Date: Thu, 14 Feb 2019 00:19:38 +0900
MIME-Version: 1.0
In-Reply-To: <5a8f5e9f-7bea-2f4a-5189-39ce378b7a12@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 44d794c92379e3a939f50cfac1acf7646b22fc16 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 13 Feb 2019 23:54:04 +0900
Subject: [PATCH 2/2] formal/spinhint: Substitute ':formal:' for ':analysis:' in labels

These historic labels have somehow survived reorganization of
chapters.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/dyntickrcu.tex |  4 ++--
 formal/spinhint.tex   | 64 +++++++++++++++++++++++++--------------------------
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 41b8bf1..5b2bfed 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -493,8 +493,8 @@ re-entering dynticks-idle mode (for example, that same task blocking).
 	it is not necessary to model memory barriers.
 	In fact, one must instead explicitly model lack of memory barriers,
 	for example, as shown in
-	Listing~\ref{lst:analysis:QRCU Unordered Summation} on
-	page~\pageref{lst:analysis:QRCU Unordered Summation}.
+	Listing~\ref{lst:formal:QRCU Unordered Summation} on
+	page~\pageref{lst:formal:QRCU Unordered Summation}.
 } \QuickQuizEnd
 
 \QuickQuiz{}
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 231d861..5a6c08c 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -64,11 +64,11 @@ more complex uses.
 \begin{listing}[tbp]
 \input{CodeSamples/formal/promela/increment@whole.fcv}
 \caption{Promela Code for Non-Atomic Increment}
-\label{lst:analysis:Promela Code for Non-Atomic Increment}
+\label{lst:formal:Promela Code for Non-Atomic Increment}
 \end{listing}
 
 \begin{lineref}[ln:formal:promela:increment:whole]
-Listing~\ref{lst:analysis:Promela Code for Non-Atomic Increment}
+Listing~\ref{lst:formal:Promela Code for Non-Atomic Increment}
 demonstrates the textbook race condition
 resulting from non-atomic increment.
 Line~\lnref{nprocs} defines the number of processes to run (we will vary this
@@ -134,11 +134,11 @@ cc -DSAFETY -o pan pan.c    # Compile the model
 \VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/increment.spin.lst}
 \vspace*{-9pt}
 \caption{Non-Atomic Increment Spin Output}
-\label{lst:analysis:Non-Atomic Increment Spin Output}
+\label{lst:formal:Non-Atomic Increment Spin Output}
 \end{listing}
 
 This will produce output as shown in
-Listing~\ref{lst:analysis:Non-Atomic Increment Spin Output}.
+Listing~\ref{lst:formal:Non-Atomic Increment Spin Output}.
 The first line tells us that our assertion was violated (as expected
 given the non-atomic increment!).
 The second line that a \co{trail} file was written describing how the
@@ -160,11 +160,11 @@ spin -t -p increment.spin
 \VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/increment.spin.trail.lst}
 \vspace*{-9pt}
 \caption{Non-Atomic Increment Error Trail}
-\label{lst:analysis:Non-Atomic Increment Error Trail}
+\label{lst:formal:Non-Atomic Increment Error Trail}
 \end{listing*}
 
 This gives the output shown in
-Listing~\ref{lst:analysis:Non-Atomic Increment Error Trail}.
+Listing~\ref{lst:formal:Non-Atomic Increment Error Trail}.
 As can be seen, the first portion of the init block created both
 incrementer processes, both of which first fetched the counter,
 then both incremented and stored it, losing a count.
@@ -176,25 +176,25 @@ The assertion then triggered, after which the global state is displayed.
 \begin{listing}[htbp]
 \input{CodeSamples/formal/promela/atomicincrement@incrementer.fcv}
 \caption{Promela Code for Atomic Increment}
-\label{lst:analysis:Promela Code for Atomic Increment}
+\label{lst:formal:Promela Code for Atomic Increment}
 \end{listing}
 
 \begin{listing}[htbp]
 \VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/atomicincrement.spin.lst}
 \vspace*{-9pt}
 \caption{Atomic Increment Spin Output}
-\label{lst:analysis:Atomic Increment Spin Output}
+\label{lst:formal:Atomic Increment Spin Output}
 \end{listing}
 
 It is easy to fix this example by placing the body of the incrementer
 processes in an atomic blocks as shown in
-Listing~\ref{lst:analysis:Promela Code for Atomic Increment}.
+Listing~\ref{lst:formal:Promela Code for Atomic Increment}.
 One could also have simply replaced the pair of statements with
 \co{counter = counter + 1}, because Promela statements are
 atomic.
 Either way, running this modified model gives us an error-free traversal
 of the state space, as shown in
-Listing~\ref{lst:analysis:Atomic Increment Spin Output}.
+Listing~\ref{lst:formal:Atomic Increment Spin Output}.
 
 \begin{table}
 \rowcolors{1}{}{lightgray}
@@ -406,14 +406,14 @@ fi
 	them under \co{atomic}.  After all, they are not part of the
 	algorithm.  One example of a complex assertion (to be discussed
 	in more detail later) is as shown in
-	Listing~\ref{lst:analysis:Complex Promela Assertion}.
+	Listing~\ref{lst:formal:Complex Promela Assertion}.
 
 	There is no reason to evaluate this assertion
 	non-atomically, since it is not actually part of the algorithm.
 	Because each statement contributes to state, we can reduce
 	the number of useless states by enclosing it in an \co{atomic}
 	block as shown in
-	Listing~\ref{lst:analysis:Atomic Block for Complex Promela Assertion}.
+	Listing~\ref{lst:formal:Atomic Block for Complex Promela Assertion}.
 
 \item	Promela does not provide functions.
 	You must instead use C preprocessor macros.
@@ -436,7 +436,7 @@ do
 od
 \end{VerbatimL}
 \caption{Complex Promela Assertion}
-\label{lst:analysis:Complex Promela Assertion}
+\label{lst:formal:Complex Promela Assertion}
 \end{listing}
 
 \begin{listing}[tbp]
@@ -456,7 +456,7 @@ atomic {
 }
 \end{VerbatimL}
 \caption{Atomic Block for Complex Promela Assertion}
-\label{lst:analysis:Atomic Block for Complex Promela Assertion}
+\label{lst:formal:Atomic Block for Complex Promela Assertion}
 \end{listing}
 
 Now we are ready for more complex examples.
@@ -467,7 +467,7 @@ Now we are ready for more complex examples.
 \begin{listing}[tbp]
 \input{CodeSamples/formal/promela/lock@whole.fcv}
 \caption{Promela Code for Spinlock}
-\label{lst:analysis:Promela Code for Spinlock}
+\label{lst:formal:Promela Code for Spinlock}
 \end{listing}
 
 \begin{lineref}[ln:formal:promela:lock:whole]
@@ -475,7 +475,7 @@ Since locks are generally useful, \co{spin_lock()} and
 \co{spin_unlock()}
 macros are provided in \path{lock.h}, which may be included from
 multiple Promela models, as shown in
-Listing~\ref{lst:analysis:Promela Code for Spinlock}.
+Listing~\ref{lst:formal:Promela Code for Spinlock}.
 The \co{spin_lock()} macro contains an infinite \co{do-od} loop
 spanning lines~\lnref{dood:b}-\lnref{dood:e},
 courtesy of the single guard expression of ``1'' on line~\lnref{one}.
@@ -509,12 +509,12 @@ weak memory ordering must be explicitly coded.
 \begin{listing}[tb]
 \input{CodeSamples/formal/promela/lock@spin.fcv}
 \caption{Promela Code to Test Spinlocks}
-\label{lst:analysis:Promela Code to Test Spinlocks}
+\label{lst:formal:Promela Code to Test Spinlocks}
 \end{listing}
 
 \begin{lineref}[ln:formal:promela:lock:spin]
 These macros are tested by the Promela code shown in
-Listing~\ref{lst:analysis:Promela Code to Test Spinlocks}.
+Listing~\ref{lst:formal:Promela Code to Test Spinlocks}.
 This code is similar to that used to test the increments,
 with the number of locking processes defined by the \co{N_LOCKERS}
 macro definition on line~\lnref{nlockers}.
@@ -542,8 +542,8 @@ line~\lnref{assert} is the assertion, and line~\lnref{break} exits the loop.
 \end{lineref}
 
 We can run this model by placing the two code fragments of
-Listings~\ref{lst:analysis:Promela Code for Spinlock}
-and~\ref{lst:analysis:Promela Code to Test Spinlocks} into
+Listings~\ref{lst:formal:Promela Code for Spinlock}
+and~\ref{lst:formal:Promela Code to Test Spinlocks} into
 files named \path{lock.h} and \path{lock.spin}, respectively, and then running
 the following commands:
 
@@ -557,11 +557,11 @@ cc -DSAFETY -o pan pan.c
 \VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/lock.spin.lst}
 \vspace*{-9pt}
 \caption{Output for Spinlock Test}
-\label{lst:analysis:Output for Spinlock Test}
+\label{lst:formal:Output for Spinlock Test}
 \end{listing}
 
 The output will look something like that shown in
-Listing~\ref{lst:analysis:Output for Spinlock Test}.
+Listing~\ref{lst:formal:Output for Spinlock Test}.
 As expected, this run has no assertion failures (``errors: 0'').
 
 \QuickQuiz{}
@@ -656,11 +656,11 @@ April 2008.
 \begin{listing}[htbp]
 \input{CodeSamples/formal/promela/qrcu@gvar.fcv}
 \caption{QRCU Global Variables}
-\label{lst:analysis:QRCU Global Variables}
+\label{lst:formal:QRCU Global Variables}
 \end{listing}
 
 Returning to the Promela code for QRCU, the global variables are as shown in
-Listing~\ref{lst:analysis:QRCU Global Variables}.
+Listing~\ref{lst:formal:QRCU Global Variables}.
 This example uses locking, hence including \path{lock.h}.
 Both the number of readers and writers can be varied using the
 two \co{#define} statements, giving us not one but two ways to create
@@ -685,12 +685,12 @@ Finally, the \co{mutex} variable is used to serialize updaters' slowpaths.
 \begin{listing}[htbp]
 \input{CodeSamples/formal/promela/qrcu@reader.fcv}
 \caption{QRCU Reader Process}
-\label{lst:analysis:QRCU Reader Process}
+\label{lst:formal:QRCU Reader Process}
 \end{listing}
 
 \begin{lineref}[ln:formal:promela:qrcu:reader]
 QRCU readers are modeled by the \co{qrcu_reader()} process shown in
-Listing~\ref{lst:analysis:QRCU Reader Process}.
+Listing~\ref{lst:formal:QRCU Reader Process}.
 A \co{do-od} loop spans lines~\lnref{do}-\lnref{od},
 with a single guard of ``1''
 on line~\lnref{one} that makes it an infinite loop.
@@ -709,12 +709,12 @@ thereby exiting the RCU read-side critical section.
 \begin{listing}[htbp]
 \input{CodeSamples/formal/promela/qrcu@sum_unordered.fcv}
 \caption{QRCU Unordered Summation}
-\label{lst:analysis:QRCU Unordered Summation}
+\label{lst:formal:QRCU Unordered Summation}
 \end{listing}
 
 \begin{lineref}[ln:formal:promela:qrcu:sum_unordered]
 The C-preprocessor macro shown in
-Listing~\ref{lst:analysis:QRCU Unordered Summation}
+Listing~\ref{lst:formal:QRCU Unordered Summation}
 sums the pair of counters so as to emulate weak memory ordering.
 Lines~\lnref{fetch:b}-\lnref{fetch:e} fetch one of the counters,
 and line~\lnref{sum_other} fetches the other
@@ -742,13 +742,13 @@ to 0 (so that line~\lnref{sum_other} will fetch the second counter).
 \begin{listing}[htbp]
 \input{CodeSamples/formal/promela/qrcu@updater.fcv}
 \caption{QRCU Updater Process}
-\label{lst:analysis:QRCU Updater Process}
+\label{lst:formal:QRCU Updater Process}
 \end{listing}
 
 \begin{lineref}[ln:formal:promela:qrcu:updater]
 With the \co{sum_unordered} macro in place, we can now proceed
 to the update-side process shown in
-Listing~\ref{lst:analysis:QRCU Updater Process}.
+Listing~\ref{lst:formal:QRCU Updater Process}.
 The update-side process repeats indefinitely, with the corresponding
 \co{do-od} loop ranging over lines~\lnref{do}-\lnref{od}.
 Each pass through the loop first snapshots the global \co{readerprogress}
@@ -823,12 +823,12 @@ this update still be in progress.
 \begin{listing}[htbp]
 \input{CodeSamples/formal/promela/qrcu@init.fcv}
 \caption{QRCU Initialization Process}
-\label{lst:analysis:QRCU Initialization Process}
+\label{lst:formal:QRCU Initialization Process}
 \end{listing}
 
 \begin{lineref}[ln:formal:promela:qrcu:init]
 All that remains is the initialization block shown in
-Listing~\ref{lst:analysis:QRCU Initialization Process}.
+Listing~\ref{lst:formal:QRCU Initialization Process}.
 This block simply initializes the counter pair on
 lines~\lnref{i_ctr:b}-\lnref{i_ctr:e},
 spawns the reader processes on
-- 
2.7.4


