Return-Path: <SRS0=aA8C=HW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=cuJp+JH5kLsTAk8EOVP0N99pACnkber3YR060rl+aFo=;
        b=NCwyT1VvzuDwRBEUzFyI9sRJa5v8WWNKtMlQPE8dsk2vtbMeinOIxM0xHzlPO86sR1
         EzL1ylA9wVj9fkHYoBZIQp+tfziGOXY+v+mmZehxLIKaNFka/diAw9wPDrmZYguP7oDP
         dUdRmPTPlhrMA9gz/9OhqpExmRxThPEroj3gBUP5rR/OWPk3ct9P3U0WbSh7tJbjUoM3
         KK+G95rT6T29+zuXzxDBIY3SFtE5erkcTLHWgPY+iRxtQFEyzEtCvvz2i+GIzFaX3jeB
         pitCnMDBRmTYbExg7++qUWp8hQpA7SP5TNnCWazE3rckhfAtDSGTNycJL/8VVnobwjGp
         q5ag==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/3] treewide: Fix choice of \cref{}/\Cref{} macros
Message-ID: <6a73f889-005e-e8a9-c015-afeb31353b56@gmail.com>
Date: Sun, 21 Feb 2021 00:12:16 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also use some more such macros in the neighborhood.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex           | 11 +++++------
 datastruct/datastruct.tex | 12 ++++++------
 debugging/debugging.tex   |  2 +-
 defer/defer.tex           | 12 ++++++------
 defer/rcu.tex             |  2 +-
 owned/owned.tex           |  4 ++--
 together/together.tex     |  2 +-
 7 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index cfb1cd10..e4d9de1a 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -139,15 +139,14 @@ counting.
 
 \QuickQuizLabel{\QcountQIOcnt}
 
-Section~\ref{sec:count:Why Isn't Concurrent Counting Trivial?}
+\Cref{sec:count:Why Isn't Concurrent Counting Trivial?}
 shows why counting is non-trivial.
-\cref{sec:count:Statistical Counters} and
-\cref{sec:count:Approximate Limit Counters}
+\Cref{sec:count:Statistical Counters,sec:count:Approximate Limit Counters}
 investigate network-packet counting and approximate structure-allocation
 limits, respectively.
-Section~\ref{sec:count:Exact Limit Counters}
+\Cref{sec:count:Exact Limit Counters}
 takes on exact structure-allocation limits.
-Finally, Section~\ref{sec:count:Parallel Counting Discussion}
+Finally, \cref{sec:count:Parallel Counting Discussion}
 presents performance measurements and discussion.
 
 \Cref{sec:count:Why Isn't Concurrent Counting Trivial?,%
@@ -3184,7 +3183,7 @@ Summarizing the summary:
 \item	Different levels of performance and scalability will affect
 	algorithm and data-structure design, as do a large number of
 	other factors.
-	Figure~\ref{fig:count:Atomic Increment Scalability on x86}
+	\Cref{fig:count:Atomic Increment Scalability on x86}
 	illustrates this point:  Atomic increment might be completely
 	acceptable for a two-CPU system, but be completely inadequate for an
 	eight-CPU system.
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 3ec155d9..52ff3c35 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -12,21 +12,21 @@ Serious discussions of algorithms include time complexity of their
 data structures~\cite{ThomasHCorman2001Algorithms}.
 However, for parallel programs, the time complexity includes concurrency
 effects because these effects can be overwhelmingly large, as shown in
-Chapter~\ref{chp:Hardware and its Habits}.
+\cref{chp:Hardware and its Habits}.
 In other words, a good programmer's data-structure relationships
 include those aspects related to concurrency.
 
-Section~\ref{sec:datastruct:Motivating Application}
+\Cref{sec:datastruct:Motivating Application}
 presents the motivating application for this chapter's data structures.
-\cref{cha:Partitioning and Synchronization Design} showed how
+\Cref{cha:Partitioning and Synchronization Design} showed how
 partitioning improves scalability, so
 \cref{sec:datastruct:Partitionable Data Structures}
 discusses partitionable data structures.
-\cref{chp:Deferred Processing} described how deferring some
+\Cref{chp:Deferred Processing} described how deferring some
 actions can greatly improve both performance and scalability,
 a topic taken up by
 \cref{sec:datastruct:Read-Mostly Data Structures}.
-\cref{sec:datastruct:Non-Partitionable Data Structures}
+\Cref{sec:datastruct:Non-Partitionable Data Structures}
 looks at a non-partitionable data structure, splitting
 it into read-mostly and partitionable portions,
 which improves both performance and scalability.
@@ -755,7 +755,7 @@ to about half again faster than that of either QSBR or RCU.
 }\QuickQuizEnd
 
 What if the memory footprint is reduced still further?
-\cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR}
+\Cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR}
 on page~\pageref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR With Non-Initial rcu-head}
 shows that RCU attains very nearly ideal performance on the much smaller
 data structure represented by the pre-BSD routing table.
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 045e4428..9518633c 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -804,7 +804,7 @@ Although it is likely that compilers will continue to increase their
 static-analysis capabilities, the sparse static analyzer demonstrates
 the benefits of static analysis outside of the compiler, particularly
 for finding application-specific bugs.
-\crefrange{sec:formal:SAT Solvers}{sec:formal:Stateless Model Checkers}
+\Crefrange{sec:formal:SAT Solvers}{sec:formal:Stateless Model Checkers}
 describe more sophisticated forms of static analysis.
 
 \section{Code Review}
diff --git a/defer/defer.tex b/defer/defer.tex
index 020e9680..84bb1bd6 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -17,13 +17,13 @@ These performance and scalability benefits stem from the fact that
 deferring work can enable weakening of synchronization primitives,
 thereby reducing synchronization overhead.
 General approaches of work deferral include
-reference counting (Section~\ref{sec:defer:Reference Counting}),
-hazard pointers (Section~\ref{sec:defer:Hazard Pointers}),
-sequence locking (Section~\ref{sec:defer:Sequence Locks}),
-and RCU (Section~\ref{sec:defer:Read-Copy Update (RCU)}).
-Finally, Section~\ref{sec:defer:Which to Choose?}
+reference counting (\cref{sec:defer:Reference Counting}),
+hazard pointers (\cref{sec:defer:Hazard Pointers}),
+sequence locking (\cref{sec:defer:Sequence Locks}),
+and RCU (\cref{sec:defer:Read-Copy Update (RCU)}).
+Finally, \cref{sec:defer:Which to Choose?}
 describes how to choose among the work-deferral schemes covered in
-this chapter and Section~\ref{sec:defer:What About Updates?}
+this chapter and \cref{sec:defer:What About Updates?}
 discusses updates.
 But first, \cref{sec:defer:Running Example} will introduce an example
 algorithm that will be used to compare and contrast these approaches.
diff --git a/defer/rcu.tex b/defer/rcu.tex
index 774563b6..4b63e470 100644
--- a/defer/rcu.tex
+++ b/defer/rcu.tex
@@ -40,7 +40,7 @@ an API that allows readers to be associated with regions in the source code,
 rather than with expensive updates to frequently updated shared data.
 The remainder of this
 section examines RCU from a number of different perspectives.
-\cref{sec:defer:Introduction to RCU} provides the classic
+\Cref{sec:defer:Introduction to RCU} provides the classic
 introduction to RCU,
 \cref{sec:defer:RCU Fundamentals} covers fundamental RCU
 concepts,
diff --git a/owned/owned.tex b/owned/owned.tex
index 4db0e66f..4eaf7d48 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -375,8 +375,8 @@ from \co{read_count()}.
 Partial privatization is also possible, with some synchronization
 requirements, but less than in the fully shared case.
 Some partial-privatization possibilities were explored in
-Section~\ref{sec:toolsoftrade:Avoiding Data Races}.
-\cref{chp:Deferred Processing} will introduce a temporal component
+\cref{sec:toolsoftrade:Avoiding Data Races}.
+\Cref{chp:Deferred Processing} will introduce a temporal component
 to data ownership by providing ways of safely taking public data
 structures private.
 
diff --git a/together/together.tex b/together/together.tex
index 7d00ec06..c2ad53d5 100644
--- a/together/together.tex
+++ b/together/together.tex
@@ -13,7 +13,7 @@
 
 This \lcnamecref{chp:Putting It All Together}
 gives some hints on a few concurrent-programming puzzles.
-\cref{sec:together:Counter Conundrums}
+\Cref{sec:together:Counter Conundrums}
 considers some counter conundrums,
 \cref{sec:together:Refurbish Reference Counting}
 refurbishes reference counting,
-- 
2.17.1

