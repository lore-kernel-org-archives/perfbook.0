Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:39874 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiAIBRa (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 8 Jan 2022 20:17:30 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E4FA460C0F
        for <perfbook@vger.kernel.org>; Sun,  9 Jan 2022 01:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641691049;
        bh=JofaO97BynhMWiHUp9cFRf5NA5F2d2CLkmS/jGRNCu0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=USosQoTLjubhg9+pJy9+pOiz1GZHH/KEKjA0uOhahf1ICIiBo1nKwi1e5M0JrAwZ9
         K3nli7mAWwtobC3P1BE5D8uWvsSKXUu9esTAUCZvgRPohu8uyiafdXJMiBsnGgyQFo
         9fKU2nJ4ilwiTubyGOZu+WlrGO10ncr96v4ROT3CB/CaIJXz+97hkyRMQTWESZEmhJ
         DCbI5+SAbMSkjhiz+Ya35j7pZhZy2/o5I/RJ+9X1SG430qtWU7JbG3Btfu+T8V09pz
         r/A/WcQ6ONVHheTyam2mjgbNA0w49LBcBgvd3MEXAf0hgKFNUl5bh7DZZ6eZrJlahy
         H/JwW92V0HF4Q==
Date: Sat, 8 Jan 2022 17:17:28 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/4] defer/rcuintro: Add indexing tags to RCU
 Core APIs
Message-ID: <20220109011728.GV4202@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <abc09d03-49ca-5350-0681-27e6a0e43ef3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abc09d03-49ca-5350-0681-27e6a0e43ef3@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jan 09, 2022 at 08:57:08AM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

They all look good.  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  defer/rcuintro.tex | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
> index 2b72e49b..39f33650 100644
> --- a/defer/rcuintro.tex
> +++ b/defer/rcuintro.tex
> @@ -195,13 +195,13 @@ its fundamentals.
>  The full API is covered in \cref{sec:defer:RCU Linux-Kernel API}.
>  
>  Three members of the core APIs are used by readers.
> -The \co{rcu_read_lock()} and \co{rcu_read_unlock()} functions delimit
> +The \apik{rcu_read_lock()} and \apik{rcu_read_unlock()} functions delimit
>  RCU read-side critical sections.
>  These may be nested, so that one \co{rcu_read_lock()}-\co{rcu_read_unlock()}
>  pair can be enclosed within another.
>  In this case, the nested set of RCU read-side critical section act as
>  one large critical section covering the full extent of the nested set.
> -The third read-side API member, \co{rcu_dereference()}, fetches an
> +The third read-side API member, \apik{rcu_dereference()}, fetches an
>  RCU-protected pointer.
>  Conceptually, \co{rcu_dereference()} simply loads from memory, but we
>  will see in
> @@ -211,12 +211,12 @@ one case) the CPU from reordering its load with later memory operations
>  that dereference this pointer.
>  
>  The other three members of the core APIs are used by updaters.
> -The \co{synchronize_rcu()} function implements the ``wait for readers''
> +The \apik{synchronize_rcu()} function implements the ``wait for readers''
>  operation from \cref{fig:defer:Deletion With Concurrent Readers}.
> -The \co{call_rcu()} function is the asynchronous counterpart of
> +The \apik{call_rcu()} function is the asynchronous counterpart of
>  \co{synchronize_rcu()} by invoking the specified function after
>  all pre-existing RCU readers have completed.
> -Finally, the \co{rcu_assign_pointer()} macro is used to update an
> +Finally, the \apik{rcu_assign_pointer()} macro is used to update an
>  RCU-protected pointer.
>  Conceptually, this is simply an assignment statement, but we will
>  see in
> 
> base-commit: 2b732c65e2a322eef7d27f65826330c9b93db2e0
> -- 
> 2.17.1
> 
