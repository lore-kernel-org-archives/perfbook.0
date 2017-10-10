Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40586 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751402AbdJJXiT (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 10
 Oct 2017 19:38:19 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9ANZ328098276
 for <perfbook@vger.kernel.org>; Tue, 10 Oct 2017 19:38:19 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dh3k4bhd6-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 10 Oct 2017 19:38:18 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 10 Oct
 2017 19:38:17 -0400
Date: Tue, 10 Oct 2017 16:38:14 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Convert code snippets to 'listing' env (howto,
 toolsoftrade, count)
Reply-To: paulmck@linux.vnet.ibm.com
References: <7906367d-dc5e-2686-20d4-937fa433812a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7906367d-dc5e-2686-20d4-937fa433812a@gmail.com>
Message-Id: <20171010233814.GR3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Oct 11, 2017 at 07:40:14AM +0900, Akira Yokosawa wrote:
> >From d3f43d97fdbcbe68b6e5936b8d94c50b78bfeaaf Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 10 Oct 2017 22:18:17 +0900
> Subject: [PATCH] Convert code snippets to 'listing' env (howto, toolsoftrade, count)
> 
> Also fix a typo referring table by "Figure" in count.tex.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> Looks like we have some time to do the conversion to "listing" environments
> before the upcoming release.
> 
> This is the 1st round of the conversion.

Looks like a good time, thank you!  Queued and pushed.

							Thanx, Paul

>             Thanks, Akira
> --
>  count/count.tex               | 276 +++++++++++++++++++++---------------------
>  defer/rcuexercises.tex        |   2 +-
>  howto/howto.tex               |  20 +--
>  owned/owned.tex               |  28 ++---
>  together/applyrcu.tex         |  16 +--
>  toolsoftrade/toolsoftrade.tex | 140 ++++++++++-----------
>  6 files changed, 241 insertions(+), 241 deletions(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index a213558..9638971 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -165,7 +165,7 @@ are more appropriate for advanced students.
>  \section{Why Isn't Concurrent Counting Trivial?}
>  \label{sec:count:Why Isn't Concurrent Counting Trivial?}
> 
> -\begin{figure}[bp]
> +\begin{listing}[bp]
>  { \scriptsize
>  \begin{verbbox}
>    1 long counter = 0;
> @@ -184,12 +184,12 @@ are more appropriate for advanced students.
>  \centering
>  \theverbbox
>  \caption{Just Count!}
> -\label{fig:count:Just Count!}
> -\end{figure}
> +\label{lst:count:Just Count!}
> +\end{listing}
> 
>  Let's start with something simple, for example, the straightforward
>  use of arithmetic shown in
> -Figure~\ref{fig:count:Just Count!} (\path{count_nonatomic.c}).
> +Listing~\ref{lst:count:Just Count!} (\path{count_nonatomic.c}).
>  Here, we have a counter on line~1, we increment it on line~5, and we
>  read out its value on line~10.
>  What could be simpler?
> @@ -242,7 +242,7 @@ accuracies far greater than 50\,\% are almost always necessary.
>  	Furthermore, proofs can have bugs just as easily as programs can!
>  } \QuickQuizEnd
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 atomic_t counter = ATOMIC_INIT(0);
> @@ -261,8 +261,8 @@ accuracies far greater than 50\,\% are almost always necessary.
>  \centering
>  \theverbbox
>  \caption{Just Count Atomically!}
> -\label{fig:count:Just Count Atomically!}
> -\end{figure}
> +\label{lst:count:Just Count Atomically!}
> +\end{listing}
> 
>  \begin{figure}[tb]
>  \centering
> @@ -273,7 +273,7 @@ accuracies far greater than 50\,\% are almost always necessary.
> 
>  The straightforward way to count accurately is to use atomic operations,
>  as shown in
> -Figure~\ref{fig:count:Just Count Atomically!} (\path{count_atomic.c}).
> +Listing~\ref{lst:count:Just Count Atomically!} (\path{count_atomic.c}).
>  Line~1 defines an atomic variable, line~5 atomically increments it, and
>  line~10 reads it out.
>  Because this is atomic, it keeps perfect count.
> @@ -491,7 +491,7 @@ thread (presumably cache aligned and padded to avoid false sharing).
>  	Section~\ref{sec:count:Per-Thread-Variable-Based Implementation}.
>  } \QuickQuizEnd
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 DEFINE_PER_THREAD(long, counter);
> @@ -515,11 +515,11 @@ thread (presumably cache aligned and padded to avoid false sharing).
>  \centering
>  \theverbbox
>  \caption{Array-Based Per-Thread Statistical Counters}
> -\label{fig:count:Array-Based Per-Thread Statistical Counters}
> -\end{figure}
> +\label{lst:count:Array-Based Per-Thread Statistical Counters}
> +\end{listing}
> 
>  Such an array can be wrapped into per-thread primitives, as shown in
> -Figure~\ref{fig:count:Array-Based Per-Thread Statistical Counters}
> +Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
>  (\path{count_stat.c}).
>  Line~1 defines an array containing a set of per-thread counters of
>  type \co{long} named, creatively enough, \co{counter}.
> @@ -559,7 +559,7 @@ normal loads suffice, and no special atomic instructions are required.
> 
>  \QuickQuiz{}
>  	How does the per-thread \co{counter} variable in
> -	Figure~\ref{fig:count:Array-Based Per-Thread Statistical Counters}
> +	Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
>  	get initialized?
>  \QuickQuizAnswer{
>  	The C standard specifies that the initial value of
> @@ -573,7 +573,7 @@ normal loads suffice, and no special atomic instructions are required.
> 
>  \QuickQuiz{}
>  	How is the code in
> -	Figure~\ref{fig:count:Array-Based Per-Thread Statistical Counters}
> +	Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
>  	supposed to permit more than one counter?
>  \QuickQuizAnswer{
>  	Indeed, this toy example does not support more than one counter.
> @@ -602,7 +602,7 @@ at the beginning of this chapter.
>  	and during that time, the counter could well be changing.
>  	This means that the value returned by
>  	\co{read_count()} in
> -	Figure~\ref{fig:count:Array-Based Per-Thread Statistical Counters}
> +	Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
>  	will not necessarily be exact.
>  	Assume that the counter is being incremented at rate
>  	$r$ counts per unit time, and that \co{read_count()}'s
> @@ -743,7 +743,7 @@ date, however, once updates cease, the global counter will eventually
>  converge on the true value---hence this approach qualifies as
>  eventually consistent.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>   1 DEFINE_PER_THREAD(unsigned long, counter);
> @@ -802,11 +802,11 @@ eventually consistent.
>  \centering
>  \theverbbox
>  \caption{Array-Based Per-Thread Eventually Consistent Counters}
> -\label{fig:count:Array-Based Per-Thread Eventually Consistent Counters}
> -\end{figure}
> +\label{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
> +\end{listing}
> 
>  The implementation is shown in
> -Figure~\ref{fig:count:Array-Based Per-Thread Eventually Consistent Counters}
> +Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
>  (\path{count_stat_eventual.c}).
>  Lines~1-2 show the per-thread variable and the global variable that
>  track the counter's value, and line three shows \co{stopflag}
> @@ -814,7 +814,7 @@ which is used to coordinate termination (for the case where we want
>  to terminate the program with an accurate counter value).
>  The \co{inc_count()} function shown on lines~5-9 is similar to its
>  counterpart in
> -Figure~\ref{fig:count:Array-Based Per-Thread Statistical Counters}.
> +Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}.
>  The \co{read_count()} function shown on lines~11-14 simply returns the
>  value of the \co{global_count} variable.
> 
> @@ -834,7 +834,7 @@ comes at the cost of the additional thread running \co{eventual()}.
> 
>  \QuickQuiz{}
>  	Why doesn't \co{inc_count()} in
> -	Figure~\ref{fig:count:Array-Based Per-Thread Eventually Consistent Counters}
> +	Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
>  	need to use atomic instructions?
>  	After all, we now have multiple threads accessing the per-thread
>  	counters!
> @@ -872,7 +872,7 @@ comes at the cost of the additional thread running \co{eventual()}.
> 
>  \QuickQuiz{}
>  	Won't the single global thread in the function \co{eventual()} of
> -	Figure~\ref{fig:count:Array-Based Per-Thread Eventually Consistent Counters}
> +	Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
>  	be just as severe a bottleneck as a global lock would be?
>  \QuickQuizAnswer{
>  	In this case, no.
> @@ -883,7 +883,7 @@ comes at the cost of the additional thread running \co{eventual()}.
> 
>  \QuickQuiz{}
>  	Won't the estimate returned by \co{read_count()} in
> -	Figure~\ref{fig:count:Array-Based Per-Thread Eventually Consistent Counters}
> +	Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
>  	become increasingly
>  	inaccurate as the number of threads rises?
>  \QuickQuizAnswer{
> @@ -897,7 +897,7 @@ comes at the cost of the additional thread running \co{eventual()}.
> 
>  \QuickQuiz{}
>  	Given that in the eventually\-/consistent algorithm shown in
> -	Figure~\ref{fig:count:Array-Based Per-Thread Eventually Consistent Counters}
> +	Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
>  	both reads and updates have extremely low overhead
>  	and are extremely scalable, why would anyone bother with the
>  	implementation described in
> @@ -934,7 +934,7 @@ comes at the cost of the additional thread running \co{eventual()}.
>  \subsection{Per-Thread-Variable-Based Implementation}
>  \label{sec:count:Per-Thread-Variable-Based Implementation}
> 
> -\begin{figure}[tb]
> +\begin{listing}[tb]
>  { \scriptsize
>  \begin{verbbox}
>    1 long __thread counter = 0;
> @@ -984,13 +984,13 @@ comes at the cost of the additional thread running \co{eventual()}.
>  \centering
>  \theverbbox
>  \caption{Per-Thread Statistical Counters}
> -\label{fig:count:Per-Thread Statistical Counters}
> -\end{figure}
> +\label{lst:count:Per-Thread Statistical Counters}
> +\end{listing}
> 
>  Fortunately, \GCC\ provides an \co{__thread} storage class that provides
>  per-thread storage.
>  This can be used as shown in
> -Figure~\ref{fig:count:Per-Thread Statistical Counters} (\path{count_end.c})
> +Listing~\ref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
>  to implement
>  a statistical counter that not only scales, but that also incurs little
>  or no performance penalty to incrementers compared to simple non-atomic
> @@ -1058,7 +1058,7 @@ Finally, line~22 returns the sum.
> 
>  \QuickQuiz{}
>  	Doesn't the check for \co{NULL} on line~19 of
> -	Figure~\ref{fig:count:Per-Thread Statistical Counters}
> +	Listing~\ref{lst:count:Per-Thread Statistical Counters}
>  	add extra branch mispredictions?
>  	Why not have a variable set permanently to zero, and point
>  	unused counter-pointers to that variable rather than setting
> @@ -1074,7 +1074,7 @@ Finally, line~22 returns the sum.
>  \QuickQuiz{}
>  	Why on earth do we need something as heavyweight as a \emph{lock}
>  	guarding the summation in the function \co{read_count()} in
> -	Figure~\ref{fig:count:Per-Thread Statistical Counters}?
> +	Listing~\ref{lst:count:Per-Thread Statistical Counters}?
>  \QuickQuizAnswer{
>  	Remember, when a thread exits, its per-thread variables disappear.
>  	Therefore, if we attempt to access a given thread's per-thread
> @@ -1105,7 +1105,7 @@ array to point to its per-thread \co{counter} variable.
>  \QuickQuiz{}
>  	Why on earth do we need to acquire the lock in
>  	\co{count_register_thread()} in
> -	Figure~\ref{fig:count:Per-Thread Statistical Counters}?
> +	Listing~\ref{lst:count:Per-Thread Statistical Counters}?
>  	It is a single properly aligned machine-word store to a location
>  	that no other thread is modifying, so it should be atomic anyway,
>  	right?
> @@ -1150,7 +1150,7 @@ variables vanish when that thread exits.
>  	accessible, even if the corresponding CPU is offline---even
>  	if the corresponding CPU never existed and never will exist.
> 
> -\begin{figure}[tb]
> +\begin{listing}[tb]
>  { \scriptsize
>  \begin{verbbox}
>    1 long __thread counter = 0;
> @@ -1196,12 +1196,12 @@ variables vanish when that thread exits.
>  \centering
>  \theverbbox
>  \caption{Per-Thread Statistical Counters With Lockless Summation}
> -\label{fig:count:Per-Thread Statistical Counters With Lockless Summation}
> -\end{figure}
> +\label{lst:count:Per-Thread Statistical Counters With Lockless Summation}
> +\end{listing}
> 
>  	One workaround is to ensure that each thread continues to exist
>  	until all threads are finished, as shown in
> -	Figure~\ref{fig:count:Per-Thread Statistical Counters With Lockless Summation}
> +	Listing~\ref{lst:count:Per-Thread Statistical Counters With Lockless Summation}
>  	(\path{count_tstat.c}).
>  	Analysis of this code is left as an exercise to the reader,
>  	however, please note that it does not fit well into the
> @@ -1388,7 +1388,7 @@ Section~\ref{sec:SMPdesign:Parallel Fastpath}.
>  \subsection{Simple Limit Counter Implementation}
>  \label{sec:count:Simple Limit Counter Implementation}
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 unsigned long __thread counter = 0;
> @@ -1403,8 +1403,8 @@ Section~\ref{sec:SMPdesign:Parallel Fastpath}.
>  \centering
>  \theverbbox
>  \caption{Simple Limit Counter Variables}
> -\label{fig:count:Simple Limit Counter Variables}
> -\end{figure}
> +\label{lst:count:Simple Limit Counter Variables}
> +\end{listing}
> 
>  \begin{figure}[tb]
>  \centering
> @@ -1413,7 +1413,7 @@ Section~\ref{sec:SMPdesign:Parallel Fastpath}.
>  \label{fig:count:Simple Limit Counter Variable Relationships}
>  \end{figure}
> 
> -Figure~\ref{fig:count:Simple Limit Counter Variables}
> +Listing~\ref{lst:count:Simple Limit Counter Variables}
>  shows both the per-thread and global variables used by this
>  implementation.
>  The per-thread \co{counter} and \co{countermax} variables are the
> @@ -1443,7 +1443,7 @@ spinlock guards all of the global variables, in other words, no thread
>  is permitted to access or modify any of the global variables unless it
>  has acquired \co{gblcnt_mutex}.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 int add_count(unsigned long delta)
> @@ -1501,17 +1501,17 @@ has acquired \co{gblcnt_mutex}.
>  \centering
>  \theverbbox
>  \caption{Simple Limit Counter Add, Subtract, and Read}
> -\label{fig:count:Simple Limit Counter Add, Subtract, and Read}
> -\end{figure}
> +\label{lst:count:Simple Limit Counter Add, Subtract, and Read}
> +\end{listing}
> 
> -Figure~\ref{fig:count:Simple Limit Counter Add, Subtract, and Read}
> +Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}
>  shows the \co{add_count()}, \co{sub_count()}, and \co{read_count()}
>  functions (\path{count_lim.c}).
> 
> 
>  \QuickQuiz{}
>  	Why does
> -	Figure~\ref{fig:count:Simple Limit Counter Add, Subtract, and Read}
> +	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}
>  	provide \co{add_count()} and \co{sub_count()} instead of the
>  	\co{inc_count()} and \co{dec_count()} interfaces show in
>  	Section~\ref{sec:count:Statistical Counters}?
> @@ -1531,7 +1531,7 @@ references only per-thread variables, and should not incur any cache misses.
> 
>  \QuickQuiz{}
>  	What is with the strange form of the condition on line~3 of
> -	Figure~\ref{fig:count:Simple Limit Counter Add, Subtract, and Read}?
> +	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}?
>  	Why not the following more intuitive form of the fastpath?
> 
>  	\vspace{5pt}
> @@ -1552,7 +1552,7 @@ references only per-thread variables, and should not incur any cache misses.
>  	Try the above formulation with \co{counter} equal to 10 and
>  	\co{delta} equal to \co{ULONG_MAX}.
>  	Then try it again with the code shown in
> -	Figure~\ref{fig:count:Simple Limit Counter Add, Subtract, and Read}.
> +	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}.
> 
>  	A good understanding of integer overflow will be required for
>  	the rest of this example, so if you have never dealt with
> @@ -1566,7 +1566,7 @@ If the test on line~3 fails, we must access global variables, and thus
>  must acquire \co{gblcnt_mutex} on line~7, which we release on line~11
>  in the failure case or on line~16 in the success case.
>  Line~8 invokes \co{globalize_count()}, shown in
> -Figure~\ref{fig:count:Simple Limit Counter Utility Functions},
> +Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
>  which clears the thread-local variables, adjusting the global variables
>  as needed, thus simplifying global processing.
>  (But don't take \emph{my} word for it, try coding it yourself!)
> @@ -1581,7 +1581,7 @@ returns indicating failure.
>  Otherwise, we take the slowpath.
>  Line~14 adds \co{delta} to \co{globalcount}, and then
>  line~15 invokes \co{balance_count()} (shown in
> -Figure~\ref{fig:count:Simple Limit Counter Utility Functions})
> +Listing~\ref{lst:count:Simple Limit Counter Utility Functions})
>  in order to update both the global and the per-thread variables.
>  This call to \co{balance_count()}
>  will usually set this thread's \co{countermax} to re-enable the fastpath.
> @@ -1592,7 +1592,7 @@ line~17 returns indicating success.
>  \QuickQuiz{}
>  	Why does \co{globalize_count()} zero the per-thread variables,
>  	only to later call \co{balance_count()} to refill them in
> -	Figure~\ref{fig:count:Simple Limit Counter Add, Subtract, and Read}?
> +	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}?
>  	Why not just leave the per-thread variables non-zero?
>  \QuickQuizAnswer{
>  	That is in fact what an earlier version of this code did.
> @@ -1616,7 +1616,7 @@ Because the slowpath must access global state, line~26
>  acquires \co{gblcnt_mutex}, which is released either by line~29
>  (in case of failure) or by line~34 (in case of success).
>  Line~27 invokes \co{globalize_count()}, shown in
> -Figure~\ref{fig:count:Simple Limit Counter Utility Functions},
> +Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
>  which again clears the thread-local variables, adjusting the global variables
>  as needed.
>  Line~28 checks to see if the counter can accommodate subtracting
> @@ -1626,7 +1626,7 @@ Line~28 checks to see if the counter can accommodate subtracting
>  \QuickQuiz{}
>  	Given that \co{globalreserve} counted against us in \co{add_count()},
>  	why doesn't it count for us in \co{sub_count()} in
> -	Figure~\ref{fig:count:Simple Limit Counter Add, Subtract, and Read}?
> +	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}?
>  \QuickQuizAnswer{
>  	The \co{globalreserve} variable tracks the sum of all threads'
>  	\co{countermax} variables.
> @@ -1641,7 +1641,7 @@ Line~28 checks to see if the counter can accommodate subtracting
> 
>  \QuickQuiz{}
>  	Suppose that one thread invokes \co{add_count()} shown in
> -	Figure~\ref{fig:count:Simple Limit Counter Add, Subtract, and Read},
> +	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read},
>  	and then another thread invokes \co{sub_count()}.
>  	Won't \co{sub_count()} return failure even though the value of
>  	the counter is non-zero?
> @@ -1658,14 +1658,14 @@ If, on the other hand, line~28 finds that the counter \emph{can}
>  accommodate subtracting \co{delta}, we complete the slowpath.
>  Line~32 does the subtraction and then
>  line~33 invokes \co{balance_count()} (shown in
> -Figure~\ref{fig:count:Simple Limit Counter Utility Functions})
> +Listing~\ref{lst:count:Simple Limit Counter Utility Functions})
>  in order to update both global and per-thread variables
>  (hopefully re-enabling the fastpath).
>  Then line~34 releases \co{gblcnt_mutex}, and line~35 returns success.
> 
>  \QuickQuiz{}
>  	Why have both \co{add_count()} and \co{sub_count()} in
> -	Figure~\ref{fig:count:Simple Limit Counter Add, Subtract, and Read}?
> +	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}?
>  	Why not simply pass a negative number to \co{add_count()}?
>  \QuickQuizAnswer{
>  	Given that \co{add_count()} takes an \co{unsigned} \co{long}
> @@ -1686,7 +1686,7 @@ Line~44 initializes local variable \co{sum} to the value of
>  per-thread \co{counter} variables.
>  Line~49 then returns the sum.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 static void globalize_count(void)
> @@ -1732,13 +1732,13 @@ Line~49 then returns the sum.
>  \centering
>  \theverbbox
>  \caption{Simple Limit Counter Utility Functions}
> -\label{fig:count:Simple Limit Counter Utility Functions}
> -\end{figure}
> +\label{lst:count:Simple Limit Counter Utility Functions}
> +\end{listing}
> 
> -Figure~\ref{fig:count:Simple Limit Counter Utility Functions}
> +Listing~\ref{lst:count:Simple Limit Counter Utility Functions}
>  shows a number of utility functions used by the \co{add_count()},
>  \co{sub_count()}, and \co{read_count()} primitives shown in
> -Figure~\ref{fig:count:Simple Limit Counter Add, Subtract, and Read}.
> +Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}.
> 
>  Lines~1-7 show \co{globalize_count()}, which zeros the current thread's
>  per-thread counters, adjusting the global variables appropriately.
> @@ -1782,7 +1782,7 @@ Finally, in either case, line~18 makes the corresponding adjustment to
> 
>  \QuickQuiz{}
>  	Why set \co{counter} to \co{countermax / 2} in line~15 of
> -	Figure~\ref{fig:count:Simple Limit Counter Utility Functions}?
> +	Listing~\ref{lst:count:Simple Limit Counter Utility Functions}?
>  	Wouldn't it be simpler to just take \co{countermax} counts?
>  \QuickQuizAnswer{
>  	First, it really is reserving \co{countermax} counts
> @@ -1902,7 +1902,7 @@ This task is undertaken in the next section.
>  \subsection{Approximate Limit Counter Implementation}
>  \label{sec:count:Approximate Limit Counter Implementation}
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 unsigned long __thread counter = 0;
> @@ -1918,10 +1918,10 @@ This task is undertaken in the next section.
>  \centering
>  \theverbbox
>  \caption{Approximate Limit Counter Variables}
> -\label{fig:count:Approximate Limit Counter Variables}
> -\end{figure}
> +\label{lst:count:Approximate Limit Counter Variables}
> +\end{listing}
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 static void balance_count(void)
> @@ -1942,25 +1942,25 @@ This task is undertaken in the next section.
>  \centering
>  \theverbbox
>  \caption{Approximate Limit Counter Balancing}
> -\label{fig:count:Approximate Limit Counter Balancing}
> -\end{figure}
> +\label{lst:count:Approximate Limit Counter Balancing}
> +\end{listing}
> 
>  Because this implementation (\path{count_lim_app.c}) is quite similar to
>  that in the previous section
> -(Figures~\ref{fig:count:Simple Limit Counter Variables},
> -\ref{fig:count:Simple Limit Counter Add, Subtract, and Read}, and
> -\ref{fig:count:Simple Limit Counter Utility Functions}),
> +(Listings~\ref{lst:count:Simple Limit Counter Variables},
> +\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}, and
> +\ref{lst:count:Simple Limit Counter Utility Functions}),
>  only the changes are shown here.
> -Figure~\ref{fig:count:Approximate Limit Counter Variables}
> +Listing~\ref{lst:count:Approximate Limit Counter Variables}
>  is identical to
> -Figure~\ref{fig:count:Simple Limit Counter Variables},
> +Listing~\ref{lst:count:Simple Limit Counter Variables},
>  with the addition of \co{MAX_COUNTERMAX}, which sets the maximum
>  permissible value of the per-thread \co{countermax} variable.
> 
>  Similarly,
> -Figure~\ref{fig:count:Approximate Limit Counter Balancing}
> +Listing~\ref{lst:count:Approximate Limit Counter Balancing}
>  is identical to the \co{balance_count()} function in
> -Figure~\ref{fig:count:Simple Limit Counter Utility Functions},
> +Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
>  with the addition of lines~6 and 7, which enforce the
>  \co{MAX_COUNTERMAX} limit on the per-thread \co{countermax} variable.
> 
> @@ -2038,7 +2038,7 @@ represent \co{counter} and the low-order 16 bits to represent
>  	the reader.
>  } \QuickQuizEnd
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 atomic_t __thread ctrandmax = ATOMIC_INIT(0);
> @@ -2079,12 +2079,12 @@ represent \co{counter} and the low-order 16 bits to represent
>  \centering
>  \theverbbox
>  \caption{Atomic Limit Counter Variables and Access Functions}
> -\label{fig:count:Atomic Limit Counter Variables and Access Functions}
> -\end{figure}
> +\label{lst:count:Atomic Limit Counter Variables and Access Functions}
> +\end{listing}
> 
>  The variables and access functions for a simple atomic limit counter
>  are shown in
> -Figure~\ref{fig:count:Atomic Limit Counter Variables and Access Functions}
> +Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}
>  (\path{count_lim_atomic.c}).
>  The \co{counter} and \co{countermax} variables in earlier algorithms
>  are combined into the single variable \co{ctrandmax} shown on
> @@ -2096,7 +2096,7 @@ representation of \co{int}.
>  Lines~2-6 show the definitions for \co{globalcountmax}, \co{globalcount},
>  \co{globalreserve}, \co{counterp}, and \co{gblcnt_mutex}, all of which
>  take on roles similar to their counterparts in
> -Figure~\ref{fig:count:Approximate Limit Counter Variables}.
> +Listing~\ref{lst:count:Approximate Limit Counter Variables}.
>  Line~7 defines \co{CM_BITS}, which gives the number of bits in each half
>  of \co{ctrandmax}, and line~8 defines \co{MAX_COUNTERMAX}, which
>  gives the maximum value that may be held in either half of
> @@ -2104,7 +2104,7 @@ gives the maximum value that may be held in either half of
> 
>  \QuickQuiz{}
>  	In what way does line~7 of
> -	Figure~\ref{fig:count:Atomic Limit Counter Variables and Access Functions}
> +	Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}
>  	violate the C standard?
>  \QuickQuizAnswer{
>  	It assumes eight bits per byte.
> @@ -2134,7 +2134,7 @@ it on line~24.
>  \QuickQuiz{}
>  	Given that there is only one \co{ctrandmax} variable,
>  	why bother passing in a pointer to it on line~18 of
> -	Figure~\ref{fig:count:Atomic Limit Counter Variables and Access Functions}?
> +	Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}?
>  \QuickQuizAnswer{
>  	There is only one \co{ctrandmax} variable \emph{per thread}.
>  	Later, we will see code that needs to pass other threads'
> @@ -2149,7 +2149,7 @@ the result.
> 
>  \QuickQuiz{}
>  	Why does \co{merge_ctrandmax()} in
> -	Figure~\ref{fig:count:Atomic Limit Counter Variables and Access Functions}
> +	Listing~\ref{lst:count:Atomic Limit Counter Variables and Access Functions}
>  	return an \co{int} rather than storing directly into an
>  	\co{atomic_t}?
>  \QuickQuizAnswer{
> @@ -2157,7 +2157,7 @@ the result.
>  	to the \co{atomic_cmpxchg()} primitive.
>  } \QuickQuizEnd
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 int add_count(unsigned long delta)
> @@ -2228,10 +2228,10 @@ the result.
>  \centering
>  \theverbbox
>  \caption{Atomic Limit Counter Add and Subtract}
> -\label{fig:count:Atomic Limit Counter Add and Subtract}
> -\end{figure}
> +\label{lst:count:Atomic Limit Counter Add and Subtract}
> +\end{listing}
> 
> -Figure~\ref{fig:count:Atomic Limit Counter Add and Subtract}
> +Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
>  shows the \co{add_count()} and \co{sub_count()} functions.
> 
>  Lines~1-32 show \co{add_count()}, whose fastpath spans lines~8-15,
> @@ -2256,7 +2256,7 @@ execution continues in the loop at line~9.
>  \QuickQuiz{}
>  	Yecch!
>  	Why the ugly \co{goto} on line~11 of
> -	Figure~\ref{fig:count:Atomic Limit Counter Add and Subtract}?
> +	Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}?
>  	Haven't you heard of the \co{break} statement???
>  \QuickQuizAnswer{
>  	Replacing the \co{goto} with a \co{break} would require keeping
> @@ -2271,20 +2271,20 @@ execution continues in the loop at line~9.
> 
>  \QuickQuiz{}
>  	Why would the \co{atomic_cmpxchg()} primitive at lines~13-14 of
> -	Figure~\ref{fig:count:Atomic Limit Counter Add and Subtract}
> +	Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
>  	ever fail?
>  	After all, we picked up its old value on line~9 and have not
>  	changed it!
>  \QuickQuizAnswer{
>  	Later, we will see how the \co{flush_local_count()} function in
> -	Figure~\ref{fig:count:Atomic Limit Counter Utility Functions 1}
> +	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1}
>  	might update this thread's \co{ctrandmax} variable concurrently
>  	with the execution of the fastpath on lines~8-14 of
> -	Figure~\ref{fig:count:Atomic Limit Counter Add and Subtract}.
> +	Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}.
>  } \QuickQuizEnd
> 
>  Lines~16-31 of
> -Figure~\ref{fig:count:Atomic Limit Counter Add and Subtract}
> +Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
>  show \co{add_count()}'s slowpath, which is protected by \co{gblcnt_mutex},
>  which is acquired on line~17 and released on lines~24 and 30.
>  Line~18 invokes \co{globalize_count()}, which moves this thread's
> @@ -2304,14 +2304,14 @@ spreads counts to the local state if appropriate, line~30 releases
>  returns success.
> 
>  Lines~34-63 of
> -Figure~\ref{fig:count:Atomic Limit Counter Add and Subtract}
> +Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
>  show \co{sub_count()}, which is structured similarly to
>  \co{add_count()}, having a fastpath on lines~41-48 and a slowpath on
>  lines~49-62.
>  A line-by-line analysis of this function is left as an exercise to
>  the reader.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 unsigned long read_count(void)
> @@ -2337,10 +2337,10 @@ the reader.
>  \centering
>  \theverbbox
>  \caption{Atomic Limit Counter Read}
> -\label{fig:count:Atomic Limit Counter Read}
> -\end{figure}
> +\label{lst:count:Atomic Limit Counter Read}
> +\end{listing}
> 
> -Figure~\ref{fig:count:Atomic Limit Counter Read} shows \co{read_count()}.
> +Listing~\ref{lst:count:Atomic Limit Counter Read} shows \co{read_count()}.
>  Line~9 acquires \co{gblcnt_mutex} and line~16 releases it.
>  Line~10 initializes local variable \co{sum} to the value of
>  \co{globalcount}, and the loop spanning lines~11-15 adds the
> @@ -2348,7 +2348,7 @@ per-thread counters to this sum, isolating each per-thread counter
>  using \co{split_ctrandmax} on line~13.
>  Finally, line~17 returns the sum.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 static void globalize_count(void)
> @@ -2388,10 +2388,10 @@ Finally, line~17 returns the sum.
>  \centering
>  \theverbbox
>  \caption{Atomic Limit Counter Utility Functions 1}
> -\label{fig:count:Atomic Limit Counter Utility Functions 1}
> -\end{figure}
> +\label{lst:count:Atomic Limit Counter Utility Functions 1}
> +\end{listing}
> 
> -\begin{figure}[tb]
> +\begin{listing}[tb]
>  { \scriptsize
>  \begin{verbbox}
>    1 static void balance_count(void)
> @@ -2440,11 +2440,11 @@ Finally, line~17 returns the sum.
>  \centering
>  \theverbbox
>  \caption{Atomic Limit Counter Utility Functions 2}
> -\label{fig:count:Atomic Limit Counter Utility Functions 2}
> -\end{figure}
> +\label{lst:count:Atomic Limit Counter Utility Functions 2}
> +\end{listing}
> 
> -Figures~\ref{fig:count:Atomic Limit Counter Utility Functions 1}
> -and~\ref{fig:count:Atomic Limit Counter Utility Functions 2}
> +Listings~\ref{lst:count:Atomic Limit Counter Utility Functions 1}
> +and~\ref{lst:count:Atomic Limit Counter Utility Functions 2}
>  shows the utility functions
>  \co{globalize_count()},
>  \co{flush_local_count()},
> @@ -2452,7 +2452,7 @@ shows the utility functions
>  \co{count_register_thread()}, and
>  \co{count_unregister_thread()}.
>  The code for \co{globalize_count()} is shown on lines~1-12,
> -of Figure~\ref{fig:count:Atomic Limit Counter Utility Functions 1} and
> +of Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1} and
>  is similar to that of previous algorithms, with the addition of
>  line~7, which is now required to split out \co{counter} and
>  \co{countermax} from \co{ctrandmax}.
> @@ -2477,7 +2477,7 @@ line~30 subtracts this thread's \co{countermax} from \co{globalreserve}.
>  	What stops a thread from simply refilling its
>  	\co{ctrandmax} variable immediately after
>  	\co{flush_local_count()} on line~14 of
> -	Figure~\ref{fig:count:Atomic Limit Counter Utility Functions 1}
> +	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1}
>  	empties it?
>  \QuickQuizAnswer{
>  	This other thread cannot refill its \co{ctrandmax}
> @@ -2494,7 +2494,7 @@ line~30 subtracts this thread's \co{countermax} from \co{globalreserve}.
>  	\co{add_count()} or \co{sub_count()} from interfering with
>  	the \co{ctrandmax} variable while
>  	\co{flush_local_count()} is accessing it on line~27 of
> -	Figure~\ref{fig:count:Atomic Limit Counter Utility Functions 1}
> +	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1}
>  	empties it?
>  \QuickQuizAnswer{
>  	Nothing.
> @@ -2520,7 +2520,7 @@ line~30 subtracts this thread's \co{countermax} from \co{globalreserve}.
>  } \QuickQuizEnd
> 
>  Lines~1-22 on
> -Figure~\ref{fig:count:Atomic Limit Counter Utility Functions 2}
> +Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 2}
>  show the code for \co{balance_count()}, which refills
>  the calling thread's local \co{ctrandmax} variable.
>  This function is quite similar to that of the preceding algorithms,
> @@ -2534,7 +2534,7 @@ line~33.
>  	Given that the \co{atomic_set()} primitive does a simple
>  	store to the specified \co{atomic_t}, how can line~21 of
>  	\co{balance_count()} in
> -	Figure~\ref{fig:count:Atomic Limit Counter Utility Functions 2}
> +	Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 2}
>  	work correctly in face of concurrent \co{flush_local_count()}
>  	updates to this variable?
>  \QuickQuizAnswer{
> @@ -2668,7 +2668,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
>  \subsection{Signal-Theft Limit Counter Implementation}
>  \label{sec:count:Signal-Theft Limit Counter Implementation}
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 #define THEFT_IDLE  0
> @@ -2693,10 +2693,10 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
>  \centering
>  \theverbbox
>  \caption{Signal-Theft Limit Counter Data}
> -\label{fig:count:Signal-Theft Limit Counter Data}
> -\end{figure}
> +\label{lst:count:Signal-Theft Limit Counter Data}
> +\end{listing}
> 
> -Figure~\ref{fig:count:Signal-Theft Limit Counter Data}
> +Listing~\ref{lst:count:Signal-Theft Limit Counter Data}
>  (\path{count_lim_sig.c})
>  shows the data structures used by the signal-theft based counter
>  implementation.
> @@ -2706,7 +2706,7 @@ Lines~8-17 are similar to earlier implementations, with the addition of
>  lines~14 and 15 to allow remote access to a thread's \co{countermax}
>  and \co{theft} variables, respectively.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 static void globalize_count(void)
> @@ -2777,10 +2777,10 @@ and \co{theft} variables, respectively.
>  \centering
>  \theverbbox
>  \caption{Signal-Theft Limit Counter Value-Migration Functions}
> -\label{fig:count:Signal-Theft Limit Counter Value-Migration Functions}
> -\end{figure}
> +\label{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
> +\end{listing}
> 
> -Figure~\ref{fig:count:Signal-Theft Limit Counter Value-Migration Functions}
> +Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
>  shows the functions responsible for migrating counts between per-thread
>  variables and the global variables.
>  Lines~1-7 shows \co{globalize_count()}, which is identical to earlier
> @@ -2796,7 +2796,7 @@ this thread's fastpaths are not running, line~16 sets the \co{theft}
>  state to READY.
> 
>  \QuickQuiz{}
> -	In Figure~\ref{fig:count:Signal-Theft Limit Counter Value-Migration Functions}
> +	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
>  	function \co{flush_local_count_sig()}, why are there
>  	\co{ACCESS_ONCE()} wrappers around the uses of the
>  	\co{theft} per-thread variable?
> @@ -2835,7 +2835,7 @@ Otherwise, line~32 sets the thread's \co{theft} state to REQ and
>  line~33 sends the thread a signal.
> 
>  \QuickQuiz{}
> -	In Figure~\ref{fig:count:Signal-Theft Limit Counter Value-Migration Functions},
> +	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
>  	why is it safe for line~28 to directly access the other thread's
>  	\co{countermax} variable?
>  \QuickQuizAnswer{
> @@ -2849,7 +2849,7 @@ line~33 sends the thread a signal.
>  } \QuickQuizEnd
> 
>  \QuickQuiz{}
> -	In Figure~\ref{fig:count:Signal-Theft Limit Counter Value-Migration Functions},
> +	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
>  	why doesn't line~33 check for the current thread sending itself
>  	a signal?
>  \QuickQuizAnswer{
> @@ -2861,7 +2861,7 @@ line~33 sends the thread a signal.
> 
>  \QuickQuiz{}
>  	The code in
> -	Figure~\ref{fig:count:Signal-Theft Limit Counter Value-Migration Functions},
> +	Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
>  	works with \GCC\ and POSIX.
>  	What would be required to make it also conform to the ISO C standard?
>  \QuickQuizAnswer{
> @@ -2882,7 +2882,7 @@ READY, so lines~43-46 do the thieving.
>  Line~47 then sets the thread's \co{theft} state back to IDLE.
> 
>  \QuickQuiz{}
> -	In Figure~\ref{fig:count:Signal-Theft Limit Counter Value-Migration Functions}, why does line~41 resend the signal?
> +	In Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}, why does line~41 resend the signal?
>  \QuickQuizAnswer{
>  	Because many operating systems over several decades have
>  	had the property of losing the occasional signal.
> @@ -2897,7 +2897,7 @@ Line~47 then sets the thread's \co{theft} state back to IDLE.
>  Lines~51-63 show \co{balance_count()}, which is similar to that of
>  earlier examples.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 int add_count(unsigned long delta)
> @@ -2941,10 +2941,10 @@ earlier examples.
>  \centering
>  \theverbbox
>  \caption{Signal-Theft Limit Counter Add Function}
> -\label{fig:count:Signal-Theft Limit Counter Add Function}
> -\end{figure}
> +\label{lst:count:Signal-Theft Limit Counter Add Function}
> +\end{listing}
> 
> -\begin{figure}[tb]
> +\begin{listing}[tb]
>  { \scriptsize
>  \begin{verbbox}
>   38 int sub_count(unsigned long delta)
> @@ -2986,10 +2986,10 @@ earlier examples.
>  \centering
>  \theverbbox
>  \caption{Signal-Theft Limit Counter Subtract Function}
> -\label{fig:count:Signal-Theft Limit Counter Subtract Function}
> -\end{figure}
> +\label{lst:count:Signal-Theft Limit Counter Subtract Function}
> +\end{listing}
> 
> -Figure~\ref{fig:count:Signal-Theft Limit Counter Add Function}
> +Listing~\ref{lst:count:Signal-Theft Limit Counter Add Function}
>  shows the \co{add_count()} function.
>  The fastpath spans lines~5-20, and the slowpath lines~21-35.
>  Line~5 sets the per-thread \co{counting} variable to 1 so that
> @@ -3014,7 +3014,7 @@ READY also sees the effects of line~9.
>  If the fastpath addition at line~9 was executed, then line~20 returns
>  success.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 unsigned long read_count(void)
> @@ -3035,21 +3035,21 @@ success.
>  \centering
>  \theverbbox
>  \caption{Signal-Theft Limit Counter Read Function}
> -\label{fig:count:Signal-Theft Limit Counter Read Function}
> -\end{figure}
> +\label{lst:count:Signal-Theft Limit Counter Read Function}
> +\end{listing}
> 
>  Otherwise, we fall through to the slowpath starting at line~21.
>  The structure of the slowpath is similar to those of earlier examples,
>  so its analysis is left as an exercise to the reader.
>  Similarly, the structure of \co{sub_count()} on
> -Figure~\ref{fig:count:Signal-Theft Limit Counter Subtract Function}
> +Listing~\ref{lst:count:Signal-Theft Limit Counter Subtract Function}
>  is the same
>  as that of \co{add_count()}, so the analysis of \co{sub_count()} is also
>  left as an exercise for the reader, as is the analysis of
>  \co{read_count()} in
> -Figure~\ref{fig:count:Signal-Theft Limit Counter Read Function}.
> +Listing~\ref{lst:count:Signal-Theft Limit Counter Read Function}.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 void count_init(void)
> @@ -3092,11 +3092,11 @@ Figure~\ref{fig:count:Signal-Theft Limit Counter Read Function}.
>  \centering
>  \theverbbox
>  \caption{Signal-Theft Limit Counter Initialization Functions}
> -\label{fig:count:Signal-Theft Limit Counter Initialization Functions}
> -\end{figure}
> +\label{lst:count:Signal-Theft Limit Counter Initialization Functions}
> +\end{listing}
> 
>  Lines~1-12 of
> -Figure~\ref{fig:count:Signal-Theft Limit Counter Initialization Functions}
> +Listing~\ref{lst:count:Signal-Theft Limit Counter Initialization Functions}
>  show \co{count_init()}, which set up \co{flush_local_count_sig()}
>  as the signal handler for \co{SIGUSR1},
>  enabling the \co{pthread_kill()} calls in \co{flush_local_count()}
> @@ -3414,7 +3414,7 @@ courtesy of eventual consistency.
>  \label{tab:count:Limit Counter Performance on Power-6}
>  \end{table*}
> 
> -Figure~\ref{tab:count:Limit Counter Performance on Power-6}
> +Table~\ref{tab:count:Limit Counter Performance on Power-6}
>  shows the performance of the parallel limit-counting algorithms.
>  Exact enforcement of the limits incurs a substantial performance
>  penalty, although on this 4.7\,GHz \Power{6} system that penalty can be reduced
> diff --git a/defer/rcuexercises.tex b/defer/rcuexercises.tex
> index 1d9e138..21d9683 100644
> --- a/defer/rcuexercises.tex
> +++ b/defer/rcuexercises.tex
> @@ -14,7 +14,7 @@ suffice for most of these exercises.
> 
>  \QuickQuiz{}
>  	The statistical-counter implementation shown in
> -	Figure~\ref{fig:count:Per-Thread Statistical Counters}
> +	Listing~\ref{lst:count:Per-Thread Statistical Counters}
>  	(\path{count_end.c})
>  	used a global lock to guard the summation in \co{read_count()},
>  	which resulted in poor performance and negative scalability.
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 90abb14..1a0b75c 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -361,7 +361,7 @@ Other types of systems have well-known ways of locating files by filename.
>  \section{Whose Book Is This?}
>  \label{sec:howto:Whose Book Is This?}
> 
> -\begin{figure*}[tbp]
> +\begin{listing*}[tbp]
>  {
>  \scriptsize
>  \begin{verbbox}
> @@ -376,10 +376,10 @@ Other types of systems have well-known ways of locating files by filename.
>  }
>  \hspace*{1in}\OneColumnHSpace{-0.5in}\theverbbox
>  \caption{Creating an Up-To-Date PDF}
> -\label{fig:howto:Creating a Up-To-Date PDF}
> -\end{figure*}
> +\label{lst:howto:Creating a Up-To-Date PDF}
> +\end{listing*}
> 
> -\begin{figure*}[tbp]
> +\begin{listing*}[tbp]
>  {
>  \scriptsize
>  \begin{verbbox}
> @@ -393,8 +393,8 @@ Other types of systems have well-known ways of locating files by filename.
>  }
>  \hspace*{1in}\OneColumnHSpace{-0.5in}\theverbbox
>  \caption{Generating an Updated PDF}
> -\label{fig:howto:Generating an Updated PDF}
> -\end{figure*}
> +\label{lst:howto:Generating an Updated PDF}
> +\end{listing*}
> 
>  As the cover says, the editor is one Paul E.~McKenney.
>  However, the editor does accept contributions via the
> @@ -416,18 +416,18 @@ in the file \path{FAQ-BUILD.txt} in the \LaTeX{} source to the book.
> 
>  To create and display a current \LaTeX{} source tree of this book,
>  use the list of Linux commands shown in
> -Figure~\ref{fig:howto:Creating a Up-To-Date PDF}.
> +Listing~\ref{lst:howto:Creating a Up-To-Date PDF}.
>  In some environments, the \co{evince} command that displays \path{perfbook.pdf}
>  may need to be replaced, for example, with \co{acroread}.
>  The \co{git clone} command need only be used the first time you
>  create a PDF, subsequently, you can run the commands shown in
> -Figure~\ref{fig:howto:Generating an Updated PDF} to pull in any updates
> +Listing~\ref{lst:howto:Generating an Updated PDF} to pull in any updates
>  and generate an updated PDF.
>  The commands in
> -Figure~\ref{fig:howto:Generating an Updated PDF}
> +Listing~\ref{lst:howto:Generating an Updated PDF}
>  must be run within the \path{perfbook} directory created by the commands
>  shown in
> -Figure~\ref{fig:howto:Creating a Up-To-Date PDF}.
> +Listing~\ref{lst:howto:Creating a Up-To-Date PDF}.
> 
>  PDFs of this book are sporadically posted at
>  \url{http://kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html}
> diff --git a/owned/owned.tex b/owned/owned.tex
> index f74b5d6..d584e82 100644
> --- a/owned/owned.tex
> +++ b/owned/owned.tex
> @@ -132,8 +132,8 @@ is obviously quite attractive.
>  } \QuickQuizEnd
> 
>  This same pattern can be written in C as well as in \co{sh}, as illustrated by
> -Figures~\ref{fig:toolsoftrade:Using the fork() Primitive}
> -and~\ref{fig:toolsoftrade:Using the wait() Primitive}.
> +Listings~\ref{lst:toolsoftrade:Using the fork() Primitive}
> +and~\ref{lst:toolsoftrade:Using the wait() Primitive}.
> 
>  The next section discusses use of data ownership in shared-memory
>  parallel programs.
> @@ -150,8 +150,8 @@ of ownership and access rights.
> 
>  For example, consider the per-thread statistical counter implementation
>  shown in
> -Figure~\ref{fig:count:Per-Thread Statistical Counters} on
> -page~\pageref{fig:count:Per-Thread Statistical Counters}.
> +Listing~\ref{lst:count:Per-Thread Statistical Counters} on
> +page~\pageref{lst:count:Per-Thread Statistical Counters}.
>  Here, \co{inc_count()} updates only the corresponding thread's
>  instance of \co{counter},
>  while \co{read_count()} accesses, but does not modify, all
> @@ -195,9 +195,9 @@ beginning on
>  page~\pageref{sec:count:Signal-Theft Limit Counter Design},
>  in particular the \co{flush_local_count_sig()} and
>  \co{flush_local_count()} functions in
> -Figure~\ref{fig:count:Signal-Theft Limit Counter Value-Migration Functions}
> +Listing~\ref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
>  on
> -page~\pageref{fig:count:Signal-Theft Limit Counter Value-Migration Functions}.
> +page~\pageref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}.
> 
>  The \co{flush_local_count_sig()} function is a signal handler that
>  acts as the shipped function.
> @@ -207,12 +207,12 @@ the shipped function executes.
>  This shipped function has the not-unusual added complication of
>  needing to interact with any concurrently executing \co{add_count()}
>  or \co{sub_count()} functions (see
> -Figure~\ref{fig:count:Signal-Theft Limit Counter Add Function}
> +Listing~\ref{lst:count:Signal-Theft Limit Counter Add Function}
>  on
> -page~\pageref{fig:count:Signal-Theft Limit Counter Add Function} and
> -Figure~\ref{fig:count:Signal-Theft Limit Counter Subtract Function}
> +page~\pageref{lst:count:Signal-Theft Limit Counter Add Function} and
> +Listing~\ref{lst:count:Signal-Theft Limit Counter Subtract Function}
>  on
> -page~\pageref{fig:count:Signal-Theft Limit Counter Subtract Function}).
> +page~\pageref{lst:count:Signal-Theft Limit Counter Subtract Function}).
> 
>  \QuickQuiz{}
>  	What mechanisms other than POSIX signals may be used for function
> @@ -246,7 +246,7 @@ The eventually consistent counter implementation described in
>  Section~\ref{sec:count:Eventually Consistent Implementation} provides an example.
>  This implementation has a designated thread that runs the
>  \co{eventual()} function shown on lines~15-32 of
> -Figure~\ref{fig:count:Array-Based Per-Thread Eventually Consistent Counters}.
> +Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}.
>  This \co{eventual()} thread periodically pulls the per-thread counts
>  into the global counter, so that accesses to the global counter will,
>  as the name says, eventually converge on the actual value.
> @@ -254,7 +254,7 @@ as the name says, eventually converge on the actual value.
>  \QuickQuiz{}
>  	But none of the data in the \co{eventual()} function shown on
>  	lines~15-32 of
> -	Figure~\ref{fig:count:Array-Based Per-Thread Eventually Consistent Counters}
> +	Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
>  	is actually owned by the \co{eventual()} thread!
>  	In just what way is this data ownership???
>  \QuickQuizAnswer{
> @@ -298,8 +298,8 @@ a considerable reduction in the spread of certain types of disease.
> 
>  In other cases, privatization imposes costs.
>  For example, consider the simple limit counter shown in
> -Figure~\ref{fig:count:Simple Limit Counter Add, Subtract, and Read} on
> -page~\pageref{fig:count:Simple Limit Counter Add, Subtract, and Read}.
> +Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read} on
> +page~\pageref{lst:count:Simple Limit Counter Add, Subtract, and Read}.
>  This is an example of an algorithm where threads can read each others'
>  data, but are only permitted to update their own data.
>  A quick review of the algorithm shows that the only cross-thread
> diff --git a/together/applyrcu.tex b/together/applyrcu.tex
> index e3d6f0d..d477ab5 100644
> --- a/together/applyrcu.tex
> +++ b/together/applyrcu.tex
> @@ -21,8 +21,8 @@ Unfortunately, threads needing to read out the value via \co{read_count()}
>  were required to acquire a global
>  lock, and thus incurred high overhead and suffered poor scalability.
>  The code for the lock-based implementation is shown in
> -Figure~\ref{fig:count:Per-Thread Statistical Counters} on
> -Page~\pageref{fig:count:Per-Thread Statistical Counters}.
> +Listing~\ref{lst:count:Per-Thread Statistical Counters} on
> +Page~\pageref{lst:count:Per-Thread Statistical Counters}.
> 
>  \QuickQuiz{}
>  	Why on earth did we need that global lock in the first place?
> @@ -56,8 +56,8 @@ execution.
>  	Just what is the accuracy of \co{read_count()}, anyway?
>  \QuickQuizAnswer{
>  	Refer to
> -	Figure~\ref{fig:count:Per-Thread Statistical Counters} on
> -	Page~\pageref{fig:count:Per-Thread Statistical Counters}.
> +	Listing~\ref{lst:count:Per-Thread Statistical Counters} on
> +	Page~\pageref{lst:count:Per-Thread Statistical Counters}.
>  	Clearly, if there are no concurrent invocations of \co{inc_count()},
>  	\co{read_count()} will return an exact result.
>  	However, if there \emph{are} concurrent invocations of
> @@ -205,7 +205,7 @@ the current \co{countarray} structure, and
>  the \co{final_mutex} spinlock.
> 
>  Lines~10-13 show \co{inc_count()}, which is unchanged from
> -Figure~\ref{fig:count:Per-Thread Statistical Counters}.
> +Listing~\ref{lst:count:Per-Thread Statistical Counters}.
> 
>  Lines~15-29 show \co{read_count()}, which has changed significantly.
>  Lines~21 and~27 substitute \co{rcu_read_lock()} and
> @@ -280,13 +280,13 @@ Line~69 can then safely free the old \co{countarray} structure.
>  	Wow!
>  	Figure~\ref{fig:together:RCU and Per-Thread Statistical Counters}
>  	contains 69 lines of code, compared to only 42 in
> -	Figure~\ref{fig:count:Per-Thread Statistical Counters}.
> +	Listing~\ref{lst:count:Per-Thread Statistical Counters}.
>  	Is this extra complexity really worth it?
>  \QuickQuizAnswer{
>  	This of course needs to be decided on a case-by-case basis.
>  	If you need an implementation of \co{read_count()} that
>  	scales linearly, then the lock-based implementation shown in
> -	Figure~\ref{fig:count:Per-Thread Statistical Counters}
> +	Listing~\ref{lst:count:Per-Thread Statistical Counters}
>  	simply will not work for you.
>  	On the other hand, if calls to \co{count_read()} are sufficiently
>  	rare, then the lock-based version is simpler and might thus be
> @@ -300,7 +300,7 @@ Line~69 can then safely free the old \co{countarray} structure.
>  	and the use of RCU unnecessary.
>  	This would in turn enable an implementation that
>  	was even simpler than the one shown in
> -	Figure~\ref{fig:count:Per-Thread Statistical Counters}, but
> +	Listing~\ref{lst:count:Per-Thread Statistical Counters}, but
>  	with all the scalability and performance benefits of the
>  	implementation shown in
>  	Figure~\ref{fig:together:RCU and Per-Thread Statistical Counters}!
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index bd43879..b18d3d0 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -189,7 +189,7 @@ These concerns can of course add substantial complexity to the code.
>  For more information, see any of a number of textbooks on the
>  subject~\cite{WRichardStevens1992,StewartWeiss2013UNIX}.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 pid = fork();
> @@ -207,14 +207,14 @@ subject~\cite{WRichardStevens1992,StewartWeiss2013UNIX}.
>  \centering
>  \theverbbox
>  \caption{Using the \tco{fork()} Primitive}
> -\label{fig:toolsoftrade:Using the fork() Primitive}
> -\end{figure}
> +\label{lst:toolsoftrade:Using the fork() Primitive}
> +\end{listing}
> 
>  If \co{fork()} succeeds, it returns twice, once for the parent
>  and again for the child.
>  The value returned from \co{fork()} allows the caller to tell
>  the difference, as shown in
> -Figure~\ref{fig:toolsoftrade:Using the fork() Primitive}
> +Listing~\ref{lst:toolsoftrade:Using the fork() Primitive}
>  (\path{forkjoin.c}).
>  Line~1 executes the \co{fork()} primitive, and saves its return value
>  in local variable \co{pid}.
> @@ -228,7 +228,7 @@ Otherwise, the \co{fork()} has executed successfully, and the parent
>  therefore executes line~9 with the variable \co{pid} containing the
>  process ID of the child.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 void waitall(void)
> @@ -251,8 +251,8 @@ process ID of the child.
>  \centering
>  \theverbbox
>  \caption{Using the \tco{wait()} Primitive}
> -\label{fig:toolsoftrade:Using the wait() Primitive}
> -\end{figure}
> +\label{lst:toolsoftrade:Using the wait() Primitive}
> +\end{listing}
> 
>  The parent process may use the \co{wait()} primitive to wait for its children
>  to complete.
> @@ -261,7 +261,7 @@ counterpart, as each invocation of \co{wait()} waits for but one child
>  process.
>  It is therefore customary to wrap \co{wait()} into a function similar
>  to the \co{waitall()} function shown in
> -Figure~\ref{fig:toolsoftrade:Using the wait() Primitive}
> +Listing~\ref{lst:toolsoftrade:Using the wait() Primitive}
>  (\path{api-pthread.h}),
>  with this \co{waitall()} function having semantics similar to the
>  shell-script \co{wait} command.
> @@ -283,14 +283,14 @@ Otherwise, lines~11 and 12 print an error and exit.
>  	child individually.
>  	In addition, some parallel applications need to detect the
>  	reason that the child died.
> -	As we saw in Figure~\ref{fig:toolsoftrade:Using the wait() Primitive},
> +	As we saw in Listing~\ref{lst:toolsoftrade:Using the wait() Primitive},
>  	it is not hard to build a \co{waitall()} function out of
>  	the \co{wait()} function, but it would be impossible to
>  	do the reverse.
>  	Once the information about a specific child is lost, it is lost.
>  } \QuickQuizEnd
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 int x = 0;
> @@ -313,13 +313,13 @@ Otherwise, lines~11 and 12 print an error and exit.
>  \centering
>  \theverbbox
>  \caption{Processes Created Via \tco{fork()} Do Not Share Memory}
> -\label{fig:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
> -\end{figure}
> +\label{lst:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
> +\end{listing}
> 
>  It is critically important to note that the parent and child do \emph{not}
>  share memory.
>  This is illustrated by the program shown in
> -Figure~\ref{fig:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
> +Listing~\ref{lst:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
>  (\path{forkjoinvar.c}),
>  in which the child sets a global variable \co{x} to 1 on line~6,
>  prints a message on line~7, and exits on line~8.
> @@ -353,7 +353,7 @@ Parent process sees x=0
>  	source code of the Linux-kernel implementations themselves.
> 
>  	It is important to note that the parent process in
> -	Figure~\ref{fig:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
> +	Listing~\ref{lst:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
>  	waits until after the child terminates to do its \co{printf()}.
>  	Using \co{printf()}'s buffered I/O concurrently to the same file
>  	from multiple processes is non-trivial, and is best avoided.
> @@ -376,7 +376,7 @@ than fork-join parallelism.
>  To create a thread within an existing process, invoke the
>  \co{pthread_create()} primitive, for example, as shown on lines~15
>  and~16 of
> -Figure~\ref{fig:toolsoftrade:Threads Created Via pthread-create() Share Memory}
> +Listing~\ref{lst:toolsoftrade:Threads Created Via pthread-create() Share Memory}
>  (\path{pcreate.c}).
>  The first argument is a pointer to a \co{pthread_t} in which to store the
>  ID of the thread to be created, the second \co{NULL} argument is a pointer
> @@ -385,7 +385,7 @@ to an optional \co{pthread_attr_t}, the third argument is the function
>  that is to be invoked by the new thread, and the last \co{NULL} argument
>  is the argument that will be passed to \co{mythread}.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 int x = 0;
> @@ -419,15 +419,15 @@ is the argument that will be passed to \co{mythread}.
>  \centering
>  \theverbbox
>  \caption{Threads Created Via \tco{pthread_create()} Share Memory}
> -\label{fig:toolsoftrade:Threads Created Via pthread-create() Share Memory}
> -\end{figure}
> +\label{lst:toolsoftrade:Threads Created Via pthread-create() Share Memory}
> +\end{listing}
> 
>  In this example, \co{mythread()} simply returns, but it could instead
>  call \co{pthread_exit()}.
> 
>  \QuickQuiz{}
>  	If the \co{mythread()} function in
> -	Figure~\ref{fig:toolsoftrade:Threads Created Via pthread-create() Share Memory}
> +	Listing~\ref{lst:toolsoftrade:Threads Created Via pthread-create() Share Memory}
>  	can simply return, why bother with \co{pthread_exit()}?
>  \QuickQuizAnswer{
>  	In this simple example, there is no reason whatsoever.
> @@ -450,7 +450,7 @@ or the value returned by the thread's top-level function, depending on
>  how the thread in question exits.
> 
>  The program shown in
> -Figure~\ref{fig:toolsoftrade:Threads Created Via pthread-create() Share Memory}
> +Listing~\ref{lst:toolsoftrade:Threads Created Via pthread-create() Share Memory}
>  produces output as follows, demonstrating that memory is in fact
>  shared between the two threads:
> 
> @@ -541,7 +541,7 @@ lock~\cite{Hoare74}.
>  	to the reader.
>  } \QuickQuizEnd
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 pthread_mutex_t lock_a = PTHREAD_MUTEX_INITIALIZER;
> @@ -598,11 +598,11 @@ lock~\cite{Hoare74}.
>  \centering
>  \theverbbox
>  \caption{Demonstration of Exclusive Locks}
> -\label{fig:toolsoftrade:Demonstration of Exclusive Locks}
> -\end{figure}
> +\label{lst:toolsoftrade:Demonstration of Exclusive Locks}
> +\end{listing}
> 
>  This exclusive-locking property is demonstrated using the code shown in
> -Figure~\ref{fig:toolsoftrade:Demonstration of Exclusive Locks}
> +Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
>  (\path{lock.c}).
>  Line~1 defines and initializes a POSIX lock named \co{lock_a}, while
>  line~2 similarly defines and initializes a lock named \co{lock_b}.
> @@ -618,7 +618,7 @@ primitives.
>  \QuickQuiz{}
>  	Why not simply make the argument to \co{lock_reader()}
>  	on line~5 of
> -	Figure~\ref{fig:toolsoftrade:Demonstration of Exclusive Locks}
> +	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
>  	be a pointer to a \co{pthread_mutex_t}?
>  \QuickQuizAnswer{
>  	Because we will need to pass \co{lock_reader()} to
> @@ -653,7 +653,7 @@ required by \co{pthread_create()}.
>  } \QuickQuizEnd
> 
>  Lines~31-49 of
> -Figure~\ref{fig:toolsoftrade:Demonstration of Exclusive Locks}
> +Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
>  shows \co{lock_writer()}, which
>  periodically update the shared variable \co{x} while holding the
>  specified \co{pthread_mutex_t}.
> @@ -664,7 +664,7 @@ While holding the lock, lines~40-43 increment the shared variable \co{x},
>  sleeping for five milliseconds between each increment.
>  Finally, lines~44-47 release the lock.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1   printf("Creating two threads using same lock:\n");
> @@ -691,10 +691,10 @@ Finally, lines~44-47 release the lock.
>  \centering
>  \theverbbox
>  \caption{Demonstration of Same Exclusive Lock}
> -\label{fig:toolsoftrade:Demonstration of Same Exclusive Lock}
> -\end{figure}
> +\label{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
> +\end{listing}
> 
> -Figure~\ref{fig:toolsoftrade:Demonstration of Same Exclusive Lock}
> +Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
>  shows a code fragment that runs \co{lock_reader()} and
>  \co{lock_writer()} as threads using the same lock, namely, \co{lock_a}.
>  Lines~2-6 create a thread running \co{lock_reader()}, and then
> @@ -719,7 +719,7 @@ by \co{lock_writer()} while holding the lock.
>  \QuickQuiz{}
>  	Is ``x = 0'' the only possible output from the code fragment
>  	shown in
> -	Figure~\ref{fig:toolsoftrade:Demonstration of Same Exclusive Lock}?
> +	Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}?
>  	If so, why?
>  	If not, what other output could appear, and why?
>  \QuickQuizAnswer{
> @@ -735,7 +735,7 @@ by \co{lock_writer()} while holding the lock.
>  	However, there are no guarantees, especially on a busy system.
>  } \QuickQuizEnd
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1   printf("Creating two threads w/different locks:\n");
> @@ -763,10 +763,10 @@ by \co{lock_writer()} while holding the lock.
>  \centering
>  \theverbbox
>  \caption{Demonstration of Different Exclusive Locks}
> -\label{fig:toolsoftrade:Demonstration of Different Exclusive Locks}
> -\end{figure}
> +\label{lst:toolsoftrade:Demonstration of Different Exclusive Locks}
> +\end{listing}
> 
> -Figure~\ref{fig:toolsoftrade:Demonstration of Different Exclusive Locks}
> +Listing~\ref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}
>  shows a similar code fragment, but this time using different locks:
>  \co{lock_a} for \co{lock_reader()} and \co{lock_b} for
>  \co{lock_writer()}.
> @@ -811,7 +811,7 @@ values of \co{x} stored by \co{lock_writer()}.
> 
>  \QuickQuiz{}
>  	In the code shown in
> -	Figure~\ref{fig:toolsoftrade:Demonstration of Different Exclusive Locks},
> +	Listing~\ref{lst:toolsoftrade:Demonstration of Different Exclusive Locks},
>  	is \co{lock_reader()} guaranteed to see all the values produced
>  	by \co{lock_writer()}?
>  	Why or why not?
> @@ -825,19 +825,19 @@ values of \co{x} stored by \co{lock_writer()}.
> 
>  \QuickQuiz{}
>  	Wait a minute here!!!
> -	Figure~\ref{fig:toolsoftrade:Demonstration of Same Exclusive Lock}
> +	Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
>  	didn't initialize shared variable \co{x},
>  	so why does it need to be initialized in
> -	Figure~\ref{fig:toolsoftrade:Demonstration of Different Exclusive Locks}?
> +	Listing~\ref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}?
>  \QuickQuizAnswer{
>  	See line~3 of
> -	Figure~\ref{fig:toolsoftrade:Demonstration of Exclusive Locks}.
> +	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}.
>  	Because the code in
> -	Figure~\ref{fig:toolsoftrade:Demonstration of Same Exclusive Lock}
> +	Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
>  	ran first, it could rely on the compile-time initialization of
>  	\co{x}.
>  	The code in
> -	Figure~\ref{fig:toolsoftrade:Demonstration of Different Exclusive Locks}
> +	Listing~\ref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}
>  	ran next, so it had to re-initialize \co{x}.
>  } \QuickQuizEnd
> 
> @@ -873,7 +873,7 @@ an arbitrarily large number of readers to concurrently hold the lock.
>  However, in practice, we need to know how much additional scalability is
>  provided by reader-writer locks.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 pthread_rwlock_t rwl = PTHREAD_RWLOCK_INITIALIZER;
> @@ -922,10 +922,10 @@ provided by reader-writer locks.
>  \centering
>  \theverbbox
>  \caption{Measuring Reader-Writer Lock Scalability}
> -\label{fig:toolsoftrade:Measuring Reader-Writer Lock Scalability}
> -\end{figure}
> +\label{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}
> +\end{listing}
> 
> -Figure~\ref{fig:toolsoftrade:Measuring Reader-Writer Lock Scalability}
> +Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}
>  (\path{rwlockscale.c})
>  shows one way of measuring reader-writer lock scalability.
>  Line~1 shows the definition and initialization of the reader-writer
> @@ -955,7 +955,7 @@ rights to assume that the value of \co{goflag} would never change.
>  \QuickQuiz{}
>  	Instead of using \co{READ_ONCE()} everywhere, why not just
>  	declare \co{goflag} as \co{volatile} on line~10 of
> -	Figure~\ref{fig:toolsoftrade:Measuring Reader-Writer Lock Scalability}?
> +	Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}?
>  \QuickQuizAnswer{
>  	A \co{volatile} declaration is in fact a reasonable alternative in
>  	this particular case.
> @@ -977,7 +977,7 @@ rights to assume that the value of \co{goflag} would never change.
>  	Don't we also need memory barriers to make sure
>  	that the change in \co{goflag}'s value propagates to the
>  	CPU in a timely fashion in
> -	Figure~\ref{fig:toolsoftrade:Measuring Reader-Writer Lock Scalability}?
> +	Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}?
>  \QuickQuizAnswer{
>  	No, memory barriers are not needed and won't help here.
>  	Memory barriers only enforce ordering among multiple memory
> @@ -1167,7 +1167,7 @@ to protect the tiniest of critical sections.
>  One such way are atomic operations.
>  We have seen one atomic operations already, in the form of the
>  \co{__sync_fetch_and_add()} primitive on line~18 of
> -Figure~\ref{fig:toolsoftrade:Measuring Reader-Writer Lock Scalability}.
> +Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}.
>  This primitive atomically adds the value of its second argument to
>  the value referenced by its first argument, returning the old value
>  (which was ignored in this case).
> @@ -1243,11 +1243,11 @@ In some cases, it is sufficient to constrain the compiler's ability
>  to reorder operations, while allowing the CPU free rein, in which
>  case the \co{barrier()} primitive may be used, as it in fact was
>  on line~28 of
> -Figure~\ref{fig:toolsoftrade:Measuring Reader-Writer Lock Scalability}.
> +Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}.
>  In some cases, it is only necessary to ensure that the compiler
>  avoids optimizing away a given memory read, in which case the
>  \co{READ_ONCE()} primitive may be used, as it was on line~17 of
> -Figure~\ref{fig:toolsoftrade:Demonstration of Exclusive Locks}.
> +Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}.
>  Similarly, the \co{WRITE_ONCE()} primitive may be used to prevent the
>  compiler from optimizing away a given memory write.
>  These last three primitives are not provided directly by \GCC,
> @@ -1416,10 +1416,10 @@ Threads share everything except for per-thread local state,\footnote{
>  which includes program counter and stack.
> 
>  The thread API is shown in
> -Figure~\ref{fig:toolsoftrade:Thread API}, and members are described in the
> +Listing~\ref{lst:toolsoftrade:Thread API}, and members are described in the
>  following sections.
> 
> -\begin{figure*}[tbp]
> +\begin{listing*}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>  int smp_thread_id(void)
> @@ -1433,8 +1433,8 @@ void wait_all_threads(void)
>  \centering
>  \theverbbox
>  \caption{Thread API}
> -\label{fig:toolsoftrade:Thread API}
> -\end{figure*}
> +\label{lst:toolsoftrade:Thread API}
> +\end{listing*}
> 
>  \subsubsection{\tco{create_thread()}}
> 
> @@ -1499,7 +1499,7 @@ a run, so such synchronization is normally not needed.
> 
>  \subsubsection{Example Usage}
> 
> -Figure~\ref{fig:toolsoftrade:Example Child Thread}
> +Listing~\ref{lst:toolsoftrade:Example Child Thread}
>  shows an example hello-world-like child thread.
>  As noted earlier, each thread is allocated its own stack, so
>  each thread has its own private \co{arg} argument and \co{myarg} variable.
> @@ -1509,7 +1509,7 @@ Note that the \co{return} statement on line~7 terminates the thread,
>  returning a \co{NULL} to whoever invokes \co{wait_thread()} on this
>  thread.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 void *thread_test(void *arg)
> @@ -1525,11 +1525,11 @@ thread.
>  \centering
>  \theverbbox
>  \caption{Example Child Thread}
> -\label{fig:toolsoftrade:Example Child Thread}
> -\end{figure}
> +\label{lst:toolsoftrade:Example Child Thread}
> +\end{listing}
> 
>  The parent program is shown in
> -Figure~\ref{fig:toolsoftrade:Example Parent Thread}.
> +Listing~\ref{lst:toolsoftrade:Example Parent Thread}.
>  It invokes \co{smp_init()} to initialize the threading system on
>  line~6,
>  parses arguments on lines~7-14, and announces its presence on line~15.
> @@ -1538,7 +1538,7 @@ and waits for them to complete on line~18.
>  Note that \co{wait_all_threads()} discards the threads return values,
>  as in this case they are all \co{NULL}, which is not very interesting.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>    1 int main(int argc, char *argv[])
> @@ -1567,8 +1567,8 @@ as in this case they are all \co{NULL}, which is not very interesting.
>  \centering
>  \theverbbox
>  \caption{Example Parent Thread}
> -\label{fig:toolsoftrade:Example Parent Thread}
> -\end{figure}
> +\label{lst:toolsoftrade:Example Parent Thread}
> +\end{listing}
> 
>  \QuickQuiz{}
>  	What happened to the Linux-kernel equivalents to \co{fork()}
> @@ -1584,11 +1584,11 @@ as in this case they are all \co{NULL}, which is not very interesting.
>  \label{sec:toolsoftrade:Locking}
> 
>  A good starting subset of the Linux kernel's locking API is shown in
> -Figure~\ref{fig:toolsoftrade:Locking API},
> +Listing~\ref{lst:toolsoftrade:Locking API},
>  each API element being described in the following sections.
>  This book's CodeSamples locking API closely follows that of the Linux kernel.
> 
> -\begin{figure}[tbp]
> +\begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}
>  void spin_lock_init(spinlock_t *sp);
> @@ -1600,8 +1600,8 @@ void spin_unlock(spinlock_t *sp);
>  \centering
>  \theverbbox
>  \caption{Locking API}
> -\label{fig:toolsoftrade:Locking API}
> -\end{figure}
> +\label{lst:toolsoftrade:Locking API}
> +\end{listing}
> 
>  \subsubsection{\tco{spin_lock_init()}}
> 
> @@ -1721,7 +1721,7 @@ given per-CPU variable, \co{per_cpu()} to access a specified CPU's
>  instance of a given per-CPU variable, along with many other special-purpose
>  per-CPU operations.
> 
> -Figure~\ref{fig:toolsoftrade:Per-Thread-Variable API}
> +Listing~\ref{lst:toolsoftrade:Per-Thread-Variable API}
>  shows this book's per-thread-variable API, which is patterned
>  after the Linux kernel's per-CPU-variable API.
>  This API provides the per-thread equivalent of global variables.
> @@ -1729,7 +1729,7 @@ Although this API is, strictly speaking, not necessary\footnote{
>  	You could instead use \co{__thread} or \co{_Thread_local}.},
>  it can provide a good userspace analogy to Linux kernel code.
> 
> -\begin{figure}[htbp]
> +\begin{listing}[htbp]
>  { \scriptsize
>  \begin{verbbox}
>  DEFINE_PER_THREAD(type, name)
> @@ -1742,8 +1742,8 @@ init_per_thread(name, v)
>  \centering
>  \theverbbox
>  \caption{Per-Thread-Variable API}
> -\label{fig:toolsoftrade:Per-Thread-Variable API}
> -\end{figure}
> +\label{lst:toolsoftrade:Per-Thread-Variable API}
> +\end{listing}
> 
>  \QuickQuiz{}
>  	How could you work around the lack of a per-thread-variable
> -- 
> 2.7.4
> 

