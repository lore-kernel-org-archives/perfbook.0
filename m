Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e17.ny.us.ibm.com ([129.33.205.207]:57845 "EHLO
 e17.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751153AbcDCN47 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 3 Apr 2016
 09:56:59 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 3 Apr 2016
 09:56:58 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 68F5A38C8039
 for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 09:56:55 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u33DutEi42205228	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 13:56:55 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u33DusDB024427	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 09:56:55 -0400
Date: Sun, 3 Apr 2016 06:56:54 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/6] advsync: Fix trivial typos
Message-ID: <20160403135654.GA5835@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
 <1459556911-11538-2-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459556911-11538-2-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: dhowells@redhat.com, perfbook@vger.kernel.org

On Sat, Apr 02, 2016 at 09:28:26AM +0900, SeongJae Park wrote:
> This commit fixes trivial typos under `advsync/` directory.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued, thank you!

							Thanx, Paul

> ---
>  advsync/advsync.tex        | 4 ++--
>  advsync/memorybarriers.tex | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/advsync/advsync.tex b/advsync/advsync.tex
> index 7250e96..118dc74 100644
> --- a/advsync/advsync.tex
> +++ b/advsync/advsync.tex
> @@ -30,7 +30,7 @@ gives a brief overview of non-blocking synchronization.
> 
>  Although locking is the workhorse of parallelism in production, in
>  many situations performance, scalability, and real-time response can
> -all be greatly improved though use of lockless techniques.
> +all be greatly improved through use of lockless techniques.
>  A particularly impressive example of such a lockless technique are
>  the statistical counters describe in
>  Section~\ref{sec:count:Statistical Counters},
> @@ -45,7 +45,7 @@ Other examples we have covered include:
>  	Section~\ref{sec:SMPdesign:Resource Allocator Caches}.
>  \item	The maze solver in Section~\ref{sec:SMPdesign:Beyond Partitioning}.
>  \item	The data-ownership techniques described in
> -	Section~\ref{chp:Data Ownership}.
> +	Chapter~\ref{chp:Data Ownership}.
>  \item	The reference-counting and RCU techinques described in
>  	Chapter~\ref{chp:Deferred Processing}.
>  \item	The lookup code paths described in Chapter~\ref{chp:Data Structures}.
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 99e074d..c668f3c 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -759,7 +759,7 @@ these combinations in order to fully understand how this works.
>  	it is not possible for one of the loads to see the
>  	results of the other load.
>  	However, if we know that CPU~2's load from B returned a
> -	newer value than CPU~1's load from B, the we also know
> +	newer value than CPU~1's load from B, then we also know
>  	that CPU~2's load from A returned either the same value
>  	as CPU~1's load from A or some later value.
> 
> @@ -1047,7 +1047,7 @@ a few simple rules:
>  	by the first CPU, then the second CPU's load from A must
>  	give the value stored by the first CPU.
>  \item	If one CPU does a load from A ordered before a store to B,
> -	and if a second CPU does a load from B ordered before a store from A,
> +	and if a second CPU does a load from B ordered before a store to A,
>  	and if the second CPU's load from B gives the value stored by
>  	the first CPU, then the first CPU's load from A must \emph{not}
>  	give the value stored by the second CPU.
> -- 
> 1.9.1
> 

