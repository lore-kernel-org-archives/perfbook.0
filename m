Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229894AbhCUFs0 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 21 Mar 2021 01:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616305706;
        bh=w21EA9BBsIOd3+2tpbC+sbVzSVyHVaPWsOKzOK6a0HA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Gs/ATZQ/SmfqP8x39uW3b+Pqp9Bs3yb9I/wvhM+gc8hmL13jchX01YAPcxhunMVDW
         b/UOQkPj7F6eDhw9ZUNht9sSrEwPt4uGiDudUMZ1fDVjo4HMQX2tNCcLSfjj1gyr0F
         ORF09XjEezmjUMk2ixZcW7IS1jwoijsFKYaqj7G4N85mw0B0waJT1/FWuMJvUS2RaZ
         cr5fElbS5AjHoi5l/ayRsKEgYK4LfMo7x0S5EJSfpPjUlmMryEbnTKY9RNAj3lsezN
         M0fTunbQuacIRHcfaOnsaKvkOW+HgeLOsofBkCa7qk9ir9Txhh+aTbZ2dRHNuxsg7b
         sLMqBdG7RslLA==
Date: Sat, 20 Mar 2021 22:48:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 3/3 -perfbook] debugging: Fix typo
Message-ID: <20210321054825.GD2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <85bad10b-4875-b98f-8c3d-547625460817@gmail.com>
 <bafeaad6-181b-e4cf-a2ef-588ea8268f02@gmail.com>
 <c623b30d-a732-1728-eceb-93501a49aa15@gmail.com>
 <20210320192323.GC2696@paulmck-ThinkPad-P72>
 <ef7aaa7b-52b4-8e83-0447-2d9a11338d80@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef7aaa7b-52b4-8e83-0447-2d9a11338d80@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 21, 2021 at 10:03:49AM +0900, Akira Yokosawa wrote:
> On Sat, 20 Mar 2021 12:23:23 -0700, Paul E. McKenney wrote:
> > On Sun, Mar 21, 2021 at 12:50:43AM +0900, Akira Yokosawa wrote:
> >> On Sun, 21 Mar 2021 00:24:46 +0900, Akira Yokosawa wrote:
> >>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>> ---
> >>>  debugging/debugging.tex | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> >>> index fd52d9e7..3f697f58 100644
> >>> --- a/debugging/debugging.tex
> >>> +++ b/debugging/debugging.tex
> >>> @@ -755,7 +755,7 @@ access to data.
> >>>  The Kernel Concurrency Sanitizer (KCSAN)~\cite{JonathanCorbet2019KCSAN}
> >>>  uses existing markings such as \co{READ_ONCE()} and \co{WRITE_ONCE()}
> >>>  to determine which concurrent accesses deserve warning messages.
> >>> -KCSAN has a significant false-positive rate, especially in from the
> >>> +KCSAN has a significant false-positive rate, especially from the
> >>>  viewpoint of developers thinking in terms of C as assembly language
> >>>  with additional syntax.
> >>>  KCSAN therefore provides a \co{data_race()} construct to forgive
> >>>
> >>
> >> Paul,
> >>
> >> I caught this one while searching the usage of "data race" in perfbook.
> >> I thought "data race" also deserves an entry in Glossaries, especially
> >> because our use of "data race" is heavily related to compiler
> >> optimizations and somewhat stricter than the common definition
> >> found on the web.
> >>
> >> The first of data race in Section 4.2.2 (just before QQ4.8) does
> >> not (explicitly) talk about optimizations.
> >>
> >> Would it be possible for you to come up with some concise definition
> >> of data race which will fit as an entry in the Glossaries?
> > 
> > How about like the following?
> 
> Looks good to me!

Very good, and I have pushed it out.

> Note on the index entry:
> 
> My experiment on the way to annotate index entries can manage automatic
> capitalization of only the first letter in indexed words/terms.
> So you won't need to take care of them.
> 
> And I'll get rid of direct uses of \index{} macro.
> 
> Will start rebasing those experiment soon after the release of
> second edition.

Sounds very good!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit da6dcf306cf2eb05324c306bbed230cc543fc426
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Sat Mar 20 12:21:07 2021 -0700
> > 
> >     toolsoftrade,glossary: Explain data races
> >     
> >     While in the area, make the cases of index entries consistent,
> >     fixing my copy-pasta from the glossary entry.
> >     
> >     Reported-by: Akira Yokosawa <akiyks@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/glossary.tex b/glossary.tex
> > index c6c9c62..e6aa612 100644
> > --- a/glossary.tex
> > +++ b/glossary.tex
> > @@ -38,13 +38,13 @@
> >  	is atomic, because other CPUs will see either the old value or
> >  	the new value, but are guaranteed not to see some mixed value
> >  	containing some pieces of the new and old values.
> > -\item[Atomic Read-Modify-Write Operation:]\index{Atomic Read-Modify-Write Operation}
> > +\item[Atomic Read-Modify-Write Operation:]\index{Atomic read-modify-write operation}
> >  	An atomic operation that both reads and writes memory is
> >  	considered an atomic read-modify-write operation, or atomic RMW
> >  	operation for short.
> >  	Although the value written usually depends on the value read,
> >  	\co{atomic_xchg()} is the exception that proves this rule.
> > -\item[Bounded Wait Free:]\index{Bounded Wait Free}
> > +\item[Bounded Wait Free:]\index{Bounded wait free}
> >  	A forward-progress guarantee in which every thread makes
> >  	progress within a specific finite period of time, the specific
> >  	time being the bound.
> > @@ -126,7 +126,7 @@
> >  \item[Capacity Miss:]\index{Capacity miss}
> >  	A cache miss incurred because the corresponding CPU has recently
> >  	accessed more data than will fit into the cache.
> > -\item[Clash Free:]\index{Clash Free}
> > +\item[Clash Free:]\index{Clash free}
> >  	A forward-progress guarantee in which, in the absence of
> >  	contention, at least one thread makes progress within a finite
> >  	period of time.
> > @@ -170,7 +170,16 @@
> >  	increasing numbers of CPUs as the number of instances of
> >  	data grows.
> >  	Contrast with ``code locking''.
> > -\item[Deadlock Free:]\index{Deadlock Free}
> > +\item[Data Race:]\index{Data race}
> > +	A race condition in which several CPUs or threads access
> > +	a variable concurrently, and in which at least one of those
> > +	accesses is a store and at least one of those accesses
> > +	is unmarked.
> > +	It is important to note that while the presence of data races
> > +	often indicates the presence of bugs, the absence of data races
> > +	in no way implies the absence of bugs.
> > +	(See ``Marked access''.)
> > +\item[Deadlock Free:]\index{Deadlock free}
> >  	A forward-progress guarantee in which, in the absence of
> >  	failures, at least one thread makes progress within a finite
> >  	period of time.
> > @@ -226,7 +235,7 @@
> >  	Since RCU read-side critical sections by definition cannot
> >  	contain quiescent states, these two definitions are almost
> >  	always interchangeable.
> > -\item[Hazard Pointer:]\index{Hazard Pointer}
> > +\item[Hazard Pointer:]\index{Hazard pointer}
> >  	A scalable counterpart to a reference counter in which an
> >  	object's reference count is represented implicitly by a count
> >  	of the number of special hazard pointers referencing that object.
> > @@ -284,9 +293,21 @@
> >  	used so heavily that there is often a CPU waiting on it.
> >  	Reducing lock contention is often a concern when designing
> >  	parallel algorithms and when implementing parallel programs.
> > -\item[Lock Free:]\index{Lock Free}
> > +\item[Lock Free:]\index{Lock free}
> >  	A forward-progress guarantee in which at least one thread makes
> >  	progress within a finite period of time.
> > +\item[Marked Access:]\index{Marked access}
> > +	A source-code memory access that uses a special function or
> > +	macro, such as \co{READ_ONCE()}, \co{WRITE_ONCE()},
> > +	\co{atomic_inc()}, and so on, in order to protect that access
> > +	from compiler and/or hardware optimizations.
> > +	In contrast, an unmarked access simply mentions the name of
> > +	the object being accessed, so that in the following, line~2
> > +	is the unmarked equivalent of line~1:
> > +	\begin{VerbatimN}
> > +	WRITE_ONCE(a, READ_ONCE(b) + READ_ONCE(c));
> > +	a = b + c;
> > +	\end{VerbatimN}
> >  \item[Memory:]\index{Memory}
> >  	From the viewpoint of memory models, the main memory,
> >  	caches, and store buffers in which values might be stored.
> > @@ -345,7 +366,7 @@
> >  \item[NUMA Node:]\index{NUMA node}
> >  	A group of closely placed CPUs and associated memory within
> >  	a larger NUMA machines.
> > -\item[Obstruction Free:]\index{Obstruction Free}
> > +\item[Obstruction Free:]\index{Obstruction free}
> >  	A forward-progress guarantee in which, in the absence of
> >  	contention, every thread makes progress within a finite
> >  	period of time.
> > @@ -428,7 +449,7 @@
> >  	wait for the writer to release the lock.
> >  	A key concern for reader-writer locks is ``fairness'':
> >  	can an unending stream of readers starve a writer or vice versa.
> > -\item[Real Time:]\index{Real Time}
> > +\item[Real Time:]\index{Real time}
> >  	A situation in which getting the correct result is not sufficient,
> >  	but where this result must also be obtained within a given amount
> >  	of time.
> > @@ -437,7 +458,7 @@
> >  	additional resources.
> >  	For parallel computing, the additional resources are usually
> >  	additional CPUs.
> > -\item[Sequence Lock:]\index{Sequence Lock}
> > +\item[Sequence Lock:]\index{Sequence lock}
> >  	A reader-writer synchronization mechanism in which readers
> >  	retry their operations if a writer was present.
> >  \item[Sequential Consistency:]\index{Sequential consistency}
> > @@ -445,7 +466,7 @@
> >  	in an order consistent with
> >  	a single global order, and where each CPU's memory references
> >  	appear to all CPUs to occur in program order.
> > -\item[Starvation Free:]\index{Starvation Free}
> > +\item[Starvation Free:]\index{Starvation free}
> >  	A forward-progress guarantee in which, in the absence of
> >  	failures, every thread makes progress within a finite
> >  	period of time.
> > @@ -483,7 +504,7 @@
> >  	they understand completely and are therefore comfortable teaching.
> >  \item[Throughput:]\index{Throughput}
> >  	A performance metric featuring work items completed per unit time.
> > -\item[Transactional Lock Elision (TLE):]\index{Transactional Lock Elision (TLE)}
> > +\item[Transactional Lock Elision (TLE):]\index{Transactional lock elision (TLE)}
> >  	The use of transactional memory to emulate locking.
> >  	Synchronization is instead carried out by conflicting accesses
> >  	to the data to be protected by the lock.
> > @@ -503,7 +524,7 @@
> >  	In the 1960s through the 1980s, only supercomputers had vector
> >  	capabilities, but the advent of MMX in x86 CPUs and VMX in
> >  	PowerPC CPUs brought vector processing to the masses.
> > -\item[Wait Free:]\index{Wait Free}
> > +\item[Wait Free:]\index{Wait free}
> >  	A forward-progress guarantee in which every thread makes
> >  	progress within a finite period of time.
> >  \item[Write Miss:]\index{Write miss}
> > diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> > index 1f667e0..9e0838c 100644
> > --- a/toolsoftrade/toolsoftrade.tex
> > +++ b/toolsoftrade/toolsoftrade.tex
> > @@ -397,12 +397,20 @@ Note that this program carefully makes sure that only one of the threads
> >  stores a value to variable \co{x} at a time.
> >  Any situation in which one thread might be storing a value to a given
> >  variable while some other thread either loads from or stores to that
> > -same variable is termed a ``data race''.
> > +same variable is termed a \emph{data race}.
> >  Because the C language makes no guarantee that the results of a data race
> >  will be in any way reasonable, we need some way of safely accessing
> >  and modifying data concurrently, such as the locking primitives discussed
> >  in the following section.
> >  
> > +But your data races are benign, you say?
> > +Well, maybe they are.
> > +But please do everyone (yourself included) a big favor and read
> > +\cref{sec:toolsoftrade:Shared-Variable Shenanigans}
> > +very carefully.
> > +As compilers optimize more and more aggressively, there are fewer and
> > +fewer truly benign data races.
> > +
> >  \QuickQuiz{
> >  	If the C language makes no guarantees in presence of a data
> >  	race, then why does the Linux kernel have so many data races?
> > 
