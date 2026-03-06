Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2A9AD2C
	for <perfbook@vger.kernel.org>; Fri,  6 Mar 2026 16:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815048; cv=none; b=Xt6oZI3uI+w0kW5fSNjjO1SfUXXrK4A+C0CPcC5yuMwyoPPOBN8IOvL5tDmYLVK7LQcGdmaux2BwBeQHZXabc1r+h14HLagGX5yrAptSEfi+MQl/zLUkofQVElty/vU9mm4O3iVUXkwaGRxe35SAktId/fHuoRt25joJ6h3WyyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815048; c=relaxed/simple;
	bh=vIeeL3sCpr1VeU2i6WpsDehdP3Oj6cQVwksZKOgBAcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9cYcocuyks6ksS3DxbPI9ulDAEYRHlrJ90gpZ4lP1nSAxoF37s/J41hmWjleXAHnf/foH7MFh6ZlByijGEboJ77uhlIxZXB1W9y7eGIMzhgg5uU9RLjsW1VOfHhyTwiiWq0QdEh5VzikE01z0lOQsdh9SIMbTb5ADBNWzX5B/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxS2Aout; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxS2Aout"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760E3C4CEF7;
	Fri,  6 Mar 2026 16:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772815047;
	bh=vIeeL3sCpr1VeU2i6WpsDehdP3Oj6cQVwksZKOgBAcw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=RxS2AoutxiP6fkuu/ns2PU+TovLhSjJckywyLMqo0we/qFxEekOUx2GUgwzRu2G/M
	 tY6zcsagxneaD76ddG0IrVojTdy6rAcV6tOBHj6/G3XBe+PDHOqQ2BQuYl/65kW1Oq
	 cLBvJtXuQ9NuVNjL+MBI0p9sK3zpbdMXKAGcuAGurHGEABxnjeZFW1bPKgkAFPGpy4
	 03v29MN7VwhJg4AN6SLMjrZsYxtzpnoFgGtG7ccoJr7lMC+o47K1eCMDHUWQ1d+Jk1
	 xAs7IPTKX3UjJPzOH2/SBU70U8Hvi6aNVLoIHSox43ceG1NWAMbw7kHH2vrU8DE4Mp
	 b23w3QucDk7Rw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DCA9FCE0992; Fri,  6 Mar 2026 08:37:26 -0800 (PST)
Date: Fri, 6 Mar 2026 08:37:26 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] memorder: Refine technical prose for clarity and
 precision
Message-ID: <de0e2797-8f98-45ea-91e6-9d4ae80567f1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260306082922.2204419-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306082922.2204419-1-kunwu.chan@linux.dev>

On Fri, Mar 06, 2026 at 04:29:22PM +0800, Kunwu Chan wrote:
> Polish typography and grammar in memory-ordering text to improve
> precision, readability, and editorial consistency while preserving
> technical semantics.
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>

Again, good eyes!  Queued and pushed, thank you very much!!!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index d1ebb93c..16a569d1 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -15,7 +15,7 @@ These intuitions can be quite helpful when writing, analyzing, and
>  debugging not only sequential code, but also parallel code that makes
>  use of standard mutual-exclusion mechanisms such as locking.
>  Unfortunately, these intuitions break down completely in complex
> -concurrent code, such as that in  the Linux-kernel, which often uses
> +concurrent code, such as that in the Linux-kernel, which often uses
>  weakly ordered atomic operations and memory barriers.
>  One example of such code implements the standard mutual-exclusion
>  mechanisms themselves, while another example implements fast
> @@ -316,8 +316,8 @@ stored by a release, discussed in
>  then the code following that release will see all accesses preceding
>  the acquire.
>  More precisely, if CPU~0 does an acquire that loads the value stored by
> -CPU~1's release, than all the subsequent accesses executed by CPU~0 will
> -see the all of CPU~1's accesses prior to its release.
> +CPU~1's release, then all the subsequent accesses executed by CPU~0 will
> +see all of CPU~1's accesses prior to its release.
>  
>  Similarly, the accesses preceding that release access will be protected
>  from seeing the accesses following the acquire access.
> @@ -561,7 +561,7 @@ on
>  	This counter-temporal nature of load-to-store and store-to-store
>  	links necessitates strong ordering.
>  
> -	In constrast, store-to-load links are temporal, as illustrated by
> +	In contrast, store-to-load links are temporal, as illustrated by
>  	\cref{lst:memorder:Load-Buffering Data-Dependency Litmus Test,%
>  	lst:memorder:Load-Buffering Control-Dependency Litmus Test}.
>  	This temporal nature of store-to-load links permits use of
> @@ -882,7 +882,7 @@ record their stores in their respective store buffers.
>  	How can that possibly work???
>  }\QuickQuizAnswer{
>  	There is an underlying cache-coherence protocol that straightens
> -	things out, which are discussed in
> +	things out, which is discussed in
>  	\cref{sec:app:whymb:Cache-Coherence Protocols}.
>  	But if you think that a given variable having two values at
>  	the same time is surprising, just wait until you get to
> @@ -1040,7 +1040,7 @@ Although full barriers such as \co{smp_mb()} have extremely strong
>  ordering guarantees, their strength comes at a high price in terms
>  of foregone hardware and compiler optimizations.
>  A great many situations can be handled with much weaker ordering guarantees
> -that use much cheaper memory-ordering instructions, or, in some case, no
> +that use much cheaper memory-ordering instructions, or, in some cases, no
>  memory-ordering instructions at all.
>  
>  \begin{table*}
> @@ -1184,7 +1184,7 @@ are at most two threads involved.
>  
>  	The \co{*_dereference()} row captures the address and data
>  	dependency ordering provided by \co{rcu_dereference()} and friends.
> -	Again, these dependencies must been constructed carefully,
> +	Again, these dependencies must have been constructed carefully,
>  	as described in
>  	\cref{sec:memorder:Address- and Data-Dependency Difficulties}.
>  
> @@ -2459,7 +2459,7 @@ might reach \co{P2()} before \co{P0()}'s store does.
>  This leads to the question of why a real system constrained by the
>  usual laws of physics would ever trigger the \co{exists} clause of
>  \cref{lst:memorder:WRC Litmus Test With Dependencies (No Ordering)}.
> -The cartoonish diagram of a such a real system is shown in
> +The cartoonish diagram of such a real system is shown in
>  \cref{fig:memorder:Shared Store Buffers And Multi-Copy Atomicity}.
>  CPU~0 and CPU~1 share a store buffer, as do CPUs~2 and~3.
>  This means that CPU~1 can load a value out of the store buffer, thus
> @@ -3536,8 +3536,8 @@ can be satisfied:
>  
>  At this point, you should see something like
>  \cref{fig:memorder:PPCMEM Final R State}.
> -Note that the satisified \co{exists} clause is shown in blue near the
> -bottom, confirming that this counter-intuitive really can happen.
> +Note that the satisfied \co{exists} clause is shown in blue near the
> +bottom, confirming that this counter-intuitive result really can happen.
>  If you wish, you can click on ``Undo'' to explore other options or
>  click on ``Reset'' to start over.
>  It can be very helpful to carry out these steps in different orders
> -- 
> 2.25.1
> 
