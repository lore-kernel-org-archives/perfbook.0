Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiKRViS (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 18 Nov 2022 16:38:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69872A465F
        for <perfbook@vger.kernel.org>; Fri, 18 Nov 2022 13:38:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6BE26276C
        for <perfbook@vger.kernel.org>; Fri, 18 Nov 2022 21:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668807495;
        bh=r2SzYN/R1KdnR7syciwPA32OVY20WflwvQPVq+udgac=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=UIrO4pEQ+dCalozktEcfjZ1F2xhNMZQcwDuiFS/Z9XzGxqLnvdSWUlUF7Ibug7QX4
         PiOObcYgT8WmXeItoQZAFsFU3AlUIKYrZDD8p4vNxEyxkuKBvP6eYnyHsVxIIz3/1n
         Zes2+PpLfCgOL41b18p9TQHfzyGbKAMNLs0UTb2kcbe9Ylw20MRCse/SJxMwa3tdqq
         v1fbVv1etEeonbW1PHWvtuyzLA/0ngyevKcGGkJH5Z65fpkMCdwaTBG3Q9aQU4xySO
         KLW1a2qI5jzknQdXcXxB+VEoPxcWR//ZzEJn9xsfg6sSYIrE4UNDEjUYAC7wX4RFdt
         FPKz3ahkybmLg==
Date: Fri, 18 Nov 2022 13:38:14 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] RCU fundamentals: too many ares
Message-ID: <20221118213814.GM4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20221118082344.216904-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118082344.216904-1-e2lahav@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Nov 18, 2022 at 03:23:45AM -0500, Elad Lahav wrote:
> Signed-off-by: Elad Lahav <e2lahav@gmail.com>

Good catch!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  defer/rcufundamental.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> index 82d04bba..39b2f7ff 100644
> --- a/defer/rcufundamental.tex
> +++ b/defer/rcufundamental.tex
> @@ -546,7 +546,7 @@ that single-item lookups are much more common in practice than are
>  full-data-structure traversals.
>  After all, full-data-structure traversals are much more expensive than
>  single-item lookups, so developers are motivated to avoid such traversals.
> -Not only are concurrent updates are less likely to affect a single-item
> +Not only are concurrent updates less likely to affect a single-item
>  lookup than they are a full traversal, but it is also the case that an
>  isolated single-item lookup has no way of detecting such inconsistencies.
>  As a result, in the common case, such inconsistencies are not just
> -- 
> 2.34.1
> 
