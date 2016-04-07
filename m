Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:57123 "EHLO
 e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1754124AbcDGVFm (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 7 Apr 2016
 17:05:42 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 7 Apr 2016
 17:05:41 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 7F8706E8040
 for <perfbook@vger.kernel.org>; Thu, 7 Apr 2016 16:52:27 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u37L5cpn32899126	for <perfbook@vger.kernel.org>; Thu, 7 Apr 2016 21:05:38 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u37L5bE3018690	for <perfbook@vger.kernel.org>; Thu, 7 Apr 2016 17:05:37 -0400
Date: Thu, 7 Apr 2016 14:05:40 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: use latex reference feature consistently
Message-ID: <20160407210540.GQ31142@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <alpine.DEB.2.10.1604040728190.22948@hxeon>
 <1459722821-9548-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459722821-9548-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 04, 2016 at 07:33:41AM +0900, SeongJae Park wrote:
> References to other sections in `Advanced Synchronization` chapter use
> latex reference feature and section name direct citation inconsistently.
> Because most other parts are using latex reference feature and it is
> easier for document maintainance, it would be better to use latex
> reference feature only.  For the reason, this commit enforces latex
> reference feature to the references.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued both, thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 47d910a..3f5c293 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -1454,7 +1454,8 @@ memory system as time progresses.  All stores before a write barrier will
>  occur in the sequence \emph{before} all the stores after the write barrier.
> 
>  $\dagger$ Note that write barriers should normally be paired with read
> -or data dependency barriers; see the ``SMP barrier pairing'' subsection.
> +or data dependency barriers; see the
> +Section~\ref{sec:advsync:SMP Barrier Pairing}.
> 
>  \paragraph{Data Dependency Barriers}
> 
> @@ -1479,19 +1480,19 @@ time the barrier completes, the effects of all the stores prior to that
>  touched by the load will be perceptible to any loads issued after the data
>  dependency barrier.
> 
> -See the ``Examples of memory barrier sequences'' subsection for diagrams
> -showing the ordering constraints.
> +See the Section~\ref{sec:advsync:Examples of Memory Barrier Pairings} for
> +diagrams showing the ordering constraints.
> 
>  $\dagger$ Note that the first load really has to have a
>  \emph{data} dependency and
>  not a control dependency.  If the address for the second load is dependent
>  on the first load, but the dependency is through a conditional rather than
>  actually loading the address itself, then it's a \emph{control} dependency and
> -a full read barrier or better is required.  See the ``Control dependencies''
> -subsection for more information.
> +a full read barrier or better is required.  See the
> +Section~\ref{sec:advsync:Control Dependencies} for more information.
> 
>  $\dagger$ Note that data dependency barriers should normally be paired with
> -write barriers; see the ``SMP barrier pairing'' subsection.
> +write barriers; see the Section~\ref{sec:advsync:SMP Barrier Pairing}.
> 
>  \paragraph{Read Memory Barriers}
> 
> @@ -1593,7 +1594,8 @@ of the confines of a given architecture:
>  \item	There is no guarantee that a CPU will see the correct order
>  	of effects from a second CPU's accesses, even \emph{if} the second CPU
>  	uses a memory barrier, unless the first CPU \emph{also} uses a matching
> -	memory barrier (see the subsection on ``SMP Barrier Pairing'').
> +	memory barrier (see the
> +	Section~\ref{sec:advsync:SMP Barrier Pairing}).
>  \item	There is no guarantee that some intervening piece of off-the-CPU
>  	hardware\footnote{
>  		This is of concern primarily in operating-system kernels.
> -- 
> 1.9.1
> 

