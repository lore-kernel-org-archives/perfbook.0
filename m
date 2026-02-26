Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABA629BDB0
	for <perfbook@vger.kernel.org>; Thu, 26 Feb 2026 19:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772132955; cv=none; b=r4NDRVtaRGA+mx1pZobfHccYM8RRBaLZqkNhhwQ6xsMwlJHXDKSFgmjnY43ryG+mjOKzf4fOSMW58475T/Muxiv2layn1m0RKV44dou6pHyZ5yasdCOUaPqHsFZ+wTetZa5H4PQ1YtJIVc5sz1qBjb8RoCQ39OEdc47sMji8QQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772132955; c=relaxed/simple;
	bh=4QpOj6P384vvpjJgFcXKoHrcYCxBlY4SV8rmKl0s6Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIeWcCnBTuzEfWSD6xuzGSg593PKMGPw/8F7ioJhMCevKm78vIjiVcmhWqBTKVi9eeAd+sY9pABihHNw61qaH9a8kPiCx5uO+h44M8qraPBUYrg3JYa2wSYqkvI1CNk+gChb4hk5LQNUHQJGyTTwtNB4G6X366l2xUpwkjGWSPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMvOXKiB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMvOXKiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C3AC116C6;
	Thu, 26 Feb 2026 19:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772132954;
	bh=4QpOj6P384vvpjJgFcXKoHrcYCxBlY4SV8rmKl0s6Nw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=DMvOXKiBVqqMtBmQebstuTv0dTWh9SNc6LnukFOnX0B5A5OULgY4n0K3dFPRGrZEk
	 0wtOmZDrb5GW0+yTJMK3jOdpO2avJccojTwBl8S4kfshdm3reQ0dagQvcMvwO1Ks4J
	 GsX4FEFGqOQ2yfs+eX8qOffKQCW009EJuE+oRwPpqmrcaLnhu3Z8qROBfZtDAIR7HM
	 AQypkdz1UJSYwiINRktsnT4A3nQk9CvQ5u0InlSuY8dGNf862+QhhyguS4HBwaN6co
	 noPYmWXVnLrUWlXqBlbEuOnjNUaf9pXxIVKk/saHKVFkYU51zRRnOm5g24jKypBzzz
	 NF7rN+JcjJsPg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1F675CE08F1; Thu, 26 Feb 2026 11:09:14 -0800 (PST)
Date: Thu, 26 Feb 2026 11:09:14 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] defer: Fix grammar issues across Chapter 9 text
Message-ID: <e55cfdd7-919f-46c8-b5b9-1d83e3aaefca@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260225124424.3325034-1-kunwu.chan@linux.dev>
 <f301d1e0-11be-4016-a85d-b0788fcde60c@paulmck-laptop>
 <f3515ef3292777bf756941333f552ea011a7ec51@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3515ef3292777bf756941333f552ea011a7ec51@linux.dev>

On Thu, Feb 26, 2026 at 02:49:16AM +0000, Kunwu Chan wrote:
> February 26, 2026 at 9:02 AM, "Paul E. McKenney" <paulmck@kernel.org mailto:paulmck@kernel.org?to=%22Paul%20E.%20McKenney%22%20%3Cpaulmck%40kernel.org%3E > wrote:
> 
> 
> > 
> > On Wed, Feb 25, 2026 at 08:44:24PM +0800, Kunwu Chan wrote:
> > 
> > > 
> > > Fix subject-verb agreement, singular/plural forms, pronoun agreement,
> > >  and countability in Chapter 9 prose.
> > >  
> > >  These wording-only edits improve readability without changing
> > >  technical meaning.
> > >  
> > >  Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
> > > 
> > Again, good eyes and thank you! I applied all three, with the exception of 
> > this hunk:
> > 
> > ------------------------------------------------------------------------
> > 
> > diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> > index 0c8c2e23..23bda66b 100644
> > --- a/defer/rcufundamental.tex
> > +++ b/defer/rcufundamental.tex
> > @@ -559,7 +559,7 @@ tolerable, they are in fact invisible.
> >  In such cases, RCU readers can be considered to be fully ordered with
> >  updaters, despite the fact that these readers might be executing the
> >  exact same sequence of machine instructions that would be executed by
> > -a single-threaded program, as hinted on
> > +a single-threaded program, as hinted at
> >  \cpageref{sec:defer:Mysteries RCU}.
> >  For example, referring back to
> >  \cref{lst:defer:Insertion and Deletion With Concurrent Readers}
> > 
> > ------------------------------------------------------------------------
> > 
> > This one is one of the many strangenesses of English. You might start
> > reading "at page 30", but you would find information "on page 30". Or
> > am I misreading this?
> > 
> >  Thanx, Paul
> > 
> Makes sense — both forms seem to be used.
> 
> I originally changed it based on my understanding of the usual phrasing,
> but I also noticed the perfbook currently uses both "hinted at" and "hinted on".
> I can send a small follow-up patch to make them consistent if that sounds good.

Good point!

But when I took a quick look, I found reasons for the divergence.
Maybe the best way forward is for you to send me a list of (say) 25 of
them, and for me to explain why what is there is correct on the one hand
or to not the needed change on the other.

Then you could use that information to create the patch for those
needing change.

Seem reasonable?

							Thanx, Paul

> Thanx, Kunwu
> 
> > > 
> > > ---
> > >  defer/defer.tex | 2 +-
> > >  defer/rcu.tex | 2 +-
> > >  defer/rcuapi.tex | 2 +-
> > >  defer/rcufundamental.tex | 2 +-
> > >  defer/rcuusage.tex | 4 ++--
> > >  defer/whichtochoose.tex | 10 +++++-----
> > >  6 files changed, 11 insertions(+), 11 deletions(-)
> > >  
> > >  diff --git a/defer/defer.tex b/defer/defer.tex
> > >  index eefb1215..3a24ee5d 100644
> > >  --- a/defer/defer.tex
> > >  +++ b/defer/defer.tex
> > >  @@ -87,7 +87,7 @@ interface~3, and address~17 to interface~7.
> > >  This list will normally be searched frequently and updated rarely.
> > >  In \cref{chp:Hardware and its Habits}
> > >  we learned that the best ways to evade inconvenient laws of physics, such as
> > >  -the finite speed of light and the atomic nature of matter, is to
> > >  +the finite speed of light and the atomic nature of matter, are to
> > >  either partition the data or to rely on read-mostly sharing.
> > >  This chapter applies read-mostly sharing techniques to Pre-BSD packet
> > >  routing.
> > >  diff --git a/defer/rcu.tex b/defer/rcu.tex
> > >  index 13078687..9d812d77 100644
> > >  --- a/defer/rcu.tex
> > >  +++ b/defer/rcu.tex
> > >  @@ -16,7 +16,7 @@ use explicit counters to defer actions that could disturb readers,
> > >  which results in read-side contention and thus poor scalability.
> > >  The hazard pointers covered by
> > >  \cref{sec:defer:Hazard Pointers}
> > >  -uses implicit counters in the guise of per-thread lists of pointer.
> > >  +use implicit counters in the guise of per-thread lists of pointers.
> > >  This avoids read-side contention, but requires readers to do stores and
> > >  conditional branches, as well as either \IXhpl{full}{memory barrier}
> > >  in read-side primitives or real-time-unfriendly \IXacrlpl{ipi} in
> > >  diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> > >  index 4e231e5a..09e7c277 100644
> > >  --- a/defer/rcuapi.tex
> > >  +++ b/defer/rcuapi.tex
> > >  @@ -599,7 +599,7 @@ to reuse during the grace period that otherwise would have allowed them
> > >  to be freed.
> > >  Although this can be handled through careful use of flags that interact
> > >  with the RCU callback queued by \co{call_rcu()}, this can be inconvenient
> > >  -and can waste CPU times due to the overhead of the doomed \co{call_rcu()}
> > >  +and can waste CPU time due to the overhead of the doomed \co{call_rcu()}
> > >  invocations.
> > >  
> > >  In these cases, RCU's polled grace-period primitives can be helpful.
> > >  diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> > >  index ccfe9133..604381a9 100644
> > >  --- a/defer/rcufundamental.tex
> > >  +++ b/defer/rcufundamental.tex
> > >  @@ -11,7 +11,7 @@ independent of any particular example or use case.
> > >  People who prefer to live their lives very close to the actual code may
> > >  wish to skip the underlying fundamentals presented in this section.
> > >  
> > >  -The common use of RCU to protect linked data structure is comprised
> > >  +The common use of RCU to protect linked data structures is comprised
> > >  of three fundamental mechanisms, the first being used for insertion,
> > >  the second being used for deletion, and the third being used to allow
> > >  readers to tolerate concurrent insertions and deletions.
> > >  diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> > >  index 2bbd4cef..36939300 100644
> > >  --- a/defer/rcuusage.tex
> > >  +++ b/defer/rcuusage.tex
> > >  @@ -156,7 +156,7 @@ that of the ideal synchronization-free workload.
> > >  \cref{sec:cpu:Pipelined CPUs}
> > >  carefully already knew all of this!
> > >  
> > >  - These counter-intuitive results of course means that any
> > >  + These counter-intuitive results of course mean that any
> > >  performance result on modern microprocessors must be subject to
> > >  some skepticism.
> > >  In theory, it really does not make sense to obtain performance
> > >  @@ -241,7 +241,7 @@ As noted in \cref{sec:defer:RCU Fundamentals}
> > >  an important component
> > >  of RCU is a way of waiting for RCU readers to finish.
> > >  One of
> > >  -RCU's great strength is that it allows you to wait for each of
> > >  +RCU's great strengths is that it allows you to wait for each of
> > >  thousands of different things to finish without having to explicitly
> > >  track each and every one of them, and without incurring
> > >  the performance degradation, scalability limitations, complex deadlock
> > >  diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
> > >  index a152b028..a11de412 100644
> > >  --- a/defer/whichtochoose.tex
> > >  +++ b/defer/whichtochoose.tex
> > >  @@ -102,8 +102,8 @@ and that there be sufficient pointers for each CPU or thread to
> > >  track all the objects being referenced at any given time.
> > >  Given that most hazard-pointer-based traversals require only a few
> > >  hazard pointers, this is not normally a problem in practice.
> > >  -Of course, sequence locks provides no pointer-traversal protection,
> > >  -which is why it is normally used on static data.
> > >  +Of course, sequence locks provide no pointer-traversal protection,
> > >  +which is why they are normally used on static data.
> > >  
> > >  \QuickQuiz{
> > >  Why can't users dynamically allocate the hazard pointers as they
> > >  @@ -124,7 +124,7 @@ RCU readers must therefore be relatively short in order to avoid running
> > >  the system out of memory, with special-purpose implementations such
> > >  as SRCU, Tasks RCU, and Tasks Trace RCU being exceptions to this rule.
> > >  Again, sequence locks provide no pointer-traversal protection,
> > >  -which is why it is normally used on static data.
> > >  +which is why they are normally used on static data.
> > >  
> > >  The ``Need for Traversal Retries'' row tells whether a new reference to
> > >  a given object may be acquired unconditionally, as it can with RCU, or
> > >  @@ -319,7 +319,7 @@ Hazard pointers incur the overhead of a \IX{memory barrier}
> > >  for each data element
> > >  traversed, and sequence locks incur the overhead of a pair of memory barriers
> > >  for each attempt to execute the critical section.
> > >  -The overhead of RCU implementations vary from nothing to that of a pair of
> > >  +The overhead of RCU implementations varies from nothing to that of a pair of
> > >  memory barriers for each read-side critical section, thus providing RCU
> > >  with the best performance, particularly for read-side critical sections
> > >  that traverse many data elements.
> > >  @@ -622,7 +622,7 @@ Stjepan Glavina merged an epoch-based RCU implementation into the
> > >  \co{crossbeam} set of concurrency-support ``crates'' for the Rust
> > >  language~\cite{StjepanGlavina2018RustRCU}.
> > >  
> > >  -Jason Donenfeld produced an RCU implementations as part of his port of
> > >  +Jason Donenfeld produced an RCU implementation as part of his port of
> > >  WireGuard to Windows~NT kernel~\cite{JasonDonenfeld2021:WindowsNTwireguardRCU}.
> > >  
> > >  Finally, any garbage-collected concurrent language (not just Go!\@) gets
> > >  -- 
> > >  2.25.1
> > >
> >
