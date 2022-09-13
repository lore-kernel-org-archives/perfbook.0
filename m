Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbiIMHvj (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 13 Sep 2022 03:51:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8586A53D2B
        for <perfbook@vger.kernel.org>; Tue, 13 Sep 2022 00:51:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20A33612F4
        for <perfbook@vger.kernel.org>; Tue, 13 Sep 2022 07:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663055497;
        bh=oaL9LWM8ctQoES8eDEeTnf81CkVoGWtgSdm1+tvRrm8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=bCp4juXY/H548Wcd54bqP9Jh2lkPQL4YIO+Z5agvkO6xhwCZp6GpgjXOoy8bLDTRR
         F8DXZkQQoWc6UrlhIFNkyH2anCk91l77Jfr/C4zSs1ZDz/L1hoZ0UGC1faW8LXXPs4
         +8lF60tApHoiKaKrcSdzcnbYD6t6hNzWSTtdM4wUX6fHPJOwhy+hqtNSjXQHTR7HD/
         aAeDcy1a6uDorgGtnQBvib14HIWeL39PiUAAD43ULhqSUdKg7nYZxDTM7hzYGAHeXX
         np1qK31gzw+wAYgs0mUR+yB71b8kVKoOYiJIkAA2xH2F7BWLWxfMR+oZ08lwFyhn/a
         buZLo8oSwnrlg==
Date: Tue, 13 Sep 2022 00:51:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] SMPdesign: Fix command characters in code snippets
Message-ID: <20220913075132.GC246308@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <f7d486c3-34f4-0908-7221-41ab634378d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7d486c3-34f4-0908-7221-41ab634378d3@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org

On Tue, Sep 13, 2022 at 09:18:13AM +0900, Akira Yokosawa wrote:
> Some of listings in Chapter 6 use the command character option of
> "commandchars=\\\[\]".
> This collides with "[" and "]" in the code snippets and removes
> them in the resulting listings.
> 
> Fix the issue by using "commandchars=\\\@\$" instead and adjusting
> the \lnlbl commands.
> 
> Reported-by: Elad Lahav <e2lahav@gmail.com>
> Fixes: 2c8eae0b8c65 ("SMPdesign: Employ new scheme for inline snippets")
> Fixes: 05d62c297542 ("SMPdesign: Apply \clnref{} scheme to Listing 6.5")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

This fixes it for me, so queued and pushed, and thank you both!

Elad, does this fix it for you as well?

							Thanx, Paul

> ---
>  SMPdesign/SMPdesign.tex | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> index 05b86ec7271b..70936c12ce7e 100644
> --- a/SMPdesign/SMPdesign.tex
> +++ b/SMPdesign/SMPdesign.tex
> @@ -134,7 +134,7 @@ careful choice of data structure, can be arbitrarily large.
>  On the other hand, if you are not in this happy situation, read on!
>  
>  \begin{listing}
> -\begin{VerbatimL}[commandchars=\\\[\]]
> +\begin{VerbatimL}[commandchars=\\\@\$]
>  struct hash_table
>  {
>  	long nbuckets;
> @@ -209,7 +209,7 @@ lock before returning.
>  
>  \begin{listing}
>  \begin{fcvlabel}[ln:SMPdesign:Code-Locking Hash Table Search]
> -\begin{VerbatimL}[commandchars=\\\[\]]
> +\begin{VerbatimL}[commandchars=\\\@\$]
>  spinlock_t hash_lock;
>  
>  struct hash_table
> @@ -228,17 +228,17 @@ int hash_search(struct hash_table *h, long key)
>  	struct node *cur;
>  	int retval;
>  
> -	spin_lock(&hash_lock);				\lnlbl[acq]
> +	spin_lock(&hash_lock);				\lnlbl@acq$
>  	cur = h->buckets[key % h->nbuckets];
>  	while (cur != NULL) {
>  		if (cur->key >= key) {
>  			retval = (cur->key == key);
> -			spin_unlock(&hash_lock);	\lnlbl[rel1]
> +			spin_unlock(&hash_lock);	\lnlbl@rel1$
>  			return retval;
>  		}
>  		cur = cur->next;
>  	}
> -	spin_unlock(&hash_lock);			\lnlbl[rel2]
> +	spin_unlock(&hash_lock);			\lnlbl@rel2$
>  	return 0;
>  }
>  \end{VerbatimL}
> @@ -912,7 +912,7 @@ the POSIX implementation described in
>  shows how the hash search might be implemented using reader-writer locking.
>  
>  \begin{listing}
> -\begin{VerbatimL}[commandchars=\\\[\]]
> +\begin{VerbatimL}[commandchars=\\\@\$]
>  rwlock_t hash_lock;
>  
>  struct hash_table
> @@ -972,7 +972,7 @@ and likely perform better.
>  
>  \begin{listing}
>  \begin{fcvlabel}[ln:SMPdesign:Hierarchical-Locking Hash Table Search]
> -\begin{VerbatimL}[commandchars=\\\[\]]
> +\begin{VerbatimL}[commandchars=\\\@\$]
>  struct hash_table
>  {
>  	long nbuckets;
> @@ -1003,7 +1003,7 @@ int hash_search(struct hash_table *h, long key)
>  		if (cur->key >= key) {
>  			spin_lock(&cur->node_lock);
>  			spin_unlock(&bp->bucket_lock);
> -			retval = (cur->key == key);\lnlbl[retval]
> +			retval = (cur->key == key);\lnlbl@retval$
>  			spin_unlock(&cur->node_lock);
>  			return retval;
>  		}
> 
> base-commit: 34400fe10ca37b884ee64f7bd2b93d5cccfe675d
> -- 
> 2.25.1
> 
