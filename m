Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbiIAPP3 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 1 Sep 2022 11:15:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047482EF2E
        for <perfbook@vger.kernel.org>; Thu,  1 Sep 2022 08:15:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A636EB8279B
        for <perfbook@vger.kernel.org>; Thu,  1 Sep 2022 15:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662045325;
        bh=FGvazsLTpa6w0yJa+e+iqP6sRs8Q/XUzuHAw90HogGc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=NW+OrFCfSHZDwW05lFsOHoO+ljVJIwSf0ODquK0i8+XUslvcZA8tJNQjVtAn1dM9w
         AE0in/FZuTvepDnoLPFJCqHmW/NsxKD1eU61MW8H4Zm/F496+Mb6YtXDG4H07ifmS0
         wRsEbZvkW6I0Is4BhMaKzNM0uNbVOXhbFFFcM4ob1hZ7Qd8bim79czWZt7vxwvEAlK
         WIYb0p4muiw1EJIDTTDMeYWRPiYj2kyLSYPXNGI3lwLb3Ktg20OnEEU0tDCHu/Kk/J
         3aE8B8pLCMXC/Obzf0PAvAQ8Xmtzi8n0zdTrGSsu8b+ysJafSu71Ov6hw1wQcXNLHq
         PYFAqB88Yqwvg==
Date: Thu, 1 Sep 2022 08:15:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/2] treewide: Fix trivial typos
Message-ID: <20220901151524.GW6159@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1d99f4ec-b5a5-52ad-df97-cddaee9f98a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d99f4ec-b5a5-52ad-df97-cddaee9f98a5@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Sep 01, 2022 at 10:44:04PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> This is a collection of trivial fixes of typos found by half-manual
> spell checking in diffs from v2021.12.22a.
> 
> I think these are only the tip of iceberg. ;-)

I am sure that you are quite correct.  ;-)

> There can be wrong fix(ex) though.
> Please examine each of them before committing.

They all look good to me, thank you!  Applied.

							Thanx, Paul

>         Thanks, Akira
> --
>  advsync/advsync.tex                  | 4 ++--
>  appendix/whymb/whymemorybarriers.tex | 2 +-
>  defer/rcuapi.tex                     | 2 +-
>  defer/rcuusage.tex                   | 2 +-
>  glossary.tex                         | 6 +++---
>  indexsee.tex                         | 4 ++--
>  locking/locking.tex                  | 2 +-
>  together/applyrcu.tex                | 2 +-
>  8 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/advsync/advsync.tex b/advsync/advsync.tex
> index 340c109562e4..3ff205e237b9 100644
> --- a/advsync/advsync.tex
> +++ b/advsync/advsync.tex
> @@ -456,7 +456,7 @@ largely orthogonal to those that form the basis of real-time programming:
>  	an NBS algorithm might substitute a non-blocking polling
>  	operation.
>  	This is fine in theory, but not helpful in practice to real-world
> -	programs that requie an element to propagate through the queue
> +	programs that require an element to propagate through the queue
>  	in a timely fashion.
>  \item	Real-time forward-progress guarantees usually apply only
>  	in the absence of software bugs.
> @@ -585,7 +585,7 @@ can be at least partially redeemed using a number of approaches:
>  \item	Run on a non-blocking operating-system kernel~\cite{Cheriton96a}.
>  	Such kernels are quite rare, in part because they have
>  	traditionally completely failed to provide the hoped-for
> -	performance and scalabilty advantages over lock-based kernels.
> +	performance and scalability advantages over lock-based kernels.
>  	But perhaps you should write one.
>  \item	Use facilities such as \co{mlockall()} to avoid page faults,
>  	while also ensuring that your program preallocates all the
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index f2cca5d6c112..99c68eac38df 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -1762,7 +1762,7 @@ future such problems:
>  	all of the CPUs once the DMA completes, but it is much easier
>  	and more efficient if the device DMA participates in the
>  	cache-coherence protocol, making all of this flushing and
> -	invalidating unnecessory.
> +	invalidating unnecessary.
>  
>  \item	External busses that fail to transmit cache-coherence data.
>  
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index 6f6c04681def..8ee54866bbe6 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -1106,7 +1106,7 @@ but pointers holding values returned from \co{rcu_dereference()}
>  should not be.
>  Providing these markings on variables, structure fields, function
>  parameters, and return values allows the Linux kernel's \co{sparse}
> -tool to detect situtations where RCU-protected pointers are
> +tool to detect situations where RCU-protected pointers are
>  incorrectly accessed using plain C-language loads and stores.
>  
>  Debug-object support is automatic for any \apik{rcu_head} structures
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index 7dfa57c44844..9da0e04c97ef 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -1730,7 +1730,7 @@ locking and by static data-structure layout, respectively.
>  }\QuickQuizAnswer{
>  	Not at all.
>  
> -	Hazard pointers can be considerd to combine temporal and spatial
> +	Hazard pointers can be considered to combine temporal and spatial
>  	synchronization in a similar manner.
>  	Referring to
>  	\cref{lst:defer:Hazard-Pointer Recording and Clearing},
> diff --git a/glossary.tex b/glossary.tex
> index 87db763b7be4..accd5e9c9de8 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -239,9 +239,9 @@
>  	linear speedups as threads are added (assuming sufficient
>  	CPUs are available).
>  \item[\IXGalth{Energy Efficiency}{energy}{efficiency}:]
> -	Shorthand for ``energy-efficienct use'' in which the goal is to
> +	Shorthand for ``energy-efficient use'' in which the goal is to
>  	carry out a given computation with reduced energy consumption.
> -	Sublinear scalabilty can be an obstacle to energy-efficient use
> +	Sublinear scalability can be an obstacle to energy-efficient use
>  	of a multicore system.
>  \item[Epoch-Based Reclamation (EBR):]\glsuseriii{ebr}
>  	An \acr{rcu} implementation style put forward by
> @@ -270,7 +270,7 @@
>  	scalability.
>  \item[\IXG{Forward-Progress Guarantee}:]
>  	Algorithms or programs that guarantee that execution will
> -	progress at some rate under specfied conditions.
> +	progress at some rate under specified conditions.
>  	Academic forward-progress guarantees are grouped into a
>  	formal hierarchy shown in
>  	\cref{sec:advsync:Non-Blocking Synchronization}.
> diff --git a/indexsee.tex b/indexsee.tex
> index c7fea66b2871..bd82fa1debfd 100644
> --- a/indexsee.tex
> +++ b/indexsee.tex
> @@ -13,7 +13,7 @@
>  \index{Exclusive lock|see{Lock, exclusive}}
>  \index{Full memory barrier|see{Memory barrier, full}}
>  \index{Fully associative cache|see{Cache, fully associative}}
> -\index{Grace-priod latency|see{Latency, grace-period}}
> +\index{Grace-period latency|see{Latency, grace-period}}
>  \index{Memory consistency|see{Consistency, memory}}
>  \index{Memory latency|see{Latency, memory}}
>  \index{Memory-barrier latency|see{Latency, memory-barrier}}
> @@ -26,7 +26,7 @@
>  \index{Reader-writer lock|see{Lock, reader-writer}}
>  \index{Scheduling latency|see{Latency, scheduling}}
>  \index{Sequence lock|see{Lock, sequence}}
> -\index{Sequencial consistency|see{Consistency, sequencial}}
> +\index{Sequential consistency|see{Consistency, sequential}}
>  \index{Weak consistency|see{Consistency, weak}}
>  \index{Write memory barrier|see{Memory barrier, write}}
>  \index{Write miss|see{Cache miss, write}}
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 4bc03f26a960..ccfbb9b394e9 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -1137,7 +1137,7 @@ Of course, locks partition time instead of sawing wood,\footnote{
>  but just like sawing wood, using locks to partition time wastes some of
>  that time due to lock overhead and (worse yet) lock contention.
>  One important difference is that if someone saws a board into too-small
> -pieces, the resuting conversion of most of that board into sawdust will
> +pieces, the resulting conversion of most of that board into sawdust will
>  be immediately obvious.
>  In contrast, it is not always obvious that a given lock acquisition
>  is wasting excessive amounts of time.
> diff --git a/together/applyrcu.tex b/together/applyrcu.tex
> index 2a5a3c1248f6..1c9b1b7a23cd 100644
> --- a/together/applyrcu.tex
> +++ b/together/applyrcu.tex
> @@ -815,7 +815,7 @@ way of stopping in the middle and resuming later.
>  For example, in Linux kernel v5.16, the \co{khugepaged_scan_file()}
>  function checks to see if some other task needs the current CPU
>  using \co{need_resched()}, and if so invokes \co{xas_pause()} to
> -adjust the travesal's iterator appropriately, and then invokes
> +adjust the traversal's iterator appropriately, and then invokes
>  \co{cond_resched_rcu()} to yield the CPU\@.
>  In turn, the \co{cond_resched_rcu()} function invokes \co{rcu_read_unlock()},
>  \co{cond_resched()}, and finally \co{rcu_read_lock()} to drop out of
> 
> base-commit: 729ed701fa72c1445fc8575b5e27fccb55378dbc
> -- 
> 2.25.1
> 
