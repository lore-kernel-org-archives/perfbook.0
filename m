Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236003AbjFBUpQ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 2 Jun 2023 16:45:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA57DE48
        for <perfbook@vger.kernel.org>; Fri,  2 Jun 2023 13:45:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4FE5F61E9F
        for <perfbook@vger.kernel.org>; Fri,  2 Jun 2023 20:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685738714;
        bh=///MWLZZipRiSbLyS+HG3LCwo1IJzzes3qwWhOrHcSI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=dnXzxtgg8V+LL3eW6TNRuo2sqG/8+lqa/IcdrCtPhb7qmQBaKZg0tseK0p3/CmAFl
         8mLKDTacflEcg+DfPXPDxZNERjPIPWNt1MHPz9Cn0U7IptlTiGCnDkgqTPaJn+UuSS
         ytFhOnWZFAr2ypaRoRm/22PvDFtufriN+kY0JevDZTSpyTl4XEJAuXXD7dcoKeTiVR
         e8yDOl+Cuqt+FaAjk+hMu/g0jZwgHdLJNp9On7VW1MnWomKxc3hnA+kG3GL3EcU7IY
         rX1ou8JHWJwp9Wuhy1UVwIo5HI0UvVY1Yvtf6/1DAeLy0RvNE7B+/6MndfCD2MQ8eT
         7O9+NW+ggHgfA==
Date: Fri, 2 Jun 2023 13:45:09 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] CodeSample/count: Update the places where READ_ONCE is
 used
Message-ID: <90b826cb-8ad5-4c5b-b0f8-47e7e5006042@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230530145127.18738-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530145127.18738-1-mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 30, 2023 at 02:51:27PM +0000, Alan Huang wrote:
> There is no concurrent updates to 'total' by other threads, plain access
> is enough. But there might be threads updating 'counter', READ_ONCE is
> required.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/count/count_end_rcu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/CodeSamples/count/count_end_rcu.c b/CodeSamples/count/count_end_rcu.c
> index 8fc70611..71bd5269 100644
> --- a/CodeSamples/count/count_end_rcu.c
> +++ b/CodeSamples/count/count_end_rcu.c
> @@ -48,10 +48,10 @@ unsigned long read_count(void)			//\lnlbl{read:b}
>  
>  	rcu_read_lock();			//\lnlbl{read:rrl}
>  	cap = rcu_dereference(countarrayp);	//\lnlbl{read:deref}
> -	sum = READ_ONCE(cap->total);		//\lnlbl{read:init}
> +	sum = cap->total;		//\lnlbl{read:init}
>  	for_each_thread(t) {			//\lnlbl{read:add:b}
>  		ctrp = READ_ONCE(cap->counterp[t]);
> -		if (ctrp != NULL) sum += *ctrp;	//\lnlbl{read:add:e}
> +		if (ctrp != NULL) sum += READ_ONCE(*ctrp);	//\lnlbl{read:add:e}
>  	}
>  	rcu_read_unlock();			//\lnlbl{read:rru}
>  	return sum;				//\lnlbl{read:ret}
> -- 
> 2.34.1
> 
