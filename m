Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39591 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1752434AbcGYAAv (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 24
 Jul 2016 20:00:51 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6ONxSpM021737
 for <perfbook@vger.kernel.org>; Sun, 24 Jul 2016 20:00:50 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 24c1fhjgf6-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sun,
 24 Jul 2016 20:00:50 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 24 Jul
 2016 20:00:49 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 1455838C8041
 for <perfbook@vger.kernel.org>; Sun, 24 Jul 2016 20:00:48 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6P00q6d56295602	for <perfbook@vger.kernel.org>; Mon, 25 Jul 2016 00:00:52
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6P00lrG020974	for <perfbook@vger.kernel.org>; Sun, 24 Jul 2016 20:00:47
 -0400
Date: Sun, 24 Jul 2016 17:01:16 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] defer: Trivial typo fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <ac22178a-c6c7-14b5-729a-babf4e5ae742@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac22178a-c6c7-14b5-729a-babf4e5ae742@gmail.com>
Message-Id: <20160725000116.GX7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jul 24, 2016 at 05:39:02PM +0900, Akira Yokosawa wrote:
> >From 2d28ff4da3cab75f5a7c771bc49d22e20102ee45 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 24 Jul 2016 17:21:40 +0900
> Subject: [PATCH] defer: Trivial typo fixes
> 
> This commit fixes trivial typos found in Chapter 9.
> It also fixes a redundant blank line at the end of
> Quick Quiz 9.45's Answer.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good stuff!  Mostly queued and pushed, please see comments interspersed
for the few hunks I dropped from this patch before applying.

							Thanx, Paul

> ---
>  defer/defer.tex          | 4 ++--
>  defer/hazptr.tex         | 8 ++++----
>  defer/rcuapi.tex         | 4 ++--
>  defer/rcufundamental.tex | 2 +-
>  defer/refcnt.tex         | 2 +-
>  defer/toyrcu.tex         | 6 +++---
>  6 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/defer/defer.tex b/defer/defer.tex
> index 3c0aff1..bb1e679 100644
> --- a/defer/defer.tex
> +++ b/defer/defer.tex
> @@ -15,7 +15,7 @@ out-scales industriousness!
>  These performance and scalability benefits stem from the fact that
>  deferring work often enables weakening of synchronization primitives,
>  thereby reducing synchronization overhead.
> -General approaches work deferral include
> +General approaches of work deferral include
>  reference counting (Section~\ref{sec:defer:Reference Counting}),
>  hazard pointers (Section~\ref{sec:defer:Hazard Pointers}),
>  sequence locking (Section~\ref{sec:defer:Sequence Locks}),
> @@ -51,7 +51,7 @@ The value looked up and returned will also be a simple integer,
>  so that the data structure is as shown in
>  Figure~\ref{fig:defer:Pre-BSD Packet Routing List}, which
>  directs packets with address~42 to interface~1, address~56 to
> -interface~2, and address~17 to interface~7.
> +interface~3, and address~17 to interface~7.
>  Assuming that external packet network is stable,
>  this list will be searched frequently and updated rarely.
>  In Chapter~\ref{chp:Hardware and its Habits}
> diff --git a/defer/hazptr.tex b/defer/hazptr.tex
> index 456f4f0..1082ddd 100644
> --- a/defer/hazptr.tex
> +++ b/defer/hazptr.tex
> @@ -164,7 +164,7 @@ structure until after they have acquired all relevant hazard pointers.
>  } \QuickQuizEnd
> 
>  These restrictions result in great benefits to readers, courtesy of the
> -fact that the hazard pointers are stored local to each CPU/thread,
> +fact that the hazard pointers are stored local to each CPU or thread,
>  which in turn allows traversals of the data structures themselves to
>  be carried out in a completely read-only fashion.
>  Referring back to
> @@ -304,7 +304,7 @@ Figure~\ref{fig:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete},
>  line~11 initializes \co{->re_freed},
>  lines~32 and~33 poison the \co{->re_next} field of the newly removed
>  object, and
> -line~35 passes that object to the hazard pointers's
> +line~35 passes that object to the hazard pointers'

I agree that this one is just plain weird, but...

The name of the technique is "hazard pointers", not "hazard pointer".
So the possessive is, believe it or not, "hazard pointers's".  Now,
there is the alternative "of hazard pointers" for of possessive, but
the rearrangement required to make this work seemed a bit awkward to me.

Anyway, I dropped this hunk.

>  \co{hazptr_free_later()} function, which will free that object once it
>  is safe to do so.
>  The spinlocks work the same as in
> @@ -326,7 +326,7 @@ hazard pointers still require readers to do writes to shared
>  memory (albeit with much improved locality of reference),
>  and also require a full memory barrier and retry check for each
>  object traversed.
> -Therefore, hazard pointers's performance is far short of ideal.
> +Therefore, hazard pointers' performance is far short of ideal.

And this one.

>  On the other hand, hazard pointers do operate correctly for workloads
>  involving concurrent updates.
> 
> @@ -347,7 +347,7 @@ involving concurrent updates.
>  	face a larger memory-barrier penalty in this workload than in
>  	that of the ``Structured Deferral'' paper.
>  	Finally, that paper used a larger and older x86 system, while
> -	a newer but smaller system that was used to generate the data
> +	a newer but smaller system was used to generate the data
>  	shown in
>  	Figure~\ref{fig:defer:Pre-BSD Routing Table Protected by Hazard Pointers}.
> 
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index 183bb8b..71cfd0a 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -173,7 +173,7 @@ which shows the wait-for-RCU-readers portions of the non-sleepable and
>  sleepable APIs, respectively,
>  and by
>  Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
> -which shows the publish/subscribe portions of the API.
> +which shows the publish-subscribe portions of the API.
> 
>  If you are new to RCU, you might consider focusing on just one
>  of the columns in
> @@ -435,7 +435,7 @@ returns a value that must be passed into the corresponding
>  \caption{Multistage SRCU Deadlocks}
>  \label{fig:defer:Multistage SRCU Deadlocks}
>  \end{figure}
> -
> +%
>  } \QuickQuizEnd
> 
>  The Linux kernel currently has a surprising number of RCU APIs and
> diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> index da71d42..9648f78 100644
> --- a/defer/rcufundamental.tex
> +++ b/defer/rcufundamental.tex
> @@ -169,7 +169,7 @@ Clearly, we need to prevent this sort of skullduggery on the
>  part of both the compiler and the CPU.
>  The \co{rcu_dereference()} primitive uses
>  whatever memory-barrier instructions and compiler
> -directives are required for this purpose:\footnote{
> +directives required for this purpose:\footnote{

This one was correct beforehand.  If you don't like this formulation,
one alternative to "whataver ... are required" is "any ... that are
required".  There are several other alternatives as well.

>  	In the Linux kernel, \co{rcu_dereference()} is implemented via
>  	a volatile cast, and, on DEC Alpha, a memory barrier instruction.
>  	In the C11 and C++11 standards, \co{memory_order_consume}
> diff --git a/defer/refcnt.tex b/defer/refcnt.tex
> index ab0b9be..4988d24 100644
> --- a/defer/refcnt.tex
> +++ b/defer/refcnt.tex
> @@ -205,7 +205,7 @@ single-socket four-core hyperthreaded 2.5GHz x86 system.
>  The ``ideal'' trace was generated by running the sequential code shown in
>  Figure~\ref{fig:defer:Sequential Pre-BSD Routing Table}.
>  The reference-counting performance is abysmal and its scalability even
> -more so, with the ``refcnt'' trace dropping down onto the x~axis.
> +more so, with the ``refcnt'' trace dropping down onto the x-axis.
>  This should be no surprise in view of
>  Chapter~\ref{chp:Hardware and its Habits}:
>  The reference-count acquisitions and releases have added frequent
> diff --git a/defer/toyrcu.tex b/defer/toyrcu.tex
> index a1db87a..2da202b 100644
> --- a/defer/toyrcu.tex
> +++ b/defer/toyrcu.tex
> @@ -721,7 +721,7 @@ of the single-counter variant shown in
>  Figure~\ref{fig:defer:RCU Implementation Using Single Global Reference Counter},
>  with the read-side primitives consuming about 150~nanoseconds on a single
>  Power5 CPU and almost 40~\emph{microseconds} on a 64-CPU system.
> -The updates-side \co{synchronize_rcu()} primitive is more costly as
> +The update-side \co{synchronize_rcu()} primitive is more costly as
>  well, ranging from about 200~nanoseconds on a single Power5 CPU to
>  more than 40~\emph{microseconds} on a 64-CPU system.
>  This means that the RCU read-side critical sections
> @@ -1264,7 +1264,7 @@ thread-local accesses to one, as is done in the next section.
> 
>  Figure~\ref{fig:defer:Free-Running Counter Using RCU}
>  (\path{rcu.h} and \path{rcu.c})
> -show an RCU implementation based on a single global free-running counter
> +shows an RCU implementation based on a single global free-running counter
>  that takes on only even-numbered values, with data shown in
>  Figure~\ref{fig:defer:Data for Free-Running Counter Using RCU}.
>  The resulting \co{rcu_read_lock()} implementation is extremely
> @@ -1781,7 +1781,7 @@ re-ordered with the lines~12-13.
> 
>  \QuickQuiz{}
>  	Doesn't the additional memory barrier shown on line~14 of
> -	Figure~\ref{fig:defer:Quiescent-State-Based RCU Read Side},
> +	Figure~\ref{fig:defer:Quiescent-State-Based RCU Read Side}
>  	greatly increase the overhead of \co{rcu_quiescent_state}?
>  \QuickQuizAnswer{
>  	Indeed it does!
> -- 
> 1.9.1
> 

