Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53732 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751894AbdGBVPa (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 2 Jul 2017 17:15:30 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v62LDkpi003186
 for <perfbook@vger.kernel.org>; Sun, 2 Jul 2017 17:15:29 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2bf29bhss7-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 02 Jul 2017 17:15:29 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 2 Jul 2017
 17:15:29 -0400
Date: Sun, 2 Jul 2017 09:19:37 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Use 'row' instead of 'line' to call out a step
 in table
Reply-To: paulmck@linux.vnet.ibm.com
References: <efd2d1f1-d467-0769-3bf3-75dde25f9b14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efd2d1f1-d467-0769-3bf3-75dde25f9b14@gmail.com>
Message-Id: <20170702161937.GV2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jul 02, 2017 at 11:41:48PM +0900, Akira Yokosawa wrote:
> >From 1315115293f36eaebae2bac534bb6d441b7bc92c Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 2 Jul 2017 23:20:45 +0900
> Subject: [PATCH] advsync: Use 'row' instead of 'line' to call out a step in table
> 
> Commit 4b1ae9491679 ("advsync: Explain how store buffers can result
> in misordering") used "line" to call out a step in the table "Memory
> Misordering: Store-Buffering Sequence of Events".
> However, "line" implies a line in a code snippet. Using "row" makes
> it clear it is in a table.
> 
> Also fix a typo: "compilers directives" -> "compiler directives"
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

That makes a lot of sense, thank you!  Queued and pushed.

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 9c8d005..5804a30 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -203,16 +203,16 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
> 
>  Table~\ref{tab:advsync:Memory Misordering: Store-Buffering Sequence of Events}
>  shows how this memory misordering can happen.
> -Line~1 shows the initial state, where CPU~0 has \co{x1} in its cache
> +Row~1 shows the initial state, where CPU~0 has \co{x1} in its cache
>  and CPU~1 has \co{x0} in its cache, both variables having a value of zero.
> -Line~2 shows the state change due to each CPU's store (lines~9 and~18 of
> +Row~2 shows the state change due to each CPU's store (lines~9 and~18 of
>  Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}).
>  Because neither CPU has the stored-to variable in its cache, both CPUs
>  record their stores in their respective store buffers.
> 
>  \QuickQuiz{}
>  	But wait!!!
> -	On line~2 of
> +	On row~2 of
>  	Table~\ref{tab:advsync:Memory Misordering: Store-Buffering Sequence of Events}
>  	both \co{x0} and \co{x1} each have two values at the same time,
>  	namely zero and two.
> @@ -226,7 +226,7 @@ record their stores in their respective store buffers.
>  	Section~\ref{sec:advsync:Variables Can Have More Than One Value}!
>  } \QuickQuizEnd
> 
> -Line~3 shows the two reads (lines~10 and~19 of
> +Row~3 shows the two reads (lines~10 and~19 of
>  Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}).
>  Because the variable being read by each CPU is in that CPU's cache,
>  each read immediately returns the cached value, which in both cases
> @@ -242,12 +242,12 @@ to the variable in its store buffer, but without disturbing any
>  other part of the cacheline.
>  Each CPU must also ensure that the cacheline is not present in any other
>  CPU's cache, for which a read-invalidate operation is used.
> -As shown on line 4, after both read-invalidate operations complete,
> +As shown on row~4, after both read-invalidate operations complete,
>  the two CPUs have traded cachelines, so that CPU~0's cache now contains
>  \co{x0} and CPU~1's cache now contains \co{x1}.
>  Once these two variables are in their new homes, each CPU can flush
>  its store buffer into the corresponding cache line, leaving each
> -variable with its final value as shown on line~5.
> +variable with its final value as shown on row~5.
> 
>  \QuickQuiz{}
>  	But don't the values also need to be flushed from the cache
> @@ -266,7 +266,7 @@ counter-intuitive memory misordering.
> 
>  But what do you do if your algorithm really needs its memory
>  references to be ordered?
> -It turns out that there are compilers directives and standard
> +It turns out that there are compiler directives and standard
>  synchronization primitives (such as locking and RCU)
>  that are responsible for maintaining the illusion of ordering through use of
>  \emph{memory barriers} (for example, \co{smp_mb()} in the Linux kernel).
> -- 
> 2.7.4
> 

