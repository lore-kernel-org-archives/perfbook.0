Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e35.co.us.ibm.com ([32.97.110.153]:49836 "EHLO
 e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1753581AbcDCNwR (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 3 Apr 2016
 09:52:17 -0400
Received: from localhost	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 3 Apr 2016
 07:52:16 -0600
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 846BE3E4001C	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 07:52:13 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u33DqDE437421078	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 13:52:13 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u33DqCEx014643	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 09:52:12 -0400
Date: Sun, 3 Apr 2016 06:52:11 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/6] advsync: fix latex syntax related typos
Message-ID: <20160403135211.GM3663@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
 <1459556911-11538-3-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459556911-11538-3-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: dhowells@redhat.com, perfbook@vger.kernel.org

On Sat, Apr 02, 2016 at 09:28:27AM +0900, SeongJae Park wrote:
> This commit fixes typos related with latex.  The typos include:
> unnecessarily doubly inserted commas, missed tildes, missed dots,
> wrongly located dot and question mark, unwrapped citation.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Some good ones, and some that I cannot accept.  Could you please resubmit
as noted below?

							Thanx, Paul

> ---
>  advsync/advsync.tex        |  4 ++--
>  advsync/memorybarriers.tex | 22 +++++++++++-----------
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/advsync/advsync.tex b/advsync/advsync.tex
> index 118dc74..12bacbf 100644
> --- a/advsync/advsync.tex
> +++ b/advsync/advsync.tex
> @@ -78,14 +78,14 @@ basis of real-time programming:
>  \begin{enumerate}
>  \item	Real-time forward-progress guarantees usually have some
>  	definite time associated with them, for example,
> -	``scheduling latency must be less than 100 microseconds.''
> +	``scheduling latency must be less than 100 microseconds.''.

We should have be period either before or after the quates, not both.
The exception would be if the quotes contained a computer command that
ended with a period.

>  	In contrast, the most popular forms of NBS only guarantees
>  	that progress will be made in finite time, with no definite
>  	bound.
>  \item	Real-time forward-progress guarantees are sometimes
>  	probabilistic, as in the soft-real-time guarantee that
>  	``at least 99.9\% of the time, scheduling latency must
> -	be less than 100 microseconds.''
> +	be less than 100 microseconds.''.

Ditto.

>  	In contrast, NBS's forward-progress
>  	guarantees have traditionally been unconditional.
>  \item	Real-time forward-progress guarantees are often conditioned on
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index c668f3c..15de36a 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -37,7 +37,7 @@ appears to guarantee that the assertion never fires.
>  After all, if \co{r1 != 1}, we might hope that Thread~1's load from \co{y}
>  must have happened before Thread~2's store to \co{y}, which might raise
>  further hopes that Thread~2's load from \co{x} must happen after
> -Thread 1's store to \co{x}, so that \co{r2 == 1}, as required by the
> +Thread~1's store to \co{x}, so that \co{r2 == 1}, as required by the

This is fine.

>  assertion.
>  The example is symmetric, so similar hopeful reasoning might lead
>  us to hope that \co{r2 != 1} guarantees that \co{r1 == 1}.
> @@ -295,7 +295,7 @@ over a 532-nanosecond time period, as shown in
>  Figure~\ref{fig:advsync:A Variable With Multiple Simultaneous Values}.
>  This data was collected on 1.5GHz POWER5 system with 8 cores, each containing
>  a pair of hardware threads.
> -CPUs~1, 2, 3, and 4 recorded the values, while CPU 0 controlled the test.
> +CPUs~1, 2, 3, and 4 recorded the values, while CPU~0 controlled the test.

This is a good change, but should have "and~4" as well.

>  The timebase counter period was about 5.32ns, sufficiently fine-grained
>  to allow observations of intermediate cache states.
> 
> @@ -320,7 +320,7 @@ CPU~4 believes that the value is ``4'' for almost 500ns.
> 
>  \QuickQuiz{}
>  	How could CPUs possibly have different views of the
> -	value of a single variable \emph{at the same time?}
> +	value of a single variable \emph{at the same time}?

It looks better if the question mark has the same itailics state
as the word immediately preceding it, so this should remain as is.

>  \QuickQuizAnswer{
>  	Many CPUs have write buffers that record the values of
>  	recent writes, which are applied once the corresponding
> @@ -459,8 +459,8 @@ For example, in the following set of operations, CPU~1's access to
>  A does not unconditionally precede its access to B from the viewpoint
>  of an external logic analyzer
>  \IfInBook{(see Appendix~\ref{chp:app:whymb:Why Memory Barriers?}
> -	  for examples).
> -	 }
> +	  for examples)
> +	 }.

Aren't the "then" and "else" clauses supposed to be right next to each
other?  I don't believe this change works.

>  	 {(the system is only to act \emph{as if} the accesses
>  	  are in order; it is not necessarily required to actually
>  	  force them to be in order).}
> @@ -1037,10 +1037,10 @@ a few simple rules:
>  		for example, if a given CPU never loaded or stored
>  		the shared variable, then it can have no opinion about
>  		that variable's value.}
> -\item	If one CPU does ordered stores to variables A and B,\footnote{
> +\item	If one CPU does ordered stores to variables A and B\footnote{
>  		For example, by executing the store to A, a
>  		memory barrier, and then the store to B.},
> -	and if a second CPU does ordered loads from B and A,\footnote{
> +	and if a second CPU does ordered loads from B and A\footnote{

The footnote should be after the comma, otherwise the spacing looks
strange.  (Might be different in Korean, of course.)

>  		For example, by executing the load from B, a
>  		memory barrier, and then the load from A.},
>  	then if the second CPU's load from B gives the value stored
> @@ -1903,9 +1903,9 @@ In the above example, CPU~2 perceives that \co{B} is 7,
>  despite the load of \co{*C}
>  (which would be \co{B}) coming after the \co{LOAD} of \co{C}.
> 
> -If, however, a data dependency barrier were to be placed between the load of C
> -and the load of \co{*C} (i.e.: \co{B}) on CPU~2, again with initial values of
> -{\tt \{B = 7, X = 9, Y = 8, C = \&Y\}}:
> +If, however, a data dependency barrier were to be placed between the load of
> +\co{C} and the load of \co{*C} (i.e.: \co{B}) on CPU~2, again with initial
> +values of {\tt \{B = 7, X = 9, Y = 8, C = \&Y\}}:

This one looks good.

>  \vspace{5pt}
>  \begin{minipage}[t]{\columnwidth}
> @@ -2002,7 +2002,7 @@ Figure~\ref{fig:advsync:Read Barrier Supplied}.
>  \end{figure*}
> 
>  To illustrate this more completely, consider what could happen if the code
> -contained a load of A either side of the read barrier, once again
> +contained a load of \co{A} either side of the read barrier, once again

This one does too.

>  with the same initial values of
>  {\tt \{A = 0, B = 9\}}:
> 
> -- 
> 1.9.1
> 

