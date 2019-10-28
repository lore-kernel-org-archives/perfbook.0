Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732178AbfJ1SH6 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 28 Oct 2019 14:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572286076;
        bh=lWjV0ZbK6zv81NptG92Sv0AcpbRCi5LYz0Hj+7NY1gI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=wNeAP2WDZDVBRgMR1qcT3EBaqjytU7m9EPDw0s7yeLj+dOtYpcFMMQIIGthTXAQij
         gCvQHiPFMFaew3UTjN00iOLwb9+KEpzaG+VqhQq6GgX0jFT0k8HUoq88xluM/h0ahR
         27irnlVJmJfc0NVCvEQ0qrouO4CkHeDvoyncdOYA=
Date: Mon, 28 Oct 2019 11:07:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] count: Reduce width of performance table
Message-ID: <20191028180755.GP4465@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <74f205ba-a530-288b-d211-8ef8db70f365@gmail.com>
 <20191026230424.GF4465@paulmck-ThinkPad-P72>
 <950010b1-3788-6763-b7cc-eea6933863c6@gmail.com>
 <20191027170922.GG4465@paulmck-ThinkPad-P72>
 <589947e7-268c-707c-8968-30bfa82ad2fa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <589947e7-268c-707c-8968-30bfa82ad2fa@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Oct 28, 2019 at 11:44:27PM +0900, Akira Yokosawa wrote:
> >From a4f6e08b2ef23b39eed420e0f1595affbb624c5f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 28 Oct 2019 22:29:17 +0900
> Subject: [PATCH] count: Reduce width of performance table
> 
> Reperesent algorithm names by unique part of their path names.
> To shrink vertical spaces in the heading, use "picture" environment
> and tweak placement manually.
> 
> By this change, the table now fits the 1c width and we can get rid
> of \OneColumnHSpace{}.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> On Sun, 27 Oct 2019 10:09:22 -0700, Paul E. McKenney wrote:
> 
> > Another thing would be to make the "Algorithms" heading be something
> > like "Algorithms: \co{count_*.c}", then trim the leading "count_" and
> > trailing ".c" from each row's first column.  Would that make sense?
> 
> This patch manages to do the tweak.
> It might be over-engineering to do this level of tuning in the header.
> But at least it looks much better than what it would do without using
> \multirow{} and "picture" environment.

Completely agreed, so queued and pushed, thank you!

> As you said, there might be alternative to do this at a higher level
> of LaTeX code. I'll see to it (with lower priority).

The strange thing is that \multirow seems to want \picture.  But yes,
as you say, lower priority.

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> --
>  count/count.tex | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index 1a8d7bf3..3820a551 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -2817,36 +2817,40 @@ will expand on these lessons.
>  \rowcolors{4}{}{lightgray}
>  \renewcommand*{\arraystretch}{1.1}
>  \small
> -\centering\OneColumnHSpace{-.35in}
> +\centering
>  \newcommand{\NA}{\cellcolor{white}}
>  \begin{tabular}{lrcS[table-format=2.1]S[table-format=3.0]S[table-format=4.0]
>  		  S[table-format=6.0]S[table-format=6.0]}
>  	\toprule
> -	& & \multirow{2}{*}{\begin{picture}(6,50)(0,-24)\rotatebox{90}{Exact?}\end{picture}} &
> -		\multicolumn{1}{c}{Updates} & \multicolumn{4}{c}{Reads (ns)} \\
> +	\multirow{2}{*}{\begin{picture}(60,15)(0,-3)\put(0,0){Algorithm}
> +			\put(14,-10){(\path{count_*.c})}\end{picture}} &
> +	    & \multirow{2}{*}{\begin{picture}(6,50)(0,-24)\rotatebox{90}{Exact?}\end{picture}} &
> +		\multicolumn{1}{c}{\multirow{2}{*}{\begin{picture}(30,15)(0,-3)
> +			\put(0,0){Updates}\put(15,-10){(ns)}\end{picture}}} &
> +			\multicolumn{4}{c}{Reads (ns)} \\
>  	\cmidrule{5-8}
> -	Algorithm & Section & & \multicolumn{1}{c}{(ns)} &
> +	    & Section & & &
>  				   \multicolumn{1}{r}{1 CPU} &
>  				      \multicolumn{1}{r}{8 CPUs} &
>  					 \multicolumn{1}{r}{64 CPUs} &
>  					    \multicolumn{1}{r}{420 CPUs} \\
>  		\midrule
> -		\path{count_stat.c} & \ref{sec:count:Array-Based Implementation} & \NA &
> +		\path{stat} & \ref{sec:count:Array-Based Implementation} & \NA &
>  		 6.3 & 294 & 303   & 315     &    612 \\
> -	\path{count_stat_eventual.c} & \ref{sec:count:Eventually Consistent Implementation} & \NA &
> +	\path{stat_eventual} & \ref{sec:count:Eventually Consistent Implementation} & \NA &
>  		 6.4 &   1 &   1   &   1     &      1 \\
> -	\path{count_end.c} & \ref{sec:count:Per-Thread-Variable-Based Implementation} & \NA &
> +	\path{end} & \ref{sec:count:Per-Thread-Variable-Based Implementation} & \NA &
>  		 2.9 & 301 & 6 309 & 147 594 & 239 683 \\
> -	\path{count_end_rcu.c} & \ref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters} & \NA &
> +	\path{end_rcu} & \ref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters} & \NA &
>  		 2.9 & 454 &   481 &     508 &   2 317 \\
>  	\midrule
> -	\path{count_lim.c} & \ref{sec:count:Simple Limit Counter Implementation} &
> +	\path{lim} & \ref{sec:count:Simple Limit Counter Implementation} &
>  		N &  3.2 & 435 & 6 678 & 156 175 & 239 422 \\
> -	\path{count_lim_app.c} & \ref{sec:count:Approximate Limit Counter Implementation} &
> +	\path{lim_app} & \ref{sec:count:Approximate Limit Counter Implementation} &
>  		N &  2.4 & 485 & 7 041 & 173 108 & 239 682 \\
> -	\path{count_lim_atomic.c} & \ref{sec:count:Atomic Limit Counter Implementation} &
> +	\path{lim_atomic} & \ref{sec:count:Atomic Limit Counter Implementation} &
>  		Y & 19.7 & 513 & 7 085 & 199 957 & 239 450 \\
> -	\path{count_lim_sig.c} & \ref{sec:count:Signal-Theft Limit Counter Implementation} &
> +	\path{lim_sig} & \ref{sec:count:Signal-Theft Limit Counter Implementation} &
>  		Y &  4.7 & 519 & 6 805 & 120 000 & 238 811 \\
>  	\bottomrule
>  \end{tabular}
> -- 
> 2.17.1
> 
> 
