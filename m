Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDEA234994
	for <perfbook@vger.kernel.org>; Mon, 16 Feb 2026 20:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771272378; cv=none; b=dWJkj+Swmec0HcRW8Y5d7rwiLA/heQLRWAT7yyCBfLRwDHPwuWxJwOv4SsbfiZKPWizosFsxzUZlfCznZ/tTIBK1HYOQR0ERhBZW8p+oRXFpAn2GCKToM6yqXvdDRWyv1rl4pkBlyykGDsDXRXZPEkCozQpa4J18ObGRHFBGA3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771272378; c=relaxed/simple;
	bh=5pjS7bz8L8ohbyLIpeSiH4yAmdVv6wlYemxg+8L2t7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDcdNj0zJbPHzNOXIhoVXcBMyHMakjfx85NJhNXN9SkttYsTCEPUJGOFaf8pN4cAn+D4HbgapfO8DLu8ZuThxBhjaDiXql3XXdk9reqeYzBvQ6UQ43eVAGevavIV9TMvKHC4ySPhUMuw6EyxKwuX+ko6hQfU8w5MEGzG55z6ipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqqCZmOq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqqCZmOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0EDC116C6;
	Mon, 16 Feb 2026 20:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771272378;
	bh=5pjS7bz8L8ohbyLIpeSiH4yAmdVv6wlYemxg+8L2t7I=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=KqqCZmOq8YGZjCGtnrr7hn65jglBUl0vO9YXkOo3iZ/rQmzPKsm5pirz/Iq3AmsrL
	 qmD6ATGTMd7NAF3Xplims6RKEK0Y+g3IW6g4bKXUJ9PkAkKY2LI6YRVDNxcsmZCxPi
	 u1sAbJqpbTW/1A3bo338zFPXaduGUsePBsrJrI1uSMpbicQCaDk+wqTOcTLyJeaSoJ
	 dBOaL0STcaRTuuYSfzY6KO36O8+py5rh1f5K0sjXDz5JEv5up+v4vjG9TQcfpbx2xS
	 EXJPvcrm3KMSl7M/EiF8s6xPNzgrNUNKw4WIJLk2FpeP+mn3FQTC0sB3UV2TCNi4xV
	 42KInbLvFYUcw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C1A55CE0DE7; Mon, 16 Feb 2026 12:06:17 -0800 (PST)
Date: Mon, 16 Feb 2026 12:06:17 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] defer: Fix typos across Chapter 9
Message-ID: <1afd3a0a-284e-4970-9f43-e93716dde96d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260216044309.2207651-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216044309.2207651-1-kunwu.chan@linux.dev>

On Mon, Feb 16, 2026 at 12:43:09PM +0800, Kunwu Chan wrote:
> Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>

Good eyes, applied and pushed, and thank you!!!

							Thanx, Paul

> ---
>  defer/rcu.tex            |  2 +-
>  defer/rcuapi.tex         |  4 ++--
>  defer/rcufundamental.tex |  2 +-
>  defer/rcuintro.tex       |  2 +-
>  defer/rcurelated.tex     |  2 +-
>  defer/rcuusage.tex       | 10 +++++-----
>  defer/updates.tex        |  2 +-
>  defer/whichtochoose.tex  |  2 +-
>  8 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/defer/rcu.tex b/defer/rcu.tex
> index c54da410..13078687 100644
> --- a/defer/rcu.tex
> +++ b/defer/rcu.tex
> @@ -66,7 +66,7 @@ applied to virtually any data structure''.
>  On the other hand, making good use of RCU often requires that you think
>  differently about concurrency in general and about your use case in
>  particular.
> -Much of the remainder of this section therofore provides a guide to
> +Much of the remainder of this section therefore provides a guide to
>  mapping use cases onto RCU.
>  
>  \QuickQuiz{
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index 54c94233..9fa11626 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -135,7 +135,7 @@ and by
>  which shows the publish-subscribe portions of the
>  API~\cite{PaulEMcKenney2024RCUAPI}.\footnote{
>  	This citation covers v6.10 and later.
> -	Documetation for earlier versions of the Linux-kernel RCU API may
> +	Documentation for earlier versions of the Linux-kernel RCU API may
>  	be found elsewhere~\cite{PaulEMcKenney2008WhatIsRCUAPI,PaulEMcKenney2014RCUAPI,PaulEMcKenney2019RCUAPI}.}
>  
>  \begin{sidewaystable*}[tbp]
> @@ -597,7 +597,7 @@ However, there are situations where this ease of use gets in the way,
>  for example, when a cache of RCU-protected objects might be subject
>  to reuse during the grace period that otherwise would have allowed them
>  to be freed.
> -Although this can be handed through careful use of flags that interact
> +Although this can be handled through careful use of flags that interact
>  with the RCU callback queued by \co{call_rcu()}, this can be inconvenient
>  and can waste CPU times due to the overhead of the doomed \co{call_rcu()}
>  invocations.
> diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> index 0efdf406..c3bcc4f0 100644
> --- a/defer/rcufundamental.tex
> +++ b/defer/rcufundamental.tex
> @@ -484,7 +484,7 @@ In contrast, in
>  \cref{fig:defer:Multiple RCU Data-Structure Versions}
>  the reader sees a version that never actually existed!
>  
> -One way to resolve this strange situation is via weaker semanitics.
> +One way to resolve this strange situation is via weaker semantics.
>  A reader traversal must encounter any data item that was present
>  during the full traversal (B, C, and~D), and might or might not
>  encounter data items that were present for only part of the
> diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
> index d3a55a47..48de32e2 100644
> --- a/defer/rcuintro.tex
> +++ b/defer/rcuintro.tex
> @@ -145,7 +145,7 @@ the state, as indicated by the ``2~Versions'' in the figure.
>  	to model.
>  
>  	Real-world algorithms therefore absolutely must tolerate
> -	inconsistancies between external reality and the in-computer
> +	inconsistencies between external reality and the in-computer
>  	data reflecting that reality.
>  	Many of those algorithms are also able to tolerate some degree
>  	of inconsistency within the in-computer data.
> diff --git a/defer/rcurelated.tex b/defer/rcurelated.tex
> index 8846825f..cf4b7b49 100644
> --- a/defer/rcurelated.tex
> +++ b/defer/rcurelated.tex
> @@ -391,7 +391,7 @@ sleepable RCU (SRCU)~\cite{PaulEMcKenney2006c}.
>  Finally, \ppl{Michalis}{Kokologiannakis} and \ppl{Konstantinos}{Sagonas}
>  (National Technical University of
>  Athens)~\cite{MichalisKokologiannakis2017NidhuggRCU,MichalisKokologiannakis2019RCUstatelessModelCheck}
> -used the Nighugg tool~\cite{CarlLeonardsson2014Nidhugg}
> +used the Nidhugg tool~\cite{CarlLeonardsson2014Nidhugg}
>  to produce a mechanical proof of correctness of a somewhat larger
>  portion of Linux-kernel Tree RCU\@.
>  
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index 6225c672..63e12a40 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -226,7 +226,7 @@ that of the ideal synchronization-free workload.
>  \end{figure*}
>  
>  Although Pre-BSD routing is an excellent RCU use case, it is worthwhile
> -looking at the relationships betweeen the wider spectrum of use cases
> +looking at the relationships between the wider spectrum of use cases
>  shown in
>  \cref{fig:defer:Relationships Between RCU Use Cases}.
>  This task is taken up by the following sections.
> @@ -520,7 +520,7 @@ run concurrently with \co{do_maint()} to complete, and finally
>  	function's load from \co{be_careful} and any memory loads
>  	executed by the \co{cco_quickly()} function.
>  	Because there is no ordering, without that second call to
> -	\co{syncrhonize_rcu()}, memory ordering could cause loads
> +	\co{synchronize_rcu()}, memory ordering could cause loads
>  	in \co{cco_quickly()} to overlap with stores by \co{do_maint()}.
>  
>  	Another alternative would be to compensate for the removal of
> @@ -852,7 +852,7 @@ and \clnref{ret_0:b} indicates failure to delete the specified key.
>  \QuickQuizE{
>  	The RCU-based algorithm shown in
>  	\cref{lst:defer:Existence Guarantees Enable Per-Element Locking}
> -	locks very similar to that in
> +	looks very similar to that in
>  	\cref{lst:locking:Per-Element Locking With Lock-Based Existence Guarantees},
>  	so why should the RCU-based approach be any better?
>  }\QuickQuizAnswerE{
> @@ -1057,7 +1057,7 @@ which was generated on a 448-CPU 2.10\,GHz Intel x86 system.
>  
>  	Nor was this a theoretical problem:
>  	A failure actually manifested in 2019.
> -	\ppl{Herbert}{Xu} tracked down this failure down and
> +	\ppl{Herbert}{Xu} tracked down this failure and
>  	\ppl{Linus}{Torvalds}
>  	therefore queued a commit to upgrade \co{rcu_read_lock()} and
>  	\co{rcu_read_unlock()} to unconditionally include a call to
> @@ -1356,7 +1356,7 @@ analysis~\cite[Figures 3 and 5]{VishakhaRamani2023LockBasedLocklessFresh}.
>  	at the time that it arrives, and extremely stale in the case
>  	of astronomical data.
>  	The finite speed of light also places a sharp limit on the
> -	consistency of data arriving from different sources of via
> +	consistency of data arriving from different sources or via
>  	different paths.
>  
>  	You might as well face the fact that the laws of physics
> diff --git a/defer/updates.tex b/defer/updates.tex
> index 92e1fe93..7536e172 100644
> --- a/defer/updates.tex
> +++ b/defer/updates.tex
> @@ -21,7 +21,7 @@ scalability for writers, namely the counting algorithms surveyed in
>  These algorithms featured partially partitioned data structures so
>  that updates can operate locally, while the more-expensive reads
>  must sum across the entire data structure.
> -Silas Boyd-Wickhizer has generalized this notion to produce
> +Silas Boyd-Wickizer has generalized this notion to produce
>  OpLog, which he has applied to
>  Linux-kernel pathname lookup, VM reverse mappings, and the \co{stat()} system
>  call~\cite{SilasBoydWickizerPhD}.
> diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
> index dfa19426..775da269 100644
> --- a/defer/whichtochoose.tex
> +++ b/defer/whichtochoose.tex
> @@ -397,7 +397,7 @@ instructions.
>  	This limits lock contention and prevents both preemption and
>  	interrupts from delaying execution while those locks are held,
>  	in turn providing excellent forward
> -	progrees~\cite{BjoernBrandenburgPhD,DanielBristot2019RTtrace,Hillier86,DipankarSarma2004OLSscalability}.
> +	progress~\cite{BjoernBrandenburgPhD,DanielBristot2019RTtrace,Hillier86,DipankarSarma2004OLSscalability}.
>  
>  	In short, formalisms such as wait-free synchronization have their
>  	place, but the really important thing is to figure out what your
> -- 
> 2.25.1
> 
