Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230225AbhCUPYb (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 21 Mar 2021 11:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616340271;
        bh=hgGcTlnqp2Jvny4GTwKCqvxq4bZO5eOWwGCxE+pCWPs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=QyIdTRiZsSAqsN9ny2qlLhoXlk10j6ykzQGN2yYc7Wc8d99rykaGDur9uTNOwGA9A
         jwDoPwW3ZN1hTZ13xiyosc9SoJdUHFv9jJBdRaq2PWhWDoRUKnj8nWZppx0IIwP56L
         jyt5P+2fTa5j4QEFr3m6p0YWP4+fCfpyhAGwom6rVlXoIAHtkKt8kdRsL1SJXayS6E
         qd7M3hKdGwdHvNhuFBVmKNUJV7YHGcY8cgKK0jE5sJcFecoIQzjmochjUPI7qka2B1
         SGRbD/jgO4nPxYQPZrJ/64NwUxqiIVDH8thBCN22lc1sSgVkB9gC8MovizL9DMJ8Hv
         o8+iv5TtRX7WA==
Date: Sun, 21 Mar 2021 08:24:31 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] future/htm: Remove redundant 'to' from 'WRT
 to' in section headings
Message-ID: <20210321152431.GF2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <2a52dc42-5b2e-326b-2f94-a967e86b12bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a52dc42-5b2e-326b-2f94-a967e86b12bc@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 21, 2021 at 07:17:32PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Paul,
> 
> Not urgent at all, but last minute fixes for the 2nd edition.

Good catch!  Simple enough, I applied it, thank you!

							Thanx, Paul

>        Thanks, Akira
> --
>  future/htm.tex | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/future/htm.tex b/future/htm.tex
> index cf222e5b..242b85f2 100644
> --- a/future/htm.tex
> +++ b/future/htm.tex
> @@ -41,7 +41,7 @@ cache misses, and supporting a fair number of practical applications.
>  However, it always pays to read the fine print, and HTM is no exception.
>  A major point of this section is determining under what conditions HTM's
>  benefits outweigh the complications hidden in its fine print.
> -To this end, \cref{sec:future:HTM Benefits WRT to Locking}
> +To this end, \cref{sec:future:HTM Benefits WRT Locking}
>  describes HTM's benefits and
>  \cref{sec:future:HTM Weaknesses WRT Locking} describes its weaknesses.
>  This is the same approach used in earlier
> @@ -51,7 +51,7 @@ and also in the previous section.\footnote{
>  	discussions with the other authors, Maged Michael, Josh Triplett,
>  	and Jonathan Walpole, as well as with Andi Kleen.}
>  
> -\Cref{sec:future:HTM Weaknesses WRT to Locking When Augmented} then describes
> +\Cref{sec:future:HTM Weaknesses WRT Locking When Augmented} then describes
>  HTM's weaknesses with respect to the combination of synchronization
>  primitives used in the Linux kernel (and in many user-space applications).
>  \Cref{sec:future:Where Does HTM Best Fit In?} looks at where HTM
> @@ -61,8 +61,8 @@ greatly increase HTM's scope and appeal.
>  Finally, \cref{sec:future:Conclusions}
>  presents concluding remarks.
>  
> -\subsection{HTM Benefits WRT to Locking}
> -\label{sec:future:HTM Benefits WRT to Locking}
> +\subsection{HTM Benefits WRT Locking}
> +\label{sec:future:HTM Benefits WRT Locking}
>  
>  The primary benefits of HTM are
>  (1)~its avoidance of the cache misses that are often incurred by
> @@ -144,7 +144,7 @@ Although it is possible to use two-phased locking and hashed arrays
>  of locks to partition general data structures, other techniques
>  have proven preferable~\cite{DavidSMiller2006HashedLocking},
>  as will be discussed in
> -\cref{sec:future:HTM Weaknesses WRT to Locking When Augmented}.
> +\cref{sec:future:HTM Weaknesses WRT Locking When Augmented}.
>  Given its avoidance of synchronization cache misses,
>  HTM is therefore a very real possibility for large non-partitionable
>  data structures, at least assuming relatively small updates.
> @@ -843,7 +843,7 @@ serious shortcomings of locking,\footnote{
>  	deadlock detectors~\cite{JonathanCorbet2006lockdep}, a wealth
>  	of data structures that have been adapted to locking, and
>  	a long history of augmentation, as discussed in
> -	\cref{sec:future:HTM Weaknesses WRT to Locking When Augmented}.
> +	\cref{sec:future:HTM Weaknesses WRT Locking When Augmented}.
>  	In addition, if locking really were as horrible as a quick skim
>  	of many academic papers might reasonably lead one to believe,
>  	where did all the large lock-based parallel programs (both
> @@ -867,8 +867,8 @@ hazard pointers~\cite{MagedMichael04a,HerlihyLM02},
>  and RCU~\cite{McKenney98,McKenney01a,ThomasEHart2007a,PaulEMcKenney2012ELCbattery}.
>  The next section looks at how such augmentation changes the equation.
>  
> -\subsection{HTM Weaknesses WRT to Locking When Augmented}
> -\label{sec:future:HTM Weaknesses WRT to Locking When Augmented}
> +\subsection{HTM Weaknesses WRT Locking When Augmented}
> +\label{sec:future:HTM Weaknesses WRT Locking When Augmented}
>  
>  \input{future/HTMtableRCU}
>  
> -- 
> 2.17.1
> 
