Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726884AbfJ0RJZ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 27 Oct 2019 13:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572196163;
        bh=C9zexRN7m/apfqyNk1d8xacsLWtMA8Ov4S4jM2R0L40=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nq4pP4YaDii9W7bvmfQ+cWCzTA1vddlut/ZJ8gE7qARrXwyisOUpveQpQrdvUi8ZK
         yA1LuzloQFTC7f+i3VlM15n8Dn8gXMLcf/uoG/HSCpGkzkHdZU2XzESuizL5Um+cB5
         xWOLeRpjMJ6XRIjoPWADxHVhZAAKx4uo9rxsrOmQ=
Date: Sun, 27 Oct 2019 10:09:22 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFC PATCH] count: Merge tables of statistical and limited
 counter performance
Message-ID: <20191027170922.GG4465@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <74f205ba-a530-288b-d211-8ef8db70f365@gmail.com>
 <20191026230424.GF4465@paulmck-ThinkPad-P72>
 <950010b1-3788-6763-b7cc-eea6933863c6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <950010b1-3788-6763-b7cc-eea6933863c6@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Oct 28, 2019 at 12:24:36AM +0900, Akira Yokosawa wrote:
> >From 0e0d8d79f0416bcbe284d8d191bd76a74f352f14 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 27 Oct 2019 22:07:59 +0900
> Subject: [RFC PATCH] count: Merge tables of statistical and limited counter performance
> 
> To help comparison of performance of various counter algorithms,
> merge the tables and align data of both statistical and limited
> counters.
> Also update the wording of references to the merged table.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> > Would it make sense to rotate the "Exact?" heading 90 degrees and
> > to put the "(ns)" underneath the "Updates"?  Those two changes
> > might make Figure 5.2 fit horizontally.
> 
> Another idea is to merge those 2 tables and align performance results
> vertically, which this RFC patch attempts to do.
> 
> As the "Exact?" column is irrelevant to statistical counters, I made
> those cells look blank.
> 
> How does this look to you?

Good improvement, queued and pushed, thank you!

I couldn't resist trying rotating the "Exact?" heading, though there has
to be a better way to do this.  Thoughts?  (Feel free to provide an
alternative, and I will be happy to replace my attempt with it.)

Another thing would be to make the "Algorithms" heading be something
like "Algorithms: \co{count_*.c}", then trim the leading "count_" and
trailing ".c" from each row's first column.  Would that make sense?

							Thanx, Paul

>         Thanks, Akira
> -- 
>  count/count.tex | 96 +++++++++++++++++++------------------------------
>  1 file changed, 37 insertions(+), 59 deletions(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index 6430abd5..cff56d72 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -2817,33 +2817,43 @@ will expand on these lessons.
>  \rowcolors{4}{}{lightgray}
>  \renewcommand*{\arraystretch}{1.1}
>  \small
> -\centering\OneColumnHSpace{-.25in}
> -\begin{tabular}{lrS[table-format=1.1]S[table-format=3.0]S[table-format=4.0]
> +\centering\OneColumnHSpace{-.35in}
> +\newcommand{\NA}{\cellcolor{white}}
> +\begin{tabular}{lrcS[table-format=2.1]S[table-format=3.0]S[table-format=4.0]
>  		  S[table-format=6.0]S[table-format=6.0]}
>  	\toprule
> -	& & & \multicolumn{4}{c}{Reads (ns)} \\
> -	\cmidrule{4-7}
> -	Algorithm & Section & \multicolumn{1}{r}{Updates (ns)} &
> +	& & & \multicolumn{1}{c}{Updates} & \multicolumn{4}{c}{Reads (ns)} \\
> +	\cmidrule{5-8}
> +	Algorithm & Section & Exact? & \multicolumn{1}{r}{(ns)} &
>  				    \multicolumn{1}{r}{1 CPU} &
>  					\multicolumn{1}{r}{8 CPUs} &
>  					    \multicolumn{1}{r}{64 CPUs} &
>  						\multicolumn{1}{r}{420 CPUs} \\
>  		\midrule
> -		\path{count_stat.c} & \ref{sec:count:Array-Based Implementation} &
> +		\path{count_stat.c} & \ref{sec:count:Array-Based Implementation} & \NA &
>  		 6.3 & 294 & 303   & 315     &    612 \\
> -	\path{count_stat_eventual.c} & \ref{sec:count:Eventually Consistent Implementation} &
> +	\path{count_stat_eventual.c} & \ref{sec:count:Eventually Consistent Implementation} & \NA &
>  		 6.4 &   1 &   1   &   1     &      1 \\
> -	\path{count_end.c} & \ref{sec:count:Per-Thread-Variable-Based Implementation} &
> +	\path{count_end.c} & \ref{sec:count:Per-Thread-Variable-Based Implementation} & \NA &
>  		 2.9 & 301 & 6 309 & 147 594 & 239 683 \\
> -	\path{count_end_rcu.c} & \ref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters} &
> +	\path{count_end_rcu.c} & \ref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters} & \NA &
>  		 2.9 & 454 &   481 &     508 &   2 317 \\
> +	\midrule
> +	\path{count_lim.c} & \ref{sec:count:Simple Limit Counter Implementation} &
> +		N &  3.2 & 435 & 6 678 & 156 175 & 239 422 \\
> +	\path{count_lim_app.c} & \ref{sec:count:Approximate Limit Counter Implementation} &
> +		N &  2.4 & 485 & 7 041 & 173 108 & 239 682 \\
> +	\path{count_lim_atomic.c} & \ref{sec:count:Atomic Limit Counter Implementation} &
> +		Y & 19.7 & 513 & 7 085 & 199 957 & 239 450 \\
> +	\path{count_lim_sig.c} & \ref{sec:count:Signal-Theft Limit Counter Implementation} &
> +		Y &  4.7 & 519 & 6 805 & 120 000 & 238 811 \\
>  	\bottomrule
>  \end{tabular}
> -\caption{Statistical Counter Performance on x86}
> -\label{tab:count:Statistical Counter Performance on x86}
> +\caption{Statistical/Limit Counter Performance on x86}
> +\label{tab:count:Statistical/Limit Counter Performance on x86}
>  \end{table*}
>  
> -Table~\ref{tab:count:Statistical Counter Performance on x86}
> +The top half of \cref{tab:count:Statistical/Limit Counter Performance on x86}
>  shows the performance of the four parallel statistical counting
>  algorithms.
>  All four algorithms provide near-perfect linear scalability for updates.
> @@ -2856,13 +2866,13 @@ This contention can be addressed using the deferred-processing
>  techniques introduced in
>  Chapter~\ref{chp:Deferred Processing},
>  as shown on the \path{count_end_rcu.c} row of
> -Table~\ref{tab:count:Statistical Counter Performance on x86}.
> +\cref{tab:count:Statistical/Limit Counter Performance on x86}.
>  Deferred processing also shines on the \path{count_stat_eventual.c} row,
>  courtesy of eventual consistency.
>  
>  \QuickQuiz{}
>  	On the \path{count_stat.c} row of
> -	Table~\ref{tab:count:Statistical Counter Performance on x86},
> +	\cref{tab:count:Statistical/Limit Counter Performance on x86},
>  	we see that the read-side scales linearly with the number of
>  	threads.
>  	How is that possible given that the more threads there are,
> @@ -2878,8 +2888,8 @@ courtesy of eventual consistency.
>  } \QuickQuizEnd
>  
>  \QuickQuiz{}
> -	Even on the last row of
> -	Table~\ref{tab:count:Statistical Counter Performance on x86},
> +	Even on the fourth row of
> +	\cref{tab:count:Statistical/Limit Counter Performance on x86},
>  	the read-side performance of these statistical counter
>  	implementations is pretty horrible.
>  	So why bother with them?
> @@ -2890,8 +2900,8 @@ courtesy of eventual consistency.
>  	Figure~\ref{fig:count:Atomic Increment Scalability on x86},
>  	single-variable atomic increment need not apply for any job
>  	involving heavy use of parallel updates.
> -	In contrast, the algorithms shown in
> -	Table~\ref{tab:count:Statistical Counter Performance on x86}
> +	In contrast, the algorithms shown in the top half of
> +	\cref{tab:count:Statistical/Limit Counter Performance on x86}
>  	do an excellent job of handling update-heavy situations.
>  	Of course, if you have a read-mostly situation, you should
>  	use something else, for example, an eventually consistent design
> @@ -2901,37 +2911,7 @@ courtesy of eventual consistency.
>  	Section~\ref{sec:count:Eventually Consistent Implementation}.
>  } \QuickQuizEnd
>  
> -\begin{table*}
> -\rowcolors{4}{}{lightgray}
> -\renewcommand*{\arraystretch}{1.1}
> -\small
> -\centering\OneColumnHSpace{-.4in}
> -\begin{tabular}{lrcS[table-format=2.1]S[table-format=3.0]S[table-format=4.0]
> -		   S[table-format=6.0]S[table-format=6.0]}
> -	\toprule
> -	& & & & \multicolumn{4}{c}{Reads (ns)} \\
> -	\cmidrule{5-8}
> -	Algorithm & Section & Exact? & \multicolumn{1}{r}{Updates (ns)} &
> -					\multicolumn{1}{r}{1 CPU} &
> -					 \multicolumn{1}{r}{8 CPUs} &
> -					  \multicolumn{1}{r}{64 CPUs} &
> -					   \multicolumn{1}{r}{420 CPUs} \\
> -	\midrule
> -	\path{count_lim.c} & \ref{sec:count:Simple Limit Counter Implementation} &
> -		N &  3.2 & 435 & 6 678 & 156 175 & 239 422 \\
> -	\path{count_lim_app.c} & \ref{sec:count:Approximate Limit Counter Implementation} &
> -		N &  2.4 & 485 & 7 041 & 173 108 & 239 682 \\
> -	\path{count_lim_atomic.c} & \ref{sec:count:Atomic Limit Counter Implementation} &
> -		Y & 19.7 & 513 & 7 085 & 199 957 & 239 450 \\
> -	\path{count_lim_sig.c} & \ref{sec:count:Signal-Theft Limit Counter Implementation} &
> -		Y &  4.7 & 519 & 6 805 & 120 000 & 238 811 \\
> -	\bottomrule
> -\end{tabular}
> -\caption{Limit Counter Performance on x86}
> -\label{tab:count:Limit Counter Performance on x86}
> -\end{table*}
> -
> -Table~\ref{tab:count:Limit Counter Performance on x86}
> +The bottom half of \cref{tab:count:Statistical/Limit Counter Performance on x86}
>  shows the performance of the parallel limit-counting algorithms.
>  Exact enforcement of the limits incurs a substantial performance
>  penalty, although on this x86 system that penalty can be reduced
> @@ -2940,8 +2920,8 @@ All of these implementations suffer from read-side lock contention
>  in the face of concurrent readers.
>  
>  \QuickQuiz{}
> -	Given the performance data shown in
> -	Table~\ref{tab:count:Limit Counter Performance on x86},
> +	Given the performance data shown in the bottom half of
> +	\cref{tab:count:Statistical/Limit Counter Performance on x86},
>  	we should always prefer signals over atomic operations, right?
>  \QuickQuizAnswer{
>  	That depends on the workload.
> @@ -2962,8 +2942,8 @@ in the face of concurrent readers.
>  
>  \QuickQuiz{}
>  	Can advanced techniques be applied to address the lock
> -	contention for readers seen in
> -	Table~\ref{tab:count:Limit Counter Performance on x86}?
> +	contention for readers seen in the bottom half of
> +	\cref{tab:count:Statistical/Limit Counter Performance on x86}?
>  \QuickQuizAnswer{
>  	One approach is to give up some update-side performance, as is
>  	done with scalable non-zero indicators
> @@ -3126,8 +3106,7 @@ operations, so that a great many of these cheap operations are handled
>  by a single synchronization operation.
>  Batching optimizations of one sort or another are used by each of
>  the counting algorithms listed in
> -Tables~\ref{tab:count:Statistical Counter Performance on x86}
> -and~\ref{tab:count:Limit Counter Performance on x86}.
> +\cref{tab:count:Statistical/Limit Counter Performance on x86}.
>  
>  Finally, the eventually consistent statistical counter discussed in
>  Section~\ref{sec:count:Eventually Consistent Implementation}
> @@ -3158,20 +3137,19 @@ Summarizing the summary:
>  	thereby decreasing synchronization overhead, in turn
>  	improving performance and scalability.
>  	All the algorithms shown in
> -	Tables~\ref{tab:count:Statistical Counter Performance on x86}
> -	and~\ref{tab:count:Limit Counter Performance on x86}
> +	\cref{tab:count:Statistical/Limit Counter Performance on x86}
>  	make heavy use of batching.
>  \item	Read-only code paths should remain read-only:  Spurious
>  	synchronization writes to shared memory kill performance
>  	and scalability, as seen in the \path{count_end.c} row of
> -	Table~\ref{tab:count:Statistical Counter Performance on x86}.
> +	\cref{tab:count:Statistical/Limit Counter Performance on x86}.
>  \item	Judicious use of delay promotes performance and scalability, as
>  	seen in Section~\ref{sec:count:Eventually Consistent Implementation}.
>  \item	Parallel performance and scalability is usually a balancing act:
>  	Beyond a certain point, optimizing some code paths will degrade
>  	others.
>  	The \path{count_stat.c} and \path{count_end_rcu.c} rows of
> -	Table~\ref{tab:count:Statistical Counter Performance on x86}
> +	\cref{tab:count:Statistical/Limit Counter Performance on x86}
>  	illustrate this point.
>  \item	Different levels of performance and scalability will affect
>  	algorithm and data-structure design, as do a large number of
> -- 
> 2.17.1
> 
> 
