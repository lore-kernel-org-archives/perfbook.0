Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbiHaSoL (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 31 Aug 2022 14:44:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 065AB285
        for <perfbook@vger.kernel.org>; Wed, 31 Aug 2022 11:44:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A018560A71
        for <perfbook@vger.kernel.org>; Wed, 31 Aug 2022 18:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661971448;
        bh=biDhy6sHIbP56b0w6CDBhmwO+qzPKO973kFylGo8qLc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=fP2H1cY5YDi+dsAF1IvYuPBXFLP3uNc6b+4xroH2LN1kqaXLdThKd5GMNKxp+ILBH
         +PWlmZlmFpBhjK2nGtGThhhIuw5eFTe6NWiVuyrUFUKKiMZXzqFP8VY0yIPX/o1MdW
         QZZbppPEZOiuELueEVloccn6xgn4bWk/qruHvYW0+TnGr03a1Y1Vymr7IR39Hg3byL
         CgMQb87OVTuGh6UnBqQQDEJ2KN486yTFO/9xyMZw0pVk6z2Q16BVlBAT2euCd33/zq
         u/JxF7G9W+oMFsjHX+dl+4a/sOXidMrX4QC2GXdUYi4/P7UIjTDFwuSluZHo+LT2H8
         vi/Is0DCqObXA==
Date: Wed, 31 Aug 2022 11:44:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Comments in the form of patch
Message-ID: <20220831184407.GN6159@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220829135533.GA1839874@paulmck-ThinkPad-P17-Gen-1>
 <3e1afa78-865b-6fb4-ca69-36529f1a8e69@gmail.com>
 <da2fde84-6253-73b4-4eeb-0186e52f74fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da2fde84-6253-73b4-4eeb-0186e52f74fc@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Aug 31, 2022 at 11:41:35PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is a collection of comments in the form of a patch.
> I think you can figure out what I want to say, but if unclear,
> please ask.
> 
>         Thanks, Akira
> ---
>  defer/rcuusage.tex  |  2 ++
>  locking/locking.tex | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index eba1033bbbc3..0cefe84d0e63 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -1732,11 +1732,13 @@ locking and by static data-structure layout, respectively.
>  
>  	Hazard pointers can be considerd to combine temporal and spatial
>  	synchronization in a similar manner.
> +% reference to \cref{lst:defer:Hazard-Pointer Recording and Clearing}?
>  	The \co{hp_record()} function's acquisition of a reference
>  	provides both spatial and temporal synchronization, subscribing
>  	to a version and marking the start of a reference, respectively.
>  	This function therefore combines the effects of RCU's
>  	\co{rcu_read_lock()} and \co{rcu_dereference()}.
> +% reference to \cref{lst:defer:Hazard-Pointer Scanning and Freeing}?
>  	The \co{hp_clear()} function's release of a reference provides
>  	temporal synchronization marking the end of a reference, and is
>  	thus similar to RCU's \co{rcu_read_unlock()}.

Good point!  I took a stab at this here:

ec15ee942d5c ("defer/rcuusage: Add references to QQ9.65")

> diff --git a/locking/locking.tex b/locking/locking.tex
> index f0b4513995a7..df6458063a89 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -1136,6 +1136,13 @@ Of course, locks partition time instead of sawing wood,\footnote{
>  	are described in \cref{chp:Deferred Processing}.}
>  but just like sawing wood, using locks to partitioning wastes some of
>  that time due to lock overhead and (worse yet) lock contention.
> +%%% ^^^ I could not parse this sentence for the first time.
> +% ..., [using locks] to [partitioning wastes] [some of that time] ???
> +%
> +% [partitioning wastes] looked like a noun phrase.
> +%
> +% ..., partitioning time with locks wastes some of that time ... ???
> +%%%

This was me changing my mind on how to write the sentence mid-way
through and failing to clean up afterwards.  The "to partitioning wastes"
should instead be "to partition time wastes".

69cd68c5aa33 ("locking: Fix time-partitioning typo")

>  One important difference is that if someone saws a board into too-small
>  pieces, the resuting conversion of most of that board into sawdust will
>  be immediately obvious.
> @@ -1178,6 +1185,11 @@ be accessed by the lock holder without interference from other threads.
>  The Rust programming language takes lock/data association a step further
>  by allowing the developer to make a compiler-visible association between
>  a lock and the data that it protects.
> +% A \cite{} or two for the Rust lang?
> +%   - https://www.rust-lang.org/
> +%   - https://doc.rust-lang.org/book/ch16-00-concurrency.html
> +%
> +% Brief introduction of the Rust lang somewhere in Chapter 2?

Good point!  But how about this one?

https://cacm.acm.org/magazines/2021/4/251364-safe-systems-programming-in-rust/fulltext

It talks about safety, but also links it to verification.

729ed701fa72 ("locking: Add Rust citation for lock/data association")

Thoughts?

							Thanx, Paul

>  When such an association has been made, attempts to access the data
>  without the benefit of the corresponding lock will result in a
>  compile-time diagnostic.
> -- 
> 2.25.1
> 
> 
