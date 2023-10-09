Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbjJIDHv (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 8 Oct 2023 23:07:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B604A6
        for <perfbook@vger.kernel.org>; Sun,  8 Oct 2023 20:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696820869;
        bh=pLoy0wyk9UyXZV7mMKMCwjqhihtNuRM0uKYQNLvyK7I=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=spBbieA8NRiLG/zPZRVqbGL+Lx6XJp/OiDS+AjiiuP4PtCDhqRbsgqh8Xg/no0q9J
         U+1Yj1SjI3EZH+mjDvaMji7uzMRTl66uT99RtD4KrXBj/iNo6UA/PcvlPKv5bjR6Hx
         2s8tuKMC1N8qo2DXpDhfO20r8Na/kkMsngB8AEF70UK7o5lrWnr3mEwDVde/d/IqgO
         7hrLQeu7Bk31LmxGbl3PL9vm01SVMrymSWQRQXRb/cK+N9501swLXPMQM+RFpjk38v
         0INlrVmgIohvRipL8p55fodyN24xPoNNsQWlqbKvfpT02bNj75L296CMBEUVLmcAkV
         ASVQ+dKC7gIBw==
Date: Sun, 8 Oct 2023 20:07:49 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH perfbook] bib/TM: trade marks should be upcase
Message-ID: <682f3ab1-46be-400a-a7a8-2e5e10617c10@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1696662210-32611-1-git-send-email-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1696662210-32611-1-git-send-email-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: zhouzhouyi@gmail.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Sat, Oct 07, 2023 at 03:03:30PM +0800, zhouzhouyi@gmail.com wrote:
> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> 
> I think trade marks should be upcase.
> 
> Thanks Zhouyi
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>

Good eyes!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  bib/TM.bib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/bib/TM.bib b/bib/TM.bib
> index 2bd83676..41826a1e 100644
> --- a/bib/TM.bib
> +++ b/bib/TM.bib
> @@ -1067,7 +1067,7 @@ for Programming Languages and Operating Systems (ASPLOS '09)",
>  
>  @article{Le:2015:TMS:3266491.3266500,
>   author = {Le, H. Q. and Guthrie, G. L. and Williams, D. E. and Michael, M. M. and Frey, B. G. and Starke, W. J. and May, C. and Odaira, R. and Nakaike, T.},
> - title = {Transactional Memory Support in the IBM POWER8 Processor},
> + title = {Transactional Memory Support in the {IBM} {POWER8} Processor},
>   journal = {IBM J. Res. Dev.},
>   issue_date = {January/February 2015},
>   volume = {59},
> -- 
> 2.34.1
> 
