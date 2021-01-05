Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725817AbhAEOye (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 5 Jan 2021 09:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609858433;
        bh=Xk4Yhd5D/fGpZzzBhOePZ9V679g3+D+rCRL1n+zsugE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=L5rbV/gXHWrq1+m7NgfbN448VIyri5j2c3ikZtEoewWY2kYtaUI7rcZdofGWZw+gK
         E7rfkEcL98VY8xkJaoCnveQU7v0Amyr0BgWaFN7MGuG7Z4fdwxVW19xe93kfDDXeuQ
         GKRYevSZmeUPFJWPCH/J1xbvxqj8l/dPUfbe6cNS3EnY7mZ6MwOvvPo2zD4b0+4F8K
         fsc3XU8PReTRLGPHXc4TBavq0ehSnw8xzDX48Vcx45OmRCWFvQoam1ex/cn86JNmU0
         NeLzE/RadYpO/QUHPcE307wYdKB9BTunJLJRqZZ4H7t7xorm4vYWcFszit1vqSeEFk
         RWppoVQsyotnA==
Date: Tue, 5 Jan 2021 06:53:53 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer/rcuexercises: Annotate essential QQs
Message-ID: <20210105145353.GC17086@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <6e41a126-f08e-5ad2-3667-416cea540627@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e41a126-f08e-5ad2-3667-416cea540627@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 05, 2021 at 09:23:11AM +0900, Akira Yokosawa wrote:
> >From e98f36b3a91d406c2375863dc003727bc8153f4f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 4 Jan 2021 21:14:10 +0900
> Subject: [PATCH -perfbook] defer/rcuexercises: Annotate essential QQs
> 
> Quick Quizzes in this section should be presented in "nq" builds.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

However, "make nq" is giving me framed quick quiz questions rather
than the small-font indicators that were there at some time.  This
might be the fault of my tools, and I will be upgrading soon anyway.
But I figured I should let you know.

							Thanx, Paul

> ---
>  defer/rcuexercises.tex | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/defer/rcuexercises.tex b/defer/rcuexercises.tex
> index 9438c9e5..476819a9 100644
> --- a/defer/rcuexercises.tex
> +++ b/defer/rcuexercises.tex
> @@ -13,8 +13,7 @@ The \co{rcu_read_lock()}, \co{rcu_read_unlock()}, \co{rcu_dereference()},
>  \co{rcu_assign_pointer()}, and \co{synchronize_rcu()} primitives should
>  suffice for most of these exercises.
>  
> -\QuickQuizSeries{%
> -\QuickQuizB{
> +\EQuickQuiz{
>  	The statistical-counter implementation shown in
>  	Listing~\ref{lst:count:Per-Thread Statistical Counters}
>  	(\path{count_end.c})
> @@ -25,7 +24,7 @@ suffice for most of these exercises.
>  	(Keep in mind that \co{read_count()}'s scalability will
>  	necessarily be limited by its need to scan all threads'
>  	counters.)
> -}\QuickQuizAnswerB{
> +}\EQuickQuizAnswer{
>  	Hint: place the global variable \co{finalcount} and the
>  	array \co{counterp[]} into a single RCU-protected struct.
>  	At initialization time, this structure would be allocated
> @@ -59,9 +58,9 @@ suffice for most of these exercises.
>  	on
>  	page~\pageref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters}
>  	for more details.
> -}\QuickQuizEndB
> -%
> -\QuickQuizE{
> +}\EQuickQuizEnd
> +
> +\EQuickQuiz{
>  	Section~\ref{sec:count:Applying Exact Limit Counters}
>  	showed a fanciful pair of code fragments that dealt with counting
>  	I/O accesses to removable devices.
> @@ -73,7 +72,7 @@ suffice for most of these exercises.
>  	(Keep in mind that the performance of the common-case first
>  	code fragment that does I/O accesses is much more important
>  	than that of the device-removal code fragment.)
> -}\QuickQuizAnswerE{
> +}\EQuickQuizAnswer{
>  	Hint: replace the read-acquisitions of the reader-writer lock
>  	with RCU read-side critical sections, then adjust the
>  	device-removal code fragment to suit.
> @@ -83,5 +82,4 @@ suffice for most of these exercises.
>  	on
>  	Page~\pageref{sec:together:RCU and Counters for Removable I/O Devices}
>  	for one solution to this problem.
> -}\QuickQuizEndE
> -}
> +}\EQuickQuizEnd
> -- 
> 2.17.1
> 
