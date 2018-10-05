Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53914 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729459AbeJFD4f (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 5 Oct 2018 23:56:35 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w95KshG3042470
        for <perfbook@vger.kernel.org>; Fri, 5 Oct 2018 16:56:07 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2mxcy9wxtp-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Fri, 05 Oct 2018 16:56:06 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 5 Oct 2018 16:56:06 -0400
Date: Fri, 5 Oct 2018 13:56:03 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] toolsoftrade: Employ new scheme for snippet in newly
 added sections
Reply-To: paulmck@linux.ibm.com
References: <398e3219-2e8e-585d-c6d7-653db46e5a8e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <398e3219-2e8e-585d-c6d7-653db46e5a8e@gmail.com>
Message-Id: <20181005205603.GE2674@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Oct 06, 2018 at 12:38:49AM +0900, Akira Yokosawa wrote:
> >From 89be258c86a41713c327995d8ed46c12c3fba736 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 6 Oct 2018 00:11:04 +0900
> Subject: [PATCH] toolsoftrade: Employ new scheme for snippet in newly added sections
> 
> These code snippets don't have corresponding code under CodeSamples.
> Embed them in the "VerbatimL" environment with labels to lines 
> referenced from the text.
> 
> A few trivial typos are fixed as well.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> I see you have used verbbox for new code snippets. VerbatimL can be used
> instead as shown in this patch. Hopefully this can provide a few
> templates for you to use the new scheme without putting actual code
> under CodeSamples. In these snippets, labelbase has the same string as
> the listing's label, give or take the leading prefix ("lst:" -> "ln:").
> 
> If you don't feel like using the new scheme for the moment, I'd be happy
> to do the conversion on behalf of you.
> 
> BTW, the expansion on accessing shared variable makes a lot of sense
> to me. I'm a bit afraid of possible conflict with your ongoing expansion
> in toolsoftrade, but I thought it is better rather than later.

Good catch, applied and queued, thank you!

What can I say?  Force of habit and all that.  But I have nearby
examples now, at least.  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
>  toolsoftrade/toolsoftrade.tex | 224 ++++++++++++++++++++++--------------------
>  1 file changed, 117 insertions(+), 107 deletions(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 53c69b2..5216054 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1661,29 +1661,25 @@ in long-past pre-C11 days.
>  A short answer to this question is ``they lived dangerously''.
>  
>  \begin{listing}[tbp]
> -{ \scriptsize
> -\begin{verbbox}
> - 1 ptr = global_ptr;
> - 2 if (ptr != NULL && ptr < high_address)
> - 3   do_low(ptr);
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\begin{linelabel}[ln:toolsoftrade:Living Dangerously Early 1990s Style]
> +\begin{VerbatimL}[commandchars=\\\{\}]
> +ptr = global_ptr;\lnlbl{temp}
> +if (ptr != NULL && ptr < high_address)
> +	do_low(ptr);
> +\end{VerbatimL}
> +\end{linelabel}
>  \caption{Living Dangerously Early 1990s Style}
>  \label{lst:toolsoftrade:Living Dangerously Early 1990s Style}
>  \end{listing}
>  
>  \begin{listing}[tbp]
> -{ \scriptsize
> -\begin{verbbox}
> - 1 if (global_ptr != NULL &&
> - 2     global_ptr < high_address)
> - 3   do_low(global_ptr);
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\begin{linelabel}[ln:toolsoftrade:C Compilers Can Invent Loads]
> +\begin{VerbatimL}[commandchars=\\\{\}]
> +if (global_ptr != NULL &&\lnlbl{if:a}
> +    global_ptr < high_address)\lnlbl{if:b}
> +	do_low(global_ptr);\lnlbl{do_low}
> +\end{VerbatimL}
> +\end{linelabel}
>  \caption{C Compilers Can Invent Loads}
>  \label{lst:toolsoftrade:C Compilers Can Invent Loads}
>  \end{listing}
> @@ -1696,7 +1692,8 @@ Nevertheless, problems did arise, as shown in
>  Listing~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style},
>  which the compiler is within its rights to transform into
>  Listing~\ref{lst:toolsoftrade:C Compilers Can Invent Loads}.
> -As you can, the temporary on line~1 of
> +As you can, the temporary on
> +line~\ref{ln:toolsoftrade:Living Dangerously Early 1990s Style:temp} of
>  Listing~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style}
>  has been optimized away, so that \co{global_ptr} will been loaded
>  up to three times.
> @@ -1708,14 +1705,18 @@ up to three times.
>  \QuickQuizAnswer{
>  	Suppose that \co{global_ptr} is initially non-\co{NULL},
>  	but that some other thread sets \co{global_ptr} to \co{NULL}.
> -	Suppose further that line~1 of the transformed code
> +	\begin{lineref}[ln:toolsoftrade:C Compilers Can Invent Loads]
> +	Suppose further that line~\lnref{if:a} of the transformed code
>  	(Listing~\ref{lst:toolsoftrade:C Compilers Can Invent Loads})
>  	executes just before \co{global_ptr} is set to \co{NULL} and
> -	line~2 just after.
> -	Then line~1 will conclude that \co{global_ptr} is non-\co{NULL},
> -	line~2 will conclude that it is less than \co{high_address},
> -	so that line~3 passes \co{do_low()} a \co{NULL} pointer,
> +	line~\lnref{if:b} just after.
> +	Then line~\lnref{if:a} will conclude that
> +        \co{global_ptr} is non-\co{NULL},
> +	line~\lnref{if:b} will conclude that it is less than
> +        \co{high_address},
> +	so that line~\lnref{do_low} passes \co{do_low()} a \co{NULL} pointer,
>  	which \co{do_low()} just might not be prepared to deal with.
> +	\end{lineref}
>  } \QuickQuizEnd
>  
>  Section~\ref{sec:toolsoftrade:Shared-Variable Shenanigans}
> @@ -1750,7 +1751,8 @@ or shared-variable shenanigans, as described below.
>  {\bf Load tearing} occurs when the compiler uses multiple load
>  instructions for a single access.
>  For example, the compiler could in theory compile the load from
> -\co{global_ptr} (see line~1 of
> +\co{global_ptr} (see
> +line~\ref{ln:toolsoftrade:Living Dangerously Early 1990s Style:temp} of
>  Listing~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style})
>  as a series of one-byte loads.
>  If some other thread was concurrently setting \co{global_ptr} to
> @@ -1776,31 +1778,29 @@ Again, the C standard simply has no choice in the general case, given
>  the possibility of code using 32-bit integers running on a 16-bit system.
>  
>  \begin{listing}[tbp]
> -{ \scriptsize
> -\begin{verbbox}
> - 1 if (!need_to_stop)
> - 2   for (;;) {
> - 3     do_something_quickly();
> - 4     do_something_quickly();
> - 5     do_something_quickly();
> - 6     do_something_quickly();
> - 7     do_something_quickly();
> - 8     do_something_quickly();
> - 9     do_something_quickly();
> -10     do_something_quickly();
> -11     do_something_quickly();
> -12     do_something_quickly();
> -13     do_something_quickly();
> -14     do_something_quickly();
> -15     do_something_quickly();
> -16     do_something_quickly();
> -17     do_something_quickly();
> -18     do_something_quickly();
> -19   }
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\begin{linelabel}[ln:toolsoftrade:C Compilers Can Fuse Loads]
> +\begin{VerbatimL}[commandchars=\\\[\]]
> +if (!need_to_stop)
> +	for (;;) {\lnlbl[loop:b]
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +		do_something_quickly();
> +	}\lnlbl[loop:e]
> +\end{VerbatimL}
> +\end{linelabel}
>  \caption{C Compilers Can Fuse Loads}
>  \label{lst:toolsoftrade:C Compilers Can Fuse Loads}
>  \end{listing}
> @@ -1822,8 +1822,11 @@ Worse yet, because the compiler knows that \co{do_something_quickly()}
>  does not store to \co{need_to_stop}, the compiler could quite reasonably
>  decide to check this variable only once, resulting in the code shown in
>  Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Loads}.
> -Once entered, the loop on lines~2-19 will never stop, regardless of how
> +\begin{lineref}[ln:toolsoftrade:C Compilers Can Fuse Loads]
> +Once entered, the loop on
> +lines~\lnref{loop:b}-\lnref{loop:e} will never stop, regardless of how
>  many times some other thread stores a non-zero value to \co{need_to_stop}.
> +\end{lineref}
>  The result will at best be disappointment, and might well also
>  include severe physical damage.
>  
> @@ -1837,46 +1840,48 @@ very little chance that some other thread could load the value from the
>  first store.
>  
>  \begin{listing}[tbp]
> -{ \scriptsize
> -\begin{verbbox}
> - 1 void shut_it_down(void)
> - 2 {
> - 3   status = SHUTTING_DOWN; /* BUGGY!!! */
> - 4   start_shutdown();
> - 5   while (!other_task_ready)
> - 6     continue;
> - 7   finish_shutdown();
> - 8   status = SHUT_DOWN;
> - 9   do_something_else();
> -10 }
> -11
> -12 void work_until_shut_down(void)
> -13 {
> -14   while (status != SHUTTING_DOWN)
> -15     do_more_work();
> -16   other_task_ready = 1; /* BUGGY!!! */
> -17 }
> -\end{verbbox}
> +\begin{linelabel}[ln:toolsoftrade:C Compilers Can Fuse Stores]
> +\begin{VerbatimL}[commandchars=\\\[\]]
> +void shut_it_down(void)
> +{
> +	status = SHUTTING_DOWN; /* BUGGY!!! */\lnlbl[store:a]
> +	start_shutdown();
> +	while (!other_task_ready)\lnlbl[loop:b]
> +		continue;\lnlbl[loop:e]
> +	finish_shutdown();\lnlbl[finish]
> +	status = SHUT_DOWN;\lnlbl[store:b]
> +	do_something_else();
>  }
> -\centering
> -\theverbbox
> +
> +void work_until_shut_down(void)
> +{
> +	while (status != SHUTTING_DOWN)\lnlbl[until:loop:b]
> +		do_more_work();\lnlbl[until:loop:e]
> +	other_task_ready = 1; /* BUGGY!!! */\lnlbl[other:store]
> +}
> +\end{VerbatimL}
> +\end{linelabel}
>  \caption{C Compilers Can Fuse Stores}
>  \label{lst:toolsoftrade:C Compilers Can Fuse Stores}
>  \end{listing}
>  
>  However, there are exceptions, for example as shown in
>  Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores}.
> +\begin{lineref}[ln:toolsoftrade:C Compilers Can Fuse Stores]
>  The function \co{shut_it_down(void)()} stores to the shared
> -variable \co{status} on lines~3 and~8, and so assuming that neither
> +variable \co{status} on lines~\lnref{store:a} and~\lnref{store:b},
> +and so assuming that neither
>  \co{start_shutdown()} nor \co{finish_shutdown()} access \co{status},
>  the compiler could reasonably remove the store to \co{status} on
> -line~3.
> +line~\lnref{store:a}.
>  Unfortunately, this would mean that \co{work_until_shut_down()} would
> -never exit its loop spanning lines~14 and~15, and thus would never set
> +never exit its loop spanning
> +lines~\lnref{until:loop:b} and~\lnref{until:loop:e}, and thus would never set
>  \co{other_task_ready}, which would in turn mean that \co{shut_it_down()}
> -would never exit its loop spanning lines~5 and~6, even if
> +would never exit its loop spanning
> +lines~\lnref{loop:b} and~\lnref{loop:e}, even if
>  the compiler chooses not to fuse the successive loads from
> -\co{(!other_task_ready} on line~5.
> +\co{(!other_task_ready)} on line~\lnref{loop:b}.
>  
>  And there are more problems with the code in
>  Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores},
> @@ -1889,16 +1894,19 @@ modern superscalar microprocessors.
>  It is also another reason why the code in
>  Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores}
>  is buggy.
> -For example, suppose that the \co{do_more_work()} function on line~15
> +For example, suppose that the \co{do_more_work()} function on
> +line~\lnref{until:loop:e}
>  does not access \co{other_task_ready}.
>  Then the compiler would be within its rights to move the assignment
> -to \co{other_task_ready} on line~16 to precede line~14, which might
> +to \co{other_task_ready} on
> +line~\lnref{other:store} to precede line~\lnref{until:loop:b}, which might
>  be a great disappointment for anyone hoping that the last call to
> -\co{do_more_work()} on line~15 happens before the call to
> -\co{finish_shutdown()} on line~7.
> +\co{do_more_work()} on line~\lnref{until:loop:e} happens before the call to
> +\co{finish_shutdown()} on line~\lnref{finish}.
> +\end{lineref}
>  
>  {\bf Invented loads} were illustrated by the code in
> -Listings~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style})
> +Listings~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style}
>  and~\ref{lst:toolsoftrade:C Compilers Can Invent Loads},
>  in which the compiler optimized away a temporary variable,
>  thus loading from a shared variable more often than intended.
> @@ -1910,50 +1918,49 @@ These hoisting optimizations are not uncommon, and can cause significant
>  increases in cache misses, and thus significant degradation of
>  both performance and scalability.
>  
> +\begin{lineref}[ln:toolsoftrade:C Compilers Can Fuse Stores]
>  {\bf Invented stores} can occur in a number of situations.
>  For example, a compiler emitting code for \co{work_until_shut_down()} in
>  Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores}
>  might notice that \co{other_task_ready} is not accessed by
> -\co{do_more_work()}, and stored to on line~16.
> +\co{do_more_work()}, and stored to on line~\lnref{other:store}.
>  If \co{do_more_work()} was a complex inline function, it might be
>  necessary to do a register spill, in which case one attractive
>  place to use for temporary storage is \co{other_task_ready}.
>  After all, there are no accesses to it, so what is the harm?
>  
>  Of course, a non-zero store to this variable at just the wrong time
> -would result in the \co{while} loop on line~5 terminating
> +would result in the \co{while} loop on
> +line~\lnref{loop:b} terminating
>  prematurely, again allowing \co{finish_shutdown()} to run
>  concurrently with \co{do_more_work()}.
>  Given that the entire point of this \co{while} appears to be to
>  prevent such concurrency, this is not a good thing.
> +\end{lineref}
>  
>  \begin{listing}[tbp]
> -{ \scriptsize
> -\begin{verbbox}
> - 1 if (condition)
> - 2   a = 1;
> - 3 else
> - 4   do_a_bunch_of_stuff();
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\begin{linelabel}[ln:toolsoftrade:Inviting an Invented Store]
> +\begin{VerbatimL}[commandchars=\\\{\}]
> +if (condition)
> +	a = 1;
> +else
> +	do_a_bunch_of_stuff();
> +\end{VerbatimL}
> +\end{linelabel}
>  \caption{Inviting an Invented Store}
>  \label{lst:toolsoftrade:Inviting an Invented Store}
>  \end{listing}
>  
>  \begin{listing}[tbp]
> -{ \scriptsize
> -\begin{verbbox}
> - 1 a = 1;
> - 2 if (!condition) {
> - 3   a = 0;
> - 4   do_a_bunch_of_stuff();
> - 5 }
> -\end{verbbox}
> +\begin{linelabel}[ln:toolsoftrade:Compiler Invents an Invited Store]
> +\begin{VerbatimL}[commandchars=\\\[\]]
> +a = 1;\lnlbl[store:uncond]
> +if (!condition) {
> +	a = 0;\lnlbl[store:cond]
> +	do_a_bunch_of_stuff();
>  }
> -\centering
> -\theverbbox
> +\end{VerbatimL}
> +\end{linelabel}
>  \caption{Compiler Invents an Invited Store}
>  \label{lst:toolsoftrade:Compiler Invents an Invited Store}
>  \end{listing}
> @@ -1971,9 +1978,12 @@ might know that the value of \co{a} is initially zero,
>  which might be a strong temptation to optimize away one branch
>  by transforming this code to that in
>  Listing~\ref{lst:toolsoftrade:Compiler Invents an Invited Store}.
> -Here, line~1 unconditionally stores \co{1} to \co{1}, then
> -resets the value back to zero on line~3 if \co{condition} was not set.
> +\begin{lineref}[ln:toolsoftrade:Compiler Invents an Invited Store]
> +Here, line~\lnref{store:uncond} unconditionally stores \co{1} to \co{a}, then
> +resets the value back to zero on
> +line~\lnref{store:cond} if \co{condition} was not set.
>  This transforms the if-then-else into an if-then, saving one branch.
> +\end{lineref}
>  
>  Finally, pre-C11 compilers could invent writes to unrelated
>  variables that happened to be adjacent to written-to
> -- 
> 2.7.4
> 

