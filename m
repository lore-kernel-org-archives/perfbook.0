Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f41.google.com ([74.125.83.41]:38385 "EHLO
 mail-pg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751970AbdHHWMM (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 8
 Aug 2017 18:12:12 -0400
Received: by mail-pg0-f41.google.com with SMTP id l64so19972453pge.5 for
 <perfbook@vger.kernel.org>; Tue, 08 Aug 2017 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RxlFGZ8LON3VXo3mMx1lwSCcmMVXHrCwvR0DOUWIpgc=;
 b=ZHro/MJdWwS+Sq+xBmUZpetV8e2krO9iPbSu3ttSUwLmVQ3jenCBcmFF4bjqJE4X1W
 ybUqLDGy2nhIQOarhvQbuOIfqRUIZgMz6R+aT5x9CwD1gd9cPzPCcRBXm30snj8Dux59
 mM/5p70GTT/MzIEsKY2uGhVVvzSC3+zAbn1JKvHrV2KzxAa/ZEGs+xfCME6tex9DFFFq
 O5XDiD6PUzPnY8LnwUFBhinLiriYrxcphCy/3mrZsQXhB6T9NGigaVgI3NbEHTeQFITK
 T9a/YDJ0cSRAAsTwjMkZnPp5tQbgUTtmuu1lTCVTj6T0C8OV2kN3BzpZ+R4Cd6wEzdsf
 K6Kw==
Subject: [PATCH 6/6] advsync: Convert code snippets and litmus tests to
 'listing'
References: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <41aefea7-bc0b-8e91-ca24-088a49113507@gmail.com>
Date: Wed, 9 Aug 2017 07:12:08 +0900
MIME-Version: 1.0
In-Reply-To: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 3a2394edf4c62cd0a051cf251d36702c6baa2c1a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 4 Aug 2017 00:11:37 +0900
Subject: [PATCH 6/6] advsync: Convert code snippets and litmus tests to 'listing'

Also rename their labels "lst:xxx", and there reference words
"Listing".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex         | 120 ++++++++++++++++++-------------------
 appendix/styleguide/styleguide.tex |   4 +-
 2 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 3ebd3bc..3fec7ea 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -12,7 +12,7 @@ and debugging both sequential code and parallel code that makes
 use of standard mutual-exclusion mechanisms, such as locking and
 RCU.

-\begin{figure}
+\begin{listing}
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 C C-SB+o-o+o-o
@@ -42,14 +42,14 @@ exists (1:r2=0 /\ 0:r2=0)
 \centering
 \theverbbox
 \caption{Memory Misordering: Store-Buffering Litmus Test}
-\label{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
-\end{figure}
+\label{lst:advsync:Memory Misordering: Store-Buffering Litmus Test}
+\end{listing}

 Unfortunately, these intuitions break down completely in face of
 code that fails to use standard mechanisms.
 For example, the trivial-seeming litmus test in
-Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
-(\path{C-SB+o-o+o-o.litmux})
+Listing~\ref{lst:advsync:Memory Misordering: Store-Buffering Litmus Test}
+(\path{C-SB+o-o+o-o.litmus})
 appears to guarantee that the \co{exists} clause is never satisfied.
 After all, if \nbco{0:r2=0} as shown in the \co{exists} clause,\footnote{
 	That is, Thread~\co{P0()}'s instance of local variable \co{r2}
@@ -175,7 +175,7 @@ of order, which can in turn cause serious confusion, as illustrated in
 Figure~\ref{fig:advsync:CPUs Can Do Things Out of Order}.
 In particular, these store buffers can cause the memory misordering
 shown in the store-buffering litmus test in
-Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
+Listing~\ref{lst:advsync:Memory Misordering: Store-Buffering Litmus Test}.

 \begin{table*}
 \small
@@ -211,7 +211,7 @@ shows how this memory misordering can happen.
 Row~1 shows the initial state, where CPU~0 has \co{x1} in its cache
 and CPU~1 has \co{x0} in its cache, both variables having a value of zero.
 Row~2 shows the state change due to each CPU's store (lines~9 and~18 of
-Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}).
+Listing~\ref{lst:advsync:Memory Misordering: Store-Buffering Litmus Test}).
 Because neither CPU has the stored-to variable in its cache, both CPUs
 record their stores in their respective store buffers.

@@ -232,7 +232,7 @@ record their stores in their respective store buffers.
 } \QuickQuizEnd

 Row~3 shows the two reads (lines~10 and~19 of
-Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}).
+Listing~\ref{lst:advsync:Memory Misordering: Store-Buffering Litmus Test}).
 Because the variable being read by each CPU is in that CPU's cache,
 each read immediately returns the cached value, which in both cases
 is zero.
@@ -282,7 +282,7 @@ Since these standard synchronization primitives preserve the illusion of
 ordering, your path of least resistance is to simply use these primitives,
 thus allowing you to stop reading this section.

-\begin{figure}
+\begin{listing}
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 C C-SB+o-mb-o+o-mb-o
@@ -314,19 +314,19 @@ exists (1:r2=0 /\ 0:r2=0)
 \centering
 \theverbbox
 \caption{Memory Ordering: Store-Buffering Litmus Test}
-\label{fig:advsync:Memory Ordering: Store-Buffering Litmus Test}
-\end{figure}
+\label{lst:advsync:Memory Ordering: Store-Buffering Litmus Test}
+\end{listing}

 However, if you need to implement the synchronization primitives
 themselves, or if you are simply interested in understanding how memory
 ordering and memory barriers work, read on!
 The first stop is
-Figure~\ref{fig:advsync:Memory Ordering: Store-Buffering Litmus Test}
+Listing~\ref{lst:advsync:Memory Ordering: Store-Buffering Litmus Test}
 (\path{C-SB+o-mb-o+o-mb-o.litmux}),
 which the \co{smp_mb()} Linux-kernel full memory barrier placed between
 the store and load in both \co{P0()} and \co{P1()}, but is otherwise
 identical to the code shown in
-Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
+Listing~\ref{lst:advsync:Memory Misordering: Store-Buffering Litmus Test}.
 % Test C-SB+o-mb-o+o-mb-o Allowed
 % Histogram (3 states)
 % 49553298:>0:r2=2; 1:r2=0;
@@ -339,7 +339,7 @@ Interestingly enough, the overhead of these directives causes the
 legal outcome where both loads return the value two to happen more
 than 800,000 times, as opposed to only 167 times for the
 directive-free code in
-Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
+Listing~\ref{lst:advsync:Memory Misordering: Store-Buffering Litmus Test}.

 \begin{table*}
 \small
@@ -404,7 +404,7 @@ and~\ref{tab:advsync:Memory Ordering: Store-Buffering Sequence of Events},
 but either way, the purpose of this section is to drive this point home.

 To this end, consider the program fragment shown in
-Figure~\ref{fig:advsync:Software Logic Analyzer}.
+Listing~\ref{lst:advsync:Software Logic Analyzer}.
 This code fragment is executed in parallel by several CPUs.
 Line~1 sets a shared variable to the current CPU's ID, line~2
 initializes several variables from a \co{gettb()} function that
@@ -417,7 +417,7 @@ the loop if not for the check on lines~6-7.

 \QuickQuiz{}
 	What assumption is the code fragment
-	in Figure~\ref{fig:advsync:Software Logic Analyzer}
+	in Listing~\ref{lst:advsync:Software Logic Analyzer}
 	making that might not be valid on real hardware?
 \QuickQuizAnswer{
 	The code assumes that as soon as a given CPU stops
@@ -427,7 +427,7 @@ the loop if not for the check on lines~6-7.
 	intermediate results before converging on the final value.
 } \QuickQuizEnd

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 state.variable = mycpu;
@@ -443,8 +443,8 @@ the loop if not for the check on lines~6-7.
 \centering
 \theverbbox
 \caption{Software Logic Analyzer}
-\label{fig:advsync:Software Logic Analyzer}
-\end{figure}
+\label{lst:advsync:Software Logic Analyzer}
+\end{listing}

 Upon exit from the loop, \co{firsttb} will hold a timestamp
 taken shortly after the assignment and \co{lasttb} will hold
@@ -587,7 +587,7 @@ loads and stores.

 % @@@ Rationale for further reordering.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 C C-MP+o-wmb-o+o-o.litmus
@@ -620,11 +620,11 @@ exists (1:r2=2 /\ 1:r3=0)
 \centering
 \theverbbox
 \caption{Message-Passing Litmus Test}
-\label{fig:advsync:Message-Passing Litmus Test}
-\end{figure}
+\label{lst:advsync:Message-Passing Litmus Test}
+\end{listing}

 \paragraph{Load Followed By Load:}
-Figure~\ref{fig:advsync:Message-Passing Litmus Test}
+Listing~\ref{lst:advsync:Message-Passing Litmus Test}
 shows the classic \emph{message-passing} litmus test, where \co{x0} is
 the message and \co{x1} is a flag indicating whether or not a message
 is available.
@@ -634,7 +634,7 @@ Relatively strongly ordered architectures, such as x86, do enforce ordering.
 However, weakly ordered archictures do not necessarily enforce
 this~\cite{JadeAlglave2011ppcmem}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 C C-MP+o-wmb-o+o-rmb-o.litmus
@@ -667,15 +667,15 @@ exists (1:r2=2 /\ 1:r3=0)
 \centering
 \theverbbox
 \caption{Enforcing Order of Message-Passing Litmus Test}
-\label{fig:advsync:Enforcing Order of Message-Passing Litmus Test}
-\end{figure}
+\label{lst:advsync:Enforcing Order of Message-Passing Litmus Test}
+\end{listing}

 Therefore, portable code relying on ordering in this case should
 add explicit ordering, for example, the \co{smp_rmb()} shown on
 line~20 of
-Figure~\ref{fig:advsync:Enforcing Order of Message-Passing Litmus Test}.
+Listing~\ref{lst:advsync:Enforcing Order of Message-Passing Litmus Test}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 C C-LB+o-o+o-o
@@ -705,18 +705,18 @@ exists (1:r2=2 /\ 0:r2=2)
 \centering
 \theverbbox
 \caption{Load-Buffering Litmus Test}
-\label{fig:advsync:Load-Buffering Litmus Test}
-\end{figure}
+\label{lst:advsync:Load-Buffering Litmus Test}
+\end{listing}

 \paragraph{Load Followed By Store:}
-Figure~\ref{fig:advsync:Load-Buffering Litmus Test}
+Listing~\ref{lst:advsync:Load-Buffering Litmus Test}
 shows the classic \emph{load-buffering} litmus test.
 Although relatively strongly ordered systems such as x86
 or the IBM Mainframe do not reorder prior loads with subsequent stores,
 more weakly ordered architectures really do allow such
 reordering~\cite{JadeAlglave2011ppcmem}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 C C-LB+o-r+a-o.litmus
@@ -746,16 +746,16 @@ exists (1:r2=2 /\ 0:r2=2)
 \centering
 \theverbbox
 \caption{Enforcing Ordering of Load-Buffering Litmus Test}
-\label{fig:advsync:Enforcing Ordering of Load-Buffering Litmus Test}
-\end{figure}
+\label{lst:advsync:Enforcing Ordering of Load-Buffering Litmus Test}
+\end{listing}

 Interestingly enough, it is relatively rare for actual hardware to
 exhibit this reordering~\cite{LucMaranget2017aarch64}.
 Nevertheless, you should enforce any required ordering, for example,
 as shown in
-Figure~\ref{fig:advsync:Enforcing Ordering of Load-Buffering Litmus Test}.
+Listing~\ref{lst:advsync:Enforcing Ordering of Load-Buffering Litmus Test}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 C C-MP+o-o+o-rmb-o.litmus
@@ -787,11 +787,11 @@ exists (1:r2=2 /\ 1:r3=0)
 \centering
 \theverbbox
 \caption{Message-Passing Litmus Test, No Writer Ordering}
-\label{fig:advsync:Message-Passing Litmus Test, No Writer Ordering}
-\end{figure}
+\label{lst:advsync:Message-Passing Litmus Test, No Writer Ordering}
+\end{listing}

 \paragraph{Store Followed By Store:}
-Figure~\ref{fig:advsync:Message-Passing Litmus Test, No Writer Ordering}
+Listing~\ref{lst:advsync:Message-Passing Litmus Test, No Writer Ordering}
 once again shows the classic message-passing litmus test, but without
 explicit ordering for \co{P0()}'s writes and with the \co{smp_mb()}
 providing ordering for \co{P1()}'s reads.
@@ -800,7 +800,7 @@ but weakly ordered architectures do not necessarily do
 so~\cite{JadeAlglave2011ppcmem}.
 Therefore, portable code should explicitly order the writes, for
 example, as shown in
-Figure~\ref{fig:advsync:Enforcing Order of Message-Passing Litmus Test}.
+Listing~\ref{lst:advsync:Enforcing Order of Message-Passing Litmus Test}.

 \subsubsection{Address Dependencies}
 \label{sec:advsync:Address Dependencies}
@@ -809,7 +809,7 @@ An address dependency occurs when the value returned by a load instruction
 is used to compute the address used by a later memory-reference
 instruction.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 C C-MP+o-wmb-o+o-ad-o.litmus
@@ -843,10 +843,10 @@ exists (1:r2=x0 /\ 1:r3=1)
 \centering
 \theverbbox
 \caption{Message-Passing Address-Dependency Litmus Test}
-\label{fig:advsync:Message-Passing Address-Dependency Litmus Test}
-\end{figure}
+\label{lst:advsync:Message-Passing Address-Dependency Litmus Test}
+\end{listing}

-Figure~\ref{fig:advsync:Message-Passing Address-Dependency Litmus Test}
+Listing~\ref{lst:advsync:Message-Passing Address-Dependency Litmus Test}
 shows a linked variant of the message-passing pattern.
 The head pointer is \co{x1}, which initially
 references the \co{int} variable \co{y} (line~5), which is in turn 
@@ -870,7 +870,7 @@ However, this is not the case on DEC Alpha, which can in effect use
 a speculated value for the dependent read, as described in more detail in
 Section~\ref{sec:app:whymb:Alpha}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 C C-MP+o-wmb-o+ld-ad-o.litmus
@@ -904,17 +904,17 @@ exists (1:r2=x0 /\ 1:r3=1)
 \centering
 \theverbbox
 \caption{Enforced Ordering of Message-Passing Address-Dependency Litmus Test}
-\label{fig:advsync:Enforced Ordering of Message-Passing Address-Dependency Litmus Test}
-\end{figure}
+\label{lst:advsync:Enforced Ordering of Message-Passing Address-Dependency Litmus Test}
+\end{listing}

-Figure~\ref{fig:advsync:Enforced Ordering of Message-Passing Address-Dependency Litmus Test}
+Listing~\ref{lst:advsync:Enforced Ordering of Message-Passing Address-Dependency Litmus Test}
 shows how to make this work portably, even on DEC Alpha, by
 replacing line~21's \co{READ_ONCE()} with \co{lockless_dereference()},
 which acts like \co{READ_ONCE()} on all platforms other than DEC Alpha,
 where it acts like a \co{READ_ONCE()} followed by an \co{smp_mb()},
 thereby forcing the required ordering on all platforms.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 C C-S+o-wmb-o+o-ad-o.litmus
@@ -947,13 +947,13 @@ exists (1:r2=x0 /\ x0=2)
 \centering
 \theverbbox
 \caption{S Address-Dependency Litmus Test}
-\label{fig:advsync:S Address-Dependency Litmus Test}
-\end{figure}
+\label{lst:advsync:S Address-Dependency Litmus Test}
+\end{listing}

 But what happens if the dependent operation is a write rather than
 a read, for example, in the \emph{S}
 litmus test~\cite{JadeAlglave2011ppcmem} shown in
-Figure~\ref{fig:advsync:S Address-Dependency Litmus Test}?
+Listing~\ref{lst:advsync:S Address-Dependency Litmus Test}?
 Because no production-quality architecture speculated writes,
 it is not possible for the \co{WRITE_ONCE()} on line~10 to overwrite
 the \co{WRITE_ONCE()} on line~21, meaning that the \co{exists}
@@ -983,11 +983,11 @@ Section~\ref{sec:advsync:Address- and Data-Dependency Restrictions}.

 Memory ordering and memory barriers can be extremely counter-intuitive.
 For example, consider the functions shown in
-Figure~\ref{fig:advsync:Parallel Hardware is Non-Causal}
+Listing~\ref{lst:advsync:Parallel Hardware is Non-Causal}
 executing in parallel
 where variables~A, B, and~C are initially zero:

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 thread0(void)
@@ -1017,8 +1017,8 @@ where variables~A, B, and~C are initially zero:
 \centering
 \theverbbox
 \caption{Parallel Hardware is Non-Causal}
-\label{fig:advsync:Parallel Hardware is Non-Causal}
-\end{figure}
+\label{lst:advsync:Parallel Hardware is Non-Causal}
+\end{listing}

 Intuitively, \co{thread0()} assigns to~B after it assigns to~A,
 \co{thread1()} waits until \co{thread0()} has assigned to~B before
@@ -1043,8 +1043,8 @@ greatly \emph{increase} the probability of failure in this run.

 \QuickQuiz{}
 	How on earth could the assertion on line~21 of the code in
-	Figure~\ref{fig:advsync:Parallel Hardware is Non-Causal} on
-	page~\pageref{fig:advsync:Parallel Hardware is Non-Causal}
+	Listing~\ref{lst:advsync:Parallel Hardware is Non-Causal} on
+	page~\pageref{lst:advsync:Parallel Hardware is Non-Causal}
 	\emph{possibly} fail?
 \QuickQuizAnswer{
 	The key point is that the intuitive analysis missed is that
@@ -1061,8 +1061,8 @@ greatly \emph{increase} the probability of failure in this run.

 	Of course, some hardware is more forgiving than other hardware.
 	For example, on x86 the assertion on line~21 of
-	Figure~\ref{fig:advsync:Parallel Hardware is Non-Causal} on
-	page~\pageref{fig:advsync:Parallel Hardware is Non-Causal}
+	Listing~\ref{lst:advsync:Parallel Hardware is Non-Causal} on
+	page~\pageref{lst:advsync:Parallel Hardware is Non-Causal}
 	cannot trigger.
 	On PowerPC, only the \co{barrier()} on line~20 need be
 	replaced with \co{smp_mb()} to prevent the assertion from
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 3518aea..1beae5f 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -696,8 +696,8 @@ and~\ref{fig:app:styleguide:Timer Wheel at 100kHz}.
 \end{figure*}

 By using subfig package,
-Figures~\ref{fig:advsync:Message-Passing Litmus Test}
-and~\ref{fig:advsync:Enforcing Order of Message-Passing Litmus Test}
+Listings~\ref{lst:advsync:Message-Passing Litmus Test}
+and~\ref{lst:advsync:Enforcing Order of Message-Passing Litmus Test}
 can be grouped together as shown in
 Listing~\ref{lst:app:styleguide:Message-Passing Litmus Test (subfig)}
 with sub\-/captions (with a minor change of blank line).
-- 
2.7.4


