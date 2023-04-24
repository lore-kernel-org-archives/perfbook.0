Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbjDXQDD (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 24 Apr 2023 12:03:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D77176EA1
        for <perfbook@vger.kernel.org>; Mon, 24 Apr 2023 09:02:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7303361B33
        for <perfbook@vger.kernel.org>; Mon, 24 Apr 2023 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682352177;
        bh=m/EieGUh9Ey3jIFuVpIY7Vu2t1kClewJ5Ap3D+cDjwQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=gN8oNQg2Qb5B8dFoi9uKMTrAZfuNF7tjqouTkaCMzAWEWH9DkZwRx7d+Z4UhSAogx
         pTSt6pID/LxCRdIwxMK5M4y5d1RuyOXlw8MO1n81WqOOHMtETISmlUki8qBWI/PdIq
         uk5KL2HJTVTqBUvgByWZa3eD5NRNoYTh+6o0ywXtkLs9Ef5MbR3TUX6HtuUbVshLvd
         eu83qTHE0g2X46/dTsqNBMl9XWhYKk+9rOnm269E/ScPJpyewURtl1AAlvJwN3HXLl
         BhlRLM0FA7KXo3TybP5ay6EL6u6GSkzhTq+au97vz3/8EvwIdvkG3r9CL0JvKU6weY
         WXDFM78MsOxAQ==
Date: Mon, 24 Apr 2023 09:02:57 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] CodeSamples/defer: Make hazard partition consistent with
 hazptr_thread_exit
Message-ID: <7ea775ac-579c-4b73-8d07-b717f962bd50@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230420074030.35246-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420074030.35246-1-mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 20, 2023 at 07:40:30AM +0000, Alan Huang wrote:
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  CodeSamples/defer/hazptrtorture.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/defer/hazptrtorture.h b/CodeSamples/defer/hazptrtorture.h
> index 29761e3d..acdd532b 100644
> --- a/CodeSamples/defer/hazptrtorture.h
> +++ b/CodeSamples/defer/hazptrtorture.h
> @@ -99,7 +99,7 @@ void *hazptr_read_perf_test(void *arg)
>  {
>  	int i;
>  	int me = (long)arg;
> -	int base = me * K;
> +	int base = smp_thread_id() * K;

Suppose specify a number of threads greater than the number of CPUs.
For example, on my 12-hardware-thread laptop:

./route_hazptr --stresstest --nreaders 24

In that case, don't we want "me" rather than "smp_thread_id()"?

							Thanx, Paul

>  	long long n_reads_local = 0;
>  	hazptr_head_t hh;
>  	hazptr_head_t *hhp = &hh;
> -- 
> 2.34.1
> 
