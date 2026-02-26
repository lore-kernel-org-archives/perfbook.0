Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0521A08AF
	for <perfbook@vger.kernel.org>; Thu, 26 Feb 2026 01:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772067775; cv=none; b=CHlDaMxhU1NAde2NbJQ/JcoCUeBF27b5SFpzlAGp0ey/hyKUCJk85NKTNpvBFmedO+K7TUCTQe7c8ZNJVuReIzGpbKLscjih/4akXHm8ntMfBiuAzSP+tfUQb9rCKmgpTKMLx5q/DQ9prexTM7rrOuCWgJ35NO+sqZIVWhy+25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772067775; c=relaxed/simple;
	bh=Q62oqHxP94geSFw8htoXigs6HT1dPkgE4kYyngUscI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYImKya/tBItn2NgBelwj7vKfuLMaDTSR/NSDE0p6caCYlRH9IL56orLne0Dz9YNNXwE38VTbBoKEPgjX7TXT2rY5kfVbI380bGrVNf2298tXtr4X25Md3RJUdpMTQDEaR0+D5/AoOZa9MC/tpFdk5ZnpTI9mLiqy43cPDt9SC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYoWWb1E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYoWWb1E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A79EC116D0;
	Thu, 26 Feb 2026 01:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772067775;
	bh=Q62oqHxP94geSFw8htoXigs6HT1dPkgE4kYyngUscI0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=NYoWWb1EM1hWgV4JurT607cPd9raKpwgrQbMKRZALGCOwIXf5o2T0ZVmwzGxWUqkg
	 lNbnrmU99/9qmz9aeb2VshaUq4de2CB/hhU2gBZkUSdcMru3Tz2PhLOi3Cy3fYAfdn
	 OD3c+L78RSKMI0KTCC25IalKkKsbt7+qJJIc1K1wXGCEdqS+Elg93jrsIQSQgiqo7z
	 xIU63wXDuzECNj/ekSlw5dJc2Vrpd7RL3qPInAaw6X+kNwUx4iQlrLT1LVX/h7rfDP
	 4IRKI/iG+6PxEwpX95v/YAI1YjZA0s9K+nqxf38/MVQxxlufm8gW7oEUD19tl0pxBP
	 sWDdhdvP2yuTQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B623FCE0A7F; Wed, 25 Feb 2026 17:02:54 -0800 (PST)
Date: Wed, 25 Feb 2026 17:02:54 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] defer: Fix grammar issues across Chapter 9 text
Message-ID: <f301d1e0-11be-4016-a85d-b0788fcde60c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260225124424.3325034-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225124424.3325034-1-kunwu.chan@linux.dev>

On Wed, Feb 25, 2026 at 08:44:24PM +0800, Kunwu Chan wrote:
> Fix subject-verb agreement, singular/plural forms, pronoun agreement,
> and countability in Chapter 9 prose.
> 
> These wording-only edits improve readability without changing
> technical meaning.
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>

Again, good eyes and thank you!  I applied all three, with the exception of 
this hunk:

------------------------------------------------------------------------

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 0c8c2e23..23bda66b 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -559,7 +559,7 @@ tolerable, they are in fact invisible.
 In such cases, RCU readers can be considered to be fully ordered with
 updaters, despite the fact that these readers might be executing the
 exact same sequence of machine instructions that would be executed by
-a single-threaded program, as hinted on
+a single-threaded program, as hinted at
 \cpageref{sec:defer:Mysteries RCU}.
 For example, referring back to
 \cref{lst:defer:Insertion and Deletion With Concurrent Readers}

------------------------------------------------------------------------

This one is one of the many strangenesses of English.  You might start
reading "at page 30", but you would find information "on page 30".  Or
am I misreading this?

							Thanx, Paul

> ---
>  defer/defer.tex          |  2 +-
>  defer/rcu.tex            |  2 +-
>  defer/rcuapi.tex         |  2 +-
>  defer/rcufundamental.tex |  2 +-
>  defer/rcuusage.tex       |  4 ++--
>  defer/whichtochoose.tex  | 10 +++++-----
>  6 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/defer/defer.tex b/defer/defer.tex
> index eefb1215..3a24ee5d 100644
> --- a/defer/defer.tex
> +++ b/defer/defer.tex
> @@ -87,7 +87,7 @@ interface~3, and address~17 to interface~7.
>  This list will normally be searched frequently and updated rarely.
>  In \cref{chp:Hardware and its Habits}
>  we learned that the best ways to evade inconvenient laws of physics, such as
> -the finite speed of light and the atomic nature of matter, is to
> +the finite speed of light and the atomic nature of matter, are to
>  either partition the data or to rely on read-mostly sharing.
>  This chapter applies read-mostly sharing techniques to Pre-BSD packet
>  routing.
> diff --git a/defer/rcu.tex b/defer/rcu.tex
> index 13078687..9d812d77 100644
> --- a/defer/rcu.tex
> +++ b/defer/rcu.tex
> @@ -16,7 +16,7 @@ use explicit counters to defer actions that could disturb readers,
>  which results in read-side contention and thus poor scalability.
>  The hazard pointers covered by
>  \cref{sec:defer:Hazard Pointers}
> -uses implicit counters in the guise of per-thread lists of pointer.
> +use implicit counters in the guise of per-thread lists of pointers.
>  This avoids read-side contention, but requires readers to do stores and
>  conditional branches, as well as either \IXhpl{full}{memory barrier}
>  in read-side primitives or real-time-unfriendly \IXacrlpl{ipi} in
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index 4e231e5a..09e7c277 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -599,7 +599,7 @@ to reuse during the grace period that otherwise would have allowed them
>  to be freed.
>  Although this can be handled through careful use of flags that interact
>  with the RCU callback queued by \co{call_rcu()}, this can be inconvenient
> -and can waste CPU times due to the overhead of the doomed \co{call_rcu()}
> +and can waste CPU time due to the overhead of the doomed \co{call_rcu()}
>  invocations.
>  
>  In these cases, RCU's polled grace-period primitives can be helpful.
> diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> index ccfe9133..604381a9 100644
> --- a/defer/rcufundamental.tex
> +++ b/defer/rcufundamental.tex
> @@ -11,7 +11,7 @@ independent of any particular example or use case.
>  People who prefer to live their lives very close to the actual code may
>  wish to skip the underlying fundamentals presented in this section.
>  
> -The common use of RCU to protect linked data structure is comprised
> +The common use of RCU to protect linked data structures is comprised
>  of three fundamental mechanisms, the first being used for insertion,
>  the second being used for deletion, and the third being used to allow
>  readers to tolerate concurrent insertions and deletions.
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index 2bbd4cef..36939300 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -156,7 +156,7 @@ that of the ideal synchronization-free workload.
>  	\cref{sec:cpu:Pipelined CPUs}
>  	carefully already knew all of this!
>  
> -	These counter-intuitive results of course means that any
> +	These counter-intuitive results of course mean that any
>  	performance result on modern microprocessors must be subject to
>  	some skepticism.
>  	In theory, it really does not make sense to obtain performance
> @@ -241,7 +241,7 @@ As noted in \cref{sec:defer:RCU Fundamentals}
>  an important component
>  of RCU is a way of waiting for RCU readers to finish.
>  One of
> -RCU's great strength is that it allows you to wait for each of
> +RCU's great strengths is that it allows you to wait for each of
>  thousands of different things to finish without having to explicitly
>  track each and every one of them, and without incurring
>  the performance degradation, scalability limitations, complex deadlock
> diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
> index a152b028..a11de412 100644
> --- a/defer/whichtochoose.tex
> +++ b/defer/whichtochoose.tex
> @@ -102,8 +102,8 @@ and that there be sufficient pointers for each CPU or thread to
>  track all the objects being referenced at any given time.
>  Given that most hazard-pointer-based traversals require only a few
>  hazard pointers, this is not normally a problem in practice.
> -Of course, sequence locks provides no pointer-traversal protection,
> -which is why it is normally used on static data.
> +Of course, sequence locks provide no pointer-traversal protection,
> +which is why they are normally used on static data.
>  
>  \QuickQuiz{
>  	Why can't users dynamically allocate the hazard pointers as they
> @@ -124,7 +124,7 @@ RCU readers must therefore be relatively short in order to avoid running
>  the system out of memory, with special-purpose implementations such
>  as SRCU, Tasks RCU, and Tasks Trace RCU being exceptions to this rule.
>  Again, sequence locks provide no pointer-traversal protection,
> -which is why it is normally used on static data.
> +which is why they are normally used on static data.
>  
>  The ``Need for Traversal Retries'' row tells whether a new reference to
>  a given object may be acquired unconditionally, as it can with RCU, or
> @@ -319,7 +319,7 @@ Hazard pointers incur the overhead of a \IX{memory barrier}
>  for each data element
>  traversed, and sequence locks incur the overhead of a pair of memory barriers
>  for each attempt to execute the critical section.
> -The overhead of RCU implementations vary from nothing to that of a pair of
> +The overhead of RCU implementations varies from nothing to that of a pair of
>  memory barriers for each read-side critical section, thus providing RCU
>  with the best performance, particularly for read-side critical sections
>  that traverse many data elements.
> @@ -622,7 +622,7 @@ Stjepan Glavina merged an epoch-based RCU implementation into the
>  \co{crossbeam} set of concurrency-support ``crates'' for the Rust
>  language~\cite{StjepanGlavina2018RustRCU}.
>  
> -Jason Donenfeld produced an RCU implementations as part of his port of
> +Jason Donenfeld produced an RCU implementation as part of his port of
>  WireGuard to Windows~NT kernel~\cite{JasonDonenfeld2021:WindowsNTwireguardRCU}.
>  
>  Finally, any garbage-collected concurrent language (not just Go!\@) gets
> -- 
> 2.25.1
> 
