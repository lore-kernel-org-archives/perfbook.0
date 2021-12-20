Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:53972 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232820AbhLTQVZ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 20 Dec 2021 11:21:25 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B649D6122A
        for <perfbook@vger.kernel.org>; Mon, 20 Dec 2021 16:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640017284;
        bh=kO0r3i1vQLhS+V02WmtOTkB+nKQovLaOr/rKoqlCdlw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=olrpx4HWV7ZUAvm8PEyNyDHQJqQt5ah8rkdgUI+cSNWfYSqh+tz2aB2hdKcrzniRk
         jTbipZdq571IAuUel9zk3o2CW3Xrt/9J3z4WN8rzWCFlcLYtHBsyzzrLgsfFS4fYQE
         PLL6gDMbKla5lL6UW0RZ6BkUewVx8hmefR4KcVMd4v0mmL3VPWQqP0KGq0gGxPXtxy
         4QQG2Aw30sQ5tXhW3YV1evGMd2+xCiGCZPIB5fTiGa1Pi4VqBvDAYAR9LQFQuLhgJs
         EKV5XkcF6nANAESSIOTBF0/Zowtn/wmNQdKsUaBuw9/NpkfdEBuFicG2WLvEUEEOa6
         TY/ZpF8cSd51A==
Date: Mon, 20 Dec 2021 08:21:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer/rcuusage: Fix minor nits
Message-ID: <20211220162123.GX641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <a2981f7d-d551-5fd1-7fc7-685c8059ca32@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2981f7d-d551-5fd1-7fc7-685c8059ca32@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Dec 20, 2021 at 08:49:15PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> In this patch, 1st and 2nd hunks are trivial typo fixes.
> 
> 3rd and 4th hunks remove "Code" and "Semantics" in paragraph titles,
> which look redundant to me.
> 
> Please feel free to pick whichever hunk you'd like.

Queued and pushed, thank you!  And yes, I did do a split "Walla Walla"
error on those paragraph titles, good catch.  (As the old saying in
this little piece of the world goes: "Walla Walla:  The town that was
so popular that they named it twice!")

							Thanx, Paul

>         Thanks, Akira
> --
>  defer/rcuusage.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index 7e154fac..3fbe73be 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -273,7 +273,7 @@ the Linux kernel.
>  In this example, the \co{timer_stop} function uses
>  \co{synchronize_sched()} to ensure that all in-flight NMI
>  notifications have completed before freeing the associated resources.
> -A simplified version of this code is shown
> +A simplified version of this code is shown in
>  \cref{lst:defer:Using RCU to Wait for NMIs to Finish}.
>  
>  \begin{listing}
> @@ -324,7 +324,7 @@ region of memory.
>  \Clnrefrange{b}{e} define the \co{nmi_profile()} function,
>  which is called from within an NMI handler.
>  As such, it cannot be preempted, nor can it be interrupted by a normal
> -interrupts handler, however, it is still subject to delays due to cache misses,
> +interrupt handler, however, it is still subject to delays due to cache misses,
>  ECC errors, and cycle stealing by other hardware threads within the same
>  core.
>  \Clnref{rcu_deref} gets a local pointer to the profile buffer using the
> @@ -1367,7 +1367,7 @@ and \co{poll_state_synchronize_rcu()}), this situation is a major reason
>  for the rule of thumb that RCU be used in read-mostly situations.
>  
>  \paragraph{Code:
> -		 Reader-Writer Locking vs.\@ RCU Code}
> +		 Reader-Writer Locking vs.\@ RCU}
>  
>  In the best case, the conversion from reader-writer locking to RCU
>  is quite simple, as shown in
> @@ -1475,7 +1475,7 @@ may be found
>  elsewhere~\cite{NeilBrown2015PathnameLookup,NeilBrown2015RCUwalk}.
>  
>  \paragraph{Semantics:
> -		      Reader-Writer Locking vs.\@ RCU Semantics}
> +		      Reader-Writer Locking vs.\@ RCU}
>  
>  Reader-writer locking semantics can be roughly and informally summarized
>  by the following three temporal constraints:
> 
> base-commit: f52aad5df39cdd2fdddaa5dc9244789fd638bef8
> -- 
> 2.17.1
> 
