Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236321AbhK2XAK (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 29 Nov 2021 18:00:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67A6C0980CC
        for <perfbook@vger.kernel.org>; Mon, 29 Nov 2021 11:01:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8CCF3B815C5
        for <perfbook@vger.kernel.org>; Mon, 29 Nov 2021 19:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638212465;
        bh=7liP9IDH50lKQxSdqDfp7VXeV4YJ4QomeGQh3Kd8rB0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=DRaJ/LyG+dJ1V8L1fjCBkKcDoigPfHa1w7Uu+j+2uYBjQ07AtjJs9+aHlbKk4lNuU
         CN3BuwAhS7vT+jGPKVFfqqWYsdElwwnGZgQK2S0zWgVmDlk+Hqq16SjQRzKlN7dsdn
         Ks2WW4GmPm+0p/EGxtUmXZ//6cnbaSVaxCYGdt/CxbNhdqjyOSf8epkKHmCdqHOCM+
         DYDoRnmdhnZ8Jc0L/280Ri66li+iE3DDOG2fDDQvbpakV1/ohKglZ5DduHGBtjpotH
         lkw6PF92IdKNF6/ZoK45M4qSZeMIBE67yZRuPWtiAXPHZ+Ky6PBy6Zn0chnEG2t46z
         tH8iirrpAPbFg==
Date: Mon, 29 Nov 2021 11:01:04 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] toyrcu: add missing close paren in QQ B.13
Message-ID: <20211129190104.GL641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211127040702.15879-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127040702.15879-1-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, luyang.co@gmail.com

On Sat, Nov 27, 2021 at 12:07:02PM +0800, Zhouyi Zhou wrote:
> Add missing close paren in QQ B.13.
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Hi Paul,
> 
> I think there is a close paren missing in QQ B.13, so I add it.
> (I invoked make this time ;-)).

Very good!  ;-)

Queued and pushed, good eyes, and thank you!

							Thanx, Paul

> Thanks
> Zhouyi
> --
>  appendix/toyrcu/toyrcu.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index 0824fdd3..9c474a37 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex
> @@ -755,7 +755,7 @@ adding them on their first call to \co{rcu_read_lock()}.
>  \QuickQuiz{
>  	Great, if we have $N$ threads, we can have $2N$ ten-millisecond
>  	waits (one set per \co{flip_counter_and_wait()} invocation,
> -	and even that assumes that we wait only once for each thread.
> +	and even that assumes that we wait only once for each thread).
>  	Don't we need the grace period to complete \emph{much} more quickly?
>  }\QuickQuizAnswer{
>  	Keep in mind that we only wait for a given thread if that thread
> -- 
> 2.25.1
> 
