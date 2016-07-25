Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15895 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1752656AbcGYQSM (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Mon, 25 Jul 2016 12:18:12 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6PGE7pm111692
 for <perfbook@vger.kernel.org>; Mon, 25 Jul 2016 12:18:11 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24c1h4hctv-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Mon,
 25 Jul 2016 12:18:10 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 25 Jul
 2016 12:18:10 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 828F9C90041
 for <perfbook@vger.kernel.org>; Mon, 25 Jul 2016 12:17:56 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6PGI6vl49872980	for <perfbook@vger.kernel.org>; Mon, 25 Jul 2016 16:18:06
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6PGI6uW026329	for <perfbook@vger.kernel.org>; Mon, 25 Jul 2016 12:18:06
 -0400
Date: Mon, 25 Jul 2016 09:18:36 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Use UK style punctuation order
Reply-To: paulmck@linux.vnet.ibm.com
References: <f8d9e71c-eae4-bc6a-ef50-8fab86e65c80@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8d9e71c-eae4-bc6a-ef50-8fab86e65c80@gmail.com>
Message-Id: <20160725161836.GI7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jul 25, 2016 at 07:36:26PM +0900, Akira Yokosawa wrote:
> >From e4493b424941f1cfe8831c278bc6235d67f4a391 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 25 Jul 2016 17:25:12 +0900
> Subject: [PATCH] Use UK style punctuation order
> 
> This commit replaces American style punctuation order around
> closing quotation marks with the UK style.
> In some cases, it promotes quoted sentences to full ones beginning
> with capital letters.
> 
> (Excerpt from Paul's mail)
> ----
>     Despite being American myself, for this sort of book, the UK approach
>     is better because it removes ambiguities like the following:
> 
>         Type "ls -a," look for the file ".," and file a bug if you
>         don't see it.
> 
>     The following is much more clear:
> 
>         Type "ls -a", look for the file ".", and file a bug if you
>         don't see it.
> ----
> 
> Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied, thank you very much!

							Thanx, Paul

> ---
>  appendix/questions/concurrentparallel.tex |  4 ++--
>  cpu/cpu.tex                               |  2 +-
>  cpu/overview.tex                          |  2 +-
>  datastruct/datastruct.tex                 |  2 +-
>  debugging/debugging.tex                   |  2 +-
>  defer/rcufundamental.tex                  |  4 ++--
>  defer/rcuusage.tex                        |  4 ++--
>  defer/updates.tex                         |  2 +-
>  easy/easy.tex                             |  2 +-
>  formal/axiomatic.tex                      |  2 +-
>  formal/spinhint.tex                       |  2 +-
>  locking/locking.tex                       |  2 +-
>  rt/rt.tex                                 | 16 ++++++++--------
>  together/applyrcu.tex                     |  2 +-
>  together/refcnt.tex                       |  8 ++++----
>  15 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/appendix/questions/concurrentparallel.tex b/appendix/questions/concurrentparallel.tex
> index 663bf36..76b3d8a 100644
> --- a/appendix/questions/concurrentparallel.tex
> +++ b/appendix/questions/concurrentparallel.tex
> @@ -11,7 +11,7 @@ between the two, and it turns out that these distinctions can be
>  understood from a couple of different perspectives.
> 
>  The first perspective treats ``parallel'' as an abbreviation for
> -``data parallel,'' and treats ``concurrent'' as pretty much everything
> +``data parallel'', and treats ``concurrent'' as pretty much everything
>  else.
>  From this perspective, in parallel computing, each partition of the
>  overall problem can proceed completely independently, with no
> @@ -90,7 +90,7 @@ perspective and ``parallel'' by many taking the second perspective.
>  Which is just fine.
>  No rule that humankind writes carries any weight against objective
>  reality, including the rule dividing multiprocessor programs into
> -categories such as ``concurrent'' and ``parallel.''
> +categories such as ``concurrent'' and ``parallel''.
> 
>  This categorization failure does not mean such rules are useless,
>  but rather that you should take on a suitably skeptical frame of mind when
> diff --git a/cpu/cpu.tex b/cpu/cpu.tex
> index f81a40e..6bfdf91 100644
> --- a/cpu/cpu.tex
> +++ b/cpu/cpu.tex
> @@ -3,7 +3,7 @@
> 
>  \QuickQuizChapter{chp:Hardware and its Habits}{Hardware and its Habits}
> 
> -\epigraph{Premature abstraction is the root of all evil}
> +\epigraph{Premature abstraction is the root of all evil.}
>  	 {\emph{A cast of thousands}}
> 
>  Most people have an intuitive understanding that passing messages between
> diff --git a/cpu/overview.tex b/cpu/overview.tex
> index 9972adf..49ca800 100644
> --- a/cpu/overview.tex
> +++ b/cpu/overview.tex
> @@ -100,7 +100,7 @@ single-cycle access.\footnote{
>  In 2008, CPU designers still can construct a 4KB memory with single-cycle
>  access, even on systems with multi-GHz clock frequencies.
>  And in fact they frequently do construct such memories, but they now
> -call them ``level-0 caches,'' and they can be quite a bit bigger than 4KB.
> +call them ``level-0 caches'', and they can be quite a bit bigger than 4KB.
> 
>  \begin{figure}[htb]
>  \centering
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 978e4a5..da735ae 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -1684,7 +1684,7 @@ one.
>  Is it possible to create an RCU-protected resizable hash table that
>  makes do with just one pair?
> 
> -It turns out that the answer is ``yes.''
> +It turns out that the answer is ``yes''.
>  Josh Triplett et al.~\cite{Triplett:2011:RPHash}
>  produced a \emph{relativistic hash table} that incrementally
>  splits and combines corresponding hash chains so that readers always
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index bf42a70..b8156c8 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -1072,7 +1072,7 @@ So suppose that a given test has been failing 10\% of the time.
>  How many times do you have to run the test to be 99\% sure that
>  your supposed fix has actually improved matters?
> 
> -Another way to ask this question is ``how many times would we need
> +Another way to ask this question is ``How many times would we need
>  to run the test to cause the probability of failure to rise above 99\%?''
>  After all, if we were to run the test enough times that the probability
>  of seeing at least one failure becomes 99\%, if there are no failures,
> diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> index da71d42..54a8840 100644
> --- a/defer/rcufundamental.tex
> +++ b/defer/rcufundamental.tex
> @@ -45,8 +45,8 @@ zero overhead.
>  	of concurrent RCU updaters.
>  } \QuickQuizEnd
> 
> -This leads to the question ``what exactly is RCU?'', and perhaps also
> -to the question ``how can RCU \emph{possibly} work?'' (or, not
> +This leads to the question ``What exactly is RCU?'', and perhaps also
> +to the question ``How can RCU \emph{possibly} work?'' (or, not
>  infrequently, the assertion that RCU cannot possibly work).
>  This document addresses these questions from a fundamental viewpoint;
>  later installments look at them from usage and from API viewpoints.
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index 619f968..51d492e 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -30,7 +30,7 @@ Wait for things to finish &
>  \label{tab:defer:RCU Usage}
>  \end{table}
> 
> -This section answers the question ``what is RCU?'' from the viewpoint
> +This section answers the question ``What is RCU?'' from the viewpoint
>  of the uses to which RCU can be put.
>  Because RCU is most frequently used to replace some existing mechanism,
>  we look at it primarily in terms of its relationship to such mechanisms,
> @@ -839,7 +839,7 @@ these restrictions, and as to how they can best be handled.
>  \label{sec:defer:RCU is a Poor Man's Garbage Collector}
> 
>  A not-uncommon exclamation made by people first learning about
> -RCU is ``RCU is sort of like a garbage collector!''.
> +RCU is ``RCU is sort of like a garbage collector!''
>  This exclamation has a large grain of truth, but it can also be
>  misleading.
> 
> diff --git a/defer/updates.tex b/defer/updates.tex
> index 4642a15..c6ae836 100644
> --- a/defer/updates.tex
> +++ b/defer/updates.tex
> @@ -22,7 +22,7 @@ OpLog, which he has applied to
>  Linux-kernel pathname lookup, VM reverse mappings, and the \co{stat()} system
>  call~\cite{SilasBoydWickizerPhD}.
> 
> -Another approach, called ``Disruptor,'' is designed for applications
> +Another approach, called ``Disruptor'', is designed for applications
>  that process high-volume streams of input data.
>  The approach is to rely on single-producer-single-consumer FIFO queues,
>  minimizing the need for synchronization~\cite{AdrianSutton2013LCA:Disruptor}.
> diff --git a/easy/easy.tex b/easy/easy.tex
> index 05b2c5a..3ca7eb2 100644
> --- a/easy/easy.tex
> +++ b/easy/easy.tex
> @@ -243,7 +243,7 @@ containing only one element!
>  	given that each philosopher requires two forks at a time to eat,
>  	one is supposed to come up with a fork-allocation algorithm that
>  	avoids deadlock.
> -	Paul's response was ``Sheesh!  Just get five more forks!''.
> +	Paul's response was ``Sheesh!  Just get five more forks!''
> 
>  	This in itself was OK, but Paul then applied this same solution to
>  	circular linked lists.
> diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
> index bb10338..cc420cf 100644
> --- a/formal/axiomatic.tex
> +++ b/formal/axiomatic.tex
> @@ -68,7 +68,7 @@ Alglave et al.~\cite{Alglave:2014:HCM:2594291.2594347},
>  which creates a set of axioms to represent the memory model and then
>  converts litmus tests to theorems that might be proven or disproven
>  over this set of axioms.
> -The resulting tool, called ``herd,''  conveniently takes as input the
> +The resulting tool, called ``herd'',  conveniently takes as input the
>  same litmus tests as PPCMEM, including the IRIW litmus test shown in
>  Figure~\ref{fig:formal:IRIW Litmus Test}.
> 
> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
> index 1f7140c..a5cc151 100644
> --- a/formal/spinhint.tex
> +++ b/formal/spinhint.tex
> @@ -16,7 +16,7 @@ comparison of Promela syntax to that of C.
>  Section~\ref{sec:formal:Promela Example: Locking}
>  shows how Promela may be used to verify locking,
>  \ref{sec:formal:Promela Example: QRCU}
> -uses Promela to verify an unusual implementation of RCU named ``QRCU,''
> +uses Promela to verify an unusual implementation of RCU named ``QRCU'',
>  and finally
>  Section~\ref{sec:formal:Promela Parable: dynticks and Preemptible RCU}
>  applies Promela to RCU's dyntick-idle implementation.
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 2d887d8..4d4b94b 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -268,7 +268,7 @@ the comparison function is a
>  complicated function involving also locking.
>  How can the library function avoid deadlock?
> 
> -The golden rule in this case is ``release all locks before invoking
> +The golden rule in this case is ``Release all locks before invoking
>  unknown code.''
>  To follow this rule, the \co{qsort()} function must release all
>  locks before invoking the comparison function.
> diff --git a/rt/rt.tex b/rt/rt.tex
> index dbb2c1a..f1ed929 100644
> --- a/rt/rt.tex
> +++ b/rt/rt.tex
> @@ -8,7 +8,7 @@
>  An important emerging area in computing is that of parallel real-time
>  computing.
>  Section~\ref{sec:rt:What is Real-Time Computing?}
> -looks at a number of definitions of ``real-time computing,'' moving
> +looks at a number of definitions of ``real-time computing'', moving
>  beyond the usual sound bites to more meaningful criteria.
>  Section~\ref{sec:rt:Who Needs Real-Time Computing?}
>  surveys the sorts of applications that need real-time response.
> @@ -156,7 +156,7 @@ the real-time application itself.
>  \label{sec:rt:Environmental Constraints}
> 
>  Constraints on the environment address the objection to open-ended
> -promises of response times implied by ``hard real time.''
> +promises of response times implied by ``hard real time''.
>  These constraints might specify permissible operating temperatures,
>  air quality, levels and types of electromagnetic radiation, and, to
>  Figure~\ref{fig:rt:Hard Real-Time Response Guarantee, Meet Hammer}'s
> @@ -510,8 +510,8 @@ large Earth-bound telescopes to de-twinkle starlight;
>  military applications, including the afore-mentioned avionics;
>  and financial-services applications, where the first computer to recognize
>  an opportunity is likely to reap most of the resulting profit.
> -These four areas could be characterized as ``in search of production,''
> -``in search of life,'' 	``in search of death,'' and ``in search of money.''
> +These four areas could be characterized as ``in search of production'',
> +``in search of life'', ``in search of death'', and ``in search of money''.
> 
>  Financial-services applications differ subtlely from applications in
>  the other three categories in that money is non-material, meaning that
> @@ -528,7 +528,7 @@ as described in
>  Section~\ref{sec:rt:Real-World Real-Time Specifications},
>  the unusual nature of these requirements has led some to refer to
>  financial and information-processing applications as ``low latency''
> -rather than ``real time.''
> +rather than ``real time''.
> 
>  Regardless of exactly what we choose to call it, there is substantial
>  need for real-time
> @@ -805,7 +805,7 @@ There has of course been much debate over which of these approaches
>  is best for real-time systems, and this debate has been going on for
>  quite some
>  time~\cite{JonCorbet2004RealTimeLinuxPart1,JonCorbet2004RealTimeLinuxPart2}.
> -As usual, the answer seems to be ``it depends,'' as discussed in the
> +As usual, the answer seems to be ``It depends,'' as discussed in the
>  following sections.
>  Section~\ref{sec:rt:Event-Driven Real-Time Support}
>  considers event-driven real-time systems, and
> @@ -1402,7 +1402,7 @@ workloads and fix any real-time bugs.\footnote{
>  	so that others can benefit.
>  	Keep in mind that when you need to port your application to
>  	a later version of the Linux kernel, \emph{you} will be one of those
> -	``others.''}
> +	``others''.}
> 
>  A sixth source of OS jitter is provided by some in-kernel
>  full-system synchronization algorithms, perhaps most notably
> @@ -1903,7 +1903,7 @@ One rule of thumb uses the following four questions to help you choose:
>  	100 milliseconds to complete?
>  \end{enumerate}
> 
> -If the answer to any of these questions is ``yes,'' you should choose
> +If the answer to any of these questions is ``yes'', you should choose
>  real-fast over real-time, otherwise, real-time might be for you.
> 
>  Choose wisely, and if you do choose real-time, make sure that your
> diff --git a/together/applyrcu.tex b/together/applyrcu.tex
> index 4fbbcb9..981cc50 100644
> --- a/together/applyrcu.tex
> +++ b/together/applyrcu.tex
> @@ -294,7 +294,7 @@ Line~69 can then safely free the old \co{countarray} structure.
>  	to the structure definition, memory allocation, and \co{NULL}
>  	return checking.
> 
> -	Of course, a better question is ``why doesn't the language
> +	Of course, a better question is ``Why doesn't the language
>  	implement cross-thread access to \co{__thread} variables?''
>  	After all, such an implementation would make both the locking
>  	and the use of RCU unnecessary.
> diff --git a/together/refcnt.tex b/together/refcnt.tex
> index 407f569..d9ff656 100644
> --- a/together/refcnt.tex
> +++ b/together/refcnt.tex
> @@ -587,15 +587,15 @@ summarized in the following list.
>  	Returns the integer value of the referenced variable.
>  	This need not be an atomic operation, and it need not issue any
>  	memory-barrier instructions.
> -	Instead of thinking of as ``an atomic read,'' think of it as
> -	``a normal read from an atomic variable.''
> +	Instead of thinking of as ``an atomic read'', think of it as
> +	``a normal read from an atomic variable''.
>  \item	\co{void atomic_set(atomic_t *var, int val);}
>  	Sets the value of the referenced atomic variable to ``val''.
>  	This need not be an atomic operation, and it is not required
>  	to either issue memory
>  	barriers or disable compiler optimizations.
> -	Instead of thinking of as ``an atomic set,'' think of it as
> -	``a normal set of an atomic variable.''
> +	Instead of thinking of as ``an atomic set'', think of it as
> +	``a normal set of an atomic variable''.
>  \item	\co{void call_rcu(struct rcu_head *head, void (*func)(struct rcu_head *head));}
>  	Invokes \co{func(head)} some time after all currently executing RCU
>  	read-side critical sections complete, however, the \co{call_rcu()}
> -- 
> 1.9.1
> 

