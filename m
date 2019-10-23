Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391757AbfJWVGC (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 23 Oct 2019 17:06:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571864761;
        bh=HQxNbB+//cA1qp477xVjzIJIf/q/AoG1KHZbrnqVpLo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KSMdG+RgNTKyeoxz+zO7tRea9f0NhUIKQPHr+pSMQxuuSFrl9vDg6gVNA61OqAI0J
         +01lR2oVWVi6XRz3+EXRpqH6EBFlelUYL+edwcbnHc7mKAlubbTIRsezPpjhADC6VJ
         KsjjfbKJzVasE13TL8G3jVMkPddSa47RFquqcGL0=
Date: Wed, 23 Oct 2019 14:05:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] defer/rcuintro: Substitute smp_store_release() for
 WRITE_ONCE()
Message-ID: <20191023210559.GG17040@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <f1c9dec1-89c6-841e-ddbd-6d4b500413cf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1c9dec1-89c6-841e-ddbd-6d4b500413cf@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Oct 24, 2019 at 12:29:04AM +0900, Akira Yokosawa wrote:
> >From 6845d0f978a81ef17d0011bebb500087f39f9a45 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 24 Oct 2019 00:19:13 +0900
> Subject: [PATCH] defer/rcuintro: Substitute smp_store_release() for WRITE_ONCE()
> 
> This change corresponds to the update of Figure 9.7 by commit
> 6bc87460e2ad ("defer/rcuintro: Fix colors, fonts, and primitives
> in Figures 9.6 and 9.7").
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

								Thanx, Paul

> ---
>  defer/rcuintro.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
> index dc750326..6702153a 100644
> --- a/defer/rcuintro.tex
> +++ b/defer/rcuintro.tex
> @@ -295,7 +295,7 @@ Again, this same constraint is imposed on reader threads dereferencing
>  they are done using the pointed-to data item.
>  Returning to the second row of
>  Figure~\ref{fig:defer:Deletion With Concurrent Readers},
> -where the updater has just completed executing the \co{WRITE_ONCE()},
> +where the updater has just completed executing the \co{smp_store_release()},
>  imagine that CPU~0 executes a context switch.
>  Because readers are not permitted to block while traversing the linked
>  list, we are guaranteed that all prior readers that might have been running on
> -- 
> 2.17.1
> 
