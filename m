Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjE3Aah (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 29 May 2023 20:30:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA90AD
        for <perfbook@vger.kernel.org>; Mon, 29 May 2023 17:30:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1690662709
        for <perfbook@vger.kernel.org>; Tue, 30 May 2023 00:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685406635;
        bh=iqRuW5Ps6I/g1x+FLNN+0ERjoKMiE0Ow+dYcAxbMo6I=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=r0u0GRSrRfRTnxJ2+ilKdTP4W6ksKh6Qfqyflpq+CucZYnuXXawNcIlJSXHYEnDj7
         K7xsypltmI/BLTSjfEqSvSNnw1y1kPWnr2/8q0E/jwS8x1fa1TBCuLnD609Em1umXi
         NGGjeXROeFtdgNyiYupUoULtM74DFuO+Wvsbqm0WB/Xd8ep4rlamSNMHqa7cC6nsW/
         bLqlKkuDovB1GcbpN8nbGq7rK+hlaUePdgpT14r3pL8dUSzPzit9Arj5GAZouxs1zY
         WO81ENouJNrb5yZMBY04XLJW+5DJMW3zM4j7/SdArQPiIOQrIrmSFB6M84XKh7u+ON
         ixOaHwNuHLexA==
Date: Mon, 29 May 2023 17:30:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/2] CodeSample/count: Use plain access instead of
 WRITE_ONCE
Message-ID: <7b569491-2591-4e0c-b334-a5ff1dbb2d7f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230528143729.15201-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230528143729.15201-1-mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, May 28, 2023 at 02:37:28PM +0000, Alan Huang wrote:
> The cap here has not been published, plain access is enough.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>

Good catch, thank you!

Does line 27 of that same listing need a READ_ONCE(*ctrp)?

							Thanx, Paul

> ---
>  CodeSamples/count/count_end_rcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/count/count_end_rcu.c b/CodeSamples/count/count_end_rcu.c
> index 1171f0b6..8fc70611 100644
> --- a/CodeSamples/count/count_end_rcu.c
> +++ b/CodeSamples/count/count_end_rcu.c
> @@ -89,7 +89,7 @@ void count_unregister_thread(int nthreadsexpected)	//\lnlbl{unreg:b}
>  	}						//\lnlbl{unreg:alloc:e}
>  	spin_lock(&final_mutex);			//\lnlbl{unreg:acq}
>  	*cap = *countarrayp;				//\lnlbl{unreg:copy}
> -	WRITE_ONCE(cap->total, cap->total + counter);	//\lnlbl{unreg:add}
> +	cap->total += counter;	//\lnlbl{unreg:add}
>  	cap->counterp[idx] = NULL;			//\lnlbl{unreg:null}
>  	capold = countarrayp;				//\lnlbl{unreg:retain}
>  	rcu_assign_pointer(countarrayp, cap);		//\lnlbl{unreg:assign}
> -- 
> 2.34.1
> 
